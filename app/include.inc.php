<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
ini_set('precision','20');

define('PATH', str_replace(PATH_SEPARATOR, '/', dirname(__FILE__)));
function __autoload($class_name){
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

// Ana sayfadaki eski sürüm şablonlarında doğrudan yazılmış metinler için
// son katman Türkçe karşılıkları. Dil dosyasına bağlı olmayan ekranlar da bu
// sayede karışık dil göstermiyor.
function tr_root_output($html) {
    $map = array(
        'Login'=>'Giriş Yap','Register'=>'Kayıt Ol','Username'=>'Kullanıcı Adı','Password'=>'Şifre','Forgot password'=>'Şifremi Unuttum','Register Now'=>'Hemen Kayıt Ol','Statistics'=>'İstatistikler','News'=>'Haberler','Close'=>'Kapat','Browser Game'=>'Tarayıcı Oyunu',
        'HoÅŸ'=>'Hoş','KullanÄ±cÄ±'=>'Kullanıcı','KayÄ±t'=>'Kayıt','GÃ¼venlik'=>'Güvenlik','YÃ¼kleme'=>'Yükleme','TÃ¼m haklarÄ± saklÄ±dÄ±r'=>'Tüm hakları saklıdır','Ã§evrimiÃ§i'=>'çevrimiçi','Ã‡Ä±kÄ±ÅŸ'=>'Çıkış','KatÄ±l'=>'Katıl','Hesap yasaklandÄ±'=>'Hesap yasaklandı','Devre dÄ±ÅŸÄ±'=>'Devre dışı','Kabile alÄ±mÄ±'=>'Kabile alımı','GÃ¼venlik kodu'=>'Güvenlik kodu','TÃ¼rkÃ§e'=>'Türkçe',
        'Home'=>'Ana Sayfa','Rules'=>'Kurallar','Help'=>'Yardım','Statistics'=>'İstatistikler','Login'=>'Giriş','Logout'=>'Çıkış','Team'=>'Kabile','Password'=>'Şifre','Username'=>'Kullanıcı adı','Register'=>'Kayıt Ol','Forgot password'=>'Şifremi unuttum','Email'=>'E-posta','IP Address'=>'IP Adresi','Title'=>'Ünvan','Rank'=>'Sıra','Victories'=>'Zaferler','Registered Since'=>'Kayıt tarihi','Security Code'=>'Güvenlik kodu','Loading Time'=>'Yükleme süresi','Server Time'=>'Sunucu saati','All Rights Reserved'=>'Tüm hakları saklıdır',
        'Desculpe'=>'Hata','Oeps'=>'Hata','Sorry'=>'Hata','je gebruikersnaam'=>'kullanıcı adınız','je wachtwoord'=>'şifreniz','de ingevoerde beveiligingscode'=>'girilen güvenlik kodu','não foi possivel'=>'işlem gerçekleştirilemedi','não foi possível'=>'işlem gerçekleştirilemedi','não encontramos'=>'bulunamadı','não pode'=>'yapamazsınız','não há'=>'yok','não existe'=>'yok','não está'=>'değil','não'=>'değil','você'=>'siz','Você'=>'Siz','jogador'=>'oyuncu','jogadores'=>'oyuncular','aldeia'=>'köy','Aldeia'=>'Köy','aldeias'=>'köyler','recursos'=>'kaynaklar','unidade'=>'birlik','unidades'=>'birlikler','fazenda'=>'çiftlik','requerimentos'=>'gereksinimler','Tribo'=>'Kabile','tribo'=>'kabile','já'=>'zaten','está'=>'bu','ação'=>'işlem','permitida'=>'izin veriliyor','convidado'=>'davet edildi','Nederlands'=>'Türkçe','Uitloggen'=>'Çıkış','Er zijn'=>'Kayıtlı oyuncu sayısı:','Spelers online'=>'çevrimiçi oyuncu','Het is oorlog!'=>'Savaş başladı!','Testverhaal'=>'Yerel bot savaşı',
        'Total Villages'=>'Toplam köy','Player Villages'=>'Oyuncu köyleri','Barbarian Villages'=>'Barbar köyleri','Total Points'=>'Toplam puan','Points per Player'=>'Oyuncu başına puan','Points per Village'=>'Köy başına puan','per Player'=>'oyuncu başına','per Village'=>'köy başına','Players'=>'Oyuncular','Team'=>'Ekip','Support'=>'Destek','Forum'=>'Forum'
    );
    $html = str_replace(array_keys($map), array_values($map), $html);
    $html = preg_replace('/(?:Hata, ancak|Desculpe, ancak|Oeps,)[^<\r\n]*[!.]/', 'Hata: İşlem gerçekleştirilemedi.', $html);
    return $html;
}
if (PHP_SAPI != 'cli') ob_start('tr_root_output');

if(defined('DEV_TWLan'))
	exit('Siz não vai conseguir crackear o servidor!');
define('DEV_TWLan', true);
$security = new Security();
$valid_found = $security->checkIPs();
if(!$valid_found)
	exit("Hata, ancak o TWLan apenas pode ser jogado em rede local!");

$cwd = getcwd();

// Cú
//$admin_string = substr($cwd, strlen($cwd) - 6, 6);
/*if($admin_string != "\admin" && (!file_exists("admin/index.php") || !file_exists("admin/actions/reset.php")))
	exit("Não remova/altere os conteúdos padrões da pasta admin!");
*/

$DWSWxABRcFGKnrkrvhgIWKimsfhQBAEZVrRTD = "FSrBaQAIzLsYrdAUEMrhUefQjAxQqOPCI";
$ejzrpJHCoQCHTDzDjoReBpmMHuDQmXyM = "GLuGYJhHTjcYjQZoMiAgUthZbSihvDrsB";
$afhRcSSvCkOfJckpCsYKaQhrdFFxMZkhAzU = "ioaosetXVzjnxGDZNLQchbzkCbljTpygs";
$OYTtShpnZUfRKQMMHKsAylLibPKAEigpZ = "uJczAAJPAMYURnzNuSYyJoFuwUsYlRLyjEh";
$pQIQxhJmlHDkcKUuELOQPUQtVBQLStvaB = "hMzdGaucjWJZFckNKoXhQduaJIdaBEA";
$UAQixDGrDpKFAjqSIJWQfvgRSUPJHPZiD = "GyhkrYKMvDDEbjvJbrzKEGVVyPURdQ";
$lsLrRczVefePQWsEYpvrKEMpKmDMVihBZEv = "FlUiZRjJqGjPReTGNTgASaEuXOsJPGMgz";
$nKvvmHnMHTkCRgdBqzmavDhFjmrHoAcRde = "egKXfdPPVnCeyNbIUPXYcHNZdtgtDaUwHag";
$ofaZsvdVoIzygdckmSXKbSAsBsAfZNZ = "pcuuhGCjHpNbRkZrdhXLhGdDGYofQCQTW";
$dqKusarYFDnqPuEmjngxFbzDSyrkMwZdT = "bQztplgLtRtvHtPyYGwzNzOnLolnkthASNzctz";

require_once(PATH."/include/config.php");
require_once(PATH."/lib/functions.php");
$time = time();
$db = new DB_MySQL();
$db->connect($config['db_host'], $config['db_user'], $config['db_pw'], $config['prefix'].$config['db_name'], "MySql");
if($time+5 < time())
	exit("Sem resposta do MySQL! Verifique a conexão!");

$run_key = generate_key();
$country = new Country();
include('bbcodes.php');

?>
