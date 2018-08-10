<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Agen;
use App\Customer;
use App\Rating;
use Hash;
use Auth;
use Validator;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPassword;

class UserController extends Controller
{
    public function uploadPhoto(Request $request)
    {
        // upload photos will store in storage/app/photos
        if(empty($request->photo)) {
            return response()->json(['data' => [], 'message' => ['Foto tidak boleh kosong']]);
        }
        else {

            $path = $request->file('photo')->store('photo_agen');

            Agen::where('id', $request->header('agenid'))
            ->update([
                'photo' => "storage/app/".$path
            ]);

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }

    public function editProfile(Request $request)
    {
        $data = [
        'name' => $request->name,
        'address' => $request->address
        ];

        $save = Customer::where('identifier', '=', $request->get('user')->id)
        ->update($data);

        return response()->json(['message' => ['OK']]);        
    }

	public function getProfile(Request $request)
	{
            if($request->get('user')->role_id == 5){

                $item = Rating::select('rating')
                            ->where('agen_id', '=', $request->get('user')->id)
                            ->avg('rating');

                $rating = number_format($item, 1, '.', '');

                $rate = [
                'rating' => $rating
                ];

                $save = Agen::where('identifier','=', $request->get('user')->id)
                ->update($rate);

                $data = User::join('role','users.role_id','=','role.id')
                            ->join('agen', 'users.id', '=', 'agen.identifier')
                            ->select('agen.*', 'users.phone')
                            ->where('users.id',$request->get('user')->id)
                            ->first();
                return response()->json(['data' => $data, 'message' => ['OK']]);
            }
            if($request->get('user')->role_id == 2){

                $data = User::join('role','users.role_id','=','role.id')
                            ->join('customer', 'users.id', '=', 'customer.identifier')
                            ->join('agen', 'customer.agen_id', '=', "agen.id")
                            ->select('customer.*', 'users.phone', 'agen.name as nama_agen')
                            ->where('users.id',$request->get('user')->id)
                            ->first();
                return response()->json(['data' => $data, 'message' => ['OK']]);
            }
    }
    
   
    public function changePassword(Request $request) {
        
        $val = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required|min:6',
            'confirm_password' => 'required|same:new_password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $user = User::select('password')
            ->where('id', "=", $request->get('user')->id)
            ->first();

            if(Hash::check($request->old_password, $user->password)){
                $data = array(
                    'password' => Hash::make($request->new_password)
                );

                User::where('id', $request->get('user')->id)->update($data);

                return response()->json(['data' => [], 'message' => ['Password berhasil diubah.']]);
            }
            else{
                return response()->json(['data' => [], 'message' => ['Password lama anda salah.']]);  
            }
        }
    }

    public function forgotPassword(Request $request) {
        $val = Validator::make($request->all(), [
            'phone' => 'required'
        ]);
        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $newpassword = Hash::make('123456');

            $user = User::where('phone', "=", $request->phone)->first();

            if($user != null)
            {
                $user->update(['password' => $newpassword]);
                // Mail::to($request->email)->send(new ResetPassword($data));
                return response()->json(['data' => [], 'message' => ['OK']]);
            }
            else
            {
                return response()->json(['data' => [], 'message' => ['Nomor HP yang anda masukkan salah']]);  
            }
        }
    }

    public function forgotPassword2(Request $request) {
        $val = Validator::make($request->all(), [
            'phone' => 'required'
        ]);
        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {

            $user = User::where('phone', "=", $request->phone)->first();

            if($user != null)
            {
                $password = rand(111111,999999);
                $user = User::where('phone', "=", $request->phone)
                        ->update([
                          'password' => Hash::make($password)
                        ]);

                // send sms
                $userkey = "ky7049";
                $passkey = "go2018";
                $telepon = $request->phone;
                $message = "Password baru anda adalah (".$password."). Demi keamanan akun, segera ganti password anda di tab menu profile setelah login.";
                $url = "https://alpha.zenziva.net/apps/smsapi.php";
                $curlHandle = curl_init();
                curl_setopt($curlHandle, CURLOPT_URL, $url);
                curl_setopt($curlHandle, CURLOPT_POSTFIELDS, 'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$telepon.'&pesan='.urlencode($message));
                curl_setopt($curlHandle, CURLOPT_HEADER, 0);
                curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
                curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
                curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
                curl_setopt($curlHandle, CURLOPT_POST, 1);
                $results = curl_exec($curlHandle);
                curl_close($curlHandle);

                // $XMLdata = new SimpleXMLElement($results);
                // $status = $XMLdata->message[0]->text;
                return response()->json(['data' => [], 'message' => ['OK']]);
            }
            else
            {
                return response()->json(['data' => [], 'message' => ['Nomor HP yang anda masukkan salah']]);  
            }
        }
    }


    public function getCustomerList(Request $request){
        $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

        $customer = User::Join('customer', 'users.id', '=', 'customer.identifier')
                    ->select('customer.name', 'customer.address', 'users.phone', 'customer.lat', 'customer.long', 'customer.photo')
                    ->where('customer.agen_id', '=', $agen->id)
                    ->get();

        return response()->json(['data' => $customer, 'message' => ['OK']]);            
    }
	
}
