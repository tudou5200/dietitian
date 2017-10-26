<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Http\Wx\Index;
class Test2Controller extends BaseController
{
// 	#我是商品列表
// 	public function goodslist(Request $request)
// 	{
// 		if($this->verCode($request->all(),[
// 			'cat_id'=>'required'
// 			]))
// 		{ 
// 			return $this->publicparaResponse();
// 		}
// 		$catid=$request->input('cat_id');//接收传过来的参数cat_id
// 		$Model= Goods::orderby('goods_id','desc')->select('goods_id','goods_name','goods_price','goods_thumb')->where('cat_id',$catid)->get();	
// 		return $this->result($Model);
// 	}	

}