-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2019 at 07:28 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_penjualan` varchar(100) NOT NULL,
  `id_produk` varchar(100) NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_penjualan`, `id_produk`, `jumlah`, `harga`, `waktu`) VALUES
('33124042019', '1', 10, 150000, '2019-04-24'),
('7224042019', '5', 10, 100000, '2019-04-24');

--
-- Triggers `detail_penjualan`
--
DELIMITER $$
CREATE TRIGGER `update_stok` AFTER INSERT ON `detail_penjualan` FOR EACH ROW UPDATE produk SET stok = stok - NEW.jumlah
WHERE id_produk = NEW.id_produk
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` varchar(100) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `kontak` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `username`, `password`, `alamat`, `kontak`, `image`) VALUES
('625', 'Michael Kevin Adinata', '123', '202cb962ac59075b964b07152d234b70', 'Jl. Raya Muria no.132', '123456', '625-627.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` varchar(50) NOT NULL,
  `id_pembeli` varchar(50) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_pembeli`, `waktu`) VALUES
('33124042019', '625', '2019-04-24'),
('7224042019', '625', '2019-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(500) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `deskripsi` varchar(500) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `jenis`, `deskripsi`, `harga`, `stok`, `image`) VALUES
('1', 'Flores Bajawa Coffee', 'Arabica', 'Kopi bajawa ini juga memiliki rasa pahit yang tidak terlalu seperti kopi lainnya, rasanya pun juga lebih ringan. Sehingga untuk anda yang sedang mencoba menjadi penikmat kopi, kopi ini tentu cocok untuk anda.', 150000, 60, '1-292.jpg'),
('2', 'Bali Kintanami Coffee', 'Arabica', 'Rasanya unik karena dominasi asam citrus segar dan aroma wangi bunga, dengan tingkat keasaman dan kekentalan sedang. ', 200000, 98, '2-727.jpg'),
('5', 'Gayo Coffee', 'Arabica', 'Aroma yang sangat baik dan rasa kopi yang kompleks, keasaman yang baik dan ketebalan biji. Rasa vanilla dan rasa buah serta rasa rempah (spicy).', 100000, 58, '5-819.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id_seller` varchar(500) NOT NULL,
  `nama_seller` varchar(500) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `kontak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id_seller`, `nama_seller`, `username`, `password`, `kontak`) VALUES
('1', 'kevin', 'kev', '202cb962ac59075b964b07152d234b70', '085790291176');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
