Sistem işlem kayıtları. Sorun gidermede kullanılır.
{if $num_pages>1}
	<center>
		{section name=countpage start=1 loop=$num_pages+1 step=1}
			{if $site==$smarty.section.countpage.index}
				<strong> &gt;{$smarty.section.countpage.index}&lt; </strong>
			{else}
				<a href="index.php?screen=logs&amp;site={$smarty.section.countpage.index}"> [{$smarty.section.countpage.index}] </a>
			{/if}
		{/section}
	</center>
{/if}

<table class="vis" width="100%">
	<tr>
		<th>Datum</th>
		<th>Skript HASH</th>
		<th>Event ID</th>
		<th>Ereignis</th>
	</tr>
	{foreach from=$logs item=arr key=id}
		<tr>
			<td>{$arr.time}</td>
			<td>{$arr.village}</td>
			<td>{$arr.event_id}</td>
			<td>{$arr.log}</td>
		</tr>
	{/foreach}
</table>