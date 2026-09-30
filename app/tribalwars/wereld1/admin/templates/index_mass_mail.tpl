<h2>Genel Mesaj</h2>
<p>Dünyadaki tüm oyunculara tek seferde mesaj gönderin.</p>
{if !empty($error)}<div class="error">{$error}</div>{/if}
{if !empty($succes)}<div class="notice success">{$succes}</div>{/if}
<form method="post" action="index.php?screen=mass_mail&amp;action=send"><table class="vis"><tr><td width="120">Konu</td><td><input type="text" name="subject" /></td></tr><tr><td>Mesaj</td><td><textarea id="message" rows="14" name="message"></textarea></td></tr><tr><td></td><td><input type="submit" name="submit" value="Tüm Oyunculara Gönder" /></td></tr></table></form>
