<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Products\ProductController;
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

Route::get('/', function () {
    return view('welcome');
});
Route::group(['prefix'=>'dashboard','as'=>'dashboard','middleware'=>'verified'],function(){
    Route::get('/',[DashboardController::class,'index']);//->middleware('auth');
    Route::group(['prefix'=>'products','as'=>'.products.'],function(){
        Route::get('/',[ProductController::class,'index'])->name('index');
        Route::get('create',[ProductController::class,'create'])->name('create');
        Route::get('edit/{id}',[ProductController::class,'edit'])->name('edit');
        Route::post('store',[ProductController::class,'store'])->name('store');
        Route::put('update/{id}',[ProductController::class,'update'])->name('update');
        Route::delete('delete',[ProductController::class,'delete'])->name('delete');
    });
});

Auth::routes(['verify' => true]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
