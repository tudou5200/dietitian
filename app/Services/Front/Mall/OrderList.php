<?php
namespace App\Services\Front\Mall;

use App\Services\BaseService;
use App\Models\MallOrder;

class OrderList extends BaseService
{
	public function getList( $token ){
		$r = MallOrder::where('token',$token)->get();
		if( $r ){
			return $r->toArray();	
		}else{
			return array();
		}
		
	}
}