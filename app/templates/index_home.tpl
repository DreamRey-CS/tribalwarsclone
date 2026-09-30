<h2>{$config.name} - Yerel Savaş Dünyası</h2>
					<p><strong>{$config.name}</strong> yerel bot savaşına hoş geldiniz.</p>
					<p align="center"><b>{$players}</b> kayıtlı oyuncu | <b>{$online}</b> çevrimiçi oyuncu</p>
					{if count($announcement)>0}
					<table class="vis" width="100%" cellspacing="1">
						<tr><th colspan="2">Duyurular:</th></tr>
						{foreach from=$announcement item=item key=f_id}
						<tr>
							<td align="left">
								{$announcement.$f_id.text}<br />
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr>
										{if !empty($announcement.$f_id.link)}
											<td align="left" style="font-size: xx-small;"><a href="{$announcement.$f_id.link}" target="_blank">&raquo; Daha fazla</a></td>
										{/if}
										<td align="right" style="font-size: xx-small; font-weight:bold;">Yayınlandı: {$announcement.$f_id.time}</td>
									</tr>
								</table>
							</td>
						</tr>
						{/foreach}
					</table>
					{/if}
