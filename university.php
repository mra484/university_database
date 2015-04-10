<?php
error_reporting(1);
require 'db/connect.php';
require 'db/security.php';
include 'mysql_functions.php';

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
		$uid = trim($univ['uid']);

		//get events belonging to university
		$temp = $db->query("SELECT * FROM university_event_list 
			LEFT JOIN event ON university_event_list.eid = event.eid
			WHERE (university_event_list.uid) = '" . $uid . "'");
		$event = $temp->fetch_all(MYSQLI_ASSOC);

		$temp = $db->query("SELECT * FROM ");

		//get list of affiliated groups
		$temp = $db->query("SELECT * FROM university_rso_link 
			LEFT JOIN rso ON university_rso_link.rid = rso.rid
			LEFT JOIN rso_type ON rso.rtid = rso_type.rtid
			WHERE (uid) = '" . $uid . "'");
		$rso_list = $temp->fetch_all(MYSQLI_ASSOC);

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
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<?php createUserPanel($db, $email); ?>

	
	<title>Welcome to <?php echo escape($univ['name']); ?></title>
</head>

<body>

<h1>Welcome to <?php echo escape($univ['name']); ?></h1>
<p><a href="univ_select.php">Not your university?</a></p><br>
<?php
	//admin panel
	if($user['super_admin']){
?>
<form action="univ_edit.php?university=<?php echo escape($univ['uid']); ?>" method="post">
	<input type="submit" value="Edit University" />
</form>

<?php
	}
?>
		
<!-- output description -->
<h3>Description</h3>
<p> <?php echo escape($univ['description']); ?></p>

<!-- output event list -->
<h3>event list</h3>

	<?php printEventList2(NULL, $uid, $db); ?>
	
<h3>Affiliated groups</h3>
<?php
if(!count($rso_list)){
	echo 'No affiliated groups';
} else {
	//list of groups that are part of this university
	?>

	<table border="2">
		<?php
	foreach($rso_list as $r){
		?>

		<tr>
			<td><?php echo escape($r['name']); ?> </td>
			<td><?php echo escape($r['type']); ?> </td>
		</tr>
			<?php
	}
	?>
	</table>
	<?php
}
?>

</body>
</html>