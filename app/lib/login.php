<?php
require_once("GetUserData.php");
class login{
	var $sid;

	function login_js($username, $password){
		global $db;		

		$datas_cl = new getuserdata();
		$needed_datas = array("id","username","password","banned");
		$datas = $datas_cl->getbyusername(parse($username), $needed_datas);
		if($datas['exist_user'] == "0"){
		    return '{"message":"Bu kullanıcı hesabı bulunamadı.","type":"error","sms":"username"}';
		}elseif($datas['password'] != md5(crc32(md5(sha1(md5($password)))))){
		    return '{"message":"Şifre hatalı.","type":"error","sms":"password"}';
		}elseif($datas['banned'] == "Y"){
		    return '{"message":"Bu hesap yasaklanmış.","type":"error","sms":"username"}';
		}
		$sid = new sid();
        $sid = $sid->create_sid($datas['id']);
        $db->query("INSERT INTO `logins` (`username`,`time`,`ip`,`userid`) VALUES ('".$datas['username']."','".time()."','".$_SERVER['REMOTE_ADDR']."','".$datas['id']."')");
		return $datas['id'];
	}
	function login_do($username,$password){
		global $db;

		$datas_cl = new getuserdata();
		$needed_datas = array("id","username","password","banned");
		$datas = $datas_cl->getbyusername(parse($username), $needed_datas);
		if($datas['exist_user'] == "0"){
			return "Bu kullanıcı hesabı bulunamadı.";
		}elseif($datas['password'] != md5($password)){
			return "Şifre hatalı.";
		}elseif($datas['banned'] == "Y"){
			return "Bu hesap yasaklanmış.";
		}
		$sid = new sid();
        $sid = $sid->create_sid($datas['id']);
        $db->query("INSERT INTO `logins` (`username`,`time`,`ip`,`userid`) VALUES ('".$datas['username']."','".time()."','".$_SERVER['REMOTE_ADDR']."','".$datas['id']."')");
		return $datas['id'];
	}
	function login_uv($id){
		global $db;

		$datas_cl = new getuserdata();
		$needed_datas = array("id","username","banned","vacation_id","vacation_name","vacation_accept");
		$datas = $datas_cl->getbyid($id, $needed_datas);
		$sid = parse($_COOKIE['session']);
		$res = $db->query("SELECT `userid` FROM `sessions` WHERE `sid`='".$sid."'");
		$row = $db->fetch($res);
		if($row['userid'] != $datas['vacation_id'] || $datas['vacation_accept'] == 0){
			return "Tatil vekâleti zaten sona ermiş!";
		}elseif($datas['exist_user'] == "0"){
			return "Bu kullanıcı hesabı bulunamadı.";
		}elseif($datas['banned'] == "Y"){
			return "Bu hesap yasaklanmış.";
		}else{
			$sid = new sid();
			$sid = $sid->create_sid($datas['id'], true);
			$db->query("INSERT INTO `logins` (`username`,`time`,`ip`,`userid`,`uv`) VALUES ('".$datas['username']."','".time( )."','".$_SERVER['REMOTE_ADDR']."','".$datas['id']."','".$datas['vacation_name']."')");
			return $datas['id'];
		}
	}
}

?>
