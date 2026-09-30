<h2>Botlar</h2>
<p>Yerel bot rakipler oyuna otomatik katılır, köylerini geliştirir ve arada saldırır. Buradan toplu bot ekleyebilirsiniz (ör. 1000 yazıp ekleyin).</p>

{if !empty($notice)}<div class="notice success">{$notice}</div>{/if}
{if !empty($err)}<div class="error">{$err}</div>{/if}

<div class="stats-row">
	<div class="stat"><small>Mevcut bot</small><strong>{$bot_total}</strong></div>
	<div class="stat"><small>Barbar köyü</small><strong>{$barb_total}</strong></div>
</div>

<div class="panel">
	<h3>Toplu Bot Ekle</h3>
	<form method="get" action="index.php">
		<input type="hidden" name="screen" value="bots" />
		<input type="hidden" name="action" value="add" />
		<div class="inline-form">
			<input type="number" name="total" value="100" min="1" max="2000" />
			<input type="submit" value="Botları Ekle" />
		</div>
	</form>
	<p style="color:var(--muted)">Botlar 100'erli gruplar hâlinde eklenir; sayfa otomatik ilerler. Eklenen botlar birkaç dakika içinde gelişmeye ve saldırmaya başlar.</p>
</div>

<div class="panel">
	<h3>Bot Azalt</h3>
	<form method="get" action="index.php" onsubmit="return confirm('Seçtiğiniz sayıdan fazla botlar ve köyleri kalıcı olarak silinsin mi?');">
		<input type="hidden" name="screen" value="bots" />
		<input type="hidden" name="action" value="prune" />
		<div class="inline-form">
			<input type="number" name="keep" value="100" min="0" max="5000" />
			<input type="submit" value="Bu Sayıya İndir" />
		</div>
	</form>
	<p style="color:var(--muted)">En eski botlar korunur, sonradan eklenenler köyleri ve kayıtlarıyla silinir. Oyun kasıyorsa botu 100–200 aralığına indirin.</p>
</div>
