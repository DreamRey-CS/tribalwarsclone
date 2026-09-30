<h3>Vacation Replacement</h3>
<p> Tatildeyken hesabınızı yönetmesi için bir oyuncuyu vekil atayabilirsiniz. Vek?leti istediçiniz zaman sonlandırabilirsiniz. </ P>
<p> Until 24 hours after the end of the vacation replacement no playful actions between vacation account and account of the vacation replacement can take place. In particular, these are: </ p>
<ul>
<li>Resources</li>
<li>Looting</li>

<li> Coordinated attacks by both accounts </ li>
<li> Send Destek Forces </ li>
</ul>
{if empty($user.vacation_name)}
	<form action="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer&amp;h={$hkey}" method="post">
		<table class="vis">
		<tr>
			<th>Representative</th>
			<td><input name="sitter" type="text" /> <input type="submit" value="OK" /></td>
	
		</tr>
	    </table>
	</form>
{else}
	{if $sid->is_vacation()}
		<p>
		<a href="javascript:ask('Do you really want to end vacation replacement? You will no longer have access to this account immediately', 'game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=end_vacation&amp;h={$hkey}')">Urlaubsvertretung beenden</a>
		</p>
	{else}
		<table class="vis">
		<tr>
			<td>Request to:</td>
			<td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$user.vacation_id}">{$user.vacation_name}</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer_cancel&amp;h={$hkey}">&raquo; İsteği geri çek</a></td>
		</tr>
		</table>
	{/if}
{/if}

{if count($vacation_accept)>0 && !$sid->is_vacation()}
	<h3>Own vacation replacements</h3>
	<p>Vek?let ettiçiniz oyuncular:</p>
	<table class="vis">
	<tr><th width="200">Oyuncu</th></tr>
	{foreach from=$vacation_accept item=arr key=id}
		<tr><td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$id}">{$arr.username}</a></td>
		<td><a href="login_uv.php?id={$id}" target="_blank">&raquo; einloggen</a></td>	</tr>
	{/foreach}
	</table>
{/if}

{if count($vacation)>0 && !$sid->is_vacation()}
	<h3>Requests</h3>
	<p>Sizden tatil vekâleti isteyen oyuncular:</p>
	<table class="vis">
	<tr><th>Spieler</th><th colspan="2">Aktion</th></tr>
	{foreach from=$vacation item=arr key=id}
		<tr>
		<td width="200"><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$id}">{$arr.username}</a></td>
		<td width="100"><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_accept&amp;player_id={$id}&amp;h={$hkey}">annehmen</a></td>
		<td width="100"><a href="javascript:ask('Urlaubsvertretungs wirklich ablehnen?', 'game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_reject&amp;player_id={$id}&amp;h={$hkey}')">ablehnen</a></td>
		</tr>
	{/foreach}
{/if}
