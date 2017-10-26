<?php

namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Goods;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use App\Models\Dietinfo;
use App\Models\UserInfo;
use app\api\validate\User;
use App\Models\Dietorderdetail;

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

        $order=Order::where('order_sn',$order_sn)->first();


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
                    $input->SetTotal_fee($order->totalprice);
                    $input->SetTime_start(date("YmdHis"));
                    $input->SetTime_expire(date("YmdHis", time() + 600));
                    $input->SetGoods_tag("微信支付");
                    $input->SetNotify_url("http://api.shoumeikeji.cn/front/mall/WxbackAction");
                    $input->SetTrade_type("JSAPI");
                    $input->SetOpenid($u->openid);

                    $o = \WxPayApi::unifiedOrder($input);

                    if($o['return_code']=='FAIL')
                    {
                         $r=array('code'=>5,'msg'=>'网络错误');
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
        $order = Order::where('order_sn',$order_sn)->first();
        if(!$order)
        {
             return $this->result(array('code'=>5,'msg'=>'网络错误'));
        }

        require_once app_path("Library/Wxpay/example/notify.php");
        $notify = new \PayNotifyCallBack();
        if($notify->Queryorder($order->order_sn))
        {   
            $order->paytime = time();
            $order->status  = 2;

            $r=$order->save()?[]:array('code'=>5,'msg'=>'网络错误');
        }
        else
        {
           $r=array('code'=>5,'msg'=>'网络错误,请刷新后重试');
        }
        return $this->result($r);
    }
}