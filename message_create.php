<?php
require 'db/connect.php';
require 'db/security.php';

if(!empty($_COOKIE)){
	$email = trim($_COOKIE['user']);
	
	if(isset($_POST)){
		if(isset($_POST['delete'])){
			$mid = trim($_GET['reply']);
			$db->query("DELETE FROM mail WHERE (mail.mid) = '" . $mid . "'");
			$db->query("DELETE FROM mail_list WHERE (mail_list.mid) = '" . $mid . "'");
			header("Location:mailbox.php");
		} else if (isset($_POST['reply'])){
			$mid = trim($_GET['reply']);
			$temp = $db->query("SELECT * FROM mail 
				LEFT JOIN mail_list ON mail.mid = mail_list.mid
				WHERE (mail.mid) = '" . $mid . "'");

			$message = $temp->fetch_assoc();
			$quote = '&#13;&#10;_______________&#13;&#10;' . 'Sent on: ' . $message['sent'] . '&#13;&#10;From: ' . $message['from_user'] . '&#13;&#10;To: ' . 
				$message['to_user'] . '&#13;&#10;Subject: ' . $message['subject'] .
				'&#13;&#10;&#13;&#10;';
			$description = $message['message'];
			$to_user = $message['from_user'];
			$title = 'Reply to message';
			$subject = 'Re: ' . $message['subject'];
		} else if (isset($_GET['new'])){
			$quote = " ";
			$description = " ";
			$to_user = " ";
			$title = "Create new message";
			$subject = " ";
		} else if (isset($_POST['send'])){
			$to_user = trim($_POST['to_user']);
			$subject = trim($_POST['subject']);
			$description = trim($_POST['message_text']);
			$sql = $db->prepare("INSERT INTO mail (subject, message, sent)
			VALUES (?,?,NOW())");
			$sql->bind_param('ss', $subject, $description);
			if( $sql->execute() ){
				$mid = $db->insert_id;
				$db->query("INSERT INTO mail_list (to_user, from_user, mid)
				VALUES ('" . $to_user . "', '" . $email . "', '" . $mid . "')");
				header("Location:mailbox.php?result=message_sent");
				
			} else {
				echo 'unable to send message, check recipient email';
			}
			
		} else if (isset($_POST['cancel'])){
			header("Location:mailbox.php");
		}
		
	} else {
		echo 'no message';
		die();
	}
	
	
}else {
	echo 'timed out';
	die();
}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<title><?php echo escape($title); ?></title>
</head>
<body>

	<form action="?send=1" method="POST">
		To: <input type="text" name="to_user" value="<?php echo escape($to_user); ?>" /><br>
		Subject: <input type="text" name="subject" value="<?php echo escape($subject); ?>" /><br>
		<textarea name="message_text" cols="50" rows="20"><?php echo $quote; echo escape($description); ?></textarea><br>
		<input type="submit" value="Send" name="send" />
		<input type="submit" value="Cancel" name="cancel" />
	</form>
</body>
</html>