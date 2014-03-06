-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2014 at 10:32 AM
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
-- Table structure for table `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `primary_mat` int(1) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES
(1, 1, 'bBFeWUcWfKE', 1, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 1),
(2, 1, 'http://www.wikihow.com/Build-a-Fire', 4, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 0),
(3, 1, 'http://www.scoutcenter.net/pub/pdf/notes_firebuilding.pdf', 2, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 0),
(4, 2, 'hzp7yzW419k', 1, '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL, 1),
(5, 3, 'lJnvq0A_7WQ', 1, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 1),
(6, 3, '80796744', 3, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 0),
(7, 3, 'http://www.upf.edu/materials/bib/docs/3371/12463/aaby.pdf', 2, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 0),
(8, 4, '9hRNFgSLLAQ', 1, '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL, 1),
(9, 6, 'http://graphics.cs.cmu.edu/nsp/course/15-462/Fall04/slides/GameProg.pdf', 2, '2014-03-01 09:53:53', 0, NULL, NULL, NULL, NULL, 1),
(10, 7, 'SuZDH4_hCvU', 1, '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL, 1),
(11, 8, 'ahjDB5hVs88', 1, '2014-03-01 09:58:31', 0, NULL, NULL, NULL, NULL, 1),
(12, 9, 'BgAlQuqzl8o', 1, '2014-03-01 10:13:59', 0, NULL, NULL, NULL, NULL, 1),
(13, 10, 'I16_8l0yS-g', 1, '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL, 1),
(14, 11, 'hDlif8Km4S4', 1, '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL, 1),
(15, 12, 'xRT1xPUIf3A', 1, '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL, 1),
(16, 14, 'kWoJLdXJt0E', 1, '2014-03-01 10:27:31', 0, NULL, NULL, NULL, NULL, 1),
(17, 15, 'W2Wb8N0yY5Q', 1, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
