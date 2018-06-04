-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2018 at 11:01 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(32) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `reason`, `name`, `contact`, `email`, `remarks`, `date`) VALUES
(1, 'feedback', '1', '123@123123.com', '123123', 'test', '2018-06-01 10:31:31'),
(2, 'complain', 'test2', 'ts@ts.com', 'test123', 'lorem', '2018-06-04 10:59:17'),
(3, 'enquiry', 'test3', '123@123123.com', '123123', 'rip', '2018-06-04 10:59:33'),
(4, 'others', 'otter', 'ts@ts.com', '123123', 'testing', '2018-06-04 10:59:48'),
(5, 'feedback', '12', '123@123123.com', '123123', 'test2', '2018-06-04 10:31:31'),
(7, 'complain', 'test2', 'ts@ts.com', 'test1232', 'lorem', '2018-06-07 10:59:17'),
(8, 'feedback', '1', '123@123123.com', '123123', '123', '2018-06-04 14:47:36'),
(9, 'enquiry', 'test2', '123@123123.com', '123123', 'testing 1 2 3', '2018-06-04 14:50:23'),
(10, 'feedback', 'Tommy', 'test123', 'tommy+345@vi8e.com', 'This is test message', '2018-06-04 14:55:40'),
(11, 'feedback', 'Tommy', 'test123', 'tommy+345@vi8e.com', 'test notification', '2018-06-04 14:57:09'),
(12, 'feedback', 'Tommy', 'test123', 'tommy+345@vi8e.com', 'test notification', '2018-06-04 14:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('admin', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
