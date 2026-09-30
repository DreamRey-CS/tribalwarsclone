<table width="100%" class="vis">
	<tr><th width="140">Rapor başlığı</th><th>{$report.title}</th></tr>
	<tr><td>Tarih</td><td>{$report.date}</td></tr>
	<tr><td colspan="2" valign="top" style="padding:10px;">{assign var='reporttype' value=$report.type}{include file="game_report_view_$reporttype.tpl"}</td></tr>
	<tr><th colspan="2" style="text-align:center"><a href="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;action=del_one&amp;id={$report.id}&amp;h={$hkey}">Raporu Sil</a></th></tr>
</table>
