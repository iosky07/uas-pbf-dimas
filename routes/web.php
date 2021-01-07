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
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('forum/read/{slug}','ForumController@show')->name('forumslug');

Route::resource('/forum','ForumController');

Route::post('/comment/addComment/{forum}','CommentController@addComment')->name('addComment');

Route::get('/user/{user}','ProfileController@index')->name('profile');