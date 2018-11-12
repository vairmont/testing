<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customer';
    protected $fillable = [
    	'id','identifier', 'agen_id', 'name', 'phone', 'photo', 'address', 'gender', 'lat', 'long' 
    ];
}
