<table class="vis" width="100%">
	<tr><th width="90">Gönderen</th><th>{if !empty($report.from_username)}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.from_user}">{$report.from_username}</a>{else}Bilinmiyor{/if}</th></tr>
	<tr><td>Çıkış köyü</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.from_village}">{$report.from_villagename} ({$report.from_x}|{$report.from_y})</a></td></tr>
	<tr><th>Alıcı</th><th>{if !empty($report.to_username)}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.to_user}">{$report.to_username}</a>{else}Barbarlar{/if}</th></tr>
	<tr><td>Hedef köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.to_village}">{$report.to_villagename} ({$report.to_x}|{$report.to_y})</a></td></tr>
</table>
<h4>Destek birlikleri</h4>
<table class="vis"><tr>{foreach from=$cl_units->get_array("dbname") item=dbname key=name}<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="{$name}" /></th>{/foreach}</tr><tr>{foreach from=$support_units item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr></table>
