<?php
require_once('./include.inc.php');
$sid = new sid();
$session = $sid->check_sid(isset($_COOKIE['session']) ? $_COOKIE['session'] : '');
if (!$session || !$session['userid'] || empty($config['local_mode']) || empty($config['god_mode'])) exit('God modu yalnızca yerel sürümde kullanılabilir.');
$uid = (int)$session['userid'];
// Sadece admin_users listesindeki hesaplar kullanabilir. Diğer oyuncular
// URL'yi bilse bile işlem yapamaz.
$is_admin = false;
if (!empty($config['admin_users']) && is_array($config['admin_users'])) {
    $admin_row = $db->fetch($db->query("SELECT `username` FROM `users` WHERE `id`='$uid' LIMIT 1"));
    $check_names = array($admin_row['username'], urldecode($admin_row['username']));
    foreach ($config['admin_users'] as $admin_name) {
        if (in_array($admin_name, $check_names)) { $is_admin = true; break; }
    }
}
if (!$is_admin) exit('Bu panele erişim yetkiniz yok.');
$message = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $apply = isset($_POST['apply']) ? $_POST['apply'] : 'all';
    if ($apply == 'speed') {
        $speed = isset($_POST['speed']) ? (int)$_POST['speed'] : 1500;
        if ($speed < 100) $speed = 100;
        if ($speed > 10000) $speed = 10000;
        file_put_contents(PATH.'/local_settings.php', "<?php \$config['speed'] = ".$speed."; ?>");
        $message = 'Oyun hızı '.$speed.' olarak ayarlandı.';
    } elseif ($apply == 'instant') {
        $db->query("UPDATE recruit SET num_finished=num_unit,time_finished=".time()." WHERE villageid IN (SELECT id FROM villages WHERE userid=$uid)");
        $db->query("UPDATE events SET event_time=".time()." WHERE event_type='recruit' AND event_id IN (SELECT id FROM recruit WHERE villageid IN (SELECT id FROM villages WHERE userid=$uid))");
        $message = 'Bekleyen tüm asker eğitimleri anında tamamlandı.';
    } else {
		$db->query("UPDATE villages SET r_wood=400000,r_stone=400000,r_iron=400000,r_bh=0,wood=30,stone=30,iron=30,storage=30,farm=30,hide=30,wall=30,main=30,barracks=30,stable=30,garage=30,smith=30,market=30,snob=3,place=30,statue=1,unit_spear_tec_level=10,unit_sword_tec_level=10,unit_axe_tec_level=10,unit_archer_tec_level=10,unit_spy_tec_level=10,unit_light_tec_level=10,unit_marcher_tec_level=10,unit_heavy_tec_level=10,unit_ram_tec_level=10,unit_catapult_tec_level=10,unit_knight_tec_level=10,unit_snob_tec_level=10,all_unit_spear=999999,all_unit_sword=999999,all_unit_axe=999999,all_unit_archer=999999,all_unit_spy=999999,all_unit_light=999999,all_unit_marcher=999999,all_unit_heavy=999999,all_unit_ram=999999,all_unit_catapult=999999,all_unit_knight=1,all_unit_snob=999,recruited_snobs=999 WHERE userid=$uid");
		$db->query("UPDATE users SET points=999999,villages_mode='combined',protection=0 WHERE id=$uid");
		$db->query("INSERT INTO unit_place (villages_from_id,villages_to_id) SELECT v.id,v.id FROM villages v LEFT JOIN unit_place p ON p.villages_from_id=v.id AND p.villages_to_id=v.id WHERE v.userid=$uid AND p.villages_from_id IS NULL");
		$db->query("UPDATE unit_place p JOIN villages v ON v.id=p.villages_from_id SET p.unit_spear=999999,p.unit_sword=999999,p.unit_archer=999999,p.unit_axe=999999,p.unit_spy=999999,p.unit_light=999999,p.unit_marcher=999999,p.unit_heavy=999999,p.unit_ram=999999,p.unit_catapult=999999,p.unit_knight=1,p.unit_snob=999 WHERE v.userid=$uid AND p.villages_to_id=v.id");
        $db->query("UPDATE villages SET name=REPLACE(name,'KÃ¶y de ','Köyü ') WHERE userid=$uid");
        $message = 'God modu uygulandı: tüm askerler, teknolojiler, kaynaklar ve binalar açıldı.';
    }
}
?><!doctype html><html lang="tr"><meta charset="utf-8"><title>God Modu</title>
<style>body{font:16px Arial;background:#2b1b0e;color:#ffe8bb;padding:40px}button{padding:12px 22px;font-size:16px;background:#d99b35;border:0;border-radius:4px}a{color:#ffd27a}</style>
<h1>God Modu</h1><p>Bu panel yalnızca yerel oyun içindir.</p><?php if ($message) echo '<p><b>'.htmlspecialchars($message).'</b></p>'; ?>
<form method="post"><input type="hidden" name="apply" value="all"><button type="submit">Tüm askerleri ve teknolojileri aç / sınırsız kaynak</button></form><br>
<form method="post"><input type="hidden" name="apply" value="instant"><button type="submit">Askerleri anında tamamla</button></form><br>
<form method="post"><input type="hidden" name="apply" value="speed"><label>Oyun hızı: <select name="speed"><option value="1500">Hızlı PvP (3x)</option><option value="3000">Çok hızlı (6x)</option><option value="10000">Ultra hızlı (20x)</option></select></label> <button type="submit">Hızı uygula</button></form>
<p><a href="game.php">Oyuna dön</a></p></html>
