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


Route::get('/','PrincipalController@index');

Route::get('/Data-base', 'PrincipalController@BD');
	
Route::apiResource('/getMolecules','View_DATABASE\MoleculesController');

Auth::routes(['verify' => true]);

Route::get('/logout', 'Auth\LoginController@logout');

Route::get('/home', 'HomeController@index')->name('home');

//base de datos  pk's y K overalls

Route::get('/ModifyBD/DB-pk-Koverall','DB_pk_koverall_Controller@DB_pk_Koverall')->name('DB_pk_Koverall');

Route::get('/ModifyBD/DB-pk-Koverall/Molecules','DB_pk_koverall_Controller@Molecules')->name('Molecules');
Route::get('/ModifyBD/DB-pk-Koverall/Solvents','DB_pk_koverall_Controller@Solvents')->name('Solvents');
Route::get('/ModifyBD/DB-pk-Koverall/Radicals','DB_pk_koverall_Controller@Radicals')->name('Radicals');
Route::get('/ModifyBD/DB-pk-Koverall/References','DB_pk_koverall_Controller@References')->name('References');
Route::get('/ModifyBD/DB-pk-Koverall/PK_s','DB_pk_koverall_Controller@PK_s')->name('PK_s');
Route::get('/ModifyBD/DB-pk-Koverall/K_overall','DB_pk_koverall_Controller@K_overall')->name('K_overall');


Route::apiResource('/MoleculeTable','ABC_DATABASE\MoleculeTable')->middleware(['auth','role:admin,super-admin']);
Route::apiResource('/SolventsTable','ABC_DATABASE\SolventsTable')->middleware(['auth','role:admin,super-admin']);
Route::apiResource('/RadicalsTable','ABC_DATABASE\RadicalsTable')->middleware(['auth','role:admin,super-admin']);
Route::apiResource('/ReferencesTable','ABC_DATABASE\ReferencesTable')->middleware(['auth','role:admin,super-admin']);
Route::apiResource('/PK_sTable','ABC_DATABASE\PK_sTable')->middleware(['auth','role:admin,super-admin']);
Route::apiResource('/K_overalsTable','ABC_DATABASE\K_overalsTable')->middleware(['auth','role:admin,super-admin']);
