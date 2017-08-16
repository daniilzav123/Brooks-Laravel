<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/



Route::get('/', function () {
    return view('welcome');
});

//Route::get('/download', 'TraceController@getDownload');

Route::resource('/Api/Trace/Log', 'TraceController');
Route::resource('/Api/Server/Address', 'ServerController');
Route::resource('/login', 'LoginInfoController');
Route::resource('/job/create', 'JobInfoController');
