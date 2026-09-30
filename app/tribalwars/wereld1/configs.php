<?php

$find = $db->fetch($db->query("SELECT * FROM `".$config['global_db']."`.`configs` WHERE `ip` = '".$_SERVER['REMOTE_ADDR']."'"));

switch ($find['lang']) {
	case 'TR':
		$lang = 'TR';
		break;
	case 'PT':
		$lang = 'PT'; 
		break;
	case 'EN':
		$lang = 'EN';
		break;
	default:
		$lang = 'TR';
		break;
}

switch ($find['style']) {
	case 'default':
		$style = ''; 
		break;
	case 'old':
		$style = '.EW';
		break;
	case 'new':
		$style = '.IW';
		break;
	default:
		$style = '';
		break;
}




?>
