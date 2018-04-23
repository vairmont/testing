<?php

namespace App\Inventories;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    protected $table = 'stock';
    protected $guarded = ['id'];
}