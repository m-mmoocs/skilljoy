-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2014 at 03:16 AM
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
CREATE DATABASE IF NOT EXISTS `skilljoy` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `skilljoy`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answers` varchar(300) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_id`) VALUES(3, 7, 'yes', 2);
INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_id`) VALUES(4, 7, 'No', 4);
INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_id`) VALUES(5, 7, 'Sure', 3);
INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_id`) VALUES(6, 3, 'I saw her CD on shelf in HMV', 4);
INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_id`) VALUES(7, 3, 'I think you can find her CD on Ebay', 5);

-- --------------------------------------------------------

--
-- Table structure for table `completed_units_in_series`
--

DROP TABLE IF EXISTS `completed_units_in_series`;
CREATE TABLE IF NOT EXISTS `completed_units_in_series` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `series_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `completed_at` datetime NOT NULL,
  `incomplete_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `completed_units_in_series`
--

INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(15, 4, 5, 10, '2014-03-17 06:47:41', '2014-03-17 06:47:45');
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(16, 4, 5, 10, '2014-03-17 06:47:46', NULL);
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(17, 4, 5, 40, '2014-03-17 06:47:50', '2014-03-17 06:52:11');
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(18, 4, 5, 6, '2014-03-17 06:50:12', NULL);
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(19, 4, 5, 6, '2014-03-17 06:50:36', NULL);
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(20, 4, 5, 6, '2014-03-17 06:51:31', NULL);
INSERT INTO `completed_units_in_series` (`id`, `user_id`, `series_id`, `unit_id`, `completed_at`, `incomplete_at`) VALUES(21, 4, 5, 6, '2014-03-17 06:51:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

DROP TABLE IF EXISTS `content_types`;
CREATE TABLE IF NOT EXISTS `content_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `content_types`
--

INSERT INTO `content_types` (`id`, `name`) VALUES(1, 'Youtube');
INSERT INTO `content_types` (`id`, `name`) VALUES(2, 'PDF');
INSERT INTO `content_types` (`id`, `name`) VALUES(3, 'Vimeo');
INSERT INTO `content_types` (`id`, `name`) VALUES(4, 'URL');
INSERT INTO `content_types` (`id`, `name`) VALUES(5, 'Slideshare');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
CREATE TABLE IF NOT EXISTS `materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `content_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `primary_mat` int(1) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(1, 1, 'bBFeWUcWfKE', 1, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(2, 1, 'http://www.wikihow.com/Build-a-Fire', 4, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(3, 1, 'http://www.scoutcenter.net/pub/pdf/notes_firebuilding.pdf', 2, '2014-03-01 09:34:46', 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(4, 2, 'hzp7yzW419k', 1, '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(5, 3, 'lJnvq0A_7WQ', 1, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(6, 3, '80796744', 3, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(7, 3, 'http://www.upf.edu/materials/bib/docs/3371/12463/aaby.pdf', 2, '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL, 0);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(8, 4, '9hRNFgSLLAQ', 1, '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(9, 6, 'http://graphics.cs.cmu.edu/nsp/course/15-462/Fall04/slides/GameProg.pdf', 2, '2014-03-01 09:53:53', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(10, 7, 'SuZDH4_hCvU', 1, '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(11, 8, 'ahjDB5hVs88', 1, '2014-03-01 09:58:31', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(12, 9, 'BgAlQuqzl8o', 1, '2014-03-01 10:13:59', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(13, 10, 'I16_8l0yS-g', 1, '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(14, 11, 'hDlif8Km4S4', 1, '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(15, 12, 'xRT1xPUIf3A', 1, '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(16, 14, 'kWoJLdXJt0E', 1, '2014-03-01 10:27:31', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(17, 15, 'W2Wb8N0yY5Q', 1, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(18, 16, 'YRgNOyCnbqg', 1, '2014-03-03 05:14:38', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(19, 17, 'rTKV5-ZSWcE', 1, '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(39, 40, '<iframe src="http://www.slideshare.net/slideshow/embed_code/29081610" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/LeanStartupConf/rapid-iteration-for-mobile-app-design" title="Rapid Iteration for Mobile App Design by Mariya Yao" target="_blank">Rapid Iteration for Mobile App Design by Mariya Yao</a> </strong> from <strong><a href="http://www.slideshare.net/LeanStartupConf" target="_blank">LeanStartupConf</a></strong> </div>\n\n', 5, '2014-03-10 20:52:05', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(40, 41, '<iframe src="http://www.slideshare.net/slideshow/embed_code/2526596" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/osscube/indexing-the-mysql-index-key-to-performance-tuning" title="Indexing the MySQL Index: Key to performance tuning" target="_blank">Indexing the MySQL Index: Key to performance tuning</a> </strong> from <strong><a href="http://www.slideshare.net/osscube" target="_blank">OSSCube LLC A Global Open Source Enterprise for Open Source Solutions</a></strong> </div>\n\n', 5, '2014-03-10 21:54:03', 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `materials` (`id`, `unit_id`, `content`, `content_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `primary_mat`) VALUES(41, 42, '<iframe src="http://www.slideshare.net/slideshow/embed_code/2121910" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px 1px 0; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/pritisolanki/php-mysql-for-beginners-2121910" title="Php MySql For Beginners" target="_blank">Php MySql For Beginners</a> </strong> from <strong><a href="http://www.slideshare.net/pritisolanki" target="_blank">Priti Solanki</a></strong> </div>\n\n', 5, '2014-03-10 22:12:36', 2130706433, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES(1, 'add unit');
INSERT INTO `permissions` (`id`, `name`) VALUES(2, 'add series');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `question` varchar(300) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(1, 1, 'What do tinder does?', 5);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(2, 1, 'What type of wood should I choose?', 2);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(3, 15, 'Where can I get her music CD?', 3);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(4, 15, 'Is there a profile for her ?', 4);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(5, 15, 'Do you have more information about Ayumi?', 4);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(6, 9, 'Is there any violin/viola wars too?', 5);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(7, 1, 'can i use tinder to start fire?', 5);
INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_id`) VALUES(8, 6, 'This looks interesting!!! is there a way I can find a job like that?', 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `question_rating`
--

INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(4, 3, 2, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(5, 6, 3, '-1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(6, 8, 4, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(7, 4, 4, '-1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(8, 3, 5, '-1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(9, 6, 4, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(10, 4, 5, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(11, 6, 5, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(12, 6, 1, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(13, 6, 2, '1');
INSERT INTO `question_rating` (`id`, `question_id`, `user_id`, `rating`) VALUES(14, 4, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `key` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `rating` enum('-1','1') NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES(9, 4, 1, '-1');
INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES(10, 4, 6, '1');
INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES(11, 4, 18, '-1');
INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES(12, 4, 7, '1');
INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES(13, 4, 19, '1');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(5, 4, '321', '', '2014-03-16 09:05:15', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `series_units`
--

DROP TABLE IF EXISTS `series_units`;
CREATE TABLE IF NOT EXISTS `series_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `series_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `priority` bigint(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `series_units`
--

INSERT INTO `series_units` (`id`, `series_id`, `unit_id`, `priority`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(1, 5, 6, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `series_units` (`id`, `series_id`, `unit_id`, `priority`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(2, 5, 10, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `series_units` (`id`, `series_id`, `unit_id`, `priority`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(3, 5, 8, 2, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `series_units` (`id`, `series_id`, `unit_id`, `priority`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(4, 5, 40, 3, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(1, 'Outdoor Survival', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(2, 'Building a Fire', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(3, 'Programming', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(4, 'CodeIgniter', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(5, 'Music', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(6, 'Dubstep', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(7, 'Games', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(8, 'World of Warcraft', 0, '0000-00-00 00:00:00', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(10, 'Hunting', 0, '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(12, 'Beginner''s Guide', 0, '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(13, 'Camping', 0, '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(14, 'Humor', 0, '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(15, 'Klaypex', 0, '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(16, 'J-Pop', 0, '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(18, 'Hikki', 0, '2014-03-01 10:27:31', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(19, 'Ayumi Hamasaki', 0, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(20, 'Knife Sharpening', 0, '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(21, 'Cleaning Fish', 0, '2014-03-03 05:16:27', 0, NULL, NULL, NULL, NULL, 'confirmed');
INSERT INTO `subjects` (`id`, `name`, `parent_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`, `status`) VALUES(22, 'Java', 0, '2014-03-09 22:10:39', 0, NULL, NULL, NULL, NULL, 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(1, 4, 'How to Build A Campfire', '', '2014-03-01 09:34:45', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(2, 4, 'How to Hunt Deer', '', '2014-03-01 09:36:24', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(3, 4, 'Introduction to Programming', '', '2014-03-01 09:46:32', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(4, 4, 'CodeIgniter Introduction', '', '2014-03-01 09:49:04', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(6, 4, 'Introduction to Game Programming', '', '2014-03-01 09:53:53', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(7, 4, 'Beginner''s Guide to Camping', '', '2014-03-01 09:55:41', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(8, 4, 'Epic Wins', '', '2014-03-01 09:58:31', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(9, 4, 'Cello Wars', '', '2014-03-01 10:13:59', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(10, 4, 'Shark vs Octopus', '', '2014-03-01 10:15:11', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(11, 4, 'Dubstep Guns', '', '2014-03-01 10:20:06', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(12, 4, 'Utada Hikaru', '', '2014-03-01 10:21:13', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(15, 4, 'Ayumi', '', '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(16, 4, 'Machima - Internet is for Porn', 'WoW remake of an Avenue Q song', '2014-03-03 05:14:37', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(17, 4, 'How to Sharpen Knives', '', '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(40, 4, 'Mobile App Dev', '', '2014-03-10 20:52:05', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(41, 4, 'SQL index guide', '', '2014-03-10 21:54:03', 0, NULL, NULL, NULL, NULL);
INSERT INTO `units` (`id`, `user_id`, `title`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(42, 3, 'PHP and MySQL', '', '2014-03-10 22:12:36', 2130706433, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units_subject`
--

DROP TABLE IF EXISTS `units_subject`;
CREATE TABLE IF NOT EXISTS `units_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `subject_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `units_subject`
--

INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(1, 1, 2);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(2, 1, 1);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(4, 2, 1);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(5, 2, 10);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(6, 3, 3);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(8, 4, 4);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(9, 4, 12);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(10, 6, 12);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(11, 6, 7);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(12, 6, 3);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(13, 7, 12);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(14, 7, 1);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(15, 7, 13);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(16, 9, 5);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(17, 11, 6);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(18, 11, 15);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(19, 12, 16);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(20, 14, 0);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(21, 15, 19);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(22, 16, 14);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(23, 16, 8);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(24, 17, 20);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(43, 40, 3);
INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES(44, 42, 3);

-- --------------------------------------------------------

--
-- Table structure for table `unit_rating`
--

DROP TABLE IF EXISTS `unit_rating`;
CREATE TABLE IF NOT EXISTS `unit_rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `rating` enum('-1','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` enum('active','blocked','deleted','') NOT NULL,
  `facebook_id` varchar(40) NOT NULL,
  `google_id` varchar(40) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `facebook_id`, `google_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(2, 'Matthew', 'Smrke', 'msmrke@yahoo.com', '', 'active', '503406508', '', '2014-02-15 20:39:26', 2130706433, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `facebook_id`, `google_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(3, 'Matthew', 'Smrke', 'smrkem@gmail.com', '', 'active', '', '103178149624118788341', '2014-02-15 20:56:47', 2130706433, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `facebook_id`, `google_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(4, 'T', 'Mui', 'sekjaimui@gmail.com', '', 'active', '', '101135466761717121827', '2014-02-21 23:01:13', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `facebook_id`, `google_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES(5, 'shermie', 'lai', 'shermie.chris@gmail.com', '', 'active', '', '101399596847820485998', '2014-03-21 02:54:43', 2130706433, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(4, 2, '2014-02-15 20:46:07', 'facebook');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(5, 3, '2014-02-15 20:56:47', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(6, 3, '2014-02-15 20:57:09', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(7, 4, '2014-02-21 23:01:13', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(8, 4, '2014-02-22 06:59:44', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(9, 4, '2014-02-22 07:13:57', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(10, 4, '2014-02-22 07:15:56', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(11, 4, '2014-02-22 07:16:24', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(12, 4, '2014-02-22 07:41:55', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(13, 4, '2014-02-23 07:35:07', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(14, 4, '2014-02-23 19:25:13', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(15, 4, '2014-02-23 21:29:22', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(16, 4, '2014-02-23 21:50:06', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(17, 4, '2014-02-23 21:51:01', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(18, 4, '2014-02-23 22:07:06', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(19, 4, '2014-02-23 22:07:35', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(20, 4, '2014-02-24 01:03:49', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(21, 4, '2014-02-24 02:35:07', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(22, 4, '2014-02-24 05:20:17', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(23, 4, '2014-02-24 06:42:28', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(24, 4, '2014-02-25 01:14:30', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(25, 4, '2014-02-26 02:47:26', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(26, 4, '2014-02-27 19:22:29', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(27, 4, '2014-03-01 07:00:22', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(28, 4, '2014-03-03 05:13:33', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(29, 4, '2014-03-04 03:37:36', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(30, 4, '2014-03-05 08:01:48', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(31, 4, '2014-03-06 00:23:35', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(32, 4, '2014-03-06 00:31:27', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(33, 4, '2014-03-06 03:59:55', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(34, 4, '2014-03-06 23:42:19', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(35, 4, '2014-03-08 20:31:32', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(36, 4, '2014-03-09 11:09:01', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(37, 4, '2014-03-09 21:59:21', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(38, 4, '2014-03-10 20:27:13', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(39, 3, '2014-03-10 22:10:55', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(40, 3, '2014-03-16 02:56:58', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(41, 3, '2014-03-16 03:03:09', 'google');
INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES(42, 5, '2014-03-21 02:54:43', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `user_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`user_id`, `permission_id`) VALUES(3, 1);
INSERT INTO `user_permissions` (`user_id`, `permission_id`) VALUES(3, 2);
INSERT INTO `user_permissions` (`user_id`, `permission_id`) VALUES(4, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
