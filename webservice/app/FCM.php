<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FCM extends Model
{
    protected $table = "fcm";
    protected $fillable = ['user_id','role_id','fcm_token','device_platform','uuid'];
}
