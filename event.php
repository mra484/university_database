<?php
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

if(isset($_GET)){
	if(isset($_COOKIE['user'])){
		$email = trim($_COOKIE['user']);
		$browse = 0;
	} else {
		$browse = 1;
		$email = 1;
	}

	$eid = trim($_GET['event']);

	//create comment if posted
	if(!empty($_POST['comment_text'])) {
		$message = trim($_POST['comment_text']);
		$db->query("INSERT INTO comment (email, message, eid, created) VALUES ('" . $email . "', '" . $message . "', '" . $eid . "', NOW())");
		if($db->affected_rows == 1){
			//echo 'comment created';
		} else {
			//echo 'unable to create comment';
		}
	}

	//edit comment if posted
	if(!empty($_POST)) {
		if(isset($_GET['cid'])){
			$cid = trim($_GET['cid']);
		}
		if(isset($_POST['edit_comment'])){
			$message = trim($_POST['edit_text']);
			echo $message;

			$sql = $db->prepare("UPDATE comment SET comment.message = ? WHERE (comment.cid) = ?");
			$sql->bind_param('ss', $message, $cid);
			$sql->execute();

			if($db->affected_rows == 1){
				//echo 'comment edited';
			} else {
				//echo 'unable to edit comment';
			}

		} else if(isset($_POST['delete_comment'])){
			$sql = $db->prepare("DELETE FROM comment WHERE comment.cid = ?");
			$sql->bind_param('s', $cid);
			$sql->execute();

			if($db->affected_rows == 1){
				//echo 'comment deleted';
			} else {
				//echo 'unable to delete comment';
			}
		} else if(isset($_POST['rating'])){
			$rating = trim($_POST['rating']);
			$db->query("INSERT INTO event_voters (email, eid, vote)
				VALUES ('" . $email . "', '" . $eid . "', '" . $rating . "')
				ON DUPLICATE KEY UPDATE
				vote = '" . $rating . "'");

		}
	}

	$temp = $db->query("SELECT * FROM event WHERE (eid) = '" . $eid . "'");
	$event = $temp->fetch_assoc();

	$datetime = DateTime::createFromFormat("Y-m-d H:i:s", "" . $event['date'] . " " . $event['time'] . "");
	$date_con = $datetime->format("D, M d, Y");
	$time_con = $datetime->format("h:i a");

	$event['date'] = $date_con;
	$event['time'] = $time_con;

	$temp = $db->query("SELECT address.*, state.name FROM address, state
			WHERE (address.aid) = '" . $event['aid'] . "' && (state.sid) = (address.sid) " );
	$address = $temp->fetch_assoc();
	$address_string = "";
	if(!empty($event['aid'] && $event['aid'] != 0)){
		$address_string = "" . $address['street'] . ", " . $address['city'] . ", " . $address['sid'] .  ", " . $address['p_code'];
	}
	$admin = false;
	$super_admin = false;
	$owner = false;

	if($browse != 1){
		$admin = checkEventAdmin($eid, $email, $db);
		//echo '<pre>', var_dump($eid), '</pre>';
		//echo '<pre>', var_dump($email), '</pre>';
		//echo '<pre>', var_dump($db), '</pre>';
		//echo 'is admin?' . var_dump($admin) . '<br>';
		$super_admin = checkEventSuperAdmin($eid, $email, $db);
		//echo 'is super_admin?' . var_dump($super_admin);

		$owner = false;
		if(strcmp($email, $event['owner'] ) == 0){
			$owner = true;
		}
	}

	//get ratings
	$temp = $db->query("SELECT SUM(vote) as sum, COUNT(vote) as votes FROM event_voters
		WHERE (eid) = '" . $eid . "'");
	$votes = $temp->fetch_assoc();


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
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<?php  createUserPanel($db, $email); ?>
	<title><?php echo escape($event['name']); ?> </title>
	<style>
		#map-canvas {
			width: 500px;
			height: 400px;
			margin-left: 10px;
			margin-top: 30px;
			float: right;
		}
		#event_info {
			min-height: 450px;
		}
	</style>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
	<script>
	var map;
	var geocoder;
	var coordinates = new google.maps.LatLng(<?php echo escape($address['latitude']);?>,<?php echo escape($address['longitude']);?>);
		function initialize() {
			geocoder = new google.maps.Geocoder();
			var mapCanvas = document.getElementById('map-canvas');
			var mapOptions = {
				center: coordinates,
				zoom: 10,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			map = new google.maps.Map(mapCanvas, mapOptions);

			var marker = new google.maps.Marker({
				map: map,
				position: coordinates
			});
		}
		google.maps.event.addDomListener(window, 'load', initialize);


		function handleRating(input){
			if(input.value < 0) input.value = 0;
			if(input.value > 5) input.value = 5;
		}

	</script>
</head>

<body>

	<div id="map-canvas"></div>
		<div id="event_info">
			<?php if($admin || $super_admin || $owner) {
			?>
				<br>
				<a href="event_edit.php?event=<?php echo escape($event['eid']); ?>">Edit event</a><br>
			<?php
			}
			?>
			<div id="event_title"><?php echo escape($event['name']); ?> </div>

			<div id="event_time" >
				<?php echo escape($event['date']); ?> at <?php echo escape($event['time']); ?> <br>
			</div>

			<br>

		<?php if(!empty($event['aid'])){ ?>
			<div id="event_location" >
				<?php echo escape($address['street']); ?><br>
				<?php echo escape($address['city']); ?> <?php echo escape($address['sid']); ?> <?php echo escape($address['p_code']); ?><br>
			</div>

			<br>

		<?php } ?>
			<div id="event_description" >
				<p><?php echo nl2br($event['description']); ?></p>
			</div>

			<br>

		<?php if(!empty($event['contact_phone']) && !empty($event['contact_email'])){ ?>
			<div id="event_contact" >
				Contact Phone: <?php echo escape($event['contact_phone']); ?> <br>
				Contact Email: <?php echo escape($event['contact_email']); ?> <br><br>
			</div>
		<?php } ?>

		User rating: <?php echo escape( ($votes['votes'] == 0 ? 0.0 : $votes['sum'] / $votes['votes']) ); ?> (<?php echo escape($votes['votes']); ?>)<br>
		<?php if($browse != 1){ ?>
		<form method="POST" action="?event=<?php echo escape($eid); ?>">
			My rating: <input type="text" onchange="handleRating(this);" name="rating" />
			<input type="submit" value="Rate" name="rate"/>
		</form>
		<?php } ?>
		<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
		</div>

	<hr>
	<br>
	<div id="event_comment_section" >
		<?php if($browse != 1){ ?>
		<div id="event_comment">
			<form action="?event=<?php echo escape($event['eid']); ?>" method="POST" >
				<textarea cols="40" rows="5" name="comment_text"></textarea><br>
				<input type="submit" value="New Comment" /><br>
			</form>
		</div>
		<?php 
		}
		foreach($comments as $c){
			?>
			<div id="event_comment">
				<br>
				<form action="?event=<?php echo escape($event['eid']); ?>&cid=<?php echo escape($c['cid']); ?>" method="POST" >

				<?php 
				if( strcmp($c['email'], $email) == 0) {
					//have user's comments appear as editable text for editing
				?>
					<textarea cols="40" rows="5" name="edit_text"><?php echo escape($c['message']); ?></textarea><br>
					<p id="comment_tag"><?php echo escape($c['first_name']); ?> <?php echo escape($c['last_name']); ?><br>
						<?php echo escape($c['created']); ?> 
					</p>
					<input type="submit" name="edit_comment" value="Edit Comment" />
					<input type="submit" name="delete_comment" value="Delete Comment" /><br>
					
				<?php
				} else {
					//message displayed as seen by others
				?>

					<p><?php echo escape($c['message']); ?> </p>
					<p class="comment_tag"><?php echo escape($c['first_name']); ?> <?php echo escape($c['last_name']); ?><br>
						<?php echo escape($c['created']); ?> 
					</p>

					<?php
					if($admin || $owner || $super_admin){
					//add delete button for owners and admins
					?>
						<input type="submit" name="delete_comment" value="Delete Comment" /><br>

					<?php
					}
					?>


				<?php 
				}
				?>

				</form>
			</div>
		<?php
		}
		?>

	</div>
</body>
</html>
