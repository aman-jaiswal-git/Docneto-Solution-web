-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2025 at 02:57 PM
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
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'Test@12345', '04-03-2024 11:42:05 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `patientName` varchar(255) NOT NULL,
  `patientAge` int(3) NOT NULL,
  `patientGender` varchar(10) NOT NULL,
  `patientAddress` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `patientName`, `patientAge`, `patientGender`, `patientAddress`, `created_at`, `updationDate`) VALUES
(1, 'ENT', 1, 1, 500, '2024-05-30', '9:15 AM', '2024-05-15 03:42:11', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(2, 'Endocrinologists', 2, 2, 800, '2024-05-31', '2:45 PM', '2024-05-16 09:08:54', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(3, 'Pediatrics', 4, 4, 700, '2025-08-29', '9:30 AM', '2025-08-14 04:01:10', 1, 0, '', 0, '', '', '2025-08-20 12:28:31', '2025-08-14 04:01:45'),
(4, 'Pediatrics', 4, 0, 700, '2025-08-14', '12:00-14:00', '2025-08-14 07:35:28', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(5, 'Pediatrics', 4, 0, 700, '2025-08-14', '10:00-12:00', '2025-08-14 07:36:31', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(6, 'Pediatrics', 4, 4, 700, '2025-08-14', '10:00-12:00', '2025-08-14 07:38:17', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(7, 'Pediatrics', 4, 4, 700, '2025-08-16', '12:00-14:00', '2025-08-14 07:39:18', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(8, 'Internal Medicine', 8, 4, 200, '2025-08-14', '12:00-14:00', '2025-08-14 16:30:52', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(9, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 17:56:33', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(10, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:01:02', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(11, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:04:43', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(12, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:12:18', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(13, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:17:36', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(14, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:21:40', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(15, 'Orthopedics', 9, 1, 0, '2025-08-27', '11:30 PM', '2025-08-14 18:25:41', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(16, 'Internal Medicine', 10, 1, 100, '2025-09-23', '10:00-12:00', '2025-08-16 07:22:12', 1, 2, '', 0, '', '', '2025-08-20 12:28:31', '2025-08-20 09:06:00'),
(17, 'Internal Medicine', 10, 1, 100, '2025-09-23', '10:00-12:00', '2025-08-16 07:23:44', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(18, 'Internal Medicine', 10, 1, 100, '2025-09-23', '10:00-12:00', '2025-08-16 08:24:23', 1, 0, '', 0, '', '', '2025-08-20 12:28:31', '2025-08-20 09:06:07'),
(19, 'Internal Medicine', 10, 1, 100, '2025-09-23', '10:00-12:00', '2025-08-16 08:30:13', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(20, 'Internal Medicine', 10, 1, 100, '2025-09-23', '10:00-12:00', '2025-08-16 08:31:55', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(21, 'Internal Medicine', 10, 0, 100, '2025-08-26', '10:00-12:00', '2025-08-16 17:08:26', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(22, 'Internal Medicine', 10, 0, 100, '2025-08-26', '10:00-12:00', '2025-08-16 18:41:14', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(23, 'Internal Medicine', 10, 0, 100, '2025-08-26', '10:00-12:00', '2025-08-16 18:42:04', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(24, 'Internal Medicine', 10, NULL, 100, '2025-08-26', '10:00-12:00', '2025-08-16 18:43:58', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(25, 'Internal Medicine', 10, NULL, 100, '2025-08-26', '10:00-12:00', '2025-08-16 18:44:31', 1, 1, '', 0, '', '', '2025-08-20 12:28:31', NULL),
(104, 'Radiology', 11, 11, 0, '2025-08-29', '11:15 PM', '2025-08-20 17:57:34', 1, 1, '', 0, '', '', '2025-08-20 17:57:34', NULL),
(105, 'Orthopedics', 9, 5, 600, '2025-08-21', '5:45 PM', '2025-08-21 12:06:44', 1, 1, '', 0, '', '', '2025-08-21 12:06:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `docPhoto` varchar(255) DEFAULT NULL,
  `availableDays` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`, `docPhoto`, `availableDays`) VALUES
(7, 'Obstetrics and Gynecology', 'Bhavya rathore', 'Shop 12 Indira Puram Ghaziabad', '800', 745621330, 'bhawya12@tt.com', 'f925916e2754e5e03f75dd58a5733251', '2024-05-16 09:15:18', NULL, NULL, NULL),
(8, 'Internal Medicine', 'aman', 'akana', '200', 999999999, 'doctor@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-14 06:59:42', NULL, NULL, NULL),
(9, 'Orthopedics', 'naresh', 'Naresh nagrath clinik', '600', 999999999, 'naresh@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-14 17:55:50', '2025-08-14 18:04:30', 'photo.jpg', 'Monday,Wednesday,Thursday'),
(10, 'Internal Medicine', 'khokha singh', 'fghjk', '100', 888888888, 'khokha@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-16 07:01:21', NULL, 'khokha_singh.png', 'Tuesday'),
(11, 'Radiology', 'jasminee', 'hgjk', '200', 1222, 'jasmine@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-20 11:46:29', NULL, 'jasminee.png', 'Monday,Tuesday');

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'anujk123@test.com', 0x3a3a3100000000000000000000000000, '2024-05-16 05:19:33', NULL, 1),
(2, 1, 'anujk123@test.com', 0x3a3a3100000000000000000000000000, '2024-05-16 09:01:03', '16-05-2024 02:37:32 PM', 1),
(3, 8, 'doctor@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:00:05', NULL, 1),
(4, 8, 'doctor@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 16:23:45', NULL, 1),
(5, 10, 'khokha@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 09:34:37', NULL, 1),
(6, 10, 'khokha@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:58:28', NULL, 1),
(7, NULL, 'khokha@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:25:38', NULL, 0),
(8, 8, 'doctor@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:43:07', NULL, 1),
(9, 11, 'jasmine@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:47:08', NULL, 1),
(10, 11, 'jasmine@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 12:11:12', NULL, 1),
(11, 11, 'jasmine@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 17:42:16', NULL, 1),
(12, 8, 'doctor@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:16:51', NULL, 1),
(13, 8, 'doctor@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:23:40', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Orthopedics', '2024-04-09 18:09:46', '2024-05-14 09:26:47'),
(2, 'Internal Medicine', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(3, 'Obstetrics and Gynecology', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(4, 'Dermatology', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(5, 'Pediatrics', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(6, 'Radiology', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(7, 'General Surgery', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(8, 'Ophthalmology', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(9, 'Anesthesia', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(10, 'Pathology', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(11, 'ENT', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(12, 'Dental Care', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(13, 'Dermatologists', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(14, 'Endocrinologists', '2024-04-09 18:09:46', '2024-05-14 09:26:56'),
(15, 'Neurologists', '2024-04-09 18:09:46', '2024-05-14 09:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(20) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `patient_name`, `doctor_name`, `total_amount`) VALUES
(1, '160825001', '2025-08-16', '', 'khokha singh', 110.00),
(2, '160825002', '2025-08-16', '', 'khokha singh', 110.00);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(1, 'Anuj kumar', 'anujk30@test.com', 1425362514, 'This is for testing purposes.   This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.', '2024-04-20 16:52:03', NULL, '2024-05-14 09:27:15', NULL),
(2, 'Anuj kumar', 'ak@gmail.com', 1111122233, 'This is for testing', '2024-04-23 13:13:41', 'Contact the patient', '2024-04-27 13:13:57', 1),
(3, 'aman', 'aman@gmail.com', 8874138767, 'shfjkhfj', '2025-08-14 03:57:06', 'okay', '2025-08-14 03:59:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(1, 2, '80/120', '110', '85', '97', 'Dolo,\r\nLevocit 5mg', '2024-05-16 09:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp(),
  `OpenningTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `OpenningTime`) VALUES
(1, 'aboutus', 'About Us', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.313em; margin-left: 1.655em;\" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" center;=\"\" background-color:=\"\" rgb(255,=\"\" 246,=\"\" 246);\"=\"\"><li style=\"text-align: left;\"><font color=\"#000000\">The Health Data and Information Management System (HDMIS) is designed for Any Hospital to replace their existing manual, paper based system. The new system is to control the following information; patient information, room availability, staff and operating room schedules, and patient invoices. These services are to be provided in an efficient, cost effective manner, with the goal of reducing the time and resources currently required for such tasks.</font></li><li style=\"text-align: left;\"><font color=\"#000000\">A significant part of the operation of any hospital involves the acquisition, management and timely retrieval of great volumes of information. This information typically involves; patient personal information and medical history, staff information, room and ward scheduling, staff scheduling, operating theater scheduling and various facilities waiting lists. All of this information must be managed in an efficient and cost wise fashion so that an institution\'s resources may be effectively utilized HMS will automate the management of the hospital making it more efficient and error free. It aims at standardizing data, consolidating data ensuring data integrity and reducing inconsistencies.&nbsp;</font></li></ul>', NULL, NULL, '2020-05-20 07:21:52', NULL),
(2, 'contactus', 'Contact Details', 'Chandigarh University,\r\nABC, XYZ, India', 'info@gmail.com', 123567890, '2020-05-20 07:24:07', '9 am To 8 Pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `CreationDate`, `UpdationDate`) VALUES
(1, 1, 'Rahul Singyh', 452463210, 'rahul12@gmail.com', 'male', 'NA', 32, 'Fever, Cold', '2024-05-16 05:23:35', NULL),
(2, 1, 'Amit', 4545454545, 'amitk@gmail.com', 'male', 'NA', 45, 'Fever', '2024-05-16 09:01:26', NULL),
(3, 8, 'aman', 9999999999, 'aana@gmail.com', 'female', 'bhagalpur', 13, 'a', '2025-08-14 16:32:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'johndoe12@test.com', 0x3a3a3100000000000000000000000000, '2024-05-15 03:41:48', NULL, 1),
(2, 2, 'amitk@gmail.com', 0x3a3a3100000000000000000000000000, '2024-05-16 09:08:06', '16-05-2024 02:41:06 PM', 1),
(3, 3, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-11 10:15:54', '11-08-2025 03:46:20 PM', 1),
(4, 3, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-11 10:18:30', NULL, 1),
(5, NULL, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-12 15:23:03', NULL, 0),
(6, NULL, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-12 15:23:19', NULL, 0),
(7, NULL, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-12 15:23:59', NULL, 0),
(8, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-12 15:24:37', '12-08-2025 08:56:24 PM', 1),
(9, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 03:58:40', NULL, 1),
(10, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:00:35', NULL, 1),
(11, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:14:00', NULL, 1),
(12, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:14:00', NULL, 1),
(13, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:14:18', NULL, 1),
(14, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:26:01', NULL, 1),
(15, NULL, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:40:40', NULL, 0),
(16, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:40:53', NULL, 1),
(17, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:42:07', NULL, 1),
(18, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:53:14', NULL, 1),
(19, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 04:56:54', NULL, 1),
(20, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 06:52:19', NULL, 1),
(21, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 06:52:33', NULL, 1),
(22, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:00:20', NULL, 1),
(23, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:05:42', '14-08-2025 12:36:10 PM', 1),
(24, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:11:27', NULL, 1),
(25, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:36:05', NULL, 1),
(26, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 07:38:57', NULL, 1),
(27, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 16:23:00', NULL, 1),
(28, NULL, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 16:29:15', NULL, 0),
(29, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 16:29:28', NULL, 1),
(30, NULL, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 17:11:39', NULL, 0),
(31, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-14 17:12:01', NULL, 1),
(32, 4, 'amana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 05:58:47', NULL, 1),
(33, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 08:52:01', NULL, 1),
(34, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 16:34:35', NULL, 1),
(35, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 17:12:56', NULL, 1),
(36, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 18:54:48', NULL, 1),
(37, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 18:59:28', NULL, 1),
(38, NULL, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 20:07:40', NULL, 0),
(39, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-16 20:07:51', NULL, 1),
(40, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-18 10:33:16', NULL, 1),
(41, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:53:39', NULL, 1),
(42, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:54:46', NULL, 1),
(43, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:55:09', NULL, 1),
(44, NULL, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:58:01', NULL, 0),
(45, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 08:58:09', NULL, 1),
(46, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 09:09:58', NULL, 1),
(47, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:25:05', NULL, 1),
(48, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:41:12', NULL, 1),
(49, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 11:45:07', NULL, 1),
(50, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 12:29:23', NULL, 1),
(51, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 14:25:33', NULL, 1),
(52, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-20 17:35:30', NULL, 1),
(53, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 10:46:08', NULL, 1),
(54, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:03:45', NULL, 1),
(55, NULL, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:06:14', NULL, 0),
(56, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:06:25', NULL, 1),
(57, 5, 'am@gmail.com', 0x3a3a3100000000000000000000000000, '2025-08-21 12:19:22', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(1, 'John Doe', 'A 123 ABC Apartment GZB 201017', 'Ghaziabad', 'male', 'johndoe12@test.com', 'f925916e2754e5e03f75dd58a5733251', '2024-04-20 12:13:56', '2024-05-14 09:28:15'),
(2, 'Amit kumar', 'new Delhi india', 'New Delhi', 'male', 'amitk@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-04-21 13:15:32', '2024-05-14 09:28:23'),
(3, 'aman', 'bhagalpur', 'deoria', 'male', 'aman@gmail.com', 'c88d6bddea155bf4a0a2d8faeb01fc4e', '2025-08-11 10:15:29', NULL),
(4, 'aman', 'amam', 'mama', 'male', 'amana@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-12 15:24:22', NULL),
(5, 'Aman Jaiswal', 'bhagalpur', 'deoria', 'male', 'am@gmail.com', '2dc1d4260a7c5c35e4b11619a604e9d7', '2025-08-16 08:51:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
