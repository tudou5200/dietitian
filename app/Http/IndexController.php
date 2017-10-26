<?php

namespace App\Http\Wx;

use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;



class IndexController extends BaseController 
{
    
    //分发服务
    public function index(Request $request)
    {
       
      $echoStr = $request->input('echostr');

      if($echoStr) 
      {

        $signature = $request->input('signature');
        $timestamp = $request->input('timestamp');
        $nonce     = $request->input('nonce');
        $r = $this->checkSignature($signature,$timestamp,$nonce)?$echoStr:'';
      }
      else
      {

        $postStr = $request->getContent();
        //微信事件推送
        $r=$this->responseMsg($postStr);

      }

      echo $r;
      exit(); 
    } 
    //服务器验证
    private function checkSignature($signature,$timestamp,$nonce)
    {

        $token = config('wx.token');
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }

    private function responseMsg($postStr)
    {
        if (!empty($postStr)){
            $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
            $RX_TYPE = trim($postObj->MsgType);

            switch ($RX_TYPE)
            {
                case "event":
                    $resultStr = $this->receiveEvent($postObj);
                    break;
                case "text":
                    $resultStr = $this->receiveText($postObj);
                    break;
        
                default:
                    $resultStr = $this->transmitService($postObj);
                    break;
            }
            return  $resultStr;
        }else {
            return  "";
        }
    }
    private function transmitService($object)
    {
        $xmlTpl = "<xml>
            <ToUserName><![CDATA[%s]]></ToUserName>
            <FromUserName><![CDATA[%s]]></FromUserName>
            <CreateTime>%s</CreateTime>
            <MsgType><![CDATA[transfer_customer_service]]></MsgType>
            </xml>";
        $result = sprintf($xmlTpl, $object->FromUserName, $object->ToUserName, time());
        return $result;
    }

    private function receiveEvent($object)
    {
        $contentStr = "";
        switch ($object->Event)
        {
            //关注公众号
            case "subscribe":                
                $contentStr = "~欢迎关注爱样~\n这里汇聚国内外顶级权威营养师爱样专注于孕期、产期、婴幼儿等各人群的营养饮食调理，定制配餐方案。";
                break;
            case "unsubscribe":
                break;
            case "CLICK":
                break;
            default:
                  $contentStr = "欢迎您关注寿眉营养师'\n'";
                break;      
        }

        if (is_array($contentStr)){
            $resultStr = $this->transmitNews($object, $contentStr);
        }else{
            $resultStr = $this->transmitText($object, $contentStr);
        }
        return $resultStr;
    }
    private function transmitNews($object, $arr_item, $funcFlag = 0)
    {
        //首条标题28字，其他标题39字
        if(!is_array($arr_item))
            return;

        $itemTpl = "    <item>
                            <Title><![CDATA[%s]]></Title>
                            <Description><![CDATA[%s]]></Description>
                            <PicUrl><![CDATA[%s]]></PicUrl>
                            <Url><![CDATA[%s]]></Url>
                        </item>
                    ";
        $item_str = "";
        foreach ($arr_item as $item)
            $item_str .= sprintf($itemTpl, $item['Title'], $item['Description'], $item['PicUrl'], $item['Url']);

        $newsTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[news]]></MsgType>
                    <Content><![CDATA[]]></Content>
                    <ArticleCount>%s</ArticleCount>
                    <Articles>
                    $item_str</Articles>
                    <FuncFlag>%s</FuncFlag>
                    </xml>";

        $resultStr = sprintf($newsTpl, $object->FromUserName, $object->ToUserName, time(), count($arr_item), $funcFlag);
        return $resultStr;
    }
    private function transmitText($object, $content, $funcFlag = 0)
    {
      $textTpl = "<xml>
                  <ToUserName><![CDATA[%s]]></ToUserName>
                  <FromUserName><![CDATA[%s]]></FromUserName>
                  <CreateTime>%s</CreateTime>
                  <MsgType><![CDATA[%s]]></MsgType>
                  <Content><![CDATA[%s]]></Content>
                  <FuncFlag>%d</FuncFlag>
                  </xml>";  
        $resultStr = sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(),"text", $content, $funcFlag);
        return $resultStr;
    }


        //文本处理函数
    private function receiveText($object)
    {
        // if($object->Content){
        // //文本消息  用户发来的文本
        //     $con=$object->Content;
        // }else{
        //     //文本消息  用户发来的文本
        //     $con=$object->Recognition;
        // }
        $con=trim($object->Content);
        if($con==1){
             $contentStr="爱样商城1";
            $resultStr = $this->transmitText($object, $contentStr);
       
        }elseif($con==2){
            $contentStr="爱样商城2";
            $resultStr = $this->transmitText($object, $contentStr);
        }
         return $resultStr;
    }
  
}