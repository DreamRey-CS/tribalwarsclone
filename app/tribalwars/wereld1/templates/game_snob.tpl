<table>
	<tr>
    	<td>
			<img src="{$config.cdn}/graphic/big_buildings/snob1.png" title="Akademi" alt="" />
		</td>   
		<td>
			<h2>{$buildname} ({$village.$dbname|stage})</h2>
			{$description}
		</td>
	</tr>
</table><br />
{if $show_build}
	{if count($recruit_units)>0}
	    <table class="vis">
			<tr>
				<th width="150">Akademi</th>
				<th width="120">Süre</th>
				<th width="150">Tamamlanma</th>
				<th width="100">İptal *</th>
			</tr>

			{foreach from=$recruit_units key=key item=value}
			    <tr {if $recruit_units.$key.lit}class="lit"{/if}>
					<td>{$recruit_units.$key.num_unit} {$cl_units->get_name($recruit_units.$key.unit)}</td>
	                {if $recruit_units.$key.lit && $recruit_units.$key.countdown>-1}
						<td><span class="timer">{$recruit_units.$key.countdown|format_time}</span></td>
					{else}
					   	<td>{$recruit_units.$key.countdown|format_time}</td>
					{/if}
					<td>{$recruit_units.$key.time_finished|format_date}</td>
					<td><a href="game.php?t=129107&amp;village={$village.id}&amp;screen={$dbname}&amp;action=cancel&amp;id={$key}&amp;h={$hkey}">İptal</a></td>
			    </tr>
			{/foreach}

		</table>
		<div style="font-size: 7pt;">* (Malzemelerin %90'ı iade edilir)</div>
		<br>
	{/if}

	{if !empty($error)}
		<div class="error">{$error}</div>
	{/if}
	<form action="game.php?village={$village.id}&amp;screen={$dbname}&amp;action=train&amp;h={$hkey}" method="post" onsubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th width="150">Birlik</th>
				<th colspan="4" width="120">Gereksinim</th>
				<th width="130">Süre (ss:dd:sn)</th>
				<th>Köyde / toplam</th>
				<th>Üret</th>
			</tr>

			{foreach from=$units key=unit_dbname item=name}
				<tr>
					<td><a href="javascript:popup('popup_unit.php?unit={$unit_dbname}', 520, 520)"> <img src="{$config.cdn}/graphic/unit/{$unit_dbname}.png" alt="" /> {$name}</a></td>
					<td><img src="{$config.cdn}/graphic/holz.png" title="Odun" alt="" /> {$cl_units->get_woodprice($unit_dbname)}</td>
					<td><img src="{$config.cdn}/graphic/lehm.png" title="Kil" alt="" /> {$cl_units->get_stoneprice($unit_dbname)}</td>
					<td><img src="{$config.cdn}/graphic/eisen.png" title="Demir" alt="" /> {$cl_units->get_ironprice($unit_dbname)}</td>
					<td><img src="{$config.cdn}/graphic/face.png" title="Nüfus" alt="" /> {$cl_units->get_bhprice($unit_dbname)}</td>
					<td>{$cl_units->get_time($village.$dbname,$unit_dbname)|format_time}</td>
					<td>{$units_in_village.$unit_dbname}/{$units_all.$unit_dbname}</td>

					{$cl_units->check_needed($unit_dbname,$village)}
					{if $god_recruit}
						<td><a href="game.php?h={$hkey}&amp;action=train_snob&amp;screen=snob&amp;village={$village.id}">Misyoner üret</a></td>
					{elseif $amountSnobsCanBeRecruited <= 0 && $ag_style == 2}
						<td class="inactive">Yeterli altın parası yok</td>
					{elseif $cl_units->last_error==not_tec}
					    <td class="inactive">Birlik henüz araştırılmadı</td>
					{elseif $cl_units->last_error==not_needed}
					    <td class="inactive">Bina gereksinimleri karşılanmadı</td>
					{elseif $cl_units->last_error==build_ah}
					    <td class="inactive">Daha fazla misyoner üretilemez.</td>
					{elseif $cl_units->last_error==not_enough_ress}
					    <td class="inactive">Yeterli kaynak yok</td>
					{elseif $cl_units->last_error==not_enough_bh}
					    <td class="inactive">Ek birlikler için yeterli nüfus yok</td>
					{else}
						<td><a href="game.php?h={$hkey}&amp;action=train_snob&amp;screen=snob&amp;village={$village.id}">Misyoner üret</a></td>
					{/if}
				</tr>
			{/foreach}


		</table>
		<br />
		{if $ag_style==0}
			<h4>Bu köyde üretilebilecek misyoner sayısı</h4>
			<table class="vis">
			<tr><td>Akademi seviyesi:</td><td>{$village.snob}</td></tr>
			<tr><td>- Yönetilen köyler:</td><td>{$village.control_villages}</td></tr>
			<tr><td>- Köydeki mevcut misyonerler:</td><td>{$village.recruited_snobs}</td></tr>
			<tr><th>Üretilebilir:</th><th>{$village.snob-$village.control_villages-$village.recruited_snobs}</th></tr>
			</table>
		{elseif $ag_style==1}
			<h4>Üretilebilecek misyoner sayısı</h4>
			<table class="vis">
			<tr><td>Akademi seviyesi:</td><td>{$village.snob_info.stage_snobs}</td></tr>
			<tr><td>- Mevcut misyoner:</td><td>{$village.snob_info.all_snobs}</td></tr>
			<tr><td>- Üretimdeki misyoner:</td><td>{$village.snob_info.ags_in_prod}</td></tr>
			<tr><td>- Fethedilen köy sayısı:</td><td>{$village.snob_info.control_villages}</td></tr>
			<tr><th>Üretilebilir:</th><th>{$village.snob_info.can_prod}</th></tr>
			</table>
		{elseif $ag_style==2}
			<h4>Üretilebilecek misyoner sayısı</h4>
			<table class="vis">
				<tr><td>Misyoner limiti:</td><td>{$snobLimit}</td></tr>
				<tr><td>- Mevcut misyoner:</td><td>{$snobsNow}</td></tr>
				<tr><td>- Üretimdeki misyoner:</td><td>{$inRecruit}</td></tr>
				<tr><td>- Fethedilen köy sayısı:</td><td>{if $enobled != 0}{$enobled}{else}0{/if}</td></tr>
				<tr><th>Üretilebilir:</th><th>{$amountSnobsCanBeRecruited}</th></tr>
			</table><br />
			<table>
				<tr>
					<td><img alt="Altın Parası" src="{$config.cdn}/graphic/gold_big.png" /></td>
					<td>
						<h4>Altın Parası</h4>
						<p>Daha fazla misyoner üretmek için altın parası gerekir. Altın parası arttıkça fethedebileceğiniz köy sayısı da artar.</p>
					</td>
				</tr>
			</table>
			<table class="vis">
				<tr><td>Toplam altın parası:</td><td>{$coinsAll}</td></tr>
				<tr><td>Sonraki misyoner için gereken altın parası:</td><td>{$coinsNext}</td></tr>
				<tr><td>Misyoner limiti:</td><td>{$snobLimit}</td></tr>
			</table>
			<table class="vis">
				<tr><th>Gereksinimler</th><th>İşlem</th></tr>
				<tr>
					<td>
						<img alt="" title="Odun" src="{$config.cdn}/graphic/holz.png"/> {$coinPrice.wood}
						<img alt="" title="Kil" src="{$config.cdn}/graphic/lehm.png"/> {$coinPrice.stone}
						<img alt="" title="Demir" src="{$config.cdn}/graphic/eisen.png"/> {$coinPrice.iron}
					</td>
					<td class="inactive">
					{if $makeCoin}
						<a href="game.php?village={$village.id}&screen=snob&action=coin&h={$hkey}">&raquo; Altın parası üret</a>
					{else}
						<span>Mevcut kaynaklar: <span class="timer_replace">{$coinError}</span></span>
						<span style="display:none">Kaynaklar mevcut.</span>
					{/if}
					</td>
				</tr>
			</table>
		{/if}
		{if $ag_style != 2 && count($snobed_villages) > 0}
		<table class="vis" width="300">
			<tr><th>Bu köyün yönettiği köyler</th></tr>
			{foreach from=$snobed_villages key=id item=villagename}
			<tr><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$id}">{$villagename}</a></td></tr>
			{/foreach}
		</table>
	{/if}
{/if}
