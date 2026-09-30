<table>
	<tr>
		<td>
			<img src="{$config.cdn}/graphic/big_buildings/stone1.png" title="Kil Ocağı" alt="" />
		</td>
		<td>
			<h2>
				Kil Ocağı ({$village.stone|stage})
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
	<table class="vis">
		<tr>
			<td width="200">
				<img src="{$config.cdn}/graphic/lehm.png" title="Kil" alt="" />
				Mevcut üretim
			</td>
			<td>
				<b>{$stone_datas.stone_production} </b>
				Dakikada birim
			</td>
		</tr>

		{if ($stone_datas.stone_production_next)==false}

		{else}

			<tr>
				<td>
					<img src="{$config.cdn}/graphic/lehm.png" title="Kil" alt="" />
				Sonraki seviyede üretim ({$village.stone+1|stage})
			</td>
			<td>
				<b>{$stone_datas.stone_production_next}</b>
				Dakikada birim
			</td>
		</tr>
    {/if}

</table>
