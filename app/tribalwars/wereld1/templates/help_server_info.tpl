<h3>Sunucu Bilgileri</h3>

<table class="vis">
<tr><th>Özellik</th><th>Değer</th></tr>
<tr><td>Dünya hızı</td><td>{$config.speed}</td></tr>
<tr><td>Birlik hızı</td><td>{$config.movement_speed}</td></tr>

<tr><td>Moral</td><td>{if $config.moral_activ}aktif{else}kapalı{/if}</td></tr>
<tr><td>Acemi koruması</td><td>{$config.noob_protection} dakika</td></tr>
<tr><td>Saldırı iptal süresi</td><td>{$config.cancel_movement} dakika</td></tr>
<tr><td>Tüccar iptal süresi</td><td>{$config.cancel_dealers} dakika</td></tr>

<tr><td>Misyoner sadakat düşüşü</td><td>{$config.agreement_min} - {$config.agreement_max}</td></tr>
<tr><td>Sürüm</td><td>{$config.version}</td>
</tr>
</table>
<br />
