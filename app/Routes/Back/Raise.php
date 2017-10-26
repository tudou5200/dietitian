<?php

namespace App\Routes\Back;

use Illuminate\Support\Facades\Route;
use Illuminate\Contracts\Routing\Registrar;

class Raise{

    public function map(Registrar $router)
    {
       Route::group(['prefix' => 'back/raise', 'namespace' => 'Back\Raise'], function() {

          	#众筹列表
         	Route::any('list','RaiseController@List');
         	#支持列表
         	Route::any('userlist','RaiseController@UserList');
         	#分档列表
         	Route::any('moneylist','RaiseController@MoneyList');

         	#图片列表
         	Route::any('imglist','RaiseController@ImgList');

         	#众筹详情
         	Route::any('detail','RaiseController@Detail');
         	#支持详情
         	Route::any('userdetail','RaiseController@UserDetail');
         	#分档详情
         	Route::any('moneydetail','RaiseController@MoneyDetail');


         	#众筹编辑
         	Route::any('edit','RaiseController@Edit');
         	#支持编辑
         	Route::any('useredit','RaiseController@UserEdit');
         	#分档编辑
         	Route::any('moneyedit','RaiseController@MoneyEdit');
            

         	#众筹删除
         	Route::any('deletes','RaiseController@Deletes');
         	#支持删除
         	Route::any('userdeletes','RaiseController@UserDeletes');
         	#分档删除
         	Route::any('moneydeletes','RaiseController@MoneyDeletes');
        });
    }
}
