<?php

namespace App\Http\Sys;

use Illuminate\Http\Request;
use Validator;
use App\Http\BaseController;
use App\Models\ChatLog;
use DB;

class ChatController extends BaseController
{
	public function getLog(Request $request)
	{
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'totoken'		=>'required',
			'service'		=>'required',
		])){
			return $this->publicparaResponse();
		}

		$token  = $request->input('token');
		$totoken  = $request->input('totoken');
		$service  = $request->input('service');


		$log=DB::select("select * from chat_log where `service`=\"{$service}\" and( (`to`=\"{$token}\" and `from`= \"{$totoken}\" ) or (`from`=\"{$token}\" and `to`= \"{$totoken}\" ) )");

		return $this->result($log);
	}	
}