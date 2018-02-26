<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Dealer extends Model
{
    protected $table = 'dealer';

    protected $fillable = [
    	'identifier', 'store_name', 'name', 'phone', 'city_id', 'address_1', 'lat', 'lng', 'address_2', 'printer_inkjet', 'printer_laser', 'printer_label', 'scanner', 'mesin_jahit', 'lain_lain'
    ];
}
