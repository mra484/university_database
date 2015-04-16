<?php
error_reporting(1);
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

$records = array();

if(!empty($_POST['email']) && empty($_POST['distance'])) {
 	if(isset($_POST['email'], $_POST['password'])) {
		$email	 = trim($_POST['email']);
		$password	 = trim($_POST['password']);
		
			$check = $db->query("SELECT password FROM userlist WHERE email = '" . $email . "' LIMIT 1");
			if(mysqli_num_rows($check) != 0) {
				$user = $check->fetch_object();
				//if(strcmp($password, $user->password) == 0) {
				if( password_verify($password, $user->password) ) {
					//continue
				} else {
						//failed
					header("Location:index.php?result=loginFailed");
					die();
				}
			} else { 
				echo 'check failed';
				die(); 
			}
		
		//get row for username, return to index if no record exists
		$email	 = trim($_POST['email']);
		//create cookie for email that lasts 600 seconds
		setCookie("user", $email, time() + (86400), "/");
		$result = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
		//echo $result->num_rows;
		$user = $result->fetch_assoc();

	}  else if ( isset($_COOKIE['user'])) {
		//cookie present, skip error
	} else {
	//return if no cookie present
	header("Location:index.php?result=loginFailed");

	}
} else if ( isset($_COOKIE['user'])) {
		//read from cookie
		$email = trim($_COOKIE['user']);
		$result = $db->query("SELECT * FROM userlist WHERE (email) = '" . $email . "' LIMIT 1");
		//echo $result->num_rows;
		$user = $result->fetch_assoc();
		$distance = 0;
		$location = 0;
		// <script>
		// navigator.geolocation.getCurrentPosition(showPosition);

		// function showPosition(position){
		// 	x.innerHTML = "latitude: " + position.coords.latitude + 
		// 	"<br> Longitude: " + position.coords.longitude;
		// }
		// </script>
		if(isset($_GET['distance'])){
			
				 // <script>
					// var x = document.getElementById("demo");
					// function getLocation() {
					//     if (navigator.geolocation) {
					//         navigator.geolocation.getCurrentPosition(showPosition);
					//     } else {
					//         x.innerHTML = "Geolocation is not supported by this browser.";
					//     }
					// }
					// function showPosition(position) {
					//     x.innerHTML = "Latitude: " + position.coords.latitude +
					//     "<br>Longitude: " + position.coords.longitude;
					// }
					// </script>
					
			//$distance = "SELECT id, ( 3959 * acos( cos( radians(position.coordsl.latitude) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122) ) + sin( radians(37) ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;"
		}

		if(isset($_POST['distance'])){
			$distance = trim($_POST['distance']);
			$location = trim($_POST['location']);
		}
		switch($location){
			default:
			case 0:
			$location = 0;
			$source = "groups and university";
			$temp = $db->query("SELECT uid FROM university_member_list WHERE (email) = '" . $email . "'");
			$uid = $temp->fetch_assoc();
			$events = 0;
			break;

			case 1:
			$source = "groups";
			$temp = $db->query("SELECT * FROM rso_event_list
				LEFT JOIN event ON rso_event_list.eid = event.eid
				WHERE (rid) IN (SELECT rid FROM rso_member_list WHERE (email) = '" . $email . "')
				ORDER BY date ASC, time ASC");
			$events = $temp->fetch_all(MYSQLI_ASSOC);

			break;
			case 2:
			$source = "University";
			$temp = $db->query("SELECT * FROM university_event_list
				LEFT JOIN event ON university_event_list.eid = event.eid
				WHERE (uid) IN (SELECT uid FROM university_member_list WHERE (email) = '" . $email . "')
				ORDER BY date ASC, time ASC");
			$events = $temp->fetch_all(MYSQLI_ASSOC);

			break;
			case 3:
			$source = "everywhere";
			$temp = $db->query("SELECT * FROM event WHERE (eid) > 0
			&& (evid) = '0' ORDER BY date ASC, time ASC");
			$events = $temp->fetch_all(MYSQLI_ASSOC);
		}
	} else {
		header("Location:index.php?result=time_out");
	}
?>

<!doctype html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Main page</title>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
		
	</style>
</head>

<body>
<?php
createUserPanel($db, $email);
?>
<h3>Welcome <?php echo escape($user['first_name']); ?></h3>
			<?php
			if(!count($user)) {
				echo 'No records';
			} else {
				?>

	<!-- display user information -->
	<table border_width="1px">
		<thead>
			<tr>
				<th>First name</th>
				<th>Last name</th>
				<th>Email</th>
				<th>Phone number</th>
			</tr>
		<thead>
		<tbody>
			<tr>
			<td><?php echo escape($user['first_name']); ?></td>
			<td><?php echo escape($user['last_name']); ?></td>
			<td><?php echo escape($user['email']); ?></td>
			<td><?php echo escape($user['phone_number']); ?></td>
			</tr>
		</tbody>
	</table> <br>

	<?php
			}
			?>
	
	<!-- menu panel -->
	<div id="side_panel" >
		<p><a href="rso.php"> My Groups </a></p>
		<p><a href="university.php"> My University </a></p>
		<p><a href="univ_select.php?browse=1"> Other Universities </a></p>
		<p><a href="univ_edit.php?new=1"> Create University </a></p>
		
	</div>

	<div id="main_page_events" >
		<h3>Upcoming Events</h3>
		Viewing events from <?php echo escape($source); ?><br>
		<form action="" method="POST">
			View options by: <select name="location" size="1">
				<option value="0">Groups and University</option>
				<option value="1">Groups</option>
				<option value="2">University</option>
				<option value="3">All</option>
			</select><br>
			Max distance(miles): <input type="number" name="distance" value="<?php $distance ?>"/><br>
			<input type="submit" value="search" />
		</form>
		<br>
		<?php
		 if($events != 0){
			printEventList($events);
		} else {
			printEventList3($email, $db);
		}
		?>
	</div>


</body>
</html>