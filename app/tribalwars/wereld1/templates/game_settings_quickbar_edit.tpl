<h3>Edit an entry</h3>
{php}
if (empty($_POST['name']) && $_GET['confirm'] == 'yes') {
      
      echo "<span><font color='red'><h5>İsim must be specified.</h5></font></span>";
}
if (empty($_POST['href']) && $_GET['confirm'] == 'yes') {
      echo "<span><font color='red'><h5>Hedef URL must be specified.</h5></font></span>";
}
{/php}
<form method="post" action="game.php?village={$village.id}&screen=settings&mode=quickbar&action=edit&confirm=yes&id={$id}">
<table class="vis">
  <tr>
    <td width="70">İsim: </td>
    <td><input type="text" name="name" size="35" value="{$name}"></td>
  </tr>
  <tr>
    <td width="70">Image-URL: </td>
    <td><input type="text" name="img" size="35" value="{$img}"></td>
  </tr>
  <tr>
    <td width="70">Hedef-URL: </td>
    <td><input type="text" name="href" size="35" value="{$href}"></td>
  </tr>
  <tr>

    <td colspan="2"><input type="checkbox" name="newWindow" {if $target == 1} checked="checked"{/if}> Yeni pencerede aç</td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit" value="OK">
    </td>
  </tr>
</table>