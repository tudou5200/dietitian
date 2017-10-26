<?php

namespace App\Http\Wx;

use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\Users;
use App\Models\Dietinfo;



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
                     $openid=$object->FromUserName;
                    $user=Users::where('openid',$openid)->first();
                    if($user){
                        $user->subscribe=1;
                        $user->save();
                        if($user['type']==3){
                            $dietinfo=Dietinfo::where('token',$user['token'])->first();
                            $dietinfo->subscribe=1;
                            $dietinfo->save();
                        }
                    }
            // if($object->EventKey=='qrscene_123'){
            //       $contentStr = "欢迎您关注寿眉营养师\n";
            // }else{
          
                $url1='<a href="http://wx.shoumeikeji.cn/diet/index.html">点击>>找营养师</a>';
                $url2='<a href="http://wx.shoumeikeji.cn/mall/indexs.html">点击>>优选商城</a>';
                $url3='<a href="http://wx.shoumeikeji.cn/user/zenterbefore.html">点击>>营养师入驻</a>';
                $url4='<a href="http://wx.shoumeikeji.cn/diet/baike.html">点击>>营养知识</a>';
                // $contentStr ="/:,@-D/:,@-D ~欢迎关注爱样~ /:,@-D/:,@-D\n这里汇聚国内外顶级权威营养师。/调皮\n爱样专注于孕期反应、孕期营养、产后肥胖、月子营养、婴幼儿辅食添加、一对一营养师服务等各人群的营养饮食调理，定制配餐方案。"
                $contentStr ='欢迎关注爱样'."\n\n".'这里汇聚国内外顶级权威营养师，'."\n".'专注于孕期营养、孕期反应、产后'."\n".'肥胖、月子营养、宝宝的吃喝拉'."\n".'撒、生长发育等等。为各人群提供'."\n".'一对一营养师服务'."\n\n".'除了在下方菜单中查找您感兴趣的'."\n".'内容及服务外，您还可以点击下方'."\n".'蓝色字体快速找到服务入口哦~'."\n\n".'【营养咨询】'.$url1.''."\n\n".'【我要购物】'.$url2."\n\n".'【我是营养师】'.$url3."\n\n".'【看营养资讯】'.$url4;

            // }
                //  switch ($object->EventKey)
                // {
                //         case 'subscribe':
                //             $contentStr = "欢迎您关注寿眉营养师'\n'";
                //             break;
                //         default:
                //             $url1='<a href="http://wx.shoumeikeji.cn/diet/index.html">点击>>找营养师</a>';
                //             $url2='<a href="http://wx.shoumeikeji.cn/mall/indexs.html">点击>>优选商城</a>';
                //             $url3='<a href="http://wx.shoumeikeji.cn/user/zenterbefore.html">点击>>营养师入驻</a>';
                //             $url4='<a href="http://wx.shoumeikeji.cn/diet/baike.html">点击>>营养知识</a>';
                //             // $contentStr ="/:,@-D/:,@-D ~欢迎关注爱样~ /:,@-D/:,@-D\n这里汇聚国内外顶级权威营养师。/调皮\n爱样专注于孕期反应、孕期营养、产后肥胖、月子营养、婴幼儿辅食添加、一对一营养师服务等各人群的营养饮食调理，定制配餐方案。"
                //             $contentStr ='欢迎关注爱样'."\n\n".'这里汇聚国内外顶级权威营养师，'."\n".'专注于孕期营养、孕期反应、产后'."\n".'肥胖、月子营养、宝宝的吃喝拉'."\n".'撒、生长发育等等。为各人群提供'."\n".'一对一营养师服务'."\n\n".'除了在下方菜单中查找您感兴趣的'."\n".'内容及服务外，您还可以点击下方'."\n".'蓝色字体快速找到服务入口哦~'."\n\n".'【营养咨询】'.$url1.''."\n\n".'【我要购物】'.$url2."\n\n".'【我是营养师】'.$url3."\n\n".'【看营养资讯】'.$url4;

                // // $contentStr ='欢迎关注爱样'."\n\n".'这里汇聚国内外顶级权威营养师，'."\n".'专注于孕期营养、孕期反应、产后'."\n".'肥胖、月子营养、宝宝的吃喝拉'."\n".'撒、生长发育等等。为各人群提供'."\n".'一对一营养师服务'."\n\n".'除了在下方菜单中查找您感兴趣的'."\n".'内容及服务外，您还可以点击下方'."\n".'蓝色字体快速找到服务入口哦~'."\n\n".'【营养咨询】'."\n".$url1.''."\n".'【我要购物】'."\n" .$url2."\n".'【我是营养师】'."\n".$url3."\n".'【看营养资讯】'."\n".$url4;
                // // $contentStr ="<a href='http://wx.shoumeikeji.cn/user/zanswer.html?asktoken=$asktoken&token=$token'>123</a>";
                //             break; 
                  
                    
                // }   
               
                break;
            case "unsubscribe":
                    $openid=$object->FromUserName;
                    $user=Users::where('openid',$openid)->first();
                    if($user){
                        $user->subscribe=0;
                        $user->save();
                        if($user['type']==3){
                            $dietinfo=Dietinfo::where('token',$user['token'])->first();
                            $dietinfo->subscribe=0;
                            $dietinfo->save();
                        }
                    }
                    
                break;
            // case "SCAN":
            //         $is_first = 1;
            //         $contentStr=$is_first;
            //     break;
            case "CLICK":
                    //自定义菜单按钮
                    switch ($object->EventKey) 
                    {
                        case 'zhuanlan':
                            $content = "Tqrrquq1pppFMmLpBMfa-lt7qqR2wjxpP1vMJfV2f3UIJCbBOMdyha5sXWCy4zqu";
                            $resultStr = $this->transmitImg($object, $content);
                            return $resultStr;
                            break;
                    }               
                break;
            default:
                  $contentStr = "欢迎您关注爱样营养师'\n'";
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

        $itemTpl = "<item>
                    <Title><![CDATA[%s]]></Title>
                    <Description><![CDATA[%s]]></Description>
                    <PicUrl><![CDATA[%s]]></PicUrl>
                    <Url><![CDATA[%s]]></Url>
                    </item>";
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

    //文本回复
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

    //图片回复
    private function transmitImg($object, $content)
    {  
        $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Image>
                    <MediaId><![CDATA[%s]]></MediaId>
                    </Image>
                    </xml>";
        $resultStr = sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(), "image", $content);
        return $resultStr;
    }

    //文本处理函数
    private function receiveText($object)
    {
        $con=$object->Recognition;
        // }
        $con=trim($object->Content);
        if($con==1){
             $contentStr="爱样商城1";
            $resultStr = $this->transmitText($object, $contentStr);
       
        }elseif($con==2){
            $contentStr="爱样商城2";
            $resultStr = $this->transmitText($object, $contentStr);
        }elseif($con==3){
            $contentStr=array(
                            array( 'Title'=>'爱样',
                                    'Description'=>'爱你的样子',
                                    'PicUrl'=>'http://api.shoumeikeji.cn/a.jpg',
                                    'Url'=>'http://wx.shoumeikeji.cn/user/zaskdetails.html?asktoken=Ask201706291454240#',
                                    ),
                            array( 'Title'=>'爱样',
                                    'Description'=>'爱你的样子',
                                    'PicUrl'=>'http://api.shoumeikeji.cn/a.jpg',
                                    'Url'=>'http://api.shoumeikeji.cn/front/users/sendCode?token=07da4cf5298d41d0bf6ef951846b5c80806248f5',
                                    ),
                            array( 'Title'=>'爱样',
                                    'Description'=>'爱你的样子',
                                    'PicUrl'=>'http://api.shoumeikeji.cn/a.jpg',
                                    'Url'=>'http://api.shoumeikeji.cn/front/users/makecode?token=07da4cf5298d41d0bf6ef951846b5c80806248f5',
                                    ),
                        
                 
                        );

             $resultStr = $this->transmitNews($object, $contentStr);
            // $resultStr = $this->transmitText($object, $contentStr);
        }else{
            // $contentStr="亲亲，小爱已经收到您的留言啦 \n\n关于营养的咨询问题，请您 点击>>找营养师\n如果您想订购营养餐或者购买孕育用品，请您点击>>优选商城\n如果您想订阅更多关于母婴的营养咨询，请您关注微信公众号【爱样母婴营养师】";

            $url1='<a href="http://wx.shoumeikeji.cn/diet/index.html">点击>>找营养师</a>';
            $url2='<a href="http://wx.shoumeikeji.cn/mall/indexs.html">点击>>优选商城</a>';
            $url3='<a href="http://wx.shoumeikeji.cn/user/zenterbefore.html">点击>>营养师入驻</a>';
            $url4='<a href="http://wx.shoumeikeji.cn/diet/baike.html">点击>>营养知识</a>';

            $contentStr ='亲亲，小爱已经收到您的留言啦'."\n\n".'关于营养的咨询问题，请您'."\n".$url1.''."\n".'如果您想要成为营养师，请您'."\n".$url3."\n".'如果您想看营养资讯，请您'."\n".$url4."\n".'如果您想订购营养餐或者购买孕育用品，请您'."\n" .$url2."\n".'如果您想订阅更多关于母婴的营养咨询，请您关注微信公众号'."\n".'【爱样母婴营养师】';
            $resultStr = $this->transmitText($object, $contentStr);
        }
         return $resultStr;
    }
  
}