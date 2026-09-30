<table class="vis" width="100%">
	<tr><th width="110">Desteklenen oyuncu</th><th>{if $report.to_username==""}Barbarlar{else}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.to_user}">{$report.to_username}</a>{/if}</th></tr>
	<tr><td>Desteklenen köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.to_village}">{$report.to_villagename} ({$report.to_x}|{$report.to_y})</a></td></tr>
	<tr><td>Birliklerin çıkış köyü</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.from_village}">{$report.from_villagename} ({$report.from_x}|{$report.from_y})</a></td></tr>
</table>
<h4>Birlikler</h4>
<table class="vis"><tr><th>#</th>{foreach from=$cl_units->get_array("dbname") item=dbname key=name}<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="{$name}" /></th>{/foreach}</tr><tr><td>Sayı</td>{foreach from=$report_units.units_a item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr><tr><td>Kayıplar</td>{foreach from=$report_units.units_b item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr></table>
