<?php
/**
    *@author leishangjie 2016-11-16
    *@version 2.0
    *@brief 数据整理
**/

namespace App\Helpers;


class ArrayData
{
	public  function getMin($data,$k1,$k2)
	{
		$r=[];
		foreach ($data as $dv) 
		{
			$r[$dv[$k1]]=(!isset($r[$dv[$k1]])||$r[$dv[$k1]]>$dv[$k2])?$dv[$k2]:$r[$dv[$k1]];

		}
		return $r;
	}
	function llsort($arrays,$sort_key,$sort_order=SORT_ASC,$sort_type=SORT_NUMERIC )
	{   
		if(empty($arrays))
		{
			return [];
		}

        $key_arrays=array_column($arrays, $sort_key);
        array_multisort($key_arrays,$sort_order,$sort_type,$arrays);   
        return $arrays;   
    } 
}