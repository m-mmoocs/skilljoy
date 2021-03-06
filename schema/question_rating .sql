-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2014 at 08:10 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `skilljoy`
--

-- --------------------------------------------------------

--
-- Table structure for table `question_rating`
--
DROP TABLE IF EXISTS `question_rating`;
CREATE TABLE IF NOT EXISTS `question_rating` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rating` enum('1','-1','','') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id_2` (`question_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
