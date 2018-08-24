<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    protected $table = 'order_detail';
    protected $fillable = ['id','order_id','product_id','category_id','qty','price_for_customer','price_for_agen','created_at','update_at'];
}
