<table class="vis" width="100%">
	<tr><th width="90">Gönderen</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.from_user}">{$report.from_username}</a></th></tr>
	<tr><td>Çıkış köyü</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.from_village}">{$report.from_villagename} ({$report.from_x}|{$report.from_y})</a></td></tr>
	<tr><th>Alıcı</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.to_user}">{$report.to_username}</a></th></tr>
	<tr><td>Hedef köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.to_village}">{$report.to_villagename} ({$report.to_x}|{$report.to_y})</a></td></tr>
</table>
<h4>Gönderilen kaynaklar</h4>
{if $report.wood>0}<img src="{$config.cdn}/graphic/holz.png" title="Odun" alt="" /> {$report.wood} {/if}{if $report.stone>0}<img src="{$config.cdn}/graphic/lehm.png" title="Kil" alt="" /> {$report.stone} {/if}{if $report.iron>0}<img src="{$config.cdn}/graphic/eisen.png" title="Demir" alt="" /> {$report.iron} {/if}
