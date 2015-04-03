<?php
error_reporting(0);
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

if(!empty($_POST)){
	$rso_id = trim($_GET['rso']);
	$sql = $db->prepare("INSERT INTO rso_member_list (email, rid, admin) VALUES (?,?,b'0')");
	$sql->bind_param('ss', $email, $rso_id);
	if( $sql->execute() ){
		echo 'Successfully joined group';
	} else {
		echo 'Unable to join group';
	}
	
} 

if(!empty($_GET)){
	//retrieve rso information
	if(empty($rso_id)){
		$rso_id = trim($_GET['rso']);
	}
	$temp = $db->query("SELECT rso.name AS name, rso_type.type as type
		FROM rso, rso_type
		WHERE (rso.rid) = '" . $rso_id . "' 
			&& (rso_type.rtid) = (rso.rtid)");
	$rso = $temp->fetch_assoc();
	//echo '<pre>', var_dump($rso),  '</pre>';
	
	$temp = $db->query("SELECT r.admin AS admin FROM rso_member_list AS r
		WHERE (r.rid) = '" . $rso_id . "'
		&& (r.email) = '" . $email . "'");
	$rso_member = $temp->fetch_assoc();
	
	if(empty($rso)){
		//exit if no rso passed
		echo 'no such rso exists';
		header("Location:index.php?result=no_rso");
		die();
	}
		
	
} else {
	//exit if no rso passed
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
					<form action="?rso=<?php echo escape($rso_id); ?>" method="POST">
						<input type="submit" value="join" name="submit">
					</form></td>
					<?php 
				} else {
					?>
					<p> already a member</p>
					<?php
				}
				?>
			</tr>
			
			<?php
				$temp->free();
				$temp2->free();
			?>
			
		</tbody>
	</table>
	
	<?php
		}
	?>	
	
<h3>event list</h3>
<p>add event list</p>
</body>
</html>