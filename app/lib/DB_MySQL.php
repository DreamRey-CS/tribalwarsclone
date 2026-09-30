<?php
ignore_user_abort();
class DB_MySQL{
    var $connection;
    var $queries;
    var $ms_querys;

	function connect($host="",$user="",$pass="",$db=""){
		$this->connection = @mysql_connect($host, $user, $pass);
		if(!$this->connection){
			printf('No database connection could be established.<br />Error message: %s', htmlentities(mysql_error()));
			exit;
		}
		if(!@mysql_select_db($db, $this->connection)){
			printf('Cannot select database "%s".<br />Error message: %s', htmlentities($db), htmlentities(mysql_error()));
			exit;
		}
		if(is_resource($this->connection)){
			return true;
		}
	}
	function disconnect(){
		$close = @mysql_close($this->connection);
		$this->connection = NULL;
		$this->queries = 0;
		return $close;
	}
	function query($query,$show_error=true){
		// Eski modüller dinamik SELECT listelerini bazen ", FROM" ile
		// bitiriyordu. Bu, butonların tamamını patlatan sentaks hatasıdır;
		// sorguyu çalıştırmadan önce güvenli biçimde temizle.
		$query = preg_replace('/,\s+(FROM|from)\b/', ' $1', $query);
		if(!defined('FILTER_LOCKTABLES') || FILTER_LOCKTABLES){
			$pos = strpos(strtoupper($query), 'LOCK TABLES');
			if($pos !== FALSE && $pos < 3){
				return NULL;
			}
		}
		if($show_error){
			$result = @mysql_query($query, $this->connection);
			if(!$result){
				printf('Failing SQL: %s<br />Error: %s', htmlentities($query), htmlentities(mysql_error($this->connection)));
				exit;
			}
		}
		return $result;
	}
	function unb_query($query,$show_error=true){
		if($show_error){
			$result = @mysql_unbuffered_query($query, $this->connection);
			if(!$result){
				printf('Failing SQL: %s<br />Error: %s', htmlentities($query), htmlentities(mysql_error($this->connection)));
				exit;
			}
		}
		return $result;
	}
	function numqueries(){
		return $this->queries;
	}
	function write_ms(){
		foreach($this->ms_querys as $query){
			@mysql_query($this->ms_querys);
		}
	}
	function lasterror(){
		return mysql_error();
	}
	function affectedrows(){
		return @mysql_affected_rows();
	}
	function __destruct(){
        self::disconnect();
	}
	function fetch($result,$fetchmode=""){
		if(is_resource($result)){
			if(isset($fetchmode)){
				return mysql_fetch_assoc($result);
			}else{
				return mysql_fetch_array($result);
            }
        }
    }
	function freeresult($result){
		return @mysql_free_result($result);
	}
	function numrows($result){
		$rows = @mysql_num_rows($result);
		return $rows ? $rows : 0;
	}
	function getlastid(){
		return @mysql_insert_id($this->connection);
	}
}
?>
