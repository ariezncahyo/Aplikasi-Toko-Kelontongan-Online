<?php

$aksi="modul/mod_pengguna/aksi_pengguna.php";
switch($_GET[act]){
  // Tampil User
  default:
    echo "<h2>Data Pengguna</h2>";
	if ($_SESSION[level]=='admin'){
    echo"      <input type=button value='Tambah Pengguna' onclick=\"window.location.href='?module=pengguna&act=tambahuser';\">";
	}
	echo"
          <table>
          <tr><th>no</th><th>Username</th><th>Nama Lengkap</th><th>Level</th>";
    if ($_SESSION[level]=='admin'){	
	echo"<th>aksi</th>"; 
    }

   $tampil=mysql_query("SELECT * FROM admins ORDER BY username");
   
    $no=1;
    while ($r=mysql_fetch_array($tampil)){
       echo "</tr><tr><td>$no</td>
             <td>$r[username]</td>
             <td>$r[nama_lengkap]</td>
			 <td>$r[level]</td>
		     <td><a href=?module=pengguna&act=edituser&id=$r[username]>Edit</a> | 
	  <a href=$aksi?module=pengguna&act=hapus&id=$r[username]>Hapus</a></td>
	  </tr>";
      $no++;
    }
    echo "</table>";
	echo "<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>";
    break;
  
  case "tambahuser":
    echo "<h2>Tambah Pengguna</h2>
          <form method=POST name='text_form' action=$aksi?module=pengguna&act=input >
          <table>
		  <tr><td>Nama Lengkap</td> <td> : <input type=text name='nama_lengkap' size=30></td></tr>
          <tr><td>Username</td>     <td> : <input type=text name='username'></td></tr>
          <tr><td>Password</td>     <td> : <input type=password name='password'></td></tr>
            <tr><td>Level</td> <td> : <select name=level ></option>";
			$arr=array( "admin", 
						"pemilik" );
			foreach ($arr as $arrdata) {
				echo "<option value='$arrdata'"; if($r[level]==$arrdata) echo "selected";
				echo ">$arrdata</option>";                   
            }
			echo "</select></td></tr>
          <tr><td colspan=2><input type=submit value=Simpan>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
     break;
    
  case "edituser":
    $edit=mysql_query("SELECT * FROM admins WHERE username='$_GET[id]'");
    $r=mysql_fetch_array($edit);

    echo "<h2>Edit Pengguna</h2>
          <form method=POST name='text_form' action=$aksi?module=pengguna&act=update >
          <input type=hidden name=id value='$r[username]'>
          <table>
		  <tr><td>Nama Lengkap</td> <td> : <input type=text name='nama_lengkap' size=30  value='$r[nama_lengkap]'></td></tr>
          <tr><td>Username</td>     <td> : <input type=text name='username' value='$r[username]'></td></tr>
         <tr><td>Level</td> <td> : <select name=level ></option>";
			$arr=array( "admin", 
						"pemilik" );
			foreach ($arr as $arrdata) {
				echo "<option value='$arrdata'"; if($r[level]==$arrdata) echo "selected";
				echo ">$arrdata</option>";                   
            }
			echo "</select></td></tr>
          ";
    
    echo "
          <tr><td colspan=2><input type=submit value=Update>
                            <input type=button value=Batal onclick=self.history.back()></td></tr>
          </table></form>";
    break;  
	
}

?>
