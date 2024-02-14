<?php
use Pecee\SimpleRouter\SimpleRouter;
use Pecee\SimpleRouter\SimpleRouter as Router;
use Pecee\Http\Url;
use Pecee\Http\Response;
use Pecee\Http\Request;
use \Draszanicus\logic\ControllerLoader;

SimpleRouter::get('/', function() {
    ControllerLoader::load("Home");
});
SimpleRouter::post('/', function() {
    ControllerLoader::load("Home");
});
SimpleRouter::match(['get','post'],"/home/{action}", function ($action){
    ControllerLoader::load("Home");
});


SimpleRouter::post('/loginApi', function (){
    ControllerLoader::load("LoginApi");
});
SimpleRouter::get('/logoutApi', function (){
    ControllerLoader::load("LogoutApi");
});
SimpleRouter::post('/RegisterApi', function (){
    ControllerLoader::load("RegisterApi");
});
SimpleRouter::get('/RegisterApi', function (){
    ControllerLoader::load("RegisterApi");
});
SimpleRouter::match(['get','post'],'/search', function() {

    ControllerLoader::load("Search");
});

SimpleRouter::get('/profile', function() {
    ControllerLoader::load("Profile");
});

SimpleRouter::match(['get','post'], "/profile/{action}", function ($action){
    ControllerLoader::load("Profile");
});
