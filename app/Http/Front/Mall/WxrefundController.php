<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Goods;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Refund;
use App\Models\RefundDetail;
use App\Models\Dietorder;
use App\Models\Dietorderdetail;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
class WxrefundController extends BaseController
{

	#退款
	public function index(Request $request)
	{

			if($this->verCode($request->all(),[
	            'order_sn'     =>'required',
	        ])){
	            return $this->publicparaResponse();
	        }

	        $order_sn = $request->input('order_sn');
	        $GoodsModel = Goods::select('id','sell','store','name','dtoken','img','price')->get();//测试
	        $Order = Order::where('order_sn',$order_sn)->first();
			$OrderDetail = OrderDetail::where('order_sn',$order_sn)->get();
			//$_REQUEST["out_trade_no"]= "122531270220150304194108";
			///$_REQUEST["total_fee"]= "1";
			//$_REQUEST["refund_fee"] = "1";
			if(isset($Order) && $Order != ""){
				require_once app_path('Library/Wxpay/lib/WxPay.Api.php');
            	require_once app_path("Library/Wxpay/example/WxPay.JsApiPay.php");
            	require_once app_path("Library/Wxpay/example/log.php");
				$out_trade_no = $Order['order_sn'];
				$total_fee  = $Order["totalprice"];
				$refund_fee = $Order["totalprice"];
				$input = new \WxPayRefund();
				$input->SetOut_trade_no($out_trade_no);
				$input->SetTotal_fee($total_fee);
				$input->SetRefund_fee($refund_fee);
			    $input->SetOut_refund_no(\WxPayConfig::MCHID.date("YmdHis"));
			    $input->SetOp_user_id(\WxPayConfig::MCHID);
				$data = \WxPayApi::refund($input);

				if($data){
					foreach ($OrderDetail as $key => $value) {
						
							$RefundDetail = new RefundDetail();
							$RefundDetail->order_sn = $value['order_sn'];
							$RefundDetail->dtoken 	= $value['dtoken'];
							$RefundDetail->num  	= $value["num"];
							$RefundDetail->img 		= $value['img'];
							$RefundDetail->name 	= $value['name'];
							$RefundDetail->each_price = $value['each_price'];
							$RefundDetail->total 	= $value['total'];
							if($RefundDetail->save()){
							 	$value->delete();
							}
											
					}
					#
					$Refund = new Refund();
					$Refund->order_sn 	= $Order['order_sn'];
					$Refund->totalprice = $Order["totalprice"];
					$Refund->token  	= $Order["token"];
					$Refund->province  	= $Order["province"];
					$Refund->city  		= $Order["city"];
					$Refund->county  	= $Order["county"];
					$Refund->detail  	= $Order["detail"];
					$Refund->name  		= $Order["name"];
					$Refund->mobile  	= $Order["mobile"];
					$Refund->third  	= $Order["third"];
					$Refund->ctime  	= $Order["ctime"];
					$Refund->paytime 	= $Order["paytime"];
					$Refund->status 	= $Order["status"];
					$Refund->tuitime 	= time();
					if($Refund->save()){
						$returns = $Order->delete()?[]:
						array('code'=>'5','msg'=>'网络错误');
						return $this->result($returns);
					}

				}else{
					$returns = array('code'=>'5','msg'=>'网络错误');
					
				}
				return $this->result($returns);
			}
	}

	function printf_info($data)
	{
	    foreach($data as $key=>$value){
	        echo "<font color='#f00;'> $key </font> : $value <br/>";
	    }
	}	

}

?>