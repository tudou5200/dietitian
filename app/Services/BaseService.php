<?php

namespace App\Services;
use Validator;
use App\Models\User;
use App\Models\UserReal;

class BaseService
{
	#生成唯一校验码
	public function buildToken($mobile)
	{
		return sha1($mobile.'xchl');
	}

	#生成订单编号
	public function buildOrderNo()
	{
		return date('Ymd').rand('0000','9999');
	}
	#生成众筹订单编号
	public function buildZorderNo()
	{
		return date('Ymd').rand('0000','9999');
	}

	#生成项目标识
	public function buildProjectToken()
	{
		return sha1(time().rand(0,9999).'xchl');
	}

	#生成商品标识
	public function buildGoodsToken()
	{
		return sha1(time().rand(0,9999).'Goods');
	}

	#生成营养师标识
	public function buildDietToken()
	{
		return sha1(time().rand(0,9999).'Diet');
	}

	#生成营养服务标识
	public function buildServiceToken()
	{
		return sha1(time().rand(0,9999).'Service');
	}

	#生成圈子标识
	public function builQuanToken()
	{
		return sha1(time().rand(0,9999).'Quan');
	}

	#生成圈子标识
	public function builAskToken()
	{
		return sha1(time().rand(0,9999).'Ask');
	}

	#生成短信验证码
	public function buildCode()
	{
		return rand(1000,9999);
	}
	#用户是否存在
	public function verUser($token)
	{
		$user=User::where('token',$token)->count();
		return $user>0?false:true;
	}
	#用户是否实名认证
	public function verUserReal($token)
	{
		$UserReal=UserReal::where('token',$token)->where('status',2)->count();
		return $UserReal>0?false:true;
	}
	#用户是否是合伙人
	public function verPartner($token)
	{
		$user=User::where('token',$token)->where('type','2')->count();
		return $user>0?false:true;
	}

	#加密
	protected function encrypt($data)
	{
		return Crypt::encrypt($data);
	}


	#解密
	protected function decrypt($data)
	{
		return Crypt::decrypt($data);
	}

	public function trimAll($str)
	{
	 $search = array(" ","　","\\n","\\r","\\t");
	 $replace = array("","","","","");
	 return str_replace($search, $replace, $str);
	}

	#生成料标识
	public function buildLiaoToken()
	{
		return sha1(rand(0,5999).time().'liao');
	}

}
