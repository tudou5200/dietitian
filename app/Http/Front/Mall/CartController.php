<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\Cart;
class CartController extends BaseController
{
	#购物车列表
	public function cartlist(Request $request){
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token = $request->input('token');
		$cart  =Cart::where('token',$token)->get();
		// $carts ='';
		// foreach($cart as $k=>$v){
		// 	$goods=goods::where('status',1)->select('dtoken')->get();
		// 	$goods=$goods->toArray();
		// 	$dtokens=array_column($goods,'dtoken');
		// 	if(in_array($v['dtoken'],$dtokens)){
		// 		$carts[$k]['dtoken']=$v['dtoken'];
		// 	}
		// 	else{
		// 		Cart::where('dtoken',$v['dtoken'])->delete();
		// 	}
		// }
		
		return $this->result($cart);
	}


	#添加购物车
	public function cartadd(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'dtoken'	=>'required',
			'number'	=>'required',
		])){
			return $this->publicparaResponse();
		}

		$token   = $request->input('token');
		$dtoken  = $request->input('dtoken');
		$number  = $request->input('number');
		$cart=Cart::where('token',$token)->where('dtoken',$dtoken)->first();
		if($cart){
			$cart->number=$cart->number+$number;		
			$GoodsModel=$cart->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}
		else{
			$goods=Goods::where('dtoken',$dtoken)->where('status','1')->first();
			if($goods){
				$carts = New Cart();
				$carts->token =$token;
				$carts->dtoken=$dtoken;
				$carts->number=$number;
				$carts->price =$goods->price;
				$carts->img   =$goods->img;
				$carts->name  =$goods->name;
				$GoodsModel   =$carts->save()?[]:array('code'=>'5','msg'=>'网络错误');	
			}	
		}
		return $this->result($GoodsModel);
	}
	#购物车商品数量减少
	public function number(Request $request){
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'dtoken'	=>'required',
			'number'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  = $request->input('token');
		$dtoken = $request->input('dtoken');
		$number = $request->input('number');
		$cart   =Cart::where('token',$token)->where('dtoken',$dtoken)->first();
		if($cart->number-$number>0){
		$cart->number=$cart->number-$number;
		$GoodsModel  =$cart->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}
		return $this->result($GoodsModel);
	}

	#删除购物车一种商品
	public function clearone(Request $request){
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'dtoken'		=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token      = $request->input('token');
		$dtoken     = $request->input('dtoken');
		$cart       =Cart::where('token',$token)->where('dtoken',$dtoken)->first();
		$GoodsModel =$cart->delete()?[]:array('code'=>'5','msg'=>'网络错误');	
		return $this->result($GoodsModel);
	}

	#删除购物车所有商品
	public function clearall(Request $request){
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token = $request->input('token');
		$cart  =Cart::where('token',$token)->get();	
		foreach  ($cart as $k=>$v){
			$GoodsModel=$v->delete()?[]:array('code'=>'5','msg'=>'网络错误');	
		}
		return $this->result($GoodsModel);
	}
}