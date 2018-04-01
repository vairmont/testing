<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Commission extends Model{

  protected $table = 'commission';

  protected $fillable = ['agen_id', 'order_id', 'margin_penjualan', 'incentive'];

}