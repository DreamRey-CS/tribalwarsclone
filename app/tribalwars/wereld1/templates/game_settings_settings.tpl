<h3>{if $lang_code=='EN'}Settings{else}Ayarlar{/if}</h3>

<form action="game.php?village={$village.id}&amp;screen=settings&amp;mode=settings&amp;action=change_settings&amp;h={$hkey}" method="post">

<table class="vis">
<tr><th colspan="2">{if $lang_code=='EN'}Settings{else}Ayarlar{/if}</th></tr>

<tr>
<td>{if $lang_code=='EN'}Language:{else}Dil:{/if}</td>
<td><select name="game_lang">
<option value="TR" {if $lang_code!='EN'}selected="selected"{/if}>Türkçe</option>
<option value="EN" {if $lang_code=='EN'}selected="selected"{/if}>English</option>
</select></td>
</tr>

<tr>
<td>{if $lang_code=='EN'}Window width:{else}Pencere genişliği:{/if}</td>
<td><input type="text" name="screen_width" size="4" maxlength="4" value="{$user.window_width}" /> {if $lang_code=='EN'}pixels{else}piksel{/if}</td>
</tr>

<tr>
<td>{if $lang_code=='EN'}Quickbar:{else}Hızlı erişim çubuğu:{/if}</td>
<td><input type="checkbox" name="show_toolbar"  {if $user.show_toolbar==1}checked{/if}/>{if $lang_code=='EN'}Show quickbar{else}Hızlı erişim çubuğunu göster{/if}</td>
</tr>

<tr>
<td>{if $lang_code=='EN'}Menu bar:{else}Menü çubuğu:{/if}</td>
<td><input type="checkbox" name="dyn_menu"  {if $user.dyn_menu==1}checked{/if}/>{if $lang_code=='EN'}Show dynamic menu{else}Dinamik menüyü göster{/if}</td>
</tr>
<tr>
<td>{if $lang_code=='EN'}Map size:{else}Harita boyutu:{/if}</td>
<td><select name="map_size">
<option label="7x7" value="7" {if $user.map_size==7}selected="selected"{/if}>7x7</option>
<option label="9x9" value="9" {if $user.map_size==9}selected="selected"{/if}>9x9</option>
<option label="11x11" value="11" {if $user.map_size==11}selected="selected"{/if}>11x11</option>
<option label="13x13" value="13" {if $user.map_size==13}selected="selected"{/if}>13x13</option>
{if $user.premium_active==1}
<option label="15x15" value="15" {if $user.map_size==15}selected="selected"{/if}>15x15 (Premium)</option>
<option label="20x20" value="20" {if $user.map_size==20}selected="selected"{/if}>20x20 (Premium)</option>
<option label="25x25" value="25" {if $user.map_size==25}selected="selected"{/if}>25x25 (Premium)</option>
<option label="30x30" value="30" {if $user.map_size==30}selected="selected"{/if}>30x30 (Premium)</option>
{/if}

</select></td>
</tr>

<tr>
<td>{if $lang_code=='EN'}Order confirmation:{else}Emir onayı:{/if}</td>
<td><input type="checkbox" name="confirm_queue" {if $user.confirm_queue==1}checked{/if} />{if $lang_code=='EN'}Confirmation prompt before orders are placed{else}Yeni emirlerden önce güvenlik sorusu sor{/if}</td>
</tr>


<tr><td colspan="2"><input type="submit" value="OK" /></td></tr>
</table><br />
</form>
