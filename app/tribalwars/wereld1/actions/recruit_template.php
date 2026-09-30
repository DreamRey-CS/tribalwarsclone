<?php
if($ACTIONS_MASSIVKEY_HIGHAAASSDD != "sdjahsdkJHSAJDKHALKJHSADJHSADNsjdhaksjdlhJNASDKL"){
	exit;
}

$show_build = ($cl_builds->check_needed($buildname,$village) && $village[$buildname]>0)?true:false;
	if($show_build){
	$god_recruit = !empty($config['local_mode']) && !empty($config['god_mode']);
    $units = $cl_units->get_recruit_in_units($buildname);
    $unit_columns = array_keys($units);
	$sql = "SELECT ".implode(",", $unit_columns)." FROM `unit_place` WHERE `villages_from_id`='".$village['id']."' AND `villages_to_id`='".$village['id']."'";
    $result = $db->query($sql);
    $units_in_village = $db->fetch($result);
    $village_columns = array();
    foreach($units as $key=>$value){
        $village_columns[] = "all_".$key;
        if(!in_array("no_investigate", $cl_units->get_specials($key)))
            $village_columns[] = $key."_tec_level";
    }
	$sql = "SELECT ".implode(",", $village_columns)." FROM `villages` WHERE `id`='".$village['id']."'";
    $result = $db->query($sql);
	$units_all = $db->Fetch($result);

	$village = $village+$units_all;
    foreach($units as $key=>$value){
        $units_all[$key] = $units_all["all_".$key];
    }
    $error = "";
    if(isset($_GET['action']) && $_GET['action'] == "train"){
        $c = new do_action($user['id']);
        $c->close();
        if($session['hkey'] != $_GET['h']){
            $error = "Hata, ancak o código de segurança está invalido!";
        }
        $check = "";
        $reload = false;
        foreach($units as $key=>$value){
			if(!empty($_POST[$key])){
				$cl_units->check_needed($key,$village);

				$input = (int)$_POST[$key];

				$wood = $cl_units->get_woodprice($key)*$input;
				$stone = $cl_units->get_stoneprice($key)*$input;
				$iron = $cl_units->get_ironprice($key)*$input;
				$bh = $cl_units->get_bhprice($key)*$input;
				if($god_recruit){
					$wood = 0; $stone = 0; $iron = 0; $bh = 0;
					$cl_units->last_error = 999999;
				}

	            if(!$god_recruit && ($wood > $village['r_wood'] || $stone > $village['r_stone'] || $iron > $village['r_iron'])){
				    $check = "to_many_units";
				}
				if(!$god_recruit && ($arr_farm[$village['farm']]-$village['r_bh']-$bh) < 0 && empty($check)){
	                $check = "to_many_bh";
    	        }
				if(empty($check) && is_numeric($cl_units->last_error) && $input > 0){
					$db->query("UPDATE `villages` SET `r_wood`=`r_wood`-'".$wood."',`r_stone`=`r_stone`-'".$stone."',`r_iron`=`r_iron`-'".$iron."',`r_bh`=`r_bh`+'".$bh."' WHERE `id`='".$village['id']."'");
					$village['r_wood'] -= $wood;
					$village['r_stone'] -= $stone;
					$village['r_iron'] -= $iron;
					$village['r_bh'] += $bh;
					if($god_recruit){
						$db->query("UPDATE `unit_place` SET `".$key."`=`".$key."`+'".$input."' WHERE `villages_from_id`='".$village['id']."' AND `villages_to_id`='".$village['id']."'");
						$db->query("UPDATE `villages` SET `all_".$key."`=`all_".$key."`+'".$input."' WHERE `id`='".$village['id']."'");
					}else{
						$cl_units->recruit_units($key,$input,$buildname,$village[$buildname],$village['id']);
					}
					$reload = true;
				}
			}
        }
        $c->open();
        if($reload){
            header("LOCATION: game.php?village=".$village['id']."&screen=".$_GET['screen']."");
			exit;
        }
        if(empty($check)){
            $check = $cl_units->last_error;
        }
        switch($check){
            case "not_tec" :	$error = "Bu birlik henüz araştırılmadı.";	break;
            case "not_needed" :	$error = "Gerekli bina veya teknoloji tamamlanmadı.";	break;
            case "not_enough_ress" :	$error = "Yeterli kaynak yok.";	break;
            case "not_enough_bh" :	$error = "Çiftlik kapasitesi yetersiz.";	break;
            case "to_many_units" :	$error = "Yeterli kaynak yok.";	break;
            case "to_many_bh" :	$error = "Çiftlik kapasitesi yetersiz.";	break;
		}
	}
    if(isset($_GET['action']) && $_GET['action'] == "cancel" && isset($_GET['id'])){
        if($session['hkey'] != $_GET['h']){
            $error = "Hata, ancak o código de segurança está invalido!";
        }
		$g_id = parse($_GET['id']);
        $result = $db->query("SELECT `unit`,`villageid`,`num_finished`,`num_unit` FROM `recruit` WHERE `id`='".$g_id."'" );
		$row = $db->fetch($result);
        if($row['villageid'] != $village['id']){
            $error = "Hata, ancak houve um erro ao executar a ação!";
        }
		if (!in_array($row['unit'], array_flip($units))){
            $error = "Hata, ancak o rerutamento não pode ser cancelado!";
        }
		if(empty($error)){
			while(true){
				$result = $db->query("SELECT COUNT(`id`) AS `count` FROM `events` WHERE `event_type`='recruit' AND `event_id`='".$g_id."'");
				$row = $db->fetch($result);
				if($row['count'] != 1){
					$error = "Hata, ancak o recrutamento já foi concluido!";
					break;
				}
				$result = $db->query("UPDATE `events` SET `cid`='1' WHERE `event_type`='recruit' AND `event_id`='".$g_id."' AND `cid`='0'");
				if($db->affectedrows()==1){
					$result = $db->query("SELECT `unit`,`villageid`,`num_finished`,`num_unit` FROM `recruit` WHERE `id`='".$g_id."'");
					$row = $db->fetch($result);
					break;
				}
			}
			if(empty($error)){
				$db->query("DELETE FROM `events` WHERE `event_type`='recruit' AND `event_id`='".$g_id."'");
				$db->query("DELETE FROM `recruit` WHERE `id`='".$g_id."'");
				$wood = round(($cl_units->get_woodprice($row['unit'])*($row['num_unit']-$row['num_finished']))*0.90);
				$stone = round(($cl_units->get_stoneprice($row['unit'])*($row['num_unit']-$row['num_finished']))*0.90);
				$iron = round(($cl_units->get_ironprice($row['unit'])*($row['num_unit']-$row['num_finished']))*0.90);
				$bh = $cl_units->get_bhprice($row['unit'])*($row['num_unit']-$row['num_finished']);

				$old_time = time();
				$result = $db->query("SELECT `id`,`time_start`,`time_finished`,`building` FROM `recruit` WHERE `villageid`='".$village['id']."' AND `building`='".$buildname."'");
				while($row = $db->fetch($result)){
					if($row['time_start'] < time()){
						$old_time=$row['time_finished'];
		    		}else{
		    			$start_time = $old_time;
		    			$old_time = $old_time+($row['time_finished']-$row['time_start']);
		    			$db->query("UPDATE `recruit` SET `time_finished`='".$old_time."',`time_start`='".$start_time."' WHERE `id`='".$row['id']."'");
		   				$db->query("UPDATE `events` SET `event_time`='".$start_time."' WHERE `event_id`='".$row['id']."' AND `event_type`='recruit'");
		   			}
				}
				$db->query("UPDATE `villages` SET `r_wood`=`r_wood`+'".$wood."',`r_stone`=`r_stone`+'".$stone."',`r_iron`=`r_iron`+'".$iron."',`r_bh`=`r_bh`-'".$bh."' WHERE `id`='".$village['id']."'");
				header("LOCATION: game.php?village=".$village['id']."&screen=".$_GET['screen']."");
				exit;
			}
		}
	}

    $recruit_units = array();
    $i = 0;
    $result = $db->query("SELECT `id`,`unit`,`num_unit`,`num_finished`,`time_finished`,`time_start` FROM `recruit` WHERE `villageid`='".$village['id']."' AND `building`='".$buildname."' ORDER BY `time_start`");
 	while($row = $db->fetch($result)){
		$i++;
	    if($i == 1){
	        $recruit_units[$row['id']]['lit'] = true;
		}else{
		    $recruit_units[$row['id']]['lit'] = false;
		}

		$recruit_units[$row['id']]['unit'] = $row['unit'];
		$recruit_units[$row['id']]['num_unit'] = $row['num_unit']-$row['num_finished'];
		$recruit_units[$row['id']]['unit'] = $row['unit'];
		$recruit_units[$row['id']]['time_finished'] = $row['time_finished'];
	    if($i == 1){
			$recruit_units[$row['id']]['countdown'] = $row['time_finished']-time();
		}else{
		    $recruit_units[$row['id']]['countdown'] = $row['time_finished']-$row['time_start'];
		}
	}
	$tpl->assign("units", $units);
	$tpl->assign("error", $error);
	$tpl->assign("units_in_village", $units_in_village);
	$tpl->assign("units_all", $units_all);
	$tpl->assign("recruit_units", $recruit_units);
}
$tpl->assign("description", $cl_builds->get_description_bydbname($buildname));
$tpl->assign("cl_units", $cl_units);
$tpl->assign("buildname", $cl_builds->get_name($buildname));
$tpl->assign("dbname", $buildname);
$tpl->assign("show_build", $show_build);
$tpl->assign("config", $config);
?>
