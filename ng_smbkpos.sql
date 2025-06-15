-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2021 at 03:36 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngaq6578_smbkpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `ID_BANK` bigint(20) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL,
  `JENIS` varchar(100) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL,
  `KETERANGAN` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`ID_BANK`, `ID_USER`, `TANGGAL`, `JENIS`, `NOMINAL`, `KETERANGAN`) VALUES
(10, 1, '2020-06-17 14:45:15', 'Pemasukan', 30000, 'Mutasi Dari Kas');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `KODE_BARANG` varchar(20) DEFAULT NULL,
  `BARCODE` varchar(20) DEFAULT NULL,
  `NAMA_BARANG` varchar(50) DEFAULT NULL,
  `ID_KATEGORI` int(11) DEFAULT NULL,
  `ID_SATUAN` int(11) DEFAULT NULL,
  `ID_SUPPLIER` int(11) DEFAULT NULL,
  `STOK_MINIMAL` int(11) DEFAULT NULL,
  `HARGA_BELI` varchar(30) DEFAULT NULL,
  `HARGA_JUAL` varchar(30) DEFAULT NULL,
  `STOK` int(11) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `KODE_BARANG`, `BARCODE`, `NAMA_BARANG`, `ID_KATEGORI`, `ID_SATUAN`, `ID_SUPPLIER`, `STOK_MINIMAL`, `HARGA_BELI`, `HARGA_JUAL`, `STOK`, `IS_ACTIVE`) VALUES
(1, 'BRG-00001', '-', 'Delmonte Ketchup Saus Tomat 5,7 Kg', 4, 1, 3, 0, '71500', '80000', 14, 1),
(2, 'BRG-00002', '8997011700062 ', 'Bihun Jagung Padamu 175 gram ', 4, 5, 5, 0, '3100', '4000', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_operasional`
--

CREATE TABLE `barang_operasional` (
  `id_brg_operasional` bigint(20) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bulan`
--

CREATE TABLE `bulan` (
  `ID_BULAN` int(11) NOT NULL,
  `BULAN` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bulan`
--

INSERT INTO `bulan` (`ID_BULAN`, `BULAN`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_CS` int(11) NOT NULL,
  `KODE_CS` varchar(20) DEFAULT NULL,
  `NAMA_CS` varchar(100) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(20) DEFAULT NULL,
  `TELP` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ALAMAT` varchar(200) DEFAULT NULL,
  `JENIS_CS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_CS`, `KODE_CS`, `NAMA_CS`, `JENIS_KELAMIN`, `TELP`, `EMAIL`, `ALAMAT`, `JENIS_CS`) VALUES
(1, 'CS-000001', 'Umum', 'Umum', 'Umum', 'Umum', 'Umum', 'Umum'),
(2, 'CS-000002', 'Bambang', 'Laki-Laki', '08109257094', 'bambang@gmail.com', 'Bangorejo', 'Toko');


-- --------------------------------------------------------

--
-- Table structure for table `detil_hutang`
--

CREATE TABLE `detil_hutang` (
  `ID_DETIL_HUTANG` bigint(20) NOT NULL,
  `TGL_BAYAR` datetime DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_HUTANG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detil_pembelian`
--

CREATE TABLE `detil_pembelian` (
  `ID_DETIL_BELI` bigint(20) NOT NULL,
  `ID_BELI` int(11) DEFAULT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `KODE_DETIL_BELI` varchar(20) DEFAULT NULL,
  `HRG_BELI` int(11) DEFAULT NULL,
  `HRG_JUAL` int(11) DEFAULT NULL,
  `QTY_BELI` int(11) DEFAULT NULL,
  `SUBTOTAL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detil_pembelian`
--

INSERT INTO `detil_pembelian` (`ID_DETIL_BELI`, `ID_BELI`, `ID_BARANG`, `KODE_DETIL_BELI`, `HRG_BELI`, `HRG_JUAL`, `QTY_BELI`, `SUBTOTAL`) VALUES
(14, 29, 14, 'DB-0000005', 39000, 42500, 4, '156000'),
(15, 29, 80, 'DB-0000006', 8300, 9000, 5, '41500');


-- --------------------------------------------------------

--
-- Table structure for table `detil_penjualan`
--

CREATE TABLE `detil_penjualan` (
  `ID_DETIL_JUAL` bigint(20) NOT NULL,
  `ID_JUAL` int(11) DEFAULT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `KODE_DETIL_JUAL` varchar(20) DEFAULT NULL,
  `DISKON` int(11) DEFAULT NULL,
  `HARGA_ITEM` int(11) DEFAULT NULL,
  `QTY_JUAL` int(11) DEFAULT NULL,
  `SUBTOTAL` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detil_penjualan`
--

INSERT INTO `detil_penjualan` (`ID_DETIL_JUAL`, `ID_JUAL`, `ID_BARANG`, `KODE_DETIL_JUAL`, `DISKON`, `HARGA_ITEM`, `QTY_JUAL`, `SUBTOTAL`) VALUES
(19, 87, 70, 'DJ-0000001', 0, 21000, 2, '42000'),
(20, 87, 10, 'DJ-0000002', 0, 18000, 1, '18000');



-- --------------------------------------------------------

--
-- Table structure for table `detil_piutang`
--

CREATE TABLE `detil_piutang` (
  `ID_DETIL_PIUTANG` bigint(20) NOT NULL,
  `TGL_BAYAR` datetime DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_PIUTANG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE `hutang` (
  `ID_HUTANG` bigint(20) NOT NULL,
  `ID_BELI` int(11) DEFAULT NULL,
  `TGL_HUTANG` datetime DEFAULT NULL,
  `JML_HUTANG` int(11) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `SISA` int(11) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID_KARYAWAN` int(11) NOT NULL,
  `KODE_KARYAWAN` varchar(20) DEFAULT NULL,
  `NAMA_KARYAWAN` varchar(100) DEFAULT NULL,
  `JENIS_KELAMIN` varchar(20) DEFAULT NULL,
  `TELP_KARYAWAN` varchar(15) DEFAULT NULL,
  `EMAIL_KARYAWAN` varchar(50) DEFAULT NULL,
  `STATUS_KARYAWAN` varchar(20) DEFAULT NULL,
  `TMPT_LAHIR` varchar(50) DEFAULT NULL,
  `TGL_LAHIR` varchar(20) DEFAULT NULL,
  `TGL_MASUK` varchar(20) DEFAULT NULL,
  `ALAMAT` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID_KARYAWAN`, `KODE_KARYAWAN`, `NAMA_KARYAWAN`, `JENIS_KELAMIN`, `TELP_KARYAWAN`, `EMAIL_KARYAWAN`, `STATUS_KARYAWAN`, `TMPT_LAHIR`, `TGL_LAHIR`, `TGL_MASUK`, `ALAMAT`) VALUES
(3, 'K-00002', 'Ciko Ciki Tita', 'Laki-Laki', '082236578566', 'cikocik@gmail.com', 'Tetap', 'Banyuwangi', '04 Oktober 1998', '11/10/2019', 'Songgon'),
(16, 'K-00003', 'Dafid Prasetyo', 'Laki-Laki', '081092570948', 'dafidprasetyo@gmail.com', 'Tetap', 'Banyuwangi', '03 Maret 1998', '18/01/2020', 'Banyuwangi');

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `ID_KAS` bigint(20) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `KODE_KAS` varchar(20) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL,
  `JENIS` varchar(20) DEFAULT NULL,
  `NOMINAL` varchar(50) DEFAULT NULL,
  `KETERANGAN` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`ID_KAS`, `ID_USER`, `KODE_KAS`, `TANGGAL`, `JENIS`, `NOMINAL`, `KETERANGAN`) VALUES
(24, 1, 'KS-0000001', '2020-06-17 19:35:58', 'Pemasukan', '65000', 'Penjualan'),
(25, 1, 'KS-0000002', '2020-06-17 19:36:36', 'Pemasukan', '180400', 'Penjualan');


-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `ID_KATEGORI` int(11) NOT NULL,
  `KATEGORI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`ID_KATEGORI`, `KATEGORI`) VALUES
(1, 'Minuman'),
(2, 'Makanan');


-- --------------------------------------------------------

--
-- Table structure for table `pajak_ppn`
--

CREATE TABLE `pajak_ppn` (
  `ID_PAJAK` bigint(20) NOT NULL,
  `KODE_PAJAK` varchar(20) DEFAULT NULL,
  `JENIS` varchar(70) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL,
  `KETERANGAN` text DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pajak_ppn`
--


-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_BELI` int(11) NOT NULL,
  `ID_SUPPLIER` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `KODE_BELI` varchar(20) DEFAULT NULL,
  `TGL_FAKTUR` varchar(20) DEFAULT NULL,
  `FAKTUR_BELI` varchar(20) DEFAULT NULL,
  `DISKON` int(11) DEFAULT NULL,
  `TOTAL` varchar(30) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `KEMBALI` int(11) DEFAULT NULL,
  `TGL` datetime NOT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`ID_BELI`, `ID_SUPPLIER`, `ID_USER`, `KODE_BELI`, `TGL_FAKTUR`, `FAKTUR_BELI`, `DISKON`, `TOTAL`, `BAYAR`, `KEMBALI`, `TGL`, `IS_ACTIVE`) VALUES
(29, 33, 1, 'PB-0000002', '2020-06-15', 'F-000002', 0, '197500', 200000, 2500, '2020-06-15 14:40:32', 1),
(31, 5, 1, 'PB-0000004', '2020-06-17', 'F-000004', 0, '132600', 200000, 67400, '2020-06-17 14:41:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_JUAL` int(11) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_CS` int(11) DEFAULT NULL,
  `ID_KARYAWAN` int(11) DEFAULT NULL,
  `KODE_JUAL` varchar(20) DEFAULT NULL,
  `INVOICE` varchar(50) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `KEMBALI` int(11) DEFAULT NULL,
  `PPN` int(11) DEFAULT NULL,
  `TGL` datetime DEFAULT NULL,
  `ID_BULAN` int(11) DEFAULT NULL,
  `TAHUN` varchar(4) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`ID_JUAL`, `ID_USER`, `ID_CS`, `ID_KARYAWAN`, `KODE_JUAL`, `INVOICE`, `BAYAR`, `KEMBALI`, `PPN`, `TGL`, `ID_BULAN`, `TAHUN`, `IS_ACTIVE`) VALUES
(87, 1, 2, 0, 'KJ-0000001', 'POS20200617193558', 65000, 0, 0, '2020-06-14 19:35:58', 6, '2020', 1),
(88, 1, 6, 0, 'KJ-0000002', 'POS20200617193636', 200000, 19600, 16400, '2020-06-15 19:36:36', 6, '2020', 1);


-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `ID_PIUTANG` bigint(20) NOT NULL,
  `ID_JUAL` int(11) DEFAULT NULL,
  `TGL_PIUTANG` datetime DEFAULT NULL,
  `JML_PIUTANG` int(11) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `SISA` int(11) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `piutang`
--


-- --------------------------------------------------------

--
-- Table structure for table `profil_perusahaan`
--

CREATE TABLE `profil_perusahaan` (
  `ID_PERUSAHAAN` int(11) NOT NULL,
  `NAMA_PERUSAHAAN` varchar(100) DEFAULT NULL,
  `ALAMAT_PERUSAHAAN` varchar(100) DEFAULT NULL,
  `TELP_PERUSAHAAN` varchar(15) DEFAULT NULL,
  `FAX_PERUSAHAAN` varchar(15) DEFAULT NULL,
  `EMAIL_PERUSAHAAN` varchar(50) DEFAULT NULL,
  `WEBSITE_PERUSAHAAN` varchar(50) DEFAULT NULL,
  `LOGO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil_perusahaan`
--

INSERT INTO `profil_perusahaan` (`ID_PERUSAHAAN`, `NAMA_PERUSAHAAN`, `ALAMAT_PERUSAHAAN`, `TELP_PERUSAHAAN`, `FAX_PERUSAHAAN`, `EMAIL_PERUSAHAAN`, `WEBSITE_PERUSAHAAN`, `LOGO`) VALUES
(1, 'Megatama Putra', 'Jln. Swadaya Tambun Selatan, Kab. Bekasi', '085674893092', '(0333) 094837', 'megatamaputra@gmail.com', 'www.megatama.com', 'cart.png');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `ID_SATUAN` int(11) NOT NULL,
  `SATUAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`ID_SATUAN`, `SATUAN`) VALUES
(1, 'PCS'),
(2, 'Kg');


-- --------------------------------------------------------

--
-- Table structure for table `stok_opname`
--

CREATE TABLE `stok_opname` (
  `ID_STOK_OPNAME` bigint(20) NOT NULL,
  `ID_BARANG` int(11) DEFAULT NULL,
  `STOK` varchar(10) DEFAULT NULL,
  `STOK_NYATA` varchar(10) DEFAULT NULL,
  `SELISIH` varchar(10) DEFAULT NULL,
  `NILAI` varchar(50) DEFAULT NULL,
  `KETERANGAN` varchar(250) DEFAULT NULL,
  `TANGGAL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID_SUPPLIER` int(11) NOT NULL,
  `KODE_SUPPLIER` varchar(20) DEFAULT NULL,
  `NAMA_SUPPLIER` varchar(100) DEFAULT NULL,
  `ALAMAT_SUPPLIER` varchar(100) DEFAULT NULL,
  `TELP_SUPPLIER` varchar(15) DEFAULT NULL,
  `FAX_SUPPLIER` varchar(15) DEFAULT NULL,
  `EMAIL_SUPPLIER` char(50) DEFAULT NULL,
  `BANK` varchar(50) DEFAULT NULL,
  `REKENING` varchar(30) DEFAULT NULL,
  `ATAS_NAMA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID_SUPPLIER`, `KODE_SUPPLIER`, `NAMA_SUPPLIER`, `ALAMAT_SUPPLIER`, `TELP_SUPPLIER`, `FAX_SUPPLIER`, `EMAIL_SUPPLIER`, `BANK`, `REKENING`, `ATAS_NAMA`) VALUES
(1, 'SP-00004', 'CV. Jaya Makmur', 'Bangorejo', '082716273821', '-', 'jayamakmur@gmail.com', 'BNI', '8938203842', 'Ridwan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_USER` int(11) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `NAMA_LENGKAP` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(225) DEFAULT NULL,
  `TIPE` varchar(30) DEFAULT NULL,
  `ALAMAT_USER` varchar(100) DEFAULT NULL,
  `TELP_USER` varchar(15) DEFAULT NULL,
  `EMAIL_USER` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_USER`, `USERNAME`, `NAMA_LENGKAP`, `PASSWORD`, `TIPE`, `ALAMAT_USER`, `TELP_USER`, `EMAIL_USER`, `IS_ACTIVE`) VALUES
(1, 'admin', 'Administrator', '$2y$10$oagi0l6Q3v.bwPCCVgOQXOnWX1FPLAvIiIfMJwIrJjk4212ACLN7.', 'Administrator', 'Banyuwagi', '085647382748', 'admin@gmail.com', 1),
(3, 'kasir', 'Kasir', '$2y$10$nWBEdyFeReNQtbr4lGUWmuN9SXKRtpqdog2CtXPFcmqCzb6p5Bmp6', 'Kasir', 'Banyuwangi', '082236578566', 'kasir@gmail.com', 1),
(12, 'aaa', 'aaa', '$2y$10$cojJm7lPQq9SMmBxOFySt.ZwZR2HEwA6jlaJWNE9BI9b.sAjEcip2', 'Kasir', 'aaa', '213213', 'aa@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `ID_LOG` bigint(20) NOT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `WAKTU` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`ID_LOG`, `ID_USER`, `WAKTU`) VALUES
(1, 1, '03/06/2020 11:45:35'),
(2, 1, '15/10/2021 17:29:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`ID_BANK`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`),
  ADD KEY `ID_KATEGORI` (`ID_KATEGORI`),
  ADD KEY `ID_SATUAN` (`ID_SATUAN`),
  ADD KEY `ID_SUPPLIER` (`ID_SUPPLIER`);

--
-- Indexes for table `barang_operasional`
--
ALTER TABLE `barang_operasional`
  ADD PRIMARY KEY (`id_brg_operasional`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `bulan`
--
ALTER TABLE `bulan`
  ADD PRIMARY KEY (`ID_BULAN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_CS`);

--
-- Indexes for table `detil_hutang`
--
ALTER TABLE `detil_hutang`
  ADD PRIMARY KEY (`ID_DETIL_HUTANG`);

--
-- Indexes for table `detil_pembelian`
--
ALTER TABLE `detil_pembelian`
  ADD PRIMARY KEY (`ID_DETIL_BELI`),
  ADD KEY `FK_BARANG_DETIL_PEMBELIAN` (`ID_BARANG`),
  ADD KEY `FK_PEMBELIAN_DETIL` (`ID_BELI`);

--
-- Indexes for table `detil_penjualan`
--
ALTER TABLE `detil_penjualan`
  ADD PRIMARY KEY (`ID_DETIL_JUAL`),
  ADD KEY `FK_BARANG_PENJUALAN_DETIL` (`ID_BARANG`),
  ADD KEY `FK_PENJUALAN_DETIL` (`ID_JUAL`);

--
-- Indexes for table `detil_piutang`
--
ALTER TABLE `detil_piutang`
  ADD PRIMARY KEY (`ID_DETIL_PIUTANG`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
  ADD PRIMARY KEY (`ID_HUTANG`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID_KARYAWAN`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`ID_KAS`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID_KATEGORI`);

--
-- Indexes for table `pajak_ppn`
--
ALTER TABLE `pajak_ppn`
  ADD PRIMARY KEY (`ID_PAJAK`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_BELI`),
  ADD KEY `FK_MENCATAT_PEMBELIAN` (`ID_USER`),
  ADD KEY `FK_TRANSAKSI_PEMBELIAN` (`ID_SUPPLIER`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_JUAL`),
  ADD KEY `FK_MELAYANI` (`ID_USER`),
  ADD KEY `FK_TRANSAKSI` (`ID_CS`),
  ADD KEY `ID_BULAN` (`ID_BULAN`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD PRIMARY KEY (`ID_PIUTANG`);

--
-- Indexes for table `profil_perusahaan`
--
ALTER TABLE `profil_perusahaan`
  ADD PRIMARY KEY (`ID_PERUSAHAAN`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`ID_SATUAN`);

--
-- Indexes for table `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD PRIMARY KEY (`ID_STOK_OPNAME`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID_SUPPLIER`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_USER`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`ID_LOG`),
  ADD KEY `ID_USER` (`ID_USER`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `ID_BANK` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT for table `barang_operasional`
--
ALTER TABLE `barang_operasional`
  MODIFY `id_brg_operasional` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulan`
--
ALTER TABLE `bulan`
  MODIFY `ID_BULAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID_CS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detil_hutang`
--
ALTER TABLE `detil_hutang`
  MODIFY `ID_DETIL_HUTANG` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detil_pembelian`
--
ALTER TABLE `detil_pembelian`
  MODIFY `ID_DETIL_BELI` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `detil_penjualan`
--
ALTER TABLE `detil_penjualan`
  MODIFY `ID_DETIL_JUAL` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `detil_piutang`
--
ALTER TABLE `detil_piutang`
  MODIFY `ID_DETIL_PIUTANG` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hutang`
--
ALTER TABLE `hutang`
  MODIFY `ID_HUTANG` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID_KARYAWAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `ID_KAS` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `ID_KATEGORI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pajak_ppn`
--
ALTER TABLE `pajak_ppn`
  MODIFY `ID_PAJAK` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `ID_BELI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_JUAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
  MODIFY `ID_PIUTANG` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profil_perusahaan`
--
ALTER TABLE `profil_perusahaan`
  MODIFY `ID_PERUSAHAAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `ID_SATUAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stok_opname`
--
ALTER TABLE `stok_opname`
  MODIFY `ID_STOK_OPNAME` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID_SUPPLIER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_USER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `ID_LOG` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `ITEM_SUPPLIER` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `supplier` (`ID_SUPPLIER`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `KATEGORI_BARANG` FOREIGN KEY (`ID_KATEGORI`) REFERENCES `kategori` (`ID_KATEGORI`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `SATUAN_BARANG` FOREIGN KEY (`ID_SATUAN`) REFERENCES `satuan` (`ID_SATUAN`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `barang_operasional`
--
ALTER TABLE `barang_operasional`
  ADD CONSTRAINT `barang_operasional_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`ID_BARANG`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `detil_pembelian`
--
ALTER TABLE `detil_pembelian`
  ADD CONSTRAINT `FK_BARANG_DETIL_PEMBELIAN` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`),
  ADD CONSTRAINT `FK_PEMBELIAN_DETIL` FOREIGN KEY (`ID_BELI`) REFERENCES `pembelian` (`ID_BELI`);

--
-- Constraints for table `detil_penjualan`
--
ALTER TABLE `detil_penjualan`
  ADD CONSTRAINT `FK_BARANG_PENJUALAN_DETIL` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`),
  ADD CONSTRAINT `FK_PENJUALAN_DETIL` FOREIGN KEY (`ID_JUAL`) REFERENCES `penjualan` (`ID_JUAL`);

--
-- Constraints for table `kas`
--
ALTER TABLE `kas`
  ADD CONSTRAINT `INPUT_KAS` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pajak_ppn`
--
ALTER TABLE `pajak_ppn`
  ADD CONSTRAINT `pajak_ppn_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `FK_MENCATAT_PEMBELIAN` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `FK_TRANSAKSI_PEMBELIAN` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `supplier` (`ID_SUPPLIER`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `BULAN_PENJUALAN` FOREIGN KEY (`ID_BULAN`) REFERENCES `bulan` (`ID_BULAN`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_MELAYANI` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`),
  ADD CONSTRAINT `FK_TRANSAKSI` FOREIGN KEY (`ID_CS`) REFERENCES `customer` (`ID_CS`);

--
-- Constraints for table `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD CONSTRAINT `STOK_OPNAME_BARANG` FOREIGN KEY (`ID_BARANG`) REFERENCES `barang` (`ID_BARANG`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log` FOREIGN KEY (`ID_USER`) REFERENCES `user` (`ID_USER`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
