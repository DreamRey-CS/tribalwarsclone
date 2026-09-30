<table>
	<tr>
		<td>
			<img src="{$config.cdn}/graphic/big_buildings/storage1.png" title="Depo" alt="" />
		</td>
		<td>
			<h2>Depo ({$village.storage|stage})</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table>
	<tr>
		<td width="220">
			Mevcut depo kapasitesi:
		</td>
		<td>
			<b>{$store_datas.storage_size}</b> Kaynak birimi
		</td>
	</tr>
	
	{if ($store_datas.storage_size_next)==false}

	{else}

		<tr>
			<td>
				Sonraki seviyede depo kapasitesi ({$village.storage+1|stage})
			</td>
			<td>
				<b>{$store_datas.storage_size_next}</b> Kaynak birimi
			</td>
		</tr>

    {/if}

</table>
<br />

<table class="vis">
	<tr>
		<th width="150">
			Dolma zamanı
		</th>
		<th>
			Süre (ss:dd:ss)
		</th>
	</tr>
	{if $wood_sec!=0}
		<tr>
			<td width="250">
				<img src="{$config.cdn}/graphic/holz.png" title="Wood" alt="" />
				{$wood_sec_date|format_date}
			</td>
			<td>
				<span class="timer">{$wood_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="{$config.cdn}/graphic/holz.png" title="Wood" alt="" />
				Depo dolu. Daha fazla kaynak saklanamaz.
			</td>
		</tr>
	{/if}
	{if $stone_sec!=0}
		<tr>
			<td width="250">
				<img src="{$config.cdn}/graphic/lehm.png" title="Clay" alt="" />
				{$stone_sec_date|format_date}
			</td>
			<td>
				<span class="timer">{$stone_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="{$config.cdn}/graphic/lehm.png" title="Clay" alt="" />
				Depo dolu. Daha fazla kaynak saklanamaz.
			</td>
		</tr>
	{/if}
	{if $iron_sec!=0}
		<tr>
			<td width="250">
				<img src="{$config.cdn}/graphic/eisen.png" title="Iron" alt="" />
				{$iron_sec_date|format_date}
			</td>
			<td>
				<span class="timer">{$iron_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="{$config.cdn}/graphic/eisen.png" title="Iron" alt="" />
				Depo dolu. Daha fazla kaynak saklanamaz.
			</td>
		</tr>
	{/if}
</table>
