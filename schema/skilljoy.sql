-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2014 at 08:38 PM
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
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answers` varchar(300) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answers`, `user_name`) VALUES
(3, 1, 'It doesn''t matter', 'Sam'),
(9, 1, 'I think its good to use pine tree!', 'Amy'),
(10, 8, 'Dry weather!', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

DROP TABLE IF EXISTS `content_types`;
CREATE TABLE `content_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `content_types`
--

INSERT INTO `content_types` (`id`, `name`) VALUES
(1, 'Youtube'),
(2, 'PDF'),
(3, 'Vimeo'),
(4, 'URL');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

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
(17, 15, 'W2Wb8N0yY5Q', 1, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 1),
(18, 16, 'YRgNOyCnbqg', 1, '2014-03-03 05:14:38', 0, NULL, NULL, NULL, NULL, 1),
(19, 17, 'rTKV5-ZSWcE', 1, '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL, 1),
(20, 18, 'SvDgW_D2ico', 1, '2014-03-03 05:16:27', 0, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `question` varchar(300) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `unit_id`, `question`, `user_name`) VALUES
(1, 5, 'Is pine tree good for start a fire?', 'Shermie'),
(7, 5, 'Should I use sticks/stone to start a fire?', 'ABC'),
(8, 1, 'What is best weather to start a fire?', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `key` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `rating` enum('-1','1') NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`key`, `user_id`, `unit_id`, `rating`) VALUES
(9, 4, 1, '-1'),
(10, 4, 6, '1'),
(11, 4, 18, '1'),
(12, 4, 7, '1');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

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
(19, 'Ayumi Hamasaki', 0, '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(20, 'Knife Sharpening', 0, '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL, 'confirmed'),
(21, 'Cleaning Fish', 0, '2014-03-03 05:16:27', 0, NULL, NULL, NULL, NULL, 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

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
(15, 4, 'Ayumi', '', '2014-03-01 10:30:43', 0, NULL, NULL, NULL, NULL),
(16, 4, 'Machima - Internet is for Porn', 'WoW remake of an Avenue Q song', '2014-03-03 05:14:37', 0, NULL, NULL, NULL, NULL),
(17, 4, 'How to Sharpen Knives', '', '2014-03-03 05:15:29', 0, NULL, NULL, NULL, NULL),
(18, 4, 'How to Gut a Fish', '', '2014-03-03 05:16:27', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units_subject`
--

DROP TABLE IF EXISTS `units_subject`;
CREATE TABLE `units_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` bigint(20) unsigned NOT NULL,
  `subject_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `units_subject`
--

INSERT INTO `units_subject` (`id`, `unit_id`, `subject_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(4, 2, 1),
(5, 2, 10),
(6, 3, 3),
(8, 4, 4),
(9, 4, 12),
(10, 6, 12),
(11, 6, 7),
(12, 6, 3),
(13, 7, 12),
(14, 7, 1),
(15, 7, 13),
(16, 9, 5),
(17, 11, 6),
(18, 11, 15),
(19, 12, 16),
(20, 14, 0),
(21, 15, 19),
(22, 16, 14),
(23, 16, 8),
(24, 17, 20),
(25, 18, 1),
(26, 18, 21);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `status`, `facebook_id`, `google_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, 'T', 'Mui', 'sek__jai@hotmail.com', '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 'Matthew', 'Smrke', 'msmrke@yahoo.com', '', 'active', '503406508', '', '2014-02-15 20:39:26', 2130706433, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(3, 'Matthew', 'Smrke', 'smrkem@gmail.com', '', 'active', '', '103178149624118788341', '2014-02-15 20:56:47', 2130706433, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(4, 'T', 'Mui', 'sekjaimui@gmail.com', '', 'active', '', '101135466761717121827', '2014-02-21 23:01:13', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `user_id`, `datetime`, `method`) VALUES
(4, 2, '2014-02-15 20:46:07', 'facebook'),
(5, 3, '2014-02-15 20:56:47', 'google'),
(6, 3, '2014-02-15 20:57:09', 'google'),
(7, 4, '2014-02-21 23:01:13', 'google'),
(8, 4, '2014-02-22 06:59:44', 'google'),
(9, 4, '2014-02-22 07:13:57', 'google'),
(10, 4, '2014-02-22 07:15:56', 'google'),
(11, 4, '2014-02-22 07:16:24', 'google'),
(12, 4, '2014-02-22 07:41:55', 'google'),
(13, 4, '2014-02-23 07:35:07', 'google'),
(14, 4, '2014-02-23 19:25:13', 'google'),
(15, 4, '2014-02-23 21:29:22', 'google'),
(16, 4, '2014-02-23 21:50:06', 'google'),
(17, 4, '2014-02-23 21:51:01', 'google'),
(18, 4, '2014-02-23 22:07:06', 'google'),
(19, 4, '2014-02-23 22:07:35', 'google'),
(20, 4, '2014-02-24 01:03:49', 'google'),
(21, 4, '2014-02-24 02:35:07', 'google'),
(22, 4, '2014-02-24 05:20:17', 'google'),
(23, 4, '2014-02-24 06:42:28', 'google'),
(24, 4, '2014-02-25 01:14:30', 'google'),
(25, 4, '2014-02-26 02:47:26', 'google'),
(26, 4, '2014-02-27 19:22:29', 'google'),
(27, 4, '2014-03-01 07:00:22', 'google'),
(28, 4, '2014-03-03 05:13:33', 'google'),
(29, 4, '2014-03-04 03:37:36', 'google'),
(30, 4, '2014-03-05 08:01:48', 'google'),
(31, 4, '2014-03-06 00:23:35', 'google'),
(32, 4, '2014-03-06 00:31:27', 'google'),
(33, 4, '2014-03-06 03:59:55', 'google'),
(34, 4, '2014-03-06 23:42:19', 'google'),
(35, 4, '2014-03-08 20:31:32', 'google');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
