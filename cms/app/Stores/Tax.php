<?php

namespace App\Stores;

use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    protected $table = 'tax';
    protected $guarded = ['id'];
}