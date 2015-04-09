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
<html>
	<?php 
	function printEventList($event){
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
			echo 'checking for rso events: uid is ' . $uid . "\n";
			$temp = $db->query(
			"SELECT * FROM university_event_list
			LEFT JOIN event ON university_event_list.eid = event.eid
			WHERE (university_event_list.uid) = '" . $uid . "'
			UNION
			SELECT * FROM rso_event_list
			LEFT JOIN event ON rso_event_list.eid = event.eid
			WHERE (rso_event_list.rid) = (
				SELECT rid FROM university_rso_link
				WHERE (uid) = '" . $uid . "')
			");
			
		} else if ($uid == NULL){
			echo 'checking univ for events: rid is ' . $rid . "\n";
			$temp = $db->query(
			"SELECT * FROM rso_event_list
			LEFT JOIN event ON rso_event_list.eid = event.eid
			WHERE (rso_event_list.rid) = '" . $rid . "'
			UNION
			SELECT * FROM university_event_list
			LEFT JOIN event ON university_event_list.eid = event.eid
			WHERE (university_event_list.uid) = (
				SELECT uid FROM university_rso_link
				WHERE (rid) = '" . $rid . "')
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
</html>
