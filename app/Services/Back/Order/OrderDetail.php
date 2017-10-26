<?php
namespace App\Services\Back\Order;

use App\Models\MallOrder;
use App\Models\MallOrderDetail;

Class OrderDetail
{
  public function Index($orderno){
    $order = MallOrder::where('orderno',$orderno)
                        ->select('orderno','delivery','delivery_no','totalprice','name','status','mobile','province','county','city','detail','time','desc')
                        ->first();
    if (!$order) {
      return array('status' => 'fail','msg' => 'order表没有此订单编号');
    }

    $orderdetail = MallOrderDetail::where('orderno',$orderno)->get();
    if (!$orderdetail) {
      return array('status' => 'fail','msg' => 'orderdetail表没有此订单编号');
    }

    $order = $order->toArray();
    $order['time'] = date("Y-m-d",$order['time']);

    $orderdetail = $orderdetail->toArray();

    $order['detaillist'] = $orderdetail;

    return array(
      'status' => 'success',
      'content' => $order
    );

  }
}
