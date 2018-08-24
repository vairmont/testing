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

Route::get('/', 'AuthController@getLogin');
Route::get('/dologin','AuthController@doLogin');

Route::get('/dashboard', 'DashboardController@getDashboard');



Route::get('/daftaritem', 'ItemController@getDaftarItem');

Route::get('/byitem', 'ReportController@getByItem');
Route::get('/bystore', 'ReportController@getBystore');
Route::get('/bycategory','ReportController@getBycategory');
Route::get('/byemployee','ReportController@getByEmployee');
Route::get('/bychasier','ReportController@getByChasier');


Route::get('/byagent','EmployeeController@getByAgent');
Route::get('/bywithdraw', 'WithDrawController@getByWithDraw');


Route::get('/verifywithdraw/{id}','WithDrawController@updateStatus')->name('status');

Route::post('/verifyagent/{id}','EmployeeController@updateVerify')->name('verify');

Route::get('/bypurchaseorder','InventoryController@getByPurchaseorder');
Route::get('/bytransferorder','InventoryController@getByTransferorder');
Route::get('/bystockadjustment','InventoryController@getByAdjustment');
Route::get('/bysupplier','InventoryController@getBySupplier');
Route::get('/byinventoryhistory','InventoryController@getByInventoryHistory');
Route::get('/byinventoryvaluation','InventoryController@getByInventoryValuation');



Route::get('/additem', 'ItemController@formItem');
Route::post('/additem', 'ItemController@saveItem');
Route::get('/edititem/{id}', 'ItemController@formItem');
Route::post('/edititem/{id}', 'ItemController@saveItem');
Route::get('/deleteitem/{id}', 'ItemController@deleteItem');
Route::get('/slider', 'ItemController@getByAddSlider');
Route::post('/insert', 'ItemController@saveSlider');


Route::get('/kategori', 'ItemController@getKategori');
Route::get('/addkategori', 'ItemController@formKategori');
Route::post('/addkategori', 'ItemController@saveKategori');
Route::get('/editkategori/{id}', 'ItemController@formKategori');
Route::post('/editkategori/{id}', 'ItemController@saveKategori');
Route::get('/deletekategori/{id}', 'ItemController@deleteKategori');


Route::get('/modifier', 'ItemController@getModifier');
Route::get('/addmodifier', 'ItemController@getAddModifier');
Route::post('/editmodifier/{id}', 'ItemController@editItem');

Route::get('/diskon', 'ItemController@getDiskon');
Route::get('/adddiskon', 'ItemController@formDiskon');
Route::post('/adddiskon', 'ItemController@saveDiskon');
Route::get('/editdiskon/{id}', 'ItemController@formDiskon');
Route::post('/editdiskon/{id}', 'ItemController@saveDiskon');
Route::get('/deletediskon/{id}', 'ItemController@deleteDiskon');
