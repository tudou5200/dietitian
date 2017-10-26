<?php
namespace App\Services\Back\Order;

use App\Models\Order;

Class OrderList
{
  public function Index($page,$status) {

    $limit=10;
    $skip = ($page - 1) * $limit;

    switch ($status) {
      case 0:
          $count = Order::count();
          $list = Order::skip($skip)->take($limit)->get();
        break;

      case 1:
          $count = Order::where('status',1)->count();
          $list = Order::where('status',1)->skip($skip)->take($limit)->get();
        break;

      case 2:
          $count = Order::where('status',2)->count();
          $list = Order::where('status',2)->skip($skip)->take($limit)->get();
        break;

      case 3:
          $count = Order::where('status',3)->count();
          $list = Order::where('status',3)->skip($skip)->take($limit)->get();
        break;

      case 4:
          $count = Order::where('status',4)->count();
          $list = Order::where('status',4)->skip($skip)->take($limit)->get();
        break;

      default:
          return array('status'=>'fail','msg'=>'status状态不对');
        break;
    }


    if ($list->toArray() == null) {
      return array(
         'status' => 'success',
         'list'=>'',
         'count'=>$count,
         );
    }

  
    return array(
      'status'  => 'success',
      'list'=>$list,
      'count'=>$count,
    );

  }
}
