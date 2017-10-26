<?php
namespace App\Services\Front\Mall;

use App\Services\BaseService;
use App\Models\MallOrder;
use App\Models\MallOrderDetail;
use App\Models\MallProduct;
use App\Models\UserXb;
use App\Models\UserAddress;
use App\Models\UserXbDetail;

class OrderAdd extends BaseService
{
	private $pd;
	private $uxb;

	public function index($token,$dtoken,$address_id,$xb_cash,$num,$desc)
	{
		$this->pd=MallProduct::where('dtoken',$dtoken)->lockForUpdate()->first();
		$this->uxb=UserXb::where('token',$token)->lockForUpdate()->first();

		switch (true) {
			case !$this->pd:
				$r=array('code'=>'5','msg'=>'商品不存在');
				break;
			case $this->pd->status!=1:
				$r=array('code'=>'5','msg'=>'商品已下架');
				break;
			case $this->pd->sell+$num>$this->pd->store:
				$r=array('code'=>'5','msg'=>'商品库存不足');
				break;
			case $xb_cash&&(empty($this->pd->xb)||empty($this->pd->xb)):
				$r=array('code'=>'5','msg'=>'商品不允许使用星币抵现');
				break;
			case $xb_cash&&(!$this->uxb||$this->uxb->sum<$this->pd->xb):
				$r=array('code'=>'5','msg'=>'用户星币不足');
				break;
			default:
				$orderno=$this->buildOrderNo();
				$r=$this->main($token,$dtoken,$orderno,$xb_cash,$num,$address_id,$desc);
				break;
		}
		return empty($r)?array('orderno'=>$orderno):$r;
	}
	private function main($token,$dtoken,$orderno,$xb_cash,$num,$address_id,$desc)
	{
		$address=UserAddress::where('token',$token)->where('id',$address_id)->first();
		if(!$address)
			return array('code'=>'5','msg'=>'用户地址不存在');

		$detail=new MallOrderDetail();
		$detail->orderno=$orderno;
		$detail->dtoken=$dtoken;
		$detail->pic=$this->pd->pic;
		$detail->name=$this->pd->name;
		// $detail->xb=$this->pd->xb;
		// $detail->xb_cash=$this->pd->xb_cash;
		// $detail->market=$this->pd->market;
		$detail->price=$this->pd->price;
		$detail->money=$this->pd->price*$num;
		$detail->pay_price=$xb_cash?$this->pd->price*$num-$this->pd->xb_cash:$this->pd->price*$num;
		$detail->num=$num;

		if(!$detail->save())
		{
			return array('code'=>'5','msg'=>'网络错误，请刷新后重试');
		}

		$order=new MallOrder();
		$order->orderno=$orderno;
		$order->token=$token;
		$order->totalprice=$detail->pay_price;
		$order->is_xb=$xb_cash?1:2;
		$order->name=$address->name;
		$order->mobile=$address->mobile;
		$order->province=$address->province;
		$order->county=$address->county;
		$order->city=$address->city;
		$order->detail=$address->detail;
		$order->status=1;
		$order->time=time();
		$order->desc=$desc;

		if($order->save())
		{
			$this->pd->sell=$this->pd->sell+$num;
			if($this->pd->save())
			{
				if($xb_cash)
				{
					$r=$this->delXb($token,$this->pd->xb,$orderno);
					if(empty($r))
					{
						return [];
					}
					else
					{
						$detail->delete();
						$order->delete();
						$this->pd->sell=$this->pd->sell-$num;
						$this->pd->save();
						return array('code'=>'5','msg'=>'网络错误，请刷新后重试');

					}
				}

				return [];
			}
			else
			{

				$detail->delete();
				$order->delete();
				return array('code'=>'5','msg'=>'网络错误，请刷新后重试');

			}
		}
		else
		{
			$detail->delete();
			return array('code'=>'5','msg'=>'网络错误，请刷新后重试'); 
		}


	}
	private function delXb($token,$xb,$orderno)
	{
		$ud=new UserXbDetail();
		$ud->token=$token;
		$ud->num=$xb;
		$ud->type=2;
		$ud->desc='用户支付'.$orderno;
		$ud->time=time();
		if($ud->save())
		{
			$this->uxb->out=$this->uxb->out+$xb;
			$this->uxb->sum=$this->uxb->sum-$xb;
			if($this->uxb->save())
			{
				return [];
			}
			else
			{
				
				$ud->delete();
				return array('code'=>'5','msg'=>'网络错误，请刷新后重试');
			}
		}
		return array('code'=>'5','msg'=>'网络错误，请刷新后重试'); 

		

	}
}