<?php
/**
    *@author leishangjie 2016-10-26
    *@version 1.0
    *@brief 发送短信验证码
**/
namespace App\Services\Sys;

use App\Services\BaseService;
use App\Models\Mcode;
use Redis;

class SendMobile extends BaseService
{	
	public function index($mobile,$type,$param=null)
	{	

		$r=[];

		switch ($type) {
			case 'code':
				$param['code']=$this->buildCode();
				break;

			case 'chou':
				if(empty($param['name']))
					$r=array('code'=>'5','msg'=>'缺少项目名称');

				break;

			case 'qPay':
				if(empty($param['name'])||empty($param['money']))
					$r=array('code'=>'5','msg'=>'缺少项目名称或者金额');
				break;
		}

		if(empty($r))
		{
			return $this->start($mobile,$type,$param);
		}	
		else
		{
			return $r;
		}
		

	}
	private function start($mobile,$type,$param)
	{
		$con=$this->genCon($type,$param);

		if(!$con)
		{
			return array('code'=>'5','msg'=>'短信类型错误');
		}

		$res=$this->send($mobile,$con);

		$res=explode(',',$res);
		switch ($res[0]) 
		{
			case '0':
			    $r=$this->sendOk($mobile,$type,$param);
				break;
			default:
				$r=array('code'=>'5','msg'=>'验证码发送失败');
				break;
		}
		return $r;
	}
	private function sendOk($mobile,$type,$param)
	{
		switch ($type) {
			case 'code':
				Redis::setex($mobile, 900,$param['code'] );
			    $r=array('msg'=>'验证码发送成功');
				break;
			default:
				 $r=array('msg'=>'信息发送成功');
				break;
		}
		return $r;
	}
	private function genCon($type,$param)
	{
		$con=config('mobile.'.$type);

		if(empty($con))
			return false;

		foreach ($param as $sk => $sv) 
	    {
	         $con = str_replace("{".$sk."}", $sv, $con);
	    }
	    return $con;

	}
	private function send($tel,$content,$type='')
	{
		$num = 2;
		if($type){
			$phone=implode(',',$tel);
		}else{
			$phone=$tel;
		}
		
			$account = '11756507';
			$pwd = 'A45A611E618DB8C565EDC6E0EB20';
			$date = date("Y-m-d H:i:s");
			
			$url = 'http://sms.1xinxi.cn/asmx/smsservice.aspx';
			$data['name'] = $account;
			$data['pwd'] = $pwd;
			$data['content'] = $content;
			$data['mobile'] = $phone;
			$data['stime'] = $date;
			$data['sign'] = '';
			$data['type'] = 'pt';
			$data['extno'] = '';

			$info = $this->postSMS($url, $data);
			return $info;		
	}

	private function postSMS($url,$data='')
	{
		$row = parse_url($url);
		$host = $row['host'];
		$port = isset($row['port']) ? $row['port']:80;
		$file = $row['path'];

		$post='';
		while (list($k,$v) = each($data)){
			$post .= rawurlencode($k)."=".rawurlencode($v)."&";	//转URL标准码
		}
		$post = substr( $post , 0 , -1 );
		$len = strlen($post);
		$fp = @fsockopen( $host ,$port, $errno, $errstr, 10);
		if (!$fp) {
			return "$errstr ($errno)\n";
		} else {
			$receive = '';
			$out = "POST $file HTTP/1.1\r\n";
			$out .= "Host: $host\r\n";
			$out .= "Content-type: application/x-www-form-urlencoded\r\n";
			$out .= "Connection: Close\r\n";
			$out .= "Content-Length: $len\r\n\r\n";
			$out .= $post;
			fwrite($fp, $out);
			while (!feof($fp)) {
				$receive .= fgets($fp, 128);

			}
			fclose($fp);
			$receive = explode("\r\n\r\n",$receive);
			unset($receive[0]);
			return implode("",$receive);
		}
	}
	
}