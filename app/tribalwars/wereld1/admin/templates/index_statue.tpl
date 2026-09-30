<h2>Şövalye ve Heykel</h2>
<div class="panel">
	<h3>Sistem Durumu</h3>
	<table>
		<tr><td width="220">Heykel binası</td><td>{if $statue_ok}<span class="badge success">Kurulu ({$statue_building})</span>{else}<span class="badge danger">Eksik</span>{/if}</td></tr>
		<tr><td>Şövalye birliği</td><td>{if $knight_ok}<span class="badge success">Kurulu</span>{else}<span class="badge danger">Eksik</span>{/if}</td></tr>
		<tr><td>Köylerdeki şövalye kaydı</td><td>{$knight_count}</td></tr>
	</table>
	<p style="color:var(--muted)">Heykel ve şövalye sistemi bu dünyada kurulu ve çalışıyor. Bu araç yalnızca durum gösterir; açma/kapama işlemi yapılmaz.</p>
</div>
