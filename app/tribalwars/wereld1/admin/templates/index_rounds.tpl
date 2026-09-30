<h2>Turları Sil</h2>
<p>Önceden kaydedilmiş turları buradan silebilirsiniz.</p>
<table class="vis">
<tr><th>#</th><th>Tur adı</th><th>Başlangıç</th><th>Bitiş</th></tr>
{foreach from=$data item=data}
<tr><td>{$data.name}</td></tr>
{/foreach}
</table>
