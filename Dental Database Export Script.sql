-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 11:55 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dentaldatabase`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getAppointmentAmountDue` (`id_in` INT) RETURNS DECIMAL(9,2) READS SQL DATA
    DETERMINISTIC
begin
declare due decimal(9,2);
set due =coalesce((select sum(coalesce(amount,0))
from patientledger
where appointmentid = id_in ),0);
return due;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `addressLine1` char(30) DEFAULT NULL,
  `addressLine2` char(30) DEFAULT NULL,
  `town` char(30) DEFAULT NULL,
  `county` char(30) DEFAULT NULL,
  `postCode` char(30) DEFAULT NULL,
  `country` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `addressLine1`, `addressLine2`, `town`, `county`, `postCode`, `country`) VALUES
(1, 'Cnoc na Gréine', NULL, 'Furbo', 'Galway', 'H91 KHC6', 'Ireland'),
(2, 'Lios Ealtan', NULL, 'Wesport', 'Mayo', 'P41 KFS2', 'Ireland'),
(3, 'White Strand Avenue', NULL, 'Cobh', 'Cork', 'L93 LVP3', 'Ireland'),
(4, 'Ocean Drive', NULL, 'Dingle', 'Kerry', 'J11 OYD2', 'Ireland'),
(5, 'Grattan Park', NULL, 'Thurles', 'Tipperary', 'P23 JSN6', 'Ireland'),
(6, 'Crescent Drive', NULL, 'Scotstown', 'Monaghan', 'J24 JFR9', 'Ireland'),
(7, 'Old Square', NULL, 'Rossculligan', 'Cavan', 'L86 FSW2', 'Ireland'),
(8, 'New Town', NULL, 'Ballyfin', 'Laois', 'P81 PGF8', 'Ireland'),
(9, 'Henry Street', NULL, 'Ballymote', 'Sligo', 'J65 DPQ5', 'Ireland'),
(10, 'Abbey Park', NULL, 'Ennis', 'Clare', 'L93 RNS8', 'Ireland'),
(11, 'Bailey Point', NULL, 'Cobh', 'Cork', 'L76 DRO9', 'Ireland'),
(12, 'Hampstead Heath', NULL, 'Dundalk', 'Louth', 'D43 AOP3', 'Ireland'),
(13, 'Village Square', NULL, 'Barna', 'Galway', 'K87 GAQ2', 'Ireland'),
(14, 'Beach Shore', NULL, 'Letterkenny', 'Donegal', 'K54 KHJ7', 'Ireland'),
(15, 'Lake View', NULL, 'Belfast', 'Antrim', 'J30 HPW6', 'Ireland'),
(16, 'Old Road', NULL, 'Omagh', 'Tyrone', 'I95 KPO3', 'Ireland'),
(17, 'Sunny Drive', NULL, 'Bray', 'Wicklow', 'Z27 GQP4', 'Ireland'),
(18, 'Forest Road', NULL, 'Stradbally', 'Laois', 'F45 API3', 'Ireland'),
(19, 'Village Park', NULL, 'Spiddal', 'Galway', 'E36 AIR5', 'Ireland'),
(20, 'Beach Front', NULL, 'Midleton', 'Cork', 'U57 AOE6', 'Ireland'),
(21, 'Dental District', NULL, 'Cobh', 'Cork', 'D59 FEI2', 'Ireland'),
(22, 'New Bridge', NULL, 'Tallaght', 'Dublin', 'Y43 JRA8', 'Ireland'),
(23, 'Ashley Court', NULL, 'Ballyvalla', 'Waterford', 'O90 SER2', 'Ireland'),
(24, 'Ols lane', NULL, 'Dromiskin', 'Louth', 'KF7 DQA3', 'Ireland'),
(25, 'River Park', NULL, 'Cloonshee', 'Roscommon', 'L93 FTP8', 'Ireland'),
(26, 'Fort Lorenzo', NULL, 'Rahoon', 'Galway', 'AO3 FWM5', 'Ireland');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `dentistId` smallint(6) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `previousAppointmentId` int(11) DEFAULT NULL,
  `totalAppointmentPrice` decimal(8,2) DEFAULT NULL,
  `isFullyPaid` tinyint(1) DEFAULT 0,
  `isCancelled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentId`, `patientId`, `dentistId`, `date`, `time`, `previousAppointmentId`, `totalAppointmentPrice`, `isFullyPaid`, `isCancelled`) VALUES
(1, 7, 1, '2021-01-05', '14:30:00', NULL, '130.00', 0, 0),
(2, 11, 1, '2021-01-07', '11:30:00', NULL, '530.00', 0, 0),
(3, 4, 1, '2021-01-11', '09:00:00', NULL, '1080.00', 0, 0),
(4, 18, 1, '2021-01-12', '15:00:00', NULL, '10.00', 1, 1),
(5, 5, 1, '2021-01-15', '11:00:00', NULL, '840.00', 0, 0),
(6, 10, 1, '2021-01-19', '12:00:00', NULL, '320.00', 1, 0),
(7, 14, 1, '2021-01-27', '16:30:00', NULL, '80.00', 1, 0),
(8, 6, 1, '2021-02-01', '12:30:00', NULL, '730.00', 0, 0),
(9, 3, 1, '2021-02-05', '09:00:00', NULL, '2080.00', 0, 0),
(10, 12, 1, '2021-02-08', '14:00:00', NULL, '570.00', 1, 0),
(11, 20, 1, '2021-02-11', '09:00:00', NULL, '80.00', 1, 0),
(12, 15, 1, '2021-02-15', '14:30:00', NULL, '130.00', 1, 0),
(13, 13, 1, '2021-02-18', '11:30:00', NULL, '130.00', 0, 0),
(14, 19, 1, '2021-02-23', '16:00:00', NULL, '10.00', 1, 1),
(15, 17, 1, '2021-02-26', '09:30:00', NULL, '370.00', 0, 0),
(16, 1, 1, '2021-03-03', '11:00:00', NULL, '80.00', 1, 0),
(17, 9, 1, '2021-03-10', '14:00:00', NULL, '80.00', 0, 0),
(18, 16, 1, '2021-03-19', '16:30:00', NULL, '880.00', 0, 0),
(19, 8, 1, '2021-03-23', '12:00:00', NULL, '80.00', 1, 0),
(20, 2, 1, '2021-03-26', '12:30:00', NULL, '80.00', 1, 0),
(21, 11, 1, '2021-01-14', '15:30:00', 2, '520.00', 0, 0),
(22, 14, 1, '2021-02-03', '09:30:00', 7, '600.00', 0, 0),
(23, 20, 1, '2021-02-19', '11:30:00', 11, '360.00', 1, 0),
(24, 13, 1, '2021-02-25', '09:30:00', 13, '1120.00', 0, 0),
(25, 1, 1, '2021-03-10', '12:30:00', 16, '1000.00', 0, 0),
(26, 8, 1, '2021-04-01', '14:30:00', 19, '480.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointmentdetails`
--

CREATE TABLE `appointmentdetails` (
  `appointmentDetailsId` int(11) NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `treatmentId` smallint(6) NOT NULL,
  `treatmentQuantity` smallint(6) DEFAULT NULL,
  `singleTreatmentPrice` decimal(8,2) DEFAULT NULL,
  `totalTreatmentPrice` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointmentdetails`
--

INSERT INTO `appointmentdetails` (`appointmentDetailsId`, `appointmentId`, `treatmentId`, `treatmentQuantity`, `singleTreatmentPrice`, `totalTreatmentPrice`) VALUES
(1, 1, 1, 1, '80.00', '80.00'),
(2, 1, 4, 1, '50.00', '50.00'),
(3, 2, 1, 1, '80.00', '80.00'),
(4, 2, 3, 2, '200.00', '400.00'),
(5, 2, 4, 1, '50.00', '50.00'),
(6, 3, 1, 1, '80.00', '80.00'),
(7, 3, 5, 1, '1000.00', '1000.00'),
(8, 5, 1, 1, '80.00', '80.00'),
(9, 5, 2, 3, '120.00', '360.00'),
(10, 5, 3, 2, '200.00', '400.00'),
(11, 6, 1, 1, '80.00', '80.00'),
(12, 6, 2, 2, '120.00', '240.00'),
(13, 7, 1, 1, '80.00', '80.00'),
(14, 8, 1, 1, '80.00', '80.00'),
(15, 8, 3, 3, '200.00', '600.00'),
(16, 8, 4, 1, '50.00', '50.00'),
(17, 9, 1, 1, '80.00', '80.00'),
(18, 9, 5, 2, '1000.00', '2000.00'),
(19, 10, 1, 1, '80.00', '80.00'),
(20, 10, 4, 1, '50.00', '50.00'),
(21, 10, 2, 2, '120.00', '240.00'),
(22, 10, 3, 1, '200.00', '200.00'),
(23, 11, 1, 1, '80.00', '80.00'),
(24, 12, 1, 1, '80.00', '80.00'),
(25, 12, 4, 1, '50.00', '50.00'),
(26, 13, 1, 1, '80.00', '80.00'),
(27, 13, 4, 1, '50.00', '50.00'),
(28, 15, 1, 1, '80.00', '80.00'),
(29, 15, 4, 1, '50.00', '50.00'),
(30, 15, 2, 2, '120.00', '240.00'),
(31, 16, 1, 1, '80.00', '80.00'),
(32, 17, 1, 1, '80.00', '80.00'),
(33, 18, 1, 1, '80.00', '80.00'),
(34, 18, 3, 4, '200.00', '800.00'),
(35, 19, 1, 1, '80.00', '80.00'),
(36, 20, 1, 1, '80.00', '80.00'),
(37, 21, 2, 1, '120.00', '120.00'),
(38, 21, 3, 2, '200.00', '400.00'),
(39, 22, 3, 3, '200.00', '600.00'),
(40, 23, 2, 3, '120.00', '360.00'),
(41, 24, 2, 1, '120.00', '120.00'),
(42, 24, 5, 1, '1000.00', '1000.00'),
(43, 25, 5, 1, '1000.00', '1000.00'),
(44, 26, 2, 4, '120.00', '480.00');

-- --------------------------------------------------------

--
-- Table structure for table `contactinformation`
--

CREATE TABLE `contactinformation` (
  `contactInfoId` int(11) NOT NULL,
  `phoneNumber` char(30) DEFAULT NULL,
  `email` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactinformation`
--

INSERT INTO `contactinformation` (`contactInfoId`, `phoneNumber`, `email`) VALUES
(1, '0863427403', 'danielclyne@hotmail.com'),
(2, '087266372', 'daveyjones@gmail.com'),
(3, '0858561204', 'micko@outlook.com'),
(4, '0873056295', 'jjflaherty@yahoo.com'),
(5, '0879344965', 'rachelf@gmail.com'),
(6, '0871835396', 'tscott@gmail.com'),
(7, '0852855621', 'freswan@yahoo.com'),
(8, '0863498115', 'bingt@outlook.com'),
(9, '0877193773', 'jessyl@gmail.com'),
(10, '08609393920', 'anneperk@hotmail.com'),
(11, '08636305633', 'eiladams@gmail.com'),
(12, '0852200456', 'rebwalsh@hotmail.com'),
(13, '0864402959', 'sartan@outlook.com'),
(14, '0866229645', 'kevcole@yahoo.com'),
(15, '0859920293', 'elizah@outllok.com'),
(16, '0870032848', 'paulmur@gmail.com'),
(17, '0863598943', 'chrishef@hotmail.com'),
(18, '0857743008', 'hancol@gmail.com'),
(19, '0863663997', 'nickc@yahoo.com'),
(20, '0858830284', 'amypo@hotmail.com'),
(21, '0865492274', 'dentistmulcahy@gmail.com'),
(22, '0853957225', 'frankortho@gmail.com'),
(23, '0868843910', 'jimendo@outlook.com'),
(24, '0858240572', 'sanpatho@gmail.com'),
(25, '0874930548', 'sarperio@gmail.com'),
(26, '0853885275', 'mikeprostho@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `dentistId` smallint(6) NOT NULL,
  `firstName` char(30) DEFAULT NULL,
  `lastName` char(30) DEFAULT NULL,
  `clinicAddress` int(11) DEFAULT NULL,
  `contactInformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`dentistId`, `firstName`, `lastName`, `clinicAddress`, `contactInformation`) VALUES
(1, 'Mary', 'Mulcahy', 21, 21);

-- --------------------------------------------------------

--
-- Table structure for table `ledgerentrytype`
--

CREATE TABLE `ledgerentrytype` (
  `ledgerEntryTypeId` smallint(6) NOT NULL,
  `entryType` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ledgerentrytype`
--

INSERT INTO `ledgerentrytype` (`ledgerEntryTypeId`, `entryType`) VALUES
(1, 'Service Charge'),
(2, 'Late Cancellation Fee'),
(3, 'Full Payment'),
(4, 'Partial Payment');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `firstName` char(30) DEFAULT NULL,
  `lastName` char(30) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `address` int(11) DEFAULT NULL,
  `contactInformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `firstName`, `lastName`, `dateOfBirth`, `address`, `contactInformation`) VALUES
(1, 'Daniel', 'Clyne', '1988-12-16', 1, 1),
(2, 'David', 'Jones', '1992-02-11', 2, 2),
(3, 'Michael', 'Hanson', '1999-11-19', 3, 3),
(4, 'James', 'Flaherty', '2002-05-08', 4, 4),
(5, 'Rachel', 'Fahy', '1997-04-22', 5, 5),
(6, 'Tom', 'Scott', '2005-07-30', 6, 6),
(7, 'Fred', 'Swanson', '2001-03-17', 7, 7),
(8, 'Tony', 'Bing', '1983-10-13', 8, 8),
(9, 'Jessica', 'Ludgate', '1986-06-15', 9, 9),
(10, 'Anne', 'Perkins', '2004-08-09', 10, 10),
(11, 'Eileen', 'Adams', '1962-03-03', 11, 11),
(12, 'Rebecca', 'Walsh', '1975-07-16', 12, 12),
(13, 'Sarah', 'Tansey', '1984-11-10', 13, 13),
(14, 'Kevin', 'Coleman', '2000-01-08', 14, 14),
(15, 'Elizabeth', 'Hester', '2010-08-13', 15, 15),
(16, 'Paul', 'Murray', '1961-12-26', 16, 16),
(17, 'Christopher', 'Heffernan', '1968-09-19', 17, 17),
(18, 'Hannah', 'Colbert', '2008-02-28', 18, 18),
(19, 'Nicholas', 'Cage', '2001-05-15', 19, 19),
(20, 'Amy', 'Poehler', '1986-12-01', 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `patientchart`
--

CREATE TABLE `patientchart` (
  `patientChartId` int(11) NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `appointmentId` int(11) DEFAULT NULL,
  `appointmentReport` text DEFAULT NULL,
  `referredToSpecialist` smallint(6) DEFAULT NULL,
  `specialistReportId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientchart`
--

INSERT INTO `patientchart` (`patientChartId`, `patientId`, `appointmentId`, `appointmentReport`, `referredToSpecialist`, `specialistReportId`) VALUES
(1, 1, 16, 'The patient recieved a routine checkup only.', NULL, NULL),
(2, 3, 9, 'The patient recieved a routine checkup and two root canals', NULL, NULL),
(3, 4, 3, 'The patient recieved a routine checkup and a root canal.', NULL, NULL),
(4, 6, 8, 'The patient recieved a routine checkup, three premium filling and a clean and polish.', NULL, NULL),
(5, 8, 19, 'The patient recieved a routine checkup only.', NULL, NULL),
(6, 9, 17, 'The patient recieved a routine checkup only', NULL, NULL),
(7, 11, 2, 'The patient recieved a routine checkup, two premium fillings and a clean and polish.', NULL, NULL),
(8, 13, 13, 'The patient recieved a routine checkup and a clean and polish.', NULL, NULL),
(9, 14, 7, 'The patient recieved a routine checkup only.', NULL, NULL),
(10, 15, 12, 'The patient recieved a routine checkup and a clean and polish.', NULL, NULL),
(11, 17, 15, 'The patient recieved a routine checkup, two regular fillings and a clean and polish.', NULL, NULL),
(12, 18, 4, 'Appointment Cancelled', NULL, NULL),
(13, 19, 14, 'Appointment Cancelled', NULL, NULL),
(14, 20, 11, 'The patient recieved a routine checkup only.', NULL, NULL),
(15, 2, 20, 'The patient recieved a routine checkup and was referred to a Periodontist', 4, 1),
(16, 5, 5, 'The patient recieved a routine checkup three regular filling and two premium filling. The patient was also referred to an Endodontist.', 2, 2),
(17, 7, 1, 'The patient recieved a routine checkup and a clean and polish. The patient was also referred to an Orthodontist.', 1, 3),
(18, 10, 6, 'The patient recieved a routine checkup and two regular fillings. The patient was also referred to an Oral Pathologist.', 3, 4),
(19, 12, 10, 'The patient recieved a routine checkup, two regular fillings a premium fillings and a clean and polish. The patient was also referred to an Prosthodontist', 5, 5),
(20, 16, 18, 'The patient recieved a routine checkup and four premium fillings. The patient was also referred to an Endodontist.', 2, 6),
(21, 1, 25, 'The patient recieved a root canal.', NULL, NULL),
(22, 8, 26, 'The patient recieved four regular fillings.', NULL, NULL),
(23, 11, 21, 'The patient recieved a regular filling and two premium fillings', NULL, NULL),
(24, 13, 24, 'The patient recieved a regular filling and a root canal.', NULL, NULL),
(25, 14, 22, 'The patient recieved three premium fillings.', NULL, NULL),
(26, 20, 23, 'The patient recieved three regular fillings.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patientledger`
--

CREATE TABLE `patientledger` (
  `ledgerId` int(11) NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `appointmentId` int(11) DEFAULT NULL,
  `entryType` smallint(6) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientledger`
--

INSERT INTO `patientledger` (`ledgerId`, `patientId`, `appointmentId`, `entryType`, `amount`, `createdDateTime`) VALUES
(101, 7, 1, 1, '130.00', '2021-04-24 21:54:27'),
(102, 7, 1, 4, '-50.00', '2021-04-24 21:54:27'),
(103, 11, 2, 1, '530.00', '2021-04-24 21:54:27'),
(104, 11, 2, 4, '-250.00', '2021-04-24 21:54:27'),
(105, 4, 3, 1, '1080.00', '2021-04-24 21:54:27'),
(106, 4, 3, 4, '-500.00', '2021-04-24 21:54:27'),
(107, 18, 4, 2, '10.00', '2021-04-24 21:54:27'),
(108, 18, 4, 3, '-10.00', '2021-04-24 21:54:27'),
(109, 5, 5, 1, '840.00', '2021-04-24 21:54:27'),
(110, 5, 5, 4, '-500.00', '2021-04-24 21:54:27'),
(111, 10, 6, 1, '320.00', '2021-04-24 21:54:27'),
(112, 10, 6, 3, '-320.00', '2021-04-24 21:54:27'),
(113, 14, 7, 1, '80.00', '2021-04-24 21:54:27'),
(114, 14, 7, 3, '-80.00', '2021-04-24 21:54:27'),
(115, 6, 8, 1, '730.00', '2021-04-24 21:54:27'),
(116, 6, 8, 4, '-350.00', '2021-04-24 21:54:27'),
(117, 3, 9, 1, '2080.00', '2021-04-24 21:54:27'),
(118, 3, 9, 4, '-1000.00', '2021-04-24 21:54:27'),
(119, 12, 10, 1, '570.00', '2021-04-24 21:54:27'),
(120, 12, 10, 3, '-570.00', '2021-04-24 21:54:27'),
(121, 20, 11, 1, '80.00', '2021-04-24 21:54:27'),
(122, 20, 11, 3, '-80.00', '2021-04-24 21:54:27'),
(123, 15, 12, 1, '130.00', '2021-04-24 21:54:27'),
(124, 15, 12, 3, '-130.00', '2021-04-24 21:54:27'),
(125, 13, 13, 1, '130.00', '2021-04-24 21:54:27'),
(126, 13, 13, 4, '-50.00', '2021-04-24 21:54:27'),
(127, 19, 14, 2, '10.00', '2021-04-24 21:54:27'),
(128, 19, 14, 3, '-10.00', '2021-04-24 21:54:27'),
(129, 17, 15, 1, '370.00', '2021-04-24 21:54:27'),
(130, 17, 15, 4, '-200.00', '2021-04-24 21:54:27'),
(131, 1, 16, 1, '80.00', '2021-04-24 21:54:27'),
(132, 1, 16, 3, '-80.00', '2021-04-24 21:54:27'),
(133, 9, 17, 1, '80.00', '2021-04-24 21:54:27'),
(134, 9, 17, 4, '-30.00', '2021-04-24 21:54:27'),
(135, 16, 18, 1, '880.00', '2021-04-24 21:54:27'),
(136, 16, 18, 4, '-200.00', '2021-04-24 21:54:27'),
(137, 8, 19, 1, '80.00', '2021-04-24 21:54:27'),
(138, 8, 19, 3, '-80.00', '2021-04-24 21:54:27'),
(139, 2, 20, 1, '80.00', '2021-04-24 21:54:27'),
(140, 2, 20, 3, '-80.00', '2021-04-24 21:54:27'),
(141, 11, 21, 1, '520.00', '2021-04-24 21:54:27'),
(142, 11, 21, 4, '-200.00', '2021-04-24 21:54:27'),
(143, 14, 22, 1, '600.00', '2021-04-24 21:54:27'),
(144, 14, 22, 4, '-200.00', '2021-04-24 21:54:27'),
(145, 20, 23, 1, '360.00', '2021-04-24 21:54:27'),
(146, 20, 23, 3, '-360.00', '2021-04-24 21:54:27'),
(147, 13, 24, 1, '1120.00', '2021-04-24 21:54:27'),
(148, 13, 24, 4, '-500.00', '2021-04-24 21:54:27'),
(149, 1, 25, 1, '1000.00', '2021-04-24 21:54:27'),
(150, 1, 25, 4, '-350.00', '2021-04-24 21:54:27'),
(151, 8, 26, 1, '480.00', '2021-04-24 21:54:27'),
(152, 8, 26, 3, '-480.00', '2021-04-24 21:54:27');

--
-- Triggers `patientledger`
--
DELIMITER $$
CREATE TRIGGER `patientledger_after_insert` AFTER INSERT ON `patientledger` FOR EACH ROW begin
declare due decimal(9,2);
set due = getAppointmentAmountDue(new.appointmentid);
if(due <= 0) then
update appointment set isfullypaid = 1 where appointmentid = new.appointmentid;
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `ledgerId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  `paymentType` smallint(6) DEFAULT NULL,
  `paymentAmount` decimal(8,2) DEFAULT NULL,
  `paymentDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `ledgerId`, `patientId`, `paymentType`, `paymentAmount`, `paymentDateTime`) VALUES
(101, 102, 7, 1, '50.00', '2021-04-24 21:54:27'),
(102, 104, 11, 2, '250.00', '2021-04-24 21:54:27'),
(103, 106, 4, 1, '500.00', '2021-04-24 21:54:27'),
(104, 108, 18, 1, '10.00', '2021-04-24 21:54:27'),
(105, 110, 5, 2, '500.00', '2021-04-24 21:54:27'),
(106, 112, 10, 3, '320.00', '2021-04-24 21:54:27'),
(107, 114, 14, 1, '80.00', '2021-04-24 21:54:27'),
(108, 116, 6, 1, '350.00', '2021-04-24 21:54:27'),
(109, 118, 3, 1, '1000.00', '2021-04-24 21:54:27'),
(110, 120, 12, 2, '570.00', '2021-04-24 21:54:27'),
(111, 122, 20, 3, '80.00', '2021-04-24 21:54:27'),
(112, 124, 15, 2, '130.00', '2021-04-24 21:54:27'),
(113, 126, 13, 2, '50.00', '2021-04-24 21:54:27'),
(114, 128, 19, 3, '10.00', '2021-04-24 21:54:27'),
(115, 130, 17, 2, '200.00', '2021-04-24 21:54:27'),
(116, 132, 1, 1, '80.00', '2021-04-24 21:54:27'),
(117, 134, 9, 2, '30.00', '2021-04-24 21:54:27'),
(118, 136, 16, 1, '200.00', '2021-04-24 21:54:27'),
(119, 138, 8, 1, '80.00', '2021-04-24 21:54:27'),
(120, 140, 2, 2, '80.00', '2021-04-24 21:54:27'),
(121, 142, 11, 1, '200.00', '2021-04-24 21:54:27'),
(122, 144, 14, 2, '200.00', '2021-04-24 21:54:27'),
(123, 146, 20, 3, '360.00', '2021-04-24 21:54:27'),
(124, 148, 13, 2, '500.00', '2021-04-24 21:54:27'),
(125, 150, 1, 1, '350.00', '2021-04-24 21:54:27'),
(126, 152, 8, 1, '480.00', '2021-04-24 21:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttype`
--

CREATE TABLE `paymenttype` (
  `paymentTypeId` smallint(6) NOT NULL,
  `paymentType` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymenttype`
--

INSERT INTO `paymenttype` (`paymentTypeId`, `paymentType`) VALUES
(1, 'Cash'),
(2, 'Card'),
(3, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `specialistId` smallint(6) NOT NULL,
  `specialisation` char(30) DEFAULT NULL,
  `firstName` char(30) DEFAULT NULL,
  `lastName` char(30) DEFAULT NULL,
  `clinicAddress` int(11) DEFAULT NULL,
  `contactInformation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`specialistId`, `specialisation`, `firstName`, `lastName`, `clinicAddress`, `contactInformation`) VALUES
(1, 'Orthodontist', 'Frank', 'Peters', 22, 22),
(2, 'Endodontist', 'Jim', 'McGuire', 23, 23),
(3, 'Oral Pathologist', 'Sandra', 'McManus', 24, 24),
(4, 'Periodontist', 'Sarah', 'Treanor', 25, 25),
(5, 'Prosthodontist', 'Michael', 'Brady', 26, 26);

-- --------------------------------------------------------

--
-- Table structure for table `specialistreport`
--

CREATE TABLE `specialistreport` (
  `specialistReportId` int(11) NOT NULL,
  `specialistId` smallint(6) DEFAULT NULL,
  `appointmentId` int(11) NOT NULL,
  `reportDetails` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialistreport`
--

INSERT INTO `specialistreport` (`specialistReportId`, `specialistId`, `appointmentId`, `reportDetails`) VALUES
(1, 4, 20, 'Periodontal disease encompasses a number of diseases of the periodontal tissues that result in attachment loss and destruction of alveolar bone. Individual risk factors include: Gender, smoking and alcohol consumption, diabetes, obesity and metabolic syndrome, osteoporosis and Vitamin D conditions, stress and genetic factors.'),
(2, 2, 5, 'Endodontics encompasses the study (practice) of the basic and clinical sciences of normal dental pulp, the etiology, diagnosis, prevention, and treatment of diseases and injuries of the dental pulp along with associated periradicular conditions.'),
(3, 1, 1, 'Orthodontics is a specialty of dentistry that deals with the diagnosis, prevention, and correction of malpositioned teeth and jaws, and misaligned bite patterns. It can also focus on modifying facial growth, known as dentofacial orthopedics.'),
(4, 3, 6, 'Oral and maxillofacial pathology refers to the diseases of the mouth (\"oral cavity\" or \"stoma\"), jaws (\"maxillae\" or \"gnath\") and related structures such as salivary glands, temporomandibular joints, facial muscles and perioral skin (the skin around the mouth). The mouth is an important organ with many different functions. It is also prone to a variety of medical and dental disorders.'),
(5, 5, 10, 'Dental prostheory was pioneered by French surgeon Pierre Fauchard during the late 17th and early 18th century. Despite the limitations of the primitive surgical instruments, Fauchard discovered many methods to replace lost teeth using substitutes made from carved blocks of ivory or bone. He also introduced dental braces to correct the position of teeth using gold wires and silk threads.'),
(6, 2, 18, 'Endodontics encompasses the study (practice) of the basic and clinical sciences of normal dental pulp, the etiology, diagnosis, prevention, and treatment of diseases and injuries of the dental pulp along with associated periradicular conditions.');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentId` smallint(6) NOT NULL,
  `treatmentType` char(50) DEFAULT NULL,
  `treatmentDescription` char(200) DEFAULT NULL,
  `treatmentPrice` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentId`, `treatmentType`, `treatmentDescription`, `treatmentPrice`) VALUES
(1, 'Routine Checkup', 'Examination of teeth', '80.00'),
(2, 'Regular Filling', 'Placing a regular filling', '120.00'),
(3, 'Premium Filling', 'Placing a premium filling', '200.00'),
(4, 'Clean and Polish', 'Full cleaning and polish of teeth', '50.00'),
(5, 'Root Canal', 'Remove root from tooth and fill', '1000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `dentistId` (`dentistId`),
  ADD KEY `previousAppointmentId` (`previousAppointmentId`);

--
-- Indexes for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD PRIMARY KEY (`appointmentDetailsId`),
  ADD KEY `appointmentId` (`appointmentId`),
  ADD KEY `treatmentId` (`treatmentId`);

--
-- Indexes for table `contactinformation`
--
ALTER TABLE `contactinformation`
  ADD PRIMARY KEY (`contactInfoId`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`dentistId`),
  ADD KEY `clinicAddress` (`clinicAddress`),
  ADD KEY `contactInformation` (`contactInformation`);

--
-- Indexes for table `ledgerentrytype`
--
ALTER TABLE `ledgerentrytype`
  ADD PRIMARY KEY (`ledgerEntryTypeId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD KEY `address` (`address`),
  ADD KEY `contactInformation` (`contactInformation`);

--
-- Indexes for table `patientchart`
--
ALTER TABLE `patientchart`
  ADD PRIMARY KEY (`patientChartId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `appointmentId` (`appointmentId`),
  ADD KEY `referredToSpecialist` (`referredToSpecialist`),
  ADD KEY `specialistReportId` (`specialistReportId`);

--
-- Indexes for table `patientledger`
--
ALTER TABLE `patientledger`
  ADD PRIMARY KEY (`ledgerId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `appointmentId` (`appointmentId`),
  ADD KEY `entryType` (`entryType`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `ledgerId` (`ledgerId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `paymentType` (`paymentType`);

--
-- Indexes for table `paymenttype`
--
ALTER TABLE `paymenttype`
  ADD PRIMARY KEY (`paymentTypeId`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`specialistId`),
  ADD KEY `clinicAddress` (`clinicAddress`),
  ADD KEY `contactInformation` (`contactInformation`);

--
-- Indexes for table `specialistreport`
--
ALTER TABLE `specialistreport`
  ADD PRIMARY KEY (`specialistReportId`),
  ADD KEY `specialistId` (`specialistId`),
  ADD KEY `appointmentId` (`appointmentId`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  MODIFY `appointmentDetailsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `contactinformation`
--
ALTER TABLE `contactinformation`
  MODIFY `contactInfoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `dentistId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ledgerentrytype`
--
ALTER TABLE `ledgerentrytype`
  MODIFY `ledgerEntryTypeId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patientchart`
--
ALTER TABLE `patientchart`
  MODIFY `patientChartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `patientledger`
--
ALTER TABLE `patientledger`
  MODIFY `ledgerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `paymenttype`
--
ALTER TABLE `paymenttype`
  MODIFY `paymentTypeId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `specialistId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specialistreport`
--
ALTER TABLE `specialistreport`
  MODIFY `specialistReportId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentId` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`dentistId`) REFERENCES `dentist` (`dentistId`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`previousAppointmentId`) REFERENCES `appointment` (`appointmentId`);

--
-- Constraints for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD CONSTRAINT `appointmentdetails_ibfk_1` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  ADD CONSTRAINT `appointmentdetails_ibfk_2` FOREIGN KEY (`treatmentId`) REFERENCES `treatment` (`treatmentId`);

--
-- Constraints for table `dentist`
--
ALTER TABLE `dentist`
  ADD CONSTRAINT `dentist_ibfk_1` FOREIGN KEY (`clinicAddress`) REFERENCES `address` (`addressId`),
  ADD CONSTRAINT `dentist_ibfk_2` FOREIGN KEY (`contactInformation`) REFERENCES `contactinformation` (`contactInfoId`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`address`) REFERENCES `address` (`addressId`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`contactInformation`) REFERENCES `contactinformation` (`contactInfoId`);

--
-- Constraints for table `patientchart`
--
ALTER TABLE `patientchart`
  ADD CONSTRAINT `patientchart_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `patientchart_ibfk_2` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  ADD CONSTRAINT `patientchart_ibfk_3` FOREIGN KEY (`referredToSpecialist`) REFERENCES `specialist` (`specialistId`),
  ADD CONSTRAINT `patientchart_ibfk_4` FOREIGN KEY (`specialistReportId`) REFERENCES `specialistreport` (`specialistReportId`);

--
-- Constraints for table `patientledger`
--
ALTER TABLE `patientledger`
  ADD CONSTRAINT `patientledger_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `patientledger_ibfk_2` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`),
  ADD CONSTRAINT `patientledger_ibfk_3` FOREIGN KEY (`entryType`) REFERENCES `ledgerentrytype` (`ledgerEntryTypeId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ledgerId`) REFERENCES `patientledger` (`ledgerId`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`paymentType`) REFERENCES `paymenttype` (`paymentTypeId`);

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `specialist_ibfk_1` FOREIGN KEY (`clinicAddress`) REFERENCES `address` (`addressId`),
  ADD CONSTRAINT `specialist_ibfk_2` FOREIGN KEY (`contactInformation`) REFERENCES `contactinformation` (`contactInfoId`);

--
-- Constraints for table `specialistreport`
--
ALTER TABLE `specialistreport`
  ADD CONSTRAINT `specialistreport_ibfk_1` FOREIGN KEY (`specialistId`) REFERENCES `specialist` (`specialistId`),
  ADD CONSTRAINT `specialistreport_ibfk_2` FOREIGN KEY (`appointmentId`) REFERENCES `appointment` (`appointmentId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
