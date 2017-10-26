<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Category extends Model
{
	
	protected $table = 'mall_category';#表名
	protected $primaryKey = 'cat_id';#主键ID
    public $timestamps=false;#不适用时间戳
}
