<?php
if (empty($_COOKIE['sessionID'])) {
    header("Location: http://metodkabi.net/login");
} elseif (isset($_COOKIE['sessionID'])) {
    $mycookie = $_COOKIE['sessionID'];
    $credentials = getSessionID($mycookie);
    if (count($credentials) != 0){
        setcookie("sessionID", "$mycookie", time()+60*60);
    }
}
    include DIR_ROOT . 'model/header.php';

if ($_POST['form_id'] == "end_session"){
	if (isset($_COOKIE['sessionID'])) {
		unset($_COOKIE['sessionID']);
		setcookie('sessionID', '', time() - 3600, '/'); // empty value and old timestamp
	}
	unsetCookie();
	header("Location: http://metodkabi.net/login");
}
