<?php
namespace App\Services\Front\Mall;


use App\Models\MallSpec;

class Spec
{		 
	
	public function specList( $ids ){
		$specList = MallSpec::whereIn('id',$ids)->get();
		return $specList->toArray();
	}
}