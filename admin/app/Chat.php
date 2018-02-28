<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    protected $table = 'chat';

    protected $fillable = [
    	'order_progress_id','order_id','category_id','sender_id','recipient_id','message'
    ];
}
