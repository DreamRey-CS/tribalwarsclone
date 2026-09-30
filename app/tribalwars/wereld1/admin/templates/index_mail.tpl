<h2>Toplu Mesaj</h2>
<p>Kayıtlı tüm oyunculara oyun içi mesaj gönderin.</p>
{if !empty($error)}<div class="error">{$error}</div>{/if}
{if $is_send}<div class="notice success">Mesaj tüm oyunculara gönderildi.</div>{else}<form method="post" action="index.php?screen=mail&amp;action=send" onsubmit="this.submit.disabled=true;"><table class="vis"><tr><td width="120">Konu</td><td><input type="text" name="subject" value="{$subject}" /></td></tr><tr><td>Mesaj</td><td><textarea rows="12" name="text">{$text}</textarea></td></tr><tr><td></td><td><input type="submit" name="submit" value="Tüm Oyunculara Gönder" /></td></tr></table></form>{/if}
