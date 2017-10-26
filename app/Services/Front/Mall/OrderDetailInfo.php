<?php
namespace App\Services\Front\Mall;

use App\Services\BaseService;
use App\Models\MallOrderDetail;
use App\Models\MallOrder;

class OrderDetailInfo extends BaseService
{
	public function getDetail( $orderno ){
		$r = MallOrderDetail::where('orderno',$orderno)->get();
		// var_dump($r);die;
		if( $r ){
			$r['order']= MallOrder::where('orderno',$orderno )->first();
			// $r['address']=
			return $r->toArray();	
		}else{
			return array();
		}
		
	}
}