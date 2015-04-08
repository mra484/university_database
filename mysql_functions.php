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
</html>