<?php
require 'db/connect.php';
require 'db/security.php';

if(!empty($_COOKIE)){
	$email = trim($_COOKIE['user']);
	
	if(isset($_GET['mid'])){
		$mid = trim($_GET['mid']);
		
		$temp = $db->query("SELECT * FROM mail WHERE (mid) = '" . $mid . "'");
		$message = $temp->fetch_assoc();
		$description = str_replace('CHAR(13)', '<br>', $message['message']);
		
	}else{
		echo 'no message';
		die();
	}
} else {
	echo 'timed out';
	die();
}
?>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<title><?php echo escape($message['subject']); ?></title>
</head>
<body>

	<h3><?php echo escape($message['subject']); ?></h3>
	<p><?php echo nl2br($message['message']); ?></p>
	<form action="message_create.php?reply=<?php echo escape($mid); ?>" method="POST" >
		<input type="submit" name="reply" value="reply" />
		<input type="submit" name="delete" value="delete message" />
	</form>

</body>
</html>