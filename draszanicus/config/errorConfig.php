<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

$logFile = ROOT_PATH . '/logs/errors.log';
ini_set('error_log', $logFile);