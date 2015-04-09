<?php
	function createUserPanel($db, $email){
		$temp = $db->query("SELECT mid FROM mail_list WHERE to_user = '" . $email . "'");
		$inbox = count($temp);

		?>
		<html>
		<div id="user_panel">
			<a href="mainpage.php">Home</a> 
			<a href="mailbox.php">Mail(<?php echo escape($inbox); ?>)</a> 
			<a href="index.php?result=logout">Log out</a>
		</div>
		</html>
<?php
	}
?>