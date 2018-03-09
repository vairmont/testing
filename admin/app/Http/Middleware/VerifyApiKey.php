<?php

namespace App\Http\Middleware;

use Closure;
use App\User;

class VerifyApiKey
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->header('token');

        $user = User::where('api_key',$token)->first();

        if(empty($token) || count($user) == 0) {
            return response()->json(['message' => 'You are not Authorized.'], 503);
        }

        return $next($request);
    }
}
