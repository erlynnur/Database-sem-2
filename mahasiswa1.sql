-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2025 pada 10.45
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
-- Database: `prakbasdat3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa1`
--

CREATE TABLE `mahasiswa1` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Tempat_Lahir` varchar(30) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `No_Hp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa1`
--

INSERT INTO `mahasiswa1` (`NPM`, `Nama`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `No_Hp`) VALUES
('12340', 'Erlyn', 'Kendal', '2007-03-28', 'P', '08123456'),
('12341', 'Abimanyu', 'Kendal', '2006-03-16', 'L', '08123457'),
('12342', 'Jati', 'Kendal', '2006-04-16', 'L', '08123458'),
('12344', 'Alam', 'Kendal', '2005-09-12', 'L', '08123450');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa1`
--
ALTER TABLE `mahasiswa1`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
