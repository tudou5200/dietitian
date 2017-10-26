<?php
namespace App\Services\Front\Mall;

use App\Services\BaseService;
use App\Models\MallOrderDetail;

class OrderDetailAdd extends BaseService
{
	public function add( $orderno, $dtoken, $num, $xb_num, $paymoney, $product ){
		$orderDetail = new MallOrderDetail();
		$orderDetail->orderno	= $orderno;
		$orderDetail->dtoken	= $dtoken;
		$orderDetail->num  		= $num;
		$orderDetail->xb 		= $xb_num;
		$orderDetail->price 	= $paymoney;
		$orderDetail->pic  		= $product['pic'];
		$orderDetail->name  	= $product['name'];
		$orderDetail->market  	= $product['market'];
		$r = $orderDetail->save();
		return $r;
	}
}