<?php
require_once("./include.inc.php");

$result = $db->query("SELECT * FROM `login`");
$row_login = $db->fetch($result);
if(isset($_POST["action"]) && $_POST['action'] == 'login'){
	if($row_login['login_locked'] == "yes") {
		exit('{"message":"Sorry, de toegang tot het spel is tijdelijk geblokkeerd","type":"error"}');
    }
	$login = new login();
	$playerid = $login->login_js($_POST['username'], $_POST['password']);
	if(is_numeric($playerid)){
		exit('{"message":"Succesvol ingelogd. Een ogenblik geduld, we laden het spel!","type":"sucess"}');
		
	}
	exit($playerid);
}
if(isset($_POST["action"]) && $_POST["action"] == "logout"){
	$sid = new sid();
	$session = $sid->check_sid($_COOKIE['session']);
	$sid->logout($session['userid']);
	setcookie("session", "", time()-1);
	exit('{"message":"Je bent succesvol afgemeld. Nog even geduld terwijl we je speldata nog even opslaan :)","type":"sucess"}');
}
if(isset($_POST["action"]) && $_POST["action"] == "register"){
	$check = $db->query("SELECT * FROM `users` WHERE `email` = '".$p_mail."'");
	$cgeck = $db->numrows($check);
	if($row_login['login_locked'] == "yes"){
		$error = true;
		exit('{"message":"Sorry, op het moment is de registratie gesloten","type":"error"}');
	}
		if(!$error && (isset($_POST['username']))) {
			$p_name = parse(trim($_POST['username']));
		}
		if(!$error && (isset($_POST['password']))) { 
			$p_password = $_POST['password'];
		}	
		if(!$error && (isset($_POST['email'])))  {
			$p_mail = mysql_real_escape_string($_POST['email']);
		}
		
		if(!$error && (isset($_POST['username']) && strlen($_POST['username']) < 4)){
			$error = true;
			exit('{"message":"Kullanıcı adı 4 karakterden kısa olamaz.","type":"error","sms":"username"}');
		}
		if(!$error && (!isset($_POST['username']) || !(strpos($_POST['username'],";") === false) || !(strpos($_POST['username'],"'") === false))){
			$error = true;
			exit('{"message":"Kullanıcı adı bu karakterleri içeremez.","type":"error","sms":"username"}');
		}
		$check = $db->numrows($db->query("SELECT `id` FROM `users` WHERE `username`='".$p_name."'"));
		if(!$error && $check != 0){
			$error = true;
			exit('{"message":"Bu kullanıcı adı zaten kayıtlı.","type":"error","sms":"username"}');
		}
		if(!$error && (isset($_POST['username']) && strlen($_POST['username']) > 24)){
			$error = true;
			exit('{"message":"Kullanıcı adı 24 karakterden uzun olamaz.","type":"error","sms":"username"}');
		}
		if(!$error && (isset($_POST['password']) && strlen($_POST['password']) < 6)){
			$error = true;
			exit('{"message":"Şifre 6 karakterden kısa olamaz.","type":"error","sms":"password"}');
		}
		if(!$error && (isset($_POST['password']) && strlen($_POST['password']) > 32)){
			$error = true;
			exit('{"message":"Şifre 32 karakterden uzun olamaz.","type":"error","sms":"password"}');
		}
		if(!$error && empty($_POST['email']) || !checkMail($_POST['email'])){
			$error = true;
		exit('{"message":"E-posta adresi geçersiz.","type":"error","sms":"mail"}');
		}

		if(!$error && $check == 1){
			$error = true;
			exit('{"message":"Het e-mail adres \''.$_POST['email'].'\' is al in gebruik!","type":"error","sms":"mail"}');
		}
		
		if(!isset($error)){
			$db->query("INSERT INTO `users` (`username`,`password`,`email`,`join_date`) VALUES ('".$p_name."','".md5($p_password)."','".$p_mail."','".time()."')");
			exit('{"message":"Je bent succesvol geregistreerd! Nog eventjes geduld, we slaan de gegevens op!","type":"sucess"}');
		}
}

if (isset($_POST['action']) && $_POST['action'] == 'configs') {
	if ($_POST['style'] == '0'){
		$error = true;
	exit('{"message":"Selecteer een stijl!","type":"error"}');
	}
	
	if (!$error && $_POST['lang'] == '0'){
		$error = true;
		exit('{"message":"Selecteer een taal!","type":"error"}');
	}
	
	if (!$error) {
		$find = $db->query("SELECT * FROM configs WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
		$row = $db->fetch($find);
		if ($row == '0') {
			$db->query("INSERT INTO configs (ip, style, lang) VALUES ('".$_SERVER['REMOTE_ADDR']."', '".$_POST['style']."', '".$_POST['lang']."')");
			exit('{"message":"Stijl en taal zijn succesvol gewijzigd! Een ogenblikje geduld alsjeblieft. ","type":"sucess"}');
		} else {
			$db->query("UPDATE configs SET style = '".$_POST['style']."', lang = '".$_POST['lang']."' WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
			exit('{"message":"Stijl en taal zijn succesvol gewijzigd! Een ogenblikje geduld alsjeblieft. ","type":"sucess"}');
			
		}
	}
}

if (isset($_POST['action']) && $_POST['action'] == 'team') {
	$error = true;
	exit('{"message":"In ontwikkeling","type":"error"}');
	if (!$error) {
		exit('{"message":"In ontwikkeling","type":"sucess"}');
	}
}
?>
