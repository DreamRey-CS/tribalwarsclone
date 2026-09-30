<h2>Sunucu istatistikleri</h2>
<table class="vis" width="100%">
<tr>
	<tr><th>Oyuncular:</th><th>{$players}</th></tr>
	<tr><td>Toplam köy:</td><td>{$villages} ({$villagesPerPlayer} oyuncu başına)</td></tr>
	<tr><td>Oyuncu köyleri:</td><td>{$villagesplay}</td></tr>
	<tr><td>Barbar köyleri:</td><td>{$villagesaband}</td></tr>
        <tr><td>Köy bonusu:</td><td>Yakında!</td></tr>
</table>
<br><br>
<table class="vis" width="100%">
	<tr><th>Hesaplanan değerler</th><th>Bugünün saati: {$time}</th></tr>
	<tr><td>Çevrimiçi oyuncular:</td><td>{$online}</td></tr>
	<tr><td>Gönderilen mesajlar:</td><td>{$mails} ({$mailsPerPlayer} oyuncu başına)</td></tr>
	<tr><td>Forum mesajları:</td><td>{$forum}</td></tr>
	<tr><td>Birlik hareketleri:</td><td>{$mtrop}</td></tr>
	<tr><td>Ticaret hareketleri:</td><td>{$mcom}</td></tr>
	<tr><td>Kabile sayısı:</td><td>{$allys}</td></tr>
	<tr><td>Kabilelerdeki oyuncu sayısı:</td><td>{$playerallys}</td></tr>
	<tr><td>Toplam puan:</td><td>{$pointsAll|format_number} ({$pointsPerPlayer|format_number} oyuncu başına, {$pointsPerVillage|format_number} köy başına)</td></tr>
	<tr><td>Toplam kaynak:</td><td><img src="http://{$config.cdn}/graphic/icons/wood.png" title="Odun" alt="" />{$sum.wood} <img src="http://{$config.cdn}/graphic/icons/stone.png" title="Kil" alt="" />{$sum.stone} <img src="http://{$config.cdn}/graphic/icons/iron.png" title="Demir" alt="" />{$sum.iron} </td></tr>
	<tr><td>Toplam nüfus:</td><td><img src="http://{$config.cdn}/graphic/icons/farm.png" title="İşçi" alt="" /> {$sum.bh}</td></tr>
	<tr>
		<td>Toplam birlik:</td>
		<td>
			<table class="vis" width="100%">
				<tr>{foreach from=$units item=u}<th width="45"><div align="center"><img src="http://{$config.cdn}/graphic/unit/{$u}.png" alt="" /></div></th>{/foreach}</tr>
				<tr>{foreach from=$unitsAll item=unit}<td align="center">{if $unit>0}{$unit|format_number}{else}<span class="hidden">{$unit}</span>{/if}</td>{/foreach}</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>Oyuncu başına ortalama birlik:</td>
		<td>
			<table class="vis" width="100%">
				<tr>{foreach from=$units item=u}<th width="45"><div align="center"><img src="http://{$config.cdn}/graphic/unit/{$u}.png" alt="" /></div></th>{/foreach}</tr>
				<tr>{foreach from=$unitsPerPlayer item=unit}<td align="center">{if $unit>0}{$unit|ceil}{else}<span class="hidden">{$unit}</span>{/if}</td>{/foreach}</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>Koy başına ortalama birlik:</td>
		<td>
			<table class="vis" width="100%">
				<tr>{foreach from=$units item=u}<th width="45"><div align="center"><img src="http://{$config.cdn}/graphic/unit/{$u}.png" alt="" /></div></th>{/foreach}</tr>
				<tr>{foreach from=$unitsPerVillage item=unit}<td align="center">{if $unit>0}{$unit|ceil}{else}<span class="hidden">{$unit}</span>{/if}</td>{/foreach}</tr>
			</table>
		</td>
	</tr>
	<tr><td>En yeni oyuncu:</td><td>{$newplayer|entparse}</td></tr>
	<tr><td>En yeni kabile:</td><td>{$newally|entparse}</td></tr>
</tr>
</table>
