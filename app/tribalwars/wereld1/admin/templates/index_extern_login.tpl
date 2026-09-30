<h2>Harici Giriş</h2>
<p>Harici giriş, oyuncuların diğer oyuncular tarafından rahatsız edilmeden giriş yapıp hazırlık yapabilmesini sağlar.</p>
{if empty($hash)}
	<a class="small-button" href="index.php?screen=extern_login&amp;action=open">Harici girişi aç</a>
{else}
	<p>Şu adresten erişilebilir: <a href="../extern_login.php?hash={$hash}" target="_blank">harici giriş bağlantısı</a></p>
	<a class="small-button danger-text" href="index.php?screen=extern_login&amp;action=close">Harici girişi kapat</a>
{/if}
