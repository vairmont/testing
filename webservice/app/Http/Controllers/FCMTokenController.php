<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\FCM;

class FCMTokenController extends Controller
{
    public function checkToken(Request $request) 
    {
    	$data = FCM::where('fcm_token',$request->fcm_token)->first();

    	if(count($data) > 0)
    	{
		  return response()->json(['data' => [], 'message' => ['OK']]);
		}
		else
		{
		  return response()->json(['data' => [], 'message' => ['ZERO_RESULT']]);	
		}
    }

    public function addToken(Request $request) 
    {
		$check = FCM::where('fcm_token', $request->fcm_token)->first();

		if(count($check) == 0) {
			$data = [
				'user_id' => $request->user_id,
				'role_id' => $request->role_id,
				'fcm_token' => $request->fcm_token,
				'device_platform' => $request->device_platform,
				'uuid' => $request->uuid
			];
			FCM::create($data);
		}
    
		return response()->json(['data' => [], 'message' => ['OK']]);
    }
}
