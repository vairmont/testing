<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrderDetail extends Model
{
    protected $table = "purchase_order_detail";
    protected $fillable = [
        'purchase_order_id', 'product_id', 'category_id', 'quantity', 'price'
    ];
}
