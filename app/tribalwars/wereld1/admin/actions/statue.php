<?php
// Heykel/Şövalye sistemi durum sayfası.
// (Eski eAccelerator ile kodlanmış sürüm yeni PHP'de çalışmadığı için
//  bu araç durum göstergesi olarak yeniden yazıldı.)
$statue_building = $cl_builds->get_name('statue');
$statue_ok = ($statue_building != '');
$knight_ok = false;
foreach ($cl_units->get_array('dbname') as $dbname) {
	if ($dbname == 'unit_knight') { $knight_ok = true; break; }
}
$knight_row = $db->fetch($db->query("SELECT COUNT(*) AS c FROM unit_place WHERE unit_knight>0"));
$tpl->assign('statue_building', $statue_building ? entparse($statue_building) : 'Tanımsız');
$tpl->assign('statue_ok', $statue_ok);
$tpl->assign('knight_ok', $knight_ok);
$tpl->assign('knight_count', (int)$knight_row['c']);
?>
