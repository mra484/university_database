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

if(isset($_GET['university'])){
	$uid = trim($_GET['university']);
}

if(isset($_GET['new']) ){
	$uid = 0;
}

if(!empty($_POST)){

	$uid = trim($_GET['university']);

	if(isset($_POST['remove'])){
		//unlink group from this university
		$rid = trim($_GET['remove']);
		$sql = $db->prepare("DELETE FROM university_rso_link WHERE (university_rso_link.uid) = ? && (university_rso_link.rid) = ?");
		$sql->bind_param('ss', $uid, $rid);
		$sql->execute();

	} else if(isset($_POST['updaterss'])){
		$temp = $db->query("SELECT * FROM university WHERE (uid) = '" . $uid . "'");
		$univ = $temp->fetch_assoc();

		if(!empty($univ['rss']) ){
			$db->query("DELETE FROM event WHERE (eid) = 
				(SELECT eid FROM university_event_list 
					WHERE (university_list.uid) = '" . $uid . "')");
			$db->query("DELETE FROM university_event_list WHERE (university_event_list.uid) = '" . $uid . "'");
			getRSS($uid, $db);
		}




	}else if (isset($_POST['rso_select'])){
		//link group to this university
		$rid = trim($_POST['rso_select']);
		$sql = $db->prepare("INSERT INTO university_rso_link (uid, rid) VALUES (?,?)");
		$sql->bind_param('ss', $uid, $rid);
		$sql->execute();

	} else if(isset($_POST['description'])){
		//read description, (update only);
		$description = trim($_POST['description']);
		$temp = $db->query("UPDATE university SET 
			university.description = '" . $description . "'
			WHERE (university.uid) = '" . $uid . "'");
		if($temp){
			echo 'successfully updated description';
		} else {
			echo 'unable to update description';
		}
	} else {

		//read data from the forms
		$name = trim($_POST['name']);
		$street = trim($_POST['street']);
		$city = trim($_POST['city']);
		$state = trim($_POST['state']);
		$p_code = trim($_POST['p_code']);
		$domain = trim($_POST['domain']);
		$rss = trim($_POST['rss']);

		if($uid == 0){
			//create new address
			$temp = $db->prepare("INSERT INTO address (street, city, sid, p_code) VALUES (?,?,?,?)");
			$temp->bind_param('ssss', $street, $city, $state, $p_code);
			$temp->execute();
			if($db->affected_rows != 0){
				echo 'successfully created new address';
			} else {
				echo 'unable to create new address';
			}
			$aid = $db->insert_id;

			//create new university
			$temp = $db->prepare("INSERT INTO
				university (name, aid, domain) 
				VALUES (?,?,?)");
			$temp->bind_param('sss', $name, $aid, $domain);
			$temp->execute();
			$uid = $db->insert_id;

			//set creator as super_admin
			$db->query("DELETE FROM university_member_list WHERE (university_member_list.email) = '" . $email . "'");
			$sql = $db->prepare("INSERT INTO university_member_list (email, uid, super_admin) VALUES (?,?,b'1')");
			$sql->bind_param('ss', $email, $uid);
			$sql->execute();

		} else {
			//update address
			$temp = $db->query("SELECT aid FROM university WHERE (uid) = '" . $uid . "'");
			$aid = $temp->fetch_assoc();
			$temp = $db->prepare("UPDATE address SET 
				address.street = ?,
				address.city = ?,
				address.sid = ?,
				address.p_code = ?
				WHERE (address.aid) = '" . $aid['aid'] . "'");
			$temp->bind_param('ssss', $street, $city, $state, $p_code);
			$temp2 = $temp->execute();
			if($db->affected_rows != 0){
				echo 'successfully updated address';
			} else {
				echo 'unable to update address';
			}

			//update university
			$temp = $db->prepare("UPDATE university SET
				university.name = ?,
				university.domain = ?
				WHERE (university.uid) = '" . $uid . "'");
			$temp->bind_param('ss', $name, $domain);
			$temp2 = $temp->execute();
			if($db->affected_rows != 0){
				echo 'successfully updated university';
			} else {
				echo 'unable to update university';
			}
		}
	}

}

//start retrieving data to display fields
if(!empty($_GET)){

	//university id required, error on no university in url
	if( !isset($uid) ){
		echo 'no university specified';
		die();
	}

	$temp = $db->query("SELECT * FROM university WHERE (uid) = '" . $uid . "'");
	$university = $temp->fetch_assoc();
	
	$super_admin = false;

	if(!empty($university['uid']) ){
		$temp = $db->query("SELECT super_admin FROM university_member_list WHERE (email) = '" . $email  . "' && (uid) = '" . $university['uid'] . "'");
		$super_admin = $temp->fetch_assoc();
	}

	//error if user can't edit this university
	if(!$super_admin && !isset($_GET['new']) ){
		echo 'you don\'t have the privileges to edit this university';
		die();
	}

	$temp = $db->query("SELECT * FROM state");
	$state = $temp->fetch_all(MYSQLI_ASSOC);


	//determine if new university or editing
	if(isset($_GET['new'])){
		
		$new =true;
		$university = 0;
		$aid = 0;

	} else {
		$new = false;

		//only change if university id hasn't already been created
		if(empty($uid)){
			$uid = trim($_GET['university']);
		}
		//get university information
		$temp = $db->query("SELECT * FROM university WHERE (uid) = '" . $uid . "'");
		$university = $temp->fetch_assoc();
		
		if(empty($university)){
			//exit if no rso using the passed rid exists
			echo 'no such university exists';
			header("Location:index.php?result=no_university");
			die();
		}
		$aid = $university['aid'];
	}

	//get address information
	$temp = $db->query("SELECT * FROM address WHERE (aid) = '" . $aid . "'");
	$address = $temp->fetch_assoc();

	//get list of affiliated groups
	$temp = $db->query("SELECT * FROM university_rso_link 
		LEFT JOIN rso ON university_rso_link.rid = rso.rid
		LEFT JOIN rso_type ON rso.rtid = rso_type.rtid
		WHERE (uid) = '" . $uid . "'");
	$rso_list = $temp->fetch_all(MYSQLI_ASSOC);

	//get list of other groups
	$temp = $db->query("SELECT rid, name, rtid FROM rso r WHERE NOT EXISTS
			(SELECT * FROM university_rso_link WHERE (university_rso_link.uid) = '" . $uid . "'
				&& (university_rso_link.rid) = (r.rid) )");
	$non_member = $temp->fetch_all(MYSQLI_ASSOC);

		
} else {
	//exit if no rso variable passed
	echo 'no such university exists';
	header("Location:index.php?result=no_univ");
	die();
}

?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title> Edit <?php echo escape($university['name']); ?></title>
	<?php createUserPanel($db, $email); ?>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">

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

		<form action="?university=<?php echo escape($uid);?>" method="POST">
			<textarea name="description" cols="80" rows="25"><?php echo escape($university['description']); ?></textarea><br>
			<input type="submit" value="Save changes"/>
		</form>

	<?php
	}

?>


<h2>Edit university information</h2>

<form action="?university=<?php echo escape($uid);?>" method="POST">
	University name:<input type="text" name="name" size="90" value="<?php echo escape($university['name']) ;?>"/><br><br>
	Location:<br>
	Street:<input type="text" name="street" size="90"value="<?php echo escape($address['street']);?>"/><br>
	City:<input type="text" name="city" size="40" value="<?php echo escape($address['city']);?>"/>
	State:<?php optionSelect("state", $state, "sid", "name", $address['sid']); ?>
	Postal code:<input type="text" name="p_code" value="<?php echo escape($address['p_code']);?>"/><br><br>

	Domain:<input type="text" name="domain" size="90" value="<?php echo escape($university['domain']);?>"/><br>
	RSS address:<input type="text" name="rss" size="90" value="<?php echo escape($university['rss']);?>"/><br>
	<input type="submit" value="Save changes"/>
</form>

<h2>Group list</h2>
<form action="?university=<?php echo escape($university['uid']); ?>" method="POST" >
	<!-- list of possible groups to add -->
	<select id= "rso_select" name="rso_select" size="1">
		<?php
		foreach($non_member as $r){
			?>
			<option value="<?php echo escape($r['rid']); ?>" ><?php echo escape($r['name']); ?> </option>

		<?php
		}
		?>
	</select>
	<input type="submit" value="Link" />
</form>

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
			<td><form action="?university=<?php echo escape($university['uid']); ?>&remove=<?php echo escape($r['rid']); ?>" method="POST">
				<input type="submit" name="remove" value="remove" />
			</form></td>
		</tr>
			<?php
	}
	?>
	</table>
	<?php
}
?>

<!-- event list header -->
<h3>event list</h3>
	<form action="event_edit.php?university=<?php echo escape($uid); ?>&new=1" method="POST">
		<input type="submit" value="create event"/>
	</form>
	<form action="?university=<?php echo escape($uid); ?>" method="POST">
		<input type="submit" name="updaterss" value="recreate event list from rss" />
	</form>
	<?php
		printEventList2(NULL, $uid, $db);
		
	?>

</body>
</html>