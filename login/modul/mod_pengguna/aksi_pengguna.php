<?php
session_start();
include "../../../config/koneksi.php";
include "../../../config/library.php";

$module=$_GET[module];
$act=$_GET[act];

if ($module=='pengguna' AND $act=='hapus'){
  mysql_query("DELETE FROM admins WHERE username='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

elseif ($module=='pengguna' AND $act=='input'){
  $pass=md5($_POST[password]);

  mysql_query("INSERT INTO admins
	                       VALUES('$_POST[username]',
                                '$pass',
                                '$_POST[nama_lengkap]',
                                '$_POST[level]')");
								
	
  header('location:../../media.php?module='.$module);
}

elseif ($module=='pengguna' AND $act=='update'){

    mysql_query("UPDATE admins SET username       = '$_POST[username]',
                                  nama_lengkap   = '$_POST[nama_lengkap]',
                                  level          = '$_POST[level]'
                           WHERE  username       = '$_POST[id]'");
		
  header('location:../../media.php?module='.$module);
}

?>
