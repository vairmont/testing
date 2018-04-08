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

Route::post('/v1/register/agen', 'RegisterController@addAgen');

Route::post('/v1/login', 'AuthController@doLogin');
Route::post('/v1/logout', 'AuthController@doLogout');
Route::post('/v1/forgotPassword', 'UserController@forgotPassword');
Route::post('/v1/changePassword', 'UserController@changePassword');

Route::get('/products', 'ProductController@index');
Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function () {
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
  Route::post('/order/finalize', 'OrderController@finalizeOrder');

  Route::get('/ranks', 'RankingController@index');

  Route::get('/getheir', 'HeirController@getHeir');
  Route::post('/heir', 'HeirController@addHeir');
  Route::post('/heir/uploadktp', 'HeirController@uploadKtpPhoto');
  Route::post('/heir/uploadkk', 'HeirController@uploadKkPhoto');
  Route::post('/heir/uploadakta', 'HeirController@uploadAktaPhoto');

  Route::get('/commission', 'CommissionController@getAgentCommission');
});