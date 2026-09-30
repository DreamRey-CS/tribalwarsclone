<h2>Sistem Onarımı</h2>
<p>Oyun sırasında oluşabilecek sayaç tutarsızlıklarını buradan onarabilirsiniz.</p>
{if $done=='attacks'}<div class="notice success">Saldırı sayaçları yeniden hesaplandı.</div>{elseif $done=='reload_events'}<div class="notice success">Olay kayıtları yeniden hesaplandı.</div>{else}<div class="panel"><h3>Saldırı Sayaçları</h3><p>Tüm köy ve oyuncuların gelen saldırı sayılarını hareket kayıtlarına göre yeniden hesaplar.</p><a class="small-button" href="index.php?screen=debugger&amp;action=attacks">Şimdi Yeniden Hesapla</a></div>{/if}
