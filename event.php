<?php
require 'db/connect.php';
require 'db/security.php';

if(isset($_COOKIE) && isset($_GET) ){
	$email = trim($_COOKIE['user']);

	if(empty($email)){
		header("Location:index.php?result=no_email");
	}

	$eid = trim($_GET['event']);

	//create comment if posted
	if(!empty($_POST['comment_text'])) {
		$message = trim($_POST['comment_text']);
		$db->query("INSERT INTO comment (email, message, eid, created) VALUES ('" . $email . "', '" . $message . "', '" . $eid . "', NOW())");
		if($db->affected_rows){
			echo 'comment created';
		} else {
			echo 'unable to create comment';
		}
	}

	//edit comment if posted
	if(!empty($_POST['edit_text'])) {
		$message = trim($_POST['edit_text']);
		echo $message;
		$cid = trim($_GET['cid']);
		$sql = $db->prepare("UPDATE comment SET comment.message = ? WHERE (comment.cid) = ?");
		$sql->bind_param('ss', $message, $cid);
		$sql->execute();

		if($db->affected_rows){
			echo 'comment edited';
		} else {
			echo 'unable to edit comment';
		}
	}

	$temp = $db->query("SELECT * FROM event WHERE (eid) = '" . $eid . "'");
	$event = $temp->fetch_assoc();

	$temp = $db->query("SELECT address.*, state.name FROM address, state
			WHERE (address.aid) = '" . $event['aid'] . "' && (state.sid) = (address.sid) " );
	$address = $temp->fetch_assoc();

	$admin = false;
	$super_admin = false;
	$owner = false;

	if(!empty($event['rid']) ){
		$temp = $db->query("SELECT admin FROM rso_member_list WHERE (email) = '" . $email ."' && (rid) = '" . $event['rid'] . "'");
		$admin = $temp->fetch_assoc();
	}
	if(!empty($event['uid']) ){
		$temp = $db->query("SELECT super_admin FROM university_member_list WHERE (email) = '" . $email  . "' && (uid) = '" . $event['uid'] . "'");
		$super_admin = $temp->fetch_assoc();
	}
	if(strcmp($email, $event['owner'] ) == 0) {
		$owner = true;
	}

	//get comments for this event
	$temp = $db->query("SELECT *, userlist.first_name as first_name, userlist.last_name as last_name FROM comment 
		LEFT JOIN userlist on comment.email = userlist.email
		WHERE (eid) = '" . $event['eid'] . "'");
	$comments = $temp->fetch_all(MYSQLI_ASSOC);
} else {
	header("Location:index.php?result=time_out");
}

?>
<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo escape($event['name']); ?> </title>
</head>

<body>
	<?php if($admin || $super_admin || $owner) {
		?>
		<br>
		<a href="event_edit.php?event=<?php echo escape($event['eid']); ?>">Edit event</a><br>
		<?php
	}
	?>
	<h3><?php echo escape($event['name']); ?> </h3>

	<div id="event_time" >
		<?php echo escape($event['date']); ?> at <?php echo escape($event['time']); ?> <br>
	</div>

	<br>

	<div id="event_location" >
		<?php echo escape($address['street']); ?><br>
		<?php echo escape($address['city']); ?> <?php echo escape($address['sid']); ?> <?php echo escape($address['p_code']); ?><br>
	</div>

	<br>

	<div id="event_description" >
		<p><?php echo escape($event['description']); ?></p>
	</div>

	<br>

	<div id="event_contact" >
		Contact Phone: <?php echo escape($event['contact_phone']); ?> <br>
		Contact Email: <?php echo escape($event['contact_email']); ?> <br>
	</div>

	<hr>
	<br>
	<div id="event_comment_section" >
		<div id="event_comment">
			<form action="?event=<?php echo escape($event['eid']); ?>" method="POST" >
				<textarea name="comment_text"></textarea><br>
				<input type="submit" value="New Comment" />
			</form>
		</div>
		<?php
		foreach($comments as $c){
			?>
			<div id="event_comment">
				<br>

				<?php 
				if( strcmp($c['email'], $email) == 0) {
					//have user's comments appear as editable text for editing
					?>

					<form action="?event=<?php echo escape($event['eid']); ?>&cid=<?php echo escape($c['cid']); ?>" method="POST" >
						<textarea name="edit_text"><?php echo escape($c['message']); ?></textarea><br>
						<p class="comment_tag"><?php echo escape($c['first_name']); ?> <?php echo escape($c['last_name']); ?><br>
							<?php echo escape($c['created']); ?> 
						</p>
						<input type="submit" value="Edit Comment" /><br>
					</form>

					<?php
				} else {
					?>

				<p><?php echo escape($c['message']); ?> </p>
				<p class="comment_tag"><?php echo escape($c['first_name']); ?> <?php echo escape($c['last_name']); ?><br>
					<?php echo escape($c['created']); ?> 
				</p>
			</div>
			<?php 
		}
	}
		?>
	</div>
</body>
</html>