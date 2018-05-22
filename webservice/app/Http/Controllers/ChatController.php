<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use App\Customer;
use App\Chat;
use App\FCM;

class ChatController extends Controller
{
	public function chatList(Request $request)
    {
        $val = Validator::make($request->all(), [
            'order_id' => 'required',
            'category_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $chats = Chat::where('order_id',$request->order_id)
                    ->where('category_id',$request->category_id)
                    ->orderBy('id','asc')
                    ->select('id','sender_id','recipient_id','message','created_at')
                    ->get();

            return response()->json(['data' => $chats, 'message' => ['OK']]);
        }
    }

    public function orderChat(Request $request)
    {
        $val = Validator::make($request->all(), [
            'order_id' => 'required',
            'category_id' => 'required',
            'sender_id' => 'required',
            'message' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $order = Order::leftJoin('order_action','order_action.order_id','=','order.id')
                    ->where('order.id',$request->order_id)
                    ->where('order_action.category_id',$request->category_id)
                    ->first();

            $orderProgress = OrderProgress::where('order_id',$request->order_id)
            ->where('category_id',$request->category_id)
            ->first();

            $user = User::find($request->sender_id);

            $chat['order_progress_id'] = $orderProgress->id;
            $chat['order_id'] = $request->order_id;
            $chat['category_id'] = $request->category_id;
            $chat['sender_id'] = $request->sender_id;
            if($user->role_id == 2) {
                $chat['recipient_id'] = $order->take_by;
            }
            elseif($user->role_id == 3 || $user->role_id == 4 || $user->role_id == 5) {
                $chat['recipient_id'] = $order->user_id;
            }
            $chat['message'] = nl2br($request->message);
            Chat::create($chat);

            // send push notification
            $this->_sendPushNotification($chat['recipient_id'], "Pesan baru", nl2br($chat['message']));

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }
}

