<!doctype html>
<html lang="tr">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Yönetim Girişi - Tribe Rush</title>
	<link rel="stylesheet" type="text/css" href="admin.css" />
</head>
<body>
	<div class="admin-shell" style="display:block">
		<main class="admin-main" style="width:100%;margin:0">
			<section class="content-card" style="max-width:480px;min-height:0">
				<h2>Yönetim Girişi</h2>
				<p style="color:var(--muted)">Devam etmek için yönetim parolasını girin.</p>
				<form method="POST" action="index.php?action=login">
					<table>
						<tr><td width="90">Parola</td><td><input type="password" name="pw" value="" /></td></tr>
						<tr><td></td><td><input type="submit" value="Giriş" /></td></tr>
					</table>
				</form>
				{if $config.master_pw=='editme'}
					<div class="error">Varsayılan parola kullanılıyor. <b>include/config.php</b> dosyasından değiştirin!</div>
				{/if}
			</section>
		</main>
	</div>
</body>
</html>
