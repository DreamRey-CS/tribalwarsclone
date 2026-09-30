<h3>Logins</h3>
<p> Bu sayfada başarılı ve başarısız girişleri g?rebilirsiniz. Yetkisiz erişim fark ederseniz Şifrenizi hemen de?i?tirin. </ P>
<h4>Last 20 Logins</h4>
<table class="vis">
<tr><th>Date</th><th>IP</th><th>Urlaubsvertreter</th></tr>
{foreach from=$logins item=arr key=id}
	<tr><td>{$arr.time}</td><td>{$arr.ip}</td><td>{$arr.uv}</td></tr>
{/foreach}
</table>