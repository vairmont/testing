<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use App\Customer;
use App\Order;
use App\User;
use App\Agen;
use App\Chat;
use App\FCM;

class ChatController extends Controller
{
	public function chatList(Request $request)
    {
        $val = Validator::make($request->all(), [
            'order_id' => 'required',
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $chats = Chat::where('order_id',$request->order_id)
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
            'message' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {

        	$sender_id = $request->get('user')->id;

            $order = Order::join('users', 'users.id', '=', 'order.user_id')
            		->where('order.id',$request->order_id)
                    ->first();

            $user = User::find($sender_id);

            if($user->role_id == 2) {
            	// customer
                $chat['recipient_id'] = $order->agen_id;
            }
            elseif($user->role_id == 5) {
            	// agen
                $chat['recipient_id'] = $order->user_id;
            }
            $chat['order_id'] = $request->order_id;
            $chat['sender_id'] = $sender_id;
            $chat['message'] = nl2br($request->message);
            Chat::create($chat);

            // send push notification
            $this->_sendPushNotification($chat['recipient_id'], "Pesan baru", nl2br($chat['message']));

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }

    protected function _sendPushNotification($user_id, $title, $body) {
        // API access key from Google API's Console
        define('API_ACCESS_KEY', ' ');

        $registrationIds = array();

        $recipients = FCM::where('user_id',$user_id)->select('fcm_token')->get();

        foreach ($recipients as $recipient) {
            array_push($registrationIds, $recipient->fcm_token);
        }

        $msg = array
        (
            'title' => $title,
            'body' => $body,
            'vibrate' => "1",
            'sound' => 'default',
            'badge' => "1"
        );

        $fields = array
        (
            'registration_ids'  => $registrationIds,
            'notification'  => $msg,
            'priority' => 'high'
        );
         
        $headers = array
        (
            'Authorization: key=' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );
         
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch,CURLOPT_POST, true);
        curl_setopt($ch,CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch,CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        curl_close($ch);
    }
}

