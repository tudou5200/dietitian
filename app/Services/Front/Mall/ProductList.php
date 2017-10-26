<?php
namespace App\Services\Front\Mall;

use App\Models\MallProduct;

class ProductList
{		 
	public function productList($offset=null,$limit=null){
		if( isset($offset) && $limit ){
			// $r = MallProduct::where('status',1)->skip($offset)->take($limit)->get();	
			$r = MallProduct::where('status',1)->offset($offset)->limit($limit)->get();	
			
		}else{
			$r = MallProduct::where('status',1)->orderBy('order','desc')->orderBy('id','desc')->get();
		}
		return array_column( $r->toArray(), null, 'dtoken' );
	}
}