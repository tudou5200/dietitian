<?php
namespace App\Services\Back\Order;

use App\Models\MallOrder;

use App\Services\BaseService;

class SendGoods extends BaseService
{
  public function Index($data) {

    $order = MallOrder::where('orderno',$data['orderno'])->first();
    if (!$order) {
      return array(
        'status' => 'fail',
        'msg' => '此数据已不存在或被删除',
        );
    }


    $order->delivery = $this->trimAll($data['delivery']);
    $order->delivery_no = $this->trimAll($data['deliveryno']);



    if ($order->save()) {
      return array(
        'status' => 'success'
      );
    } else {
      return array(
        'status' => 'fail',
        'msg' => '添加物流失败！'
      );
    }

  }
}
