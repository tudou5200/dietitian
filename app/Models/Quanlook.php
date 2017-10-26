<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Quanlook extends Model
{
	protected $table = 'quan_look';
	protected $primaryKey = 'id';
    public $timestamps = false;
}
