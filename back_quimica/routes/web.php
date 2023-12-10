<?php

use App\Http\Controllers\AppsWeb;
use App\Http\Controllers\Kinetics;
use App\Http\Controllers\KOverals;
use App\Http\Controllers\login;
use App\Http\Controllers\Moleculas;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',[login::class,'index']);
Route::resource('webApps', AppsWeb::class);
Route::resource('k-overals', KOverals::class);
Route::resource('molecules',Moleculas::class);
Route::resource('kinetics',Kinetics::class);

