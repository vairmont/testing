<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "stock_history";
    protected $fillable = [
        'product_id', 'store_id', 'category_id', 'quantity'
    ];
}
