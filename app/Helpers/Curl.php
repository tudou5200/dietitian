<?php
/**
    *@author leishangjie 2016-10-26
    *@version 1.0
    *@brief 调用接口相关
**/
namespace App\Helpers;

class Curl
{

    /**
        *@author leishangjie 2016-10-26
        *@version 1.0
        *@brief post方式提交数据
        *@param url    请求的链接地址
        *@param param  请求的参数
    **/
  	function post($url = '', $param = '')
    {
        if (empty($url) || empty($param)) {
            return false;
        }
        $postUrl = $url;
        $curlPost = $param;
        $ch = curl_init(); //初始化curl
        curl_setopt($ch, CURLOPT_URL, $postUrl); //抓取指定网页
        // curl_setopt($ch, CURLOPT_HEADER, 0); //设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1); //post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
     
             
        
        $data = curl_exec($ch); //运行curl
        curl_close($ch);
        return $data;
    }
 
  
    /**
        *@author leishangjie 2016-10-26
        *@version 1.0
        *@brief get方式提交数据
        *@param url    请求的链接地址
        *@param param  请求的参数
    **/
    function get($url = '')
    {
        if (empty($url)) {
            return false;
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
}