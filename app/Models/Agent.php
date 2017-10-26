<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
*
*/
class Agent extends Model
{
	protected $table = 'user_agent';
	protected $primaryKey = 'id';
    public $timestamps=false;// 
}
