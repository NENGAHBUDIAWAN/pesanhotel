-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jul 2024 pada 11.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisfohotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` varchar(10) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`idkamar`, `tipe`, `jumlah`, `harga`, `gambar`) VALUES
('001', 'Superior', 7, 410000, 'Standard.jpg'),
('002', 'Deluxe', 45, 450000, 'Superior.jpg'),
('003', 'Junior Suite', 4, 700000, 'Deluxe.jpg'),
('004', 'Executive', 2, 1200000, 'Junior-Suite.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `idkontak` int(11) NOT NULL,
  `idtamu` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pesanuser` text NOT NULL,
  `pesanadmin` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`idkontak`, `idtamu`, `username`, `pesanuser`, `pesanadmin`) VALUES
(48, 10, 'ali', 'Halooo....', ''),
(49, 10, 'ali', '', 'Yoooo'),
(50, 11, 'inka', 'Tesssss...', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', '1234'),
('admin1', 'password123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idpesan` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `norek` varchar(15) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `gambar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`idpesan`, `nama`, `jumlah`, `bank`, `norek`, `namarek`, `gambar`) VALUES
('37', 'Aljumad', 450000, 'BCA', '1234567890', 'ALJUMAD', '2.jpg'),
('39', 'Inka Ardya Indrawan', 1400000, 'Mandiri', '33344455566666', 'Inka', '5.jpg'),
('40', 'Muh. Fahrizal', 1800000, 'BNI', '677777777777777', 'Fahri', '7.jpg'),
('42', 'Muh. Ade Furkan', 1350000, 'BRI', '493111122233344', 'Furkan', '5.jpg'),
('45', '123', 0, 'BCA', '0987654', 'oi8u765', '4banner.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `idpesan` int(11) NOT NULL,
  `tglpesan` datetime NOT NULL,
  `batasbayar` datetime NOT NULL,
  `idkamar` varchar(15) NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `idtamu` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `tglmasuk` date NOT NULL,
  `tglkeluar` date NOT NULL,
  `lamahari` int(11) NOT NULL DEFAULT 0,
  `totalbayar` int(11) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'Pending...'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`idpesan`, `tglpesan`, `batasbayar`, `idkamar`, `tipe`, `harga`, `jumlah`, `idtamu`, `nama`, `alamat`, `telepon`, `tglmasuk`, `tglkeluar`, `lamahari`, `totalbayar`, `status`) VALUES
(36, '2018-05-22 18:26:42', '2018-05-22 23:26:42', '001', 'Superior', 410000, 1, 10, 'Aljumad', 'Jl. qwerty', '081222333444', '2018-05-22', '2018-05-23', 1, 410000, 'Dibatalkan'),
(37, '2018-05-22 18:27:45', '2018-05-23 23:27:45', '002', 'Deluxe', 450000, 1, 10, 'Aljumad', 'Jl. qwerty', '081222333444', '2018-05-22', '2018-05-23', 1, 450000, 'Dibatalkan'),
(38, '2018-05-22 22:03:17', '2018-05-23 03:03:17', '002', 'Deluxe', 450000, 1, 11, 'Inka Ardya Indrawan', 'Jl. abcd', '088111222333', '2018-05-22', '2018-05-23', 1, 450000, 'Dibatalkan'),
(39, '2018-05-22 22:04:53', '2018-05-23 03:04:53', '003', 'Junior Suite', 700000, 1, 11, 'Inka Ardya Indrawan', 'Jl. abcd', '088111222333', '2018-05-23', '2018-05-25', 2, 1400000, 'Dibatalkan'),
(40, '2018-05-22 22:13:51', '2018-05-23 03:13:51', '002', 'Deluxe', 450000, 2, 12, 'Muh. Fahrizal', 'Jl....', '1234567777', '2018-05-22', '2018-05-24', 2, 1800000, 'Dibatalkan'),
(41, '2018-05-22 22:24:20', '2018-05-23 03:24:20', '002', 'Deluxe', 450000, 1, 12, 'Muh. Fahrizal', 'Jl....', '1234567777', '2018-05-21', '2018-05-22', 1, 450000, 'Dibatalkan'),
(42, '2018-05-22 22:29:27', '2018-05-23 03:29:27', '002', 'Deluxe', 450000, 1, 13, 'Muh. Ade Furkan', 'Jlll', '088777888999', '2018-05-22', '2018-05-25', 3, 1350000, 'Berhasil'),
(43, '2018-05-23 10:19:17', '2018-05-23 15:19:17', '002', 'Deluxe', 450000, 2, 12, 'Muh. Fahrizal', 'Jl....', '1234567777', '2018-05-23', '2018-05-25', 2, 1800000, 'Berhasil'),
(44, '2018-07-14 14:19:36', '2018-07-14 19:19:36', '002', 'Deluxe', 450000, 1, 10, 'Aljumad', 'Jl. qwerty', '081222333444', '2018-07-14', '2018-07-16', 2, 900000, 'Pending...'),
(45, '2024-07-15 16:23:39', '2024-07-15 21:23:39', '004', 'Executive', 1200000, 0, 14, '123', '123', '098765', '2024-07-22', '2024-07-23', 1, 0, 'Pending...'),
(46, '2024-07-15 16:56:42', '2024-07-15 21:56:42', '001', 'Superior', 410000, 1, 14, '123', '123', '098765', '2024-07-16', '2024-07-17', 1, 410000, 'Pending...');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stokkamar`
--

CREATE TABLE `stokkamar` (
  `idkamar` varchar(20) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `stokkamar`
--

INSERT INTO `stokkamar` (`idkamar`, `tipe`, `stok`) VALUES
('001', 'Superior', 6),
('002', 'Deluxe', 42),
('003', 'Junior Suite', 4),
('004', 'Executive', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `idtamu` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`idtamu`, `username`, `email`, `nama`, `alamat`, `telepon`, `password`, `foto`) VALUES
(10, 'ali', 'ali@gmail.com', 'Aljumad', 'Jl. qwerty', '081222333444', '202cb962ac59075b964b07152d234b70', 'favicon.png'),
(11, 'inka', 'inka@gmail.com', 'Inka Ardya Indrawan', 'Jl. abcd', '088111222333', '202cb962ac59075b964b07152d234b70', ''),
(12, 'fahri', 'fahri@gmail.com', 'Muh. Fahrizal', 'Jl....', '1234567777', '202cb962ac59075b964b07152d234b70', ''),
(13, 'furkan', 'furkan@gmail.com', 'Muh. Ade Furkan', 'Jlll', '088777888999', '202cb962ac59075b964b07152d234b70', ''),
(14, '123', 'HAIKAL@gmail.com', '123', '123', '098765', '81dc9bdb52d04dc20036dbd8313ed055', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`idkontak`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idpesan`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`idpesan`);

--
-- Indeks untuk tabel `stokkamar`
--
ALTER TABLE `stokkamar`
  ADD PRIMARY KEY (`idkamar`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`idtamu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `idkontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `idpesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `idtamu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
