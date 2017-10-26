<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class UserSpokesmanMapping extends Model
{

    protected $table = 'user_spokesman_mapping';#表名
    protected $primaryKey = 'id';#主键ID
    public $timestamps=false;#不适用时间戳 
}
