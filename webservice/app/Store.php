<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "store";
    protected $fillable = [
        'store_name','phone', 'address'
    ];
}
