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


  public function getCommission(Request $request) {

      $commissions = Commission::Join('agen', 'agen.identifier', '=', 'commission.agen_id')
        ->join('order', 'order.id', '=', 'commission.order_id')
        ->where('agen.identifier', '=', $request->get('user')->id)
        ->selectRaw('commission.incentive,commission.margin_penjualan,commission.commission_netto,commission.commission_pph,order_id, invoice_no, order.created_at, order.total');
      
      if(isset($request->from) && !empty($request->from) && isset($request->to) && !empty($request->to)) {
        $commissions = $commissions->whereBetween('commission.created_at', [$request->from, $request->to]);
      }

      $commissions = $commissions->get();
      
      $incentiveTotal = 0;
      $marginTotal = 0;
      $commissionNettoTotal = 0;
      $commissionPphTotal = 0;
      foreach ($commissions as $commission) {
        $incentiveTotal += $commission->incentive;
        $commissionPphTotal += $commission->commission_pph;
        $commissionNettoTotal += $commission->commission_netto;
        $marginTotal += $commission->margin_penjualan;
      }

      return response()->json(['data' => ['commission' => $commissions, 'incentive_total' => $incentiveTotal, 'commissionPphTotal' => $commissionPphTotal, 'commissionNettoTotal' => $commissionNettoTotal, 'marginTotal' => $marginTotal]], 200);
    
  }


}