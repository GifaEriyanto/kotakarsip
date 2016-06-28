-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2016 at 06:34 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ms_kotakarsip`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_dispotition`
--

CREATE TABLE IF NOT EXISTS `app_dispotition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inbox` bigint(20) NOT NULL,
  `id_master_dispotition` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_inbox`
--

CREATE TABLE IF NOT EXISTS `app_inbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_rack` int(11) NOT NULL,
  `inbox_date` date NOT NULL,
  `inbox_from` varchar(100) NOT NULL,
  `inbox_number` varchar(50) NOT NULL,
  `inbox_title` varchar(250) NOT NULL,
  `inbox_desc` text NOT NULL,
  `inbox_file` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_master_disposition`
--

CREATE TABLE IF NOT EXISTS `app_master_disposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inbox` bigint(20) NOT NULL,
  `disposition_name` varchar(100) NOT NULL,
  `disposition_position` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_master_rack`
--

CREATE TABLE IF NOT EXISTS `app_master_rack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_number` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_notifications`
--

CREATE TABLE IF NOT EXISTS `app_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_kind` enum('inbox','outbox','master') NOT NULL,
  `notification_type` enum('create','update','delete') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_content` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_notifications_read`
--

CREATE TABLE IF NOT EXISTS `app_notifications_read` (
  `id_notification` bigint(20) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_outbox`
--

CREATE TABLE IF NOT EXISTS `app_outbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_rack` int(11) NOT NULL,
  `outbox_date` date NOT NULL,
  `inbox_for` varchar(100) NOT NULL,
  `inbox_number` varchar(50) NOT NULL,
  `inbox_title` varchar(250) NOT NULL,
  `inbox_desc` text NOT NULL,
  `inbox_file` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(60) NOT NULL,
  `user_displayname` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_activation` enum('0','1') NOT NULL DEFAULT '1',
  `user_status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `user_login`, `user_pass`, `user_displayname`, `user_email`, `user_registered`, `user_activation`, `user_status`) VALUES
(2, 'adsf', '213', 'asdf', 'asdf@ymkasd.com', '2016-06-26 20:40:45', '1', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
