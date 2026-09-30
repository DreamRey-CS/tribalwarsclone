<?php
class aLang {
	var $section = "";
	var $lang = "";
	var $path = "";
	var $parsed = array();

	function aLang($section, $language, $path = "") {
            $this->path = PATH . "/lang/";
            $this->section = $section;
            $this->lang = $language;
		
            if($path) {
				$this->path = $path;
            }
            return $this->parse();
	}
	
	function parse() {
		$path = $this->path . $this->lang;
		$filename = $path.'.ini';
		// The original package has EN/PT only. Turkish uses the complete EN key
		// set as a fallback; visible common labels are translated below.
		if ($this->lang == 'TR' && !file_exists($filename)) {
			$filename = $this->path . 'EN.ini';
		}
		$cachedata = $path.'.cachedata';
		$cachearray = $path.'.cachearray';
                
		if (!file_exists($filename)) {
			printf('[Dil] %s dil dosyası bulunamadı: %s', htmlentities($this->lang), htmlentities($filename));
			exit;
		}
                
		$current_size = filesize($filename);
		if (file_exists($cachedata) && file_exists($cachearray)) {
			$cachesize = file_get_contents($cachedata);
			if ($current_size == $cachesize) {
				$decoded = base64_decode(file_get_contents($cachearray));
				$this->parsed = unserialize($decoded);
			}
			else {
				$this->reparse($filename);
			}
		}
		else {
			$this->reparse($filename);
		}
		return true;
	}
	
	function reparse($fname) {
		$path = $this->path . $this->lang;
		$this->parsed = parse_ini_file($fname, true);
		$ini_size = filesize($fname);
                
		if ($fp = @fopen($path.'.cachedata', 'w+')) {
			fwrite($fp, $ini_size);
			fclose($fp);
		}
		if ($fp = @fopen($path.'.cachearray', 'w+')) {
			fwrite($fp, base64_encode(serialize($this->parsed)));
			fclose($fp);
		}
	}
	
	function get($varname) {
	if (!$this->exists($this->section, $varname)) {
		return sprintf('%s(%s) için Türkçe çeviri bulunamadı.', htmlentities($this->section), htmlentities($varname));
		}
		return $this->translate($this->parsed[$this->section][$varname]);
	}
	
	function grab($section, $varname) {
		if (!$this->exists($section, $varname)) {
			return sprintf('%s[%s] için Türkçe çeviri bulunamadı.', htmlentities($section), htmlentities($varname));
		}
		return $this->translate($this->parsed[$section][$varname]);
	}

	function translate($text) {
		if ($this->lang != 'TR') return $text;
		$map = array('Overview'=>'Genel Bakış','Reports'=>'Raporlar','Messages'=>'Mesajlar','Settings'=>'Ayarlar','Logout'=>'Çıkış','Ranking'=>'Sıralama','Players'=>'Oyuncular','Profile'=>'Profil','Support'=>'Destek','Browser Game'=>'Tarayıcı Oyunu','Browser game'=>'Tarayıcı Oyunu','TribalWars'=>'Tribe Rush','Ana Sayfa'=>'Ana Sayfa','Kurallar'=>'Kurallar','Tribe'=>'Kabile','Help'=>'Yardım','Statistics'=>'İstatistikler','Forum'=>'Forum','Login'=>'Giriş','Register'=>'Kayıt Ol','Username'=>'Kullanıcı adı','Password'=>'Şifre','Forgot password'=>'Şifremi unuttum','Hoş geldin'=>'Hoş geldin','HoÅŸ geldin'=>'Hoş geldin','Close'=>'Kapat','Kullanıcı Bilgisi'=>'Kullanıcı Bilgisi','KullanÄ±cÄ± Bilgisi'=>'Kullanıcı Bilgisi','Register Now'=>'Şimdi Kayıt Ol','Premium Puan'=>'Premium Puan','Email'=>'E-posta','IP Adresi'=>'IP Adresi','Title'=>'Ünvan','Rank'=>'Sıra','Zaferler'=>'Zaferler','Kayıt tarihi'=>'Kayıt tarihi','KayÄ±t tarihi'=>'Kayıt tarihi','Güvenlik kodu'=>'Güvenlik kodu','GÃ¼venlik kodu'=>'Güvenlik kodu','Yükleme süresi'=>'Yükleme süresi','YÃ¼kleme sÃ¼resi'=>'Yükleme süresi','Sunucu saati'=>'Sunucu saati','Tüm hakları saklıdır'=>'Tüm hakları saklıdır','TÃ¼m haklarÄ± saklÄ±dÄ±r'=>'Tüm hakları saklıdır','Description'=>'Açıklama','News'=>'Haberler','There are'=>'Kayıtlı oyuncu sayısı:','Players online'=>'Çevrimiçi oyuncu');
		return isset($map[$text]) ? $map[$text] : $text;
	}
	
	function exists($section, $varname) {
		return isset($this->parsed[$section][$varname]);
	}
}

?>
