<?php
$db = new mysqli('127.0.0.1', 'root', '', 'cop4710_app');

if($db->connect_errno){
	//echo $db->connect_errno;
	//echo $db->connect_error;
	die('Sorry, we are having some problems.');
}