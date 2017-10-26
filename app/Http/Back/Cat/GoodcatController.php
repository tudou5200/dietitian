<?php
namespace App\Http\Back\Cat;
use App\Http\BaseController;

use Illuminate\Http\Request;
use Validator;

use App\Models\Category;

class GoodcatController extends BaseController
{
	//商品分类列表
	public function glist(Request $request) {
		
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');    
   	 	$page     = empty($page)     ? 1 : $page;   
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $pageSize;


    	// $count = Category::count();
      	$list  = Category::skip($skip)->take($take)->get();
     	//$Model['list']=$list;
    	// $Model['sumpage']=ceil($count/$pageSize);
   		// $Model['count']=$count;

	    return $this->result($list);
	}
}