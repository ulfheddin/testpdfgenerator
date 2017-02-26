<?php
header('Content-Type: text/html; charset=utf-8');
session_start();

// Site Config
require_once 'config.php';
require_once 'libs/route.php';
require_once 'libs/default.php';
require_once 'libs/fpdf/fpdf.php';


if (empty($_COOKIE['sessionID'])) {
	$add_controller = 'login';
} elseif (isset($_COOKIE['sessionID'])) {
	$mycookie = $_COOKIE['sessionID'];
	$credentials = getSessionID($mycookie);
	if (count($credentials) != 0){
		setcookie("sessionID", "$mycookie", time()+60*60);
		if(isset($_GET['_route_'])){
			$path = my_rout($_GET['_route_']);
			if($path == 403){
				$add_controller = 'errors/403';
			} elseif ($path == 404) {
				$add_controller = 'errors/404';
			} else {
				$path_mass = explode('/', $path);
				$get_path = array();
				foreach ($path_mass as $pm) {
					$small_path = explode('=', $pm);
					if($small_path[0] == 'controller'){
						$add_controller =  $small_path[1];
					}else{
						$get_path[$small_path[0]] = $small_path[1];
						if(!isset($add_controller)){
					 		$add_controller = 'errors/404';
						}
					}
				}
			}
		} else {$add_controller = 'deposit_receipt';}
	} else {
		unset($_COOKIE['sessionID']);
		setcookie('sessionID', '', time() - 3600, '/'); // empty value and old timestamp
		$add_controller = 'login';}    
} 
    //Adding necessary controllers    
if ($add_controller != 'login' && $add_controller != 'errors/404' && $add_controller != 'errors/403' && $_POST['form_id'] != "deposit_receipt" && $_POST['form_id'] != "invoice" && $_POST['form_id'] != "order_receipt" && $_POST['form_id'] != "refund_confirmation"){
	include DIR_ROOT . '/controller/header.php';
	include VIEW.'header.tpl';
}
    
include DIR_ROOT . '/controller/'.$add_controller.'.php';
include VIEW.$add_controller.'.tpl';
    
if ($add_controller != 'login' && $add_controller != 'errors/404' && $add_controller != 'errors/403' && $_POST['form_id'] != "deposit_receipt" && $_POST['form_id'] != "invoice" && $_POST['form_id'] != "order_receipt" && $_POST['form_id'] != "refund_confirmation"){
	include DIR_ROOT . '/controller/footer.php';
	include VIEW.'footer.tpl';  
}