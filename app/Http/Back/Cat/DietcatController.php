<?php
namespace App\Http\Back\Cat;
use App\Http\BaseController;

use Illuminate\Http\Request;
use Validator;

class DietcatController extends BaseController
{
	//营养分类列表
	public function dlist(Request $request) {
		
	    return $this->result($Model);
	}
}