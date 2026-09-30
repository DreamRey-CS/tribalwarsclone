<?php

$find = $db->query("SELECT * FROM configs WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
$find = $db->fetch($find);

switch ($find['lang']) {
	case 'TR':
		$lang = 'TR';
		break;
	case 'PT':
		$lang = 'PT';  // todo: fix this
		break;
	case 'EN':
		$lang = 'EN';
		break;
	default:
		$lang = 'TR';
		break;
}





?>
