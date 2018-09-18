<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agen extends Model
{
    protected $table = 'agen';
    protected $fillable = [
    	'identifier', 'parent', 'business_name', 'name', 'address', 'province', 'district', 'ktp_photo', 'kk_photo', 'photo', 'wanee', 'plafon_kredit', 'shipment'

    ];
}
