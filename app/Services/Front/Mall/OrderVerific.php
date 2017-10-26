<?php
namespace App\Services\Front\Mall;

use App\Services\BaseService;
use App\Models\MallOrder;

class OrderVerific extends BaseService
{
	public function verificOrder( $orderno ){
		$r = MallOrder::where('orderno',$orderno)->update(['status'=>3]);
		if( $r ){
			return true;	
		}else{
			return false;
		}
	}
}