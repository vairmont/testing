<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Family extends Model
{
    protected $table = "family";
    protected $fillable = ['agen_id', 'name','ktp_photo','phone'];
}
