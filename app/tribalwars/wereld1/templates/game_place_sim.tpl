{* Simulieren *}
{if isset($simulate) && $simulate}
	<table class="vis">
		<tr>
			<td colspan="2"></td>
			{foreach from=$cl_units->get_array("dbname") item=dbname key=name}
				<th width="35"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
			{/foreach}
		</tr>
		<tr>
			<td rowspan="2">Saldıran</td>
			<td>Birlikler:</td>
			{foreach from=$simulate_values.att item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td>Losses:</td>
			{foreach from=$simulate_values.att_lose item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td style="display:none"></td>
		</tr>
		<tr>
			<td rowspan="2">Savunan</td>
			<td>Einheiten:</td>
			{foreach from=$simulate_values.def item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td>Losses:</td>
			{foreach from=$simulate_values.def_lose item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
	</table>
	<table>
	{if $simulate_values.others.def_wall!=$simulate_values.others.new_wall}
		<tr><th>Koçbaşı hasarı:</th><td>Duvar seviyesi şu seviyeden düştü: <b>{$simulate_values.others.def_wall}</b> şu seviyeye <b>{$simulate_values.others.new_wall}</b></td></tr>
	{/if}
	
	{if $simulate_values.others.def_building!=$simulate_values.others.new_building}
		<tr><th>Mancınık hasarı:</th><td>Bina seviyesi <b>{$simulate_values.others.def_building}</b> seviyesinden <b>{$simulate_values.others.new_building}</b> seviyesine düştü.</td></tr>
	{/if}
	</table>
{/if}

<form action="game.php?village={$village.id}&amp;screen=place&amp;mode=sim" method="post" name="units">
	<input name="simulate" type="hidden" />
	<table class="vis">
		<tr>
			<th></th>
			<th colspan="2">Saldıran</th>
			<th colspan="2">Savunan</th>
		</tr>
		<tr>
			<td></td>
			<td>Birlikler</td>
			<td>Teknoloji</td>
			<td>Birlikler</td>
			<td>Teknoloji</td>
		</tr>
		{foreach from=$cl_units->get_array("dbname") item=dbname key=name}
			<tr>
				<td><a href="javascript:popup('popup_unit.php?unit={$dbname}', 520, 520)"><img src="{$config.cdn}/graphic/unit/{$dbname}.png" title="" alt="" /> {$name}</a></td>
				<td><input type="text" name="att_{$dbname}" size="5" value="{$values.att.$dbname}" /></td>
				<td><input type="text" name="att_tech_{$dbname}" size="5" value="{$values.att_tech.$dbname}" /></td>
				<td><input type="text" name="def_{$dbname}" size="5" value="{$values.def.$dbname}" /></td>
				<td><input type="text" name="def_tech_{$dbname}" size="5" value="{$values.def_tech.$dbname}" /></td>
			</tr>
		{/foreach}
		<tr>
			<td>Wall</td>
			<td colspan="2"></td>
			<td colspan="2"><input type="text" name="def_wall" value="{$values.def_wall}" size="5" /></td>
		</tr>
		<tr>
			<td>Mancınık hedef bina seviyesi</td>
			<td colspan="2"></td><td colspan="2"><input type="text" name="def_building" value="{$values.def_building}" size="5" /></td>
		</tr>
		{if $moral_activ}
			<tr>
				<td>Moral</td>
				<td colspan="4"><input type="text" name="moral" value="{$values.moral}" size="5" id="moral" />%</td>
			</tr>
		{/if}
		<tr>
			<td>Şans (-%25 ile +%25)</td>
			<td colspan="4"><input type="text" name="luck" value="{$values.luck}" size="5" />%</td>
		</tr>
	</table>
	<input type="submit" value="Hesapla" />
</form>
