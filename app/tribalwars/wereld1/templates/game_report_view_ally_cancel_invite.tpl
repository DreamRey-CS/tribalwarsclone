<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$report.from_user}">{$report.from_username}</a> için gönderilen kabile davetini iptal etti.
{if $report.ally_exist==0}{$report.allyname} (dağıldı){else}<a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id={$report.ally}">{$report.allyname}</a>{/if}
&nbsp;Withdrawn.