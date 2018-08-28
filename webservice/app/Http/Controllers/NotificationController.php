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

          $notif = Notification::select('name', 'description', 'photo', 'created_at')
		           ->get();

      return response()->json(['data' => $notif, 'message' => ['OK']]);
    }
}

