<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::resource('typeproduct', 'typeProductController');
Route::resource('products', 'productsController');
Route::resource('bill', 'billController');
Route::resource('customer', 'customerController');
Route::resource('user', 'UserController');
Route::resource('cancelOrder', 'cancelOrderController');
Route::resource('staff', 'staffController');

Route::prefix('/')->group(function(){
    Route::get('','itemController@home');
    Route::get('/skills','testController@index');
    Route::get('/index','itemController@homePage')->name('index');
    Route::get('/introduce','itemController@introduce')->name('introduce');
    Route::post('confirm', 'confirmController@index')->name('confirm');
    Route::get('/gg', function(){
        $config = array();
        $config['center']='Gia Lai Viet Nam';
        $config['zoom']='14';
        $config['map_height']='500px';
        $config['map_height']='500px';
        $config['scrollwheel']=false;
       
    
        app('map')->initialize($config);
    
        // set up the marker ready for positioning
        // once we know the users location
        $marker = array();
        app('map')->add_marker($marker);
        
        $map = app('map')->create_map();
        return view('ggmap')->with('map',$map);
    });
    Route::get('{type}', 'itemController@index')->name('category');
    Route::post('findOrder',function(Request $rq){
        return redirect()->route('bill.show',[$rq->id]);
    })->name('findOrder');
    
});