<?php

namespace App\Http\Middleware;

use Closure;

class isAuthenticated
{
    public function handle($request, Closure $next)
    {
        if (!$request->session()->get('user_id')) {
            return redirect('/')->withErrors("You're not authorized to access this page. Please login.");
        }

        return $next($request);
    }
}
