<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\Category;
use App\Models\Userfollowgoods;
use App\Models\Userfollowdiet;
use App\Models\Dietinfo;
use App\Models\Dietcate;
class GoodsController extends BaseController
{

	#我是商品列表
	public function goodslist(Request $request)
	{
		if($this->verCode($request->all(),[
			'cat_id'=>'required'
			]))
		{ 
			return $this->publicparaResponse();
		}
		$catid=$request->input('cat_id');//接收传过来的参数cat_id
		$Model= Goods::orderby('id','desc')->where('cat_id',$catid)->where('status',1)->get();
		foreach ($Model as $key => $value) {
			$value['price'] = $value['price']/100;
		}
		$Models=Category::where('cat_id',$catid)->first();
		$r=array(
			'cate'=>$Models,
			'goods'=>$Model
			);

		return $this->result($r);
	}



	#我是商品详情
	public function goodsinfo(Request $request)
	{
		if($this->verCode($request->all(),[
			'dtoken'=>'required'
			]))
		{ 
			return $this->publicparaResponse();
		}
		$dtoken = $request->input('dtoken');//接收传过来的参数goods_id
		#商品详情 只获取上架商品
		$GoodOneModel = Goods::where('dtoken',$dtoken)->where('status',1)->first();
		
		if($GoodOneModel){
			
			$GoodOneModel['followflag'] = 1;//默认为不关注
			//验证是否已经关注过
			if($request->input('token')){
				$res = Userfollowgoods::where('token',$request->input('token'))->where('dtoken',$request->input('dtoken'))->first();
				
				if(!empty($res)){
					$GoodOneModel['followflag'] =2;//已关注
				}
			}
			
			
			//规格
			$GoodOneModel['desc'] = file_exists($GoodOneModel['desc'])?file_get_contents($GoodOneModel['desc']):'';
			$GoodOneModel['price'] = $GoodOneModel['price']/100;
			return $this->result($GoodOneModel);
		}else{			
			return $this->result('null');
		}
	}
	
	
	#添加关注商品
	public function addfollowgoods(Request $request){
		if($this->verCode($request->all(),[
			'token'=>'required',
			'dtoken'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}

		$res = Userfollowgoods::where('token',$request->input('token'))->where('dtoken',$request->input('dtoken'))->first();
		
		//var_dump($res);die;
		if(!empty($res)){//当已经关注过后
			$returns = array('code'=>'7','msg'=>'你已经关注，请勿重复操作');
		}else{
			$userfollowgoods = new Userfollowgoods();
			$userfollowgoods->token = $request->input('token');
			$userfollowgoods->dtoken = $request->input('dtoken');
			$userfollowgoods->ctime = time();
			
			$returns = $userfollowgoods->save()?[]:array('code'=>'5','msg'=>'网络错误');
		}
		
		return $this->result($returns);	
	}
	
	
	#取消关注商品
	public function delfollowgoods(Request $request){
		if($this->verCode($request->all(),[
			'token'=>'required',
			'dtoken'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		
		$userfollowfoods = Userfollowgoods::where('token',$request->input('token'))->where('dtoken',$request->input('dtoken'))->first();
		
		if(!empty($userfollowfoods)){//判断关注的商品是否已经删除
			$returns =$userfollowfoods->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		}else{
			$returns= array('code'=>'7','msg'=>'已关注的商品已经取消，请勿重复取消');
		}
		return $this->result($returns);	
	}
	
	#我的关注商品列表
	public function myfollowgoodslist(Request $request){
		if($this->verCode($request->all(),[
      		'token'=>'required',
    	])){
     		 return $this->publicparaResponse();
    	}
		
		//先获取商品id
		$Userfollowgoods = Userfollowgoods::where('token',$request->input('token'))->select('dtoken')->orderby('id', 'desc')->get();
		
		$model = array();
		$list = $Userfollowgoods->toArray();
		//var_dump($list);die;
		if($list){
			foreach($list as $k =>$v ){
				$model[$k]  = Goods::where('dtoken',$v['dtoken'])->first();
			}
			
			foreach ($model as $key => $value) {
				$value['price'] = $value['price']/100;
			}
			//$Models=Category::where('cat_id',$catid)->first();
			//$r=array('cate'=>$Models,'goods'=>$model);	
		}
		return $this->result($model);
	}
	
	//添加关注营养师
	// public function addfollowdiet(Request $request){
	// 	if($this->verCode($request->all(),[
	// 		'token'=>'required',
	// 		'dietitian'=>'required',
	// 		]))
	// 	{ 
	// 		return $this->publicparaResponse();
	// 	}

	// 	$res = Userfollowdiet::where('token',$request->input('token'))->where('dietitian',$request->input('dietitian'))->first();
		
	// 	//首先验证添加关注的用户是否是营养师
	// 	$dietinfomodel= Dietinfo::where('token',$request->input('token'))->first();
	// 	if(!empty($dietinfomodel)){
	// 		$list = $dietinfomodel->toArray();
	// 		if($list['status']==1){
	// 			return $this->result(array('code'=>'8','msg'=>'营养师不可以点击关注'));
	// 		}
	// 	}
		
	// 	//var_dump($res);die;
	// 	if(!empty($res)){//当已经关注过后
	// 		$returns = array('code'=>'7','msg'=>'你已经关注，请勿重复操作');
	// 	}else{
			
	// 		$userfollowdiet = new Userfollowdiet();
	// 		$userfollowdiet->token = $request->input('token');
	// 		$userfollowdiet->dietitian = $request->input('dietitian');
	// 		$userfollowdiet->ctime = time();
			
	// 		$returns = $userfollowdiet->save()?[]:array('code'=>'5','msg'=>'网络错误');
	// 	}
		
	// 	return $this->result($returns);
	// }
	
	
	//取消关注营养师
	// public function delfollowdiet(Request $request){
	// 	if($this->verCode($request->all(),[
	// 		'token'=>'required',
	// 		'dietitian'=>'required',
	// 		]))
	// 	{ 
	// 		return $this->publicparaResponse();
	// 	}
		
	// 	$Userfollowdiet = Userfollowdiet::where('token',$request->input('token'))->where('dietitian',$request->input('dietitian'))->first();
		
	// 	if(!empty($Userfollowdiet)){//判断关注的营养师是否已经删除
	// 		$returns =$Userfollowdiet->delete()?[]:array('code'=>'5','msg'=>'网络错误');
	// 	}else{
	// 		$returns= array('code'=>'7','msg'=>'已关注的营养师已经取消，请勿重复取消');
	// 	}
	// 	return $this->result($returns);	
	// }
	
	
	
	

	//我的关注营养师列表
	// public function myfollowdeitlist(Request $request){
	// 	if($this->verCode($request->all(),[
 //      		'token'=>'required',
 //    	])){
 //     		 return $this->publicparaResponse();
 //    	}
		
	// 	//先获取营养师标识
	// 	$Userfollowdiet = Userfollowdiet::where('token',$request->input('token'))->select('dietitian')->orderby('id', 'desc')->get();

	// 	$model = array();
	// 	$list = $Userfollowdiet->toArray();
	// 	//var_dump($list);die;
	// 	if($list){
	// 		foreach($list as $k =>$v ){
	// 			$model[$k]  = Dietinfo::where('dietitian',$v['dietitian'])->first();
	// 		}
	// 		//var_dump($model);die;
	// 		foreach ($model as $k => $v) {
	// 			$model[$k]['totalprice']=$v['totalprice']/100;
	// 			#营养师详情
	// 			$DietinfoModel= Dietinfo::where('dietitian',$model[$k]['dietitian'])->first();
	// 			$DietinfoModel['askprice']=$DietinfoModel['askprice']/100;
	// 			$niche=explode(',',$DietinfoModel['niche']);
	// 			$DietinfoModel['niche'] = Dietcate::whereIn('id',$niche)->get();
	// 			$model[$k]['dietitian']=$DietinfoModel;
	// 		}
	// 	}
	// 	return $this->result($model);
	// }
	
	
	
	
	
}