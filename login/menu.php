<?php
include "../config/koneksi.php";

if ($_SESSION[level]=='admin'){
  $sql=mysql_query("select * from modul where status='admin' and aktif='Y' order by urutan");
}
else{
  $sql=mysql_query("select * from modul where status='pemilik' and aktif='Y' order by urutan"); 
} 
while ($m=mysql_fetch_array($sql)){  
  echo "<li><a href='$m[link]'>&#187; $m[nama_modul]</a></li>";
}
?>
