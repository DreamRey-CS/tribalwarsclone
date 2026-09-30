<div align="left">
<h4>Add a new entry</h4>
{php}
if (empty($_POST['name']) && $_GET['confirm'] == 'yes') {
      
      echo "<span><font color='red'><h5>İsim muss angegeben werden.</h5></font></span>";
}
if (empty($_POST['href']) && $_GET['confirm'] == 'yes') {
      echo "<span><font color='red'><h5>Ziel-URL muss angegeben werden.</h5></font></span>";
}
{/php}
<form method="post" action="game.php?village={$village.id}&screen=settings&mode=quickbar&action=add&confirm=yes">
<table class="vis">
  <tr>
    <td width="70">İsim: </td>
    <td><input type="text" name="name" size="35"></td>
  </tr>
  <tr>
    <td width="70">Image-URL: </td>
    <td><input type="text" name="img" size="35"></td>
  </tr>
  <tr>
    <td width="70">Hedef-URL: </td>
    <td><input type="text" name="href" size="35"></td>
  </tr>
  <tr>
    <td colspan="2"><input type="checkbox" name="newWindow"> Open in a new window</td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit" value="OK">
    </td>
  </tr>
</table>
</div>