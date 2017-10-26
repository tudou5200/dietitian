<?php
namespace App\Services\Front\Mall;


use App\Models\MallSpecRela;

class SpecRela
{		 
	
	public function specRelaList( $ids ){
		$specRelaList = MallSpecRela::whereIn('id',$ids)->get();
		return $specRelaList->toArray();
	}
}