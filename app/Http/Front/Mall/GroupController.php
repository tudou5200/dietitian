<?php
namespace App\Http\Front\Mall;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\Goods;
use App\Models\Address;
use App\Models\Mallgroup;
use App\Models\Mallgroupdetail;
use App\Models\UserInfo;

class GroupController extends BaseController
{

	#我是拼团商品详情
	public function goodsinfo(Request $request)
	{
		if($this->verCode($request->all(),[
			'dtoken'=>'required'
			]))
		{ 
			return $this->publicparaResponse();
		}
		$dtoken = $request->input('dtoken');//接收传过来的参数goods_id
		#商品详情 只获取上架商品
		$GoodOneModel = Goods::where('dtoken',$dtoken)->where('status',1)->first();
		
		if($GoodOneModel){
			$GoodOneModel['desc'] = file_exists($GoodOneModel['desc'])?file_get_contents($GoodOneModel['desc']):'';
			$GoodOneModel['costprice'] = $GoodOneModel['price']/100/0.8;//原价,即前端被删除线划掉的价格
			$GoodOneModel['price'] = $GoodOneModel['price']/100;//实际价格
			return $this->result($GoodOneModel);
		}else{			
			return $this->result('null');
		}
	}
	
#开团订单展示
	public function lists(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'list'	=>'required',
			'token'	=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  	= $request->input('token');#正式
			
		#参团的时候判断start#	
		$gtoken  	= $request->input('gtoken');#非必传参
		if($gtoken){
			$group=Mallgroup::where('gtoken',$gtoken)->where('token',$token)->where('orsuccess',0)->first();
			if($group){
				$arrModel=array('code'=>'5','msg'=>'您自己的团，不可再参团');
				return $this->result($arrModel);
			}
			$count=Mallgroup::where('gtoken',$gtoken)->where('orsuccess',1)->count();
			if($count==2){
				$arrModel=array('code'=>'5','msg'=>'团已满');
				return $this->result($arrModel);
			}
			$count2=Mallgroup::where('gtoken',$gtoken)->where('orsuccess',2)->count();
	        if($count2){
	            $r=array('code'=>'5','msg'=>'团已失败');
	            return $this->result($r);
	        }
		}
		
		#参团的时候判断end#

		$GoodsModel = Goods::select('name','dtoken','img','price')->get();	
		$arra  		= Address::where('token',$token)->where('main',1)->first();//默认收货人
		if($arra){
			$arrModel['addre'] = $arra;
		}else{
			$arrModel['addre'] = '';
		}
		list($dtoken,$num)=explode('.',$request->input('list'));

		foreach ($GoodsModel->toArray() as $kk => $vv)	{
			if($dtoken==$vv['dtoken']) {
				$arrModel['name']= $vv['name'];#商品
				$arrModel['price']= $vv['price']/100;#单价
				$arrModel['number'] = $num;#数量
				$arrModel['xiaoji'] = $vv['price']*$num/100;#小计
			
			}
		}
		
		return $this->result($arrModel);
	}	


	#开团订单生成
	public function adds(Request $request)
	{
		#判断字段是否为空
		if($this->verCode($request->all(),[
			'name'		=>'required',
			'mobile'	=>'required',
			'address'	=>'required',
			'token'		=>'required',
			'list' 		=>'required',
		])){
			return $this->publicparaResponse();
		}
		$token  	= $request->input('token');
		// $produit 	= explode('_', $request->input('list'));	
		$GoodsModel = Goods::select('id','sell','store','name','dtoken','img','price')->get();//测试
		
		

		#商品列表
		$zongji= 0;
		$order_sn=date('YmdHis').rand(1000,9999);
		
		list($dtoken,$num)=explode('.',$request->input('list'));
		foreach ($GoodsModel as $kk)	
		{
			if($dtoken==$kk->dtoken) 
			{
				#订单详情
				$detail=new Mallgroupdetail();
				$detail->order_sn   = $order_sn;
				$detail->each_price = $kk->price;					
				$detail->num   		= $num;	
				$detail->dtoken   	= $kk->dtoken;					
				$detail->total 		= $kk->price*$num;
				$detail->name 		= $kk->name;
				$detail->img   		= $kk->img;
				$detail->save(); 

				$kk->sell=$kk->sell+$num;
				$kk->save();

				$zongji+=$detail->total;
			}
		}

		

		$order=new Mallgroup();

		$gtokens= $request->input('gtoken');//参团标识（非必传参）
		if($gtokens){//参团
			$gtoken=$gtokens;
			$order->type= 2;
		}else{//开团
			$order->type= 1;
			$gtoken=sha1(date('YmdHis').rand(1000,9999));
		}

		$address=explode(' ', $request->input('address'));

		if(count($address)==3)
		{
				
			$order->city 	 =  $address[0];
			$order->county 	 =  $address[1];
			$order->detail 	 =  $address[2];
		}
		else
		{
			$order->city 	 =  $address[1];
			$order->county 	 =  $address[2];
			$order->detail 	 =  $address[3];
		}

		#总订单
		
		$order->order_sn= $order_sn;
		$order->gtoken  = $gtoken;
		$order->dtoken  = $dtoken;
		
		
		$order->totalprice= $zongji;
		$order->token= $request->input('token');
		$order->province =  $address[0];
		
		$order->name 	 =	$request->input('name');
		
		$order->mobile 	 =  $request->input('mobile');		
		$order->status 	 =  1;
		$order->ctime 	 =  time();
		$returns=$order->save()?array('order_sn'=>$order_sn):array('code'=>'5','msg'=>'网络错误');
		return $this->result($returns);	
	}
	#正在开团的列表
	public function ulist(Request $request)
	{
		if($this->verCode($request->all(),[
			'dtoken'	=>'required',			
		])){
			return $this->publicparaResponse();
		}

		$groups=Mallgroup::where('dtoken',$request->input('dtoken'))->where('orsuccess',0)->select('ctime','token','gtoken','dtoken')->get();
		$ginfo=Goods::where('dtoken',$request->input('dtoken'))->select('name','img','price')->first();
		foreach ($groups as $k=>$v)	
		{
			$uinfo=UserInfo::where('token',$v['token'])->select('user_name','user_img')->first();
			$groups[$k]['username']=$uinfo['user_name'];
			$groups[$k]['userimg']=$uinfo['user_img'];
		}
		$returns['groupinfo']=$groups;	
		$returns['goodsinfo']=$ginfo;
		return $this->result($returns);

	}
	
}