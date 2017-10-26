<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Goodsattr extends Model
{
	
	protected $table = 'mall_goods_attr';#表名
	protected $primaryKey = 'goods_attr_id';#主键ID
    public $timestamps=false;#不适用时间戳
}
