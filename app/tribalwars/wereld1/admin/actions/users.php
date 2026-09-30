<?php
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$page = isset($_GET['page']) ? max(1, (int)$_GET['page']) : 1;
$per_page = 20;
$start_from = ($page - 1) * $per_page;
$message = '';
$error = '';

function admin_users_redirect($id = 0, $message = '') {
	$url = 'index.php?screen=users';
	if ($id > 0) $url .= '&action=edit&id='.(int)$id;
	if ($message !== '') $url .= '&notice='.urlencode($message);
	header('Location: '.$url);
	exit;
}

if (isset($_GET['notice'])) $message = entparse($_GET['notice']);

if ($id > 0 && isset($_GET['mode'])) {
	$mode = $_GET['mode'];
	if ($mode === 'change_name' && isset($_POST['username'])) {
		$new_name = trim($_POST['username']);
		if (strlen($new_name) < 3 || strlen($new_name) > 24) {
			$error = 'Kullanıcı adı 3 ile 24 karakter arasında olmalıdır.';
		} else {
			$safe_name = addslashes($new_name);
			$db->query("UPDATE users SET username='$safe_name' WHERE id=$id");
			$db->query("UPDATE sessions SET username='$safe_name' WHERE userid=$id");
			admin_users_redirect($id, 'Kullanıcı adı güncellendi.');
		}
	} elseif ($mode === 'kick') {
		$db->query("DELETE FROM sessions WHERE userid=$id");
		admin_users_redirect($id, 'Oyuncunun aktif oturumları kapatıldı.');
	} elseif ($mode === 'ban') {
		$db->query("UPDATE users SET banned='Y' WHERE id=$id");
		$db->query("DELETE FROM sessions WHERE userid=$id");
		admin_users_redirect($id, 'Oyuncu yasaklandı.');
	} elseif ($mode === 'unban') {
		$db->query("UPDATE users SET banned='N' WHERE id=$id");
		admin_users_redirect($id, 'Oyuncunun yasağı kaldırıldı.');
	} elseif ($mode === 'kick_tribe') {
		$db->query("UPDATE users SET ally=-1,ally_titel='',ally_found=0,ally_lead=0,ally_invite=0,ally_diplomacy=0,ally_mass_mail=0 WHERE id=$id");
		admin_users_redirect($id, 'Oyuncu kabilesinden çıkarıldı.');
	} elseif ($mode === 'village' && isset($_GET['village_id'])) {
		$village_id = (int)$_GET['village_id'];
		$db->query("UPDATE villages SET userid=-1 WHERE id=$village_id AND userid=$id");
		$db->query("UPDATE users SET villages=(SELECT COUNT(*) FROM villages WHERE userid=$id) WHERE id=$id");
		admin_users_redirect($id, 'Köy oyuncudan ayrıldı.');
	} elseif ($mode === 'premium_on') {
		$db->query("UPDATE users SET premium_active='1' WHERE id=$id");
		$db->query("DELETE FROM `".$config['global_db']."`.`premium_feature` WHERE userid=$id");
		$db->query("INSERT INTO `".$config['global_db']."`.`premium_feature` (userid,world,activated_on,activated_until) VALUES ($id,'wereld1','".time()."','2147483647')");
		admin_users_redirect($id, 'Oyuncuya süresiz premium verildi.');
	} elseif ($mode === 'premium_off') {
		$db->query("UPDATE users SET premium_active='0' WHERE id=$id");
		$db->query("DELETE FROM `".$config['global_db']."`.`premium_feature` WHERE userid=$id");
		admin_users_redirect($id, 'Oyuncunun premiumu kaldırıldı.');
	} elseif ($mode === 'delete' && isset($_POST['confirm_delete']) && $_POST['confirm_delete'] === 'yes') {
		$db->query("DELETE FROM sessions WHERE userid=$id");
		$db->query("UPDATE villages SET userid=-1 WHERE userid=$id");
		$db->query("DELETE FROM users WHERE id=$id");
		admin_users_redirect(0, 'Oyuncu silindi; köyleri barbar köyüne dönüştürüldü.');
	}
}

$count_row = $db->fetch($db->query("SELECT COUNT(id) AS total FROM users"));
$total_records = (int)$count_row['total'];
$total_pages = max(1, (int)ceil($total_records / $per_page));
$users = array();
$selected_user = array();
$villages = array();
$login_rows = array();

if ($id > 0) {
	$selected_user = $db->fetch($db->query("SELECT id,username,banned,villages,points,rang,ally,last_activity,data_inregistrare,ip_inregistrare,premium_active FROM users WHERE id=$id LIMIT 1"));
	if (!$selected_user) {
		$id = 0;
		$error = 'Oyuncu bulunamadı.';
	} else {
		$selected_user['username'] = entparse(urldecode($selected_user['username']));
		$selected_user['last_activity_text'] = $selected_user['last_activity'] ? date('d.m.Y H:i', $selected_user['last_activity']) : 'Kayıt yok';
		$village_result = $db->query("SELECT id,x,y,name,points,continent FROM villages WHERE userid=$id ORDER BY points DESC");
		while ($row = $db->fetch($village_result)) {
			$row['name'] = entparse($row['name']);
			$villages[] = $row;
		}
		$login_result = $db->query("SELECT id,ip,time FROM logins WHERE userid=$id ORDER BY time DESC LIMIT 20");
		while ($row = $db->fetch($login_result)) {
			$row['time_text'] = date('d.m.Y H:i:s', $row['time']);
			$login_rows[] = $row;
		}
	}
}

if ($id === 0) {
	$query = $db->query("SELECT last_activity,data_inregistrare,banned,username,id,villages,rang,points,ally FROM users ORDER BY rang ASC,id ASC LIMIT $start_from,$per_page");
	while ($row = $db->fetch($query)) {
		$row['username'] = entparse(urldecode($row['username']));
		$row['last_activity_text'] = $row['last_activity'] ? date('d.m.Y H:i', $row['last_activity']) : 'Kayıt yok';
		$users[] = $row;
	}
}

$tpl->assign('err', $error);
$tpl->assign('notice', $message);
$tpl->assign('id', $id);
$tpl->assign('userInfo', $users);
$tpl->assign('selectedUser', $selected_user);
$tpl->assign('villages', $villages);
$tpl->assign('loginRows', $login_rows);
$tpl->assign('currentPage', $page);
$tpl->assign('totalPages', $total_pages);
$tpl->assign('totalRecords', $total_records);
$tpl->assign('pages', range(1, $total_pages));
?>
