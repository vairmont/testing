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
Route::post('/v1/forgotPasswordtes', 'UserController@forgotPassword2');
Route::post('/v1/changePassword', 'UserController@changePassword');

Route::get('/v1/dashboard1','DashboardController@getDashboard1');
Route::get('/v1/digital/notification', 'DigitalProductController@notification');

Route::post('/v1/register/agen', 'RegisterController@addAgen');
Route::post('/v1/register/agen/ktp/upload', 'RegisterController@uploadKTP');
Route::post('/v1/register/agen/kk/upload', 'RegisterController@uploadKK');
Route::post('/v1/agen/photo/upload', 'UserController@uploadPhoto');

Route::post('/v1/customer', 'CustomerController@addCustomerNew');
Route::post('/v1/customertes', 'CustomerController@addCustomer2');
Route::get('/v1/customer/check', 'CustomerController@checkData');
Route::post('/v1/customer/photo/upload', 'CustomerController@uploadPhotoCustomer');

Route::post('/v1/otp/request', 'SmsController@requestOTP');
Route::post('/v1/otp/check', 'SmsController@verifyCheckCustomer');
Route::post('/v1/otp/check/agen', 'SmsController@verifyCheckAgen');

Route::post('/v1/stores', 'CustomerController@getStore');
Route::post('/v1/agen', 'CustomerController@getAgen');

Route::post('/v1/register/family', 'FamilyController@addFamily');
Route::post('/v1/register/family/ktp/upload', 'FamilyController@uploadKTP');

Route::group(['prefix' => '/v1','middleware' => 'VerifyBearerToken'], function () {

  Route::post('/token/check', 'FCMTokenController@checkToken');
  Route::post('/token/add', 'FCMTokenController@addToken');
  Route::post('/notif', 'OrderController@manualNotif');

  Route::get('/profile', 'UserController@getProfile');
  Route::post('/profile', 'UserController@editProfile');
  Route::post('/changePassword', 'UserController@changePassword');

  Route::get('/category', 'ProductController@categoryIndex');
  Route::get('/products', 'ProductController@index');
  Route::get('/pos/products', 'ProductControllerPOS@index');
  Route::get('/searchproducts', 'ProductControllerPOS@searchProducts');
  Route::post('/products', 'ProductController@add');
  Route::get('/product/{id}', 'ProductController@show');
  Route::patch('/product/{id}', 'ProductController@edit');
  Route::delete('/product/{id}', 'ProductController@remove');

  Route::post('/digital', 'DigitalProductController@checkOp');
  Route::post('/digital/create', 'DigitalProductController@create');

  Route::get('/chat', 'ChatController@chatList');
  Route::post('/chat', 'ChatController@orderChat');

  Route::get('/cart', 'ApiCartController@index');
  Route::post('/cart', 'ApiCartController@updateCart');
  Route::get('/cart/clear', 'ApiCartController@clearCartItems');
  Route::post('/cart/confirm', 'ApiCartController@finalizeCart');

  Route::get('/cart/customer', 'ApiCartControllerCustomer@index');
  Route::post('/cart/customer', 'ApiCartControllerCustomer@updateCart');
  Route::post('/cart/customer/clear', 'ApiCartControllerCustomer@clearCartItems');

  Route::get('/cart/pos', 'ApiCartControllerPOS@index');
  Route::post('/cart/pos/update', 'ApiCartControllerPOS@updateCart');
  Route::get('/cart/pos/clear', 'ApiCartControllerPOS@clearCartItems');

  Route::post('/order/pos/create', 'OrderControllerPOS@create');
  Route::post('/order/pos/finalize', 'OrderControllerPOS@finalizeOrder');
  Route::post('/pos/topup', 'OrderControllerPOS@topUp');

  Route::post('/order', 'OrderControllerPOS@getOrderById');
  Route::post('/order/pos/print', 'OrderControllerPOS@printReceipt');

  Route::post('/updatecustomer', 'CustomerController@updateCustomer');

  Route::post('/cashier/create', 'CashierController@createCashier');
  Route::post('/cashier/get', 'CashierController@getCash');
  Route::post('/cashier/close', 'CashierController@closingCashier');
  Route::post('/cashier/print', 'CashierController@printClosing');

  Route::get('/order/pending', 'OrderController@orderPending');
  Route::get('/order/process', 'OrderController@orderProcess');
  Route::get('/order/done', 'OrderController@orderDone');
  Route::get('/order/cancel', 'OrderController@orderCancel');

  Route::post('/order/customer/create', 'OrderControllerCustomer@create');
  Route::post('/order/customer/createnew', 'OrderControllerCustomer@createNew');
  Route::get('/order/customer/process', 'OrderControllerCustomer@orderProcess');
  Route::get('/order/customer/done', 'OrderControllerCustomer@orderDone');
  Route::get('/order/customer/cancel', 'OrderControllerCustomer@orderCancel');

  Route::post('/jne', 'JneController@updateStatusJne');
  Route::post('/tracking', 'JneController@trackingJne');

  Route::post('/order/assign-agent', 'OrderController@assignOrderAgent');
  Route::post('/order/cancel', 'OrderController@cancelOrderAgent');
  Route::post('/purchase', 'OrderController@purchase');
  Route::get('/order/done', 'OrderController@purchaseDone');
  Route::post('/order/finalize', 'OrderController@finalizeOrder');
  Route::post('/order/finalize/bundling', 'OrderController@finalizeOrderBundling');
  Route::post('/order/accept', 'OrderController@acceptOrder');
  Route::post('/shipment', 'ShipmentController@addShipment');
  Route::post('/agen/shipment', 'ShipmentController@updateShipmentMethod');

  Route::get('/province', 'AddressController@getProvince');
  Route::get('/city', 'AddressController@getCity');
  Route::get('/region', 'AddressController@getRegion');

  Route::get('/ranks', 'RankingController@index');
  Route::get('/akh', 'RankingController@akh');
  Route::get('/promo', 'PromoController@index');
  Route::get('/slider', 'PromoController@sliderIndex');
  Route::get('/recommendation', 'PromoController@recommendationIndex');
  Route::get('/hot', 'PromoController@hotIndex');
  Route::get('/sold', 'PromoController@soldIndex');

  Route::get('/notif', 'NotificationController@index');

  Route::post('/voucher', 'VoucherController@checkVoucher');

  Route::get('/saldo', 'WalletController@cekSaldo');
  Route::post('/wallet', 'WalletController@paymentWallet');


  Route::post('/withdraw', 'OrderController@withdraw');
  Route::get('/withdraw', 'WithdrawController@index');
  Route::get('/withdraw/pending', 'WithdrawController@pending');   

  Route::get('/rating', 'RatingController@index');
  Route::post('/rating', 'RatingController@addRating');

  Route::get('/getcustomer', 'UserController@getCustomerList');
  Route::get('/customer', 'CustomerController@getCustomer');

  Route::get('/address', 'AddressController@getAddress');
  Route::post('/address', 'AddressController@addAddress');
  Route::post('/editaddress', 'AddressController@editAddress');

  Route::get('/family', 'FamilyController@getFamily');
  Route::get('/commission', 'CommissionController@getCommission');
});
