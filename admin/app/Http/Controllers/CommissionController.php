<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 08/04/18
 * Time: 14.04
 */

namespace App\Http\Controllers;


use App\Commission;
use Illuminate\Http\Request;
use Validator;

class CommissionController extends Controller {

  public function getAgentCommission(Request $request) {

    $validator = Validator::make($request->all(),[
      'agen_id' => 'required|numeric|exists:agen,id',
    ]);

    if ($validator->fails()) {
      return response()->json([
        'error' => $validator->errors()->all()
      ]);
    }

    $weeklyCommision = Commission::Join('agen', 'agen.id', '=', 'commission.agen_id')
      ->where('agen.id', '=', $request['agen_id'])
      ->selectRaw('sum(commission.incentive) as incentive_amount, min(created_at), max(created_at)')
      ->get();

    return response()->json(['data' => $weeklyCommision], 200);
  }

}