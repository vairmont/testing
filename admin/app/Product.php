<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $fillable = [
    	'product_name', 'category_id', 'price_for_customer', 'price_for_reseller', 'description', 'img_url', 'brochure_url'
    ];
}
