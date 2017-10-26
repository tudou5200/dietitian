<?php
/**
	*@author leishangjie 2016-11-16
	*@version 2.0
	*@brief 信息发送
**/
namespace App\Http\Sys;

use Illuminate\Http\Request;
use Validator;
use App\Http\BaseController;
use App\Services\Sys\SendMobile;

class MsgController extends BaseController
{	
	private $msg=0;
	public function index(Request $request)
	{
		$msg=0;

		$v=$this->verCode($request->all(),[
	        'mobile' => 'required|regex:/^1\d{10}$/',
	        ],$this->msg);


		if($this->msg==1)
		{
			return $v;
		}

		
		$mobile = trim($request->input('mobile'));
		$type = trim($request->input('type'));

		$type=empty($type)?'code':$type;
	
		$send=new SendMobile();
		$r=$send->index($mobile,$type);
	
		return $this->result( $r);

	}
		
}

