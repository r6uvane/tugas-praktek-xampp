-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2025 at 04:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_informasi_sekolah_2025_revano`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `ID` int(50) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `JENIS` varchar(50) NOT NULL,
  `ALAMAT` longtext NOT NULL,
  `NO_HP` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `ID` int(50) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `TINGKAT` int(50) NOT NULL,
  `RUANG` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `osis`
--

CREATE TABLE `osis` (
  `ID` int(50) NOT NULL,
  `NIS` int(50) NOT NULL,
  `TGL_BYR` date NOT NULL,
  `JML_BYR` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rombel`
--

CREATE TABLE `rombel` (
  `ID` int(50) NOT NULL,
  `NIS` int(50) NOT NULL,
  `ID_KELAS` int(50) NOT NULL,
  `ID_GURU` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `ID` int(11) NOT NULL,
  `NIS` int(11) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `JENIS` varchar(50) NOT NULL,
  `ALAMAT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spi`
--

CREATE TABLE `spi` (
  `ID` int(50) NOT NULL,
  `NIS` int(50) NOT NULL,
  `TGL_BYR` date NOT NULL,
  `JML_BYR` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `ID` int(50) NOT NULL,
  `NIS` int(50) NOT NULL,
  `TGL_BYR` date NOT NULL,
  `JML_BYR` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NAMA` (`NAMA`,`JENIS`),
  ADD KEY `NO_HP` (`NO_HP`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NAMA` (`NAMA`,`TINGKAT`,`RUANG`);

--
-- Indexes for table `osis`
--
ALTER TABLE `osis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`,`TGL_BYR`,`JML_BYR`);

--
-- Indexes for table `rombel`
--
ALTER TABLE `rombel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`),
  ADD KEY `ID_GURU` (`ID_GURU`),
  ADD KEY `ID_KELAS` (`ID_KELAS`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`,`NAMA`,`JENIS`);

--
-- Indexes for table `spi`
--
ALTER TABLE `spi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`,`TGL_BYR`,`JML_BYR`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NIS` (`NIS`,`TGL_BYR`,`JML_BYR`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `osis`
--
ALTER TABLE `osis`
  ADD CONSTRAINT `osis_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rombel`
--
ALTER TABLE `rombel`
  ADD CONSTRAINT `rombel_ibfk_2` FOREIGN KEY (`ID_GURU`) REFERENCES `guru` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rombel_ibfk_3` FOREIGN KEY (`ID_KELAS`) REFERENCES `kelas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rombel_ibfk_4` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spi`
--
ALTER TABLE `spi`
  ADD CONSTRAINT `spi_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spp`
--
ALTER TABLE `spp`
  ADD CONSTRAINT `spp_ibfk_1` FOREIGN KEY (`NIS`) REFERENCES `siswa` (`NIS`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
