<?php
error_reporting(0);
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

$records = array();



if(!empty($_POST)) {
//passwords not implemented yet, can log in with just a correct email address

/* 	if(isset($_POST['email'], $_POST['password'])) {
		$email	 = trim($_POST['email']);
		$password	 = trim($_POST['password']);
		
		if(!empty($email) && !empty($password)) {
			$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
			$salt = sprintf("$2a$%02d$", 10) . $salt;
			$hash = crypt($password, $salt);
			$check = $db->prepare('SELECT password FROM userlist WHERE email = :email LIMIT 1');
			$check->bindParam(':email', $email);			
			if($check->execute()) {
				$user = $check->fetch_object();
				if( hash_equals($user->password, crypt($password, $user->password)) ) {
					//continue
				} else {
					//failed
					header("Location:mainpage.php?result=loginFailed");
					die();
				}
			}
		}
	} */
	
	//get row for username, return to index if no record exists
	$email	 = trim($_POST['email']);
	$query = "SELECT * FROM userlist WHERE (email) = '" . $email . "'";
	$result = $db->query($query);
	if(mysqli_num_rows($result) == 0){
		header("Location:index.php?result=loginFailed");
		die();
	}
	$user = $result->fetch_assoc();
	//create cookie for email that lasts 600 seconds
	setCookie("user", $user['email'], time() + (86400), "/");
	
} else if (empty($_COOKIE)) {
	//return if no cookie present
	header("Location:index.php?result=loginFailed");
	die();
} else if ( isset($_COOKIE['user'])) {
	//read from cookie
	$email = trim($_COOKIE['user']);
	$result = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
	//echo $result->num_rows;
	$user = $result->fetch_assoc();

}
?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Main page</title>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
		
	</style>
</head>

<body>
<?php
createUserPanel($db, $email);
?>
<h3>Welcome <?php echo escape($user['first_name']); ?></h3>
			<?php
			if(!count($user)) {
				echo 'No records';
			} else {
				?>

	<!-- display user information -->
	<table border_width="1px">
		<thead>
			<tr>
				<th>First name</th>
				<th>Last name</th>
				<th>Email</th>
				<th>Phone number</th>
			</tr>
		<thead>
		<tbody>
			<tr>
			<td><?php echo escape($user['first_name']); ?></td>
			<td><?php echo escape($user['last_name']); ?></td>
			<td><?php echo escape($user['email']); ?></td>
			<td><?php echo escape($user['phone_number']); ?></td>
			</tr>
		</tbody>
	</table> <br>

	<?php
			}
			?>
	
	<!-- menu panel -->
	<div id="side_panel" >
		<p><a href="rso.php"> RSO </a></p>
		<p><a href="university.php"> University </a></p>
		<p><a href="univ_edit.php?new=1"> Create University </a></p>
		
		</div>

</body>
</html>