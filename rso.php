<?php
error_reporting(0);
require 'db/connect.php';
require 'db/security.php';

if(!empty($_COOKIE)){
	//retrieve rows for user, rso that contains user and list of all rso
	$email = trim($_COOKIE['user']);
	$results = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
	$temp = $db->query("SELECT rm.email AS email, rm.rid AS rid, rm.admin AS admin, r.name AS name 
		FROM rso_member_list AS rm, rso AS r
		WHERE (email) = '" . $email . "' && (rm.rid) = (r.rid)");
	
	$user_rso_list = $temp->fetch_all(MYSQLI_ASSOC);
	
	//TODO modify to only retrieve entries that don't exist in $user_rso_list
	$temp = $db->query("SELECT * FROM rso");
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
	<title>cop4710 rso</title>
</head>

<body>
<h2>My groups</h2>

	<?php
		if(!count($user_rso_list)) {
			echo 'No records';
		} else {
	?>

	<table border="2px solid black" cellpadding="10">
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
					$temp = $db->query("SELECT * FROM rso_member_list WHERE (rid) = '" . $r['rid'] . "'");
					$temp2 = $temp->fetch_ALL(MYSQLI_BOTH);
			?>
			
			<tr>
				<td><?php echo escape($r['name']); ?></td>
				<td><?php echo count($temp2); ?></td>
				<td><!--TODO ?php echo escape($r->short_description); ?--></td>
				<td><a href="rso_page.php?rso=<?php echo escape($r['rid']); ?>"/>Go</td>
			</tr>
			
			<?php
				}
			?>
			
		</tbody>
	</table>
	
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
		
	<table border="2px solid black" cellpadding="10">
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
					$temp = $db->query("SELECT * FROM rso_member_list WHERE (rid) = '" . $r['rid'] . "'");
					$temp2 = $temp->fetch_ALL(MYSQLI_BOTH);
			?>
			
			<tr>
				<td><?php echo escape($r['name']); ?></td>
				<td><?php echo count($temp2); ?></td>
				<td><!-- TODO short description --></td>
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