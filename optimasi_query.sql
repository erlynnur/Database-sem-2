-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Bulan Mei 2025 pada 15.55
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
-- Database: `optimasi_query`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL,
  `NAMA_PELANGGAN` varchar(50) DEFAULT NULL,
  `ALAMAT` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`ID_PELANGGAN`, `NAMA_PELANGGAN`, `ALAMAT`) VALUES
(1001, 'ABIMANYU ', 'KALIWUNGU'),
(1002, 'ERLYN', 'SUKOMULYO'),
(1003, 'NABIL', 'BOYOLALI'),
(1004, 'BILYN', 'KLATEN'),
(1005, 'JATI', 'PROTOMULYO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `KODE_PRODUK` varchar(10) NOT NULL,
  `NAMA_PRODUK` varchar(50) DEFAULT NULL,
  `HARGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`KODE_PRODUK`, `NAMA_PRODUK`, `HARGA`) VALUES
('A001', 'LAPTOP', 15000000),
('A002', 'KIPAS ANGIN', 6000000),
('A003', 'TAS', 500000),
('A004', 'KULKAS', 10000000),
('A005', 'SANDAL', 400000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `KODE_PRODUK` varchar(10) DEFAULT NULL,
  `JUMLAH` int(11) DEFAULT NULL,
  `TOTAL_HARGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `KODE_PRODUK`, `JUMLAH`, `TOTAL_HARGA`) VALUES
(2001, 'A001', 3, 45000000),
(2002, 'A002', 2, 12000000),
(2003, 'A003', 5, 2500000),
(2004, 'A004', 4, 40000000),
(2005, 'A005', 3, 1200000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_PELANGGAN`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`KODE_PRODUK`),
  ADD UNIQUE KEY `idx_kode_produk` (`KODE_PRODUK`),
  ADD KEY `idx_harga` (`HARGA`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `KODE_PRODUK` (`KODE_PRODUK`),
  ADD KEY `idx_total_harga` (`TOTAL_HARGA`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2006;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`KODE_PRODUK`) REFERENCES `produk` (`KODE_PRODUK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
