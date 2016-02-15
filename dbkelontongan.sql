-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 07. September 2013 jam 15:09
-- Versi Server: 5.1.41
-- Versi PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbkelontongan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `level`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin'),
('juragan', '016c0c3034782da5bc946561094f3aa6', 'juragan', 'pemilik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
  `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_hubungi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=17 ;

--
-- Dumping data untuk tabel `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `nama`, `email`, `subjek`, `pesan`, `tanggal`) VALUES
(16, 'codet', 'codet@yahoo.com', 'hello masbro', 'hello masbro saya mau anu', '2013-09-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `kategori_seo`) VALUES
(1, 'Makanan', 'makanan'),
(2, 'Minuman', 'minuman'),
(3, 'Perawatan', 'perawatan'),
(4, 'Kesehatan', 'kesehatan'),
(5, 'Kebutuhan Bayi', 'kebutuhan-bayi'),
(6, 'Perlengkapan Rumah & Dapur', 'perlengkapan-rumah--dapur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `id_kota` int(3) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(1, 'Kota Tasikmalaya', 4500),
(2, 'Kab. Tasikmalaya', 5000),
(3, 'Kota Banjar', 5500),
(4, 'Kab. Ciamis', 5000),
(5, 'Kab. Pangandaran', 6000),
(6, 'Bandung', 7000),
(7, 'Jakarta', 9000),
(8, 'Lainnya', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `status` enum('pemilik','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=58 ;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `status`, `aktif`, `urutan`) VALUES
(18, 'Produk', '?module=produk', '', '', 'admin', 'Y', 4),
(42, 'Penjualan', '?module=order', '', '', 'admin', 'Y', 5),
(31, 'Kategori Produk', '?module=kategori', '', '', 'admin', 'Y', 3),
(43, 'Profil', '?module=profil', '<p>\r\n<strong>PD. Maju Jaya Sentosa - </strong>menjual berbagai jenis barang kebutuhan rumah tangga dengan harga bersaing.\r\n</p>\r\n<p>\r\nHubungi kontak kami berikut ini :\r\n</p>\r\n<p>\r\nAlamat : Jl. Awipari No. 255\r\n</p>\r\n<p>\r\nNo. Telp : 085223123456&nbsp;\r\n</p>\r\n', 'logo.png', 'admin', 'Y', 7),
(44, 'Hubungi Kami', '?module=hubungi', '', '', 'admin', 'Y', 9),
(45, 'Cara Pembelian', '?module=carabeli', '<ol><li>Klik pada tombol&nbsp;<span style="font-weight: bold;">Beli</span> pada produk yang ingin Anda pesan.</li><li>Produk yang Anda pesan akan masuk ke dalam <span style="font-weight: bold;">Keranjang Belanja</span>. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom <span style="font-weight: bold;">Jumlah</span>, kemudian klik tombol <span style="font-weight: bold;">Update</span>. Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol Kali yang berada di kolom paling kanan.</li><li>Jika sudah selesai, klik tombol <span style="font-weight: bold;">Selesai Belanja</span>, maka akan tampil form untuk pengisian data kustomer/pembeli.</li><li>Setelah data pembeli selesai diisikan, klik tombol <span style="font-weight: bold;">Proses</span>, maka akan tampil data pembeli beserta produk yang dipesannya (jika diperlukan catat nomor ordersnya). Dan juga ada total pembayaran serta nomor rekening pembayaran.</li><li>Apabila telah melakukan pembayaran, maka produk/barang akan segera kami kirimkan. <br></li></ol>', 'gedung.jpg', 'admin', 'Y', 8),
(48, 'Ongkos Kirim', '?module=ongkoskirim', '', '', 'admin', 'Y', 6),
(57, 'Dashboard', '?module=dashboard', '', '', 'pemilik', 'Y', 10),
(52, 'Laporan', '?module=laporan', '', '', 'pemilik', 'Y', 11),
(56, 'Data Pengguna', '?module=pengguna', '', '', 'admin', 'Y', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kustomer` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kota` int(3) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_orders`, `nama_kustomer`, `alamat`, `telpon`, `email`, `status_order`, `tgl_order`, `jam_order`, `id_kota`, `total`) VALUES
(1, 'codet', 'awipari', '123456789', 'codet@yahoo.com', 'Lunas', '2013-09-04', '14:55:31', 5, 75500),
(2, 'dodet', 'ciamis', '3344234', 'dodet@yahoo.com', 'Lunas', '2013-09-05', '14:59:39', 4, 309500),
(3, 'rodet', 'karang nunggal', '232323', 'rodet@yahoo.com', 'Lunas', '2013-09-06', '15:00:24', 2, 369800),
(4, 'rodek', 'parigi', '676767', 'rodek@yahoo.com', 'Lunas', '2013-09-07', '15:01:04', 5, 130600),
(5, 'godeg', 'bandung', '8989898', 'godeg@yahoo.com', 'Lunas', '2013-09-01', '15:03:59', 6, 288000),
(6, 'codek', 'jakarta', '8978787', 'codek@yahoo.com', 'Lunas', '2013-09-02', '15:04:52', 7, 127500),
(7, 'dodek', 'pangandaran', '231213', 'dodek@yahoo.com', 'Lunas', '2013-09-03', '15:05:37', 5, 319000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(1, 12, 2),
(1, 17, 5),
(2, 9, 5),
(3, 1, 2),
(4, 7, 2),
(5, 16, 10),
(6, 12, 3),
(6, 14, 5),
(7, 11, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=119 ;

--
-- Dumping data untuk tabel `orders_temp`
--


-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `produk_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `produk_seo`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`) VALUES
(1, 5, 'NUTRILON ROYAL 3 VAN 800G', 'nutrilon-royal-3-van-800g', '<div>\r\nNama Produk: Nutrilon Royal 3 Vanilla Tin 800g\r\n</div>\r\n<div>\r\nBrand Produk: Nutrilon\r\n</div>\r\n<div>\r\nBerat Kotor: 1.06 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 13.00cm X 14.50cm X 13.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nNutrilon Royal 3 adalah susu bubuk untuk anak usia 1-3 tahun dengan dua pilihan rasa, madu dan vanila yang disukai anak. Nutrilon Royal 3 adalah susu bubuk tanpa penambahan sukrosa. Nutrilon Royal 3 dengan prebiotik Frukto Oligo Sakarida (FOS) dan Galakto Oligo Sakarida (GOS. Prebiotik FOS dan GOS untuk membantu mempertahankan fungsi saluran cerna. Nutrilon Royal 3 dengan nutrisi penting seperti karbohidrat, lemak, protein, 12 vitamin dan 8 mineral. Nutrilon Royal 3 dengan Selenium, Vitamin C dan Vitamin E. Vitamin C berperan sebagai antioksidan yang bekerja bersama dengan antioksidan lain terutama Vitamin E. Nutrilon Royal 3 dengan kalsium yang berperan dalam pembentukan tulang dan mempertahankan kepadatan tulang dan gigi apabila disertai dengan latihan fisik yang teratur dan konsumsi gizi yang seimbang. Dengan zat besi yang membantu mencegah dan mengatasi anemia defisiensizat besi. BPOM RI MD 507009413040\r\n</div>\r\n', 184900, 48, '1.06', '2013-09-06', '27nutrilon_royal.jpg', 3),
(2, 5, 'BEBELOVE 2 800 GR DH', 'bebelove-2-800-gr-dh', '<div>\r\nNama Produk: Bebelove 2 800 gr DH\r\n</div>\r\n<div>\r\nBrand Produk: Bebelove\r\n</div>\r\n<div>\r\nBerat Kotor: 1.05 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 13.50cm X 14.70cm X 13.50cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nBebelove 2 adalah formula lanjutan yang bergizi untuk bayi usia 6-12 bulan, tanpa penambahan gula pasir. Bebelove 2 dengan komposisi karbohidrat, lemak, protein, vitamin dan mineral yang telah disesuaikan dengan kebutuhan bayi usia 6-12 bulan. Nutrisi makro dan mikro yang terkandung dalam Bebelove 2 dapat membantu pertumbuhan bayi anda. Komposisi: Susu bubuk skim, whey protein yang telah didemineralisasi, minyak nabati, konsentrat whey protein, laktosa, dekstrosa, galakto oligosakarida, mineral, frukto oligokasarida, fosfolipid , minyak ikan (DHA), vitamin, minyak sel tunggal (AA), kolin klorida, taurin, L-karnitin, mio inositol.BPOM RI MD 510309322040\r\n</div>\r\n', 116900, 20, '1.05', '2013-09-06', '23bebelove_2_800_gr.jpg', 1),
(3, 5, 'BEBELOVE 1 1800G', 'bebelove-1-1800g', '<div>\r\nNama Produk: Bebelove 1 1800g\r\n</div>\r\n<div>\r\nBrand Produk: Bebelove\r\n</div>\r\n<div>\r\nBerat Kotor: 2.25 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 11.00cm X 24.50cm X 19.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi: Whey protein yang telah didemineralisasi, minyak nabati, lakosa, susu bubuk skim, konsentrat whey protein, galakto oligosakarida, mineral, vitamin, fosfolipid, frukto oligosakarida, minyak ikan (DHA), minyak sel tunggal (AA), kolin klorida, taurin, L-karnitin, mio inositol.BPOM RI MD 510409334040\r\n</div>\r\n', 269900, 13, '2.25', '2013-09-06', '71bebelove_1_1800_gr.jpg', 3),
(4, 4, 'Wellness Ginko Formula 60', 'wellness-ginko-formula-60', '<div>\r\nNama Produk: Wellness Ginko Formula 60 capsules\r\n</div>\r\n<div>\r\nBrand Produk: Wellness\r\n</div>\r\n<div>\r\nBerat Kotor: 77.00 g\r\n</div>\r\n<div>\r\nDimensi Produk: 6.50cm X 6.00cm X 12.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMelancarkan sirkulasi darah keseluruh tubuh termasuk ke otak dan kapiler, melindungi saraf-saraf dan meningkatkan suplai oksigen ke otak,mencegah penggumpalan darah, memperbaiki fungsi mental,mood,memori,konsentrasi,attention,daya ingat dan daya pikir (cegah kepikunan),membantu mengatasi penyakit Alzheimer dan mengurangi kecemasan yg terjadi, menjaga kesehatan jantung &amp; ginjal, membantu mengatasi ginjal &amp; vertigo.Komposisi : Ginkgo Biloba Extract 60mg, Natutral Vitamin E (d-alpha tocopheryl) 20 I.U., Lecithin (soya) 100mg, microcrystalline cellulose, silica, vegetable glycerin, purified water.Dosis : 1kapsul/hr sesudah makanPOM SI 074325171\r\n</div>\r\n', 190000, 10, '0.77', '2013-09-06', '92ginko_formula_60_capsules_back.jpg', 1),
(5, 4, 'Ever Joy 2 pcs Capsul', 'ever-joy-2-pcs-capsul', '<div>\r\nNama Produk: Ever Joy 2 pcs Capsul\r\n</div>\r\n<div>\r\nBrand Produk: Ever Joy\r\n</div>\r\n<div>\r\nBerat Kotor: 6.60 g\r\n</div>\r\n<div>\r\nDimensi Produk: 1.00cm X 8.00cm X 6.00cm\r\n</div>\r\n<div>\r\n&nbsp;\r\n</div>\r\n<div>\r\nMemulihkan stamina pria, gairah seksual dan meningkatkan keharmonisan kebahagiaan rumah tangga. Mengandung Epimedium Extract, Korean Ginseng, Curcuma Xanthorrhiza Extract (Rimpang/Temulawak), Morinda Citrifolia Extract (Pace / Mengkudu), Cola Nictida Extract (Cola) dan dengan tambahan vitamin sebagai supplemen stamina pria agar tetap stabil.Aturan pemakai : 1 kapsul per hariKontra indikasi : penderita penyakit hati dan ginjal. Efek samping : dapat menyebabkan kecemasan, insomnia.POM SD 031311031\r\n</div>\r\n', 38900, 45, '0.06', '2013-09-06', '24ever_joy_2s_kapsul_front_image_1.jpg', 1),
(6, 1, 'PRONAS DAGING RENDANG 180G', 'pronas-daging-rendang-180g', '<div>\r\nNama Produk: Pronas Daging Rendang 180g\r\n</div>\r\n<div>\r\nBrand Produk: Pronas\r\n</div>\r\n<div>\r\nBerat Kotor: 246.40 g\r\n</div>\r\n<div>\r\nDimensi Produk: 26.50cm X 35.50cm X 10.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi : Daging sapi, kentang, santan kelapa, minyak kelapa sawit, bumbu, garam, gula, penguat rasa mononatrium glutamat.BPOM RI MD 514922036011\r\n</div>\r\n', 20000, 200, '0.25', '2013-09-07', '31pronas_daging_rendang.jpg', 1),
(7, 1, 'INDOMIE KARI AYAM X 40 PCS', 'indomie-kari-ayam-x-40-pcs', '<div>\r\nNama Produk: Indomie Kari Ayam Bawang Goreng 72g x 40 Pcs\r\n</div>\r\n<div>\r\nBrand Produk: Indomie\r\n</div>\r\n<div>\r\nBerat Kotor: 3.34 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 36.00cm X 19.00cm X 23.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi Mie: Tepung terigu, minyak sayur, tepung tapioka, garam, pemantap, pengatur keasaman, mineral (zat besi) , pewarna (tartrazine Cl19140), antioksidan (TBHQ).Komposisi Bumbu: Garam, gula, penguat rasa mononatrium glutamat (MSG), bubuk kari (mengandung penguat rasa dinatrium guanilat dan inosinat), bubuk bawang putih, perisa ayam (mengandung penguat rasa dinatrium guanilat dan inosinat, antioksidan alfa tokoferol), bubuk lada, rempah-rempah, vitamin (A, B1, B6, B12, Niasin, Asam Folat, Pantotenat) dan bubuk cabe.Minyak: Minyak sayur dan bumbu kari.Bawang Goreng : mengandung antioksidan (TBHQ).BPOM RI MD 227209506185\r\n</div>\r\n', 65300, 98, '3.34', '2013-09-07', '28indomie_kari_ayam_bawang_goreng_72g-.jpg', 3),
(8, 1, 'INDOMIE EMPAL GENTONG 75G', 'indomie-empal-gentong-75g', '<div>\r\nNama Produk: Indomie Mie Instant Rasa Empal Gentong 75g x 40 Pcs\r\n</div>\r\n<div>\r\nBrand Produk: Indomie\r\n</div>\r\n<div>\r\nBerat Kotor: 3.47 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 34.00cm X 20.50cm X 24.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi Mie: Tepung terigu, minyak sayur, tepung tapioka, garam, pemantap, pengatur keasaman, mineral (zat besi) , pewarna (tartrazine Cl19140), antioksidan (TBHQ).Komposisi Bumbu: Garam, gula, penguat rasa mononatrium glutamat (MSG), perisa sapi, bubuk bawang putih, bubuk bawang merah, bubuk lada, vitamin (A, B1, B6, B12, Niasin, Asam folat, Pantotenat), dan bubuk cabe.Minyak: Minyak sayur dan bumbu empal.Bawang Goreng.BPOM RI MD 227209342185\r\n</div>\r\n', 70900, 50, '3.47', '2013-09-07', '40indomie_empal_gentong_75gr_front__image_1.jpg', 1),
(9, 1, 'INDOMIE SAYURAN VEGAN 75G', 'indomie-sayuran-vegan-75g', '<div>\r\nNama Produk: Indomie Mie Instant Rasa Sup Sayuran Vegan 75g x 40 Pcs\r\n</div>\r\n<div>\r\nBrand Produk: Indomie\r\n</div>\r\n<div>\r\nBerat Kotor: 3.50 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 30.50cm X 20.50cm X 10.50cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi Mie: Tepung terigu, minyak sayur, tepung tapioka, garam, pemantap, pengatur keasaman, mineral (zat besi) , pewarna (tartrazine Cl19140), antioksidan (TBHQ).Komposisi Bumbu: Garam, gula, penguat rasa mononatrium glutamat (MSG), ekstrak ragi, bubuk lada, daun seledri, vitamin (A, B1, B6, B12, Niasin, Asam folat, Pantotenat), dan bubuk cabe.Minyak: Minyak sayur dan minyak wijen.BPOM RI MD 227209580185\r\n</div>\r\n', 61900, 145, '3.50', '2013-09-07', '34indomie_sup_sayuran_vegetarian_75gr_front__1.jpg', 6),
(10, 2, 'MILO ACTIGEN-E BIB 600G', 'milo-actigene-bib-600g', '<div>\r\nNama Produk: Milo Actigen-E BIB 600g\r\n</div>\r\n<div>\r\nBrand Produk: Milo\r\n</div>\r\n<div>\r\nBerat Kotor: 764.50 g\r\n</div>\r\n<div>\r\nDimensi Produk: 5.50cm X 25.50cm X 16.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nKomposisi : Sari Malt, Gula, Susu Bubuk Skim, Minyak nabati, Bubuk Kakao, Mineral, Premiks Vitamin, Vanilin.BPOM RI MD 849913047212\r\n</div>\r\n', 49200, 74, '0.76', '2013-09-07', '14milo_actigen_e_bib_600gr_front.jpg', 2),
(11, 2, 'HILO SCHOOL CHOCOLATE 500G', 'hilo-school-chocolate-500g', '<div>\r\nNama Produk: HiLo School Chocolate 500g\r\n</div>\r\n<div>\r\nBrand Produk: HiLo\r\n</div>\r\n<div>\r\nBerat Kotor: 622.60 g\r\n</div>\r\n<div>\r\nDimensi Produk: 7.00cm X 20.00cm X 14.00cm\r\n</div>\r\n<div>\r\nWarning: Tidak cocok untuk bayi\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHiLo susu dengan 10 vitamin dan 8 mineral yang tinggi kalsium dan rendah lemak, membantu memenuhi nutrisi selama masa pertumbuhan dan aktifitas kamu. HiLo school kini dilengkapi dengan alga merah. Nikmati kelezatan HiLo School rasa Coklat dan VegiBeri.Komposisi: susu bubuk skim, sukrosa, maltodekstrin, susu bubuk full krim, bubuk coklat, premiks vitamin &amp; mineral, krimer nabati, ekstra malt, asam lemak omega 3, perisa coklat, kolin, alga merah.Diproduksi oleh : PT Nutrifood Indonesia.BPOM RI MD 807010663007\r\n</div>\r\n', 63800, 75, '0.62', '2013-09-07', '64hilo_school_cho_500gr_front.jpg', 6),
(12, 2, 'FRISIAN FLAG CAIR 190ML', 'frisian-flag-cair-190ml', '<div>\r\nNama Produk: Frisian Flag Cair Chocolate 190ml x 4 Pieces\r\n</div>\r\n<div>\r\nBrand Produk: Frisian Flag\r\n</div>\r\n<div>\r\nBerat Kotor: 961.40 g\r\n</div>\r\n<div>\r\nDimensi Produk: 11.00cm X 12.00cm X 11.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMinuman susu steril cokelat.Dilengkapi dengan protein, vitamin B1, kalsium, dan susu segar.Komposisi : susu sapi segar, sukrosa, susu bubuk skim, bubuk cokelat, lemak susu, penstabil nabati, perisa cokelat, dan vitamin (A, B1, B6 dan D3).Isi 4 botol.BPOM RI MD 206409026031\r\n</div>\r\n', 11000, 40, '0.96', '2013-09-07', '57frisian_flag_cair_chocolate_4_x_190ml-_back.jpg', 6),
(13, 3, 'CLEAR HAIR STYLING CREAM', 'clear-hair-styling-cream-250-gr', '<div>\r\nNama Produk: Clear Hair Styling Cream 250 gr\r\n</div>\r\n<div>\r\nBrand Produk: Clear\r\n</div>\r\n<div>\r\nBerat Kotor: 327.80 g\r\n</div>\r\n<div>\r\nDimensi Produk: 8.00cm X 8.00cm X 7.50cm\r\n</div>\r\n<div>\r\nWarning:\r\n</div>\r\n<div>\r\nHindari kontak dengan mata\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nClear by Brisk Hair Styling Cream kini hadir dengan kemasan baru. Mengandung ZPT yang dikenal sebagai bahan anti ketombe, membuat rambut rapi dan tampak sehat berkilau. Ingredients : Water, Mineral Oil, Ceteareth-6, Stearyl Alcohol, Carbomer, Perfume, Phenoxyethanol, Trideceth-12, Potassium Hydroxide, BHT, Zinc Phyrithione, Methylisothialinone, Panthenol, CI 42090BPOM CA 18081005206&#39;\r\n</div>\r\n', 13000, 35, '0.32', '2013-09-07', '6clear_styling_cream_250gr_front_image_1.jpg', 1),
(14, 3, 'ZINC SHAMPOO BLACK SHINE', 'zinc-shampoo-black-shine', '<div>\r\nNama Produk: (D)Zinc Shampoo Black Shine 270ml\r\n</div>\r\n<div>\r\nBrand Produk: Zinc\r\n</div>\r\n<div>\r\nBerat Kotor: 363.00 g\r\n</div>\r\n<div>\r\nDimensi Produk: 4.50cm X 20.00cm X 6.50cm\r\n</div>\r\n<div>\r\nWarning:\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nHindari kontak dengan mata, bilas dengan air sampai bersih bila terjadi kontak dengan mata.\r\n</div>\r\n<div>\r\nZinc shampoo dengan Complex ZPT-O, efektif mengurangi ketombe, bantu mencegahnya muncul kembali dan kulit kepala pun tetap sehat. Hydro-Vita Lock jadikan rambut tetap sehat, halus, lembut dan terjaga kelembabannya. Komposisi : water, sodium laureth sulfate, cocamidopropyl betaine, dimethiconol, glycol stearate, sodium sulfate, acrylates / stearath-20 methacrylate copolymer, zinc pyrithione, perfume, sodium benzoate, d-panthenol, guar hydroxypropyltrimonium chloride, polyquaternium-10, sophora angustifolia extract, citric acid, sodium hydroxide, hexylene glycol, eclipta alba extract, promois silk-1000, 1000P, 700SP, CI42090, CI16255, CI14720, CI19140, methylchloroisothiazolinone, methylisothiazolinone. POM NA 18111000796\r\n</div>\r\n', 18900, 40, '0.36', '2013-09-07', '35zinc_shampoo.jpg', 6),
(15, 6, 'SUNLIGHT LIME 800ML', 'sunlight-lime-800ml', '<div>\r\nNama Produk: Sunlight Lime Refill 800ml\r\n</div>\r\n<div>\r\nBrand Produk: Sunlight\r\n</div>\r\n<div>\r\nBerat Kotor: 924.00 g\r\n</div>\r\n<div>\r\nDimensi Produk: 8.00cm X 23.00cm X 16.00cm\r\n</div>\r\n<div>\r\nWarning:\r\n</div>\r\n<div>\r\nJauhkan dari jangkauan anak-anak. Hindari terkena mata. Jika terkena mata, segera bilas dengan air. Bilaterminum, minumlah air yang banyak dan segera ke dokter,. Bilas dan keringkan tangan setelah penggunaan. Hindari kontak terlalu lama bagi tangan sensit\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nSetiap tetesan formula, dengan ekstrak jeruk nipis asli, diperkuat dengan garam mineral alami pada setiap kemasannya yang memberikan daya menghilangkan lemak lebih dari 100 jeruk nipis. Menghilangkan kotoran berlemak, lebih cepat dan mudah, bahkan pada plastik sekalipun. Lembut ditangan. Bahan aktif : 18.70% (Na-LAS, SLES, CAPB)Kemenkes RI PKD 20301210064\r\n</div>\r\n', 11300, 50, '0.92', '2013-09-07', '29dsc_0397_1.jpg', 1),
(16, 6, 'RINSO ANTI NODA 1,8 KG', 'rinso-anti-noda-18-kg', '<div>\r\nNama Produk: Rinso Anti Noda Detergent 1,8 kg\r\n</div>\r\n<div>\r\nBrand Produk: Rinso\r\n</div>\r\n<div>\r\nBerat Kotor: 2.08 Kg\r\n</div>\r\n<div>\r\nDimensi Produk: 8.00cm X 35.00cm X 22.00cm\r\n</div>\r\n<div>\r\nWarning:\r\n</div>\r\n<div>\r\nSimpan di tempat kering dan tertutup, serta jauhkan dari jangkauan anak-anak. Perhatikan label cara mencuci dan merawat pakaian. Untuk hasil terbaik, segera cuci pakaian begitu terkena noda. Cuci &amp; keringkan tangan setiap kali habis mencuci\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nRinso Anti Noda menghadirkan Kristal Biru Penghilang noda, yang larut dengan sempurna dalam air sehingga mampu melepaskan daya penghilang noda dalam cucian anda. Rinso Anti Noda menggabungkan beberapa macam teknologi pencucian dalam satu kemasan sehingga tidak dibutuhkan lagi perendaman yang lama, tidak perlu disikat lebih lama dan tidak perlu membeli produk tambahan untuk menghilangkan noda. Mengandung enzyme dan hanya menggunakan Surfaktan biodegredable demi menjaga lingkungan. Dapat terurai oleh pengolah limbah dan proses alamiah. Bahan aktif saat dikemas : 22% Natrium Alkilbenzena Sulfonate, 10% Natrium Fosfat dan 30% Natrium Karbonat.Kemkes RI PKD 20202010469\r\n</div>\r\n', 28800, 40, '2.08', '2013-09-07', '80rinso_anti_noda_1.8kg_front_image_1.jpg', 11),
(17, 6, 'MAMA LEMON EKSTRA 800ML', 'mama-lemon-ekstra-800ml', '<div>\r\nNama Produk: Mama Lemon Ekstra Jeruk Nipis Refill 800ml\r\n</div>\r\n<div>\r\nBrand Produk: Mama Lemon\r\n</div>\r\n<div>\r\nBerat Kotor: 919.60 g\r\n</div>\r\n<div>\r\nDimensi Produk: 8.50cm X 15.50cm X 23.00cm\r\n</div>\r\n<div>\r\n<br />\r\n</div>\r\n<div>\r\nMama lemon baru dengan ekstrak jeruk nipis 3x lebih efektif menghilangkan lemak dan bau amis pada peralatan makan dan dapur, bahkan yang terbuat dari plastik.Formula 3x action : busa 3x lebih banyak, 3x lebih cepat membersihkan dan 3x lebih kesat, lembut ditangan.PKD 20301010288\r\n</div>\r\n', 10700, 55, '0.92', '2013-09-07', '57mama_lemon_ekstra_jeruk_nipis_750_ml-_front.jpg', 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
