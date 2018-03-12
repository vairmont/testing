<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "transfer_order";
    protected $fillable = [
        'store_id_from', 'store_id_to'
    ];
}
