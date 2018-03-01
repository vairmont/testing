<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "purchase_order_cancel";
    protected $fillable = [
        'purchase_order_id', 'category_id', 'cancel_by', 'reason'
    ];
}
