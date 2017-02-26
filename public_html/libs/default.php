<?php
function generateSessionID($length=30) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHI JKLMNOPRQSTUVWXYZ0123456789";
    $sessionID = "";
    $clen = strlen($chars) - 1;
    
    while (strlen($sessionID) < $length) {
            $sessionID .= $chars[mt_rand(0,$clen)];  
    }
    return $sessionID;
}

function getSessionID($mycookie){		
    global $db;
    
    $query = "SELECT id, username, password, sessionid FROM users WHERE sessionid='$mycookie' LIMIT 1";
    $result = mysqli_query ($db, $query) or die ("ERROR" . mysqli_connect($db));
        if($result){
            $credentials = mysqli_fetch_assoc($result);            
        }    
    return $credentials;
}

function getCredentialsByUser($username){		
    global $db;
    
    $query = "SELECT id, username, password, sessionid FROM users WHERE username='$username' LIMIT 1";
    $result = mysqli_query ($db, $query) or die ("ERROR" . mysqli_connect($db));
    
    if($result){
    $data = mysqli_fetch_assoc($result);
    }
    return $data;
}

function updateCredentials($sessionID, $user_id){		
    global $db;
    
    $query = "UPDATE users SET sessionid='$sessionID' WHERE id='$user_id'";  
    $result = mysqli_query ($db, $query) or die ("ERROR" . mysqli_connect($db));
    return TRUE;    
}
?>