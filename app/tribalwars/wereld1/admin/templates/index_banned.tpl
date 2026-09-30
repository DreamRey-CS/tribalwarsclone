<h1>Yasaklı Oyuncular</h1>
<p>Aici poti vizualiza o lista cu toti oyunculari blocati pe serverul tau !</p><br />

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
 echo "<h2 align='center'>Oyuncu $user a fost deblocat - <a href='index.php?screen=banned'>Listeyi gör</a></h2>";
 }
 else
 {
 
// extremele id-urilor oyuncularlor
$mic = mysql_fetch_array(mysql_query("SELECT id FROM users ORDER BY `users`.`id` ASC LIMIT 0 , 1"));
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
				<a href='index.php?screen=banned&unban=$i'>&nbsp;Deblocheaza&nbsp;</a>
				</td></tr>";
	}
}
	echo '</tbody></table>';
}
{/php}