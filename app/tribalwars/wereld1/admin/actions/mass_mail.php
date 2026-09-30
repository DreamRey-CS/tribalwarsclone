<?php
$subject = urlencode($_POST['subject']);
$message = urlencode($_POST['message']);
$from = urlencode('Paladini.Ro');
$time = time();

if($_GET['action'] == 'send'){
	if(strlen($_POST[subject]) < 4){	
		$error = "Konu en az 4 karakter olmalıdır."; 
	}
	if (strlen($_POST[message]) < 15){ 	
		$error = "Mesaj en az 15 karakter olmalıdır."; 	
	}
	if (!$error){
		$select_users = mysql_query("SELECT * FROM users");
		while($row = mysql_fetch_array($select_users)){
			$id = $row['id'];
			$username = $row['username'];
			$insert = "INSERT INTO mail (`from_userid`,`from_username`,`to_userid`,`to_username`,`title`,`message`,`time`,`from_read`) VALUES ('-1','".$from."','".$id."','".$username."','".$subject."','".$message."','".$time."','0')";
			mysql_query($insert) or die (mysql_error());
			$succes = "Mesaj başarıyla gönderildi.";
		}
		mysql_query("UPDATE users SET new_mail = '1'") or die (mysql_error());
	}
	$tpl->assign('succes', $succes);
	$tpl->assign('error', $error);
}
?>
