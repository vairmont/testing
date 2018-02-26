<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/register', 'RegisterController@create');
Route::post('/register/store', 'RegisterController@store');

Route::get('/', 'LoginController@getLogin')->name('login');
Route::post('/login', 'LoginController@doLogin');
Route::get('/logout', 'LoginController@doLogout');

Route::group(['middleware' => 'isAuthenticated'], function() {
	Route::get('/dashboard', 'DashboardController@create');

	Route::get('/product', 'ProductController@create');
	Route::post('/product/add', ['before' => 'csrf', 'uses' => 'ProductController@store']);
	Route::post('/product/edit/{id}', ['before' => 'csrf', 'uses' => 'ProductController@update'])->name('updateProduct');
	Route::post('/product/delete/{id}', ['before' => 'csrf', 'uses' => 'ProductController@delete'])->name('deleteProduct');

	Route::get('/reseller', 'ResellerController@create');
	Route::post('/reseller/store', ['before' => 'csrf', 'uses' => 'ResellerController@store']);
	Route::post('/reseller/edit/{id}', ['before' => 'csrf', 'uses' => 'ResellerController@update'])->name('updateReseller');
	Route::post('/reseller/delete/{id}', ['before' => 'csrf', 'uses' => 'ResellerController@delete'])->name('deleteReseller');

	Route::get('/customer', 'CustomerController@create');
	Route::post('/customer/edit/{id}', ['before' => 'csrf', 'uses' => 'CustomerController@update'])->name('updateCustomer');
	Route::post('/customer/delete/{id}', ['before' => 'csrf', 'uses' => 'CustomerController@delete'])->name('deleteCustomer');

	Route::get('/masterdealer', 'MasterDealerController@create');
	Route::post('/masterdealer/store', ['before' => 'csrf', 'uses' => 'MasterDealerController@store']);
	Route::post('/masterdealer/edit/{id}', ['before' => 'csrf', 'uses' => 'MasterDealerController@update'])->name('updateDealer');
	Route::post('/masterdealer/delete/{id}', ['before' => 'csrf', 'uses' => 'MasterDealerController@delete'])->name('deleteDealer');

	Route::get('/voucher', 'VoucherController@create');
	Route::post('/voucher/add', ['before' => 'csrf', 'uses' => 'VoucherController@store']);
	Route::post('/voucher/edit/{id}', ['before' => 'csrf', 'uses' => 'VoucherController@update'])->name('updateVoucher');
	Route::post('/voucher/delete/{id}', ['before' => 'csrf', 'uses' => 'VoucherController@delete'])->name('deleteVoucher');

	Route::get('/ticket-support', 'TicketController@create');
	Route::post('/ticket-support/reply', ['before' => 'csrf', 'uses' => 'TicketController@reply']);
	Route::post('/ticket-support/close', ['before' => 'csrf', 'uses' => 'TicketController@close']);

	Route::get('/service-location', 'ServiceController@create');
	Route::post('/service-location/add', ['before' => 'csrf', 'uses' => 'ServiceController@store']);
	Route::post('/service-location/edit/{id}', ['before' => 'csrf', 'uses' => 'ServiceController@update'])->name('updateService');
	Route::post('/service-location/delete/{id}', ['before' => 'csrf', 'uses' => 'ServiceController@delete'])->name('deleteService');

	Route::get('/newspromo', 'NewsPromoController@create');
	Route::post('/newspromo/add', ['before' => 'csrf', 'uses' => 'NewsPromoController@store']);
	Route::post('/newspromo/edit/{id}', ['before' => 'csrf', 'uses' => 'NewsPromoController@update'])->name('updateNews');
	Route::post('/newspromo/delete/{id}', ['before' => 'csrf', 'uses' => 'NewsPromoController@delete'])->name('deleteNews');

	Route::get('/report/orders', 'ReportController@getOrders');
	Route::get('/report/product', 'ReportController@getProducts');

	Route::post('/city/add', ['before' => 'csrf', 'uses' => 'CityController@store']);

	Route::get('/placeSearch', 'MapsController@create')->name('placeSearch');
	Route::post('/placeSearch/store', ['before' => 'csrf', 'uses' => 'MapsController@store'])->name('storePlaceSearch');
});