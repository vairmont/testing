<?php

// routes API
Route::get('/v1/productCategories', 'ProductCategoryController@getProductCategory');

Route::post('/v1/register/customer', 'RegisterController@addCustomer');
Route::post('/v1/register/reseller', 'RegisterController@addReseller');
Route::post('/v1/register/reseller/photo/upload', 'RegisterController@uploadStorePhoto');

Route::post('/v1/forgotPassword', 'UserController@forgotPassword');
Route::post('/v1/login', 'AuthController@doLogin');
Route::post('/v1/logout', 'AuthController@doLogout');

	Route::post('/v1/token/check', 'FCMTokenController@checkToken');
	Route::post('/v1/token/add', 'FCMTokenController@addToken');

	Route::post('/v1/products', 'ProductController@getProduct');
	Route::post('/v1/productByCategory', 'ProductController@getProductByCategory');

	Route::post('/v1/cart', 'CartController@getCart');
	Route::post('/v1/cart/add', 'CartController@addCart');
	Route::post('/v1/cart/qty', 'CartController@updateQty');
	Route::post('/v1/cart/remove', 'CartController@removeProduct');

	Route::post('/v1/voucher/check', 'VoucherController@checkVoucher');

	Route::post('/v1/orders/new', 'OrderController@getOrderNew');
	Route::post('/v1/orders/progress', 'OrderController@getOrderProgress');
	Route::post('/v1/orders/cancel', 'OrderController@getOrderCancel');
	Route::post('/v1/orders/finish', 'OrderController@getOrderFinish');
	Route::post('/v1/order/checkout', 'OrderController@orderCheckout');
	Route::post('/v1/order/take', 'OrderController@orderTake');
	Route::post('/v1/order/approve', 'OrderController@orderApprove');
	Route::post('/v1/order/cancel', 'OrderController@orderCancel');
	Route::post('/v1/order/chatList', 'OrderController@chatList');
	Route::post('/v1/order/chat', 'OrderController@orderChat');
	Route::post('/v1/order/offeringList', 'OrderController@getOffering');
	Route::post('/v1/order/offering', 'OrderController@orderOffering');
	Route::post('/v1/order/licenseList', 'OrderController@getLicenseNumber');
	Route::post('/v1/order/licenseNumber', 'OrderController@orderLicenseNumber');
	Route::post('/v1/order/complete', 'OrderController@markAsComplete');

	Route::post('/v1/testproduct', 'TestProductController@testProduct');

	Route::post('/v1/profile', 'UserController@getProfile');
	Route::post('/v1/profile/edit', 'UserController@editProfile');
	Route::post('/v1/profile/changePassword', 'UserController@changePassword');

	