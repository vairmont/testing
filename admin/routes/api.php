<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/v1/users', ['as' => 'login', 'uses' => 'AuthController@doLogin']);

Route::group(['middleware' => 'VerifyBearerToken'], function () {
  Route::get('/v1/products', 'ProductController@index');
  Route::post('/v1/products', 'ProductController@add');
  Route::get('/v1/product/{id}', 'ProductController@show');
  Route::patch('/v1/product/{id}', 'ProductController@edit');
  Route::delete('/v1/product/{id}', 'ProductController@remove');

  Route::get('/v1/cart', 'ApiCartController@index');
  Route::post('/v1/cart', 'ApiCartController@updateCart');
});