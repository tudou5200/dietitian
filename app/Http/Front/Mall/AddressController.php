<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Address;
class AddressController extends BaseController
{
	#显示收货人地址列表
	public function list(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  = $request->input('token');
		$Models = Address::where('token',$token)->orderby('address_id','desc')->get();
		return $this->result($Models);
	}

	#添加收货人
	public function adds(Request $request)
	{
		
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>	'required',
			'consignee'	=>	'required',#收货人昵称
			'province'	=>	'required',#省
			'address'	=>	'required',#详情地址
			'mobile'	=>	'required',#手机号
		])){
			return $this->publicparaResponse();
		}
		$AddModel = New Address();
		#设置是否默认收货地址
		$token 	  = $request->input('token');
		$AddressModel = Address::where('token',$token)->get();
		$conuarr  = Address::where('token',$token)->count();
		if($conuarr==0){
			$AddModel->main = 1;
		}else{
			$i = 0;
			foreach ($AddressModel as $key => $value) {
				if($value['main']==1){
					$i++;
					
				}
			}
			if($i==1){
				$AddModel->main = 2;
			}else{
				$AddModel->main = 1;
			}
			
		}

		list($province,$city,$county)=explode(' ',$request->input('province'));
		if(empty($county))
		{
			$county=$city;
			$city=$province;
		}

		$AddModel->token 	 = $request->input('token');
		$AddModel->consignee = $request->input('consignee');
		$AddModel->province  = $province;
		$AddModel->city 	 = $city;
		$AddModel->district  = $county;
		$AddModel->address 	 = $request->input('address');
		$AddModel->mobile 	 = $request->input('mobile');		
		$arr=$AddModel->save()?['id'=>$AddModel->address_id]:array('code'=>'5','msg'=>'eroror');	

		if($request->input('main'))
		{
			$this->setMainToo($AddModel->address_id,$token);
		}

		return $this->result($arr);
	}

	#修改收货人
	public function saves(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'token'		=>'required',
			'address_id'=>'required',
			'consignee'	=>'required',#收货人昵称
			'province'	=>'required',#省
			'address'	=>'required',#详情地址
			'mobile'	=>'required',#手机号
		])){
			return $this->publicparaResponse();
		}

		list($province,$city,$county)=explode(' ',$request->input('province'));
		if(empty($county))
		{
			$county=$city;
			$city=$province;
		}
		
		
		
		$addreid  = $request->input('address_id');
		$AddModel = Address::find($addreid);
		$AddModel->token 		= $request->input('token');
		$AddModel->consignee 	= $request->input('consignee');
		$AddModel->province  = $province;
		$AddModel->city 	 = $city;
		$AddModel->district  = $county;
		$AddModel->address 		= $request->input('address');
		$AddModel->mobile 		= $request->input('mobile');		
		$arr=$AddModel->save()?[]:array('code'=>'5','msg'=>'网络错误');

		if($request->input('main'))
		{
			$this->setMainToo($AddModel->address_id,$request->input('token'));
		}
	


		return $this->result($arr);
	}


	#删除收货人地址
	public function delete(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'address_id'=>'required',			
		])){
			return $this->publicparaResponse();
		}
		$addreid  	= $request->input('address_id');
		$Models 	= Address::find($addreid);
		$token 		= $Models->token;
		//删除的是否是默认
		if($Models&&$Models->main==1){
			$tokarr  = Address::where('token',$token)->where('main',2)->first();
			if($tokarr){
				$tokarr->main = 1;
				$tokarr->save();
			}
		}
		$addelete = $Models->delete()?[]:array('code'=>'5','msg'=>'网络错误');
		return $this->result($addelete);
	}

	#获取单个收获地址
	public function find(Request $request)
	{
		if($this->verCode($request->all(),[
			'address_id'=>'required',			
		])){
			return $this->publicparaResponse();
		}
		$addreid  = $request->input('address_id');
		$Models = Address::find($addreid);
		if(!$Models){
			$Models = array('code'=>'5','msg'=>'地址不存在');
		}
		return $this->result($Models);
	}

	#设置默认收货地址
	public function setmain(Request $request)
	{
		if($this->verCode($request->all(),[
			'address_id'=>'required',	
			'token'=>'required',			
		])){
			return $this->publicparaResponse();
		}
		$addreid  	= $request->input('address_id');
		$token  	= $request->input('token');

		$arr=$this->setMainToo($addreid,$token);
		
		return $this->result($arr);
	}
	private function setMainToo($id,$token)
	{
		
		$Models 	= Address::where('address_id',$id)->first();

		if($Models){

			$main = Address::where('token',$token)->where('main',1)->first();
			if($main)
			{
				$main->main=2;
				$main->save();
			}

			$Models->main   =  1;
			$arr = $Models->save()?[]:array('code'=>'5','msg'=>'网络错误');	

		}else{
			$arr = array('code'=>'5','msg'=>'地址不存在');
		}
		return $arr;

	}
	
}