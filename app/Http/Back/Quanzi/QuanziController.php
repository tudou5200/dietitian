<?php
namespace App\Http\Back\Quanzi;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\Quanarticle;
use App\Models\Quancommend;
use App\Models\Users;
use App\Models\UserInfo;

class QuanziController extends BaseController
{
	#圈子列表
	public function List(Request $request)
	{
		$page     = $request->input('page');
	    $pageSize = $request->input('pageSize');
	    $skip     = empty($page)     ? 1 : $page;
	    $take     = empty($pageSize) ? 5 : $pageSize;
	    $count    = Quanarticle::skip($skip)->take($take)->count();
	    $Model['list']  = Quanarticle::skip($skip)->take($take)->get();
		if(!$Model['list']){
			 $returns = array('code'=>'5','msg'=>'没有圈子');
     		 return $this->result($returns);
		}
		$Model['list']  =$list;
    	$Model['count'] =$count;
    	$Model['pageSize'] =$pageSize;
    	$Model['sumpage'] =ceil($count/$pageSize);
		return $this->result($Model);
	}

	#圈子详情
	public function Detail(Request $request)
	{
		$qtoken   = $request->input('qtoken');
	    $Model    = Quanarticle::where('qtoken',$qtoken)->first();
		$returns  = isset($Model)?$Model:array('code'=>'5','msg'=>'没有圈子');
		return $this->result($returns);
	}

	#圈子删除
	public function Del(Request $request)
	{
		$qtoken   = $request->input('qtoken');
		$quanzicom = Quancommend::where('qtoken',$qtoken)->delete();		
		$Model     = Quanarticle::where('qtoken',$qtoken)->delete();
		$returns   = !empty($Model)?[]:array('code'=>'5','msg'=>'没有圈子');   
		return $this->result($returns);
	}

	#圈子评论删除
	public function CommentDel(Request $request)
	{
		$qtoken   = $request->input('qtoken');
		$quanzicom = Quancommend::where('qtoken',$qtoken)->delete();
		$returns   = !empty($quanzicom)?[]:array('code'=>'5','msg'=>'没有圈子评论');
		return $this->result($returns);
	}

}	