<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\Category;
class IndexController extends BaseController
{
	#我是首页
	public function index(Request $request)
	{
		
		$Model= Goods::orderby('id','desc')->where('status','1')->select('dtoken','name','price','img','cat_id')->get();	
		$Models=Category::all();
		foreach ($Model as $key => $value) {
			$value['price'] = $value['price']/100;
		}
		/*$Model = array_slice($Model->toArray(), 6);*/
		$r=array(
			'cate'=>$Models,
			'goods'=>$Model
				);

		return $this->result($r);	
	}	
	
	
}