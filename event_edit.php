<?php
//error_reporting(0);
require 'db/connect.php';
require 'db/security.php';
include 'mysql_functions.php';

if(!empty($_COOKIE)){
	//retrieve rows for user information
	$email = trim($_COOKIE['user']);
	$user = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
	
} else {
	echo 'session timed out';
	header("Location:index.php?result=time_out");
	die();
}

$mode = 0;

if(isset($_GET['rso'])){
	$rid = trim($_GET['rso']);
	$mode = 1;
}

if(isset($_GET['university'])){
	$uid = trim($_GET['university']);
	$mode = 2;
}

if(isset($_GET['event'])){
	$eid = trim($_GET['event']);
}

if(isset($_GET['new']) ){
	$eid = 0;
}

if(!empty($_POST)){

	$eid = trim($_GET['event']);

	if(isset($_POST['delete'])) {

		$sql = $db->prepare("DELETE FROM event WHERE (event.eid) = ?");
		$sql->bind_param('s', $eid);

		if($sql.execute()){
			$db->query("DELETE FROM rso_event_list WHERE (rso_event_list.eid) = '" . $eid . "')");
			$db->query("DELETE FROM university_event_list WHERE (university_event_list.eid) = '" . $eid . "')");
			echo 'event deleted';
		} else {
			echo 'unable to delete event';
		}
	}

	if(isset($_POST['description'])){
		//read description, (update only);
		$description = trim($_POST['description']);
		$temp = $db->query("UPDATE event SET event.description = '" . $description . "' WHERE (event.eid) = '" . $eid . "'");
		if($temp){
			echo 'successfully updated description';
		} else {
			echo 'unable to update description';
		}
	} else {

		//read data from the forms
		$name = trim($_POST['name']);
		$date = trim($_POST['date']);
		$time = trim($_POST['time']);
		$street = trim($_POST['street']);
		$city = trim($_POST['city']);
		$state = trim($_POST['state']);
		$p_code = trim($_POST['p_code']);
		$contact_phone = trim($_POST['contact_phone']);
		$contact_email = trim($_POST['contact_email']);
		$event_category = trim($_POST['event_category']);
		$event_visibility = trim($_POST['event_visibility']);

		//convert time to sql form
		$datetime = DateTime::createFromFormat("Y-m-d h:i a", "" . $date . " " . $time . "");
		if(!$datetime){
			echo 'Please use the format yyyy-mm-dd for month and hh:mm am/pm for time';
			die();
		} 
		$date_con = $datetime->format("Y-m-d");
		$time_con = $datetime->format("H:i");


		if($eid == 0){
			//create new address
			$temp = $db->prepare("INSERT INTO address (street, city, sid, p_code) VALUES (?,?,?,?)");
			$temp->bind_param('ssss', $street, $city, $state, $p_code);
			$temp->execute();
			if($db->affected_rows){
				echo 'successfully created new address';
			} else {
				echo 'unable to create new address';
			}
			$aid = $db->insert_id;

			//create new event
			if(empty($uid)){
				$uid = NULL;
			}
			$temp = $db->prepare("INSERT INTO
				event (owner, name, date, time, aid, contact_phone, contact_email, ecid, evid) 
				VALUES (?,?,?,?,?,?,?,?,?)");
			$temp->bind_param('sssssssss', $email, $name, $date_con, $time_con, $aid,
				$contact_phone, $contact_email, $event_category, $event_visibility);
			$temp->execute();
			$eid = $db->insert_id;

			//add connections
			if($mode == 1){
				//created by rso, get list of related university groups
				$temp = $db->query("SELECT uid FROM university_rso_link WHERE (rid) = '" . $rid . "'");
				$uid_list = $temp->fetch_all(MYSQLI_ASSOC);

				//add rso link to event
				$db->query("INSERT INTO rso_event_list (eid, rid) VALUES ('" . $eid . "', '" . $rid . "')");

				//add university link to event if present
				foreach($uid_list as $uid){
					$db->query("INSERT INTO university_event_list (eid, uid) VALUES ('" . $eid . "', '" . $uid . "')");
				}


			} else if($mode == 2){
				//created by university, get list of related rso groups
				$temp = $db->query("SELECT rid FROM university_rso_link WHERE (uid) = '" . $uid . "'");
				$rid_list = $temp->fetch_all(MYSQLI_ASSOC);

				//add university link to event
				$db->query("INSERT INTO university_event_list (eid, uid) VALUES ('" . $eid . "', '" . $uid . "')");

				//add rso link to event if present
				foreach($rid_list as $rid){
					$db->query("INSERT INTO rso_event_list (eid, rid) VALUES ('" . $eid . "', '" . $rid . "')");
				}
			}

		} else {
			//update address
			$temp = $db->query("SELECT aid FROM event WHERE (eid) = '" . $eid . "'");
			$aid = $temp->fetch_assoc();
			$temp = $db->prepare("UPDATE address SET 
				address.street = ?,
				address.city = ?,
				address.sid = ?,
				address.p_code = ?
				WHERE (address.aid) = '" . $aid['aid'] . "'");
			$temp->bind_param('ssss', $street, $city, $state, $p_code);
			$temp2 = $temp->execute();
			if($db->affected_rows){
				echo 'successfully updated address';
			} else {
				echo 'unable to update address';
			}

			//update event
			$temp = $db->prepare("UPDATE event SET
				event.name = ?,
				event.date = ?,
				event.time = ?,
				event.contact_phone = ?,
				event.contact_email = ?,
				event.ecid = ?,
				event.evid = ?
				WHERE (event.eid) = '" . $eid . "'");
			$temp->bind_param('sssssss', $name, $date_con, $time_con, $contact_phone, $contact_email,
				$event_category, $event_visibility);
			$temp2 = $temp->execute();
			if($db->affected_rows){
				echo 'successfully updated event';
			} else {
				echo 'unable to update event';
			}
		}
	}

}

//start retrieving data to display fields
if(!empty($_GET)){

	//event id required, error on no event in url
	if( !isset($eid) ){
		echo 'no event specified';
		die();
	}

	$temp = $db->query("SELECT * FROM event WHERE (eid) = '" . $eid . "'");
	$event = $temp->fetch_assoc();
	
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
	if(strcmp($email, $event['owner'] ) == 0){
		$owner = true;
	}

	//error if user can't edit this event
	if(!($admin || $super_admin || $owner) && !isset($_GET['new']) ){
		echo 'you don\'t have the privileges to edit this event';
		die();
		//ader("Location:rso_page.php?rso=" . $rid . "");
	}

	//get event category and visibility information
	$temp = $db->query("SELECT * FROM event_category");
	$event_category = $temp->fetch_all(MYSQLI_ASSOC);

	$temp = $db->query("SELECT * FROM event_visibility");
	$event_visibility = $temp->fetch_all(MYSQLI_ASSOC);


	$temp = $db->query("SELECT * FROM state");
	$state = $temp->fetch_all(MYSQLI_ASSOC);


	//determine if new event or editing
	if(isset($_GET['new'])){
		
		$new =true;
		$event = 0;
		$aid = 0;

	} else {
		$new = false;

		//only change if event id hasn't already been created
		if(empty($eid)){
			$eid = trim($_GET['event']);
		}
		//get event information
		$temp = $db->query("SELECT * FROM event WHERE (eid) = '" . $eid . "'");
		$event = $temp->fetch_assoc();
		
		if(empty($event)){
			//exit if no rso using the passed rid exists
			echo 'no such event exists';
			header("Location:index.php?result=no_event");
			die();
		}
		$aid = $event['aid'];
	}

	//get address information
	$temp = $db->query("SELECT * FROM address WHERE (aid) = '" . $aid . "'");
	$address = $temp->fetch_assoc();
		
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
	<title> Edit <?php echo escape($event['name']); ?></title>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<?php createUserPanel($db, $email); ?>

	<?php 
		function optionSelect($return_name, $field, $value, $name, $current) {
		?>
			<select id="<?php echo escape($return_name); ?>" name="<?php echo escape($return_name); ?>" size="1"
				selected="<? echo escape($current); ?>" >

			<?php
			foreach($field as $s){
				if($s[$value] == $current) {
			?>
					<option selected="selected" value="<?php echo escape($s[$value]); ?>"><?php echo escape($s[$name]); ?></option>
				<?php
				} else {
				?>

				<option value="<?php echo escape($s[$value]); ?>"><?php echo escape($s[$name]); ?></option>

			<?php
			}
		}
			?>

			</select>
		<?php
		}
		?>

	
		
</head>

<body>
<?php
	if(!$new){
				?>
		<h3>Description</h3>

		<form action="?rso=<?php echo escape($rid); ?>&event=<?php echo escape($eid);?>" method="POST">
			<textarea name="description"><?php echo escape($event['description']); ?></textarea><br>
			<input type="submit" value="Save changes"/>
		</form>

	<?php

		$time = date_format(DateTime::createFromFormat("H:i:s", $event['time']), 'h:i a');

	} else {

		$time = "";

	}

?>


<h2>Edit event information</h2>

<form action="?rso=<?php echo escape($rid); ?>&event=<?php echo escape($eid);?>" method="POST">
	Event name:<input type="text" name="name" value="<?php echo escape($event['name']) ;?>"/><br>
	Date:<input type="date" name="date" value="<?php echo escape($event['date']);?>"/><br>
	Time:<input type="time" name="time" value="<?php echo escape($time) ;?>"/><br><br>
	Location:<br>
	Street:<input type="text" name="street" value="<?php echo escape($address['street']);?>"/><br>
	City:<input type="text" name="city" value="<?php echo escape($address['city']);?>"/><br>
	State:<?php optionSelect("state", $state, "sid", "name", $address['sid']); ?><br>
	Postal code:<input type="text" name="p_code" value="<?php echo escape($address['p_code']);?>"/><br>
	Contact Phone:<input type="time" name="contact_phone" value="<?php echo escape($event['contact_phone']);?>"/><br>
	Contact Email:<input type="time" name="contact_email" value="<?php echo escape($event['contact_email']);?>"/><br>

	Event Category:<?php optionSelect("event_category", $event_category, "ecid", "type", $event['ecid']); ?><br>

	Event Visibility: <?php optionSelect("event_visibility", $event_visibility, "evid", "type", $event['evid']); ?><br>
	<input type="submit" value="Save changes"/>
</form>

</body>
</html>