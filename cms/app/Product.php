<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $fillable = [
    	'product_name', 'category_id', 'price_for_customer', 'price_for_agen', 'promo_price', 'description', 'img_url'
    ];
}
