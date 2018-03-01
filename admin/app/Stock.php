<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "stock";
    protected $fillable = [
        'store_id','product_id', 'category_id', 'quantity', 'price'
    ];
}
