<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    protected $fillable = ['id','sku','product_name','description','store_id','tax_id','category_id','incentive_id','shelf','cost','price_for_customer','promo_price','price_for_agen','img_url'];
}
