<form action="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;action=del_arch&amp;h={$hkey}" method="post">
	<table class="vis" width="100%">
		{if $num_pages>1}
		<tr><td align="center" colspan="2">
			{section name=countpage start=1 loop=$num_pages+1 step=1}
				{if $site==$smarty.section.countpage.index}<strong>[{$smarty.section.countpage.index}]</strong>{else}<a href="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;site={$smarty.section.countpage.index}">[{$smarty.section.countpage.index}]</a>{/if}
			{/section}
		</td></tr>
		{/if}
		<tr><th>Rapor başlığı</th><th width="155">Tarih</th></tr>
		{if count($reports)>0}
			{foreach from=$reports key=key item=array}
			<tr>
				<td><input name="id_{$reports.$key.id}" type="checkbox" /> <a href="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;view={$reports.$key.id}">{$reports.$key.title}</a>{if $reports.$key.is_new=="1"} <strong>(yeni)</strong>{/if}</td>
				<td>{$reports.$key.date}</td>
			</tr>
			{/foreach}
			<tr><th><label><input name="all" type="checkbox" onclick="selectAll(this.form, this.checked)" /> Tümünü seç</label></th><th><input type="submit" value="Seçilenleri Sil" name="del" class="button" /></th></tr>
		{else}
			<tr><td colspan="2" align="center">Bu bölümde rapor bulunmuyor.</td></tr>
		{/if}
	</table>
</form>
