<?php
namespace App\Helpers;
require_once('php_sdk/mns-autoloader.php');
use AliyunMNS\Client;
use AliyunMNS\Topic;
use AliyunMNS\Constants;
use AliyunMNS\Model\MailAttributes;
use AliyunMNS\Model\SmsAttributes;
use AliyunMNS\Model\BatchSmsAttributes;
use AliyunMNS\Model\MessageAttributes;
use AliyunMNS\Exception\MnsException;
use AliyunMNS\Requests\PublishMessageRequest;
class PublishBatchSMSMessageDemo
{
    public function run($Number,$value)
    {
        /**
         * Step 1. 初始化Client
         */
   
        $this->endPoint = "https://1545283478780164.mns.cn-beijing.aliyuncs.com/"; 
        $this->accessId = "LTAIJzH2WhWj77D1";
        $this->accessKey = "oJ49KolmksOFg1A0fw4KGNPDZMKhNR";
        $this->client = new Client($this->endPoint, $this->accessId, $this->accessKey);
        /**
         * Step 2. 获取主题引用
         */
        $topicName = "topic-cn-beijing";
        $topic = $this->client->getTopicRef($topicName);
        /**
         * Step 3. 生成SMS消息属性
         */
        $SignName     = '爱样营养师';//签名
        $TemplateCode = 'SMS_66525206';//模板
        // 3.1 设置发送短信的签名（SMSSignName）和模板（SMSTemplateCode）
        $batchSmsAttributes = new BatchSmsAttributes($SignName ,$TemplateCode);
        // 3.2 （如果在短信模板中定义了参数）指定短信模板中对应参数的值
        $batchSmsAttributes->addReceiver($Number, array("code" => $value));
        $messageAttributes = new MessageAttributes(array($batchSmsAttributes));
        /**
         * Step 4. 设置SMS消息体（必须）
         *
         * 注：目前暂时不支持消息内容为空，需要指定消息内容，不为空即可。
         */
        $messageBody = "smsmessage";
        /**
         * Step 5. 发布SMS消息
         */
        $request = new PublishMessageRequest($messageBody, $messageAttributes);
        try
        {
            $res = $topic->publishMessage($request);
            $data = $res->isSucceed();
            // $data['getMessageId'] = $res->getMessageId();
      
            return $data;
        }
        catch (MnsException $e)
        {
            return $e;
  
        }
    }
}
?>