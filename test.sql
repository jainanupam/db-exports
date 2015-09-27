-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2015 at 05:44 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_data`
--

CREATE TABLE IF NOT EXISTS `expenses_data` (
  `TX_ID` int(11) NOT NULL COMMENT 'Primary key and transaction ID',
  `user_id` int(11) NOT NULL COMMENT 'foreign key to the users table',
  `amount` float NOT NULL COMMENT 'expenditure amount',
  `particulars` text NOT NULL COMMENT 'details of items purchased',
  `group_expense` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'whether expense was made for self or for group',
  `dated` date DEFAULT NULL COMMENT 'date on which the expense was made'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table to hold data of expenditures';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL COMMENT 'Primary key and id of the users. auto increment enabled',
  `user_name` varchar(25) NOT NULL COMMENT 'Unique User name',
  `password` varchar(100) NOT NULL COMMENT 'password corresponding to user',
  `user_level` varchar(25) NOT NULL COMMENT 'user authorization level',
  `app_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether the user is a group app user or not'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='table to store basic details about users';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses_data`
--
ALTER TABLE `expenses_data`
  ADD PRIMARY KEY (`TX_ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `idx_username_unq` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses_data`
--
ALTER TABLE `expenses_data`
  MODIFY `TX_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key and transaction ID';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key and id of the users. auto increment enabled';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
