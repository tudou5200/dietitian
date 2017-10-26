<?php
/**
  *@author leishangjie 2016-11-18
  *@version 2.0
	*@brief 自定义验证类
**/
namespace App\Extensions;



class LlValidator extends \Illuminate\Validation\Validator
{
	//验证是否是合伙人
	public function validatePartner($attribute,$value)
	{
		return !empty($value)&&\App\Models\User::where('token',$value)->where('type',2)->count();
	}
}