<!doctype html>
<html lang="tr">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Yönetim - Tribe Rush</title>
	<link rel="stylesheet" type="text/css" href="admin.css" />
</head>
<body>
	<div class="admin-shell">
		<aside class="sidebar">
			<a class="brand" href="index.php">
				<span class="brand-mark">TR</span>
				<span><strong>Tribe Rush</strong><small>Yönetim Merkezi</small></span>
			</a>

			<nav class="admin-nav">
				<p class="nav-title">DÜNYA YÖNETİMİ</p>
				<a class="{if $screen=='startpage'}active{/if}" href="index.php?screen=startpage"><span>⌂</span>Ana Sayfa</a>
				<a class="{if $screen=='refugee_camp'}active{/if}" href="index.php?screen=refugee_camp"><span>♜</span>Barbar Köyleri</a>
				<a class="{if $screen=='add_villages'}active{/if}" href="index.php?screen=add_villages"><span>◆</span>Bonus Köyleri</a>
				<a class="{if $screen=='mail'}active{/if}" href="index.php?screen=mail"><span>✉</span>Toplu Mesaj</a>
				<a class="{if $screen=='start_buildings'}active{/if}" href="index.php?screen=start_buildings"><span>▦</span>Başlangıç Binaları</a>
				<a class="{if $screen=='logs'}active{/if}" href="index.php?screen=logs"><span>☷</span>Sistem Kayıtları</a>

				{if count($extern_menue)!=0}
					<p class="nav-title">YÖNETİM ARAÇLARI</p>
					{foreach from=$extern_menue item=link key=name}
						<a class="{if $screen==$link}active{/if}" href="index.php?screen={$link}"><span>›</span>{$name}</a>
					{/foreach}
				{/if}

				<p class="nav-title">SİSTEM</p>
				<a class="danger-link {if $screen=='reset'}active{/if}" href="index.php?screen=reset"><span>↻</span>Dünyayı Sıfırla</a>
				<a href="../game.php"><span>◀</span>Oyuna Dön</a>
				<a href="index.php?action=logout"><span>⇥</span>Çıkış</a>
			</nav>
		</aside>

		<main class="admin-main">
			<header class="topbar">
				<div>
					<p class="eyebrow">YEREL DÜNYA KONTROLÜ</p>
					<h1>Yönetim Paneli</h1>
				</div>
				<div class="server-status"><i></i><span>Sunucu çalışıyor<small id="serverTime">{$servertime}</small></span></div>
			</header>

			<section class="content-card">
				{if in_array($screen,$allow_screens)}
					{include file="index_$screen.tpl" title=foo}
				{/if}
			</section>

			<footer>{$load_msec} ms içinde oluşturuldu · Tribe Rush Yerel Yönetim</footer>
		</main>
	</div>
</body>
</html>
