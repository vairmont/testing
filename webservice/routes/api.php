<?php
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/
Route::post('/v1/register/agen', 'RegisterController@addAgen');
Route::post('/v1/login', 'AuthController@doLogin');
Route::post('/v1/logout', 'AuthController@doLogout');
Route::post('/v1/forgotPassword', 'UserController@forgotPassword');
Route::post('/v1/changePassword', 'UserController@changePassword');

Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function() {
  Route::get('/products', 'ProductController@index');
  Route::post('/products', 'ProductController@add');
  Route::get('/product/{id}', 'ProductController@show');
  Route::patch('/product/{id}', 'ProductController@edit');
  Route::delete('/product/{id}', 'ProductController@remove');

  Route::get('/cart', 'ApiCartController@index');
  Route::post('/cart', 'ApiCartController@updateCart');
  Route::post('/cart/clear', 'ApiCartController@clearCartItems');
  Route::post('/cart/confirm', 'ApiCartController@finalizeCart');

  Route::get('/order/pending', 'OrderController@orderPending');
  Route::get('/order/process', 'OrderController@orderProcess');
  Route::get('/order/done', 'OrderController@orderDone');
  Route::get('/order/cancel', 'OrderController@orderCancel');

  Route::post('/order', 'OrderController@create');
  Route::post('/order/assign-agent', 'OrderController@assignOrderAgent');
  Route::post('/order/cancel', 'OrderController@cancelOrder');
  Route::post('/order/agent/cancel', 'OrderController@cancelOrderAgent');
  Route::post('/order/finalize', 'OrderController@finalizeOrder');

  Route::get('/ranks', 'RankingController@index');
  Route::get('/customer', 'CustomerController@getCustomer');
  Route::post('/customer', 'CustomerController@addCustomer');
  Route::get('/family', 'FamilyController@getFamily');
  Route::post('/family', 'FamilyController@addFamily');
  Route::post('/family/ktp/upload', 'FamilyController@uploadKtpPhoto');
  Route::get('/commission/agent/{id}', 'CommissionController@getTodayCommission');
  Route::get('/commission/agent/{id}/week', 'CommissionController@getWeeklyCommission');
});