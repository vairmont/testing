<?php

namespace App\Products;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    protected $table = 'diskon';
    protected $fillable = ['name', 'rate', 'type', 'restriction'];
}