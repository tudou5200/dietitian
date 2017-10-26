<?php
namespace App\Http\Back\Users;

use App\Services\Back\User\DieticianList;
use App\Services\Back\User\DieticianDetail;

use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;

class DieticianController extends BaseController
{

    public function list(Request $request)
    {
    $page = $request->input('pageIndex');
    $page = empty($page) ? 1: $page;

    $pageSize = $request->input('pageSize');
    $pageSize = empty($pageSize) ? 15: $pageSize;

    $obj = new DieticianList;
    $res = $obj->Index($pageSize,$page);

    return $this->resmsg($res);
    }


  public function Detail(Request $request){
    if($this->verCode($request->all(),[
      'token'   =>'required',
    ])){
      return $this->publicparaResponse();
    }
    $token = $request->input('token');

    $obj = new DieticianDetail();
    $res = $obj->Index($token);

    return $this->resmsg($res);

  }


}
