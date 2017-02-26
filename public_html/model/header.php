<?php
function unsetCookie() {
	global $db;
    	$query = "UPDATE users SET sessionid='' WHERE username='billingteam'";  
	$result = mysqli_query ($db, $query) or die ("ERROR" . mysqli_connect($db));
   	return TRUE; 
}