<h2>Tribe</h2>
{if !empty($error)}
	<div class="error">{$error}</div>
{/if}
<p>You can join a tribe, or create your own tribe.</p>
<form action="game.php?village={$village.id}&amp;screen=ally&amp;action=create&amp;h={$hkey}" method="post">
	<table class="vis" width="400">
		<tr><th colspan="2">Create tribe</th></tr>
		<tr><td>İsim:</td><td align="center"><input type="text" name="name" /></td></tr>
		<tr><td>Abbreviation:<br />(máximo 6 caracteres)</td><td align="center"><input type="text" name="tag" maxlength="6" /></td></tr>
		<tr><th colspan="2"><div align="right"><input type="submit" value="FUNDAR TRIBO" class="button" /></div></th></tr>
	</table><br />
</form>
<table class="vis" width="400">
	<tr><th colspan="3">Davet ets</th></tr>
	{foreach from=$invites item=arr key=id}
	<tr>
		<td><a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id={$arr.from_ally}">{$arr.tag}</a></td>
		<td align="center"><a href="game.php?village={$village.id}&amp;screen=ally&amp;action=accept&amp;id={$id}&amp;h={$hkey}">Accept</a></td>
		<td align="center"><a href="game.php?village={$village.id}&amp;screen=ally&amp;action=reject&amp;id={$id}&amp;h={$hkey}">Reject</a></td>
	</tr>
	{/foreach}
</table>