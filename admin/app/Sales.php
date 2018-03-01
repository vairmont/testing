<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $table = "sales";
    protected $fillable = [
        'order_id'
    ];
}
