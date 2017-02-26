<?php
if (isset($_COOKIE['sessionID'])){
    $mycookie = $_COOKIE['sessionID'];
    $credentials = getSessionID($mycookie);
    if (count($credentials) != 0){
        setcookie("sessionID", "$mycookie", time()+60*60);
        header("Location: http://metodkabi.net/deposit_receipt");
    } 
} elseif ($_POST['form_id'] == "log_admin"){
    $username = $_POST['username'];
    $credentials = getCredentialsByUser($username);
    if($credentials['password'] === $_POST['password']) {
        session_start();   
        $SESSION['sessionID'] = md5(generateSessionID(30));
        $sessionID = $SESSION['sessionID'];
        setcookie("sessionID", "$sessionID", time()+60*60);        
        updateCredentials($sessionID, $credentials['id']);
        header("Location: http://metodkabi.net/deposit_receipt");
    } 
} else {}