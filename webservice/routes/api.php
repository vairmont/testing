<?php
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
Route::post('/v1/login', 'AuthController@doLogin');
Route::post('/v1/logout', 'AuthController@doLogout');
Route::post('/v1/forgotPassword', 'UserController@forgotPassword');
Route::post('/v1/changePassword', 'UserController@changePassword');

Route::post('/v1/register/agen', 'RegisterController@addAgen');
Route::post('/v1/register/agen/ktp/upload', 'RegisterController@uploadKTP');
Route::post('/v1/register/agen/kk/upload', 'RegisterController@uploadKK');

Route::post('/v1/customer', 'CustomerController@addCustomer');

Route::post('/v1/register/family', 'FamilyController@addFamily');
Route::post('/v1/register/family/ktp/upload', 'FamilyController@uploadKTP');

Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function () {

  Route::post('token/check', 'FCMTokenController@checkToken');
  Route::post('token/add', 'FCMTokenController@addToken');

  Route::get('/profile', 'UserController@getProfile');

  Route::get('/products', 'ProductController@index');
  Route::get('/pos/products', 'ProductControllerPOS@index');
  Route::get('/searchproducts', 'ProductControllerPOS@searchProducts');
  Route::post('/products', 'ProductController@add');
  Route::get('/product/{id}', 'ProductController@show');
  Route::patch('/product/{id}', 'ProductController@edit');
  Route::delete('/product/{id}', 'ProductController@remove');

  Route::get('/cart', 'ApiCartController@index');
  Route::post('/cart', 'ApiCartController@updateCart');
  Route::post('/cart/clear', 'ApiCartController@clearCartItems');
  Route::post('/cart/confirm', 'ApiCartController@finalizeCart');

  Route::get('/cart/customer', 'ApiCartControllerCustomer@index');
  Route::post('/cart/customer', 'ApiCartControllerCustomer@updateCart');
  Route::post('/cart/customer/clear', 'ApiCartControllerCustomer@clearCartItems');

  Route::get('/cart/pos', 'ApiCartControllerPOS@index');
  Route::post('/cart/pos', 'ApiCartControllerPOS@updateCart');
  Route::post('/cart/pos/clear', 'ApiCartControllerPOS@clearCartItems');

  Route::get('/order', 'OrderControllerPOS@getOrderById');

  Route::get('/cashier', 'CashierController@getCash');

  Route::get('/order/pending', 'OrderController@orderPending');
  Route::get('/order/process', 'OrderController@orderProcess');
  Route::get('/order/done', 'OrderController@orderDone');
  Route::get('/order/cancel', 'OrderController@orderCancel');

  Route::get('/orderbill', 'ApiCartControllerCustomer@addOrderBillingDetail');
  Route::get('/order/customer/pending', 'OrderControllerCustomer@orderPending');
  Route::get('/order/customer/process', 'OrderControllerCustomer@orderProcess');
  Route::get('/order/customer/done', 'OrderControllerCustomer@orderDone');
  Route::get('/order/customer/cancel', 'OrderControllerCustomer@orderCancel');

  Route::post('/order/assign-agent', 'OrderController@assignOrderAgent');
  Route::post('/order/cancel-agent', 'OrderController@cancelOrderAgent');
  Route::post('/order/finalize', 'OrderController@finalizeOrder');

  Route::get('/ranks', 'RankingController@index');

  Route::get('/rating', 'RatingController@index');
  Route::post('/rating', 'RatingController@addRating');

  Route::get('/customer', 'CustomerController@getCustomer');

  Route::get('/family', 'FamilyController@getFamily');
  Route::post('/family', 'FamilyController@addFamily');
  Route::post('/family/uploadktp', 'FamilyController@uploadKtpPhoto');

  Route::get('/commission/agen/{id}', 'CommissionController@getTodayCommission');
  Route::get('/commission/agen/{id}/week', 'CommissionController@getWeeklyCommission');
});
