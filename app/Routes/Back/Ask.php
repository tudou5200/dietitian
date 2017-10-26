<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Ask{

    public function map(Registrar $router)
    {
        #圈子路由
        Route::group(['prefix' => 'back/ask', 'namespace' => 'Back\Ask'], function() {

            #分答列表
            Route::any('list','AskController@list');

            #分答删除
            Route::any('del','AskController@del'); 

            #分答删除
            Route::any('edits','AskController@edits');
			
			#意见反馈管理
			Route::any('ticklist','AskController@ticklist');

			#问题重置
			Route::any('resets','AskController@Resets');
			
			#阿里百川-添加用户  测试
			Route::any('adduser','AskController@adduser');
			
			#阿里百川-给用户发送消息  测试
			Route::any('pushmessage','AskController@pushmessage');
			
			#阿里百川-查询两个人的聊天记录  测试
			Route::any('messagelist','AskController@messagelist');
        });
    }
}
