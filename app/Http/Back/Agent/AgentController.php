<?php
namespace App\Http\Back\Agent;
use App\Http\BaseController;
use Illuminate\Http\Request;
use Validator;
use App\Models\Agent;
use App\Services\BaseService;

class AgentController extends BaseController
{
	
	#分答列表
	public function lists(Request $request)
	{
		#接参
 		$name 		= $request->input('name');
 		$page 		= $request->input('page');
    	$pageSize	= $request->input('pageSize');
   	 	$page     = empty($page)     ? 1 : $page;
    	$take     = empty($pageSize) ? 5 : $pageSize;
    	$skip     = ($page - 1) * $take;

    	$count 	= Agent::count();//求总数
    	$list 	= Agent::skip($skip)->take($take)->get();
    	 //无数据
	    if ($list->toArray() == null) {
	    	return $this->result(array('code'=>'5','msg'=>'网络错误'));
	    }
	    $Model['list']=$list;
    	$Model['sumpage']=ceil($count/$take);
    	// $Model['count']=$count;
	    return $this->result($Model);
	}

    //营养师修改
    public function Edit(Request $request){
        if($this->verCode($request->all(),[
            'id' =>'required',
            'service_commission_rate'      =>'required',
            'product_commission_rate'  =>'required',
        ])){
            return $this->publicparaResponse();
        }
        $BaseService=new BaseService;
        $data = $request->all();
        $Model=Agent::where('id',$data['id'])->first();
        $Model->service_commission_rate     = $BaseService->trimAll($data['service_commission_rate']);
        $Model->product_commission_rate = $BaseService->trimAll($data['product_commission_rate']);
        $success="<input  type='button'   value='返回列表页'   onclick='history.go(-2)' >";
        $error  ="<input  type='button'   value='返回修改页'   onclick='history.back()' >";
        $r = $Model->save()? $success:$error;

        echo $r;
    }

    #等级详情
    public function Detail(Request $request){
        if($this->verCode($request->all(),[
            'id'   =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $cid = $request->input('id');
        $agentInfo= Agent::where('id',$cid)->first();
        if (!$agentInfo) {
            $r= array('code'=>'5','msg' => '没有此代理等级数据或已被删除');
            return $this->result($r);
        }

        return $this->result($agentInfo);
    }

    #商品编辑(修改展示)
    public function Detaillist(Request $request){
        if($this->verCode($request->all(),[
            'dtoken'   =>'required',
        ])){
            return $this->publicparaResponse();
        }

        $dtoken = $request->input('dtoken');
        $product= Goods::where('dtoken',$dtoken)->first();
        // $product['store'] = $product['store']-$product['sell'];
        if (!$product) {
            $r= array('code'=>'5','msg' => '没有此商品数据或已被删除');
            return $this->result($r);
        }
        $product->price = $product->price/100;
        $product->desc  =file_exists($product->desc)?file_get_contents($product->desc):'';
        $category = Category::all();
        return $this->result(array('list'=>$product,'cat'=> $category));
    }

#底部	
}	