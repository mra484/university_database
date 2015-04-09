<?php
//error_reporting(0);
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

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
} 

if(!empty($_GET)){
	//retrieve rso information
	if(empty($rid)){
		$rid = trim($_GET['rso']);
	}
	
	//join rso
	if(isset($_GET['join'])){
		$sql = $db->prepare("INSERT INTO rso_member_list (email, rid, admin, created) VALUES (?,?,b'0', NOW())");
		$sql->bind_param('ss', $email, $rid);
		if( $sql->execute() ){
			echo 'Successfully joined group';
		} else {
			echo 'Unable to join group';
		}
		
	//leave rso
	} else if (isset($_GET['leave'])){
		$db->query("DELETE FROM rso_member_list WHERE (email) = '" . $email . "' && (rid) = '" . $rid . "'");
		if($db->affected_rows) {
			echo 'Successfully left group';
		} else {
			echo 'Unable to leave group';
		}
	}
	
	//get table containing rso information
	$temp = $db->query("SELECT rso.name AS name, rso.description as description, rso_type.type as type, rso.joinable as joinable
		FROM rso, rso_type
		WHERE (rso.rid) = '" . $rid . "' 
			&& (rso_type.rtid) = (rso.rtid)");
	//echo '<pre>', var_dump($temp), '</pre>';
	$rso = $temp->fetch_assoc();
	
	if(empty($rso)){
		//exit if no rso using the passed rid exists
		echo 'no such rso exists';
		header("Location:index.php?result=no_rso");
		die();
	}
	
	//get user's admin field from rso_member_list
	$temp = $db->query("SELECT r.admin AS admin FROM rso_member_list AS r
		WHERE (r.rid) = '" . $rid . "'
		&& (r.email) = '" . $email . "'");
	$rso_member = $temp->fetch_assoc();
	
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
	<title>cop4710 rso page: <?php echo escape($rso['name']); ?></title>
	<?php createUserPanel($db, $email); ?>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
		
</head>

<body>
<h2><?php echo $rso['name']; ?>'s page</h2>
<?php
	//admin panel
	if($rso_member['admin']){
?>
		<h3>Admin panel</h3>
		
		<p> do admin stuff here </p>
		<form action="rso_edit.php?rso=<?php echo escape($rid); ?>" method="POST">
			<input type="submit" value="Edit group"/>
		</form>
<?php
	}
?>
		


<h3>Description</h3>
<!-- TODO get description -->
<p> add description to database and use it here </p>
<p> <?php echo escape($rso['description']); ?></p>

<h3>Information</h3>
	<?php
		if(!count($rso)) {
			echo 'No records';
		} else {
	?>

	<table border="2" cellpadding="10">
		<thead>
			<tr>
				<th>RSO Name</th>
				<th>Total members</th>
				<th>Type</th>
				<th>Join</th>
			</tr>
		<thead>
		<tbody>
		
			<?php
			//get table of members of this rso, output fields of RSO
					$temp = $db->query("SELECT * FROM rso_member_list WHERE (rid) = '" . $rid . "'");
					$temp2 = $temp->fetch_all(MYSQLI_ASSOC);
			?>
			
			<tr>
				<td><?php echo escape($rso['name']); ?></td>
				<td><?php echo count($temp2); ?></td>
				<td><?php echo escape($rso['type']); ?></td>
				<td><?php 
				if(empty($rso_member)) {
					if($rso['joinable']){
						?>
						<form action="?rso=<?php echo escape($rid); ?>&join=1" method="POST">
							<input type="submit" value="Join" name="submit">
						</form></td>
						<?php 
					} else {
						echo 'restricted';
					}
				} else {
					?>
					<form action="?rso=<?php echo escape($rid); ?>&leave=1" method="POST">
						<input type="submit" value="Leave" name="submit">
					</form></td>
					<?php 
				}
				$temp->free();
				?>
			</tr>
		</tbody>
	</table>
	
	<?php
		}
	?>	

<!-- event list header -->
<h3>event list</h3>

	<?php
		printEventList2($rid, NULL, $db);
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
				</tr>

		<?php
				}
			}
		}
		?>
				
	
		
</body>
</html>