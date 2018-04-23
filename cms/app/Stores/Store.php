<?php

namespace App\Stores;

use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    protected $table = 'store';
    protected $guarded = ['id'];
}