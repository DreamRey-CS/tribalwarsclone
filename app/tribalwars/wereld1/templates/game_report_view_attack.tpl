{if $report.wins=='att'}<h3 style="margin-bottom:8px;">Saldıran taraf kazandı!</h3>{else}<h3 style="margin-bottom:8px;">Savunan taraf kazandı!</h3>{/if}
{if $report_agreement.to <= 0}<div class="error" style="margin:8px 0;">Köy fethedildi! Sadakat sıfırlandı.</div>{/if}

<table class="vis" width="100%">
	<tr><th>Şans</th><td>{$report.luck}% (saldıran açısından)</td>{if $moral_activ=='true'}<th>Moral</th><td>{$report.moral}%</td>{/if}</tr>
</table>

<table class="vis" width="100%">
	<tr><th width="110">Saldıran</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.from_user}">{$report.from_username|entparse}</a></th></tr>
	<tr><td>Çıkış köyü</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.from_village}">{$report.from_villagename} ({$report.from_x}|{$report.from_y}) K{$report.from_continent}</a></td></tr>
	<tr><td colspan="2">
		<table class="vis" width="100%">
			<tr><th>#</th>{foreach from=$cl_units->get_array("dbname") item=dbname key=name}<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="{$name}" /></th>{/foreach}</tr>
			<tr><td>Birlikler</td>{foreach from=$report_units.units_a item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr>
			<tr><td>Kayıplar</td>{foreach from=$report_units.units_b item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr>
		</table>
	</td></tr>
</table>

<table class="vis" width="100%">
	<tr><th width="110">Savunan</th><th><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.to_user}">{if empty($report.to_username)}Barbarlar{else}{$report.to_username|entparse}{/if}</a></th></tr>
	<tr><td>Hedef köy</td><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$report.to_village}">{$report.to_villagename} ({$report.to_x}|{$report.to_y}) K{$report.to_continent}</a></td></tr>
	<tr><td colspan="2">
	{if $see_def_units}
		<table class="vis" width="100%">
			<tr><th>#</th>{foreach from=$cl_units->get_array("dbname") item=dbname key=name}<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="{$name}" /></th>{/foreach}</tr>
			<tr><td>Birlikler</td>{foreach from=$report_units.units_c item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr>
			<tr><td>Kayıplar</td>{foreach from=$report_units.units_d item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr>
		</table>
	{else}
		<p>Düşman birlikleri hakkında bilgi getiren asker olmadı.</p>
	{/if}
	</td></tr>
</table>

{if count($report_units.units_e)>1}
<h4>Hareket hâlindeki birlikler</h4>
<table class="vis" width="100%">
	<tr>{foreach from=$cl_units->get_array("dbname") item=dbname key=name}<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="{$name}" /></th>{/foreach}</tr>
	<tr>{foreach from=$report_units.units_e item=num_units}{if $num_units>0}<td>{$num_units}</td>{else}<td class="hidden">0</td>{/if}{/foreach}</tr>
</table>
{/if}

<table class="vis" width="100%">
	{if $report_ress.wood > 0 || $report_ress.stone > 0 || $report_ress.iron > 0}
	<tr><th width="110">Ganimet</th><td>{if $report_ress.wood > 0}<img src="{$config.cdn}/graphic/icons/wood.png" title="Odun" /> {$report_ress.wood} {/if}{if $report_ress.stone > 0}<img src="{$config.cdn}/graphic/icons/stone.png" title="Kil" /> {$report_ress.stone} {/if}{if $report_ress.iron > 0}<img src="{$config.cdn}/graphic/icons/iron.png" title="Demir" /> {$report_ress.iron} {/if}</td><td>{$report_ress.sum|format_number}/{$report_ress.max|format_number}</td></tr>
	{/if}
	{if $report_ram.from != $report_ram.to}<tr><th>Koçbaşları</th><td colspan="2">Sur seviyesi <b>{$report_ram.from}</b> seviyesinden <b>{$report_ram.to}</b> seviyesine düşürüldü.</td></tr>{/if}
	{if $report_agreement.from != $report_agreement.to}<tr><th>Sadakat</th><td colspan="2">Sadakat <b>{$report_agreement.from}%</b> değerinden <b>{$report_agreement.to}%</b> değerine düştü.</td></tr>{else}<tr><th>Sadakat</th><td colspan="2">Sadakat değişmedi (<b>{$report_agreement.from}%</b>). Misyoner hayatta kalmadıysa sadakat düşmez. Köy almak için saldırıyı kazanacak yeterli orduyla birlikte misyoner gönderin.</td></tr>{/if}
	{if $report_catapult.from != $report_catapult.to}<tr><th>Mancınıklar</th><td colspan="2">{$cl_builds->get_name($report_catapult.building)} seviyesi <b>{$report_catapult.from}</b> seviyesinden <b>{$report_catapult.to}</b> seviyesine düşürüldü.</td></tr>{/if}
</table>
