{if $is_premium}
<h2>{if $lang_code=='EN'}Premium{else}Premium{/if}</h2>
<p>{if $lang_code=='EN'}Premium active until: <strong>{$premium_expiry}</strong>{else}Premium bitiş tarihi: <strong>{$premium_expiry}</strong>{/if}</p>

<div class="panel">
	<h3>{if $lang_code=='EN'}Your advantages{else}Avantajların{/if}</h3>
	<ul>
		<li>{if $lang_code=='EN'}Research everything with one click (Smithy){else}Tek tıkla tüm araştırmalar (Demirci){/if}</li>
		<li>{if $lang_code=='EN'}Halve construction time (Village Headquarters){else}İnşaat süresini yarıya indirme (Köy Karargâhı){/if}</li>
		<li>{if $lang_code=='EN'}Large map up to 30x30 (Settings){else}30x30'a kadar büyük harita (Ayarlar){/if}</li>
		<li>{if $lang_code=='EN'}Automatic troop recruitment and farm assistant (below){else}Otomatik asker üretimi ve çiftlik asistanı (aşağıda){/if}</li>
	</ul>
</div>

<form action="game.php?village={$village.id}&amp;screen=premium&amp;action=save&amp;h={$hkey}" method="post">
<div class="panel">
	<h3>{if $lang_code=='EN'}Account manager: automatic recruitment{else}Hesap yöneticisi: otomatik üretim{/if}</h3>
	<p><label><input type="checkbox" name="auto_recruit" {if $auto_recruit_on}checked{/if} /> {if $lang_code=='EN'}Automatically top up troops to the targets below (costs resources){else}Birlikleri aşağıdaki hedeflere otomatik tamamla (kaynak harcar){/if}</label></p>
	<table class="vis">
		<tr><th>{if $lang_code=='EN'}Troop{else}Birlik{/if}</th><th>{if $lang_code=='EN'}In village{else}Köyde{/if}</th><th>{if $lang_code=='EN'}Target{else}Hedef{/if}</th></tr>
		{foreach from=$units_list item=u}
		<tr><td>{$u.name}</td><td>{$u.home}</td><td><input type="number" name="target_{$u.dbname}" value="{$u.target}" min="0" max="100000" style="width:90px" /></td></tr>
		{/foreach}
	</table>
</div>

<div class="panel">
	<h3>{if $lang_code=='EN'}Farm assistant{else}Çiftlik asistanı{/if}</h3>
	<p><label><input type="checkbox" name="auto_farm" {if $auto_farm_on}checked{/if} /> {if $lang_code=='EN'}Automatically send loot raids to the nearest barbarian village{else}En yakın barbar köye otomatik yağma saldırıları gönder{/if}</label></p>
	<p><input type="submit" value="{if $lang_code=='EN'}Save{else}Kaydet{/if}" class="button" /></p>
</div>
</form>
{else}
<h2>Premium</h2>
{if !empty($error)}<div class="error">{$error}</div>{/if}
<p>Premium; tek tıkla araştırma, inşaat hızlandırma, büyük harita, otomatik asker üretimi ve çiftlik asistanı içerir.</p>
{/if}
