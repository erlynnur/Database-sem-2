-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Apr 2025 pada 17.49
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
-- Database: `res_basdat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `ID_anggota` varchar(10) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `JURUSAN` varchar(20) DEFAULT 'Umum',
  `Tanggal_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`ID_anggota`, `NAMA`, `JURUSAN`, `Tanggal_daftar`) VALUES
('Z001', 'ERLYN NRM', 'TEKNOLOGI INFORMASI', '2023-03-28'),
('Z002', 'ABIMANYU', 'TEKNIK MESIN', '2023-03-29'),
('Z003', 'BILYN', 'TEKNIK KIMIA', '2023-03-30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `ID_buku` varchar(10) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Tahun_terbit` int(11) DEFAULT NULL,
  `ID_penerbit` varchar(10) DEFAULT NULL
) ;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`ID_buku`, `Judul`, `Penerbit`, `Tahun_terbit`, `ID_penerbit`) VALUES
('Y001', 'Kalkulus Diferensial', 'Ghalia Indonesia', 2010, 'B001'),
('Y002', 'Basis Data', 'Lentera Ilmu Cendekia', 2018, 'B002'),
('Y003', 'Kalkulus jilid 1', 'Erlangga', 2003, 'B003'),
('Y004', 'HELLO, CELLO', 'BUKUNE KREATIF CIPTA', 2023, 'B004'),
('Y005', 'GALAKSI', 'COCONUT BOOKS', 2022, 'B005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_peminjaman` int(11) NOT NULL,
  `ID_anggota` varchar(10) DEFAULT NULL,
  `ID_buku` varchar(10) DEFAULT NULL,
  `Tanggal_pinjam` date NOT NULL,
  `Tanggal_kembali` date DEFAULT NULL,
  `Denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`ID_peminjaman`, `ID_anggota`, `ID_buku`, `Tanggal_pinjam`, `Tanggal_kembali`, `Denda`) VALUES
(1, 'Z001', 'Y002', '2023-04-01', '2023-04-08', 0),
(2, 'Z002', 'Y003', '2023-04-02', '2023-04-12', 96000),
(3, 'Z003', 'Y005', '2023-04-03', NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `ID_penerbit` varchar(10) NOT NULL,
  `NAMA_penerbit` varchar(50) NOT NULL,
  `Alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`ID_penerbit`, `NAMA_penerbit`, `Alamat`) VALUES
('B001', 'Ghalia Indonesia', 'BOGOR'),
('B002', 'Lentera Ilmu Cendekia', 'JAKARTA'),
('B003', 'Erlangga', 'JAKARTA'),
('B004', 'Bukune Kreatif Cipta', 'JAKARTA'),
('B005', 'Coconut Books', 'DEPOK');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ID_buku`),
  ADD KEY `fk_penerbit` (`ID_penerbit`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_peminjaman`),
  ADD KEY `fk_Peminjaman_Anggota` (`ID_anggota`),
  ADD KEY `fk_Peminjaman_Buku` (`ID_buku`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`ID_penerbit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `ID_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_penerbit` FOREIGN KEY (`ID_penerbit`) REFERENCES `penerbit` (`ID_penerbit`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_Peminjaman_Anggota` FOREIGN KEY (`ID_anggota`) REFERENCES `anggota` (`ID_anggota`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Peminjaman_Buku` FOREIGN KEY (`ID_buku`) REFERENCES `buku` (`ID_buku`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
