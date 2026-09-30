<?php
if($ACTIONS_MASSIVKEY_HIGHAAASSDD != 'sdjahsdkJHSAJDKHALKJHSADJHSADNsjdhaksjdlhJNASDKL'){
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'change_settings'){
	$c = new do_action($user['id']);
	$c->close();
	
	if(@$session['hkey'] != $_GET['h']){
		$error = "Hata: Güvenlik kodu geçersiz!";
	}

	$window_width = max(600, min(2000, (int)$_POST['screen_width']));
	$show_toolbar = isset($_POST['show_toolbar']) ? 1 : 0;
	$dyn_menu = isset($_POST['dyn_menu']) ? 1 : 0;
	$valid_sizes = array(7, 9, 11, 13);
	if($user['premium_active'] == '1'){
		$valid_sizes = array(7, 9, 11, 13, 15, 20, 25, 30);
	}
	$map_size = in_array((int)$_POST['map_size'], $valid_sizes) ? (int)$_POST['map_size'] : 9;
	$confirm_queue = isset($_POST['confirm_queue']) ? 1 : 0;
	if(isset($_POST['game_lang']) && ($_POST['game_lang'] == 'EN' || $_POST['game_lang'] == 'TR')){
		setcookie('tw_lang', $_POST['game_lang'], time()+365*24*3600, '/');
		$_COOKIE['tw_lang'] = $_POST['game_lang'];
	}
	if(empty($error)){
		$db->query("UPDATE `users` SET `dyn_menu`='".$dyn_menu."',`window_width`='".$window_width."',`show_toolbar`='".$show_toolbar."',`map_size`='".$map_size."',`confirm_queue`='".$confirm_queue."' WHERE `id`='".$user['id']."'");
		header("LOCATION: game.php?village=".$village['id']."&screen=settings&mode=settings");
		$c->open();
		exit;
	}
	$c->open();
}
?>