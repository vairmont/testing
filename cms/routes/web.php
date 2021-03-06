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
Route::get('/dologout','AuthController@doLogout');

Route::group(['middleware'=>['auth']],function (){

Route::get('/dashboard', 'DashboardController@getDashboard');
Route::get('/daftaritem', 'ItemController@getDaftarItem');

Route::get('/byitem', 'ReportController@getByItem');
Route::get('/bystore', 'ReportController@getBystore');
// untuk Laporan penjualan (custom) untuk bulan November ke atas 
Route::get('/bystorenov', 'ReportController@getBystoreNov');
Route::get('/bystorenovinvoice/{id}','ReportController@getInvoiceNov')->name('getinvnov');

Route::get('/bymargin','ReportController@getByMargin');

// tombol inVoice untuk Laporan Penjualan
Route::get('/bystoreinvoice/{id}','ReportController@getInvoice')->name('getinv');


Route::get('/bycategory','ReportController@getBycategory');
Route::get('/byproduct/{category}','ReportController@getByProduct');
Route::get('/byemployee','ReportController@getByEmployee');

Route::get('/bysupply', 'SupplierController@getBySupplier');

//Wanee Controller
Route::get('/byagent','EmployeeController@getByAgent');
Route::get('/bywaneehistory','EmployeeController@getBywanneHistory');
Route::get('/bywaneepending','EmployeeController@getByWaneePending');
Route::get('/bywaneeapprove','EmployeeController@getByWaneeApprove');
Route::get('/byshowwithdraw', 'WithDrawController@getByShowWithDraw');
Route::post('/verifywanee3','EmployeeController@updateStatus1')->name('status3');
Route::post('/verifywanee4','EmployeeController@updateStatus2')->name('status4');
Route::get('/verifywanee2/{id}','EmployeeController@updateStatus')->name('status2');
Route::get('/verifywanee/{id}','EmployeeController@updateStatus')->name('status1');

//JNE Controller
Route::get('/byjne','JneController@getByJne');
Route::get('/verifyjne/{id}','JneController@updateStatus')->name('statusjne');

//Withdraw Controller
Route::get('/bywithdraw', 'WithDrawController@getByWithDraw');
Route::get('/bywithdrawdone', 'WithDrawController@getByWithDrawDone');
Route::get('/verifywithdraw/{id}','WithDrawController@updateStatus')->name('status');
Route::post('/verifycheckbox','EmployeeController@updateCheck')->name('check1');
Route::post('/verifyagent/{id}','EmployeeController@updateVerify')->name('verify');
Route::post('/verifywithdraw','WithDrawController@updateStatus')->name('check2');
Route::post('/verifyshowwithdraw','WithDrawController@updateStatusWithdraw')->name('check3');

Route::get('/bypurchaseorder','InventoryController@getByPurchaseorder');
Route::get('/bytransferorder','InventoryController@getByTransferorder');
Route::get('/bystockadjustment','InventoryController@getByAdjustment');
Route::post('/editstock/{id}', 'InventoryController@editStock');
Route::get('/bysupplier','InventoryController@getBySupplier');
Route::get('/byinventoryhistory','InventoryController@getByInventoryHistory');
Route::get('/byinventoryvaluation','InventoryController@getByInventoryValuation');

Route::post('/finalize', 'OrderController@finalizeOrder');
Route::get('/order', 'OrderController@orderProcess');
Route::get('/paymentsuccess', 'ReportController@paymentSuccess');

//Item COntroller
Route::get('/additem', 'ItemController@formItem');
Route::post('/additem', 'ItemController@saveItem');
Route::get('/edititem/{id}', 'ItemController@formItem');
Route::post('/edititem/{id}', 'ItemController@saveItem');
Route::get('/deleteitem/{id}', 'ItemController@deleteItem');
Route::get('/slider', 'ItemController@getByAddSlider');
Route::post('/insert', 'ItemController@saveSlider');

//Shipment Controller
Route::get('/finalize', 'ShipmentController@finalizeOrder')->name('finalize');
Route::get('/delivery', 'ShipmentController@orderDeliver');
Route::get('/done', 'ShipmentController@orderFinished');
Route::get('/delete/{id}', 'ShipmentController@deleteOrder')->name('delete');
Route::get('/deliver', 'ShipmentController@deliverOrder')->name('delivery');
Route::get('/invoice/{id}', 'ShipmentController@invoice')->name('invoice');
Route::get('/order', 'ShipmentController@orderProcess');

//Category Controller
Route::get('/kategori', 'ItemController@getKategori');
Route::get('/addkategori', 'ItemController@formKategori');
Route::post('/addkategori', 'ItemController@saveKategori');
Route::get('/editkategori/{id}', 'ItemController@formKategori');
Route::post('/editkategori/{id}', 'ItemController@saveKategori');
Route::get('/deletekategori/{id}', 'ItemController@deleteKategori');

//Digital Controller
Route::get('/digitalprod', 'DigitalController@getProductItem');

Route::get('/modifier', 'ItemController@getModifier');
Route::get('/addmodifier', 'ItemController@getAddModifier');
Route::post('/editmodifier/{id}', 'ItemController@editItem');

Route::get('/voucher', 'VoucherController@getVoucher');
Route::post('/voucher/add','VoucherController@addVoucher');

Route::get('/diskon', 'ItemController@getDiskon');
Route::get('/adddiskon', 'ItemController@formDiskon');
Route::post('/adddiskon', 'ItemController@saveDiskon');
Route::get('/editdiskon/{id}', 'ItemController@formDiskon');
Route::post('/editdiskon/{id}', 'ItemController@saveDiskon');
Route::get('/deletediskon/{id}', 'ItemController@deleteDiskon');
});