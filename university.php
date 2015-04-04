<?php
error_reporting(1);
require 'db/connect.php';
require 'db/security.php';

if(!empty($_COOKIE)){
	//retrieve rows for user, super_admin field depends on database only allowing one university per user
	$email = trim($_COOKIE['user']);
	$temp = $db->query("SELECT *, u.super_admin AS super_admin 
		FROM userlist, university_member_list AS u
		WHERE (userlist.email) = '" . $email . "' && (u.email) = '" . $email . "' LIMIT 1");
	$user = $temp->fetch_assoc();

	//get university based on which one the user is a member of
	$temp = $db->query("SELECT u.name AS name, u.uid AS uid, a.street AS street,
		a.city AS city, a.p_code AS p_code, u.description AS description
		FROM university AS u, address AS a
		WHERE (u.uid) = (
			SELECT uml.uid FROM university_member_list AS uml WHERE (uml.email) = '" . $user['email'] . "'
			)");
	$univ = $temp->fetch_assoc();
	if(!empty($univ)){

		//get events belonging to university
		$temp = $db->query("SELECT * FROM event WHERE (event.uid) = '" . $univ['uid'] . "'");
		$event = $temp->fetch_all(MYSQLI_ASSOC);

	} else {

		//no university set, load list of all universities
		header("Location:univ_select.php");
		die();
	}
	
	
} else {
	//no cookie
	echo 'session timed out';
	header("Location:index.php?result=time_out");
}

?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
		<title>Welcome to <?php echo escape($univ['name']); ?></title>
</head>

<body>

<h1>Welcome to <?php echo escape($univ['name']); ?></h1>
<p><a href="univ_select.php">Not your university?</a></p><br>
<?php
	//admin panel
	if($user['super_admin']){
?>
		<h3>Admin panel</h3>
		
		<p> do admin stuff here </p>
<?php
	}
?>
		
<!-- output description -->
<h3>Description</h3>
<p> <?php echo escape($univ['description']); ?></p>

<!-- output event list -->
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

	
</body>
</html>