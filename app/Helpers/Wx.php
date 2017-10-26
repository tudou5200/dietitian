<?php
/**
    *@author leishangjie 2016-10-26
    *@version 1.0
    *@brief 微信公共通行证获取
**/
namespace App\Helpers;

use App\Helpers\Curl;
use Cache;

class Wx
{
	/**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@param appId 微信公众号账号
	    *@param appSecret  微信密钥
	    *@param curl  调用接口
	**/
	function __construct() 
	{

    	$this->appId = config('wx.appid');
    	$this->appSecret = config('wx.secret');
    	$this->curl=new Curl();
  	}

  	/**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取微信网页授权的跳转网址
	    *@param url 请求页的网址
	**/
  	public function codeUrl($url)
    {

        return 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->appId.'&redirect_uri='.urlencode($url).'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
    }

    /**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取微信通用票据
	**/


  	public function getAccessToken() 
  	{
  	
  		 // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
	    $data = json_decode($this->get_php_file("api/access_token.php"));
	    if ($data->expire_time < time()) {
	      // 如果是企业号用以下URL获取access_token
	      // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";
	      $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
	      $res = json_decode($this->curl->get($url));
	      $access_token = $res->access_token;
	      if ($access_token) {
	        $data->expire_time = time() + 7000;
	        $data->access_token = $access_token;
	        $this->set_php_file("api/access_token.php",json_encode($data));
	      }
	    } else {
	      $access_token = $data->access_token;
	    }
	    return $access_token;
	    // if (Cache::has($this->appId.'access_token'))
	    // {
	    //   	$access_token =  Cache::get($this->appId.'access_token');
    	// } 
	    // else 
	    // {
	      	
	    //   	$url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
	    //   	$res = json_decode($this->curl->get($url));


	    //   	$access_token = $res->access_token;
	    //   	if ($access_token) 
	    //   	{
	    //   		Cache::add($this->appId.'access_token', $access_token, 100);
     //  		}
	    // }
    	// return $access_token;
  	}

  	/**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取微信调用js－sdk的数据包
	    *@param url 请求页的网址
	**/
	
  
  	// public function getSignPackage()
  	public function getSignPackage($url)
  	{
  		 // 注意 URL 一定要动态获取，不能 hardcode.
	    // $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
	    // $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";


	    $jsapiTicket = $this->getJsApiTicket();
	   
	    $timestamp = time();
	    $nonceStr = $this->createNonceStr();

	    // 这里参数的顺序要按照 key 值 ASCII 码升序排序
	    $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

	    $signature = sha1($string);

	    $signPackage = array(
	      "appId"     => $this->appId,
	      "nonceStr"  => $nonceStr,
	      "timestamp" => $timestamp,
	      "url"       => $url,
	      "signature" => $signature,
	      "rawString" => $string
	    );
	    return $signPackage; 
	  }

	 /**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取微信调用js－sdk的票据
	**/
	 private function getJsApiTicket() 
	 {
	    
	    // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
		    $data = json_decode($this->get_php_file("api/jsapi_ticket.php"));
		    if ($data->expire_time < time()) {
		      $accessToken = $this->getAccessToken();
		      // 如果是企业号用以下 URL 获取 ticket
		      // $url = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token=$accessToken";
		      $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
		      $res = json_decode($this->curl->get($url));
		      $ticket = $res->ticket;
		      if ($ticket) {
		        $data->expire_time = time() + 7000;
		        $data->jsapi_ticket = $ticket;
		        $this->set_php_file("api/jsapi_ticket.php", json_encode($data));
		      }
		    } else {
		      $ticket = $data->jsapi_ticket;
		    }

		    return $ticket;
	  
	    // if (Cache::has($this->appId.'jsapi_ticket')) 
	    // {
	    // 	$ticket =  Cache::get($this->appId.'jsapi_ticket');
	      
	    // } 
	    // else 
	    // {
		   //   $accessToken = $this->getAccessToken();
		   //   $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
		   //   $res = json_decode($this->curl->get($url));
		   //   $ticket = $res->ticket;
		   //   if ($ticket) 
		   //   {
		   //      Cache::add($this->appId.'jsapi_ticket', $ticket, 100);
		   //   }
	    // }

	    // return $ticket;
	 }

	 /**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 生成随机串
	    *@param length 随机串长度
	**/
	 private function createNonceStr($length = 16) 
	 {
	    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    $str = "";
	    for ($i = 0; $i < $length; $i++) {
	      $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
	    }
	    return $str;
	 }

	/**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取用户个人信息的票据
	    *@param code 用户同意网页授权后返回的参数
	    *@param msg  返回的信息标识
	**/
	public function getToken($code,&$msg)
	{
		$url='https://api.weixin.qq.com/sns/oauth2/access_token?appid='.config('wx.appid').'&secret='.config('wx.secret').'&code='.$code.'&grant_type=authorization_code';

		$res = json_decode($this->curl->get($url),true);

		$msg = isset($res['errcode'])?true:false;

		return $res;

	}

	/**
	    *@author leishangjie 2016-10-26
	    *@version 1.0
	    *@brief 获取用户个人信息
	    *@param access 获取用户个人信息的票据
	    *@param openid 用户在微信端的个人标识
	    *@param msg  返回的信息标识
	**/
	public function getInfo($access,$openid,&$msg)
	{
		 $url='https://api.weixin.qq.com/sns/userinfo?access_token='.$access.'&openid='.$openid.'&lang=zh_CN';

		 $res = json_decode($this->curl->get($url),true);

		 $msg = isset($res['errcode'])?true:false;

		 return $res;
	}
	public function getWxPic($pid,$type=0)
    {

        $token=$this->getAccessToken();

        $str = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=".$token."&media_id=".$pid;  

        $path=config('img.path');


        $newName=$path[$type].'/'.time().rand(1111,9999).'.jpg';

        $ch = curl_init($str);
		$fp = fopen($newName, 'wb');
		curl_setopt($ch, CURLOPT_FILE, $fp);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_exec($ch);
		curl_close($ch);
		fclose($fp);
		return $newName;

    }
    private function get_php_file($filename) {

    	return trim(substr(file_get_contents($filename), 15));
	}

	private function set_php_file($filename, $content) {

	    // $filename = 'file/goods/'.time().'.txt';
	    return file_put_contents($filename, "<?php exit();?>" . $content);

	    /*$fp = fopen($filename, "w");
	    fwrite($fp, "<?php exit();?>" . $content);
	    fclose($fp);*/
  	}
}