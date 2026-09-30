<h2>Başlangıç Binaları</h2>
<p>Yeni köylerin başlangıç bina seviyelerini buradan belirleyebilirsiniz.</p>
{if !empty($error)}<div class="error">{$error}</div>{/if}
<form method="post" action="index.php?screen=start_buildings&amp;action=edit">
	<table class="vis"><tr><th>Bina</th><th>Seviye</th></tr>{foreach from=$buildings item=arr key=dbname}<tr><td><img src="../../global_cdn/graphic/buildings/{$dbname}.png" alt="" /> {$arr.name}</td><td><input type="number" min="0" size="4" name="{$dbname}" value="{$arr.stage}" /></td></tr>{/foreach}<tr><td colspan="2"><input name="standard" type="submit" value="Varsayılanlara Dön" /> <input type="submit" value="Kaydet" /></td></tr></table>
</form>
