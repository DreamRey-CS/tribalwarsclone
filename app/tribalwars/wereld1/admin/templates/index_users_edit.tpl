<div class="page-heading">
	<div><h2>{$selectedUser.username}</h2><p>Oyuncu #{$selectedUser.id} · Son etkinlik: {$selectedUser.last_activity_text}</p></div>
	<a class="small-button" href="index.php?screen=users">← Oyuncu listesi</a>
</div>

{if !empty($notice)}<div class="notice success">{$notice}</div>{/if}
{if !empty($err)}<div class="error">{$err}</div>{/if}

<div class="stats-row">
	<div class="stat"><small>Puan</small><strong>{$selectedUser.points}</strong></div>
	<div class="stat"><small>Sıra</small><strong>#{$selectedUser.rang}</strong></div>
	<div class="stat"><small>Köy</small><strong>{$selectedUser.villages}</strong></div>
	<div class="stat"><small>Durum</small><strong>{if $selectedUser.banned=='Y'}Yasaklı{else}Aktif{/if}</strong></div>
	<div class="stat"><small>Premium</small><strong>{if $selectedUser.premium_active=='1'}Aktif{else}Yok{/if}</strong></div>
</div>

<div class="dashboard-grid">
	<div>
		<div class="panel">
			<h3>Oyuncu İşlemleri</h3>
			<form method="post" action="index.php?screen=users&action=edit&mode=change_name&id={$selectedUser.id}">
				<div class="inline-form"><input type="text" name="username" value="{$selectedUser.username}" /><input type="submit" value="Adı Güncelle" /></div>
			</form>
			<div class="action-list">
				<a href="index.php?screen=users&action=edit&mode=kick&id={$selectedUser.id}">Aktif oturumları kapat</a>
				<a href="index.php?screen=users&action=edit&mode=kick_tribe&id={$selectedUser.id}">Kabilesinden çıkar</a>
				{if $selectedUser.premium_active=='1'}
					<a href="index.php?screen=users&action=edit&mode=premium_off&id={$selectedUser.id}">Premiumu kaldır</a>
				{else}
					<a href="index.php?screen=users&action=edit&mode=premium_on&id={$selectedUser.id}">Süresiz premium ver</a>
				{/if}
				{if $selectedUser.banned=='Y'}
					<a href="index.php?screen=users&action=edit&mode=unban&id={$selectedUser.id}">Yasağı kaldır</a>
				{else}
					<a class="danger-text" href="index.php?screen=users&action=edit&mode=ban&id={$selectedUser.id}">Oyuncuyu yasakla</a>
				{/if}
			</div>
		</div>

		<div class="panel">
			<h3>Köyler</h3>
			<div class="table-scroll"><table class="vis">
				<tr><th>Köy</th><th>Koordinat</th><th>Puan</th><th></th></tr>
				{foreach from=$villages item=village}
				<tr><td>{$village.name} <small>#{$village.id}</small></td><td>{$village.x}|{$village.y} K{$village.continent}</td><td>{$village.points}</td><td><a href="index.php?screen=users&action=edit&mode=village&id={$selectedUser.id}&village_id={$village.id}" onclick="return confirm('Bu köy oyuncudan ayrılıp barbar köyüne dönüşsün mü?');">Ayır</a></td></tr>
				{foreachelse}<tr><td colspan="4" class="empty-state">Oyuncunun köyü yok.</td></tr>{/foreach}
			</table></div>
		</div>
	</div>

	<div>
		<div class="panel">
			<h3>Hesap Bilgileri</h3>
			<p><small>Kayıt tarihi</small><br /><strong>{$selectedUser.data_inregistrare|default:'Kayıt yok'}</strong></p>
			<p><small>Kayıt IP adresi</small><br /><strong>{$selectedUser.ip_inregistrare|default:'Kayıt yok'}</strong></p>
			<p><small>Kabile ID</small><br /><strong>{$selectedUser.ally}</strong></p>
		</div>
		<div class="panel danger-panel">
			<h3>Tehlikeli İşlem</h3>
			<p>Oyuncuyu silmek geri alınamaz. Köyleri barbar köyüne dönüşür.</p>
			<form method="post" action="index.php?screen=users&action=edit&mode=delete&id={$selectedUser.id}" onsubmit="return confirm('Oyuncuyu kalıcı olarak silmek istediğinize emin misiniz?');">
				<input type="hidden" name="confirm_delete" value="yes" />
				<button class="danger-button" type="submit">Oyuncuyu Kalıcı Sil</button>
			</form>
		</div>
	</div>
</div>

<div class="panel" style="margin-top:22px">
	<h3>Son Girişler</h3>
	<div class="table-scroll"><table class="vis">
		<tr><th>ID</th><th>IP adresi</th><th>Tarih</th></tr>
		{foreach from=$loginRows item=login}<tr><td>#{$login.id}</td><td>{$login.ip}</td><td>{$login.time_text}</td></tr>{foreachelse}<tr><td colspan="3" class="empty-state">Giriş kaydı bulunamadı.</td></tr>{/foreach}
	</table></div>
</div>
