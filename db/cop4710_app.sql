-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2015 at 06:47 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cop4710_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`aid` int(11) NOT NULL,
  `street` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `sid` varchar(2) DEFAULT NULL,
  `p_code` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`aid`, `street`, `city`, `sid`, `p_code`) VALUES
(0, ' ', ' ', 'AK', ' '),
(1, '1010 street23', 'City12', 'AZ', '32819'),
(2, '5678 street', 'City2', 'FL', '32825'),
(4, '5000 street', 'orlando', 'FL', '32819'),
(5, '5000 street', 'orlando', 'FL', '32819'),
(6, '5000 street', 'orlando', 'FL', '32819'),
(7, '5000 street', 'orlando', 'FL', '32819'),
(8, '5000 street', 'orlando', 'FL', '32819'),
(9, '5000 street', 'orlando', 'FL', '32819'),
(10, '333', '3566', 'DE', '32');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`cid` int(11) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `email`, `message`, `eid`) VALUES
(1, 'u4@knights.ucf.edu', 'message 1', 1),
(2, 'u1@knights.ucf.edu', 'message 2', 2),
(3, 'u2@knights.ucf.edu', 'message 3', 1),
(4, 'u12@knights.ucf.edu', 'message 4', 1),
(5, 'u8@knights.ucf.edu', 'message 5', 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`eid` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `approval` bit(1) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `contact_phone` varchar(12) DEFAULT NULL,
  `contact_email` varchar(60) DEFAULT NULL,
  `ecid` int(11) DEFAULT NULL,
  `evid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eid`, `rid`, `uid`, `name`, `rating`, `date`, `approval`, `description`, `time`, `aid`, `contact_phone`, `contact_email`, `ecid`, `evid`) VALUES
(0, NULL, NULL, '', NULL, NULL, NULL, '4654654', NULL, 0, NULL, NULL, NULL, NULL),
(1, 1, NULL, 'Test event rso1', 3, '2014-01-01', b'1', '4654654', '20:35:00', 1, '123-456-7890', 'm2@knights.ucf.edu', 2, 4),
(2, NULL, NULL, '', 4, '2015-05-17', b'1', '4654654', '06:00:00', 2, '123-456-7890', 'm2@knights.ucf.edu', 2, 2),
(5, 1, NULL, 'event create test', NULL, '2015-04-20', NULL, '4654654', '10:21:00', 5, '33999--999', '-9399', 1, 1),
(6, 1, NULL, 'event create test', NULL, '2015-04-20', NULL, '4654654', '10:21:00', 6, '33999--999', '-9399', 1, 1),
(7, 1, NULL, 'event create test', NULL, '2015-04-20', NULL, '4654654', '10:21:00', 7, '33999--999', '-9399', 1, 1),
(8, 1, NULL, 'event create test', NULL, '2015-04-20', NULL, '4654654', '10:21:00', 8, '33999--999', '-9399', 1, 1),
(9, 1, NULL, 'event create test', NULL, '2015-04-20', NULL, '4654654', '10:21:00', 9, '33999--999', '-9399', 1, 1),
(10, 1, NULL, 'df', NULL, '2004-03-30', NULL, '4654654', '15:15:00', 10, '12351', '1235412532', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE IF NOT EXISTS `event_category` (
`ecid` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`ecid`, `type`) VALUES
(1, 'Event category 1'),
(2, 'Event category 2'),
(3, 'Event category 3'),
(4, 'Event category 4');

-- --------------------------------------------------------

--
-- Table structure for table `event_visibility`
--

CREATE TABLE IF NOT EXISTS `event_visibility` (
`evid` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_visibility`
--

INSERT INTO `event_visibility` (`evid`, `type`) VALUES
(1, 'Event visibility 1'),
(2, 'Event visibility 2'),
(3, 'Event visibility 3'),
(4, 'Event visibility 4');

-- --------------------------------------------------------

--
-- Table structure for table `rso`
--

CREATE TABLE IF NOT EXISTS `rso` (
`rid` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `joinable` bit(1) NOT NULL,
  `rtid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso`
--

INSERT INTO `rso` (`rid`, `name`, `description`, `joinable`, `rtid`) VALUES
(0, '', '', b'0', 1),
(1, 'rs', '32', b'0', 4),
(2, 'RSO 2', '', b'0', 2),
(3, 'RSO 3', '', b'0', 2),
(4, 'RSO 4', '', b'0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rso_event_list`
--

CREATE TABLE IF NOT EXISTS `rso_event_list` (
  `rid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rso_member_list`
--

CREATE TABLE IF NOT EXISTS `rso_member_list` (
  `rid` int(11) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL,
  `admin` bit(1) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso_member_list`
--

INSERT INTO `rso_member_list` (`rid`, `email`, `password`, `admin`, `created`) VALUES
(1, 'meeeee', '', b'0', '0000-00-00 00:00:00'),
(1, 'u1@knights.ucf.edu', '', b'1', '0000-00-00 00:00:00'),
(1, 'u2@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(1, 'u3@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(1, 'u5@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(2, 'u11@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(2, 'u12@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(2, 'u1@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(2, 'u2@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(2, 'u4@knights.ucf.edu', '', b'1', '0000-00-00 00:00:00'),
(2, 'u6@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00'),
(3, 'u6@knights.ucf.edu', '', b'1', '0000-00-00 00:00:00'),
(4, 'u1@knights.ucf.edu', '', b'0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rso_type`
--

CREATE TABLE IF NOT EXISTS `rso_type` (
`rtid` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso_type`
--

INSERT INTO `rso_type` (`rtid`, `type`) VALUES
(1, 'RSO type 1'),
(2, 'RSO type 2'),
(3, 'RSO type 3'),
(4, 'RSO type 4');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `sid` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`sid`, `name`) VALUES
('AK', 'Alaska'),
('AL', 'Alabama'),
('AR', 'Arkansas'),
('AZ', 'Arizona'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Deleware'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('IA', 'Iowa'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('MA', 'Massachusetts'),
('MD', 'Maryland'),
('ME', 'Maine'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MO', 'Missouri'),
('MS', 'Mississippi'),
('MT', 'Montana'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('NE', 'Nebraska'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NV', 'Nevada'),
('NY', 'New York'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VA', 'Verginia'),
('VT', 'Vermont'),
('WA', 'Washington'),
('WI', 'Wisconsin'),
('WV', 'West Virginia'),
('WY', 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE IF NOT EXISTS `university` (
`uid` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `domain` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`uid`, `name`, `aid`, `description`, `domain`) VALUES
(0, NULL, 0, NULL, ''),
(1, 'University of Central Florida', 1, 'test university', ''),
(2, 'Valencia Community College', 2, 'test university 2', '');

-- --------------------------------------------------------

--
-- Table structure for table `university_event_list`
--

CREATE TABLE IF NOT EXISTS `university_event_list` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `university_member_list`
--

CREATE TABLE IF NOT EXISTS `university_member_list` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `super_admin` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university_member_list`
--

INSERT INTO `university_member_list` (`uid`, `email`, `super_admin`) VALUES
(1, 'u10@knights.ucf.edu', b'0'),
(1, 'u11@knights.ucf.edu', b'0'),
(1, 'u12@knights.ucf.edu', b'0'),
(1, 'u1@knights.ucf.edu', b'0'),
(1, 'u2@knights.ucf.edu', b'0'),
(1, 'u3@knights.ucf.edu', b'0'),
(1, 'u4@knights.ucf.edu', b'0'),
(1, 'u5@knights.ucf.edu', b'1'),
(1, 'u6@knights.ucf.edu', b'0'),
(1, 'u7@knights.ucf.edu', b'0'),
(1, 'u8@knights.ucf.edu', b'0'),
(1, 'u9@knights.ucf.edu', b'0'),
(2, 'm', b'0'),
(2, 's', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `userlist`
--

CREATE TABLE IF NOT EXISTS `userlist` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(60) NOT NULL DEFAULT '',
  `phone_number` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlist`
--

INSERT INTO `userlist` (`first_name`, `last_name`, `email`, `phone_number`) VALUES
('m', 'm', 'm', 'm'),
('me', 'me', 'meeeee', 'me'),
('s', 's', 's', 's'),
('user 10', 'u10', 'u10@knights.ucf.edu', '4070000010'),
('user 11', 'u11', 'u11@knights.ucf.edu', '4070000011'),
('user 12', 'u12', 'u12@knights.ucf.edu', '4070000012'),
('user 1', 'u1', 'u1@knights.ucf.edu', '4070000001'),
('user 2', 'u2', 'u2@knights.ucf.edu', '4070000002'),
('user 3', 'u3', 'u3@knights.ucf.edu', '4070000003'),
('user 4', 'u4', 'u4@knights.ucf.edu', '4070000004'),
('user 5', 'u5', 'u5@knights.ucf.edu', '4070000005'),
('user 6', 'u6', 'u6@knights.ucf.edu', '4070000006'),
('user 7', 'u7', 'u7@knights.ucf.edu', '4070000007'),
('user 8', 'u8', 'u8@knights.ucf.edu', '4070000008'),
('user 9', 'u9', 'u9@knights.ucf.edu', '4070000009');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`aid`), ADD KEY `sid` (`sid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`cid`), ADD KEY `email` (`email`), ADD KEY `eid` (`eid`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`eid`), ADD KEY `ecid` (`ecid`), ADD KEY `evid` (`evid`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
 ADD PRIMARY KEY (`ecid`);

--
-- Indexes for table `event_visibility`
--
ALTER TABLE `event_visibility`
 ADD PRIMARY KEY (`evid`);

--
-- Indexes for table `rso`
--
ALTER TABLE `rso`
 ADD PRIMARY KEY (`rid`), ADD KEY `rtid` (`rtid`);

--
-- Indexes for table `rso_event_list`
--
ALTER TABLE `rso_event_list`
 ADD PRIMARY KEY (`rid`,`eid`), ADD KEY `eid` (`eid`);

--
-- Indexes for table `rso_member_list`
--
ALTER TABLE `rso_member_list`
 ADD PRIMARY KEY (`rid`,`email`), ADD KEY `email` (`email`);

--
-- Indexes for table `rso_type`
--
ALTER TABLE `rso_type`
 ADD PRIMARY KEY (`rtid`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
 ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
 ADD PRIMARY KEY (`uid`), ADD KEY `aid` (`aid`);

--
-- Indexes for table `university_event_list`
--
ALTER TABLE `university_event_list`
 ADD PRIMARY KEY (`uid`,`eid`), ADD KEY `eid` (`eid`);

--
-- Indexes for table `university_member_list`
--
ALTER TABLE `university_member_list`
 ADD PRIMARY KEY (`uid`,`email`), ADD UNIQUE KEY `email_2` (`email`), ADD KEY `email` (`email`);

--
-- Indexes for table `userlist`
--
ALTER TABLE `userlist`
 ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
MODIFY `ecid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `event_visibility`
--
ALTER TABLE `event_visibility`
MODIFY `evid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rso`
--
ALTER TABLE `rso`
MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rso_type`
--
ALTER TABLE `rso_type`
MODIFY `rtid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `state` (`sid`) ON DELETE SET NULL;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`email`) REFERENCES `userlist` (`email`) ON DELETE SET NULL,
ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `event` (`eid`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`ecid`) REFERENCES `event_category` (`ecid`) ON DELETE SET NULL,
ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`evid`) REFERENCES `event_visibility` (`evid`) ON DELETE SET NULL;

--
-- Constraints for table `rso`
--
ALTER TABLE `rso`
ADD CONSTRAINT `rso_ibfk_1` FOREIGN KEY (`rtid`) REFERENCES `rso_type` (`rtid`) ON DELETE SET NULL;

--
-- Constraints for table `rso_event_list`
--
ALTER TABLE `rso_event_list`
ADD CONSTRAINT `rso_event_list_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `rso` (`rid`) ON DELETE CASCADE,
ADD CONSTRAINT `rso_event_list_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `event` (`eid`) ON DELETE CASCADE;

--
-- Constraints for table `rso_member_list`
--
ALTER TABLE `rso_member_list`
ADD CONSTRAINT `rso_member_list_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `rso` (`rid`) ON DELETE CASCADE,
ADD CONSTRAINT `rso_member_list_ibfk_2` FOREIGN KEY (`email`) REFERENCES `userlist` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `university`
--
ALTER TABLE `university`
ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `address` (`aid`) ON DELETE SET NULL;

--
-- Constraints for table `university_event_list`
--
ALTER TABLE `university_event_list`
ADD CONSTRAINT `university_event_list_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `university` (`uid`) ON DELETE CASCADE,
ADD CONSTRAINT `university_event_list_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `event` (`eid`) ON DELETE CASCADE;

--
-- Constraints for table `university_member_list`
--
ALTER TABLE `university_member_list`
ADD CONSTRAINT `university_member_list_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `university` (`uid`) ON DELETE CASCADE,
ADD CONSTRAINT `university_member_list_ibfk_2` FOREIGN KEY (`email`) REFERENCES `userlist` (`email`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
