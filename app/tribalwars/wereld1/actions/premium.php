<?php
if($ACTIONS_MASSIVKEY_HIGHAAASSDD != 'sdjahsdkJHSAJDKHALKJHSADJHSADNsjdhaksjdlhJNASDKL'){
	exit;
}

$is_premium = ($user['premium_active'] == '1');
$tpl->assign('is_premium', $is_premium);

$expiry = '-';
if($is_premium){
	$prow = $db->fetch($db->query("SELECT `activated_until` FROM `".$config['global_db']."`.`premium_feature` WHERE `userid`='".$user['id']."' ORDER BY `activated_until` DESC LIMIT 1"));
	if($prow) $expiry = date('d.m.Y H:i', $prow['activated_until']);
}
$tpl->assign('premium_expiry', $expiry);

if(!$is_premium){
	$error = 'Bu sayfa premium hesaplara özeldir. Premium için yöneticiyle iletişime geçin.';
}

if($is_premium && isset($_GET['action']) && $_GET['action'] == 'save'){
	if(@$session['hkey'] != $_GET['h']){
		$error = 'Hata: Güvenlik kodu geçersiz!';
	}else{
		$targets = array();
		foreach($cl_units->get_array('dbname') as $dbname){
			$n = isset($_POST['target_'.$dbname]) ? max(0, (int)$_POST['target_'.$dbname]) : 0;
			if($n > 0) $targets[$dbname] = min($n, 100000);
		}
		$auto_recruit = isset($_POST['auto_recruit']) ? 1 : 0;
		$auto_farm = isset($_POST['auto_farm']) ? 1 : 0;
		$tpairs = array();
		foreach($targets as $k => $v) $tpairs[] = $k.':'.$v;
		$db->query("REPLACE INTO `premium_auto` (`userid`,`villageid`,`auto_recruit`,`targets`,`auto_farm`,`last_recruit`,`last_farm`) VALUES ('".$user['id']."','".$village['id']."','$auto_recruit','".implode(';', $tpairs)."','$auto_farm','0','0')");
		header('LOCATION: game.php?village='.$village['id'].'&screen=premium');
		exit;
	}
}

$units_list = array();
$saved_targets = array();
$auto_recruit_on = 0;
$auto_farm_on = 0;
if($is_premium){
	$home = $cl_units->read_units($village['id'], $village['id']);
	$srow = $db->fetch($db->query("SELECT `auto_recruit`,`targets`,`auto_farm` FROM `premium_auto` WHERE `userid`='".$user['id']."' AND `villageid`='".$village['id']."' LIMIT 1"));
	if($srow){
		$auto_recruit_on = (int)$srow['auto_recruit'];
		$auto_farm_on = (int)$srow['auto_farm'];
		foreach(explode(';', $srow['targets']) as $pair){
			$parts = explode(':', $pair);
			if(count($parts) == 2) $saved_targets[$parts[0]] = (int)$parts[1];
		}
	}
	foreach($cl_units->get_array('dbname') as $dbname){
		$units_list[] = array(
			'dbname' => $dbname,
			'name' => $cl_units->get_name($dbname),
			'home' => isset($home[$dbname]) ? (int)$home[$dbname] : 0,
			'target' => isset($saved_targets[$dbname]) ? (int)$saved_targets[$dbname] : 0,
		);
	}
}
$tpl->assign('units_list', $units_list);
$tpl->assign('auto_recruit_on', $auto_recruit_on);
$tpl->assign('auto_farm_on', $auto_farm_on);
$tpl->assign('error', $error);
?>
