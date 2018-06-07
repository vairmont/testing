<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    protected $table = "store";
    protected $fillable = [
        'store_name','phone', 'address'
    ];
}
