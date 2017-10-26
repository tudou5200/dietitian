<?php

/**
  *@author 
  *@version 
  *@brief 商城
**/

namespace App\Routes\Front;
use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Mall{

    public function map(Registrar $router) {
       #商城路由  
       Route::group(['prefix' => 'front/mall', 'namespace' => 'Front\Mall'], function() {
          #测试1
       	  Route::any('test','TestController@index');	
          #测试
          Route::any('tests','TestController@test2');  
          #测试2		     
       	  Route::any('test2','TestController@main');	

          #测试3         
          Route::any('goodslist2','Test2Controller@goodslist');

          #首页
       	  Route::any('index','IndexController@index');	
          #商品分类
          Route::any('category','CategoryController@index');	 
          #商品详情 
          Route::any('goodsinfo','GoodsController@goodsinfo');		
          #商品列表
          Route::any('goodslist','GoodsController@goodslist');

		  #关注商品
          Route::any('addfollowgoods','GoodsController@addfollowgoods');
		  
		  #取消关注商品
          Route::any('delfollowgoods','GoodsController@delfollowgoods');
		  
		  #我的关注商品列表
          Route::any('myfollowgoodslist','GoodsController@myfollowgoodslist');
		  
		  
		  #关注营养师
          Route::any('addfollowdiet','GoodsController@addfollowdiet');
		  
		  #取消关注营养师
          Route::any('delfollowdiet','GoodsController@delfollowdiet');
		  
		  #我的关注营养师列表
          Route::any('myfollowdeitlist','GoodsController@myfollowdeitlist');
		  
		  

          #用户订单列表
          Route::any('userorderlist','UsersorderController@orderlist'); 
          #用户订单详情
          Route::any('userorderdetail','UsersorderController@orderdetail'); 

          #购物车 列表  
          Route::any('cartlist','CartController@cartlist');    
          #购物车 添加
          Route::any('cartadd','CartController@cartadd');		
          #购物车 商品数量减少 
          Route::any('number','CartController@number');    
          #购物车 清理单件商品
          Route::any('clearone','CartController@clearone');  
          #购物车 清理所有商品
          Route::any('clearall','CartController@clearall'); 

          #订单确认
          Route::any('orderque','OrderController@que');   	

          #订单确认
          Route::any('orderlist','OrderController@lists');  
          #订单生成
          Route::any('orderadds','OrderController@adds'); 
          #订单取消
          Route::any('orderqu','OrderController@qu');   
          

          #收货人添加
          Route::any('Addreadd','AddressController@adds');  
          #收件人修改    
          Route::any('Addresave','AddressController@saves');
          #收件人删除      
          Route::any('Addredelete','AddressController@delete');   
          #收件人列表   
          Route::any('Addrelist','AddressController@list');   
          #单个收件人
          Route::any('Addrefind','AddressController@find'); 
          #设置默认收货地址
          
          Route::any('Addresetmain','AddressController@setmain');  

          #支付  统一订单
          Route::any('WxpayAction','WxpayController@payAction');
          #支付  支付确认
          Route::any('WxbackAction','WxpayController@backAction'); 
          #支付  付款确认
          Route::any('WxcallbackAction','WxpayController@callbackAction'); 
          #支付  付款确认
          Route::any('Wxpayindex','WxpayController@index');   

          
          #支付   退款
          Route::any('wxrefund','WxrefundController@index'); 




          #拼团商品详情
          Route::any('ggoodsinfo','GroupController@goodsinfo'); 
          ##一键开团###
          #开团订单展示
          Route::any('glists','GroupController@lists'); 
          #开团订单生成
          Route::any('gadds','GroupController@adds'); 
          #开团统一下单
          Route::any('gpayAction','WxpaygroupController@payAction'); 
          #开团支付
          Route::any('gcallbackAction','WxpaygroupController@callbackAction'); 

          ##一键参团###
          #正在开团列表
          Route::any('gulist','GroupController@ulist'); 
          #参团订单展示
          Route::any('gclists','GroupController@clists'); 
        });
    }
}