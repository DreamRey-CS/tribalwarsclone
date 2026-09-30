<?php
if($ACTIONS_MASSIVKEY_HIGHAAASSDD != "sdjahsdkJHSAJDKHALKJHSADJHSADNsjdhaksjdlhJNASDKL"){
	exit;
}

if(!isset($_GET['mode'])) $_GET['mode'] = "profile";

$game_lang = (isset($_COOKIE['tw_lang']) && $_COOKIE['tw_lang'] == 'TR') ? 'TR' : 'EN';
if($game_lang == 'EN'){
	$links = array(
		"Profile" => "profile",
		"My account" => "settings",
		"Holiday replacement" => "vacation",
		"Logins" => "logins",
		"Change password" => "change_passwd"
	);
}else{
	$links = array(
		"Profil" => "profile",
		"Hesabım" => "settings",
		"Tatil Vekâleti" => "vacation",
		"Giriş Kayıtları" => "logins",
		"Şifre Değiştir" => "change_passwd"
	);
}
if(in_array($_GET['mode'], $links)){
	include("settings_".$_GET['mode'].".php");
}
$tpl->assign("allow_mods", $allow_mods);
$tpl->assign("mode", $_GET['mode']);
$tpl->assign("links", $links);
$tpl->assign("error", $error);
?>