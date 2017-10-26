<?php
namespace App\Services\Front\Mall;

use App\Models\MallProduct;

class ProductDetail
{		 
	public function productDetail( $dtoken,$lockForUpdate=null ){
		if( $lockForUpdate ){
			$r = MallProduct::where('dtoken',$dtoken)->lockForUpdate()->get();
		}else{
			$r = MallProduct::where('dtoken',$dtoken)->get();
		}
		
		return $r->toArray();
	}
}