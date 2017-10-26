<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
#购物车表
class Userwithdrawal extends Model
{
	protected $table = 'user_withdrawal';
	protected $primaryKey = 'id';
    public $timestamps = false;
}
