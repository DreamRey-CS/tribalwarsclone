<?php
// Premium otomasyon daemon'u (hesap yöneticisi lite):
// - Otomatik asker üretimi: hedef sayılara kadar kaynak karşılığı tamamlar.
// - Çiftlik asistanı: en yakın barbar köye yağma saldırısı gönderir.
define('PATH', str_replace(PATH_SEPARATOR, '/', dirname(dirname(__FILE__))));
require_once(PATH.'/include/config.php');
require_once(PATH.'/lib/DB_MySQL.php');
require_once(PATH.'/lib/units.php');
require_once(PATH.'/include/configs/units.php');
require_once(PATH.'/include/configs/farm_limits.php');

$db = new DB_MySQL();
$db->connect($config['db_host'], $config['db_user'], $config['db_pw'], $config['db_name'], 'MySql');
$db->query("SET sql_mode=''");

$now = time();
$farm_template = array('unit_spear' => 100, 'unit_sword' => 50, 'unit_axe' => 60, 'unit_light' => 30);

$res = $db->query("SELECT pa.*, u.premium_active FROM premium_auto pa JOIN users u ON u.id=pa.userid WHERE (pa.auto_recruit=1 OR pa.auto_farm=1)");
while ($row = $db->fetch($res)) {
    if ($row['premium_active'] != '1') continue;
    $uid = (int)$row['userid'];
    $vid = (int)$row['villageid'];
    $vil = $db->fetch($db->query("SELECT * FROM villages WHERE id=$vid AND userid=$uid LIMIT 1"));
    if (!$vil) continue;

    // --- Otomatik üretim (en fazla dakikada bir) ---
    if ($row['auto_recruit'] == 1 && $now - (int)$row['last_recruit'] >= 60 && !empty($row['targets'])) {
        $home = $db->fetch($db->query("SELECT * FROM unit_place WHERE villages_from_id=$vid AND villages_to_id=$vid LIMIT 1"));
        if ($home) {
            $max_bh = isset($arr_farm[$vil['farm']]) ? (int)$arr_farm[$vil['farm']] : 24000;
            $wood = (int)$vil['r_wood']; $stone = (int)$vil['r_stone']; $iron = (int)$vil['r_iron'];
            $bh = (int)$vil['r_bh'];
            $add = array(); $spent = array('wood' => 0, 'stone' => 0, 'iron' => 0, 'bh' => 0);
            foreach (explode(';', $row['targets']) as $pair) {
                $parts = explode(':', $pair);
                if (count($parts) != 2) continue;
                list($dbname, $target) = $parts;
                $deficit = max(0, (int)$target - (int)$home[$dbname]);
                if ($deficit <= 0) continue;
                // Çiftlik taşmasın.
                $room = $max_bh - $bh - $spent['bh'];
                $per_bh = (int)$cl_units->get_bhprice($dbname);
                if ($per_bh > 0) $deficit = min($deficit, (int)floor($room / $per_bh));
                // Kaynak yettiği kadar üret.
                $per_w = (int)$cl_units->get_woodprice($dbname);
                $per_s = (int)$cl_units->get_stoneprice($dbname);
                $per_i = (int)$cl_units->get_ironprice($dbname);
                while ($deficit > 0 && ($wood - $spent['wood'] < $per_w || $stone - $spent['stone'] < $per_s || $iron - $spent['iron'] < $per_i)) $deficit--;
                if ($deficit <= 0) continue;
                $add[$dbname] = $deficit;
                $spent['wood'] += $per_w * $deficit;
                $spent['stone'] += $per_s * $deficit;
                $spent['iron'] += $per_i * $deficit;
                $spent['bh'] += $per_bh * $deficit;
            }
            if (!empty($add)) {
                $sets = array();
                foreach ($add as $dbname => $num) $sets[] = "$dbname=$dbname+$num";
                $db->query("UPDATE unit_place SET ".implode(',', $sets)." WHERE villages_from_id=$vid AND villages_to_id=$vid");
                $asets = array();
                foreach ($add as $dbname => $num) $asets[] = "all_$dbname=all_$dbname+$num";
                $db->query("UPDATE villages SET ".implode(',', $asets).",r_wood=r_wood-".$spent['wood'].",r_stone=r_stone-".$spent['stone'].",r_iron=r_iron-".$spent['iron'].",r_bh=r_bh+".$spent['bh']." WHERE id=$vid");
            }
        }
        $db->query("UPDATE premium_auto SET last_recruit=$now WHERE userid=$uid AND villageid=$vid");
    }

    // --- Çiftlik asistanı (köy başına en fazla 15 dakikada bir, en fazla 3 aktif akın) ---
    if ($row['auto_farm'] == 1 && $now - (int)$row['last_farm'] >= 900) {
        $active = $db->fetch($db->query("SELECT COUNT(*) AS c FROM movements WHERE send_from_village=$vid AND type='attack'"));
        if ((int)$active['c'] < 3) {
            $barb = $db->fetch($db->query("SELECT id FROM villages WHERE userid=-1 ORDER BY ((CAST(x AS SIGNED)-".$vil['x'].")*(CAST(x AS SIGNED)-".$vil['x'].")+(CAST(y AS SIGNED)-".$vil['y'].")*(CAST(y AS SIGNED)-".$vil['y'].")) ASC LIMIT 1"));
            if ($barb) {
                $home = $db->fetch($db->query("SELECT * FROM unit_place WHERE villages_from_id=$vid AND villages_to_id=$vid LIMIT 1"));
                $enough = $home ? true : false;
                $units = array();
                foreach ($cl_units->get_array('dbname') as $dbname) {
                    $need = isset($farm_template[$dbname]) ? $farm_template[$dbname] : 0;
                    if ($home && (int)$home[$dbname] < $need) $enough = false;
                    $units[] = $need;
                }
                if ($enough) {
                    $parts = array();
                    foreach ($cl_units->get_array('dbname') as $dbname) {
                        $need = isset($farm_template[$dbname]) ? $farm_template[$dbname] : 0;
                        if ($need > 0) $parts[] = "$dbname=$dbname-$need";
                    }
                    $db->query("UPDATE unit_place SET ".implode(',', $parts)." WHERE villages_from_id=$vid AND villages_to_id=$vid");
                    $tgt = $db->fetch($db->query("SELECT x,y FROM villages WHERE id=".(int)$barb['id']." LIMIT 1"));
                    $fields = sqrt(pow($vil['x'] - $tgt['x'], 2) + pow($vil['y'] - $tgt['y'], 2));
                    $end = $now + max(60, (int)($fields * 60));
                    $ustr = implode(';', $units);
                    $tid = (int)$barb['id'];
                    $db->query("INSERT INTO movements (from_village,to_village,from_userid,to_userid,units,type,start_time,end_time,to_hidden,building,send_from_user,send_from_village,send_to_user,send_to_village) VALUES ($vid,$tid,$uid,-1,'$ustr','attack',$now,$end,0,'main',$uid,$vid,-1,$tid)");
                    $mid = (int)$db->getlastid();
                    $db->query("INSERT INTO events (event_time,event_type,event_id,user_id,villageid) VALUES ($end,'movement',$mid,$uid,$vid)");
                    $db->query("UPDATE villages SET attacks=attacks+1 WHERE id=$tid");
                }
            }
        }
        $db->query("UPDATE premium_auto SET last_farm=$now WHERE userid=$uid AND villageid=$vid");
    }
}
?>
