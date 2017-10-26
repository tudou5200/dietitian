<?php

namespace App\Http\Front\Diet;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Goods;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Models\Askconsult;
use App\Models\Askconslist;
use App\Models\Dietorder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use App\Helpers\PublishBatchSMSMessage;
use App\Helpers\Curl;
use App\Helpers\actionjssdk;//微信jsdk
use App\Models\Dietinfo;
use App\Models\UserInfo;
use App\Models\Agent;
use App\Models\UserSpokesmanMapping;
use App\Models\Commission;
use App\Models\CommissionThe;
use app\api\validate\User;
use App\Models\Dietorderdetail;
class WxpayController extends BaseController
{
     function __construct() 
    {
        $this->curl = new Curl();
        
    }
    
     public function Ddmbxx($token,$dietitian){
       
        $mod=Dietinfo::where('dietitian',$dietitian)->first();
        $umodel=UserInfo::where('token',$token)->first();
        $model=Users::where('token',$mod->token)->first();
        $tokenname=$umodel->user_name;
        $openid=$model->openid;
        $jssdk = new actionjssdk();
            $astoken = $jssdk->getToken();
            // $utoken=$request->input('token');#用户标识#
        $url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$astoken;
        $data=' {
            "touser":"'.$openid.'",
            "template_id":"DlcqzSJk9AI5v8mXsCLZ2rAcxonQqltTokDUJEFt8w0",
            "url":"http://wx.shoumeikeji.cn/diet/index.html",
            "data":{
                   "first": {
                       "value":"你的客户已下单你的服务项目",
                       "color":"#173177"
                   },
                   "keyword1":{
                       "value":"'.$tokenname.'",
                       "color":"#173177"
                   },
                   "keyword2": {
                       "value":"'.date('Y-m-d H:i:s',time()).'", 
                       "color":"#173177"
                   },
                   "remark":{
                       "value":"请用十万分的热情为Ta服务！请进入 \n 我的->我的顾客 点击用户头像，与用户进行沟通",
                       "color":"#173177"
                   }
           }
       }';
       // ovxXWv5Ldfh1B4nho4C-Jz6Kgma0
       // "touser":"ovxXWv0E3d57KcmAN_MIEbzMU78w",
       $json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }

     #购买完营养师服务，对用户推送的模板消息
    public function Udmbxx($price,$token,$dietitian){
        $umodel=Users::where('token',$token)->first();
        $mod=Dietinfo::where('dietitian',$dietitian)->first();
        $dietname=$mod['name'];
        $openid=$umodel->openid;
        $jssdk = new actionjssdk();
        $astoken = $jssdk->getToken();
        $price=$price/100;
        $url="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$astoken;
        $data=' {
            "touser":"'.$openid.'",
            "template_id":"H99s0BgSl1vPtPJiXhy2jf3UwUnJxCYCZ9NkaCS9W04",
            "url":"http://wx.shoumeikeji.cn/diet/index.html",
            "data":{
                   "first": {
                       "value":"恭喜，下单成功",
                       "color":"#173177"
                   },
                   "keyword1":{
                       "value":"'.$dietname.'营养师的服务项目",
                       "color":"#173177"
                   },
                   "keyword2": {
                       "value":"'.$price.'元",
                       "color":"#173177"
                   },
                   "keyword3": {
                       "value":"'.date('Y-m-d H:i:s',time()).'", 
                       "color":"#173177"
                   },
                   "remark":{
                       "value":"我们已通知'.$dietname.'营养师尽快为您服务,请到 \n 我的->我的营养师 点击营养师头像，与营养师进行沟通",
                       "color":"#173177"
                   }
            }
       }';
       // ovxXWv5Ldfh1B4nho4C-Jz6Kgma0
       // "touser":"ovxXWv0E3d57KcmAN_MIEbzMU78w",
       $json=$this->curl->post($url,$data);
       $jsonarr=json_decode($json,true);
       return $jsonarr['errcode'];
        // return $json;
    }


    public function payAction(Request $request)
    {   

        if($this->verCode($request->all(),[
            'order_sn'     =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $order_sn = $request->input('order_sn');
        $Dietorder=Dietorder::where('order_sn',$order_sn)->first();

        $status = $Dietorder->status;
        $token  = $Dietorder->token;
        $totalprice = $Dietorder->totalprice;
        switch(true)
        {
            case !$Dietorder:
                $r=array('code'=>5,'msg'=>'订单不存在');
                break;
            case $status!=1:
                $r=array('code'=>5,'msg'=>'订单状态不正确');
                break;
            default:

                $UserModel = Users::where('token',$token)->first();
                $uopenid = $UserModel->openid;
                if(!$UserModel)
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
                    $input->SetTotal_fee($totalprice);
                    $input->SetTime_start(date("YmdHis"));
                    $input->SetTime_expire(date("YmdHis", time() + 600));
                    $input->SetGoods_tag("微信支付");
                    $input->SetNotify_url("http://api.shoumeikeji.cn/front/diet/WxbackAction");
                    $input->SetTrade_type("JSAPI");
                    $input->SetOpenid($uopenid);

                    $wxorder = \WxPayApi::unifiedOrder($input);

                    if($wxorder['return_code']=='FAIL')
                    {
                         $r=array('code'=>5,'msg'=>'网络错误');
                    }
                    else{
                        $Dietorder->third = $wxorder['prepay_id'];
                        $Dietorder->save();
                    
                        $r['js'] = $tools->GetJsApiParameters($wxorder);
                    }
                    
                }
                 
                break;
        }
        return $this->result($r);

     
    }

    public function backAction(Request $request)
    {   
        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false,$request->getContent());
    }


    #营养师服务下单
    public function callbackAction(Request $request)
    {   

        if($this->verCode($request->all(),[
            'order_sn'     =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $order_sn = $request->input('order_sn');

        $Dietorder=Dietorder::where('order_sn',$order_sn)->first();
        $Users = Users::where('token',$Dietorder['token'])->first();
        $UserInfo = UserInfo::where('token',$Dietorder['token'])->first();
        $Dietinfo = Dietinfo::where('dietitian',$Dietorder['dietitian'])->first();
        $orderDetail = Dietorderdetail::where('order_sn',$order_sn)->first();
        $order_sn = $Dietorder->order_sn;
        if(!$Dietorder)
        {
             return $this->result(array('code'=>5,'msg'=>'网络错误'));
        }

        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        if($notify->Queryorder($order_sn))
        {   
            $Dietorder->paytime = time();
            $Dietorder->status = 2;

            $Askconsult =  Askconsult::where('token',$Dietorder['token'])->where('dietitian',$Dietorder['dietitian'])->first();
            if(!$Askconsult){

              $UserInfo = UserInfo::where('token',$Dietorder['token'])->first();
              $Dietinfo = Dietinfo::where('dietitian',$Dietorder['dietitian'])->first();
              if($UserInfo&&$Dietinfo){
                  $Askconsult =  new Askconsult();
                  $Askconsult->atoken = 'Ask'.date('YmdHi').rand(1000,9999);
                  $Askconsult->token = $UserInfo['token'];
                  $Askconsult->token_img  = $UserInfo['user_img'];
                  $Askconsult->token_name = $UserInfo['user_name'];
                  $Askconsult->dietitian  = $Dietinfo['dietitian'];
                  $Askconsult->dietitian_name  = $Dietinfo['name'];
                  $Askconsult->dietitian_img   = $Dietinfo['mgpic'];
                  $Askconsult->ctime   = time();
                  $r = $Askconsult->save()?[]:array('code'=>5,'msg'=>'网络错误3,请刷新后重试');;
              }else{
                  $r=array('code'=>5,'msg'=>'网络错误1,请刷新后重试');
              }             
            }



            if($Dietorder->save()){
                                 $agentInfo = Agent::all();
                if($agentInfo) {
                    foreach($agentInfo as $agentKey => $agentTmp) {
                        $commissionRate[$agentTmp->agent_level] = $agentTmp->service_commission_rate;
                    }
                }
              
                $mappingInfo = UserSpokesmanMapping::where('bind_token', $Dietorder['token'])->select()->get();
                if($mappingInfo) {
                    foreach($mappingInfo as $mk => $mv) {
                        $commissionModel = new Commission();
                        $commissionModel->spokesman_token = $mv->token;
                        $commissionModel->from_token = $Dietorder['token'];
                        $commissionModel->type = 100;
                        $commissionModel->source_id = $orderDetail->ptoken;
                        $commissionModel->source_name = $Dietinfo->name.'-'.$orderDetail->title.'服务';
                        $commissionModel->money = ($Dietorder->totalprice*$commissionRate[$mv->level])/100;
                        $commissionModel->ctime = time();
                        //$commissionModel->save();
                        $CommissionThe = CommissionThe::where('token',$mv->token)->first();
                        if($CommissionThe){
                            $CommissionThe->price = $CommissionThe->price + (($Dietorder->totalprice*$commissionRate[$mv->level])/100);  
                            if($CommissionThe->save()){  
                                  $commissionModel->save();  
                            }
                        }else{
                            $CommissionThe = new CommissionThe();  
                            $CommissionThe->price = ($Dietorder->totalprice*$commissionRate[$mv->level])/100;
                            $CommissionThe->token = $mv->token;                     
                            if($CommissionThe->save()){
                                  $commissionModel->save();
                            }
                        }
                    }
                }

                #模板推送
                $code=$this->Ddmbxx($Dietorder->token,$Dietorder->dietitian);
                if($code!=0){
                    $r=array('code'=>5,'msg'=>'网络错误1,请刷新后重试');
                 }else{
                    $r=[];
                 }
                $ucode=$this->Udmbxx($Dietorder->totalprice,$Dietorder->token,$Dietorder->dietitian);
                if($ucode!=0){
                    $r=array('code'=>5,'msg'=>'网络错误2,请刷新后重试');
                 }else{
                    $r=[];
                 }
            } 
            // $r=$Dietorder->save()?[]:array('code'=>5,'msg'=>'网络错误');
        }
        else
        {
           $r=array('code'=>5,'msg'=>'网络错误,请刷新后重试');
        }
        return $this->result($r);
    }
}