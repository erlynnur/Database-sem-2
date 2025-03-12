-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 15.54
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
-- Database: `kuliah3_sql`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jurusan` varchar(60) NOT NULL,
  `fakultas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `jurusan`, `fakultas`) VALUES
(111, 'Erlyn', 'Teknologi Informasi', 'Teknik'),
(112, 'Abimanyu', 'Teknologi Informasi', 'Teknik'),
(113, 'Priyo', 'Teknik kimia', 'Teknik'),
(114, 'Abilyn', 'Teknik kimia', 'Teknik'),
(115, 'Jati', 'Teknik sipil', 'Teknik'),
(116, 'Erma', 'Teknik sipil', 'Teknik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `sks` int(11) DEFAULT NULL,
  `nama_matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `sks`, `nama_matkul`) VALUES
(11, 3, 'Struktur data'),
(12, 2, 'basis data'),
(13, 2, 'biologi'),
(14, 3, 'pengantar kimia'),
(15, 2, 'bahasa inggris'),
(16, 2, 'pancasila');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_mahasiswa`
--

CREATE TABLE `nilai_mahasiswa` (
  `id_nilai_mahasiswa` int(11) NOT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai_mahasiswa`
--

INSERT INTO `nilai_mahasiswa` (`id_nilai_mahasiswa`, `id_mahasiswa`, `id_matkul`, `nilai`) VALUES
(1, 111, 11, 80.00),
(2, 112, 11, 90.00),
(3, 113, 14, 78.00),
(4, 114, 14, 90.00),
(5, 115, 13, 90.00),
(6, 116, 13, 80.00),
(7, 111, 12, 90.00),
(8, 112, 12, 92.00),
(9, 113, 15, 89.00),
(10, 114, 15, 90.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD PRIMARY KEY (`id_nilai_mahasiswa`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  MODIFY `id_nilai_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `nilai_mahasiswa`
--
ALTER TABLE `nilai_mahasiswa`
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `nilai_mahasiswa_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
