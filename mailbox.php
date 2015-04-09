<?php
require 'db/connect.php';
require 'db/security.php';
require 'mysql_functions.php';

	if( !empty($_COOKIE)){
		$email = trim($_COOKIE['user']);

		$temp = $db->query("SELECT * FROM mail_list
			LEFT JOIN mail on mail_list.mid = mail.mid
			WHERE (mail_list.to_user) = '" . $email . "'");
		$message_list = $temp->fetch_all(MYSQLI_ASSOC);
		
		
	} else {
		echo 'timed out';
		die();
		
		
	}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="pagestyle.css">
	<?php createUserPanel($db, $email); ?>
	<title>Welcome<?php echo escape($email); ?></title>
</head>

<body>
		<?php
		if(!count($message_list)){
			echo 'No messages';
		} else{
			?>

	<table>
		<tr>
			<td>Subject</td>
			<td>From</td>
			<td>Date</td>
		</tr>
		<?php
			foreach($message_list as $m){
				?>
			<tr>
				<td><a href="message.php?mid=<?php echo escape($m['mid']); ?>"> <?php echo escape($m['subject']); ?></td>
				<td><?php echo escape($m['from_user']); ?></td>
				<td><?php echo escape($m['sent']); ?></td>
			</tr>
			<?php				
			}
		}
			?>
	</table>

	<form action="message_create.php?new=1" method="POST">
		<input type="submit" value="Create new message"/>
	</form>

</body>
</html>