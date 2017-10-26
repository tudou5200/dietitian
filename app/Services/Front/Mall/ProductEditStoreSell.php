<?php
namespace App\Services\Front\Mall;

use App\Models\MallProduct;

class ProductEditStoreSell
{		 
	public function editStoreSell( $dtoken , $num ){
		$r1 = MallProduct::where('dtoken',$dtoken)->decrement( 'store',$num );
		$r2 = MallProduct::where('dtoken',$dtoken)->increment( 'sell',$num );
		if( !$r1 || !$r2 ) return false;
		return true;
	}
}