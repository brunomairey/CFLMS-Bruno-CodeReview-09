-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 09:58 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_bruno_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_bruno_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_bruno_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `billing_address`
--

CREATE TABLE `billing_address` (
  `id_billingadress` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `zip_code` int(4) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billing_address`
--

INSERT INTO `billing_address` (`id_billingadress`, `street`, `zip_code`, `city`) VALUES
(1, 'Schimmelgasse 1', 1030, 'Vienna'),
(2, 'Schimmelgasse 2', 1030, 'Vienna'),
(3, 'Schimmelgasse 3', 1030, 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `fk_location` int(11) DEFAULT NULL,
  `type` enum('private','company') DEFAULT 'private',
  `name` varchar(55) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `fk_location`, `type`, `name`, `first_name`) VALUES
(1, 1, 'private', 'Trainer', 'Acilio'),
(2, 2, 'private', 'Trainer', 'Serri'),
(3, 3, 'private', 'Trainer', 'Marina'),
(4, 4, 'private', 'Trainer', 'Theodora'),
(5, 5, 'company', 'CodeFactory', NULL),
(6, 6, 'company', 'CodeAcademy', NULL),
(7, 7, 'company', 'FactoryCode', NULL),
(8, 8, 'company', 'AcademyCode', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliver`
--

CREATE TABLE `deliver` (
  `id_deliver` int(11) NOT NULL,
  `fk_package` int(11) DEFAULT NULL,
  `fk_timelocation` int(11) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliver`
--

INSERT INTO `deliver` (`id_deliver`, `fk_package`, `fk_timelocation`, `fk_location`) VALUES
(9, 1, 1, 4),
(10, 2, 2, 2),
(11, 3, 3, 3),
(12, 4, 4, 4),
(13, 5, 5, 5),
(14, 6, 6, 6),
(15, 7, 5, 7),
(16, 8, 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(11) NOT NULL,
  `availability` enum('yes','no') DEFAULT 'no',
  `last_name` varchar(55) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id_employee`, `availability`, `last_name`, `first_name`) VALUES
(1, 'yes', 'Mairey', 'Bruno'),
(2, 'yes', 'Mairey', 'Julien'),
(3, 'yes', 'Mairey', 'Sylvain'),
(4, 'no', 'Mairex', 'Sophie'),
(5, 'no', 'Lier', 'Anna');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  `fk_billing_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `price`, `fk_customer`, `fk_billing_address`) VALUES
(1, '50.00', 1, 1),
(2, '150.00', 2, 1),
(3, '250.00', 3, 2),
(4, '150.50', 4, 2),
(5, '150.60', 5, 2),
(6, '150.70', 6, 3),
(7, '50.70', 7, 3),
(8, '5.70', 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `street` varchar(55) DEFAULT NULL,
  `zip_code` int(4) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id_location`, `street`, `zip_code`, `city`) VALUES
(1, 'Webergasse 1', 1200, 'Vienna'),
(2, 'Webergasse 2', 1200, 'Vienna'),
(3, 'Webergasse 3', 1200, 'Vienna'),
(4, 'Webergasse 4', 1200, 'Vienna'),
(5, 'Webergasse 5', 1200, 'Vienna'),
(6, 'Webergasse 6', 1200, 'Vienna'),
(7, 'Webergasse 7', 1200, 'Vienna'),
(8, 'Webergasse 8', 1200, 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id_packages` int(11) NOT NULL,
  `fk_size` int(11) DEFAULT NULL,
  `weigth` int(11) DEFAULT NULL,
  `type` enum('packages','mail') DEFAULT 'packages'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id_packages`, `fk_size`, `weigth`, `type`) VALUES
(1, 1, 950, 'packages'),
(2, 2, 1050, 'packages'),
(3, 3, 150, 'packages'),
(4, 4, 400, 'packages'),
(5, 5, 600, 'packages'),
(6, 6, 700, 'packages'),
(7, NULL, 30, 'mail'),
(8, NULL, 40, 'mail');

-- --------------------------------------------------------

--
-- Table structure for table `package_size`
--

CREATE TABLE `package_size` (
  `id_size` int(11) NOT NULL,
  `length` int(4) DEFAULT NULL,
  `heigth` int(4) DEFAULT NULL,
  `width` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_size`
--

INSERT INTO `package_size` (`id_size`, `length`, `heigth`, `width`) VALUES
(1, 180, 120, 20),
(2, 80, 20, 10),
(3, 90, 10, 30),
(4, 30, 30, 20),
(5, 40, 20, 20),
(6, 30, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `id_system` int(11) NOT NULL,
  `fk_package` int(11) DEFAULT NULL,
  `fk_time` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`id_system`, `fk_package`, `fk_time`, `fk_warehouse`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 1, 5),
(7, 7, 2, 1),
(8, 8, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `receive`
--

CREATE TABLE `receive` (
  `id_receive` int(11) NOT NULL,
  `fk_package` int(11) DEFAULT NULL,
  `fk_timelocation` int(11) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `receive`
--

INSERT INTO `receive` (`id_receive`, `fk_package`, `fk_timelocation`, `fk_location`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 5, 7),
(8, 8, 6, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sorting`
--

CREATE TABLE `sorting` (
  `id_sorting` int(11) NOT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `fk_package` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sorting`
--

INSERT INTO `sorting` (`id_sorting`, `fk_employee`, `fk_package`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `timelocation`
--

CREATE TABLE `timelocation` (
  `id_timelocation` int(11) NOT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_time` time DEFAULT NULL,
  `deliver_date` date DEFAULT NULL,
  `deliver_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timelocation`
--

INSERT INTO `timelocation` (`id_timelocation`, `receive_date`, `receive_time`, `deliver_date`, `deliver_time`) VALUES
(1, '2019-07-08', '09:00:00', '2019-07-13', '18:00:00'),
(2, '2019-06-30', '09:00:00', '2019-07-16', '18:00:00'),
(3, '2019-07-02', '09:00:00', '2019-07-11', '18:00:00'),
(4, '2019-07-01', '09:00:00', '2019-07-15', '18:00:00'),
(5, '2019-06-30', '10:00:00', '2019-07-08', '18:00:00'),
(6, '2019-07-01', '09:00:00', '2019-07-15', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `timesystem`
--

CREATE TABLE `timesystem` (
  `id_timesystem` int(11) NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `expedition_date` date DEFAULT NULL,
  `expedition_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timesystem`
--

INSERT INTO `timesystem` (`id_timesystem`, `arrival_date`, `arrival_time`, `expedition_date`, `expedition_time`) VALUES
(1, '2019-07-09', '09:00:00', '2019-07-12', '18:00:00'),
(2, '2019-07-01', '09:00:00', '2019-07-07', '18:00:00'),
(3, '2019-07-05', '09:00:00', '2019-07-08', '18:00:00'),
(4, '2019-07-03', '09:00:00', '2019-07-10', '18:00:00'),
(5, '2019-07-06', '10:00:00', '2019-07-07', '18:00:00'),
(6, '2019-07-02', '09:00:00', '2019-07-05', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `roww` int(3) DEFAULT NULL,
  `columnw` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id_warehouse`, `roww`, `columnw`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 2, 2),
(5, 1, 3),
(6, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_address`
--
ALTER TABLE `billing_address`
  ADD PRIMARY KEY (`id_billingadress`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indexes for table `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`id_deliver`),
  ADD KEY `fk_timelocation` (`fk_timelocation`),
  ADD KEY `fk_package` (`fk_package`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `fk_customer` (`fk_customer`),
  ADD KEY `fk_billing_address` (`fk_billing_address`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id_packages`),
  ADD KEY `fk_size` (`fk_size`);

--
-- Indexes for table `package_size`
--
ALTER TABLE `package_size`
  ADD PRIMARY KEY (`id_size`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`id_system`),
  ADD KEY `fk_package` (`fk_package`),
  ADD KEY `fk_time` (`fk_time`),
  ADD KEY `fk_warehouse` (`fk_warehouse`);

--
-- Indexes for table `receive`
--
ALTER TABLE `receive`
  ADD PRIMARY KEY (`id_receive`),
  ADD KEY `fk_timelocation` (`fk_timelocation`),
  ADD KEY `fk_package` (`fk_package`),
  ADD KEY `fk_location` (`fk_location`);

--
-- Indexes for table `sorting`
--
ALTER TABLE `sorting`
  ADD PRIMARY KEY (`id_sorting`),
  ADD KEY `fk_employee` (`fk_employee`),
  ADD KEY `fk_package` (`fk_package`);

--
-- Indexes for table `timelocation`
--
ALTER TABLE `timelocation`
  ADD PRIMARY KEY (`id_timelocation`);

--
-- Indexes for table `timesystem`
--
ALTER TABLE `timesystem`
  ADD PRIMARY KEY (`id_timesystem`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_address`
--
ALTER TABLE `billing_address`
  MODIFY `id_billingadress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deliver`
--
ALTER TABLE `deliver`
  MODIFY `id_deliver` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id_packages` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_size`
--
ALTER TABLE `package_size`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `processing_system`
--
ALTER TABLE `processing_system`
  MODIFY `id_system` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `receive`
--
ALTER TABLE `receive`
  MODIFY `id_receive` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sorting`
--
ALTER TABLE `sorting`
  MODIFY `id_sorting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timelocation`
--
ALTER TABLE `timelocation`
  MODIFY `id_timelocation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timesystem`
--
ALTER TABLE `timesystem`
  MODIFY `id_timesystem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_location`) REFERENCES `location` (`id_location`);

--
-- Constraints for table `deliver`
--
ALTER TABLE `deliver`
  ADD CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`fk_timelocation`) REFERENCES `timelocation` (`id_timelocation`),
  ADD CONSTRAINT `deliver_ibfk_2` FOREIGN KEY (`fk_package`) REFERENCES `packages` (`id_packages`),
  ADD CONSTRAINT `deliver_ibfk_3` FOREIGN KEY (`fk_location`) REFERENCES `location` (`id_location`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_billing_address`) REFERENCES `billing_address` (`id_billingadress`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`fk_size`) REFERENCES `package_size` (`id_size`);

--
-- Constraints for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_package`) REFERENCES `packages` (`id_packages`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`fk_time`) REFERENCES `timesystem` (`id_timesystem`),
  ADD CONSTRAINT `processing_system_ibfk_3` FOREIGN KEY (`fk_warehouse`) REFERENCES `warehouse` (`id_warehouse`);

--
-- Constraints for table `receive`
--
ALTER TABLE `receive`
  ADD CONSTRAINT `receive_ibfk_1` FOREIGN KEY (`fk_timelocation`) REFERENCES `timelocation` (`id_timelocation`),
  ADD CONSTRAINT `receive_ibfk_2` FOREIGN KEY (`fk_package`) REFERENCES `packages` (`id_packages`),
  ADD CONSTRAINT `receive_ibfk_3` FOREIGN KEY (`fk_location`) REFERENCES `location` (`id_location`);

--
-- Constraints for table `sorting`
--
ALTER TABLE `sorting`
  ADD CONSTRAINT `sorting_ibfk_1` FOREIGN KEY (`fk_employee`) REFERENCES `employees` (`id_employee`),
  ADD CONSTRAINT `sorting_ibfk_2` FOREIGN KEY (`fk_package`) REFERENCES `packages` (`id_packages`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
