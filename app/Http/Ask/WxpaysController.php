<?php

namespace App\Http\Ask;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\AskList;
use App\Helpers\Curl;
use App\Helpers\actionjssdk;//微信jsdk
use App\Models\Dietinfo;
use App\Models\Agent;
use App\Models\UserSpokesmanMapping;
use App\Models\Commission;
use App\Models\CommissionThe;

class WxpaysController extends BaseController
{
        function __construct() 
    {
        $this->curl = new Curl();
        
    }


    // public function SMSMessag($Users,$SMS,$price,$name)
    // {
    //     $instance = new PublishBatchSMSMessage();
    //     $inst = $instance->run($Users,$SMS,"".$price."",$name);
    //     return $inst;
    // }

    #购买完营养师一对一咨询，对营养师推送的模板消息
    public function Dmbxx($tokenname,$dietitian){
       
        $mod=Dietinfo::where('dietitian',$dietitian)->first();
        $model=Users::where('token',$mod->token)->first();
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
                       "value":"你的客户已下单提问",
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
                       "value":"请用十万分的热情为Ta服务！\n 请到 我的->提问抢答 查看",
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
    #购买完普通咨询，对所有营养师推送的模板消息
    public function Dmbxxb($tokenname,$dietitian){
       
        $mod=Dietinfo::where('dietitian',$dietitian)->first();
        $model=Users::where('token',$mod->token)->first();
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
                       "value":"客户正在下单提问",
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
                       "value":"请到 我的->提问抢答 抢答",
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

    #购买完营养师一对一咨询，对用户推送的模板消息
    public function Umbxx($token,$price,$dietname){
        $model=Users::where('token',$token)->first();
        $openid=$model->openid;
        $jssdk = new actionjssdk();
            $astoken = $jssdk->getToken();
            $price=$price/100;
            // $utoken=$request->input('token');#用户标识#
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
                       "value":"'.$dietname.'营养师的一对一提问",
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
                       "value":"我们已通知'.$dietname.'营养师尽快为您回复，请到   我的->我的提问 查看",
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

    #统一订单
    public function payAction(Request $request)
    {   

        if($this->verCode($request->all(),[
            'order_sn'     =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $order_sn = $request->input('order_sn');

        $order=AskList::where('order_sn',$order_sn)->first();


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
                    $input->SetNotify_url("http://api.shoumeikeji.cn/ask/WxbacksAction");
                    $input->SetTrade_type("JSAPI");
                    $input->SetOpenid($u->openid);

                    $o = \WxPayApi::unifiedOrder($input);

                    if($o['return_code']=='FAIL')
                    {
                         $r=array('code'=>5,'msg'=>'网络错误2');
                    }
                    else
                    {
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
        $order=AskList::where('order_sn',$order_sn)->first();
        if(!$order)
        {
             return $this->result(array('code'=>5,'msg'=>'网络错误1'));
        }

        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        if($notify->Queryorder($order->order_sn))
        {   
            $order->paytime = time();
            $order->status  = 2;

           
                #判断是否需要推送
                if($order->state==2){
                    if($order->save()){  
                        #推送给营养师
                        $code=$this->Dmbxx($order->token_name,$order->dietitian);
                        if($code!=0){
                            $r=array('code'=>5,'msg'=>'网络错误3,请刷新后重试');
                        }else{
                            $r=[];
                        }
                        #推送给用户
                        $Ucode=$this->Umbxx($order->token,$order->price,$order->dietitian_name);
                        if($Ucode!=0){
                            $r=array('code'=>5,'msg'=>'网络错误5,请刷新后重试');
                        }else{
                            $r=[];
                        }
                    }else{
                        $r=[];
                    }
                }else{
                  if($order->save()){  
                    #推送给所有营养师
                    $diet=Dietinfo::where('status',1)->select('dietitian')->get();
                      foreach($diet as $k=>$v){
                         $bcode=$this->Dmbxxb($order->token_name,$v['dietitian']);
                         if($bcode!=0){
                            $r=array('code'=>5,'msg'=>'网络错误6,请刷新后重试');
                         }else{
                            $r=[];
                         }
                      }                   
                  }else{
                      $r=[];
                  }
                   // $r = $order->save()?[]:array('code'=>5,'msg'=>'网络错误6,请刷新后重试');
                }

            $agentInfo = Agent::all();
            if($agentInfo) {
                foreach($agentInfo as $agentKey => $agentTmp) {
                    $commissionRate[$agentTmp->agent_level] = $agentTmp->service_commission_rate;
                }
            }
            $mappingInfo = UserSpokesmanMapping::where('bind_token', $order->token)->select()->get();

            if($mappingInfo) {
                foreach($mappingInfo as $mk => $mv) {
                    $commissionModel = new Commission();
                    $commissionModel->spokesman_token = $mv->token;
                    $commissionModel->from_token = $order->token;
                    $commissionModel->type = 100;
                    $commissionModel->source_id = $order->asktoken;
                    $commissionModel->source_name = $order->dietitian_name.' - 咨询服务';
                    $commissionModel->money = $order->price*($commissionRate[$mv->level]/100);
                    $commissionModel->ctime = time();
                      $CommissionThe = CommissionThe::where('token',$mv->token)->first();
                        if($CommissionThe){
                            $CommissionThe->price = $CommissionThe->price + 
                                                    (($order->price*$commissionRate[$mv->level])/100);  
                            if($CommissionThe->save()){  
                                  $commissionModel->save();  
                            }
                        }else{
                            $CommissionThe = new CommissionThe();  
                            $CommissionThe->price = ($order->price*$commissionRate[$mv->level])/100;
                            $CommissionThe->token = $mv->token;                     
                            if($CommissionThe->save()){
                                  $commissionModel->save();
                            }
                        }
                    
                }
            }   
           
        }
        else
        {
           $r=array('code'=>5,'msg'=>'网络错误4,请刷新后重试');
        }
        return $this->result($r);
    }
}