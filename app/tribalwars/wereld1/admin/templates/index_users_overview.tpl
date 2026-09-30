<div class="page-heading">
	<div><h2>Oyuncular</h2><p>Dünyadaki {$totalRecords} oyuncuyu görüntüleyin ve yönetin.</p></div>
</div>

{if !empty($notice)}<div class="notice success">{$notice}</div>{/if}
{if !empty($err)}<div class="error">{$err}</div>{/if}

<div class="table-scroll">
	<table class="vis data-table">
		<tr><th>Oyuncu</th><th>ID</th><th>Sıra</th><th>Puan</th><th>Köy</th><th>Son Etkinlik</th><th>Durum</th><th></th></tr>
		{foreach from=$userInfo item=user}
		<tr>
			<td><a class="player-link" href="index.php?screen=users&action=edit&id={$user.id}">{$user.username}</a></td>
			<td>#{$user.id}</td>
			<td>{$user.rang}</td>
			<td>{$user.points}</td>
			<td>{$user.villages}</td>
			<td>{$user.last_activity_text}</td>
			<td>{if $user.banned=='Y'}<span class="badge danger">Yasaklı</span>{else}<span class="badge success">Aktif</span>{/if}</td>
			<td><a class="small-button" href="index.php?screen=users&action=edit&id={$user.id}">Yönet</a></td>
		</tr>
		{/foreach}
	</table>
</div>

{if $totalPages > 1}
<div class="pagination">
	{foreach from=$pages item=pageNumber}
		<a class="{if $pageNumber==$currentPage}active{/if}" href="index.php?screen=users&page={$pageNumber}">{$pageNumber}</a>
	{/foreach}
</div>
{/if}
