<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="icon" href="{$configy.cdn}/rabe.png" type="image/x-icon"> 
	<link rel="shortcut icon" href="{$configy.cdn}/rabe.png" type="image/x-icon">
	<title>{if $User.banned != 'Y'}Katıl{else}Hesap yasaklandı{/if} - {$config.name}</title>
	<link rel="stylesheet" type="text/css" href="{$configy.cdn}/css/game.css" />
	<script src="{$configy.cdn}/js/game.js" type="text/javascript"></script>
</head>
<body>
{if $User.banned != 'Y'}
<table class="principal" style="width:550px; min-width:550px; margin-top:15px;" align="center">
	<tr>
		<td>
			<h2 style="margin-bottom:5px;">Katıl</h2>
			<table width="100%" style="border:1px solid #804000; margin-bottom:5px;" class="vis">
				<tr><th colspan="2">&raquo; Dünya bilgileri</th></tr>
				<tr><td width="150">Başlangıç:</td><td align="center">{$world.start|format_date}</td></tr>
				<tr><td width="150">Bitiş:</td><td align="center">{$world.end|format_date}</td></tr>
				<tr><td width="150">Oyun hızı:</td><td align="center">{$config.speed}x</td></tr>
				<tr><td width="150">Birlik hızı:</td><td align="center">{$config.movement_speed}x</td></tr>
				<tr><td width="150">Nüfus kapasitesi:</td><td align="center">{$farm.30|format_number}</td></tr>
				<tr><td width="150">Depo kapasitesi:</td><td align="center">{$storage.30|format_number}</td></tr>
				<tr><td width="150">Akademi:</td><td align="center">{if $config.ag_style==0}Köy başına{elseif $config.ag_style==1}Akademilerin toplamı{elseif $config.ag_style==2}Altın paralar{/if}</td></tr>
				<tr><td width="150">Köy bonusu:</td><td align="center">etkin / devre dışı</td></tr>
				<tr><td width="150">Kabile:</td><td align="center">{if $config.create_ally}Etkin{else}Devre dışı{/if}</td></tr>
				<tr><td width="150">Kabile alımı:</td><td align="center">{if $config.leave_ally}Etkin{else}Devre dışı{/if}</td></tr>
				<tr><td width="150">Üye limiti:</td><td align="center">üye limiti</td></tr>
			</table>
			<table width="100%" style="border:1px solid #804000;" class="vis">
				<tr><th colspan="2">&raquo; Bu dünyaya katılmak istiyor musunuz?</th></tr>
				<tr>
					<td align="center"><a href="login.php?world={$world.db}&amp;action=create&amp;h={$hkey}"><div class="button green" style="width:100px">EVET</div></a></td>
					<td align="center"><a href="index.php"><div class="button" style="width:100px">HAYIR</div></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
{else}
<table class="principal" style="width:550px; min-width:550px; margin-top:15px;" align="center">
	<tr>
		<td>
			<h2 style="margin-bottom:5px;">Hesap yasaklandı</h2>
			<table width="100%" style="border:1px solid #804000; margin-bottom:5px;" class="vis">
				<tr><th colspan="2">&raquo; Yasaklama bilgileri</th></tr>
				<tr><td width="150">Başlangıç:</td><td align="center">{$User.ban_start|format_date}</td></tr>
				<tr><td width="150">Bitiş:</td><td align="center">{$User.ban_end|format_date}</td></tr>
				<tr><td width="150">Sebep:</td><td align="center">{$User.ban_por|entparse}</td></tr>
			</table>
			<table width="100%" style="border:1px solid #804000;" class="vis">
				<tr><th colspan="2">&raquo; Bu dünyaya katılmak istiyor musunuz?</th></tr>
				<tr>
					<td align="center"><a href="index.php"><div class="button red" style="width:100px">ÇIKIŞ</div></a></td>
					<td align="center"><a href="{$config.support}"><div class="button" style="width:100px">DESTEK</div></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
{/if}
<script type="text/javascript">setImageTitles();</script>
</body>
</html>
