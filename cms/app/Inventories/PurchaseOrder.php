<?php

namespace App\Inventories;

use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends Model
{
    protected $table = 'purchase_order';
    protected $guarded = ['id'];

    public function purchaseOrderDetails()
    {
    	return $this->hasMany('App\Inventories\PurchaseOrderDetails', 'purchase_order_id', 'id');
    }

    public function store()
    {
        return $this->belongsTo('App\Stores\Store', 'store_id', 'id');
    }

    public function supplier()
    {
        return $this->belongsTo('App\Inventories\Supplier', 'supplier_id', 'id');
    }
}