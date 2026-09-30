<table>
	<tr>
		<td>
			<img src="{$config.cdn}/graphic/big_buildings/wall1.png" title="Wall" alt="" />
		</td>
		<td>
			<h2>
				Wall ({$village.wall|stage})
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table class="vis">
	<tr>
		<td width="200">
			Mevcut
		</td>
		<td width="200">
			<strong>{$wall_datas.basic_defense}</strong>
			Basic defense
		</td>
		<td width="200">
			<strong>{$wall_datas.wall_bonus}%</strong>
			Savunma bonusu
		</td>
	</tr>

	{if $wall_datas.basic_defense_next}

		<tr>
			<td>
				On ({$village.wall+1|stage})
			</td>
			<td>
				<strong>{$wall_datas.basic_defense_next}</strong>
				Basic defense
			</td>
			<td>
				<strong>{$wall_datas.wall_bonus_next}%</strong>
				Savunma Bonusu
			</td>
		</tr>

    {/if}
    
</table>
