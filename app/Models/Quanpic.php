<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Quanpic extends Model
{
	protected $table = 'quan_pic';
	protected $primaryKey = 'id';
    public $timestamps = false;
}
