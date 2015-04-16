<?php
//error_reporting(0);
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

if(!empty($_COOKIE)){
	//retrieve rows for user information and universities
	$email = trim($_COOKIE['user']);
	$temp = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
	$user = $temp->fetch_assoc();
	$temp = $db->query("SELECT * FROM university");
	$univ = $temp->fetch_all(MYSQLI_ASSOC);
	
	} else  {
		//no cookie
		echo 'session timed out';
		header("Location:index.php?result=time_out");
		die();
	}

	//handle action taken join/leave
if(!empty($_GET)){
	if(isset($_GET['browse'])){
		$action = "university.php?browse=1&university=";
	} else if (isset($_GET['join'])){
		$rso_id = trim($_GET['join']);
		$temp2 = $db->query("SELECT email FROM university_member_list AS u WHERE (u.email) = '" . $user['email'] . "'");
		$temp = $temp2->fetch_assoc();
		if(empty($temp)) {
			if($db->query("INSERT INTO university_member_list (email, uid, super_admin)
				VALUES ('" . $user['email'] . "', '" . $rso_id . "', b'0')")) {
					header("Location:university.php");
			}else {
				echo 'unable to add user to university list';
			}

		}else {
			$sql = $db->prepare("UPDATE university_member_list 
				SET university_member_list.uid = ?, university_member_list.super_admin = b'0'
				WHERE university_member_list.email = ?");
			$sql->bind_param("ss", $rso_id, $email);

			if($sql->execute()){
				header("Location:university.php");
			}else {
				echo 'unable to modify user\'s university';
			}
		}
	}
} else {

		$action = "?join=";
}

?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>University Select</title>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<?php createUserPanel($db, $email); ?>
		
</head>

<body>
<h2>Select a university</h2>
	<?php
		if(!count($univ)) {
			echo 'No records';
		} else {
	?>

	<table bgcolor="grey" cellpadding="10">
		<tbody>
			<?php
			//get table of members of this rso, output fields of RSO
			foreach($univ as $r){
			?>
			
			<tr>
				<td><?php echo escape($r['name']); ?></td>
				<td>
					<form action="<?php echo escape($action);?><?php echo escape($r['uid']); ?>" method="POST">
						<input type="submit" value="Select" name="submit">
					</form>
				</td>
			</tr>
					<?php 
				}
				?>
			</tr>
		</tbody>
	</table>
	
	<?php
		}
	?>	
</body>
</html>