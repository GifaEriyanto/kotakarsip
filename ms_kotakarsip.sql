-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2016 at 10:24 AM
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
-- Table structure for table `app_disposition`
--

CREATE TABLE IF NOT EXISTS `app_disposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inbox` bigint(20) NOT NULL,
  `id_master_disposition` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_master_dispotition` (`id_master_disposition`),
  KEY `id_inbox` (`id_inbox`)
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
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_rack` (`id_rack`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_inbox`
--

INSERT INTO `app_inbox` (`id`, `id_user`, `id_rack`, `inbox_date`, `inbox_from`, `inbox_number`, `inbox_title`, `inbox_desc`, `inbox_file`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2016-06-30', 'CV. Madani Teknologi', 'AD/12/SK/2016', 'Minta Sumbangan', 'Lorem ipsum dolor sit amet', '', '2016-06-29 03:34:36', '2016-06-29 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `app_master_disposition`
--

CREATE TABLE IF NOT EXISTS `app_master_disposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disposition_name` varchar(100) NOT NULL,
  `disposition_position` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_master_disposition`
--

INSERT INTO `app_master_disposition` (`id`, `disposition_name`, `disposition_position`) VALUES
(1, 'Gifa Eriyanto', 'CTO');

-- --------------------------------------------------------

--
-- Table structure for table `app_master_rack`
--

CREATE TABLE IF NOT EXISTS `app_master_rack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_number` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_master_rack`
--

INSERT INTO `app_master_rack` (`id`, `rack_number`) VALUES
(1, '2911'),
(2, '7611');

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
  `id_user` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL
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
  `outbox_for` varchar(100) NOT NULL,
  `outbox_number` varchar(50) NOT NULL,
  `outbox_title` varchar(250) NOT NULL,
  `outbox_desc` text NOT NULL,
  `outbox_file` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_rack` (`id_rack`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`id`, `user_login`, `user_pass`, `user_displayname`, `user_email`, `user_registered`, `user_activation`, `user_status`) VALUES
(2, 'gifaeriyanto', '213', 'Gifa Eriyanto', 'gifaeriyanto@ymail.com', '2016-06-26 20:40:45', '1', '0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_disposition`
--
CREATE TABLE IF NOT EXISTS `view_disposition` (
`id` int(11)
,`id_inbox` bigint(20)
,`id_master_disposition` int(11)
,`created_at` timestamp
,`inbox_from` varchar(100)
,`inbox_number` varchar(50)
,`inbox_title` varchar(250)
,`disposition_name` varchar(100)
,`disposition_position` varchar(40)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_inbox`
--
CREATE TABLE IF NOT EXISTS `view_inbox` (
`id` bigint(20)
,`id_user` int(11)
,`id_rack` int(11)
,`inbox_date` date
,`inbox_from` varchar(100)
,`inbox_number` varchar(50)
,`inbox_title` varchar(250)
,`inbox_desc` text
,`inbox_file` text
,`created_at` timestamp
,`updated_at` timestamp
,`user_login` varchar(60)
,`user_displayname` varchar(100)
,`rack_number` varchar(5)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_outbox`
--
CREATE TABLE IF NOT EXISTS `view_outbox` (
`id` bigint(20)
,`id_user` int(11)
,`id_rack` int(11)
,`outbox_date` date
,`outbox_for` varchar(100)
,`outbox_number` varchar(50)
,`outbox_title` varchar(250)
,`outbox_desc` text
,`outbox_file` text
,`created_at` timestamp
,`updated_at` timestamp
,`user_login` varchar(60)
,`user_displayname` varchar(100)
,`rack_number` varchar(5)
);
-- --------------------------------------------------------

--
-- Structure for view `view_disposition`
--
DROP TABLE IF EXISTS `view_disposition`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_disposition` AS select `a`.`id` AS `id`,`a`.`id_inbox` AS `id_inbox`,`a`.`id_master_disposition` AS `id_master_disposition`,`a`.`created_at` AS `created_at`,`b`.`inbox_from` AS `inbox_from`,`b`.`inbox_number` AS `inbox_number`,`b`.`inbox_title` AS `inbox_title`,`c`.`disposition_name` AS `disposition_name`,`c`.`disposition_position` AS `disposition_position` from ((`app_disposition` `a` join `app_inbox` `b` on((`a`.`id_inbox` = `b`.`id`))) join `app_master_disposition` `c` on((`a`.`id_master_disposition` = `c`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_inbox`
--
DROP TABLE IF EXISTS `view_inbox`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_inbox` AS select `a`.`id` AS `id`,`a`.`id_user` AS `id_user`,`a`.`id_rack` AS `id_rack`,`a`.`inbox_date` AS `inbox_date`,`a`.`inbox_from` AS `inbox_from`,`a`.`inbox_number` AS `inbox_number`,`a`.`inbox_title` AS `inbox_title`,`a`.`inbox_desc` AS `inbox_desc`,`a`.`inbox_file` AS `inbox_file`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at`,`b`.`user_login` AS `user_login`,`b`.`user_displayname` AS `user_displayname`,`c`.`rack_number` AS `rack_number` from ((`app_inbox` `a` join `app_users` `b` on((`a`.`id_user` = `b`.`id`))) join `app_master_rack` `c` on((`a`.`id_rack` = `c`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_outbox`
--
DROP TABLE IF EXISTS `view_outbox`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_outbox` AS select `a`.`id` AS `id`,`a`.`id_user` AS `id_user`,`a`.`id_rack` AS `id_rack`,`a`.`outbox_date` AS `outbox_date`,`a`.`outbox_for` AS `outbox_for`,`a`.`outbox_number` AS `outbox_number`,`a`.`outbox_title` AS `outbox_title`,`a`.`outbox_desc` AS `outbox_desc`,`a`.`outbox_file` AS `outbox_file`,`a`.`created_at` AS `created_at`,`a`.`updated_at` AS `updated_at`,`b`.`user_login` AS `user_login`,`b`.`user_displayname` AS `user_displayname`,`c`.`rack_number` AS `rack_number` from ((`app_outbox` `a` join `app_users` `b` on((`a`.`id_user` = `b`.`id`))) join `app_master_rack` `c` on((`a`.`id_rack` = `c`.`id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_disposition`
--
ALTER TABLE `app_disposition`
  ADD CONSTRAINT `inbox` FOREIGN KEY (`id_inbox`) REFERENCES `app_inbox` (`id`),
  ADD CONSTRAINT `master` FOREIGN KEY (`id_master_disposition`) REFERENCES `app_master_disposition` (`id`);

--
-- Constraints for table `app_inbox`
--
ALTER TABLE `app_inbox`
  ADD CONSTRAINT `rack_inbox` FOREIGN KEY (`id_rack`) REFERENCES `app_master_rack` (`id`),
  ADD CONSTRAINT `user_inbox` FOREIGN KEY (`id_user`) REFERENCES `app_users` (`id`);

--
-- Constraints for table `app_outbox`
--
ALTER TABLE `app_outbox`
  ADD CONSTRAINT `rack_outbox` FOREIGN KEY (`id_rack`) REFERENCES `app_master_rack` (`id`),
  ADD CONSTRAINT `user_outbox` FOREIGN KEY (`id_user`) REFERENCES `app_users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
