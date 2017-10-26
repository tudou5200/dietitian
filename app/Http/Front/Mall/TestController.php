<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Users;
use App\Models\Goods;
use App\Models\Goodsimg;
use App\Models\Goodsattr;
use App\Models\Attribute;
use App\Models\Dietinfo;
use App\Models\Dietproduct;
use App\Models\Dietorderdetail;
use App\Models\Dietorder;
use App\Models\Dietcate;
class TestController extends BaseController
{
	
	public function index(Request $request)
	{


		$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
   		$url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";


   		var_dump($url);
		// $goodsid=$request->input('goods_id');//接收传过来的参数cat_id
		// // $Models = DB::table('mall_goods')->where('goods_id',$goodsid)
		// // ->Join('mall_goods_img','mall_goods.goods_id','=','mall_goods_img.goods_id')->get();
		// $Modds= Goods::find($goodsid)->Getgoods;
		
		// $Modds= Goodsimg::has('goods')->get();

		//4  
		// if($this->verCode($request->all(),[
		// 	't'=>'required',
		// ])){
		// 	return $this->publicparaResponse();
		// }

		// $t=$request->input('t');
		// //1
		// $r=array(
		// 	array(
		// 		'name'=>'aaa',
		// 		),
		// 	array(
		// 		'name'=>'aaa',
		// 		),
		// 	array(
		// 		'name'=>'aaa',
		// 		),
		// 	);
		// // //5
		// // //逻辑错误
		// // $r=array('code'=>5,'msg'=>'保存失败');
		// //$r=[];
		// $Models=YongUp::all();
		// $Models=YongUp::where('a','t')->where('y','y')->orderby('id','desc')->take(10)->skip(5)->select('id','name')->first();->get();

		// if($Models)
		// {
		// 	echo $Models->name;
		// }
		// //-get
		// foreach ($Models as $key) {
		// 	echo $key->name;
		// }

		// echo $Models['name'];

		// $Models->name='uuuu';
		// $r=$Models->save()?[]:array('code'=>'5','msg'=>'eroror');

		// $Models=new YongUp();
		// $Models->name='ss';
		// $r=$Models->save()?[]:array('code'=>'5','msg'=>'eroror');

		// //删除都是他
		// $Models->delete();

		return $this->result($url);

	}


	public function main(Request $request) {
	
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'dietitian'	=>'required',			
		])){
			return $this->publicparaResponse();
		}

		$dietitian=$request->input('dietitian');//接收传过来的参数dietitian
		#营养师详情
		$DietinfoModel= Dietinfo::where('dietitian',$dietitian)->select('dietitian','name','img','education','job','star','service_person','service_order','niche','desc')->first();	
		#营养师服务
		$DietproductModel= Dietproduct::where('dietitian',$dietitian)->get();
		#细分领域
		$DietArr = explode(',',$DietinfoModel['niche']);	
		$DietinfoModel['niche'] = Dietcate::whereIn('id',$DietArr)->select('id','name')->get();#营养师分类

		if(!$DietinfoModel){
			$Model = array('code'=>'5','msg'=>'网络错误');
		}
		$Model = array('info'=>$DietinfoModel,'product'=>$DietproductModel);
		return $this->result($Model);
		
	}
}