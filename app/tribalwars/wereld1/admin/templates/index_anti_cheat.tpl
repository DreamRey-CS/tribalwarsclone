<h2>Conturi multiple</h2>

{php}
 $unban = $_GET['unban'];
 if ($unban <> "") {
 
 // selectam numele utilizatorului
 $deblocat = mysql_fetch_array(mysql_query("SELECT username FROM users WHERE id = $unban"));
 $deblocat = $deblocat[0];
 $user = urldecode($deblocat);
 
 // deblocarea jucatorului
 mysql_query("UPDATE users SET banned = 'N' WHERE id = $unban");
 
 // afiseaza confirmarea
 echo "<h2 align='center'>Oyuncu $user a fost debanat - <a href='index.php?screen=anti_cheat'>Vezi lista!</a></h2>";
 }
 else
 {
 
// extremele id-urilor oyuncularlor
$mic = mysql_fetch_array(mysql_query("SELECT id FROM users ORDER BY id ASC LIMIT 0 , 1"));
$mare = mysql_fetch_array(mysql_query("SELECT id FROM users ORDER BY  `users`.`id` DESC LIMIT 0 , 1"));
$mic = $mic[0];
$mare = $mare[0];


// creeam tabelul
echo '<table class="vis" style="border:1px" border="1">
 <tbody>
 <tr>
  <th>Oyuncu</th>
  <th>Actiune</th>
 </tr>';
 
// afisam oyunculari blocati
for ($i = $mic; $i <= $mare; $i++) {
	$verificare = mysql_fetch_array(mysql_query("SELECT banned FROM users WHERE id = $i"));
	$verificare = $verificare[0];
	
	if ($verificare == "Y") {
			$banat = mysql_fetch_array(mysql_query("SELECT username FROM users WHERE id = $i"));
			$banat = $banat[0];
			$banat = urldecode($banat);
			echo"
				<tr><td>
				&nbsp;$banat&nbsp;
				</td><td>
				<a href='index.php?screen=anti_cheat&unban=$i'>Debanare</a>
				</td></tr>";
	}
}
	echo '</tbody></table>';
}
{/php}



<h3>Conturi multiple</h3>
{if !empty($action_text)}
{$action_text}
{/if}
{if $multis_found == "Y"}
<table class="vis">
<tr>
	<th>Oyuncu</th>
	<th>Oyuncu cu acelasi IP :</th>
	<th>IP</th>
	<th>Actiune</th>
</tr>

{foreach from=$users item=u}
{if $u.multi.enum == "Y"}
{php}
$se1 = $this->_tpl_vars['u']['id'];
$se2 = $this->_tpl_vars['u']['multi']['userid'];
$username1 = urldecode($this->_tpl_vars['u']['username']);
$username2 = urldecode($this->_tpl_vars['u']['multi']['username']);
$query1 = mysql_num_rows(mysql_query("SELECT * FROM share_internet WHERE id_to = '$se2' AND id_from = '$se1'"));
$query2 = mysql_num_rows(mysql_query("SELECT * FROM share_internet WHERE id_to = '$se1' AND id_from = '$se2'"));

if ($query1 == '1'){
$conn1 = '<span style="color: green;"><b>Da</b></span>';
}
else { $conn1 = '<span style="color: red;"><b>Nu</b></span>'; }
if ($query2 == '1'){
$conn2 = '<span style="color: green;"><b>Da</b></span>';
}
else { $conn2 = '<span style="color: red;"><b>Nu</b></span>'; }

{/php}
<tr>
	<td><a href="index.php?screen=users&action=edit&name={$u.username|urldecode}&id={$u.id}">{$u.username|urldecode|htmlentities} </a> {if $u.banned == "Y"}<strong>(banido)</strong>{/if} [{php} echo $conn1; {/php}]</td>
		<td><a href="index.php?screen=users&action=edit&name={$u.multi.username|urldecode}&id={$u.multi.userid}">{$u.multi.username|urldecode|htmlentities}</a> [{php} echo $conn2; {/php}]</td>
	<td>{$u.ip}</td>
	<td>
		<a href="index.php?screen=anti_cheat&amp;do=ban&amp;user[0]={$u.id}&amp;user[1]={$u.multi.userid}">İkisini de yasakla</a> - 
		<a href="index.php?screen=anti_cheat&amp;do=ban&amp;user[0]={$u.id}">Yasakla {$u.username|urldecode|htmlentities}</a> - 
		<a href="index.php?screen=anti_cheat&amp;do=ban&amp;user[0]={$u.multi.userid}">Yasakla {$u.multi.username|urldecode|htmlentities}</a> <br />
	</td>
</tr>
{/if}
{/foreach}
</table>
{else}
<i>Birden fazla hesabı olan oyuncu bulunmuyor</i>
{/if}
