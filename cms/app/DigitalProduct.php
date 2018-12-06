<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DigitalProduct extends Model
{
    protected $table = 'digital_product';
    protected $fillable = ['id','operator_id','name','type','slug','Kode','price_agen','price'];
}
