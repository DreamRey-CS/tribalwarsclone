<?php
// Yerel bot yöneticisi. Botları eksiksiz köy/birlik kayıtlarıyla oluşturur,
// geliştirir ve arada gerçek hareket sistemi üzerinden saldırıya gönderir.
define('PATH', str_replace(PATH_SEPARATOR, '/', dirname(dirname(__FILE__))));
require_once(PATH.'/include/config.php');
require_once(PATH.'/lib/DB_MySQL.php');

if (empty($config['bots_enabled'])) exit;

$db = new DB_MySQL();
$db->connect($config['db_host'], $config['db_user'], $config['db_pw'], $config['db_name'], 'MySql');
$db->query("SET sql_mode=''");

$bot_count = isset($config['bot_count']) ? max(3, (int)$config['bot_count']) : 24;
$bot_names = array('Kartal','Sancak','Anadolu','Bozkurt','Akıncı','Alp','Oğuz','Selçuklu','Göktürk','Kayı','Yıldırım','Şahin','Poyraz','Fırtına','Zafer','Tuna','Altay','Toros','Mete','Atilla','Kutlu','Demir','Ayaz','Börü','Cengiz','Tuğra','Efe','Yiğit','Korkut','Barlas','Timur','Süvari');
$unit_columns = array('unit_spear','unit_sword','unit_archer','unit_axe','unit_spy','unit_light','unit_marcher','unit_heavy','unit_ram','unit_catapult','unit_knight','unit_snob');

function bot_home_row($db, $village_id) {
    $village_id = (int)$village_id;
    $row = $db->fetch($db->query("SELECT villages_from_id FROM unit_place WHERE villages_from_id=$village_id AND villages_to_id=$village_id LIMIT 1"));
    if (!$row) $db->query("INSERT INTO unit_place (villages_from_id,villages_to_id) VALUES ($village_id,$village_id)");
}

for ($i = 0; $i < $bot_count; $i++) {
    $name = 'Bot_'.$bot_names[$i % count($bot_names)].($i >= count($bot_names) ? '_'.($i + 1) : '');
    $safe = addslashes($name);
    $user_row = $db->fetch($db->query("SELECT id FROM users WHERE username='$safe' LIMIT 1"));
    if (!$user_row) {
        $db->query("INSERT INTO users (username,password,banned,villages,points,rang,last_activity,join_actions,protection) VALUES ('$safe','','N',1,500,1,".time().",'y',0)");
        $uid = (int)$db->getlastid();
        $db->query("INSERT INTO medal (userid,username) VALUES ($uid,'$safe')");
    } else {
        $uid = (int)$user_row['id'];
    }

    $village = $db->fetch($db->query("SELECT id FROM villages WHERE userid=$uid ORDER BY id LIMIT 1"));
    if (!$village) {
        // Dolu koordinatlara çarpmamak için boş bir alan bul.
        do {
            $x = rand(455, 545);
            $y = rand(455, 545);
            $occupied = $db->fetch($db->query("SELECT id FROM villages WHERE x=$x AND y=$y LIMIT 1"));
        } while ($occupied);
        $continent = floor($y / 100) * 10 + floor($x / 100);
        $now = time();
        $db->query("INSERT INTO villages (x,y,name,userid,r_wood,r_stone,r_iron,last_prod_aktu,points,continent,create_time,main,barracks,stable,garage,smith,place,market,farm,storage,wall) VALUES ($x,$y,'$safe Köyü',$uid,25000,25000,25000,$now,500,$continent,$now,15,10,5,3,10,1,8,15,12,8)");
        $village_id = (int)$db->getlastid();
    } else {
        $village_id = (int)$village['id'];
    }
    if (!$village_id) continue;

    develop_bot($db, $uid, $village_id, $unit_columns, true);
}

// Yönetimden eklenenler dahil TÜM botlar gelişir ve saldırır. Her çalışta
// yükü dağıtmak için botlar 30 dilimden biri işlenir (cron her dakika çalışır;
// her bot yaklaşık yarım saatte bir gelişir).
$bucket_count = 30;
$bucket = (int)(time() / 60) % $bucket_count;
// Eşzamanlı saldırı sayısını sınırlı tut; binlerce bot varken hareket/rapor
// tabloları ve sıralama hesapları oyunu kilitler.
$attack_cap = 40;
$attack_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM movements WHERE type='attack'"));
$allow_attacks = ((int)$attack_row['c'] < $attack_cap);
$res = $db->query("SELECT id FROM users WHERE username LIKE 'Bot\\_%' AND id % $bucket_count = $bucket");
while ($bot = $db->fetch($res)) {
    $uid = (int)$bot['id'];
    $village = $db->fetch($db->query("SELECT id FROM villages WHERE userid=$uid ORDER BY id LIMIT 1"));
    if (!$village) continue;
    develop_bot($db, $uid, (int)$village['id'], $unit_columns, $allow_attacks);
}

function develop_bot($db, $uid, $village_id, $unit_columns, $allow_attacks=true) {

    // Eski botlarda eksik kalmış olabilen madalya satırını onar.
    // (medal.userid unique değil; önce bak, yoksa ekle.)
    $has_medal = $db->fetch($db->query("SELECT id FROM medal WHERE userid=$uid LIMIT 1"));
    if (!$has_medal) {
        $db->query("INSERT INTO medal (userid,username) SELECT $uid,username FROM users WHERE id=$uid LIMIT 1");
    }
    bot_home_row($db, $village_id);
    // Hem toplam birlik sütunlarını hem de köyde bulunan gerçek birlik satırını
    // güncelle; yalnızca all_unit_* güncellenirse bot köyleri savunmasız görünür.
    $db->query("UPDATE unit_place SET unit_spear=LEAST(25000,unit_spear+80),unit_sword=LEAST(25000,unit_sword+60),unit_axe=LEAST(25000,unit_axe+70),unit_spy=LEAST(5000,unit_spy+12),unit_light=LEAST(12000,unit_light+25),unit_heavy=LEAST(8000,unit_heavy+10),unit_ram=LEAST(3000,unit_ram+5),unit_catapult=LEAST(2000,unit_catapult+3) WHERE villages_from_id=$village_id AND villages_to_id=$village_id");
    $db->query("UPDATE villages SET r_wood=LEAST(400000,r_wood+4000),r_stone=LEAST(400000,r_stone+4000),r_iron=LEAST(400000,r_iron+4000),all_unit_spear=LEAST(25000,all_unit_spear+80),all_unit_sword=LEAST(25000,all_unit_sword+60),all_unit_axe=LEAST(25000,all_unit_axe+70),all_unit_spy=LEAST(5000,all_unit_spy+12),all_unit_light=LEAST(12000,all_unit_light+25),all_unit_heavy=LEAST(8000,all_unit_heavy+10),all_unit_ram=LEAST(3000,all_unit_ram+5),all_unit_catapult=LEAST(2000,all_unit_catapult+3),points=points+20 WHERE id=$village_id");
    $db->query("UPDATE users SET points=points+20,last_activity=".time()." WHERE id=$uid");

    // Her bot için en fazla bir aktif saldırı; böylece hareket kuyruğu taşmaz.
    // Küresel saldırı üst sınırı aşılmışsa yeni saldırı başlatılmaz.
    if ($allow_attacks && rand(1, 100) <= 8) {
        $active = $db->fetch($db->query("SELECT COUNT(*) AS count FROM movements WHERE send_from_village=$village_id AND type='attack'"));
        $target = $db->fetch($db->query("SELECT v.id,v.userid FROM villages v LEFT JOIN users u ON u.id=v.userid WHERE v.userid<>$uid AND (v.userid=-1 OR u.protection=0 OR u.protection<".time().") ORDER BY RAND() LIMIT 1"));
        if ($active['count'] < 1 && $target) {
            $send = array(120,80,0,140,10,35,0,15,8,4,0,0);
            $home = $db->fetch($db->query("SELECT ".implode(',', $unit_columns)." FROM unit_place WHERE villages_from_id=$village_id AND villages_to_id=$village_id LIMIT 1"));
            $enough = true;
            foreach ($unit_columns as $n => $column) if ((int)$home[$column] < $send[$n]) $enough = false;
            if ($enough) {
                $parts = array();
                foreach ($unit_columns as $n => $column) $parts[] = "$column=$column-".$send[$n];
                $db->query("UPDATE unit_place SET ".implode(',', $parts)." WHERE villages_from_id=$village_id AND villages_to_id=$village_id");
                $start = time();
                $end = $start + rand(45, 90);
                $units = implode(';', $send);
                $target_id = (int)$target['id'];
                $target_uid = (int)$target['userid'];
                $db->query("INSERT INTO movements (from_village,to_village,from_userid,to_userid,units,type,start_time,end_time,to_hidden,building,send_from_user,send_from_village,send_to_user,send_to_village) VALUES ($village_id,$target_id,$uid,$target_uid,'$units','attack',$start,$end,0,'main',$uid,$village_id,$target_uid,$target_id)");
                $movement_id = (int)$db->getlastid();
                $db->query("INSERT INTO events (event_time,event_type,event_id,user_id,villageid) VALUES ($end,'movement',$movement_id,$uid,$village_id)");
                $db->query("UPDATE users SET attacks=attacks+1 WHERE id=$target_uid");
                $db->query("UPDATE villages SET attacks=attacks+1 WHERE id=$target_id");
            }
        }
    }
}
?>
