<?php
namespace App\Services\Back\Order;

use App\Models\MallOrder;

use App\Services\BaseService;

class OrderEdit extends BaseService
{
  public function Index($data) {

    $order = MallOrder::where('orderno',$data['orderno'])->first();
    if (!$order) {
      return array(
        'status' => 'fail',
        'msg' => '此数据已不存在或被删除',
        );
    }

    $name = empty($data['name']) ? $order->name : $this->trimAll($data['name']);
    $province = empty($data['province']) ? $order->province : $this->trimAll($data['province']);
    $county = empty($data['county']) ? $order->county : $this->trimAll($data['county']);
    $city = empty($data['city']) ? $order->city : $this->trimAll($data['city']);
    $detail = empty($data['detail']) ? $order->detail : $this->trimAll($data['detail']);
    $mobile = empty($data['mobile']) ? $order->detail : $this->trimAll($data['mobile']);

    $order->name = $name;
    $order->province = $province;
    $order->county = $county;
    $order->city = $city;
    $order->detail = $detail;
    $order->mobile = $mobile;


    if ($order->save()) {
      return array(
        'status' => 'success'
      );
    } else {
      return array(
        'status' => 'fail',
        'msg' => '更改失败！'
      );
    }

  }
}
