<h2>Tur Kaydet</h2>
<p>Çalışan turu buraya kaydedip daha sonra başlangıç sayfasındaki turlar listesinden geri yükleyebilirsiniz.</p>
{if !empty($error)}
	<div class="error">{$error}</div>
{/if}

{if $is_send}
	<div class="notice success">Tur başarıyla kaydedildi.</div>
{else}
	<form method="post" action="index.php?screen=save_round&amp;action=send" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<td width="140">Tur adı</td><td><input type="text" name="name" size="60" value="{$name}"></td>
			</tr>
			<tr>
				<td>Başlangıç</td><td><input type="text" name="start" size="60" value="{$start}"></td>
			</tr>
			<tr>
				<td>Bitiş</td><td><input type="text" name="end" size="60" value="{$end}"></td>
			</tr>
			<tr>
				<td>Açıklama</td><td><input type="text" name="description" size="60" value="{$description}"></td>
			</tr>
			<tr>
				<td></td><td><input type="submit" name="submit" value="Kaydet"></td>
			</tr>
		</table>
	</form>
{/if}
