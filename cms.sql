-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2018 at 04:46 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `barn`
--

CREATE TABLE `barn` (
  `barnID` varchar(10) NOT NULL,
  `barnType` varchar(20) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `yearBuilt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barn`
--

INSERT INTO `barn` (`barnID`, `barnType`, `width`, `height`, `length`, `yearBuilt`) VALUES
('B0001', 'Freestall', 50, 2, 77, '2017-06-12'),
('B0002', 'Freestall', 75, 5, 150, '2017-07-14'),
('B0003', 'Quarantine', 50, 7, 100, '2017-08-16'),
('B0004', 'Milking', 50, 6, 125, '2017-09-18'),
('B0005', 'Freestall', 75, 5, 150, '2017-10-20'),
('B0006', 'Milking', 50, 6, 125, '2017-11-22'),
('B0007', 'Calf', 50, 2, 75, '2017-12-24'),
('B0008', 'Quarantine', 50, 7, 100, '2018-01-02'),
('B0009', 'Freestall', 75, 5, 150, '2018-02-04'),
('B0010', 'Milking', 50, 6, 125, '2018-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `dateIn` date NOT NULL,
  `dateOut` date DEFAULT NULL,
  `cowTag` varchar(10) NOT NULL,
  `barnID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkin`
--

INSERT INTO `checkin` (`dateIn`, `dateOut`, `cowTag`, `barnID`) VALUES
('2018-04-16', NULL, 'C0001', 'B0005'),
('2018-04-16', '2018-04-16', 'C0002', 'B0002'),
('2018-04-16', NULL, 'C0002', 'B0004'),
('2018-04-16', NULL, 'C0003', 'B0003'),
('2018-04-16', NULL, 'C0004', 'B0006'),
('2018-04-16', NULL, 'C0005', 'B0008'),
('2018-04-17', NULL, 'C0001', 'B0002'),
('2018-04-17', '2018-04-17', 'C0006', 'B0002'),
('2018-04-17', NULL, 'C0006', 'B0010'),
('2018-04-17', '2018-05-15', 'C0007', 'B0003'),
('2018-04-17', '2018-04-17', 'C0007', 'B0005'),
('2018-05-15', NULL, 'C0007', 'B0001'),
('2018-05-15', NULL, 'C0008', 'B0001'),
('2018-05-15', NULL, 'C0009', 'B0005'),
('2018-05-15', NULL, 'C0011', 'B0004');

-- --------------------------------------------------------

--
-- Table structure for table `checkup`
--

CREATE TABLE `checkup` (
  `checkupDateTime` datetime NOT NULL,
  `cowTag` varchar(10) NOT NULL,
  `diseaseID` varchar(10) NOT NULL,
  `staffID` varchar(10) NOT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `status` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkup`
--

INSERT INTO `checkup` (`checkupDateTime`, `cowTag`, `diseaseID`, `staffID`, `notes`, `status`) VALUES
('2018-04-16 20:33:00', 'C0001', 'D0002', 'S0002', 'Mainly in mouth area.', 'treated'),
('2018-04-16 21:24:00', 'C0001', 'D0001', 'S0002', 'Mainly in mouth area.', 'treated'),
('2018-04-16 21:57:00', 'C0001', 'D0002', 'S0002', 'Feet affected.', 'treated'),
('2018-04-17 06:59:00', 'C0008', 'D0001', 'S0001', 'Mainly in stomatch area.', 'treated'),
('2018-04-17 07:00:00', 'C0005', 'D0002', 'S0001', 'Mainly in feet area.', 'treated'),
('2018-04-17 07:00:00', 'C0007', 'D0002', 'S0001', 'Feet affected.', 'treated'),
('2018-04-17 07:01:00', 'C0006', 'D0002', 'S0001', 'Mainly in mouth area.', 'treated'),
('2018-04-17 07:01:00', 'C0007', 'D0001', 'S0001', 'Tail affected.', 'untreated'),
('2018-04-17 07:02:00', 'C0004', 'D0001', 'S0001', 'Mainly in mouth area.', 'untreated'),
('2018-04-17 07:05:00', 'C0002', 'D0001', 'S0001', 'Mainly in mouth area.', 'untreated'),
('2018-04-17 09:13:00', 'C0001', 'D0002', 'S0001', 'Mainly in mouth area', 'untreated'),
('2018-05-15 12:46:00', 'C0007', 'D0001', 'S0001', 'Mainly in stomatch area.', 'untreated');

-- --------------------------------------------------------

--
-- Table structure for table `cow`
--

CREATE TABLE `cow` (
  `cowTag` varchar(10) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `breed` varchar(20) DEFAULT NULL,
  `cowStatus` varchar(20) DEFAULT NULL,
  `earlyAge` int(2) DEFAULT NULL,
  `earlyWeight` double DEFAULT NULL,
  `finalAge` int(2) DEFAULT NULL,
  `finalWeight` double DEFAULT NULL,
  `barnID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cow`
--

INSERT INTO `cow` (`cowTag`, `gender`, `breed`, `cowStatus`, `earlyAge`, `earlyWeight`, `finalAge`, `finalWeight`, `barnID`) VALUES
('C0001', 'M', 'Adaptaur', 'Sold', 6, 2.76, NULL, NULL, 'B0002'),
('C0002', 'F', 'Adaptaur', 'Sold', 6, 10, NULL, NULL, 'B0004'),
('C0003', 'M', 'Braford', 'Sold', 6, 10, NULL, NULL, 'B0003'),
('C0004', 'F', 'Abondance (cattle)', 'Sold', 6, 10, NULL, NULL, 'B0006'),
('C0005', 'M', 'Braford', 'Sold', 6, 10, NULL, NULL, 'B0008'),
('C0006', 'F', 'Adaptaur', 'Sold', 6, 10, NULL, NULL, 'B0010'),
('C0007', 'M', 'Braford', 'Sold', 6, 10, NULL, NULL, 'B0001'),
('C0008', 'F', 'Abondance (cattle)', 'Sick', 6, 10, NULL, NULL, 'B0001'),
('C0009', 'F', 'Adaptaur', 'Healthy', 30, 25, NULL, NULL, 'B0005'),
('C0011', 'M', 'Braford', 'Healthy', 6, 5.06, NULL, NULL, 'B0004');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `diseaseID` varchar(10) NOT NULL,
  `diseaseName` varchar(25) NOT NULL,
  `description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`diseaseID`, `diseaseName`, `description`) VALUES
('D0001', 'Clostridial Disease', 'Clostridial usually occurs in calves or young cattle less than 2 years old and is caused by gangrene that forms in the muscles.'),
('D0002', 'Rabies', 'Rabies can infect all warm blooded animals, including humans. It attacks the central nervous system, causing death.');

-- --------------------------------------------------------

--
-- Table structure for table `feedschedule`
--

CREATE TABLE `feedschedule` (
  `dateFeed` date NOT NULL,
  `timeFeed` time NOT NULL,
  `foodID` varchar(10) NOT NULL,
  `barnID` varchar(10) NOT NULL,
  `quantity` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedschedule`
--

INSERT INTO `feedschedule` (`dateFeed`, `timeFeed`, `foodID`, `barnID`, `quantity`) VALUES
('2018-04-08', '02:15:00', 'F0002', 'B0002', '10'),
('2018-04-09', '03:25:00', 'F0003', 'B0003', '16'),
('2018-04-10', '04:45:00', 'F0004', 'B0004', '17'),
('2018-04-11', '05:55:00', 'F0005', 'B0005', '18'),
('2018-04-12', '06:45:00', 'F0006', 'B0006', '19'),
('2018-04-13', '07:35:00', 'F0007', 'B0007', '12'),
('2018-04-14', '08:15:00', 'F0008', 'B0008', '21'),
('2018-04-16', '10:10:00', 'F0010', 'B0010', '22'),
('2018-04-17', '08:56:00', 'F0004', 'B0003', '11'),
('2018-05-15', '12:43:00', 'F0004', 'B0002', '13');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `foodID` varchar(10) NOT NULL,
  `foodName` varchar(30) DEFAULT NULL,
  `foodType` varchar(30) DEFAULT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`foodID`, `foodName`, `foodType`, `quantity`) VALUES
('F0001', 'Grass', 'Dry', 20),
('F0002', 'Corn', 'Dry', 20),
('F0003', 'Corn', 'Liquid', 34),
('F0004', 'Milk', 'Liquid', 1),
('F0005', 'Grain', 'Dry', 24),
('F0006', 'Soybean', 'Dry', 23),
('F0007', 'Canola', 'Dry', 75),
('F0008', 'Sunflower', 'Dry', 45),
('F0009', 'Beet pulp', 'Liquid', 32),
('F0010', 'Oats', 'Wet', 21);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userName` varchar(10) NOT NULL,
  `pswrd` varchar(8) DEFAULT NULL,
  `userType` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userName`, `pswrd`, `userType`) VALUES
('S0001', 'abc123', 'admin'),
('S0002', 'abc123', 'staff'),
('S0004', 'abc123', 'staff'),
('S0005', 'abc123', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineID` varchar(10) NOT NULL,
  `medicineName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineID`, `medicineName`) VALUES
('M0001', 'Agrimycin 100'),
('M0002', 'Anthrax Spore Vaccine');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `cowTag` varchar(10) NOT NULL,
  `saleName` varchar(50) DEFAULT NULL,
  `noTel` varchar(12) DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`cowTag`, `saleName`, `noTel`, `saleDate`, `price`) VALUES
('C0001', 'Syahmi Bin Azman', '01273765849', '2018-04-17', 2000),
('C0002', 'Arman Bin Amin', '0137488476', '2018-04-17', 2000),
('C0003', 'Syahir Bin Faiz', '0137488476', '2018-04-18', 3000),
('C0004', 'Ali Bin Abu', '0127489366', '2018-04-19', 50000),
('C0007', 'Syamim', '01283774566', '2018-05-17', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` varchar(10) NOT NULL,
  `staffName` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `noTel` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jobTitle` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `address`, `noTel`, `email`, `jobTitle`) VALUES
('S0001', 'Ali bin Ahmad', 'Kampung Raja', '0125678902', 'ali@gmail.com', 'Cow Puncher'),
('S0002', 'Abu bin Ahmadi', 'Johor', '0123456789', 'abu@gmail.com', 'Barn Laborer'),
('S0003', 'Amirul Firdaus', '2-11-9 Jalan 2A/146 Desa Tasik KL', '0126695789', 'firdausunisza@gmail.com', 'Veterinarian'),
('S0004', 'Muhd Risham', 'Batu 6', '0126689876', 'risham@gmail.com', 'Cow Puncher'),
('S0005', 'Syamim Ikhwan', '22 Kelantan', '0124456789', 'shamim@gmail.com', 'Barn Laborer');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentDateTime` datetime NOT NULL,
  `checkupDateTime` datetime NOT NULL,
  `staffID` varchar(10) DEFAULT NULL,
  `medicineID` varchar(10) DEFAULT NULL,
  `medicineMethod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentDateTime`, `checkupDateTime`, `staffID`, `medicineID`, `medicineMethod`) VALUES
('2018-04-17 07:14:00', '2018-04-17 07:00:00', 'S0001', 'M0001', 'Take 2 times a day.'),
('2018-05-15 12:48:00', '2018-04-17 06:59:00', 'S0001', 'M0001', 'Apply 3 times a day');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barn`
--
ALTER TABLE `barn`
  ADD PRIMARY KEY (`barnID`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`dateIn`,`cowTag`,`barnID`),
  ADD KEY `cowTag` (`cowTag`),
  ADD KEY `barnID` (`barnID`);

--
-- Indexes for table `checkup`
--
ALTER TABLE `checkup`
  ADD PRIMARY KEY (`checkupDateTime`,`cowTag`),
  ADD KEY `cowTag` (`cowTag`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `diseaseID` (`diseaseID`);

--
-- Indexes for table `cow`
--
ALTER TABLE `cow`
  ADD PRIMARY KEY (`cowTag`),
  ADD KEY `barnID` (`barnID`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`diseaseID`);

--
-- Indexes for table `feedschedule`
--
ALTER TABLE `feedschedule`
  ADD PRIMARY KEY (`dateFeed`,`timeFeed`,`barnID`),
  ADD KEY `foodID` (`foodID`),
  ADD KEY `barnID` (`barnID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`foodID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`cowTag`),
  ADD KEY `cowTag` (`cowTag`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentDateTime`,`checkupDateTime`),
  ADD KEY `checkupDate` (`checkupDateTime`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `medicineID` (`medicineID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`cowTag`) REFERENCES `cow` (`cowTag`),
  ADD CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`barnID`) REFERENCES `barn` (`barnID`);

--
-- Constraints for table `checkup`
--
ALTER TABLE `checkup`
  ADD CONSTRAINT `checkup_ibfk_1` FOREIGN KEY (`cowTag`) REFERENCES `cow` (`cowTag`),
  ADD CONSTRAINT `checkup_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `checkup_ibfk_3` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`diseaseID`);

--
-- Constraints for table `cow`
--
ALTER TABLE `cow`
  ADD CONSTRAINT `cow_ibfk_1` FOREIGN KEY (`barnID`) REFERENCES `barn` (`barnID`);

--
-- Constraints for table `feedschedule`
--
ALTER TABLE `feedschedule`
  ADD CONSTRAINT `feedschedule_ibfk_1` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`),
  ADD CONSTRAINT `feedschedule_ibfk_2` FOREIGN KEY (`barnID`) REFERENCES `barn` (`barnID`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`cowTag`) REFERENCES `cow` (`cowTag`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `treatment_ibfk_3` FOREIGN KEY (`medicineID`) REFERENCES `medicine` (`medicineID`),
  ADD CONSTRAINT `treatment_ibfk_4` FOREIGN KEY (`checkupDateTime`) REFERENCES `checkup` (`checkupDateTime`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
