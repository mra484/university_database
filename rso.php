<?php
error_reporting(1);
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

if(!empty($_COOKIE)){
	//retrieve rows for user, rso that contains user and list of all rso
	$email = trim($_COOKIE['user']);
	$results = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");

	//get joined rsos
	$temp = $db->query("SELECT * FROM rso_member_list
		LEFT JOIN rso ON rso_member_list.rid = rso.rid
		LEFT JOIN (SELECT COUNT(rid) as members, rid from rso_member_list 
			where (rso_member_list.rid) IN (SELECT rid FROM rso) group by rid ) as r ON rso.rid = r.rid
		LEFT JOIN rso_type ON rso.rtid = rso_type.rtid
		WHERE (email) = '" . $email . "'");
	
	$user_rso_list = $temp->fetch_all(MYSQLI_ASSOC);
	
	//get visible rso no member of
	$temp = $db->query("SELECT * FROM rso
	LEFT JOIN (SELECT COUNT(rid) as members, rid from rso_member_list 
		where (rso_member_list.rid) IN (SELECT rid FROM rso) group by rid ) as r ON rso.rid = r.rid
	LEFT JOIN rso_type ON rso.rtid = rso_type.rtid
	WHERE (r.members) > 4 && NOT EXISTS
		(SELECT * FROM rso_member_list WHERE (email) = '" . $email . "' && (rid) = (rso.rid)) ");
	$rso_list = $temp->fetch_all(MYSQLI_ASSOC);
	
	
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
	<?php createUserPanel($db, $email); ?>
	<title>cop4710 rso</title>
</head>

<body>
<h2>My groups</h2>

	<?php
		if(!count($user_rso_list)) {

			echo 'No records<br>'; ?>
			<a href="rso_create.php">Create group</a><br>

	<?php
		} else {
	?>

	<table border="2px" cellpadding="10">
		<thead>
			<tr>
				<th>RSO Name</th>
				<th>Total members</th>
				<th>Description</th>
				<th>Page</th>
			</tr>
		<thead>
		<tbody>
		
			<?php
			//iterate through user rso list and print each field
				foreach($user_rso_list as $r){
			?>
			
			<tr>
				<td><?php echo escape($r['name']); ?></td>
				<td><?php echo escape($r['members']); ?></td>
				<td><?php echo escape($r['description']); ?></td>
				<td><a href="rso_page.php?rso=<?php echo escape($r['rid']); ?>"/>Go</td>
			</tr>
			
			<?php
				}
			?>
			
		</tbody>
	</table>

	<a href="rso_create.php">Create group</a><br>
	
	<?php
		}
	?>
	
	<hr>
	
	<h2>Other groups</h2>
	
	<?php
	if (!count($rso_list)){
		echo 'No records';
	} else {
	?>
		
	<table border="2px" cellpadding="10">
		<thead>
			<tr>
				<th> RSO Name</th>
				<th> Total members </th>
				<th> Description </th>
				<th> Page </th>
			</tr>
		</thead>
		<tbody>
		
			<?php
			//iterate through list of rso
				foreach($rso_list as $r){
			?>
			
			<tr>
				<td><?php echo escape($r['name']); ?></td>
				<td><?php echo escape($r['members']); ?></td>
				<td><?php echo escape($r['description']); ?></td>
				<td><a href="rso_page.php?rso=<?php echo escape($r['rid']); ?>"/>Go</td>
			</tr>
			
			<?php
				}
			?>
			
			<tr>
		</tbody>
	</table>
	
	<?php
	}
	?>
	
</body>
</html>