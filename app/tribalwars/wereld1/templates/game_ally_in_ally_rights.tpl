<script type="text/javascript">
function set_found_right() {ldelim} check_and_disable("lead", gid("found").checked); set_lead_right(); {rdelim}
function set_lead_right() {ldelim} var checked=gid("lead").checked; check_and_disable("invite",checked); check_and_disable("diplomacy",checked); check_and_disable("mass_mail",checked); {rdelim}
function check_and_disable(name,check) {ldelim} gid(name).disabled=check; if(check===true) gid(name).checked=true; {rdelim}
</script>
<form action="game.php?village={$village.id}&amp;screen=ally&amp;mode=rights&amp;action=edit_rights&amp;player_id={$rights.id}&amp;h={$hkey}" method="post">
<table class="vis" width="100%">
	<tr><th colspan="2">{$rights.username} adlı oyuncunun yetkileri</th></tr>
	<tr><td colspan="2">Kabile yetkilerini dikkatli verin. Kurucu tüm kabile ayarlarını değiştirebilir.</td></tr>
	<tr><td width="180"><label><input type="checkbox" name="found" id="found" onchange="set_found_right();" {if $rights.ally_found==1}checked="checked"{/if} {if $user.ally_found==0}disabled="disabled"{/if} /> Kurucu</label></td><td>Tüm yetkilere sahiptir; kabileyi düzenleyebilir, dağıtabilir ve diğer üyelerin yetkilerini değiştirebilir.</td></tr>
	<tr><td><label><input type="checkbox" name="lead" id="lead" onchange="set_lead_right();" {if $rights.ally_found==1}disabled="disabled"{/if} {if $rights.ally_lead==1}checked="checked"{/if} /> Yönetici</label></td><td>Üyeleri ve temel kabile ayarlarını yönetebilir.</td></tr>
	<tr><td><label><input type="checkbox" name="invite" id="invite" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_invite==1}checked="checked"{/if} /> Davetçi</label></td><td>Kabileye yeni oyuncular davet edebilir.</td></tr>
	<tr><td><label><input type="checkbox" name="diplomacy" id="diplomacy" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_diplomacy==1}checked="checked"{/if} /> Diplomat</label></td><td>Müttefik, saldırmazlık paktı ve düşman ilişkilerini yönetebilir.</td></tr>
	<tr><td><label><input type="checkbox" name="mass_mail" id="mass_mail" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_mass_mail==1}checked="checked"{/if} /> Toplu mesaj</label></td><td>Tüm kabile üyelerine mesaj gönderebilir.</td></tr>
	<tr><th colspan="2">Kabile unvanı</th></tr>
	<tr><td>Unvan</td><td><input type="text" name="title" maxlength="24" value="{$rights.ally_titel}" /> <label><input type="checkbox" name="view_title" /> Herkese göster</label></td></tr>
	<tr><th colspan="2" style="text-align:right"><input type="submit" name="submit" class="button" value="Kaydet" /></th></tr>
</table>
</form>
