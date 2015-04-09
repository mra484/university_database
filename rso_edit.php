<?php
//error_reporting(0);
require 'db/connect.php';
require 'db/security.php';
include 'mysql_functions.php';

if(!empty($_COOKIE)){
	//retrieve rows for user information
	$email = trim($_COOKIE['user']);
	$user = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
	
} else {
	echo 'session timed out';
	header("Location:index.php?result=time_out");
	die();
}

//handle action taken join/leave
if(!empty($_POST)){
	$rid = trim($_GET['rso']);
	if(isset($_POST['group_type'])){
		$group_type = trim($_POST['group_type']);

		//update group type
		$db->query("UPDATE rso SET rso.rtid = '" . $group_type . "' WHERE (rso.rid) = '" . $rid . "'");
	}

	if(isset($_POST['name'])){
		$name = trim($_POST['name']);

		//update name
		$db->query("UPDATE rso SET rso.name = '" . $name . "' WHERE (rso.rid) = '" . $rid . "'");
	}

	if(isset($_POST['description'])){
		$description = trim($_POST['description']);

		//update description
		$db->query("UPDATE rso SET rso.description = '" . $description . "' WHERE (rso.rid) = '" . $rid . "'");
	}

} 

if(!empty($_GET)){
	//retrieve rso information
	if(empty($rid)){
		$rid = trim($_GET['rso']);
	}
	if(isset($_GET['joinable'])){
		$joinable = trim($_GET['joinable']);
	} else {
		$joinable = '2';

	}
	
	$rso = getRSO($rid, $db);

	//get table containing rso type
	$temp = $db->query("SELECT * FROM rso_type");
	$rso_type = $temp->fetch_all(MYSQLI_ASSOC);
	
	if(empty($rso)){
		//exit if no rso using the passed rid exists
		echo 'no such rso exists';
		header("Location:index.php?result=no_rso");
		die();
	}
	
	//get user's admin field from rso_member_list
	
	$rso_member = getAdminInfo($rid, $email, $db);

	//return if user isn't admin of this group
	if(!$rso_member['admin']){
		header("Location:rso_page.php?rso=" . $rid . "");
	}

	//change joinable
	if($joinable == 1){
		if($db->query("UPDATE rso SET rso.joinable = b'1' WHERE (rso.rid) = '" . $rid . "'")){
			echo 'Change successful, group can be joined by anybody';
			$rso['joinable'] = b'1';
		} else {
			echo 'unable to change joinable to 1';
		}
	} else if($joinable == 0){
		if($db->query("UPDATE rso SET rso.joinable = b'0' WHERE (rso.rid) = '" . $rid . "'")){
			echo 'Change successful, member can only be added by admin';
			$rso['joinable'] = b'0';
		} else {
			echo 'unable to change joinable to 0';
		}

	}
	
	//delete rso
	if(isset($_GET['delete']) && $rso_member['admin']){
		$db->query("DELETE FROM rso WHERE '" . $rid . "' = (rid)");
		if($db->affected_rows){
			echo 'Group deleted returning';
			header("Location:mainpage.php?result=rso_deleted");
			die();
		} else {
			echo 'Unable to delete group';
		}
	}
	
	//delete member
	if(isset($_GET['remove']) && $rso_member['admin']){
		$delete = trim($_GET['remove']);
		$db->query("DELETE FROM rso_member_list WHERE (email) = '" . $delete . "' && (rid) = '" . $rid . "'");
	}
	 
	//add member
	if(isset($_GET['add']) && $rso_member['admin']){
		$add = trim($_GET['add']);
		$db->query("INSERT INTO rso_member_list WHERE (email) = '" . $add . "' && (rid) = '" . $rid . "'");
	}
	 
	//change admin
	if(isset($_GET['change']) && $rso_member['admin']){
		$change = trim($_GET['change']);
		$db->query("UPDATE rso_member_list SET rso_member_list.admin = b'1' WHERE (rso_member_list.email) = '" . $change . "' && (rso_member_list.rid) = '" . $rid . "'");
		$db->query("UPDATE rso_member_list SET rso_member_list.admin = b'0' WHERE (rso_member_list.email) = '" . $email . "' && (rso_member_list.rid) = '" . $rid . "'");
		header("Location:rso_page.php?rso=" . $rid . "");
	}
	//get list of members
	$temp = $db->query("SELECT u.email as email, CONCAT_WS(' ', u.first_name, u.last_name) as name, r.created as created, r.admin as admin FROM rso_member_list AS r, userlist AS u
		WHERE (r.rid) = '" . $rid . "'
		&& (u.email) = (r.email)
		GROUP BY (u.last_name)");
	$rso_member_list = $temp->fetch_all(MYSQLI_ASSOC);
	
	//get list of events relating to this rso
	$temp = $db->query("SELECT * FROM rso_event_list
	LEFT JOIN event ON rso_event_list.eid = event.eid 
	WHERE rso_event_list.rid = '" . $rid . "'");
	$event = $temp->fetch_all(MYSQLI_ASSOC);
	$temp->free();
		
} else {
	//exit if no rso variable passed
	echo 'no such rso exists';
	header("Location:index.php?result=no_rso");
	die();
}

?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title> Edit <?php echo escape($rso['name']); ?></title>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
		
</head>

<body>
<h2><?php echo $rso['name']; ?>'s page</h2>

		<h3>Admin panel</h3>
		
		<?php
		if($rso['joinable']){
		?>

		<p> This group is currently joinable by anybody.</p>
		<form action ="?rso=<?php echo escape($rid);?>&joinable=0" method="POST">
			<input type="submit" value="Restrict adding to admin"/>
		</form>

		<?php
		} else {
			?>

			<p> Only admins can add users to this group.</p>
			<form action="?rso=<?php echo escape($rid);?>&joinable=1" method="POST">
				<input type="submit" value="Allow anybody to join"/>
			</form>
		<?php
		}
		?>
		<form action="?rso=<?php echo escape($rid);?>&delete=1" method="POST">
			<input type="submit" value="Delete group"/>
		</form>

<h3>Description</h3>

<form action="?rso=<?php echo escape($rid); ?>" method="POST">
	<textarea name="description" ><?php echo escape($rso['description']); ?></textarea><br>
	<input type="submit" value="Save changes"/>
</form>


<h3>Information</h3>

<form action="?rso=<?php echo escape($rid); ?>" method="POST">
	Group Name: <input type="text" value="<?php echo escape($rso['name']); ?>" name="name"/><br>
	Group Type: <select id="group_type" name="group_type" size="1">

	<?php
	foreach($rso_type as $r){
		if($r['rtid'] == $rso['rtid']){
			?>
		<option selected="selected" value="<?php echo escape($r['rtid']); ?>"><?php echo escape($r['type']); ?></option>

			<?php
		} else {
		?>

		<option value="<?php echo escape($r['rtid']); ?>"><?php echo escape($r['type']); ?></option>

	<?php
		}
	}
	?>
	</select><br>
<input type="submit" value="Save changes"/>
</form>

<!-- event list header -->
<h3>event list</h3>
	<form action="event_edit.php?rso=<?php echo escape($rid); ?>&new=1" method="POST">
		<input type="submit" value="create event"/>
	</form>
	<?php
		if(!count($event)){
			echo 'No events';
		} else {
			printEventList($event);
		}
		?>
		
<h3>Member List</h3>

	<?php
		if(!count($rso_member_list)){
			echo 'No members';
		} else {
			?>
	<table bgcolor="grey" cellpadding="10">
		<tbody>
		<?php
			foreach($rso_member_list as $r){
				?>
				<tr>
				<td id="greyrow"><?php echo escape($r['name']); ?></td>
				<td id="greyrow">Joined: <?php echo escape($r['created']); ?></td>
				<td id="greyrow"><?php if($r['admin']){ ?>
					Group owner</td>
				<?php } else {
					?>
						<form action="?rso=<?php echo escape($rid); ?>&remove=<?php echo escape($r['email']); ?>" method="POST">
						<input type="submit" value="Remove" name="submit"> </td>
					<td id="greyrow">
						<form action="?rso=<?php echo escape($rid); ?>&change=<?php echo escape($r['email']); ?>" method="POST">
						<input type="submit" value="Set admin" name="submit"> </td>
				</tr>

		<?php
				}
			}
		}
		?>
				
	
		
</body>
</html>