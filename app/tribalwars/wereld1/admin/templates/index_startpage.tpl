<h2>Ana Sayfa</h2>

{if !empty($error)}<div class="error">{$error}</div>{/if}

<div class="dashboard-grid">
	<div>
		<div class="panel">
			<h3>Yeni Duyuru</h3>
			<form method="POST" action="index.php?screen=startpage&action=add" onsubmit="this.submit.disabled=true;">
				<table>
					<tr><td width="110">Duyuru metni</td><td><textarea name="text" placeholder="Oyunculara gösterilecek duyuruyu yazın..."></textarea></td></tr>
					<tr><td>Bağlantı</td><td><input type="text" name="link" placeholder="https:// veya oyun içi bağlantı" /></td></tr>
					<tr>
						<td>Simge</td>
						<td class="icon-options">
							<label><input type="radio" name="graphic" value="global" checked /> <img src="../../global_cdn/graphic/minibutton/global.png" alt="Genel" /></label>
							<label><input type="radio" name="graphic" value="sds" /> <img src="../../global_cdn/graphic/minibutton/sds.png" alt="SDS" /></label>
							<label><input type="radio" name="graphic" value="usds" /> <img src="../../global_cdn/graphic/minibutton/usds.png" alt="USDS" /></label>
							<label><input type="radio" name="graphic" value="w1" /> <img src="../../global_cdn/graphic/minibutton/w1.png" alt="Dünya" /></label>
							<label><input type="radio" name="graphic" value="m1" /> <img src="../../global_cdn/graphic/minibutton/m1.png" alt="Mesaj" /></label>
						</td>
					</tr>
					<tr><td></td><td><input type="submit" name="submit" value="Duyuruyu Yayınla" /></td></tr>
				</table>
			</form>
		</div>

		<div class="panel">
			<h3>Kayıtlı Duyurular</h3>
			<table>
				{foreach from=$announcement item=item key=f_id}
					<tr>
						<td width="38"><img src="../../global_cdn/graphic/minibutton/{$announcement.$f_id.graphic}.png" alt="" /></td>
						<td>{$announcement.$f_id.text}<br /><small>{$announcement.$f_id.time}</small></td>
						<td width="55"><a href="index.php?screen=startpage&action=drop&id={$announcement.$f_id.id}">Sil</a></td>
					</tr>
				{foreachelse}
					<tr><td class="empty-state">Henüz yayınlanmış bir duyuru yok.</td></tr>
				{/foreach}
			</table>
		</div>
	</div>

	<div class="panel">
		<h3>Oyuncu Girişleri</h3>
		<p style="color:var(--muted);margin-top:0">Bakım sırasında yeni oyuncu girişlerini geçici olarak kapatabilirsiniz.</p>
		<form method="POST" action="index.php?screen=startpage&action=locked_login">
			<table>
				<tr><td><label><input type="radio" name="login_locked" value="no" {if $login.login_locked=='no'}checked{/if} /> Girişlere izin ver</label></td></tr>
				<tr><td><label><input type="radio" name="login_locked" value="yes" {if $login.login_locked=='yes'}checked{/if} /> Girişleri kapat</label></td></tr>
				<tr><td><input type="submit" value="Ayarı Kaydet" /></td></tr>
			</table>
		</form>
	</div>
</div>
