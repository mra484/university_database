<?php
function createUserPanel($db, $email){
	$temp = $db->query("SELECT mid FROM mail_list WHERE to_user = '" . $email . "'");
	$temp2 = $temp->fetch_all(MYSQLI_ASSOC);
	$inbox = count($temp2);

	?>
	<div id="user_panel">
		<a href="mainpage.php">Home</a> 
		<a href="mailbox.php">Mail(<?php echo escape($inbox); ?>)</a> 
		<a href="index.php?result=logout">Log out</a>
	</div>
<?php
}
?>

<?php
function getRSO($rso_id, $db){
//Return assoc variable containing rso

	$temp = $db->query("SELECT rso.name AS name, rso.description as description, rso_type.type as type, rso.joinable as joinable
		FROM rso, rso_type
		WHERE (rso.rid) = '" . $rso_id . "' 
			&& (rso_type.rtid) = (rso.rtid)");
	//echo '<pre>', var_dump($temp), '</pre>';
	$rso = $temp->fetch_assoc();
	return $rso;
}

function getAdminInfo($rso_id, $email, $db){
	//get user's admin field from rso_member_list
	$temp = $db->query("SELECT r.admin AS admin FROM rso_member_list AS r
		WHERE (r.rid) = '" . $rso_id . "'
		&& (r.email) = '" . $email . "'");
	$rso_member = $temp->fetch_assoc();
	return $rso_member;
}
?>

<?php
function checkEventAdmin($eid, $email, $db){
	//check if the event belongs to an rso
	if(mysqli_num_rows($db->query("SELECT * FROM rso_event_list WHERE (eid) = '" . $eid . "'")) != 0){
		//return a list of rsos that the user is a member of and this event is part of
		$temp = $db->query("SELECT * FROM rso_event_list 
			LEFT JOIN rso_member_list ON rso_event_list.rid = rso_member_list.rid
			WHERE (rso_event_list.eid) = '" . $eid . "' && (rso_member_list.email) = '" . $email . "'");
		$user = $temp->fetch_all(MYSQLI_ASSOC);

		//check to see if the user is an admin of any of these groups
		foreach($user AS $u){
			if($u['admin']){
				return true;
			}

		}

	} else {
		//get list of all universities linked to this event
		$temp = $db->query("SELECT * FROM university_event_list WHERE (eid) = '" . $eid . "'");
		$univ = $temp->fetch_all(MYSQLI_ASSOC);

		//check each university for an rso link in which this user is an admin
		foreach($univ AS $u){
			if($db->query("SELECT * FROM university_rso_link WHERE 
				(uid) = '" . $u['uid'] . "' && (rid) = 
					(SELECT rid FROM rso_member_list 
					WHERE (email) = '" . $email . "' && (admin) = b'1')")) {
				return true;
			}
		}
	}

	return false;
}
?>

<?php
function checkEventSuperAdmin($eid, $email, $db){
	//check if the event belongs to a university
	if(mysqli_num_rows($db->query("SELECT * FROM university_event_list WHERE (eid) = '" . $eid . "'")) != 0){

		//return a list of rsos that the user is a member of and this event is part of
		$temp = $db->query("SELECT * FROM university_event_list 
			LEFT JOIN university_member_list ON university_event_list.uid = university_member_list.uid
			WHERE (university_event_list.eid) = '" . $eid . "' && (university_member_list.email) = '" . $email . "'");
		$user = $temp->fetch_all(MYSQLI_ASSOC);

		//check to see if the user is an admin of any of these Universities
		foreach($user AS $u){
			if($u['admin']){
				return true;
			}

		}

	} else {
		//get list of all rsos linked to this event
		$temp = $db->query("SELECT * FROM rso_event_list WHERE (eid) = '" . $eid . "'");
		$rso = $temp->fetch_all(MYSQLI_ASSOC);

		//check each rso for a university link in which this user is a super admin
		foreach($rso AS $r){
			if($db->query("SELECT * FROM university_rso_link WHERE 
				(rid) = '" . $r['rid'] . "' && (uid) = 
					(SELECT uid FROM university_member_list 
					WHERE (email) = '" . $email . "' && (super_admin) = b'1')")) {
				return true;
			}
		}
	}

	return false;
}
?>

<?php 
function printEventList($event, $email){
	foreach($event as $e){
		$description = $e['description'];
		if(count($description) > 200 ){
			$description = substr($description, 0, 200) . "...";
		}
		?>

		<div id="event_block">
			<h3><a href="event.php?event=<?php echo escape($e['eid']); ?>"><?php echo escape($e['name']); ?></h3></a>
			<?php echo escape($e['date']); ?> at <?php echo escape($e['time']); ?> <br><br>
			<p><?php echo escape($description); ?></p>
		</div>
		<?php
	}

}
?>

<?php 
function printEventList2($rid, $uid, $db){
	if($rid == NULL){
		//echo 'checking for rso events: uid is ' . $uid . "\n";
		$temp = $db->query(
		"SELECT * FROM university_event_list
		LEFT JOIN event ON university_event_list.eid = event.eid
		WHERE (university_event_list.uid) = '" . $uid . "'
		UNION
		SELECT * FROM rso_event_list
		LEFT JOIN event ON rso_event_list.eid = event.eid
		WHERE EXISTS (
			SELECT * FROM university_rso_link
			WHERE (uid) = '" . $uid . "' && (rid) = (rso_event_list.rid))
		");
		
	} else if ($uid == NULL){
		//echo 'checking univ for events: rid is ' . $rid . "\n";
		$temp = $db->query(
		"SELECT * FROM rso_event_list
		LEFT JOIN event ON rso_event_list.eid = event.eid
		WHERE (rso_event_list.rid) = '" . $rid . "'
		UNION
		SELECT * FROM university_event_list
		LEFT JOIN event ON university_event_list.eid = event.eid
		WHERE EXISTS (
			SELECT * FROM university_rso_link
			WHERE (rid) = '" . $rid . "' && (uid) = (university_event_list.uid))
		");
		
	}

	$event = $temp->fetch_all(MYSQLI_ASSOC);

	if(!count($event)){
		echo 'no events';
	}
	
	foreach($event as $e){
		$description = $e['description'];
		if(count($description) > 200 ){
			$description = substr($description, 0, 200) . '...';
		}
		?>

		<div id="event_block">
			<h3><a href="event.php?event=<?php echo escape($e['eid']); ?>"><?php echo escape($e['name']); ?></h3></a>
			<?php echo escape($e['date']); ?> at <?php echo escape($e['time']); ?> <br><br>
			<p><?php echo escape($description); ?></p>
		</div>
		<?php
	}

}
?>