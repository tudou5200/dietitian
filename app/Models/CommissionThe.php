<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class CommissionThe extends Model
{
	
	protected $table = 'user_commission_the';#表名
	protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳 
}
