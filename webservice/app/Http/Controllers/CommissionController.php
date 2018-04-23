<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 08/04/18
 * Time: 14.04
 */

namespace App\Http\Controllers;


use App\Agen;
use App\Commission;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;

class CommissionController extends Controller {


  public function getTodayCommission(Request $request, $id) {

    $agen = Agen::whereId($id)->first();
    if ($agen) {

      $commissions = Commission::Join('agen', 'agen.id', '=', 'commission.agen_id')
        ->where('agen.id', '=', $id)
        ->whereDate('commission.created_at', Carbon::now()->toDateString())
        ->selectRaw('commission.incentive, order_id')
        ->get();

      $incentiveTotal = 0;
      foreach ($commissions as $commission) {
        $incentiveTotal += $commission->incentive;
      }

      return response()->json(['data' => ['incentives' => $commissions, 'incentive_total' => $incentiveTotal]], 200);
    }

    return response()->json(['error' => 'INVALID AGENT ID'], 400);
  }

  public function getWeeklyCommission(Request $request, $id) {

    $agen = Agen::whereId($id)->first();
    if ($agen) {

      $commissions = Commission::Join('agen', 'agen.id', '=', 'commission.agen_id')
        ->where('agen.id', '=', $id)
        ->whereRaw('commission.created_at >= DATE_SUB(DATE(NOW()), INTERVAL DAYOFWEEK(NOW())+6 DAY)')
        ->selectRaw('commission.incentive, order_id')
        ->get();

      $incentiveTotal = 0;
      foreach ($commissions as $commission) {
        $incentiveTotal += $commission->incentive;
      }

      return response()->json(['data' => ['incentives' => $commissions, 'incentive_total' => $incentiveTotal]], 200);
    }

    return response()->json(['error' => 'INVALID AGENT ID'], 400);
  }

}