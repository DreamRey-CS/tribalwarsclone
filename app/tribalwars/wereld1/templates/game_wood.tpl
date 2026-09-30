<table>
	<tr>
		<td>
			<img src="{$config.cdn}/graphic/big_buildings/wood1.png" title="Oduncu" alt="" />
		</td>
		<td>
			<h2>
				Oduncu ({$village.wood|stage})
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table class="vis">
	<tr>
		<td width="200">
			<img src="{$config.cdn}/graphic/holz.png" title="Odun" alt="" />
			Mevcut üretim
		</td>
		<td>
			<b>{$wood_datas.wood_production}</b>
			Dakikada birim
		</td>
	</tr>


	{if ($wood_datas.wood_production_next)==false}
			
	{else}

		<tr>
			<td>
				<img src="{$config.cdn}/graphic/holz.png" title="Odun" alt="" />
				Sonraki seviyede üretim ({$village.wood+1|stage})
			</td>

			<td>
  				<b>{$wood_datas.wood_production_next}</b> Dakikada birim
        	</td>
		</tr>
    {/if}

</table>
