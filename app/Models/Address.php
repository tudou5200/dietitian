<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

#���ݱ���
class Address extends Model
{

	protected $table = 'user_address';#����
	protected $primaryKey = 'address_id';#����ID
    public $timestamps = false;#������ʱ���
	
}