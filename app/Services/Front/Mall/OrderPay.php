<?php
/**
    *@author leishangjie 2017-1-5
    *@version 1.0
    *@brief 支付
**/
namespace App\Services\Front\Mall;

use App\Models\MallProduct;
use App\Models\User;
use App\Models\MallOrder;
use App\Models\MallOrderDetail;

class OrderPay
{	
	public function index($token,$orderno,$channel)
	{
		$user=User::where('token',$token)->select('openid')->first();
		if(!$user)
			return array('code'=>'5','msg'=>'用户不存在');
		$order=MallOrder::where('orderno',$orderno)->where('token',$token)->where('status',1)->first();
		if(!$order)
			return array('code'=>'5','msg'=>'您的订单不存在');
		$orderDetail=MallOrderDetail::where('orderno',$orderno)->first();
		if(!$orderDetail)
			return array('code'=>'5','msg'=>'您的订单不存在');

		$product=MallProduct::where('dtoken',$orderDetail->dtoken)->where('status',1)->count();

		if($product==0)
			return array('code'=>'5','msg'=>'商品已下架');

		require app_path('Library/ping/init.php');

		\Pingpp\Pingpp::setApiKey(config('pay.key')); 
		\Pingpp\Pingpp::setPrivateKeyPath(app_path('Library/ping/private_key.pem'));


		$extra=$this->genExa($channel,$user->openid);
		


		try {
		    $ch = \Pingpp\Charge::create(
		        array(
		            //请求参数字段规则，请参考 API 文档：https://www.pingxx.com/api#api-c-new
		            'subject'   => '星筹互联',
		            'body'      => '订单支付',
		            'amount'    => $orderDetail->pay_price,//订单总金额, 人民币单位：分（如订单总金额为 1 元，此处请填 100）
		            'order_no'  => $orderno,// 推荐使用 8-20 位，要求数字或字母，不允许其他字符
		            'currency'  => 'cny',
		            'extra'     => $extra,
		            'channel'   => $channel,// 支付使用的第三方支付渠道取值，请参考：https://www.pingxx.com/api#api-c-new
		            'client_ip' => $_SERVER['REMOTE_ADDR'],// 发起支付请求客户端的 IP 地址，格式为 IPV4，如: 127.0.0.1
		            'app'       => array('id' => config('pay.appid'))
		        )
		    );

		    $order->pay_type=$channel;
		    $order->third_no=$ch->id;
		    return $order->save()?$ch:array('code'=>'5','msg'=>'网络错误，请刷新后重试');

		  
		} catch (\Pingpp\Error\Base $e) {

			return array('code'=>'5','msg'=>'网络错误，请刷新后重试');
			//return array('code'=>'5','msg'=>$e->getHttpBody());
		    // // 捕获报错信息
		    // if ($e->getHttpStatus() != null) {
		      
		    //     echo $e->getHttpBody();
		    // } else {
		    //     echo $e->getMessage();
		    // }
		}
		exit;
	}
	private function genExa($channel,$open_id)
	{
		$extra = array();
		switch ($channel) {
		    case 'alipay_wap':
		        $extra = array(
		            // success_url 和 cancel_url 在本地测试不要写 localhost ，请写 127.0.0.1。URL 后面不要加自定义参数
		            'success_url' => 'http://example.com/success',
		            'cancel_url' => 'http://example.com/cancel'
		        );
		        break;
		    case 'bfb_wap':
		        $extra = array(
		            'result_url' => 'http://example.com/result',// 百度钱包同步回调地址
		            'bfb_login' => true// 是否需要登录百度钱包来进行支付
		        );
		        break;
		    case 'upacp_wap':
		        $extra = array(
		            'result_url' => 'http://example.com/result'// 银联同步回调地址
		        );
		        break;
		    case 'wx_pub':
		        $extra = array(
		            'open_id' => $open_id// 用户在商户微信公众号下的唯一标识，获取方式可参考 pingpp-php/lib/WxpubOAuth.php
		        );
		        break;
		    case 'wx_pub_qr':
		        $extra = array(
		            'product_id' => 'Productid'// 为二维码中包含的商品 ID，1-32 位字符串，商户可自定义
		        );
		        break;
		    case 'yeepay_wap':
		        $extra = array(
		            'product_category' => '1',// 商品类别码参考链接 ：https://www.pingxx.com/api#api-appendix-2
		            'identity_id'=> 'your identity_id',// 商户生成的用户账号唯一标识，最长 50 位字符串
		            'identity_type' => 1,// 用户标识类型参考链接：https://www.pingxx.com/api#yeepay_identity_type
		            'terminal_type' => 1,// 终端类型，对应取值 0:IMEI, 1:MAC, 2:UUID, 3:other
		            'terminal_id'=>'your terminal_id',// 终端 ID
		            'user_ua'=>'your user_ua',// 用户使用的移动终端的 UserAgent 信息
		            'result_url'=>'http://example.com/result'// 前台通知地址
		        );
		        break;
		    case 'jdpay_wap':
		        $extra = array(
		            'success_url' => 'http://example.com/success',// 支付成功页面跳转路径
		            'fail_url'=> 'http://example.com/fail',// 支付失败页面跳转路径
		            /**
		            *token 为用户交易令牌，用于识别用户信息，支付成功后会调用 success_url 返回给商户。
		            *商户可以记录这个 token 值，当用户再次支付的时候传入该 token，用户无需再次输入银行卡信息
		            */
		            'token' => 'dsafadsfasdfadsjuyhfnhujkijunhaf' // 选填
		        );
		        break;
		}
		return $extra;
	}
}