{if $smarty.get.action == ""}
<form action="?screen=dorf&action=mach" method="post">
 <table>
  <tr>
   <th align="left">Numar</th>
   <th align="left">Köy sayısı</th>
   <th align="left">Oyuncu ID</th>
   <th align="left">Köy adı</th>
   <th align="left">Köy yönü</th>
  </tr>
  <tr>
   <td>1</td>
   <td><input name="anzahl1"></td>
   <td>
    <select name="userid1">
     <option></option>
     {foreach from=$userInfo item=user}
      <option value="{$user.id}">{$user.id} ({$user.username})</option>
     {/foreach}
    </select>
   </td>
   <td><input name="name1"></td>
   <td>
    <select name="direction1">
     <option value="nw">Nord-vest</option>
     <option value="sw">Sud-vest</option>
     <option value="no">Nord-est</option>
     <option value="so">Sud-est</option>
     <option value="random">Intamplator</option>
    </select>
   </td>
  </tr>
  <tr>
   <td>2</td>
   <td><input name="anzahl1"></td>
   <td>
    <select name="userid1">
     <option></option>
     {foreach from=$userInfo item=user}
      <option value="{$user.id}">{$user.id} ({$user.username})</option>
     {/foreach}
    </select>
   </td>
   <td><input name="name1"></td>
   <td>
    <select name="direction1">
     <option value="nw">Nord-vest</option>
     <option value="sw">Sud-vest</option>
     <option value="no">Nord-est</option>
     <option value="so">Sud-est</option>
     <option value="random">Intamplator</option>
    </select>
   </td>
  </tr>
  <tr>
   <td>3</td>
   <td><input name="anzahl1"></td>
   <td>
    <select name="userid1">
     <option></option>
     {foreach from=$userInfo item=user}
      <option value="{$user.id}">{$user.id} ({$user.username})</option>
     {/foreach}
    </select>
   </td>
   <td><input name="name1"></td>
   <td>
    <select name="direction1">
     <option value="nw">Nord-vest</option>
     <option value="sw">Sud-vest</option>
     <option value="no">Nord-est</option>
     <option value="so">Sud-est</option>
     <option value="random">Intamplator</option>
    </select>
   </td>
  </tr>
  <tr>
   <td>4</td>
   <td><input name="anzahl1"></td>
   <td>
    <select name="userid1">
     <option></option>
     {foreach from=$userInfo item=user}
      <option value="{$user.id}">{$user.id} ({$user.username})</option>
     {/foreach}
    </select>
   </td>
   <td><input name="name1"></td>
   <td>
    <select name="direction1">
     <option value="nw">Nord-vest</option>
     <option value="sw">Sud-vest</option>
     <option value="no">Nord-est</option>
     <option value="so">Sud-est</option>
     <option value="random">Intamplator</option>
    </select>
   </td>
  </tr>
  <tr>
   <td>5</td>
   <td><input name="anzahl1"></td>
   <td>
    <select name="userid1">
     <option></option>
     {foreach from=$userInfo item=user}
      <option value="{$user.id}">{$user.id} ({$user.username})</option>
     {/foreach}
    </select>
   </td>
   <td><input name="name1"></td>
   <td>
    <select name="direction1">
     <option value="nw">Nord-vest</option>
     <option value="sw">Sud-vest</option>
     <option value="no">Nord-est</option>
     <option value="so">Sud-est</option>
     <option value="random">Intamplator</option>
    </select>
   </td>
  </tr>
  <tr>
   <td colspan="2"><input type="submit" value="Köyleri ekle"></td>
  </tr>
 </table>
</form>
<hr>

{elseif $smarty.get.action == "mach"}
Köyler seçtiğiniz oyunculara başarıyla eklendi!<br>
<a href="?screen=dorf">Geri</a>
{/if}
