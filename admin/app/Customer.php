<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customer';

    protected $fillable = [
    	'identifier', 'name', 'phone', 'city_id', 'address_1', 'lat', 'lng', 'address_2'
    ];
}
