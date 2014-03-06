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
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('pending','confirmed') COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES
(1, 'Outdoor Survival', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(2, 'Building a Fire', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(3, 'Programming', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(4, 'CodeIgniter', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(5, 'Music', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(6, 'Dubstep', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(7, 'Games', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(8, 'World of Warcraft', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(10, 'Hunting', 0, '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(12, 'Beginner''s Guide', 0, '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(13, 'Camping', 0, '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(14, 'Humor', 0, '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(15, 'Klaypex', 0, '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(16, 'J-Pop', 0, '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(18, 'Hikki', 0, '2014-03-01 10:27:31', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(19, 'Ayumi Hamasaki', 0, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 'confirmed');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
