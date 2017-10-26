<?php
namespace App\Services\Back\User;

use App\Models\Users;
use App\Models\UserInfo;

Class UserDetail
{
  public function Index($token){
    $list = Users::where('token','=',$token)->where('type','=',2)->first();
    if (!$list) {
      return array(
         'status' => 'fail',
         'msg' => '没有此用户数据或已被删除'
         );
    }
    $user_info = UserInfo::where('token',$token)->first();

    if($user_info){
      $list->user_name = $user_info->user_name;
      $list->user_img = $user_info->user_img;
    }else{
      $list->user_name = "";
      $list->user_img = "";
    }
    

    return array(
      'status'  => 'success',
      'content' => $list
    );


  }
}
