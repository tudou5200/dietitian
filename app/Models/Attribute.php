<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#数据表类
class Attribute extends Model
{
	protected $table = 'mall_attribute';#表名
	protected $primaryKey = 'attr_id';#主键ID
    public $timestamps=false;#不适用时间戳
}
