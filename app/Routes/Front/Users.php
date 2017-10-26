<?php

namespace App\Routes\Front;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Users{

    public function map(Registrar $router) 
    {
       #我的中心路由路由
       Route::group(['prefix' => 'front/users', 'namespace' => 'Front\Users'], function() 
       {
        #//授权进入找营养师界面,判断是否关注公众号
          Route::any('pan','UsersController@pan');
        	#我的判断 是否是营养师
          Route::any('judge','UsersController@Judge');

          #支付前判断 是否是会员用户
          Route::any('touser','UsersController@touser');

          #发送验证码
          Route::any('usercode','UsersController@usercode');

           #发送验证码
          Route::any('duanxin','UsersController@duanxin');

          #注册登录
       		Route::any('register','UsersController@register');

          #个人中心 金额
          Route::any('userinfo','UsersController@userinfo');

          #个人中心 修改头像
          Route::any('userimg','UsersController@userimg');

          #个人中心 账户金额 
          Route::any('userprice','UsersController@userprice');

          #个人中心 营养申请提现 
          Route::any('withdrawal','UsersController@withdrawal');  

          #个人中心 佣金申请提现 
          Route::any('commmwithdrawal','UsersController@commmwithdrawal');

          #个人中心 用户反馈
          Route::any('tickling','UsersController@tickling');

          #个人中心/营养师中心  new与判断
          Route::any('usernews','UsersController@usersnews');  

          #个人中心 我是代言人
          Route::any('spokesman','UsersController@spokesmanCode');

          #个人中心 我的收益
          Route::any('commissionList','UsersController@commissionList');

          #个人中心 绑定代言人
          Route::any('bindSpokesman','UsersController@bindSpokesman');

          #个人中心 代言人邀请列表
          Route::any('spokesmanUsers','UsersController@spokesmanUsers');

          #微信二级分销推送图片
          Route::any('sendCode','UsersController@sendCode');

          


##以下接口为测试接口
          
          #test测试
          Route::any('makecode','UsersController@makecode');
          #test测试
          Route::any('tests','UsersController@tests');
       		
        });
    }
}