<?php

namespace App\Inventories;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrderDetails extends Model
{
    protected $table = 'purchase_order_detail';
    protected $guarded = ['id'];
}