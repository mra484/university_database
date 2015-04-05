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


if(!empty($_GET)){
	//retrieve rso and event ids
	$rso_id = trim($_GET['rso']);

	//get table containing rso information
	$temp = $db->query("SELECT rso.name AS name, rso.description as description, rso_type.type as type
		FROM rso, rso_type
		WHERE (rso.rid) = '" . $rso_id . "' && (rso_type.rtid) = (rso.rtid)");
	
	$rso = $temp->fetch_assoc();

		
	//get user's admin field from rso_member_list
	$temp = $db->query("SELECT r.admin AS admin FROM rso_member_list AS r
		WHERE (r.rid) = '" . $rso_id . "'
		&& (r.email) = '" . $email . "'");
	$rso_member = $temp->fetch_assoc();

	//return if user isn't admin of this group
	if(!$rso_member['admin']){
		header("Location:rso_page.php?rso=" . $rso_id . "");
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
		//TODO handle $event_id, $address, $event for creating new event
		$event_id = 0;
		$event = 0;
		$aid = 0;

	} else {
		$new = false;

		$event_id = trim($_GET['event']);

		//get event information
		$temp = $db->query("SELECT * FROM event WHERE (eid) = '" . $event_id . "'");
		$event = $temp->fetch_assoc();
		
		if(empty($event)){
			//exit if no rso using the passed rid exists
			echo 'no such event exists';
			header("Location:index.php?result=no_event");
			die();
		}

		//get address information
		$temp = $db->query("SELECT * FROM address WHERE (aid) = '" . $event['aid'] . "'");
		$address = $temp->fetch_assoc();
	}
		
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
	<style type="text/css">
		#greyrow{ border: 10px white solid; }
	</style>

	<?php 
		function optionSelect($return_name, $field, $value, $name) {
		?>
			<select id="<?php echo escape($return_name); ?>" name="<?php echo escape($return_name); ?>" size="<?php echo count($event_category); ?>"/>

			<?php
			foreach($field as $s){
				?>

				<option value="<?php echo escape($s[$value]); ?>"><?php echo escape($s[$name]); ?></option>

			<?php
			}
			?>

			</select>
		<?php
		}
		?>

	
		
</head>

<body>

<h3>Description</h3>

<form action="?rso=<?php echo escape($rso_id); ?>&event=<?php echo escape($event_id);?>" method="POST">
	<textarea name="description" ><?php echo escape($event['description']); ?></textarea><br>
	<input type="submit" value="Save changes"/>
</form>




<h2>Edit event information</h2>

<form action="?rso=<?php echo escape($rso_id); ?>&event=<?php echo escape($event_id);?>" method="POST">
	Event name:<input type="text" name="name" value="<?php echo escape($event['name']);?>"/><br>
	Date:<input type="date" name="name" value="<?php echo escape($event['date']);?>"/><br>
	Time:<input type="time" name="name" value="<?php echo escape($event['time']);?>"/><br>
	Location:<br>
	Street:<input type="text" name="name" value="<?php echo escape($address['street']);?>"/><br>
	City:<input type="text" name="name" value="<?php echo escape($address['city']);?>"/><br>
	State:<?php optionSelect("state", $state, "sid", "name"); ?><br>
	Postal code:<input type="text" name="name" value="<?php echo escape($address['p_code']);?>"/><br>
	Contact Phone:<input type="time" name="name" value="<?php echo escape($event['contact_phone']);?>"/><br>
	Contact Email:<input type="time" name="name" value="<?php echo escape($event['contact_email']);?>"/><br>

	Event Category:<?php optionSelect("event_category", $event_category, "ecid", "type"); ?><br>

	Event Visibility: <?php optionSelect("event_visibility", $event_visibility, "evid", "type"); ?><br>
	<input type="submit" value="Save changes"/>
</form>

</body>
</html>