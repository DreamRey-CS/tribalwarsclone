<?php

error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);

define('PATH', str_replace(PATH_SEPARATOR, '/', dirname(__FILE__)));
function LoadFuncVV1($class_name){
    $root = PATH."/lib/";
    $search_dirs = array(
		'{name}.php',
		'{name}.class.php',
		'class/{name}.php',
		'class/{name}.class.php',
		'smarty/{name}.class.php'
    );
    foreach($search_dirs as $dir){
		$dir = str_replace('{name}', $class_name, $dir);
		if(file_exists($root.$dir)){
		    require_once($root.$dir);
	    	break;
		}
    }
}
spl_autoload_register("LoadFuncVV1");

// Eski sürümün şablonlarında gömülü kalan Portekizce/İngilizce metinleri de
// Türkçeleştir. Böylece yalnızca INI üzerinden gelen menüler değil, harita ve
// binalar ekranı da tutarlı olur.
function tr_page_output($html) {
    // Genel "Tribe" çevirisi oyun markasını değiştirmesin.
    $html = str_replace('Tribe Rush', '__TRIBE_RUSH_BRAND__', $html);
    $replace = array(
        'Coordinates:'=>'Koordinatlar:','Points:'=>'Puan:','Player:'=>'Oyuncu:','Tribe:'=>'Kabile:',
        'Centralize on map'=>'Haritada ortala','Center on Map'=>'Haritada ortala','Send troops'=>'Birlik gönder','Send resources'=>'Kaynak gönder',
        'General View of Köy'=>'Köy genel görünümü','Arrival in:'=>'Varışa kalan:','Arrival In:'=>'Varışa kalan:','Arrival:'=>'Varış:','Source:'=>'Kaynak:','Origin:'=>'Çıkış:',
        'Command'=>'Komut','Comando'=>'Komut','Saque:'=>'Ganimet:','Madeira'=>'Odun','Argila'=>'Kil','Ferro'=>'Demir',
        'Invitations'=>'Davetler','Invite'=>'Davet et','Name:'=>'İsim:','Accept'=>'Kabul et','Reject'=>'Reddet','Cancelar'=>'İptal',
        'Create tribe'=>'Kabile kur','Abbreviation:'=>'Kısaltma:','FUNDAR TRIBO'=>'KABİLE KUR','Submenus'=>'Alt menüler',
        'Properties'=>'Özellikler','Total Points:'=>'Toplam puan:','Average Points:'=>'Ortalama puan:','Ranking:'=>'Sıralama:','Tribe Profile'=>'Kabile profili',
        'Selection an action..'=>'Bir işlem seçin','Change permissions'=>'Yetkileri değiştir','Dismiss'=>'Kabileden çıkar','Status'=>'Durum','Active'=>'Aktif',
        'Inactive for 2 days'=>'2 gündür etkin değil','Inactive for 1 week'=>'1 haftadır etkin değil','Vacation Mode'=>'Tatil modu','Banned'=>'Yasaklı',
        'Duke'=>'Kurucu','Baron'=>'Yönetici','Recruiter'=>'Davetçi','Mass Mail'=>'Toplu mesaj','Forum Moderator'=>'Forum yöneticisi',
        'Max population'=>'Azami nüfus','Population max no'=>'Sonraki seviyede azami nüfus','Trabalhador'=>'Nüfus','Fazenda'=>'Çiftlik',
        'Construir nova aldeia'=>'Yeni köy oluştur','Direção'=>'Yön','Aleatório'=>'Rastgele','Noroeste'=>'Kuzeybatı','Nordeste'=>'Kuzeydoğu','Sudoeste'=>'Güneybatı','Sudeste'=>'Güneydoğu','CONFIRMAR'=>'ONAYLA',
        'Todos os direitos reservados'=>'Tüm hakları saklıdır','Novo relatório'=>'Yeni rapor','Nova mensagem'=>'Yeni mesaj',
        'The attacker won!'=>'Saldıran kazandı!','O defensor venceu'=>'Savunan kazandı!','Duration (Round Trip):'=>'Süre (gidiş-dönüş):',
        'Duration:'=>'Süre:','Completion'=>'Tamamlanma','Recruitment'=>'Üretim','Mass Recruitment'=>'Toplu üretim',
        'Vacation Replacement'=>'Tatil Vekâleti','Finish vacation replacement'=>'Tatil vekâletini bitir','Rank:'=>'Sıra:','Page loaded in'=>'Sayfa yüklenme süresi',
        'Lehmgrube'=>'Kil Ocağı','Holz'=>'Odun','Lehm'=>'Kil','Eisen'=>'Demir','Arbeiter'=>'Nüfus',
        'Ã‡Ä±kÄ±ÅŸ'=>'Çıkış','HoÅŸ geldin'=>'Hoş geldin','KullanÄ±cÄ±'=>'Kullanıcı','GÃ¼venlik'=>'Güvenlik','YÃ¼kleme'=>'Yükleme','TÃ¼m haklarÄ± saklÄ±dÄ±r'=>'Tüm hakları saklıdır',
        'Administration'=>'Yönetim','Startseite'=>'Ana Sayfa','Serverzeit'=>'Sunucu saati','Fehler:'=>'Hata:','Aktionsdatei wurde nicht gefunden.'=>'İşlem dosyası bulunamadı.','Bereits gespeicherte Ankündigungen'=>'Kayıtlı duyurular','Die Stï¿½mme'=>'Tribe Rush','Die Stämme'=>'Tribe Rush',
        'Map'=>'Harita','Village'=>'Köy','Villages'=>'Köyler','Köys'=>'Köyler','Own Village'=>'Kendi Köyün',
        'Your Tribe'=>'Kabilen','Player Villages'=>'Oyuncu Köyleri','Abandoned'=>'Terk edilmiş',
        'Other villages'=>'Diğer köyler','Allies'=>'Müttefikler','Enemies'=>'Düşmanlar',
        'Non-aggression Pact (NAP)'=>'Saldırmazlık Paktı (NAP)','Marked Players'=>'İşaretli Oyuncular',
        'No tags found!'=>'İşaret bulunamadı!','Center on Map'=>'Haritada ortala','Centralize on map'=>'Haritada ortala',
        'Village Headquarters'=>'Köy Karargâhı','Köy Headquarters'=>'Köy Karargâhı','Barracks'=>'Kışla','Academy'=>'Akademi','Rally Point'=>'Toplanma Noktası',
        'Smithy'=>'Demirci','Market'=>'Pazar','Stable'=>'Ahır','Workshop'=>'Atölye','Headquarters'=>'Karargâh',
        'Rank'=>'Sıra','Name'=>'İsim','Page loaded'=>'Sayfa yüklenme süresi','Sunucu saati'=>'Sunucu saati',
        'General View of Village'=>'Köy genel görünümü','Your commands'=>'Komutların','Notepad'=>'Not defteri',
        'Not enough resources available'=>'Yeterli kaynak yok','Not enough farm space for units'=>'Birlikler için yeterli nüfus alanı yok',
        'Padrão'=>'Standart','KÃ¶y'=>'Köy','KÃ¶y atual'=>'Mevcut köy','Suas aldeias'=>'Köylerin','Abandonadas'=>'Terk edilmiş',
        'Outras aldeias'=>'Diğer köyler','Aliados'=>'Müttefikler','Pactos de não-agressão (PNA)'=>'Saldırmazlık Paktı (NAP)',
        'Inimigos'=>'Düşmanlar','Kabile'=>'Kabile','Jogadores marcados'=>'İşaretli Oyuncular','Nenhuma marcação encontrada!'=>'İşaret bulunamadı!',
        'Centralizar mapa'=>'Haritada ortala','Your Tribe'=>'Kabilen','Tribe'=>'Kabile',
        'Spearman'=>'Mızrakçı','Swordsman'=>'Kılıç Ustası','Axeman'=>'Baltacı','Archers'=>'Okçu',
        'Scout'=>'Casus','Light Cavalry'=>'Hafif Süvari','Heavy Cavalry'=>'Ağır Süvari',
        'Ram'=>'Koçbaşı','Catapult'=>'Mancınık','Nobleman'=>'Misyoner','Paladin'=>'Şövalye',
        'Not built'=>'İnşa edilmedi','Not build'=>'İnşa edilmedi','Construct'=>'İnşa et','Cancel'=>'İptal',
        'Desculpe'=>'Hata','Desulpe'=>'Hata','Desclpe'=>'Hata','Oeps'=>'Hata','Sorry'=>'Hata','não foi possivel'=>'işlem gerçekleştirilemedi','não foi possível'=>'işlem gerçekleştirilemedi','não encontramos'=>'bulunamadı','não pode'=>'yapamazsınız','não há'=>'yok','não existe'=>'yok','não está'=>'değil','não'=>'değil','você'=>'siz','Você'=>'Siz','jogador'=>'oyuncu','jogadores'=>'oyuncular','oyuncues'=>'oyuncular','aldeia'=>'köy','Aldeia'=>'Köy','aldeias'=>'köyler','Aldeias'=>'Köyler','recursos'=>'kaynaklar','unidade'=>'birlik','unidades'=>'birlikler','birliks'=>'birlikler','fazenda'=>'çiftlik','requerimentos'=>'gereksinimler','Tribo'=>'Kabile','tribo'=>'kabile','já'=>'zaten','está'=>'bu','ação'=>'işlem','permitida'=>'izin veriliyor','convidado'=>'davet edildi','Nederlands'=>'Türkçe','Uitloggen'=>'Çıkış','Er zijn'=>'Kayıtlı oyuncu sayısı:','Spelers online'=>'çevrimiçi oyuncu','Het is oorlog!'=>'Savaş başladı!','Testverhaal'=>'Yerel bot savaşı',
        'Attack'=>'Saldırı','Attacker'=>'Saldıran','Defense'=>'Savunma','Defender'=>'Savunan','Support'=>'Destek','Trade'=>'Ticaret','All Messages'=>'Tüm mesajlar','New Report'=>'Yeni rapor','Village'=>'Köy','Villages'=>'Köyler','Homepage'=>'Ana sayfa','Create New Village'=>'Yeni köy oluştur','General View of Village'=>'Köy genel görünümü','Defense bonus'=>'Savunma bonusu','Defense Bonus'=>'Savunma bonusu','Overview'=>'Genel Bakış','Reports'=>'Raporlar','Messages'=>'Mesajlar','Settings'=>'Ayarlar','Logout'=>'Çıkış','Combined'=>'Birleşik','Production'=>'Üretim','Troops'=>'Birlikler','Commands'=>'Komutlar','Incomings'=>'Gelenler','All'=>'Tümü','Attacks'=>'Saldırılar','Market'=>'Pazar','Players'=>'Oyuncular','Profile'=>'Profil','Members'=>'Üyeler','Diplomacy'=>'Diplomasi','Cancel'=>'İptal','Build'=>'İnşa et','Construct'=>'İnşa et','Demolish'=>'Yık','Wood'=>'Odun','Stone'=>'Kil','Iron'=>'Demir','Buildings'=>'Binalar','Requirements'=>'Gereksinimler','Completed'=>'Tamamlandı','Help'=>'Yardım','Minute'=>'Dakika','Hour'=>'Saat','New Message'=>'Yeni mesaj','Send Message'=>'Mesaj gönder','Archive'=>'Arşiv','Write Message'=>'Mesaj yaz','All Villages'=>'Tüm köyler','Current Village'=>'Mevcut köy','Attacking force'=>'Saldırı gücü','Infantry Defense'=>'Piyade savunması','Defense Cavalry'=>'Süvari savunması','Villages dominated by this village'=>'Bu köyün yönettiği köyler','per Player'=>'oyuncu başına','per Village'=>'köy başına','Duration'=>'Süre','Completion'=>'Tamamlanma','Recruitment'=>'Üretim','Recruit'=>'Üret','Cancel Command'=>'Komutu iptal et','Mass Recruitment'=>'Toplu üretim','The attacker won!'=>'Saldıran kazandı!','The resources were sent automatically.'=>'Kaynaklar otomatik gönderildi.','today at'=>'bugün saat','Today'=>'Bugün','Nobleman'=>'Misyoner','Gold Coins'=>'Altın parası',
        'Punkte'=>'Puan','Points'=>'Puan','Rang'=>'Sıra','Name'=>'İsim','Gesamtpunkte'=>'Toplam puan','Mitglieder'=>'Üyeler','Punkteschnitt Spieler'=>'Oyuncu puan ortalaması','Punkteschnitt Dorf'=>'Köy puan ortalaması','Dörfer'=>'Köyler','D�rfer'=>'Köyler','Löschen'=>'Sil','L�schen'=>'Sil','Empfänger'=>'Alıcı','Empf�nger'=>'Alıcı','Gesendet'=>'Gönderildi','Berichte'=>'Raporlar','Sonstiges'=>'Diğer','Holzfäller'=>'Oduncu','Holzf�ller'=>'Oduncu','schließen'=>'kapat','schlie�en'=>'kapat','Eigene Dörfer'=>'Kendi köyleriniz','Eigene D�rfer'=>'Kendi köyleriniz','männlich'=>'Erkek','m�nnlich'=>'Erkek','Persönliches Wappen'=>'Kişisel arma','Pers�nliches Wappen'=>'Kişisel arma','Wappen löschen'=>'Armayı sil','Wappen l�schen'=>'Armayı sil','ACHTUNG'=>'DİKKAT','Gebäude'=>'Bina','Geb�ude'=>'Bina','nicht erfüllt'=>'karşılanmadı','nicht erf�llt'=>'karşılanmadı','Nicht genügend Rohstoffe vorhanden'=>'Yeterli kaynak yok','Nicht gen�gend Rohstoffe vorhanden'=>'Yeterli kaynak yok'
    );
    $html = str_replace(array_keys($replace), array_values($replace), $html);
    // Kaynakta yüzlerce farklı eski hata cümlesi bulunuyor. Tam karşılığı
    // olmayan karma Portekizce hata metinlerini kullanıcıya bozuk bir cümle
    // göstermek yerine güvenli ve anlaşılır ortak Türkçe mesaja dönüştür.
    $html = preg_replace('/(?:Hata,? ancak|Desulpe,? ancak|Desclpe,? ancak)[^<\r\n]*[!.]/', 'Hata: İşlem gerçekleştirilemedi.', $html);
    return str_replace('__TRIBE_RUSH_BRAND__', 'Tribe Rush', $html);
}

// İngilizce dil seçeneği: şablonlardaki sabit Türkçe metinleri resmi
// TribalWars (tribalwars.net) terimleriyle İngilizceye çevirir.
// Değişken/URL içermeyen görünür metinler dönüştürülür; marka korunur.
function en_page_output($html) {
    $html = str_replace('Tribe Rush', '__TRIBE_RUSH_BRAND__', $html);
    $replace = array(
        'Köy Karargâhı'=>'Village Headquarters','Toplanma Noktası'=>'Rally point',
        'Gizli Sığınak'=>'Hiding place','Demir Madeni'=>'Iron mine','Kil Madeni'=>'Clay pit',
        'Odun Kesimi'=>'Timber camp','Hafif Süvari'=>'Light cavalry','Ağır Süvari'=>'Heavy cavalry',
        'Atlı Okçu'=>'Mounted archer','Kılıç Ustası'=>'Swordsman','Koçbaşları'=>'Rams',
        'Mızrakçı'=>'Spear fighter','Baltacı'=>'Axeman','Mancınıklar'=>'Catapults',
        'Mancınık'=>'Catapult','Misyoner'=>'Nobleman','Mızrak'=>'Spear','Kılıç'=>'Sword','Balta'=>'Axe','Yay'=>'Bow','Piyade'=>'Infantry','Süvari'=>'Cavalry','Savaş Makineleri'=>'Siege weapons','Yarıya indir (Premium)'=>'Halve (Premium)','Bu özellik premium hesaplarda kullanılabilir!'=>'This feature requires a premium account!','Kalan süre 1 dakikanın altında, hızlandırmaya gerek yok!'=>'Remaining time is under a minute, no need to speed up!','Bu inşaat artık sırada değil!'=>'This construction is no longer queued!','Sıradaki inşaatın kalan süresi yarıya insin mi? (Premium)'=>'Halve the remaining time of the current construction? (Premium)','Bu inşaatı iptal etmek istediğinize emin misiniz?'=>'Are you sure you want to cancel this construction?','Köy adı 3 ile 25 karakter arasında olmalıdır!'=>'Village name must be between 3 and 25 characters!','Bina zaten tamamen inşa edilmiş!'=>'Building is already fully constructed!','Çiftlik daha fazla nüfusu besleyemez!'=>'The farm cannot feed more population!','Depo kapasitesi çok küçük!'=>'Warehouse capacity is too small!','Gereksinimler karşılanmadı!'=>'Requirements not met!','Yeni inşaat emri için yeterli kaynak yok!'=>'Not enough resources for a new construction order!','Böyle bir bina yok!'=>'No such building!','Bu inşaat bulunamadı!'=>'Construction not found!','Bu emir zaten tamamlanmış!'=>'This order is already completed!','Tümünü Araştır (Premium)'=>'Research all (Premium)','Tüm teknolojileri zaten araştırdınız!'=>'You have already researched everything!','Başarılı, tüm teknolojiler araştırıldı!'=>'Success, everything researched!','Koçbaşı'=>'Ram','Demirci'=>'Smithy',
        'Kışla'=>'Barracks','Akademi'=>'Academy','Heykel'=>'Statue','Deposu'=>'Warehouse',
        'Depo'=>'Warehouse','Çiftlik'=>'Farm','Duvar'=>'Wall','Ahır'=>'Stable',
        'Atölye'=>'Workshop','Pazar'=>'Market','Okçu'=>'Archer','Casus'=>'Scout',
        'Şövalye'=>'Paladin','Köyler'=>'Villages','Köyü'=>'Village','Köy'=>'Village',
        'Oyuncu'=>'Player','Oyuncular'=>'Players','Kabile'=>'Tribe','Sadakat'=>'Loyalty',
        'Ganimet'=>'Haul','Kayıplar'=>'Losses','Birlikler'=>'Troops','Birlik'=>'Troops',
        'Raporlar'=>'Reports','Raporu Sil'=>'Delete report','Rapor başlığı'=>'Report subject',
        'Seçilenleri Sil'=>'Delete selected','Tümünü seç'=>'Select all',
        'Bu bölümde rapor bulunmuyor.'=>'There are no reports in this section.',
        'Rapor'=>'Report','Mesajlar'=>'Messages','Mesaj'=>'Message','Sıralama'=>'Ranking',
        'Ayarlar'=>'Settings','Notlar'=>'Notes','Çıkış'=>'Logout','Harita'=>'Map',
        'Saldırılar'=>'Attacks','Saldırı'=>'Attack','Savunma'=>'Defense','Savunan'=>'Defender',
        'Saldıran'=>'Attacker','Destek'=>'Support','Ticaret'=>'Trade','Diğer'=>'Other',
        'Tümü'=>'All','Gelenler'=>'Incomings','Komutlar'=>'Commands','Üretim'=>'Production',
        'Birleşik'=>'Combined','Arşiv'=>'Archive','Arşivle'=>'Archive','Gönderen'=>'Sender',
        'Alıcı'=>'Recipient','Gönderildi'=>'Sent','Gönder'=>'Send','Tarih'=>'Date',
        'Konu'=>'Subject','Genel Bakış'=>'Overview','Profil'=>'Profil','Üyeler'=>'Members',
        'Diplomasi'=>'Diplomacy','İptal'=>'Cancel','İnşa et'=>'Construct','Yık'=>'Demolish',
        'Odun'=>'Wood','Kil'=>'Clay','Demir'=>'Iron','Binalar'=>'Buildings',
        'Gereksinimler'=>'Requirements','Tamamlandı'=>'Completed','Yardım'=>'Help',
        'Dakika'=>'Minutes','Saat'=>'Hours','Yeni rapor'=>'New report','Yeni mesaj'=>'New message',
        'Yeni'=>'New','Sil'=>'Delete','Kaydet'=>'Save','Düzenle'=>'Edit','Ara'=>'Search',
        'Ekle'=>'Add','Kapat'=>'Close','Geri'=>'Back','Devam'=>'Continue','Onayla'=>'Confirm',
        'Günlük'=>'Daily','Haftalık'=>'Weekly','Puan'=>'Points','Sıra'=>'Rank',
        'Kaynak'=>'Resource','Kaynaklar'=>'Resources','Nüfus'=>'Population',
        'Seviye'=>'Level','Süre'=>'Duration','Varış'=>'Arrival','Hedef'=>'Target',
        'Çıkış köyü'=>'Origin village','Hedef köy'=>'Target village',
        'Saldıran taraf kazandı!'=>'The attacker has won!','Savunan taraf kazandı!'=>'The defender has won!',
        'Köy fethedildi! Sadakat sıfırlandı.'=>'Village conquered! Loyalty has been reset.',
        'Şans'=>'Luck','Moral'=>'Morale','Altın parası'=>'Gold coins',
        'Acemi koruması'=>'Beginner protection','Tatil Vekâleti'=>'Holiday replacement',
        'Tatil vekâleti'=>'Holiday replacement','Şifre Değiştir'=>'Change password',
        'Hesabım'=>'My account','Giriş Kayıtları'=>'Login history','Arkadaşlar'=>'Friends',
        'Davetler'=>'Invitations','Davet'=>'Invite','Kabul et'=>'Accept','Reddet'=>'Reject',
        'Sunucu saati'=>'Server time','Sayfa yüklenme süresi'=>'Page loaded in',
        'Tüm hakları saklıdır'=>'All rights reserved','GOD MODU'=>'GOD MODE','YÖNETİM'=>'ADMIN',
        'Yönetim'=>'Admin','Komut'=>'Command','Komutların'=>'Your commands',
        'Heykel'=>'Statue','Silah Odası'=>'Weapon chamber','Sonraki eşyaya ilerleme:'=>'Progress to next item:',
        '>Eğitim<'=>'>Training<','Tamamlanma'=>'Completion','Maliyetler'=>'Costs','Bitiş'=>'End',
        'Gereksinim yok'=>'No requirements','Nüfus'=>'Population','Hız'=>'Speed',
        'Yağma kapasitesi'=>'Haul capacity','Alan başına dakika'=>'minutes per field',
        'Saldırı gücü'=>'Offensive strength','Piyade savunması'=>'General defense',
        'Süvari savunması'=>'Cavalry defense','Okçu savunması'=>'Archer defense',
        'Kaynakların yalnızca %90'=>'Only 90% of resources','Kaynakların %90'=>'90% of resources',
        'iade edilir'=>'will be refunded','Birlik Üret'=>'Recruit','Toplu Birlik Üretimi'=>'Mass recruitment',
        'Şövalye Adı'=>'Paladin name','Şövalyeyi Adlandır'=>'Assign paladin','Yeniden Adlandır'=>'Rename',
        'Bu köye taşı'=>'Move to this village',
        'Eşyalar yalnızca şövalyenin eşlik ettiği birliklerde etkilidir.'=>'Items are only effective for troops accompanied by the paladin.',
        'Gelen birlikler'=>'Incoming troops','Gelen saldırı'=>'Incoming attack',
        'saldırı geliyor'=>'incoming attack','Barbarlar'=>'Barbarians','Barbar'=>'Barbarian',
        'Tüccar'=>'Merchant','Yağma'=>'Loot','Yağmala'=>'Loot','Fethet'=>'Conquer',
        'köyünü fethetti.'=>'has conquered the village.','köyüne saldırdı.'=>'has attacked the village.',
        'tarafından fethedildi.'=>'has been conquered by','saldırdı.'=>'has attacked.',
        'destek gönderildi.'=>'support has been sent.','kaynak gönderildi.'=>'resources have been sent.',
        'Yeni köy oluştur'=>'Create new village','Köy genel görünümü'=>'Village overview',
        'Mevcut köy'=>'Current village','Köyleriniz'=>'Your villages','Terk edilmiş'=>'Abandoned',
        'Diğer köyler'=>'Other villages','Müttefikler'=>'Allies','Düşmanlar'=>'Enemies',
        'Müttefik'=>'Ally','Düşman'=>'Enemy','İşaretli Oyuncular'=>'Marked players',
        'Saldırmazlık Paktı'=>'Non-aggression pact','Kabile profili'=>'Tribe profile',
        'Toplam puan'=>'Total points','Ortalama puan'=>'Average points',
        'Azami nüfus'=>'Max population','Sonraki seviye'=>'Next level',
        'Sonraki seviyede'=>'At the next level','İnşa edilmedi'=>'Not built',
        'Yeterli kaynak yok'=>'Not enough resources',
        'Birlikler için yeterli nüfus alanı yok'=>'Not enough farm space for your troops',
        'Güvenlik kodu geçersiz!'=>'Invalid security code!','Güvenlik anahtarı geçersiz!'=>'Invalid security key!',
        'Hata: '=>'Error: ','Hata'=>'Error','Novo relatório'=>'New report','Nova mensagem'=>'New message',
    );
    $html = str_replace(array_keys($replace), array_values($replace), $html);
    return str_replace('__TRIBE_RUSH_BRAND__', 'Tribe Rush', $html);
}
if (PHP_SAPI != 'cli'){
    $out_lang = (isset($_COOKIE['tw_lang']) && $_COOKIE['tw_lang'] == 'TR') ? 'tr_page_output' : 'en_page_output';
    ob_start($out_lang);
}

require_once(PATH."/include/config.php");
if($config['agreement_per_hour'] == 0)
    exit('Geçersiz ayar: agreement_per_hour sıfırdan büyük olmalıdır.');
if($config['ip_control'] && !(in_array($_SERVER['REMOTE_ADDR'], $allow_ips)))
	exit("IP adresiniz izin verilenler listesinde değil!");

require_once(PATH."/lib/functions.php");
$time = time();
$db = new DB_MySQL();
$db->connect($config['db_host'], $config['db_user'], $config['db_pw'], $config['db_name'], "MySql");
if($time+5 < time()){
	exit("MySQL yanıt vermiyor. Veritabanı bağlantısını kontrol edin!");
}

require_once(PATH."/include/configs/buildings.php");
require_once(PATH."/include/configs/raw_material_production.php");
require_once(PATH."/include/configs/farm_limits.php");
require_once(PATH."/include/configs/max_storage.php");
require_once(PATH."/include/configs/max_hide.php");
require_once(PATH."/include/configs/units.php");
require_once(PATH."/include/configs/techs.php");
require_once(PATH."/include/configs/max_wall_bonus.php");
require_once(PATH."/include/configs/dealers.php");
require_once(PATH."/include/configs/awards.php");
require_once(PATH."/include/configs/knight_items.php");

$run_key = generate_key();

$cl_reports = new add_report();

$arr_builds_starts_by_one = $config['buildings_starting_by_one'];


// Inventário estátua
$lang = new aLang("index", isset($lang) ? $lang : "TR");
Registry::set("lang", $lang);

include("include/configs/bbcodes.php");




$sql_bonus_villages = mysql_query("SELECT * FROM villages WHERE id = '".$_GET["village"]."'");
$vill = mysql_fetch_assoc($sql_bonus_villages);
if ($vill["bonus"] == "1")
{
  include("include/configs/max_storage_bonus.php");
  include("include/configs/dealers_bonus.php");
}
elseif($vill["bonus"] == "2")
{
	include("include/configs/farm_limits_bonus.php");
}
elseif($vill["bonus"] == "3")
{
	include("include/configs/units_bonus_stable.php");
}
elseif($vill["bonus"] == "4")
{
	include("include/configs/units_bonus_barracks.php");
}
elseif($vill["bonus"] == "5")
{
	include("include/configs/units_bonus_garage.php");
}
elseif($vill["bonus"] == "6")
{
	include("include/configs/raw_material_production_bonus.php");
}


function get_bonus($x,$y)
{
  $sql = mysql_query("SELECT * FROM villages WHERE x = '$x' AND y = '$y'");
  $vill = mysql_fetch_assoc($sql);
  if ($vill["bonus"] > "0")
  {
    $out = true;
  }
  else
  {
    $out = false;
  }
  return $out;
}

?>
