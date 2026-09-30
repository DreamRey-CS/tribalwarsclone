<h2>Sistem Kayıtlarını Temizle</h2>
<p>Sunucudaki işlem kayıtlarını kalıcı olarak temizler.</p>
{php}
$uri = $_SERVER['REQUEST_URI'];
if(isset($_GET['delete']) && $_GET['delete']=='logs') {
	mysql_query("TRUNCATE TABLE logs");
	echo '<div class="notice success">Tüm sistem kayıtları temizlendi.</div>';
} else {
	echo "<form method='post' action='".$uri."&delete=logs' onsubmit=\"return confirm('Tüm sistem kayıtları silinsin mi?');\"><input type='submit' value='Kayıtları Temizle'></form>";
}
{/php}
