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

Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function () {
  Route::get('/products', 'ProductController@index');
  Route::post('/products', 'ProductController@add');
  Route::get('/product/{id}', 'ProductController@show');
  Route::patch('/product/{id}', 'ProductController@edit');
  Route::delete('/product/{id}', 'ProductController@remove');

  Route::get('/cart', 'ApiCartController@index');
  Route::post('/cart', 'ApiCartController@updateCart');
  Route::post('/cart/clearItems', 'ApiCartController@clearCartItems');
  Route::post('/cart/confirm', 'ApiCartController@finalizeCart');

  Route::get('/orders', 'OrderController@index');
  Route::post('/order', 'OrderController@create');
  Route::post('/order/assign-agent', 'OrderController@assignOrderAgent');
  Route::post('/order/cancel', 'OrderController@cancelOrder');
  Route::post('/order/cancel-agent', 'OrderController@cancelOrderAgent');
  Route::post('/order/finalize', 'OrderControl  ler@finalizeOrder');
});