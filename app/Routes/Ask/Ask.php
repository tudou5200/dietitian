<?php

namespace App\Routes\Ask;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Ask{

    public function map(Registrar $router)
    {

       Route::group(['prefix' => 'ask', 'namespace' => 'Ask'], function() {

        	#分答列表
          Route::any('list','AskController@list');

          #分答列表
       		Route::any('index','AskController@index');

       		#分答详情
       		Route::any('detail','AskController@detail');

       		#分答提问(营养咨询)
          Route::any('asker','AskController@asker');

          #分答问题(营养师咨询)
          Route::any('askdeit','AskController@askdeit');

          #回答问题
          Route::any('answerer','AskController@answerer');  


          #回答问题
          Route::any('zhiwen','AskController@zhiwen'); 

          #回答问题
          Route::any('askedits','AskController@askedits'); 

          #问题偷听
          Route::any('eavesdrop','AskController@eavesdrop'); 

          #个人中心 我的偷听
          Route::any('mine','AskController@mine');

          #个人中心 我的提问
          Route::any('quiz','AskController@quiz');  

          #营养师中心 我的回答
          Route::any('response','AskController@response');

          #营养师中心 提问抢答
          Route::any('answer','AskController@answer');

          #营养师咨询详情 
          Route::any('info','AskController@info'); 

          #未支付 删除订单
          Route::any('askdel','AskController@askdel'); 

          #未支付 删除偷听
          Route::any('askorderdel','AskController@askorderdel'); 

          #营养师分答 
          Route::any('dietfendas','AskController@dietfendas');  

          #jssdk 
          Route::any('jssdkask','AskController@jssdkask'); 

         

          #服务聊天内容添加 （用户角度）
          Route::any('askedit','AskController@askedit'); 

          #服务聊天内容获取（用户角度）
          Route::any('askcontent','AskController@askcontent'); 

          #个人中心聊天列表
          Route::any('asklist','AskController@asklist');

          #个人中心聊天内容获取（用户角度）
          Route::any('askcontents','AskController@askcontents'); 

          #个人中心聊天进行聊天（用户角度）
          Route::any('askedits','AskController@askedits'); 

          #语音下载
          Route::any('voice','AskController@voice');

          #语音下载（重新回答）
          Route::any('voiceresets','AskController@voiceResets'); 

          #语音判断
          Route::any('voicejudge','AskController@voicejudge');


          #jssdk单图片下载
          Route::any('picture','AskController@picture');
          #jssdk多图片下载
          Route::any('pictures','AskController@pictures');

          #七牛转码
          Route::any('qiniu','AskController@Qiniu'); 
          #模板消息
          Route::any('mbxx','AskController@Mbxx');

          #给用户推送
          Route::any('userts','AskController@userTS');


         

          #支付  统一订单
          Route::any('WxpayAction','WxpayController@payAction');
          #支付  支付确认
          Route::any('WxbackAction','WxpayController@backAction'); 
          #支付  付款确认
          Route::any('WxcallbackAction','WxpayController@callbackAction'); 


          #支付  统一订单
          Route::any('WxpaysAction','WxpaysController@payAction');
          #支付  支付确认
          Route::any('WxbacksAction','WxpaysController@backAction'); 
          #支付  付款确认
          Route::any('WxcallbacksAction','WxpaysController@callbackAction'); 
          #支付  付款确认
          Route::any('dmbxx','WxpaysController@Dmbxx');
        });
    }
}