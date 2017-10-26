<?php
namespace App\Http\Front\Live;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\LiveList;
class LiveController extends BaseController
{
	#我是首页
	public function index(Request $request)
	{

		$LiveList = LiveList::orderBy('order','asc')->get();
		return $this->result(array('list'=>$LiveList));	
	}	
	
	
}