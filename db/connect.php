<?php
$db = new mysqli('127.0.0.1:33060', 'root', 'mapei084', 'cop4710_app');

if($db->connect_errno){
	//echo $db->connect_errno;
	//echo $db->connect_error;
	die('Sorry, we are having some problems.');
}