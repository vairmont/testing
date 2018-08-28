<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\User;
use App\Notification;
use Carbon\Carbon;

class NotificationController extends Controller
{
    public function index(Request $request) {

          $notif = Notification::select('created_at')
		           ->get();

		           $result = [];
		           foreach ($notif as $noti) {
		           	$items = Notification::select('name', 'description', 'photo')
		           	->whereDate('created_at', Carbon::now()->toDateString())
		           ->get();

		           }


		           $result[] = [
			           'notif' => $noti,
			           'items' => $items
			           ];
      return response()->json(['data' => $result, 'message' => ['OK']]);
    }
}

