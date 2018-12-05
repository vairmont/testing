<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\User;
use App\BankAccount;
use App\Bank;
use App\FCM;

class BankController extends Controller
{
	public function getAccount(Request $request)
	{
		$bank = BankAccount::join('bank', 'bank.id', '=', 'bank_account.bank_id')
		->select('bank_account.name', 'bank_account.account_no', 'bank.name as bank')
		->where('user_id', $request->get('user')->id)
		->get();

		return response()->json(['data' => $bank, 'message' => ['OK']]);
    }

    public function getBank(Request $request)
    {
        $bank = Bank::select('bank.*');

        if(isset($request->keyword) && !empty($request->keyword)) {
            $bank = $bank->where('bank.name','like',"%".$request->keyword."%");
        }

        $bank = $bank->orderBy('bank.name','asc')->get();

        return response()->json(['data' => $bank, 'message' => ['OK']]);
    }

	public function addAccount(Request $request)
	{
		if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama pemilik rekening tidak boleh kosong.']]);
        }

        if(empty($request->bank_id)) {
            return response()->json(['data' => [], 'message' => ['Bank harus dipilih.']]);
        }

        if(empty($request->account_no)) {
            return response()->json(['data' => [], 'message' => ['Nomor Rekening harus diisi.']]);
        }

		else {

			$account = [
				'name' => $request->name,
				'user_id' => $request->get('user')->id,
				'bank_id' => $request->bank_id,
				'account_no' => $request->account_no
			];

			$createAccount = BankAccount::create($account);

            return response()->json(['account_id' => $createAccount->id, 'message' => ['OK']]);
    	}
    }

    public function editAccount(Request $request)
    {
            $account = [
                'name' => $request->name,
                'user_id' => $request->get('user')->id,
                'bank_id' => $request->bank_id,
                'account_no' => $request->account_no
            ];
        $save = BankAccount::where('id', '=', $request->account_id)
        ->update($account);

        return response()->json(['message' => ['OK']]);        
    }		

}

