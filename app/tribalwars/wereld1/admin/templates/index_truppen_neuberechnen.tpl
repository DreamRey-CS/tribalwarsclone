{if isset($done)}
  {if $done == true}
    <div class="notice success">Birlikler başarıyla yeniden hesaplandı!</div>
    <p style="text-align: center;">Birlikleri hesapladıktan sonra çiftlikleri de yeniden hesaplamalısınız. <a href="?screen=bh_neuberechnen&amp;start">Buradan</a> yapabilirsiniz; tıkladıktan sonra birkaç saniye bekleyin!<br />
    </p>
  {/if}
{/if}
<h2 style="text-align: center;">Birlikleri Yeniden Hesapla</h2>
<p>Köylerde eksik görünen birlikler varsa buradan düzeltebilirsiniz.</p>
<a class="small-button" href="?screen=truppen_neuberechnen&amp;start">&raquo; Birlikleri Hesapla</a>
