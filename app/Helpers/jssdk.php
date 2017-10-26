<?php exit;
/**
    *@author leishangjie 2016-10-26
    *@version 1.0
    *@brief 微信公共通行证获取
**/
namespace App\Helpers;

use App\Helpers\Curl;
use Cache;

class jssdk
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


    /**
      *@author leishangjie 2016-10-26
      *@version 1.0
      *@brief 获取微信通用票据
  **/


    public function getAccessToken() 
    {
      if (Cache::has($this->appId.'access_token'))
      {
          $access_token =  Cache::get($this->appId.'access_token');
      } 
      else 
      {
          
          $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appId&secret=$this->appSecret";
          $res = json_decode($this->curl->get($url));

          $access_token = $res->access_token;
          if ($access_token) 
          {
            Cache::add($this->appId.'access_token', $access_token, 100);
          }
      }
      return $access_token;
    }

    /**
      *@author leishangjie 2016-10-26
      *@version 1.0
      *@brief 获取微信调用js－sdk的数据包
      *@param url 请求页的网址
  **/
  
  
    public function getSignPackage($url)
    {
      // $url="http://wx.shoumeikeji.cn/user/zaskdetail.html?asktoken=Ask201704162304144";
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
      
    
      if (Cache::has($this->appId.'jsapi_ticket')) 
      {
        $ticket =  Cache::get($this->appId.'jsapi_ticket');
        
      } 
      else 
      {
         $accessToken = $this->getAccessToken();
         $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$accessToken";
         $res = json_decode($this->curl->get($url));
         $ticket = $res->ticket;
         if ($ticket) 
         {
            Cache::add($this->appId.'jsapi_ticket', $ticket, 100);
         }
      }

      return $ticket;
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


 
}