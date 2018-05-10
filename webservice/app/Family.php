<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Family extends Model
{
    protected $table = "family";
<<<<<<< HEAD
    protected $fillable = ['parent_id','child_id','relation'];
=======
    protected $fillable = ['parent_id', 'child_id', 'name','ktp_photo','phone'];
>>>>>>> 619a3f5790498c5a9f8c67d24329979255995d27
}
