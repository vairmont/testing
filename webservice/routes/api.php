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
Route::post('/v1/register/agen', 'RegisterController@addAgen');
Route::post('/v1/login', 'AuthController@doLogin');
Route::post('/v1/logout', 'AuthController@doLogout');
Route::post('/v1/forgotPassword', 'UserController@forgotPassword');
Route::post('/v1/changePassword', 'UserController@changePassword');

Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function () {
  Route::get('/v1/products', 'ProductController@index');
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
  Route::get('/getfamily', 'FamilyController@getFamily');
  Route::post('/family', 'FamilyController@addFamily');
  Route::post('/family/uploadktp', 'FamilyController@uploadKtpPhoto');
  Route::get('/commission/agen/{id}', 'CommissionController@getTodayCommission');
  Route::get('/commission/agen/{id}/week', 'CommissionController@getWeeklyCommission');
});