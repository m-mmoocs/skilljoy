-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2014 at 10:33 AM
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
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, 4, 'How to Build A Campfire', '', '2014-03-01 09:34:45', 0, NULL, NULL, NULL, NULL),
(2, 4, 'How to Hunt Deer', '', '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL),
(3, 4, 'Introduction to Programming', '', '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL),
(4, 4, 'CodeIgniter Introduction', '', '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL),
(6, 4, 'Introduction to Game Programming', '', '2014-03-01 09:53:53', 0, NULL, NULL, NULL, NULL),
(7, 4, 'Beginner''s Guide to Camping', '', '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL),
(8, 4, 'Epic Wins', '', '2014-03-01 09:58:31', 0, NULL, NULL, NULL, NULL),
(9, 4, 'Cello Wars', '', '2014-03-01 10:13:59', 0, NULL, NULL, NULL, NULL),
(10, 4, 'Shark vs Octopus', '', '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL),
(11, 4, 'Dubstep Guns', '', '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL),
(12, 4, 'Utada Hikaru', '', '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL),
(15, 4, 'Ayumi', '', '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
