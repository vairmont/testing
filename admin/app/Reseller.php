<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reseller extends Model
{
    protected $table = 'reseller';

    protected $fillable = [
    	'identifier', 'store_name', 'name', 'phone', 'store_photo', 'city_id', 'address_1', 'lat', 'lng', 'address_2', 'printer_inkjet', 'printer_laser', 'printer_label', 'scanner', 'mesin_jahit', 'lain_lain'
    ];
}
