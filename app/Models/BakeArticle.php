<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class BakeArticle extends Model
{
	
	protected $table = 'bake_article';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳

    // public function Getgoods($value='')
    // {
    // 	return $this->hasMany('App\Models\Goodsimg', 'goods_id', 'goods_id');
    // }
   

   
}
