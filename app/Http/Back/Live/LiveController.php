<?php
namespace App\Http\Back\Live;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\LiveList;
class LiveController extends BaseController
{
	#直播后台列表
	public function index(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$pages 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($pages)? 1 : $pages;   
    	$take     = empty($pageSize)? 10 : $pageSize;
    	$skip     = ($page - 1) * $take;


    	$count = LiveList::count();//求总数	
    	$list = LiveList::skip($skip)->take($take)->get();
    	$returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);	
	}	
	
	#直播后台添加
	public function adds(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'url'	=>'required',
			'img'	=>'required',
			'title'	=>'required',	
			'desc'	=>'required',	
			'grade'	=>'required',	
			'name'	=>'required',	
			'type'	=>'required',	
			'dtime'	=>'required',	
		])){
			// return $this->publicparaResponse();
			$error ="<input type='button' style='font-size: 30px;' value='缺少必要参数-返回修改页
			' onclick='history.back()' >";
			return $error;
		}

		#接参
		$input 		= $request->input();
		$LiveList = LiveList::where('title',$input['title'])->first();
		if($LiveList){
			$error ="<input type='button' style='font-size: 30px;' value='标题已存在-返回修改页
			' onclick='history.back()' >";
		}

		$LiveList = new LiveList();
		$LiveList->url = $input['url'];
		$LiveList->img = $input['img'];
		$LiveList->title = $input['title'];
		$LiveList->grade = $input['grade'];
		$LiveList->name = $input['name'];
		$LiveList->desc = $input['desc'];
		$LiveList->dtime = $input['dtime'];
		$LiveList->type = $input['type'];
		$LiveList->ctime = time();


		$success="<input  type='button'   value='添加成功-返回列表页' style='font-size: 30px;'   onclick='history.go(-2)'>";
      	$error="<input type='button' value='添加失败-返回修改页' style='font-size: 30px;' onclick='l.goto('aiyang.shoumeikeji.cn')' >";
      	$return = $LiveList->save()?$success:$error;
      	return $return;
	}


	public function edits(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'id'	=>'required',	
		])){
			return $this->publicparaResponse();
		}

		#接参
		$input 		= $request->input();
		$LiveList = LiveList::where('id',$input['id'])->first();
		return $this->result($LiveList);	

	}

	#直播删除
	public function deletes(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			//'qtoken'	=>'required',	
			'id'	=>'required',	
		])){
			return $this->publicparaResponse();
		}

		#接参
		$input 		= $request->input();
		$LiveList = LiveList::where('id',$input['id'])->first();
		$returns=$LiveList->delete()?[]:array('code'=>'3','msg'=>'网络错误');
		return $this->result($returns);	
	}
	
}