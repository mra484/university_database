<?php
error_reporting(0);
require 'db/connect.php';
require 'db/security.php';

//message on return to this page
if(!empty($_GET)){
	if(isset($_GET['result'])){
		echo $_GET['result'];
	}
}

?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Cop4710_app login</title>
</head>

<body>
<h3>Log in</h2> <br />

	<form action="mainpage.php" method="post">
		<div class="field">
			<label for="email">Email address: </label>
			<input type="text" name="email" id="email" autocomplete="off">
		</div>
		<div class="field">
			<label for="password">Password: </label>
			<input type="password" name="password" id="password" autocomplete="off">
		</div>
		<input type="submit" value="Log in" > <br />
		<a href="register.php">Create an account</a>
		</form>

</body>
</html>