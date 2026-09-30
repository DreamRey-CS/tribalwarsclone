<table>
	<tr>
   		<td>
			<img src="{$config.cdn}/graphic/big_buildings/hide1.png" title="Speicher" alt="" />
		</td>
		<td>
			<h2>Gizli Depo ({$village.hide|stage})</h2>
			{$description}
		</td>
	</tr>
</table>
<table class="vis" style="border:1px solid #804000; margin-left:5px;" width="500">
	<tr>
		<th width="250">Mevcut sığınak kapasitesi:</th>
		<td><b>{$hide_datas.max_hide}</b> Her kaynaktan birim</td>
	</tr>
	{if $hide_datas.max_hide_next != false}
	<tr>
		<th>Sonraki seviyede kapasite ({$village.hide+1|stage})</th>
		<td><b>{$hide_datas.max_hide_next}</b> Her kaynaktan birim</td>
	</tr>
	{/if}
	<tr>
		<th>Lootable Resources:</th>
		<td align="center">
			<img src="{$config.cdn}/graphic/icons/wood.png" title="Odun" alt="" />{$village.r_wood-$hide_datas.max_hide} |
			<img src="{$config.cdn}/graphic/icons/stone.png" title="Kil" alt="" />{$village.r_stone-$hide_datas.max_hide} |
			<img src="{$config.cdn}/graphic/icons/iron.png" title="Demir" alt="" />{$village.r_iron-$hide_datas.max_hide}
		</td>
	</tr>
	<tr><th colspan="2"><div align="center">Pazar offers may be looted.</div></th></tr>
</table>
