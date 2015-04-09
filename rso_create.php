<?php

require 'db/connect.php';
require 'db/security.php';

if(isset($_COOKIE)){
	$email = trim($_COOKIE['user']);
	if(empty($email)){
		echo 'invalid email';
		die();
	}

	//get list of rso types for form
	$temp = $db->query("SELECT * FROM rso_type");
	$rtid = $temp->fetch_all(MYSQLI_ASSOC);

	if(isset($_POST) && !empty($_POST['name']) && !empty($_POST['group_type']) ){
		//create rso and add user to member list as admin
		$name = trim($_POST['name']);
		$group_type = trim($_POST['group_type']);

		$db->query("INSERT INTO rso (name, rtid) VALUES ('" . $name . "', '" . $group_type . "')");
		$rid = $db->insert_id;

		$db->query("INSERT INTO rso_member_list (email, rid, admin) VALUES ('" . $email . "', '" . $rid . "', b'1')");
		header("Location:rso_edit.php?rso=" . $rid . "");
	}

} else {
	echo 'session timed out';
	header("Location:index.php?result=time_out");
}
?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<title>Create new group</title>
</head>

<body>

	<h3>Create new group</h3>

	<form method="POST" action="">
		Group Name: <input type="text" name="name" /> <br>
		Group Type: <select name="group_type" size="1">
		
		<?php
		foreach($rtid as $r){
			?>
			<option value=<?php echo escape($r['rtid']); ?>><?php echo escape($r['type']); ?> </option>
			<?php
		}
		?>
		
		</select><br>
		<input type="submit" value="Create group"/>
	</form>
