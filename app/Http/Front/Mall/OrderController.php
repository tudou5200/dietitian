<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Address;
use App\Models\OrderDetail;
use App\Models\Goods;
use App\Models\Cart;
use App\Helpers\Curl;
use App\Models\UserSpokesmanMapping;
use App\Models\Agent;
use App\Models\Commission;
use App\Models\CommissionThe;
class OrderController extends BaseController
{
	function __construct() 
	{
    	$this->curl = new Curl(); 	
  	}
	#订单列表
	public function lists(Request $request)
	{

		#-------------------测试数据-------------------
		// $produit = array(
		// 			array('dtoken'=>'token1','number'=>5),	
		// 			array('dtoken'=>'token2','number'=>3)
		// 			);
		// $token = 'token';#测试`
		#-------------------测试数据-------------------



		#判断字段是否为空
		if($this->verCode($request->all(),[
			'list'	=>'required',
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  	= $request->input('token');#正式
		$produit 	= explode('_', $request->input('list')) ;//正式				
		$GoodsModel = Goods::select('name','dtoken','img','price')->get();	
		$arra  		= Address::where('token',$token)->where('main',1)->first();//默认收货人
		if($arra){
			$arrModel['addre'] = $arra;
		}else{
			$arrModel['addre'] = '';
		}
		#商品列表
		$arrModel['zongji'] = 0;
		foreach ($produit as $k => $v) {

			list($dtoken,$num)=explode('.',$v);

			foreach ($GoodsModel->toArray() as $kk => $vv)	{
				if($dtoken==$vv['dtoken']) {
					$arrModel['list'][$k] = $vv;#商品
					$arrModel['list'][$k]['number'] = $num;#数量
					$arrModel['list'][$k]['xiaoji'] = $vv['price']*$num;#小计
					$arrModel['zongji'] += $arrModel['list'][$k]['xiaoji'];#总价
				}
			}
		}
		return $this->result($arrModel);
	}	


	#订单生成
	public function adds(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'name'		=>'required',
			'mobile'	=>'required',
			'address'	=>'required',
			'token'		=>'required',
			'list' 		=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  	= $request->input('token');
		$produit 	= explode('_', $request->input('list'));	
		$GoodsModel = Goods::select('id','sell','store','name','dtoken','img','price')->get();//测试	
		#商品列表
		$zongji= 0;
		$order_sn=date('YmdHis').rand(1000,9999);

		foreach ($produit as $k => $v) 
		{

			list($dtoken,$num)=explode('.',$v);
			$delarr[]=$dtoken;
			foreach ($GoodsModel as $kk)	
			{
				if($dtoken==$kk->dtoken) 
				{
					
					#订单详情
					$detail=new OrderDetail();
					$detail->order_sn   = $order_sn;
					$detail->each_price = $kk->price;					
					$detail->num   		= $num;	
					$detail->dtoken   	= $kk->dtoken;					
					$detail->total 		= $kk->price*$num;
					$detail->name 		= $kk->name;
					$detail->img   		= $kk->img;
					$detail->save(); 

					$kk->sell=$kk->sell+$num;
					$kk->save();

					$zongji+=$detail->total;
				}
			}
		}
		$order=new Order();
		$address=explode(' ', $request->input('address'));

		if(count($address)==3)
		{
				
			$order->city 	 =  $address[0];
			$order->county 	 =  $address[1];
			$order->detail 	 =  $address[2];
		}
		else
		{
			$order->city 	 =  $address[1];
			$order->county 	 =  $address[2];
			$order->detail 	 =  $address[3];
		}

		#总订单
		
		$order->order_sn  = $order_sn;
		$order->totalprice= $zongji;
		$order->token= $request->input('token');;
		$order->province =  $address[0];
		
		$order->name 	 =	$request->input('name');
		
		$order->mobile 	 =  $request->input('mobile');		
		$order->status 	 =  1;
		$order->ctime 	 =  time();
		$returns=$order->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');
		if($request->input('action')){
			if($action==1){
			$del=Cart::where('token',$token)->whereIn('dtoken',$delarr)->get();
			foreach  ($del as $k=>$v){
			$v->delete();	
			}
		  }
		}
		
		return $this->result($returns);	
	}

	
	#取消订单接口
	public function qu(Request $request)
	{
		if($this->verCode($request->all(),[
			'order_sn'	=>'required',			
		])){
			return $this->publicparaResponse();
		}	
		$order_sn = $request->input('order_sn');
		$Orderdetail = OrderDetail::where('order_sn',$order_sn)->get();
		foreach ($Orderdetail as $k => $v) {
			$good=Goods::where('dtoken',$v['dtoken'])->first();
			$good['sell']=$good['sell']-$v['num'];
			$good->save();
			$v->delete();	
		}
		$OrderModel = Order::where('order_sn',$order_sn)->first();
		$result=$OrderModel->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($result);
	}

	#确认收货
	public function que(Request $request)
	{

		if($this->verCode($request->all(),[
			'order_sn'	=>'required',			
		])){
			return $this->publicparaResponse();
		}
		$order_sn = $request->input('order_sn');
		$OrderModel = Order::where('order_sn',$order_sn)->first();
		$OrderModel->status = 4 ;
		$OrderModel->quetime = time() ;
		$returns=$OrderModel->save()?[]:array('code'=>'5','msg'=>'网络错误');

		$mappingInfo = UserSpokesmanMapping::where('bind_token', $OrderModel->token)->select()->get();
        if($mappingInfo) {
            $agentInfo = Agent::all();
            if($agentInfo) {
                foreach($agentInfo as $agentKey => $agentTmp) {
                    $commissionRate[$agentTmp->agent_level] = $agentTmp->service_commission_rate;
                }
            }
            $orderDetail = OrderDetail::where('order_sn',$order_sn)->first();

            foreach($mappingInfo as $mk => $mv) {
                $commissionModel = new Commission();
                $commissionModel->spokesman_token = $mv->token;
                $commissionModel->from_token = $OrderModel->token;
                $commissionModel->type = 200;
                $commissionModel->source_id = $orderDetail->dtoken;
                $commissionModel->source_name = $orderDetail->name;
                $commissionModel->money = ($OrderModel->totalprice*$commissionRate[$mv->level]) /100;
                $commissionModel->ctime = time();
                // $commissionModel->save();
                  $CommissionThe = CommissionThe::where('token',$mv->token)->first();
                    if($CommissionThe){
                        $CommissionThe->price = $CommissionThe->price +$OrderModel->totalprice*$commissionRate[$mv->level]/100;  
                        if($CommissionThe->save()){  
                              $commissionModel->save();  
                        }
                    }else{
                        $CommissionThe = new CommissionThe();  
                        $CommissionThe->price = $OrderModel->price*$commissionRate[$mv->level]/100;
                        $CommissionThe->token = $mv->token;                     
                        if($CommissionThe->save()){
                              $commissionModel->save();
                        }
                    }
            }
        }
		return $this->result($returns);
	}
	
}