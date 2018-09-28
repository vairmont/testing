<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agen extends Model
{
    protected $table = 'agen';
    protected $fillable = ['name','phone','NIK','KK','address','status','wanee','shipment', 'bank'];
}

