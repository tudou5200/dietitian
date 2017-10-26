<?php

/**
  *@author 
  *@version 
  *@brief 营养师
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Diet{

 	public function map(Registrar $router) {
    #营养师路由 
 		Route::group(['prefix' => 'front/diet', 'namespace' => 'Front\Diet'], function() {
 		     	
          #测试2
       	  Route::any('test2','Test2Controller@index');

          #上传图片
          Route::any('Updateimg','UpdateimgController@index');

          #上传图片2
          Route::any('Updateimgs','UpdateimgController@indexs');


          #上传图片2
          Route::any('Updateimgd','UpdateimgController@indexd');
          
          #营养师 首页
          Route::any('indexx','DietorderController@indexx');

  	   	  #营养师 列表
  	   	  Route::any('dlists','DietorderController@dlists');

  	   	  #营养师 评论
  	      Route::any('dcomment','DietorderController@dcomment');
          
  	   	  #营养师 详情
          Route::any('detail','DietorderController@detail');

          #营养师 服务订单列表
       	  Route::any('orderlist','DietorderController@orderlist');

          #营养师 服务生成订单
          Route::any('adds','DietorderController@adds');

          #营养师 入驻
          Route::any('enter','DietorderController@enter');
			
    		  #营养师 关注
    		  Route::any('addfollowdiet','DietorderController@addfollowdiet');

    		  #营养师 取消关注
    		  Route::any('delfollowdiet','DietorderController@delfollowdiet');
    		  
    		  #营养师 我的关注列表
    		  Route::any('myfollowdeitlist','DietorderController@myfollowdeitlist');
          


          #支付  统一订单
          Route::any('WxpayAction','WxpayController@payAction');
          #支付  支付确认
          Route::any('WxbackAction','WxpayController@backAction'); 
          #支付  付款确认
          Route::any('WxcallbackAction','WxpayController@callbackAction'); 
          #支付  付款确认
          Route::any('Wxpayindex','WxpayController@index');   

          	    
          #营养师(用户) 我的咨询
          Route::any('zxlist','DietorderController@Zxlist');

          #营养师 服务订单删除
          Route::any('qu','DietorderController@qu');

          #营养师 服务订单列表(用户个人中心用)
          Route::any('plist','DietorderController@PList');
          
          #营养师 服务订单列表(用户个人中心用)
          Route::any('pdetail','DietorderController@PDetail');

          #营养师 服务订单列表(营养师个人中心用)
          Route::any('dplist','DietorderController@dPList');
          
          #营养师 服务订单列表(营养师个人中心用)
          Route::any('dpdetail','DietorderController@dPDetail');

          #营养师入驻展示的擅长领域和细分领域信息(个人中心用)
          Route::any('enter','DietorderController@enter');
          
          #营养师入驻(个人中心用)
          Route::any('enteradd','DietorderController@enterAdd'); 

          #点击营养师入驻判断
          Route::any('judge','DietorderController@judge');

          //测试
          Route::any('voice','DietorderController@voice');
 		});
 	}
}