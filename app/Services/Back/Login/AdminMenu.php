<?php
namespace App\Services\Back\Login;

use App\Models\AdminList;
use App\Models\AdminSlist;

class AdminMenu
{
  public function Index() {

    $list = AdminList::get();

    #取出关联字段rela数组
    $rela = array_column($list->toArray(),'rela');

    $slist =  AdminSlist::whereIn('rela',$rela)->get();
    $slist =$slist->toArray();

    $arr = array();

    foreach ($list as $key => $value) {

      $slists = array();
      $tmp = $value['rela'];

      foreach ($slist as $v) {
          if ($tmp == $v['rela']) {
           $slists[] = $v;
        }
      }

      $arr[] = array('listname' => $value['name'],'icon' => $value['icon'],'slist' => $slists);

      unset($slists);

     }

     return  array(
       'status' => 'success',
       'content' =>  $arr
     );

  }
}
