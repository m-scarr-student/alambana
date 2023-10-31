-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 01:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aalambana_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `Blog_Id` int(11) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Description` text NOT NULL,
  `Video_Link` varchar(200) DEFAULT NULL,
  `Modified_Time` datetime DEFAULT NULL,
  `Created_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`Blog_Id`, `Title`, `Author`, `Description`, `Video_Link`, `Modified_Time`, `Created_Time`) VALUES
(22, 'B5', 'A4', 'D5', '', '2023-10-24 02:52:00', '2023-10-24 02:52:00'),
(26, 'T9', 'A9', 'D9', '', '2023-10-25 02:34:05', '2023-10-25 02:34:05'),
(27, 'T1', 'A1', 'D1', '', '2023-10-25 03:24:00', '2023-10-25 03:24:00'),
(28, 'T3', 'A3', 'D3', '', '2023-10-25 16:15:24', '2023-10-25 16:15:24'),
(30, 'Blog Title1', 'Author1', 'Description1', '', '2023-10-26 15:44:14', '2023-10-26 15:44:14'),
(31, 'Blog Title2', 'Author2', 'Description2', '', '2023-10-26 15:48:59', '2023-10-26 15:48:59'),
(32, 'Blog Title3', 'Author3', 'Description3', '', '2023-10-26 15:49:30', '2023-10-26 15:49:30'),
(33, 'Blog Title8', 'Author8', 'Description8', '', '2023-10-26 17:53:54', '2023-10-26 17:53:54'),
(34, 'Blog Title9', 'Author9', 'Description9', '', '2023-10-26 17:54:32', '2023-10-26 17:54:32'),
(35, 'Blog Title0', 'Author0', 'Description0', 'https://youtu.be/k9em7Ey00xQ', '2023-10-26 18:06:00', '2023-10-26 18:06:00'),
(36, 'Blog Title10', 'Author10', 'Description10', '', '2023-10-27 00:45:45', '2023-10-27 00:45:45'),
(37, 'Blog Title11', 'Author11', 'Description11', '', '2023-10-27 00:46:12', '2023-10-27 00:46:12'),
(38, 'Blog Title12', 'Author12', 'Description12', '', '2023-10-27 00:46:43', '2023-10-27 00:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `blog_pictures`
--

CREATE TABLE `blog_pictures` (
  `Picture_Id` int(11) NOT NULL,
  `Blog_Id` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_pictures`
--

INSERT INTO `blog_pictures` (`Picture_Id`, `Blog_Id`, `Location`) VALUES
(6, 22, 'images/blog_pictures/65371530989501.90488542.jpg'),
(9, 26, 'images/blog_pictures/6538627d343777.61810942.jpg'),
(10, 27, 'images/blog_pictures/65386e301700c8.47196175.jpg'),
(11, 28, 'images/blog_pictures/653922fc26c3f9.52815194.jpg'),
(13, 30, 'images/blog_pictures/653a6d2e0afa26.08642205.jpg'),
(14, 31, 'images/blog_pictures/653a6e4b5f4bc8.42880896.jpg'),
(15, 32, 'images/blog_pictures/653a6e6ac89d49.28070896.jpg'),
(16, 33, 'images/blog_pictures/653a8b928d5797.54334947.jpg'),
(17, 34, 'images/blog_pictures/653a8bb88fb2f0.31269026.jpg'),
(18, 35, 'images/blog_pictures/653a8e6830f2f3.01510065.gif'),
(19, 36, 'images/blog_pictures/653aec19e43e64.17197132.jpg'),
(20, 37, 'images/blog_pictures/653aec345f00e0.67092487.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `blog_story`
--

CREATE TABLE `blog_story` (
  `Story_Id` int(11) NOT NULL,
  `Blog_Id` int(11) DEFAULT NULL,
  `Paragraph` text NOT NULL,
  `About_Author` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `Event_Id` int(11) NOT NULL,
  `Title` int(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Video_Link` varchar(255) DEFAULT NULL,
  `Event_Date` datetime DEFAULT NULL,
  `Create_Time` datetime DEFAULT NULL,
  `Modified_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`Blog_Id`);

--
-- Indexes for table `blog_pictures`
--
ALTER TABLE `blog_pictures`
  ADD PRIMARY KEY (`Picture_Id`);

--
-- Indexes for table `blog_story`
--
ALTER TABLE `blog_story`
  ADD PRIMARY KEY (`Story_Id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`Event_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `Blog_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `blog_pictures`
--
ALTER TABLE `blog_pictures`
  MODIFY `Picture_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `blog_story`
--
ALTER TABLE `blog_story`
  MODIFY `Story_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `Event_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
