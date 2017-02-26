<?php
$host = 'server107.web-hosting.com'; 		// адрес сервера 
$database = 'metoiwlu_db';            // имя базы данных
$user = 'metoiwlu_root'; 		// имя пользователя
$password = 'd42p9TtN'; 		// пароль

$db = mysqli_connect($host, $user, $password, $database) or die("Error " . mysqli_error($db));

//Основные константы
define('HTTP', 'http://');
define('URL', $_SERVER['HTTP_HOST'] . '/');
define('DIR_ROOT', __DIR__ . '/');
define('VIEW', DIR_ROOT .'view/default/');
?>