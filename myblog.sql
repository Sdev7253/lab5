-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2015 at 03:04 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `articleID` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `tagID` int(10) UNSIGNED NOT NULL,
  `commentID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`articleID`, `title`, `body`, `created`, `modified`, `userID`, `tagID`, `commentID`) VALUES
(1, 'abc', 'xyz', NULL, NULL, 3, 3, 3),
(2, 'A title', 'the article body ', '2015-11-05 19:23:09', NULL, 1, 1, 1),
(3, ' another Title', 'wassup guys.', '2015-11-05 19:23:09', NULL, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(10) UNSIGNED NOT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `userID` int(10) UNSIGNED DEFAULT NULL,
  `articleID` int(10) UNSIGNED DEFAULT NULL,
  `body` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `approved`, `userID`, `articleID`, `body`, `created`, `modified`) VALUES
(1, 1, 1, 1, 'Comment 1', '2015-11-23 08:43:31', NULL),
(2, 0, 1, 2, 'Comment 2', '2015-11-23 08:43:31', NULL),
(3, 1, 3, 3, 'Comment 3', '2015-11-29 00:00:00', '2015-11-24 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tagID` int(10) UNSIGNED NOT NULL,
  `tagName` varchar(50) NOT NULL,
  `articalID` int(10) UNSIGNED NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tagID`, `tagName`, `articalID`, `userID`, `created`, `modified`) VALUES
(1, 'food', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'tech', 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'travel', 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'home', 3, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'news', 3, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `articleID` int(10) UNSIGNED DEFAULT NULL,
  `commentID` int(10) UNSIGNED DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `role`, `articleID`, `commentID`, `created`) VALUES
(1, 'Talwinder', '123456', 'user', 1, 1, NULL),
(2, 'Sachin', '123456', 'admin', NULL, NULL, NULL),
(3, 'Praashant', '123456', 'user', 2, 2, NULL),
(4, 'Sidhu', '123456', 'user', 3, 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articleID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `tagID` (`tagID`),
  ADD KEY `commentID` (`commentID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `articleID` (`articleID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagID`),
  ADD KEY `articalID` (`articalID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `articleID` (`articleID`),
  ADD KEY `commentID` (`commentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tagID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
