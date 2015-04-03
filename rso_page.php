<?php
//error_reporting(0);
require 'db/connect.php';
require 'db/security.php';

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
	$rso_id = trim($_GET['rso']);
} 

if(!empty($_GET)){
	//retrieve rso information
	if(empty($rso_id)){
		$rso_id = trim($_GET['rso']);
	}
	
	//join rso
	if(isset($_GET['join'])){
		$sql = $db->prepare("INSERT INTO rso_member_list (email, rid, admin, created) VALUES (?,?,b'0', NOW())");
		$sql->bind_param('ss', $email, $rso_id);
		if( $sql->execute() ){
			echo 'Successfully joined group';
		} else {
			echo 'Unable to join group';
		}
		
	//leave rso
	} else if (isset($_GET['leave'])){
		$db->query("DELETE FROM rso_member_list WHERE (email) = '" . $email . "' && (rid) = '" . $rso_id . "'");
		if($db->affected_rows) {
			echo 'Successfully left group';
		} else {
			echo 'Unable to leave group';
		}
	}
	
	//get table containing rso information
	$temp = $db->query("SELECT rso.name AS name, rso.description as description, rso_type.type as type
		FROM rso, rso_type
		WHERE (rso.rid) = '" . $rso_id . "' 
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
		WHERE (r.rid) = '" . $rso_id . "'
		&& (r.email) = '" . $email . "'");
	$rso_member = $temp->fetch_assoc();
	 
	//get list of members
	$temp = $db->query("SELECT CONCAT_WS(' ', u.first_name, u.last_name) as name, r.created as created, r.admin as admin FROM rso_member_list AS r, userlist AS u
		WHERE (r.rid) = '" . $rso_id . "'
		&& (u.email) = (r.email)
		GROUP BY (u.last_name)");
	$rso_member_list = $temp->fetch_all(MYSQLI_ASSOC);
	
	//get list of events relating to this rso
	$temp = $db->query("SELECT event.* FROM event WHERE event.rid = '" . $rso_id . "'");
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
	<title>cop4710 rso page: <?php echo escape($rso['name']); ?></title>
</head>

<body>
<h2><?php echo $rso['name']; ?>'s page</h2>

<?php
	//admin panel
	if($rso_member['admin']){
?>
		<h3>Admin panel</h3>
		
		<p> do admin stuff here </p>
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

	<table border="2px solid black" cellpadding="10">
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
					$temp = $db->query("SELECT * FROM rso_member_list WHERE (rid) = '" . $rso_id . "'");
					$temp2 = $temp->fetch_all(MYSQLI_ASSOC);
			?>
			
			<tr>
				<td><?php echo escape($rso['name']); ?></td>
				<td><?php echo count($temp2); ?></td>
				<td><?php echo escape($rso['type']); ?></td>
				<td><?php 
				if(empty($rso_member)) {
					?>
					<form action="?rso=<?php echo escape($rso_id); ?>&join=1" method="POST">
						<input type="submit" value="Join" name="submit">
					</form></td>
					<?php 
				} else {
					?>
					<form action="?rso=<?php echo escape($rso_id); ?>&leave=1" method="POST">
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
	
<h3>event list</h3>
	<?php
		if(!count($event)){
			echo 'No events';
		} else {
			foreach ($event as $r){
				$temp = $db->query("SELECT university.*, CONCAT_WS(' ', address.street, address.city, address.sid) as address 
					FROM university LEFT JOIN address ON university.aid = address.aid WHERE university.uid = '" . $r['uid'] . "'");
				$univ = $temp->get_assoc();
	?>
	
	<h4><?php echo escape($r['name']); ?></h4>
	<?php echo CONCAT_WS(' at ', $r['date'], $r['time']);  ?> <br><br>
	<p><?php echo escape($univ['name']); ?> <br> <?php echo escape($univ['address']); ?></p>
	<p><?php echo escape($r['description']); ?></p>
	<br>
	<p>Contact email: <?php echo escape($r['contact_email']); ?> <br> <?php echo escape($r['contact_phone']); ?></p>
	<br>
	<?php
			}
		}
		?>
	
<h3>Member list</h3>
	<?php
		if(!count($rso_member_list)){
			echo 'No members';
		} else {
			foreach($rso_member_list as $r){
				?>
		<p><?php echo escape($r['name']); ?>	Joined: <?php echo escape($r['created']); if($r['admin']){ ?> Group owner<?php } else { ?></p>
		
		<?php
				}
			}
		}
		?>
				
	
		
</body>
</html>