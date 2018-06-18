<?php

namespace App\Inventories;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrderDetails extends Model
{
    protected $table = 'purchase_order_detail';
    protected $guarded = ['id'];

    public function product()
    {
        return $this->belongsTo('App\Products\Item', 'product_id', 'id');
    }
}