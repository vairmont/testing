<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    
    protected $fillable = ['city_id','cp_name','type_id','status_id','province','address','pic','telephone','email','onsite','inhouse','sic','sellbro'

    ];
    protected $table = "service";
}
