<table class="vis" width="100%">
	<tr><th width="90">Teklif sahibi</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.from_user}">{$report.from_username}</a></th></tr>
	<tr><td>Köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.from_village}">{$report.from_villagename} ({$report.from_x}|{$report.from_y})</a></td></tr>
	<tr><th>Teklifi kabul eden</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.to_user}">{$report.to_username}</a></th></tr>
	<tr><td>Köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.to_village}">{$report.to_villagename} ({$report.to_x}|{$report.to_y})</a></td></tr>
</table>
<table class="vis"><tr><td>Satılan</td><td>{$report.sell} {$report.sell_ress}</td></tr><tr><td>Alınan</td><td>{$report.buy} {$report.buy_ress}</td></tr></table>
<p>Kaynaklar otomatik olarak gönderildi.</p>
