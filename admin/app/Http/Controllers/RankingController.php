<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderCancel;
use App\Product;
use App\User;
use App\Agen;
use App\VoucherUse;
use App\Voucher;
use App\Chat;
use App\Cart;
use App\CartDetail;
use App\ProductCategory;
use App\FCM;

class RankingController extends Controller
{

    public function index(Request $request) {
        $items = Order::Join('agen', 'order.user_id', '=', 'agen.id')
          ->where('order.status', 'LIKE', '%finish%')
          ->select('SUM(total)', 'agen.name')
          ->groupBy('agen.name')
          ->orderBy('total_sales', 'desc')
          ->get();

      return response()->json($items, 200);
    }

}

