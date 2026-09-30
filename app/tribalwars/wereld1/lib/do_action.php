<?php
class do_action{
	var $userid;
	var $hash;
	var $db;
	var $open;

	function do_action($userid){
		global $db;

		$this->hash = generate_key();
		$this->userid = $userid;
		$this->db =  $db;
		$this->open = false;
	}
	function close(){
		// Sollte nicht mehr benutzt werden
	}
	function open(){
		$this->db->query("UPDATE `users` SET `do_action`='' WHERE `id`='".$this->userid."'");
	}
	function close_new(){
		$this->db->query("LOCK TABLES `users` WRITE");
		$this->db->query("UPDATE `users` SET `do_action`='".time()."' WHERE `id`='".$this->userid."' AND `do_action`=''");
		if($this->db->affectedrows()==0){
			$this->db->query("UNLOCK TABLES");
			exit("Impossível executar a ação!");
		}
		$this->db->query("UNLOCK TABLES");
		$this->open = true;
	}
	function open_new(){
	}
}
?>