<?php
// Yönetimden toplu bot ekleme. Büyük sayılar (örn. 1000) tek istekte
// zaman aşımına uğramasın diye 100'erli adımlarla zincirleme çalışır:
// ?screen=bots&action=add&total=1000&done=200
$bot_names = array('Kartal','Sancak','Anadolu','Bozkurt','Akıncı','Alp','Oğuz','Selçuklu','Göktürk','Kayı','Yıldırım','Şahin','Poyraz','Fırtına','Zafer','Tuna','Altay','Toros','Mete','Atilla','Kutlu','Demir','Ayaz','Börü','Cengiz','Tuğra','Efe','Yiğit','Korkut','Barlas','Timur','Süvari');
$batch = 100;

$count_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM users WHERE username LIKE 'Bot\\_%'"));
$bot_total = (int)$count_row['c'];
$vil_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM villages WHERE userid=-1"));
$tpl->assign('bot_total', $bot_total);
$tpl->assign('barb_total', (int)$vil_row['c']);

if (isset($_GET['action']) && $_GET['action'] == 'prune') {
	@set_time_limit(0);
	$keep = max(0, min(5000, (int)$_GET['keep']));
	// En eski $keep bot korunur, yeni eklenenler silinir.
	$ids = array();
	$res = $db->query("SELECT id FROM users WHERE username LIKE 'Bot\\_%' ORDER BY id ASC LIMIT 100000 OFFSET $keep");
	while ($row = $db->fetch($res)) $ids[] = (int)$row['id'];
	$deleted = 0;
	foreach (array_chunk($ids, 200) as $chunk) {
		$list = implode(',', $chunk);
		$db->query("DELETE e FROM events e JOIN movements m ON m.id=e.event_id AND e.event_type='movement' WHERE m.from_userid IN ($list) OR m.to_userid IN ($list)");
		$db->query("DELETE FROM movements WHERE from_userid IN ($list) OR to_userid IN ($list) OR send_from_user IN ($list) OR send_to_user IN ($list)");
		$db->query("DELETE r FROM reports r JOIN villages v ON (v.id=r.from_village OR v.id=r.to_village) WHERE v.userid IN ($list)");
		$db->query("DELETE p FROM unit_place p JOIN villages v ON (v.id=p.villages_from_id OR v.id=p.villages_to_id) WHERE v.userid IN ($list)");
		$db->query("DELETE FROM medal WHERE userid IN ($list)");
		$db->query("DELETE FROM sessions WHERE userid IN ($list)");
		$db->query("DELETE FROM villages WHERE userid IN ($list)");
		$db->query("DELETE FROM users WHERE id IN ($list)");
		$deleted += count($chunk);
	}
	reload_player_rangs(true);
	$count_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM users WHERE username LIKE 'Bot\\_%'"));
	$tpl->assign('bot_total', (int)$count_row['c']);
	$tpl->assign('notice', $deleted.' bot silindi. Kalan bot: '.(int)$count_row['c'].'.');
}

if (isset($_GET['action']) && $_GET['action'] == 'add') {
	@set_time_limit(0);
	$total = max(1, min(2000, (int)$_GET['total']));
	$done = max(0, (int)@$_GET['done']);
	$todo = min($batch, $total - $done);

	// Dolu koordinatları bir kez yükle, hafızada boş hücre seç.
	$occupied = array();
	$res = $db->query("SELECT x,y FROM villages");
	while ($row = $db->fetch($res)) $occupied[$row['x'].'_'.$row['y']] = true;
	$free = array();
	for ($x = 455; $x <= 545 && count($free) < $todo; $x++) {
		for ($y = 455; $y <= 545 && count($free) < $todo; $y++) {
			if (!isset($occupied[$x.'_'.$y])) { $free[] = array($x, $y); $occupied[$x.'_'.$y] = true; }
		}
	}
	if (count($free) < $todo) {
		$tpl->assign('err', 'Haritada yeterli boş alan yok! Eklenebilen bot sayısı sınırlı.');
		$todo = count($free);
		shuffle($free);
	} else {
		shuffle($free);
	}

	$now = time();
	$added = 0;
	// İsim çakışması olmasın diye mevcut bot sayısından numaralandır.
	$existing = $db->fetch($db->query("SELECT COUNT(*) AS c FROM users WHERE username LIKE 'Bot\\_%'"));
	$n = (int)$existing['c'];
	for ($k = 0; $k < $todo; $k++) {
		$base = $bot_names[$n % count($bot_names)];
		$name = ($n < count($bot_names)) ? 'Bot_'.$base : 'Bot_'.$base.'_'.($n + 1);
		// Nadir çakışmaya karşı güvence.
		$try = 0;
		while ($db->fetch($db->query("SELECT id FROM users WHERE username='".addslashes($name)."' LIMIT 1")) && $try < 20) {
			$try++;
			$name = 'Bot_'.$base.'_'.($n + 1).'_'.rand(10, 99);
		}
		$n++;
		$safe = addslashes($name);
		$db->query("INSERT INTO users (username,password,banned,villages,points,rang,last_activity,join_actions,protection) VALUES ('$safe','','N',1,500,99999,$now,'y',0)");
		$uid = (int)$db->getlastid();
		if (!$uid) continue;
		$db->query("INSERT INTO medal (userid,username) VALUES ($uid,'$safe')");
		list($x, $y) = $free[$k];
		$continent = floor($y / 100) * 10 + floor($x / 100);
		$vname = addslashes($name.' Köyü');
		$db->query("INSERT INTO villages (x,y,name,userid,r_wood,r_stone,r_iron,last_prod_aktu,points,continent,create_time,main,barracks,stable,garage,smith,place,market,farm,storage,wall,all_unit_spear,all_unit_sword,all_unit_axe,all_unit_spy,all_unit_light,all_unit_heavy,all_unit_ram,all_unit_catapult) VALUES ($x,$y,'$vname',$uid,25000,25000,25000,$now,500,$continent,$now,15,10,5,3,10,1,8,15,12,8,800,600,700,120,250,100,50,30)");
		$vid = (int)$db->getlastid();
		if (!$vid) continue;
		$db->query("INSERT INTO unit_place (villages_from_id,villages_to_id,unit_spear,unit_sword,unit_axe,unit_spy,unit_light,unit_heavy,unit_ram,unit_catapult) VALUES ($vid,$vid,800,600,700,120,250,100,50,30)");
		$added++;
	}
	$done += $added;
	if ($done < $total && $added > 0) {
		header('Location: index.php?screen=bots&action=add&total='.$total.'&done='.$done);
		exit;
	}
	$count_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM users WHERE username LIKE 'Bot\\_%'"));
	$tpl->assign('bot_total', (int)$count_row['c']);
	$tpl->assign('notice', $done.' bot ekleme isteği tamamlandı, '.$added.' bot bu adımda eklendi. Botlar otomatik gelişip saldıracak.');
}
?>
