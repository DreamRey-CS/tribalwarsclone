<?php
require_once("./include.inc.php");

$result = $db->query("SELECT * FROM `login`");
$row_login = $db->fetch($result);
if(isset($_POST["action"]) && $_POST['action'] == 'login'){
	if($row_login['login_locked'] == "yes") {
		exit('{"message":"Oyuna giriş geçici olarak kapalı.","type":"error"}');
    }
	$login = new login();
	$playerid = $login->login_js($_POST['username'], $_POST['password']);
	if(is_numeric($playerid)){
		exit('{"message":"Giriş başarılı. Oyun yükleniyor!","type":"sucess"}');
	}
	exit($playerid);
}
if(isset($_POST["action"]) && $_POST["action"] == "logout"){
	$sid = new sid();
	$session = $sid->check_sid($_COOKIE['session']);
	$sid->logout($session['userid']);
	setcookie("session", "", time()-1);
	exit('{"message":"Başarıyla çıkış yaptınız.","type":"sucess"}');
}
if(isset($_POST["action"]) && $_POST["action"] == "register"){
	$check = $db->query("SELECT * FROM `users` WHERE `email` = '".$p_mail."'");
	$cgeck = $db->numrows($check);
	if($row_login['login_locked'] == "yes"){
		$error = true;
		exit('{"message":"Kayıt işlemi şu anda kapalı.","type":"error"}');
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
			exit('{"message":"Kullanıcı adı geçersiz karakterler içeriyor.","type":"error","sms":"username"}');
		}
		$check = $db->numrows($db->query("SELECT `id` FROM `users` WHERE `username`='".$p_name."'"));
		if(!$error && $check != 0){
			$error = true;
			exit('{"message":"'.$_POST['username'].' kullanıcı adı zaten kayıtlı.","type":"error","sms":"username"}');
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
		if(!$error && (empty($_POST['email']) || !checkMail($_POST['email']))){
			$error = true;
			exit('{"message":"Geçerli bir e-posta adresi girin.","type":"error","sms":"mail"}');
		}

		if(!$error && $check == 1){
			$error = true;
			exit('{"message":"Bu e-posta adresi zaten kullanılıyor.","type":"error","sms":"mail"}');
		}

	if(!$error && md5($_POST['captcha']) != $_COOKIE['security']){
                $error = true;
		exit('{"message":"Girilen güvenlik kodu yanlış.","type":"error","sms":"captcha"}');
	}
		
		if(!isset($error)){
			$db->query("INSERT INTO `users` (`username`,`password`,`email`,`join_date`) VALUES ('".$p_name."','".md5(crc32(md5(sha1(md5($p_password)))))."','".$p_mail."','".time()."')");
			exit('{"message":"Kayıt başarılı! Bilgileriniz kaydedildi.","type":"sucess"}');
		}
}

if (isset($_POST['action']) && $_POST['action'] == 'configs') {
	if ($_POST['style'] == '0'){
		$error = true;
		exit('{"message":"Bir görünüm seçin.","type":"error"}');
	}
	
	if (!$error && $_POST['lang'] == '0'){
		$error = true;
		exit('{"message":"Bir dil seçin.","type":"error"}');
	}
	
	if (!$error) {
		$find = $db->query("SELECT * FROM configs WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
		$row = $db->fetch($find);
		if ($row == '0') {
			$db->query("INSERT INTO configs (ip, style, lang) VALUES ('".$_SERVER['REMOTE_ADDR']."', '".$_POST['style']."', '".$_POST['lang']."')");
			exit('{"message":"Görünüm ve dil ayarları kaydedildi.","type":"sucess"}');
		} else {
			$db->query("UPDATE configs SET style = '".$_POST['style']."', lang = '".$_POST['lang']."' WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
			exit('{"message":"Görünüm ve dil ayarları kaydedildi.","type":"sucess"}');
		}
	}
}

if (isset($_POST['action']) && $_POST['action'] == 'team') {
	$error = true;
	exit('{"message":"Bu özellik geliştiriliyor.","type":"error"}');
	if (!$error) {
		exit('{"message":"Bu özellik geliştiriliyor.","type":"sucess"}');
	}
}
?>
