<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    protected $table = "stock";
    protected $fillable = [
        'store_id','product_id', 'category_id', 'quantity', 'price'
    ];
}
