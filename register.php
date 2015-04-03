<?php
error_reporting(0);
require 'db/connect.php';
require 'db/security.php';

if(!empty($_POST)){
		$email = trim($_POST['email']);
		$first_name = trim($_POST['first_name']);
		$last_name = trim($_POST['last_name']);
		$phone_number = trim($_POST['phone_number']);
		//$password = trim($_POST['password']);
		
	if(!empty($email) && !empty($first_name) && !empty($last_name) && !empty($phone_number)) {
		$qry = "SELECT * FROM userlist WHERE '" . $email . "' = (email) LIMIT 1";
		$user = $db->query($qry);
		
		echo '4';
		if($user->num_rows > 0){
			echo 'email already in use';
		} else {
			$sql = $db->prepare("INSERT INTO userlist (first_name, last_name, email, phone_number) VALUES (?,?,?,?)");
			$sql->bind_param('ssss', $first_name, $last_name, $email, $phone_number);
			
			if($sql->execute()){
				header("Location:index.php?result=success_create");
				die();
			} else {
				echo 'could not add to database, panic';
				}
			
		}
	} else {
		echo 'please fill in all the fields';
	}
}

	
?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Cop4710_app register</title>
</head>

<body>
<h3>Enter the following information</h2> <br />

	<form action="" method="post">
		<div class="field">
			<label for="first_name">First name: </label>
			<input type="text" name="first_name" id="first_name" autocomplete="off">
		</div>
		<div class="field">
			<label for="last_name">Last name: </label>
			<input type="text" name="last_name" id="last_name" autocomplete="off">
		</div>
		<div class="field">
			<label for="email">Email address: </label>
			<input type="text" name="email" id="email" autocomplete="off">
		</div>
		<div class="field">
			<label for="phone_number">Phone number: </label>
			<input type="text" name="phone_number" id="phone_number" autocomplete="off">
		</div>
		<div class="field">
			<label for="password">Password: </label>
			<input type="password" name="password" id="password" autocomplete="off">
		</div>
		<input type="submit" value="Log in" > <br />

</body>
</html>