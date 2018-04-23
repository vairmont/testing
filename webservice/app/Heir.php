<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Heir extends Model
{
    protected $table = "heir";
    protected $fillable = ['user_id', 'name','ktp_photo','kk_photo','akta_photo'];
}
