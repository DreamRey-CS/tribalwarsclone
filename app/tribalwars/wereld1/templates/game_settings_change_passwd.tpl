<h3>Change Password</h3>
{if $changed}
	<b>Password changed</b><br />
{/if}
<p> Şifrenizi burada değiştirebilirsiniz. Eski Şifrenizi ve yeni Şifrenizi iki kez girin. </ P>
<p> Your new password will be changed to <em> all worlds </ em> and will be valid </ em> immediately after the change <em> and will not need to be confirmed by e-mail </ p>

<form method="post" action="game.php?village={$village.id}&amp;screen=settings&amp;mode=change_passwd&amp;action=change_passwd&amp;h={$hkey}">
<table class="vis">
	<tr>
		<td><label for="old_passwd">Old Password: </label></td>
		<td><input type="password" name="old_passwd" id="old_passwd" /></td>
	</tr>
	<tr>
		<td><label for="new_passwd">New Password: </label></td>
		<td><input type="password" name="new_passwd" id="new_passwd" /></td>

	</tr>
	<tr>
		<td><label for="new_passwd_rpt">Repeat: </label></td>
		<td><input type="password" name="new_passwd_rpt" id="new_passwd_rpt" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Password Changed"/></td>

	</tr>
</table>
</form>