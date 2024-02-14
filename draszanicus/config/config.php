<?php


$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);

$dotenv->load();

define('ROOT_PATH', $_ENV['ROOT_PATH']);
define('ROOT_DIR', $_ENV['ROOT_DIR']);
require_once ROOT_PATH . "/config/errorConfig.php";
require_once ROOT_PATH . "/config/hostsConfig.php";
require_once ROOT_PATH . "/config/dbConfig.php";
