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
		if ($this->lang == 'TR' && !file_exists($filename)) {
			$filename = $this->path . 'EN.ini';
		}
		$cachedata = $path.'.cachedata';
		$cachearray = $path.'.cachearray';
                
		if (!file_exists($filename)) {
			printf('[Language] Error: language file %s does not exist! (%s missing)', htmlentities($this->lang), htmlentities($filename));
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
		return sprintf('[Language] Missing translation: %s(%s)', htmlentities($this->section), htmlentities($varname));
		}
		return $this->translate($this->parsed[$this->section][$varname]);
	}
	
	function grab($section, $varname) {
		if (!$this->exists($section, $varname)) {
			return sprintf('[Language] Missing translation: %s[%s]', htmlentities($section), htmlentities($varname));
		}
		return $this->translate($this->parsed[$section][$varname]);
	}

	function translate($text) {
		if ($this->lang != 'TR') return $text;
		$map = array('Overview'=>'Genel Bakış','Reports'=>'Raporlar','Messages'=>'Mesajlar','Tribe'=>'Kabile','Tribes'=>'Kabileler','Ranking'=>'Sıralama','Notes'=>'Notlar','Settings'=>'Ayarlar','Logout'=>'Çıkış','Combined'=>'Birleşik','Production'=>'Üretim','Troops'=>'Birlikler','Commands'=>'Komutlar','Incomings'=>'Gelenler','All'=>'Tümü','Attacks'=>'Saldırılar','Defense'=>'Savunma','Market'=>'Pazar','Support'=>'Destek','Players'=>'Oyuncular','Profile'=>'Profil','Members'=>'Üyeler','Diplomacy'=>'Diplomasi','HoÅŸ geldin'=>'Hoş geldin','Options'=>'Seçenekler','Invites'=>'Davetler','Forum'=>'Forum','Holiday'=>'Tatil','Change Password'=>'Şifre Değiştir','My Account'=>'Hesabım','Cancel'=>'İptal','Construct'=>'İnşa et','Demolish'=>'Yık','Wood'=>'Odun','Iron'=>'Demir','Stone'=>'Kil','Buildings'=>'Binalar','Requirements'=>'Gereksinimler','Build'=>'İnşa','Completed'=>'Tamamlandı','Help'=>'Yardım','Minute'=>'Dakika','Hour'=>'Saat','New Message'=>'Yeni mesaj','Send Message'=>'Mesaj gönder','Archive'=>'Arşiv','Write Message'=>'Mesaj yaz','Logged In'=>'Giriş yapıldı','Browser Game'=>'Tarayıcı Oyunu','TribalWars'=>'Tribe Rush');
		return isset($map[$text]) ? $map[$text] : $text;
	}
	
	function exists($section, $varname) {
		return isset($this->parsed[$section][$varname]);
	}
}

?>
