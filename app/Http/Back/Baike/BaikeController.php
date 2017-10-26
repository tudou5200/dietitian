<?php
namespace App\Http\Back\Baike;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\BakeArticle;
use App\Models\BakeCase;

class BaikeController extends BaseController
{
	#百科文章列表
	public function list(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$pages 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($pages)? 1 : $pages;   
    	$take     = empty($pageSize)? 10 : $pageSize;
    	$skip     = ($page - 1) * $take;



    	if(empty($name)){
    		$count = BakeArticle::count();//求总数	
    		$list = BakeArticle::skip($skip)->take($take)->orderBy('id', 'desc')->get();
	    }else{
	    	$count = BakeArticle::where('title','like',"%".$name."%")->count();//求总数	
    	 	$list = BakeArticle::skip($skip)->take($take)->where('title','like',"%".$name."%")->orderBy('id', 'desc')->get();
	    }
    
    	$case=BakeCase::all();
    	 //无数据
    	
	    if($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }

	    $returns = $list?array('list'=> $list,'case'=> $case,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	
	}
	
	#百科文章添加
	public function adds(Request $request)
	{
		if($this->verCode($request->all(),[
			'cid'=>'required',
			'title'=>'required',
			'url'=>'required',
			'desc'=>'required',
			'img'=>'required',
			]))
		{ 
			// return $this->publicparaResponse();
			$error ="<input type='button' style='font-size: 30px;' value='缺少必要参数-返回修改页
			' onclick='history.back()' >";
			return $error;
		}
		#接参
 		$parameter 	= $request->input();

 		$article=new BakeArticle;
 		$article->cid=$parameter['cid'];
 		$article->bktoken=sha1(time().rand(0,99));
 		$article->title=$parameter['title'];
 		$article->url=$parameter['url'];
 		$article->desc=$parameter['desc'];
 		$article->img=$parameter['img'];
 		// $return=$article->save()?[]:array('code'=>'5','msg'=>'网络错误');
   //    	return $this->result($return);
 		$success="<input  type='button'   value='添加成功-返回列表页' style='font-size: 30px;'   onclick='history.go(-2)'>";
      	$error="<input type='button' value='添加失败-返回修改页' style='font-size: 30px;' onclick='history.back()' >";
      	$return = $article->save()? $success:$error;
 		// $return=$article->save()?'<div class="cfD"><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">加添成功-返回首页</a></div>'
   //    :'<div class="cfD"><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">加添失败-返回添加</a></div>';
      echo $return;
	}
	#百科文章详情
	public function detail(Request $request){
		if($this->verCode($request->all(),[
			'bktoken'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$bktoken 	= $request->input('bktoken');
		$article=BakeArticle::where('bktoken',$bktoken)->first();
		if (!$article) {
	      $r= array('code'=>'5','msg' => '没有此数据或已被删除');
	       return $this->result($r);
	    }
		$case=BakeCase::all();
		$r=array('article'=> $article,'case'=> $case);
		return $this->result($r);
	}
	#百科文章编辑
	public function edit(Request $request)
	{
		if($this->verCode($request->all(),[
			'cid'=>'required',
			'bktoken'=>'required',
			'title'=>'required',
			'url'=>'required',
			'desc'=>'required',
			'img'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		#接参
 		$parameter 	= $request->input();
 		$article = BakeArticle::where('bktoken',$parameter['bktoken'])->first();
 		$article->cid=$parameter['cid'];
 		$article->title=$parameter['title'];
 		$article->url=$parameter['url'];
 		$article->desc=$parameter['desc'];
 		$article->img=$parameter['img'];
 		// $return=$article->save()?[]:array('code'=>'5','msg'=>'网络错误');
   //    	return $this->result($return);

 		 // $return=$article->save()?'<div class="cfD"><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">修改成功-返回首页</a></div>'
    //   :'<div class="cfD"><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">修改失败-返回修改</a></div>';
 		$success="<input  type='button'   value='添加成功-返回列表页' style='font-size: 30px;'   onclick='history.go(-2)'>";
      	$error="<input type='button' value='添加失败-返回修改页' style='font-size: 30px;' onclick='history.back()' >";
      	$return = $article->save()? $success:$error;
      	echo $return;
	}
	#百科文章删除
	public function del(Request $request){
		if($this->verCode($request->all(),[
			'bktoken'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$bktoken 	= $request->input('bktoken');
		$article=BakeArticle::where('bktoken',$bktoken)->first();
		if (!$article) {
	      $r= array('code'=>'5','msg' => '没有此数据或已被删除');
	       return $this->result($r);
	    }
		$return=$article->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($return);
	}

	#百科分类列表
	public function Bcase(Request $request)
	{
		
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 100 : $pageSize;
    	$skip     = ($page - 1) * $take;


    	if(empty($name)){
    		$count = BakeCase::count();//求总数	
    		$list = BakeCase::skip($skip)->take($take)->get();
	    }else{
	    	$count = BakeCase::where('name','like',"%".$name."%")->orderBy('id', 'desc')->count();//求总数	
    		$list = BakeCase::skip($skip)->take($take)->where('name','like',"%".$name."%")->orderBy('id', 'desc')->get();
	    }
    	 //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));	  
	    }

	    $returns = $list?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
	    return $this->result($returns);	
	}
	#百科分类添加
	public function Badds(Request $request)
	{
		if($this->verCode($request->all(),[
			'name'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
 		$res=BakeCase::where('name',$request->input('name'))->first();
 		if($res){
 		   $r= array('code'=>'5','msg' => '此文章分类已存在，请勿重复添加');
	       return $this->result($r);
 		}
 		$case =new BakeCase;
 		$case->name = $request->input('name');

 		$return = $case->save()?[]:array('code'=>'5','msg'=>'网络错误');
      	return $this->result($return);
      }
      #百科分类详情
	public function Bdetail(Request $request){
		if($this->verCode($request->all(),[
			'id'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$id 	= $request->input('id');
		$case=BakeCase::where('id',$id)->first();
		if (!$case) {
	      $r= array('code'=>'5','msg' => '没有此数据或已被删除');
	       return $this->result($r);
	    }
		return $this->result($case);
	}
	#百科文章编辑
	public function Bedit(Request $request)
	{
		if($this->verCode($request->all(),[
			'id'=>'required',
			'name'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
	
 		$case = BakeCase::where('id',$request->input('id'))->first();
 		$case->name=$request->input('name');
 		$return=$case->save()?[]:array('code'=>'5','msg'=>'网络错误');
    //   	return $this->result($return);
 		 // $return=$article->save()?'<div class="cfD"><button class="userbtn" id="userbtn" ><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">修改成功-返回首页</a></button></div>'
    //   :'<div class="cfD"><button class="userbtn" id="userbtn" ><a style="font-size: 50px;" href="http://59.110.29.200:8080/bake/bake_index.html">修改失败-返回修改</a></button></div>';
      	$success="<input  type='button'   value='添加成功-返回列表页' style='font-size: 30px;'   onclick='history.go(-2)'>";
      	$error="<input type='button' value='添加失败-返回修改页' style='font-size: 30px;' onclick='history.back()' >";
      	$return = $case->save()? $success:$error;
      	echo $return;
	}
	#百科文章删除
	public function Bdel(Request $request){
		if($this->verCode($request->all(),[
			'id'=>'required',
			]))
		{ 
			return $this->publicparaResponse();
		}
		$case=BakeCase::where('id',$request->input('id'))->first();
		if (!$case) {
	      $r= array('code'=>'5','msg' => '没有此数据或已被删除');
	       return $this->result($r);
	    }
		$return=$case->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($return);
	}
}	