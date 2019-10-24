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

 
Route::get('/', function () {
	$title ="Quimica A.G.";
	$icon ="img/favicon.ico";
	
    return view('Principal')->with('title',$title)->with('icon',$icon);
});

Route::get('Data-base', function () {
		$title ="Quimica A.G.";
		$icon ="img/favicon.ico";
		return view('Principal')->with('title',$title)->with('icon',$icon);
});
		

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
