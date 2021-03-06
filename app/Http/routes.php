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
Route::resource('/job/viewcurrent', 'JobInfoController@getJobList');
Route::resource('/job/submitcurrent', 'JobInfoController@submitCurrent');
Route::resource('/job/previous', 'JobInfoController@previous');
Route::resource('/task/reminder', 'TaskReminderController');
Route::resource('/reminders/view', 'TaskReminderController@getReminders');
Route::resource('/equip/log/create', 'EquipmentLogController');
Route::resource('/equip/MyEquipment', 'EquipmentLogController@getEquipList');
Route::resource('/equip/log/view', 'EquipmentLogController@getEquipLogHistory');
Route::resource('/equip/routine/create', 'EquipmentRoutineController');
Route::resource('/equip/routine/view', 'EquipmentRoutineController@getEquipList');
Route::resource('/equip/schedule/create', 'EquipmentScheduleController');
Route::resource('/equip/schedule/view', 'EquipmentScheduleController@getEquipList');
Route::resource('/equip/repair/create', 'EquipmentRepairController');
Route::resource('/equip/repair/view', 'EquipmentRepairController@getEquipList');
Route::resource('/equip/repair/createneeded', 'EquipmentRepairController@createneeded');
Route::resource('/equip/repair/viewneeded', 'EquipmentRepairController@viewneeded');
