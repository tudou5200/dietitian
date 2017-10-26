<?php
namespace App\Http\Front\Bake;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\BakeArticle;
use App\Models\BakeCase;
class BakeController extends BaseController
{

	// #营养百科文章列表
	// public function index(Request $request)
	// {
	// 	$Model['list']= BakeArticle::orderby('id','desc')->get();	
	// 	$Model['case']= BakeCase::get();
	// 	return $this->result($Model);
	// }
	#营养百科分类文章列表
	public function indexs(Request $request)
	{
		#接参
		$cid = $request->input('cid');
		// $Model['cid']  = empty($cid)?:$cid;
		if(empty($cid)||$cid=='null'){
			$Model['cid']=1;
		}else{
			$Model['cid']=$cid;
		}
		$Model['list']= BakeArticle::orderby('id','desc')->where('cid',$Model['cid'])->get();	
		$Model['case']= BakeCase::get();
		return $this->result($Model);
	}
	
}