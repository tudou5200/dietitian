<?php
/**
    *@author leishangjie 2017-1-5
    *@version 1.0
    *@brief 支付
**/
namespace App\Services\Front\Mall;

use App\Models\MallOrder;
use App\Models\User;
use App\Models\MallOrderDetail;
use App\Models\MallProduct;
use App\Models\UserInMoney;

class OrderPayed
{	
	public function index($token,$orderno)
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
		try {
		    $charge = \Pingpp\Charge::retrieve($order->third_no);
		    
		    if($charge->paid)
		    {
		    	$order->status=2;
		    	
		    	if($order->save())
		    	{
		    		$this->add($token,$order->third_no,$order->pay_type,$orderDetail->price,'商城支付');
		    		return [];

		    	}
		    	else
		    	{
		    		return array('code'=>'5','msg'=>'网络错误，请刷新后重试');
		    	}
		    }
		    else
		    {
		    	return array('code'=>'5','msg'=>'网络错误，请刷新后重试');
		    }

		} catch (\Pingpp\Error\Base $e) {

		    if ($e->getHttpStatus() != null) {
		        header('Status: ' . $e->getHttpStatus());
		        echo $e->getHttpBody();
		    } else {
		        echo $e->getMessage();
		    }
		}
	}
	
	private function add($token,$third_no,$third,$money,$desc)
	{	
		$mon=new UserInMoney();
		$mon->token=$token;
		$mon->third_no=$third_no;
		$mon->third=$third;
		$mon->num=$money;
		$mon->desc=$desc;
		$mon->time=time();
		$mon->save();

	}
}