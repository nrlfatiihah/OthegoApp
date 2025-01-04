-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 09:56 AM
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
-- Database: `othego_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(25) NOT NULL,
  `userID` int(25) NOT NULL,
  `roomID` int(25) NOT NULL,
  `checkIn_Date` date NOT NULL,
  `checkOut_Date` date NOT NULL,
  `totalAmount` decimal(10,0) NOT NULL,
  `paymentStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `complaintComments` varchar(255) NOT NULL,
  `complaintStatus` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `fullName`, `userEmail`, `complaintComments`, `complaintStatus`, `create_at`) VALUES
(5, 'Kamal', 'kamal@gmail.com', 'fan not functioning', 'new', '2025-01-04 08:33:41'),
(6, 'Kamal ', 'kamal@gmail.com', 'fan not functioning', 'New', '2025-01-04 08:40:50'),
(7, 'Kamal Adli', 'kamal@gmail.com', 'toilet not functioning', 'New', '2025-01-04 08:43:06'),
(8, 'Kamal Adli', 'kamal@gmail.com', 'air-conditioning not functioning', 'New', '2025-01-04 08:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(25) NOT NULL,
  `bookingID` int(25) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `paymentDate` date NOT NULL,
  `amountPaid` decimal(10,0) NOT NULL,
  `paymentReceipt` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(25) NOT NULL,
  `roomID` int(25) NOT NULL,
  `userID` int(25) NOT NULL,
  `rating` int(25) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `reviewDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomID` int(25) NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `roomDesc` varchar(255) NOT NULL,
  `roomLoc` varchar(255) NOT NULL,
  `roomPrice` decimal(10,0) NOT NULL,
  `roomAvailability` varchar(255) NOT NULL,
  `roomPic` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomID`, `roomName`, `roomDesc`, `roomLoc`, `roomPrice`, `roomAvailability`, `roomPic`) VALUES
(2, 'Room 1', 'WiFi provided, washing machine provided', 'Batu 7', 350, '1', ''),
(3, 'Room 2', 'Access door, wasing machine and WiFi provided', 'Chai Yi Building', 400, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(25) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `userEmail`, `password`) VALUES
(2, 'Nurul Fatihah', 'nrlfthh17@gmail.com', '$2y$10$dGSpcXH0f5DgkyItA2UmTua9tpKfmIYYllbGs8FtIet6vXmBi9zEK'),
(4, 'Nurul Fatihah ', 'nrlfthh@gmail.com', '$2y$10$vfQ7HaCQXkwagGEXpFThQOmxrQxIk/7VdPDYdBMVfnCUN4DjPGys.'),
(5, 'Olivia Geema ', 'oliviageema@gmail.com', '$2y$10$h1NgJDW2CfU0jYb3ec0OceLeGwlsV3YfqaCFo2Yqvvf6GVkIP7Gai'),
(6, 'liliana', 'liliana@gmail.com', '$2y$10$sZ.g7hvzwrohbS3.fm1WbOOk59urjzAm/SJu00GCS6DQE.mNHT1Kq'),
(7, 'Kamal', 'kamal@gmail.com', '$2y$10$VR4slHVG/BrvCExjRe9JbedEDp31FykuYS/ma1HAFdhFW8MN0ebg6'),
(8, 'Dilan Azhar', 'dilan@othego.com', '$2y$10$TAi0FqHr9b5ftitmFzC5buyRP5DJWio.2Mnavu5vkJd9SwaUjVDhO');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `user_profileID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userphoneNo` varchar(255) NOT NULL,
  `userEmerphoneNo` varchar(255) NOT NULL,
  `userGender` varchar(255) NOT NULL,
  `profilePic` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_profileID`, `userName`, `userEmail`, `userphoneNo`, `userEmerphoneNo`, `userGender`, `profilePic`) VALUES
(2, 'Kamal Adli', 'kamal@gmail.com', '+6012-3456700', '01236746353', 'Male', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `othego_app_ibfk_1` (`userID`),
  ADD KEY `othego_app_ibfk_2` (`roomID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaintID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `othego_app_ibfk_5` (`bookingID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `othego_app_ibfk_6` (`roomID`),
  ADD KEY `othego_app_ibfk_7` (`userID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`user_profileID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(25) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `user_profileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `othego_app_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `othego_app_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `othego_app_ibfk_5` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `othego_app_ibfk_6` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `othego_app_ibfk_7` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
