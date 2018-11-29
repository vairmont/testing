<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GeneralChat extends Model
{
    protected $table = 'general_chat';

    protected $fillable = [
    	'sender_id','recipient_id','message'
    ];
}
