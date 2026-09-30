<h3>Birlikler</h3>

<table class="vis" width="100%">
<tr align="right"><th align="left">Birlik</th><th><img src="graphic/holz.png" title="Odun" alt="" /></th><th><img src="graphic/lehm.png" title="Kil" alt="" /></th><th><img src="graphic/eisen.png" title="Demir" alt="" /></th><th><img src="graphic/face.png" title="Nüfus" alt="" /></th>
<th><img src="graphic/unit/att.png" alt="Saldırı gücü" /></th>
<th><img src="graphic/unit/def.png" alt="Genel savunma" /></th>
<th><img src="graphic/unit/def_cav.png" alt="Süvari savunması" /></th>
<th><img src="graphic/unit/def_archer.png" alt="Okçu savunması" /></th>
<th><img src="graphic/unit/speed.png" alt="Hız" /></th>
<th><img src="graphic/unit/booty.png" alt="Ganimet" /></th>
</tr>

{foreach from=$cl_units->get_array('dbname') item=dbname key=name}
	<tr>
		<td align="left"><a href="javascript:popup('popup_unit.php?unit={$dbname}', 550, 520)"><img src="graphic/unit/{$dbname}.png" alt="" /> {$name}</a></td>
		<td>{$cl_units->get_woodprice($dbname)}</td><td>{$cl_units->get_stoneprice($dbname)}</td><td>{$cl_units->get_ironprice($dbname)}</td>
		<td>{$cl_units->get_bhprice($dbname)}</td>
		<td>{$cl_units->get_att($dbname,1)}</td><td>{$cl_units->get_def($dbname,1)}</td><td>{$cl_units->get_defcav($dbname,1)}</td><td>{$cl_units->get_defarcher($dbname,1)}</td>

		<td>{$cl_units->get_speed($dbname,'minutes')}</td>
		<td>{$cl_units->get_booty($dbname)}</td>
	</tr>
{/foreach}
</table><br />
