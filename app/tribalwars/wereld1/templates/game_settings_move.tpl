<h3>Start again</h3>
<p> If you really find out that you have no chance to succeed in your region, there is the opportunity to start a new village. Your old village is then left by the residents and you have the opportunity to found a new village in another location.


</p>
<p>
After a fresh start you have to wait 14 days to start again. A new beginning is only possible if you have exactly one village.
</p>
<form method="post" action="game.php?village={$village.id}&screen=settings&mode=move&action=move&hkey={$hkey}">
Enter password to confirm: <input type="password" name="password">
                                  <input type="submit" value="OK">
</form>
{if $get == 'move'}
  {if $pwError != ''}
  <font class="error">{$pwError}</font>
  {/if}
{/if}