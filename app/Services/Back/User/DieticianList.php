<?php
namespace App\Services\Back\User;

use App\Models\Users;
use App\Models\UserInfo;

Class DieticianList
{
  public function Index($pageSize,$page){

    $skip = ($page - 1) * $pageSize;
    $count = Users::where('type','=',3)->count();
    $list = Users::skip($skip)->take($pageSize)->where('type','=',3)->orderBy('id', 'desc')->get();
    
    if ($list->toArray() == null) {
      return array(
         'status' => 'success',
         'content'=>array('sumpage'=>0),
         );
    }
    $user_info = UserInfo::whereIn('token',array_column($list->toArray(),'token') )->get();
    $user_info = array_column($user_info->toArray(),Null,'token');

    foreach ($list as $key => &$value) {
      if( in_array($value['token'],array_keys($user_info) ) ){
        $value['user_name'] = $user_info[$value['token']] ? $user_info[$value['token']]['user_name'] : "";
        $value['user_img'] = $user_info[$value['token']] ? $user_info[$value['token']]['user_img'] : "";
      }else{
        $value['user_name'] = "";
        $value['user_img'] = "";
      }
      
    }
    return array(
      'status'  => 'success',
      'content' => array(
          'con'=> $list,
          'sumpage'=> ceil($count/$pageSize) ,
          'page' => (int)$page
        )
    );
  }
}
