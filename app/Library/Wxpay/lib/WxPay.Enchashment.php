<?php
require_once BASEPATH."/../app/Library/Wxpay/lib/WxPay.Exception.php";
require_once BASEPATH."/../app/Library/Wxpay/lib/WxPay.Config.php";
require_once BASEPATH."/../app/Library/Wxpay/lib/WxPay.Data.php";

class WxPayEnchashment
{

    /**
     *  $openid    用户openid
     *  $user_name 真实姓名
     *  $amount    提现金额
     *  $desc      订单表述
     */
    public static function Enchashment($openid,$user_name,$amount,$desc,$order)
    {
            // header('content-type:text/html;charset=utf-8');

            $data['mch_appid']=WxPayConfig::APPID;//商户的应用appid

            $data['mchid']=WxPayConfig::MCHID;//商户ID

            $data['nonce_str']=WxPayEnchashment::unicode();//unicode();//这个据说是唯一的字符串下面有方法

            $data['partner_trade_no']=$order;//.time();//这个是订单号。

            $data['openid']=$openid;//这个是授权用户的openid。。这个必须得是用户授权才能用

            $data['check_name']='NO_CHECK';//这个是设置是否检测用户真实姓名的

            $data['re_user_name']=$user_name;//用户的真实名字

            $data['amount']=$amount;//提现金额

            $data['desc']=$desc;//订单描述

            $data['spbill_create_ip']=$_SERVER['SERVER_ADDR'];//这个最烦了，，还得获取服务器的ip

            $secrect_key='Aiyang11122233344455566677788899';///这个就是个API密码。32位的。。随便MD5一下就可以了 商户秘钥

            $data=array_filter($data);

            ksort($data);

            $str='';

            foreach($data as $k=>$v) {

                $str.=$k.'='.$v.'&';

            }

            $str.='key='.$secrect_key;

            $data['sign']=md5($str);

            $xml=WxPayEnchashment::arraytoxml($data);

            // echo $xml;

            $url='https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';

            $res=WxPayEnchashment::curl($xml,$url);

            $return=WxPayEnchashment::xmltoarray($res);

            // print_r($return);
            return $return;

            // echo getcwd().'/cert/apiclient_cert.pem';die;
    }


        public static function unicode() {

            $str = uniqid(mt_rand(),1);

            $str=sha1($str);

           return md5($str);

        }

        public static function arraytoxml($data){

            $str='<xml>';

            foreach($data as $k=>$v) {

                $str.='<'.$k.'>'.$v.'</'.$k.'>';

            }

            $str.='</xml>';

            return $str;

        }

        public static function xmltoarray($xml) { 

             //禁止引用外部xml实体 

            libxml_disable_entity_loader(true); 

            $xmlstring = simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA); 

            $val = json_decode(json_encode($xmlstring),true); 

            return $val;

        } 

        public static function curl($param="",$url) {

           

            $postUrl = $url;

            $curlPost = $param;

            $ch = curl_init();                                      //初始化curl

            curl_setopt($ch, CURLOPT_URL,$postUrl);                 //抓取指定网页

            curl_setopt($ch, CURLOPT_HEADER, 0);                    //设置header

            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);            //要求结果为字符串且输出到屏幕上

            curl_setopt($ch, CURLOPT_POST, 1);                      //post提交方式

            curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);           // 增加 HTTP Header（头）里的字段 

            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);        // 终止从服务端进行验证

            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);

            curl_setopt($ch,CURLOPT_SSLCERT,app_path('Library/Wxpay/cert/apiclient_cert.pem')); //这个是证书的位置
            
            curl_setopt($ch,CURLOPT_SSLKEY,app_path('Library/Wxpay/cert/apiclient_key.pem')); //这个也是证书的位置
            
            curl_setopt($ch,CURLOPT_CAINFO,app_path('Library/Wxpay/cert/rootca.pem')); //这个也是证书的位置

            // curl_setopt($ch,CURLOPT_SSLCERT,WxPayConfig::SSCERT_PATH); //这个是证书的位置
            // $zs1 = getcwd()."../cert/apiclient_cert.pem";
            // $zs2 = getcwd()."../cert/apiclient_key.pem";
            // $zs3 = getcwd()."../cert/rootca.pem";
            // curl_setopt ( $ch, CURLOPT_SSLCERT, $zs1 );
            // curl_setopt ( $ch, CURLOPT_SSLKEY, $zs2 );
            // curl_setopt ( $ch, CURLOPT_CAINFO, $zs3 );



            $data = curl_exec($ch); //运行curl

            curl_close($ch);

            return $data;

        }

}