<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 27/03/18
 * Time: 01.30
 */

namespace App\Http\Middleware;

use Closure;
use App\User;
use Illuminate\Http\Request;

class VerifyBearerToken {

  public function handle(Request $request, Closure $next)
  {
    $user = User::where('api_token', '=', $request->bearerToken())->first();
    if($user) {
      $request->attributes->add(['user' => $user]);
      return $next($request);
    }
    return response()->json(['error' => 'Authorization failed.'], 401);
  }
}