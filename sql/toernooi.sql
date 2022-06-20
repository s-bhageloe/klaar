-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2022 at 01:56 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toernooi`
--

-- --------------------------------------------------------

--
-- Table structure for table `aanmelding`
--

CREATE TABLE `aanmelding` (
  `aanmeldingsID` int(11) NOT NULL,
  `spelerID` int(11) DEFAULT NULL,
  `toernooiID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scholen`
--

CREATE TABLE `scholen` (
  `schoolID` int(11) NOT NULL,
  `naam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scholen`
--

INSERT INTO `scholen` (`schoolID`, `naam`) VALUES
(1, 'Albeda College'),
(2, 'Da Vinci College'),
(3, 'Drenthe College'),
(13, 'Graafschap College'),
(14, 'Katholiek Onderwijs Amsterdam'),
(15, 'Rijn Ijssel College'),
(16, 'ROC de Leijgraaf'),
(17, 'ROC Horizon College'),
(18, 'ROC ID College'),
(19, 'ROC Midden Nederland'),
(20, 'ROC TOP');

-- --------------------------------------------------------

--
-- Table structure for table `spelers`
--

CREATE TABLE `spelers` (
  `spelerID` int(11) NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `tussenvoegsel` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) NOT NULL,
  `schoolID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spelers`
--

INSERT INTO `spelers` (`spelerID`, `voornaam`, `tussenvoegsel`, `achternaam`, `schoolID`) VALUES
(1, 'Jasper', '-', 'Aalbers', 1),
(2, 'Erik', '-', 'Aalten', 13),
(12, 'Anne', '-', 'Aalten', 2),
(13, 'Remco', 'de', 'Abdi', 3),
(14, 'Christiaan', 'te', 'Abdullah', 15),
(15, 'Dineke', '-', 'Aben', 3),
(16, 'Martijn', '-', 'Abrahamse', 1),
(17, 'Sven', '-', 'Abrahamse', 1),
(18, 'Bas', '-', 'Achterberg', 14),
(19, 'Jeroen', 'de', 'Adams', 15),
(20, 'Bert Jan', 'van', 'Adams', 15),
(21, 'Jaap', '-', 'Adel', 17),
(22, 'Gijs', '-', 'Adriaanse', 18),
(23, 'Ferrie', '-', 'Aerts', 20),
(24, 'Ahmad', '-', 'Afantrous', 19),
(26, 'Huib', '-', 'Aggelen', 19);

-- --------------------------------------------------------

--
-- Table structure for table `toernooien`
--

CREATE TABLE `toernooien` (
  `toernooiID` int(11) NOT NULL,
  `omschrijving` varchar(255) DEFAULT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toernooien`
--

INSERT INTO `toernooien` (`toernooiID`, `omschrijving`, `datum`) VALUES
(1, 'Wintertoernooi', '2016-12-29'),
(3, 'Voorjaarstoernooi', '2017-05-23'),
(4, 'Zomerbal', '2017-07-31');

-- --------------------------------------------------------

--
-- Table structure for table `wedstrijd`
--

CREATE TABLE `wedstrijd` (
  `wedstrijdsID` int(11) NOT NULL,
  `toernooiID` int(11) DEFAULT NULL,
  `ronde` int(11) NOT NULL,
  `speler1ID` int(11) DEFAULT NULL,
  `speler2ID` int(11) DEFAULT NULL,
  `score1` int(11) DEFAULT NULL,
  `score2` int(11) DEFAULT NULL,
  `winnaarsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wedstrijd`
--

INSERT INTO `wedstrijd` (`wedstrijdsID`, `toernooiID`, `ronde`, `speler1ID`, `speler2ID`, `score1`, `score2`, `winnaarsID`) VALUES
(5, 1, 2, 12, 14, 4, 5, 12),
(6, 1, 2, 13, 12, 3, 1, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aanmelding`
--
ALTER TABLE `aanmelding`
  ADD PRIMARY KEY (`aanmeldingsID`),
  ADD KEY `spelerID` (`spelerID`),
  ADD KEY `toernooiID` (`toernooiID`);

--
-- Indexes for table `scholen`
--
ALTER TABLE `scholen`
  ADD PRIMARY KEY (`schoolID`);

--
-- Indexes for table `spelers`
--
ALTER TABLE `spelers`
  ADD PRIMARY KEY (`spelerID`),
  ADD KEY `schoolID` (`schoolID`);

--
-- Indexes for table `toernooien`
--
ALTER TABLE `toernooien`
  ADD PRIMARY KEY (`toernooiID`);

--
-- Indexes for table `wedstrijd`
--
ALTER TABLE `wedstrijd`
  ADD PRIMARY KEY (`wedstrijdsID`),
  ADD KEY `toernooiID` (`toernooiID`),
  ADD KEY `speler1ID` (`speler1ID`),
  ADD KEY `speler2ID` (`speler2ID`),
  ADD KEY `winnaarsID` (`winnaarsID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aanmelding`
--
ALTER TABLE `aanmelding`
  MODIFY `aanmeldingsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `scholen`
--
ALTER TABLE `scholen`
  MODIFY `schoolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `spelers`
--
ALTER TABLE `spelers`
  MODIFY `spelerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `toernooien`
--
ALTER TABLE `toernooien`
  MODIFY `toernooiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wedstrijd`
--
ALTER TABLE `wedstrijd`
  MODIFY `wedstrijdsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aanmelding`
--
ALTER TABLE `aanmelding`
  ADD CONSTRAINT `aanmelding_ibfk_1` FOREIGN KEY (`spelerID`) REFERENCES `spelers` (`spelerID`),
  ADD CONSTRAINT `aanmelding_ibfk_2` FOREIGN KEY (`toernooiID`) REFERENCES `toernooien` (`toernooiID`);

--
-- Constraints for table `spelers`
--
ALTER TABLE `spelers`
  ADD CONSTRAINT `spelers_ibfk_1` FOREIGN KEY (`schoolID`) REFERENCES `scholen` (`schoolID`);

--
-- Constraints for table `wedstrijd`
--
ALTER TABLE `wedstrijd`
  ADD CONSTRAINT `wedstrijd_ibfk_1` FOREIGN KEY (`toernooiID`) REFERENCES `toernooien` (`toernooiID`),
  ADD CONSTRAINT `wedstrijd_ibfk_2` FOREIGN KEY (`speler1ID`) REFERENCES `spelers` (`spelerID`),
  ADD CONSTRAINT `wedstrijd_ibfk_3` FOREIGN KEY (`speler2ID`) REFERENCES `spelers` (`spelerID`),
  ADD CONSTRAINT `wedstrijd_ibfk_4` FOREIGN KEY (`winnaarsID`) REFERENCES `spelers` (`spelerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
