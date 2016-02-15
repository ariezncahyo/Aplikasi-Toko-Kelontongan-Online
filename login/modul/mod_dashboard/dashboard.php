<script src="js/highcharts.js" type="text/javascript"></script>
<link type="text/css" href="css/smoothness/jquery-ui-1.8.24.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-ui-1.8.24.custom.min.js"></script>
<script type="text/javascript">
$(function() {
		$( "#periode1" ).datepicker({
				changeMonth: true,
				changeYear: true,
				maxDate : '0',
				dateFormat: "dd-mm-yy"
			});
		$( "#periode2" ).datepicker({
				changeMonth: true,
				changeYear: true,
				maxDate : '0',
				dateFormat: "dd-mm-yy"
			});
		});
var chart1;
var chart2;
$(document).ready(function() {
      chart1 = new Highcharts.Chart({
         chart: {
            renderTo: 'container1',
            type: 'column'
         },   
         title: {
            text: 'Grafik Penjualan Periode <?php echo $_POST['periode1']." s/d ".$_POST['periode2']; ?>'
         },
         xAxis: {
            categories: ['Tanggal']
         },
         yAxis: {
            title: {
               text: 'Pendapatan (Rp.)'
            }
         },
              series:             
            [
            <?php 
        	include "../config/koneksi.php";
			$tgl1 = explode("-",$_POST['periode1']);
			$tgl2 = explode("-",$_POST['periode2']);
			$strtgl1 = $tgl1[2]."-".$tgl1[1]."-".$tgl1[0];
			$strtgl2 = $tgl2[2]."-".$tgl2[1]."-".$tgl2[0];
			$sql2   = "SELECT DATE_FORMAT(tgl_order, '%d-%m-%Y') as tanggal,
                    sum(total) as total
                    FROM orders
                    WHERE tgl_order BETWEEN '$strtgl1' AND '$strtgl2'
					GROUP BY tgl_order";
			$query2 = mysql_query( $sql2 )  or die(mysql_error());
			while ($res = mysql_fetch_array( $query2 )){

				$tanggal=$res['tanggal'];
				$tot=$res['total'];
                  ?>
                  {
                      name: '<?php echo $tanggal; ?>',
                      data: [<?php echo $tot; ?>]
                  },
                  <?php } ?>
            ]
      });
	  chart2 = new Highcharts.Chart({
         chart: {
            renderTo: 'container2',
            type: 'column'
         },   
         title: {
            text: 'Grafik Stok Barang Periode <?php echo $_POST['periode1']." s/d ".$_POST['periode2']; ?>'
         },
         xAxis: {
            categories: ['Produk']
         },
         yAxis: {
            title: {
               text: 'Jumlah Stok Barang'
            }
         },
              series:             
            [
            <?php 
        	include "../config/koneksi.php";
			$tgl1 = explode("-",$_POST['periode1']);
			$tgl2 = explode("-",$_POST['periode2']);
			$strtgl1 = $tgl1[2]."-".$tgl1[1]."-".$tgl1[0];
			$strtgl2 = $tgl2[2]."-".$tgl2[1]."-".$tgl2[0];
			$sql2   = "SELECT nama_produk,stok
                    FROM produk";
			$query2 = mysql_query( $sql2 )  or die(mysql_error());
			while ($res = mysql_fetch_array( $query2 )){

				$nama=$res['nama_produk'];
				$tot=$res['stok'];
                  ?>
                  {
                      name: '<?php echo $nama; ?>',
                      data: [<?php echo $tot; ?>]
                  },
                  <?php } ?>
            ]
      });
   });
</script>
<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['password'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
	$tgl = date('d-m-Y');
   echo "<h2>Dashboard</h2>
          <form method=POST action='?module=dashboard' >
          <table>
          <tr><td>Dari Tanggal</td><td> : <input type=text name='periode1' id='periode1' value='$tgl' ></td></tr>
          <tr><td>s/d Tanggal</td><td> : <input type=text name='periode2' id='periode2' value='$tgl'></td></tr>
          <tr><td colspan=2><input type=submit value=Proses name=btnProses>
          </td></tr>
          </table>
          </form>";
if($_POST['btnProses']){
		echo "<br><div id='container1'></div><br>";
		echo "<br><div id='container2'></div>";
	}
}
?>