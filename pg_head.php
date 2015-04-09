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