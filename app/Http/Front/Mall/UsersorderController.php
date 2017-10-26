<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Address;
use App\Models\OrderDetail;
use App\Models\Goods;
class UsersorderController extends BaseController
{
	  #用户订单列表
  	public function orderlist(Request $request)
  	{
  		
  		if($this->verCode($request->all(),[			
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}

		  $token = $request->input('token');
  		$OrderModel = Order::where('token',$token)->orderBy('id','desc')->get();
      foreach($OrderModel as $k=>$v){
        $OrderModel[$k]['totalprice'] = $v['totalprice']/100;
        $OrderModel[$k]['detail']=OrderDetail::where('order_sn',$v['order_sn'])->get();
          foreach ($OrderModel[$k]['detail'] as $key => $value) {
              $value['each_price']  = $value['each_price']/100;
          }
      }
  		return $this->result($OrderModel);
  	}


    #用户订单详情
  	public function orderdetail(Request $request)
  	{
  		if($this->verCode($request->all(),[			
			'order_sn'	=>'required',
		])){
			return $this->publicparaResponse();
		}

		  $order_sn = $request->input('order_sn');
  		$OrderModel = Order::where('order_sn',$order_sn)->first();
      $OrderModel['ctime']=date('Y-m-d H:i:s',$OrderModel['ctime']);
      if($OrderModel['status']==1){
        $OrderModel['paytime']=0;
        $OrderModel['fatime']=0;
        $OrderModel['quetime']=0;
      }elseif($OrderModel['status']==2){     
        $OrderModel['paytime']=date('Y-m-d H:i:s',$OrderModel['paytime']);
        $OrderModel['fatime']=0;
        $OrderModel['quetime']=0;
      }elseif($OrderModel['status']==3){  
        $OrderModel['paytime']=date('Y-m-d H:i:s',$OrderModel['paytime']);
        $OrderModel['fatime']=date('Y-m-d H:i:s',$OrderModel['fatime']);
        $OrderModel['quetime']=0;
      }else{
        $OrderModel['paytime']=date('Y-m-d H:i:s',$OrderModel['paytime']);
        $OrderModel['fatime']=date('Y-m-d H:i:s',$OrderModel['fatime']);
        $OrderModel['quetime']=date('Y-m-d H:i:s',$OrderModel['quetime']);
      }

  		$OrderModel->list=OrderDetail::where('order_sn',$order_sn)->get();
      $OrderModel['totalprice'] = $OrderModel['totalprice']/100;
      foreach ($OrderModel->list as $key => $value) {
        $value['total'] = $value['total']/100;
        $value['each_price'] = $value['each_price']/100;
      }


  		return $this->result($OrderModel);
  		
  	}

}