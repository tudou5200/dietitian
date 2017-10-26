<?php

namespace App\Http\Ask;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\UserInfo;
use App\Models\Dietinfo;
use App\Models\Goods;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Models\Order;
use App\Models\AskList;
use App\Models\Askorder;
use App\Models\UserEarningsAt;
use App\Models\UserEarningsBay;
use App\Models\UserEarningsThe;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
class WxpayController extends BaseController
{

    #统一订单
    public function payAction(Request $request)
    {   

        if($this->verCode($request->all(),[
            'order_sn'     =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $order_sn = $request->input('order_sn');

        $order=Askorder::where('order_sn',$order_sn)->first();


        switch(true)
        {
            case !$order:
                $r=array('code'=>5,'msg'=>'订单不存在');
                break;
            case $order->status!=1:
                $r=array('code'=>5,'msg'=>'订单状态不正确');
                break;
            default:

                $u = Users::where('token',$order->token)->first();
                if(!$u)
                {
                    $r=array('code'=>5,'msg'=>'用户不存在');
                }
                else
                {
                    require_once app_path('Library/Wxpay/lib/WxPay.Api.php');
                    require_once app_path("Library/Wxpay/example/WxPay.JsApiPay.php");
                    require_once app_path("Library/Wxpay/example/log.php");
                    $tools = new \JsApiPay();
                    $input = new \WxPayUnifiedOrder();
                    $input->SetBody("爱样营养师");
                    $input->SetAttach("");
                    $input->SetOut_trade_no($order_sn);
                    $input->SetTotal_fee($order->price);
                    $input->SetTime_start(date("YmdHis"));
                    $input->SetTime_expire(date("YmdHis", time() + 600));
                    $input->SetGoods_tag("微信支付");
                    $input->SetNotify_url("http://api.shoumeikeji.cn/ask/WxbackAction");
                    $input->SetTrade_type("JSAPI");
                    $input->SetOpenid($u->openid);

                    $o = \WxPayApi::unifiedOrder($input);

                    if($o['return_code']=='FAIL')
                    {
                         $r=array('code'=>5,'msg'=>'网络错误1');
                    }
                    else{
                        $order->third = $o['prepay_id'];
                        $order->save();
                    
                        $r['js'] = $tools->GetJsApiParameters($o);
                    }
                    
                }
                 
                break;
        }
        return $this->result($r);
    }

    #支付回调
    public function backAction(Request $request)
    {   

        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false,$request->getContent());
    }


    #支付确认
    public function callbackAction(Request $request)
    {   

        if($this->verCode($request->all(),[
            'order_sn'     =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $order_sn = $request->input('order_sn');
        $order=Askorder::where('order_sn',$order_sn)->first();
        $AskListModle = AskList::where('asktoken',$order['asktoken'])->first();
		
		// if($AskListModle){//判断金钱是否能被平分，如不能报错
		// 	$flag = $AskListModle['price']%2;
		// 	if($flag=='0'){
		// 		//此项暂时不加代码
		// 	}else{
		// 		return $this->result(array('code'=>123,'msg'=>'此项暂时无法购买，请购买其他'));
		// 	}
		// }

        if(!$order)
        {
             return $this->result(array('code'=>5,'msg'=>'网络错误2'));
        }

        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        if($notify->Queryorder($order->order_sn))
        {   

              
            
            #给回答者分50%
            $DietinfoModel = Dietinfo::where('dietitian',$AskListModle['dietitian'])->first();
            $OrderModel = UserInfo::where('token',$order['token'])->first();
            if($DietinfoModel){
                $meici = $this->meici($DietinfoModel['token'],$DietinfoModel['name'],$AskListModle['price'],$OrderModel['token'],$OrderModel['user_name']);
                if($meici){
                   $meitian = $this->meitian($DietinfoModel['token'],$AskListModle['price']);
                   if($meitian){
                      $zongjiaoyid =  $this->zongjiaoyi($DietinfoModel['token'],$AskListModle['price']);
                   }
                }
            }

            #给提问者分50%
            $UsersModel = UserInfo::where('token',$AskListModle['token'])->first();
            if($UsersModel){ 
                $meici = $this->meici($UsersModel['token'],$UsersModel['user_name'],$AskListModle['price'],$OrderModel['token'],$OrderModel['user_name']);
                if($meici){
                   $meitian = $this->meitian($UsersModel['token'],$AskListModle['price']);
                   if($meitian){
                     $zongjiaoyiw =  $this->zongjiaoyi($UsersModel['token'],$AskListModle['price']);
                   }
                }
            }
            $AskListModle->num =  $AskListModle['num']+1;
            $AskListModle->save();
            $order->paytime = time();
            $order->status  = 2;
            $r=$order->save()?[]:array('code'=>5,'msg'=>'网络错误3');
        }
        else
        {
           $r=array('code'=>5,'msg'=>'网络错误1,请刷新后重试');
        }
        return $this->result($r);
    }

    #每次交易
    public function meici($Diet_token,$Diet_name,$price,$user_token,$user_name)
    {
        if( $price>1000) {
                $price =  $price/10;
        }else{
             $price=100;
        }
        /*每次交易*/
        $UserEarningsAt = New UserEarningsAt();
        $UserEarningsAt->type = 1;
        $UserEarningsAt->operation = 1;
        $UserEarningsAt->price  = $price/2;
        $UserEarningsAt->name   = $Diet_name;
        $UserEarningsAt->token  = $Diet_token;
        $UserEarningsAt->totoken  = $user_token;
        $UserEarningsAt->toname  = $user_name;
        $UserEarningsAt->ctime  = time();
        return $UserEarningsAt->save();
    }

    #每天交易
    public function meitian($token,$price)
    {
        if( $price>1000) {
                $price =  $price/10;
        }else{
             $price=100;
        }
        /*每天收益*/
        $UserEarningsBay = UserEarningsBay::where('token',$token)
                           ->orderby('id','desc')->first();
        if(!empty($UserEarningsBay)){   
            #递增每次交易到每天      
            $EarningsBay = date('Y-m-d',$UserEarningsBay['ctime']);
            $time = date('Y-m-d');          
            if(  $EarningsBay==$time  ){
                    $UserEarningsBay->token = $UserEarningsBay['token'];
                    $UserEarningsBay->price = $UserEarningsBay['price'] + 
                                              $price/2;
                    $UserEarningsBay->ctime = time();
                  	return  $UserEarningsBay->save();
            }   else   {#超过时间重新创建当天交易               
                $UserEarningsBays = New UserEarningsBay();
                $UserEarningsBays->token = $token;
                $UserEarningsBays->price = $price/2;
                $UserEarningsBays->ctime = time();
                return $UserEarningsBays->save();
            }
        }   else   {#重新创建每天交易
            
            $UserEarningsBays = New UserEarningsBay();
            $UserEarningsBays->token = $token;
            $UserEarningsBays->price = $price/2;
            $UserEarningsBays->ctime = time();
            return $UserEarningsBays->save();
        }
    }

    #总交易
    public function zongjiaoyi($token,$price)
    {
        if( $price>1000) {
                $price =  $price/10;
        }else{
             $price=100;
        }
        #总收益
        $UserEarningsThe = UserEarningsThe::where('token',$token)->first();
        #第一次创建总收益以  如果有则递增总收益
        if(!empty($UserEarningsThe)){
            $UserEarningsThe->token = $token;
            $UserEarningsThe->price = $UserEarningsThe['price']  + $price/2;
            return $UserEarningsThe->save();
        }else{
            $UserEarningsThes = New  UserEarningsThe();
            $UserEarningsThes->token = $token;
            $UserEarningsThes->price = $price/2;
            return $UserEarningsThes->save();
        }
    }

}