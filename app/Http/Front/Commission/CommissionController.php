<?php
namespace App\Http\Front\Commission;
use App\Http\BaseController;
use Illuminate\Http\Request;
use App\Models\UserInfo;
use App\Models\Commission;

class CommissionController extends BaseController
{

    /**
     * 获取佣金列表
    */
    public function lists(Request $request) {
        if($this->verCode($request->all(),[
            'token'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }
        $token = $request->input('token');
        #接参
//        $type 		= $request->input('type');
        $page 		= $request->input('page');
        $pageSize	= $request->input('pageSize');
        $page     = empty($page)     ? 1 : $page;
        $take     = empty($pageSize) ? 10 : $pageSize;
        $skip     = ($page - 1) * $take;

        $count = Commission::where('spokesman_token', $token)->count();//求总数
        $list  = Commission::skip($skip)->take($take)->where('spokesman_token', $token)->select()->orderBy('id', 'desc')->get();
        //无数据
        if ($list->toArray() == null) {
            return $this->result(array('code'=>'6','msg'=>'暂无数据'));
        }
        $where = array_column($list->toArray(),'from_token');
        $where[] = $token;
        $user_info = UserInfo::whereIn('token', $where)
            ->select('user_img', 'token', 'user_name')->get();
        $user_info = array_column($user_info->toArray(),Null,'token');
        $currentUser = $user_info[$token];
        unset($user_info[$token]);
        foreach ($list as $key => &$value) {
            $value['spokesman_name'] = $currentUser['user_name'];
            $value['spokesman_user_img'] = $currentUser['user_img'];
            $value['money'] = $value['money']/100;
            $value['create_time'] = date('Y-m-d H:i:s', $value['ctime']);

            if( in_array($value['from_token'],array_keys($user_info) ) ){
                $value['from_user_name'] = $user_info[$value['from_token']] ? $user_info[$value['from_token']]['user_name'] : "";
                $value['from_user_img']  = $user_info[$value['from_token']] ? $user_info[$value['from_token']]['user_img'] : "";
            }else{
                $value['from_user_name'] = "";
                $value['from_user_img']  = "";
            }
        }

        $returns = $list ?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
        return $this->result($returns);
    }

    /**
     * 佣金发放
    */
    public function assign(Request $request) {
        if($this->verCode($request->all(),[
            'token'=>'required',
        ]))
        {
            return $this->publicparaResponse();
        }
        $token = $request->input('token');
        #接参
        $type  = $request->input('type');

        $count = Commission::where('type',$type)->where('spokesman_token', $token)->count();//求总数
        $list  = Commission::skip($skip)->take($take)->where('type','=',$type)->where('spokesman_token', $token)->select()->orderBy('id', 'desc')->get();
        //无数据
        if ($list->toArray() == null) {
            return $this->result(array('code'=>'5','msg'=>'网络错误'));
        }
        $where = array_column($list->toArray(),'from_token');
        $where[] = $token;
        $user_info = UserInfo::whereIn('token', $where)
            ->select('user_img', 'token', 'user_name')->get();
        $user_info = array_column($user_info->toArray(),Null,'token');
        $currentUser = $user_info[$token];
        unset($user_info[$token]);
        foreach ($list as $key => &$value) {
            $value['spokesman_name'] = $currentUser['user_name'];
            $value['spokesman_user_img'] = $currentUser['user_img'];
            if( in_array($value['from_token'],array_keys($user_info) ) ){
                $value['from_user_name'] = $user_info[$value['from_token']] ? $user_info[$value['from_token']]['user_name'] : "";
                $value['from_user_img']  = $user_info[$value['from_token']] ? $user_info[$value['from_token']]['user_img'] : "";
            }else{
                $value['from_user_name'] = "";
                $value['from_user_img']  = "";
            }
        }

        $returns = $list ?array('list'=> $list,'sumpage'=> ceil($count/$take)):array('code'=>'5','msg'=>'网络错误');
        return $this->result($returns);
    }


}