<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $table = 'ticket';
    protected $fillable = [
    	'recipient', 'sender_id', 'department', 'subject', 'message', 'status'
    ];
}
