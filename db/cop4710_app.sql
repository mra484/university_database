-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:33060
-- Generation Time: Apr 16, 2015 at 01:44 AM
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
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `sid` varchar(2) DEFAULT NULL,
  `p_code` varchar(30) DEFAULT NULL,
  `latitude` float(10,6) NOT NULL DEFAULT '38.000000',
  `longitude` float(10,6) NOT NULL DEFAULT '-98.000000'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`aid`, `street`, `city`, `sid`, `p_code`, `latitude`, `longitude`) VALUES
(0, '', '', 'IN', '', 41.782860, -87.974892),
(1, '1010 street23', 'City12', 'AZ', '32819', 0.000000, -98.000000),
(2, '5678 street', 'City2', 'FL', '32825', 0.000000, -98.000000),
(4, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(5, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(6, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(7, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(8, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(9, '5000 street', 'orlando', 'FL', '32819', 0.000000, -98.000000),
(10, '333', '3566', 'DE', '32', 0.000000, -98.000000),
(11, '3242', 'orlando', 'FL', '23432', 0.000000, -98.000000),
(12, '3242', 'orlando', 'FL', '23432', 0.000000, -98.000000),
(13, '3242', 'orlando', 'FL', '23432', 0.000000, -98.000000),
(14, '3242', 'orlando', 'FL', '23432', 0.000000, -98.000000),
(15, '55500 street', 'oralndo', 'IL', '60559', 0.000000, -98.000000),
(16, '55500 street', 'oralndo', 'IL', '60559', 0.000000, -98.000000),
(17, 'asdfadsf123123', 'asdf', 'AL', 'asdfawsddsdASD', 0.000000, -98.000000),
(18, '1324123 streetdd', 'cesadfa ity', 'IA', '564156', 0.000000, -98.000000),
(19, 'kl;jasd;lkfj', ';l', 'AK', '234243', 0.000000, -98.000000),
(20, 'sterqwe', 'asdfjkledsr;fkl', 'AK', '565465', 0.000000, -98.000000),
(21, 'sterqwe', 'asdfjkledsr;fkl', 'AK', '565465', 0.000000, -98.000000),
(22, '456', '456456', 'AK', '546', 0.000000, -98.000000),
(23, '4564', '654', 'AK', '456', 0.000000, -98.000000),
(24, '4000 central florida blvd', 'orlando', 'FL', '32816', 0.000000, -98.000000),
(25, '7503 fake street', '', 'AK', '', 38.000000, -98.000000),
(26, '3330 cass avenue12333333333333333', 'westmont', 'IL', '60559', 38.000000, -98.000000);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`cid` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  `created` datetime NOT NULL,
  `eid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `email`, `message`, `created`, `eid`) VALUES
(1, 'u4@knights.ucf.edu', 'message 1', '0000-00-00 00:00:00', 1),
(2, 'u1@knights.ucf.edu', 'message 2', '0000-00-00 00:00:00', 2),
(3, 'u2@knights.ucf.edu', 'message 3', '0000-00-00 00:00:00', 1),
(4, 'u12@knights.ucf.edu', 'message 4', '0000-00-00 00:00:00', 1),
(5, 'u8@knights.ucf.edu', 'message 5', '0000-00-00 00:00:00', 2),
(11, 'm', 'adsfasdfadsfads', '2015-04-07 18:45:10', 11),
(13, 's', 'asdfasdfsdfdsfadsfsdfsdfsd', '2015-04-07 18:45:45', 11),
(14, 'm', 'fasdfasdf', '2015-04-07 18:47:06', 11),
(15, 'm', '4545645', '2015-04-09 16:27:27', 12),
(16, 'm', '4545645', '2015-04-09 16:27:43', 12);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`eid` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `name` varchar(500) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `approval` bit(1) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `contact_phone` varchar(12) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `ecid` int(11) DEFAULT NULL,
  `evid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eid`, `owner`, `name`, `rating`, `date`, `approval`, `description`, `time`, `aid`, `contact_phone`, `contact_email`, `ecid`, `evid`) VALUES
(0, '', '', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(1, '', 'Test event rso1', 3, '2014-01-01', b'1', 'nothing here here', '20:35:00', 1, '123-456-7890', 'm2@knights.ucf.edu', 2, 4),
(2, '', '', 4, '2015-05-17', b'1', 'nothing here here', '06:00:00', 2, '123-456-7890', 'm2@knights.ucf.edu', 2, 2),
(5, '', 'event create test', NULL, '2015-04-20', NULL, 'nothing here here', '10:21:00', 5, '33999--999', '-9399', 1, 1),
(6, '', 'event create test', NULL, '2015-04-20', NULL, 'nothing here here', '10:21:00', 6, '33999--999', '-9399', 1, 1),
(7, '', 'event create test', NULL, '2015-04-20', NULL, 'nothing here here', '10:21:00', 7, '33999--999', '-9399', 1, 1),
(8, '', 'event create test', NULL, '2015-04-20', NULL, 'nothing here here', '10:21:00', 8, '33999--999', '-9399', 1, 1),
(9, '', 'event create test', NULL, '2015-04-20', NULL, 'nothing here here', '10:21:00', 9, '33999--999', '-9399', 1, 1),
(10, '', 'df', NULL, '2004-03-30', NULL, 'nothing here here', '15:15:00', 10, '12351', '1235412532', 2, 3),
(11, 'm', 'Test event', NULL, '2012-02-02', NULL, '4566456415564e', '03:00:00', 14, '123421', '324234242', 1, 2),
(12, 'm', 'dafd', NULL, '2016-02-12', NULL, 'ldafkj;sdklfjas;df l;asdfdgfdg', '18:30:00', 18, '564564564156', '546544@asdlfkj.aso', 4, 1),
(13, 'm', 'as;df', NULL, '1984-11-04', NULL, 'event created by university', '20:00:00', 19, '123412341324', '242342', 1, 1),
(14, 'm', 'university event 1', NULL, '1990-04-12', NULL, 'Test university event 1', '20:00:00', 20, '1654156465', '564', 1, 1),
(15, 'm', 'university event 2', NULL, '1990-04-12', NULL, 'test description university event 2', '20:00:00', 21, '1654156465', '564', 1, 1),
(16, 'm', 'university event 3', NULL, '1990-04-12', NULL, NULL, '20:00:00', 22, '56', '456', 1, 1),
(17, 'm', 'university event 4', NULL, '2016-02-12', NULL, NULL, '20:00:00', 23, '456564', '45564', 1, 1),
(47, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '0000-00-00', NULL, NULL, '09:30:00', NULL, NULL, NULL, NULL, NULL),
(48, '', 'Graduate Student Appreciation Week: International Social wit', NULL, '0000-00-00', NULL, NULL, '11:00:00', NULL, NULL, NULL, NULL, NULL),
(49, '', 'String Theory Meets Star Trek Voyager - an interview of phys', NULL, '0000-00-00', NULL, NULL, '11:00:00', NULL, NULL, NULL, NULL, NULL),
(50, '', 'Conversation With A Female Organic Farmer, Marketer, and Ent', NULL, '0000-00-00', NULL, NULL, '12:00:00', NULL, NULL, NULL, NULL, NULL),
(51, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '0000-00-00', NULL, NULL, '02:00:00', NULL, NULL, NULL, NULL, NULL),
(52, '', '"A Day of Gaming" presented by FIEA', NULL, '0000-00-00', NULL, NULL, '06:00:00', NULL, NULL, NULL, NULL, NULL),
(53, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '0000-00-00', NULL, NULL, '06:00:00', NULL, NULL, NULL, NULL, NULL),
(54, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '0000-00-00', NULL, NULL, '06:30:00', NULL, NULL, NULL, NULL, NULL),
(55, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, NULL, '06:30:00', NULL, NULL, NULL, NULL, NULL),
(56, '', 'Battle Knights III', NULL, '0000-00-00', NULL, NULL, '07:00:00', NULL, NULL, NULL, NULL, NULL),
(57, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '0000-00-00', NULL, NULL, '07:30:00', NULL, NULL, NULL, NULL, NULL),
(58, '', 'Shack N'' Dash Habitat 5k Run', NULL, '0000-00-00', NULL, NULL, '07:30:00', NULL, NULL, NULL, NULL, NULL),
(59, '', 'OMGraduation!', NULL, '0000-00-00', NULL, NULL, '09:30:00', NULL, NULL, NULL, NULL, NULL),
(60, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '0000-00-00', NULL, NULL, '12:00:00', NULL, NULL, NULL, NULL, NULL),
(61, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, NULL, '12:30:00', NULL, NULL, NULL, NULL, NULL),
(62, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '0000-00-00', NULL, NULL, '01:00:00', NULL, NULL, NULL, NULL, NULL),
(63, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, NULL, '01:00:00', NULL, NULL, NULL, NULL, NULL),
(64, '', 'Collide Percussion Concert', NULL, '0000-00-00', NULL, NULL, '02:30:00', NULL, NULL, NULL, NULL, NULL),
(65, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, NULL, '03:00:00', NULL, NULL, NULL, NULL, NULL),
(66, '', 'UCF Chamber Ensembles Concert', NULL, '0000-00-00', NULL, NULL, '04:00:00', NULL, NULL, NULL, NULL, NULL),
(67, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, NULL, '04:00:00', NULL, NULL, NULL, NULL, NULL),
(68, '', 'Theatre UCF Showcase', NULL, '0000-00-00', NULL, NULL, '06:00:00', NULL, NULL, NULL, NULL, NULL),
(69, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret S', NULL, '0000-00-00', NULL, NULL, '08:00:00', NULL, NULL, NULL, NULL, NULL),
(70, '', 'UCF Men''s Tennis vs. Memphis', NULL, '0000-00-00', NULL, NULL, '10:00:00', NULL, NULL, NULL, NULL, NULL),
(71, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, NULL, '10:30:00', NULL, NULL, NULL, NULL, NULL),
(72, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '0000-00-00', NULL, 'Join fellow UCF College of Business students, alumni faculty and administration for the Business Alumni Careerfest event. Hear from alumni who have been in your shoes and are now successful!', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(73, '', 'Graduate Student Appreciation Week: International Social wit', NULL, '0000-00-00', NULL, 'Join the International Services Center and Career Services for an International Social with Refreshments. RSVP with Daren Cain at daren.caine@ucf.edu.', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(74, '', 'String Theory Meets Star Trek Voyager - an interview of phys', NULL, '0000-00-00', NULL, 'The UCF iCubed Project presents:Â  "String Theory Meets Star Trek Voyager" -Â an interview of physicist Brian Greene and actress Kate Mulgrew.Â  The event will be hosted by multi-Emmy award winning journalist Tom Johnson.<br><br>A book signing event ', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(75, '', 'Conversation With A Female Organic Farmer, Marketer, and Ent', NULL, '0000-00-00', NULL, 'Come out and discuss what is essential to succeed as a female Organic Farmer, Marketer and Entrepreneur with other female UCF students and Maya Fiallos, the founder and Marketing Director of Maya Papaya Organic Farm. Maya will lead a conversation aro', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(76, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '0000-00-00', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Blue Raiders. Admission is free for everyone.', '02:00:00', NULL, NULL, NULL, NULL, NULL),
(77, '', '"A Day of Gaming" presented by FIEA', NULL, '0000-00-00', NULL, 'The Florida Interactive Entertainment Academy (FIEA) will demonstrate through visual presentation the beginning to end of an interactive development process. To accommodate a continuous flow of guests, FIEA will have narrative walk-throughs of the di', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(78, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '0000-00-00', NULL, 'Registrations for theÂ Knight at theÂ Museum event on Friday, April 10 have closed. If you are interested in still attending, please contact Shaloni Prine at <a target="">shaloni.prine@ucf.edu</a> to see if special arrangements can be made. Thank you', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(79, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '0000-00-00', NULL, 'Blackfish Racing and the body of animal rights campaign will be hosting a free movie screening of Blackfish on April 10th in the College of Sciences Building, room 101. Doors open at 6:30pm, movie at 7pm with vegan snacks and a prize giveaway. After ', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(80, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(81, '', 'Battle Knights III', NULL, '0000-00-00', NULL, 'It is Elements Of Hip Hop''s third annual urban dance competition! We will have 3 vs 3 crew battles, 1 vs 1 bgirl battles, and cypher king and queen. People from all over Florida and even out of state will be competing.Â The event is free and we want ', '07:00:00', NULL, NULL, NULL, NULL, NULL),
(82, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '0000-00-00', NULL, 'Music, science, and film come together in the stunning, multimedia work, <i>Icarus at the Edge of Time</i>, a collaboration by Philip Glass, Brian Greene, David Henry Hwang, and Al+Al.<br>Presented by the Ginsburg Family Foundation<br><br><i>Icarus a', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(83, '', 'Shack N'' Dash Habitat 5k Run', NULL, '0000-00-00', NULL, 'Shack nâ€™ Dash is a 5k run/shack building event hosted by the University of Central Florida Campus Chapter of Habitat for Humanity. The 5k is more than just a race, local vendors and UCF student organizations will compete with each other to build th', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(84, '', 'OMGraduation!', NULL, '0000-00-00', NULL, '<b><i>Are you a senior and<br>still not sure how to write a resume? Do you think getting a root canal sounds<br>more appealing than going to a job interview? Have you always meant to come<br>into Career Services but never was able to fit the time int', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(85, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '0000-00-00', NULL, 'Come out and support your UCF Women''s Tennis team as they take on the Ragin'' Cajuns. Admission is free for everyone.', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(86, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, '<a href="http://arts.cah.ucf.edu/" target="_blank">http://arts.cah.ucf.edu/</a> By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passi', '12:30:00', NULL, NULL, NULL, NULL, NULL),
(87, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '0000-00-00', NULL, 'Come help us promote a great cause! Knight Match is a field day filled with games like football, tug of war, 3 legged races, and a kickball tournament! We will have representatives from <b><i>Be The Match</i></b> to help spread information about beco', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(88, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.Â <ul><li>Alumni Knight Weekend</li></ul>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(89, '', 'Collide Percussion Concert', NULL, '0000-00-00', NULL, 'The UCF Celebrates the Arts event is an annual showcase<br>featuring an interactive exhibition of student artwork in areas of Studio Art,<br>Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web<br>Design, and Film. It utilizes th', '02:30:00', NULL, NULL, NULL, NULL, NULL),
(90, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.<ul><li>Alumni Knight Weekend</li></ul>', '03:00:00', NULL, NULL, NULL, NULL, NULL),
(91, '', 'UCF Chamber Ensembles Concert', NULL, '0000-00-00', NULL, 'The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire ', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(92, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(93, '', 'Theatre UCF Showcase', NULL, '0000-00-00', NULL, 'Theatre UCF students and alumni join together for a collage of musical numbers from past and future UCF productions, presentations of student projects, and scenes by students nominated for Kennedy Center Irene Ryan Acting Awards.<br><br>The UCF Celeb', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(94, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret S', NULL, '0000-00-00', NULL, 'Petruchio<br>and Katherine backstage, Romeo and Juliet on a fire escape, shipwrecked<br>identical twins â€œfalling in love with love.â€<br><br>Itâ€™s<br>hard to imagine the American Songbook without the contributions of such greats<br>as Leonard Ber', '08:00:00', NULL, NULL, NULL, NULL, NULL),
(95, '', 'UCF Men''s Tennis vs. Memphis', NULL, '0000-00-00', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Memphis Tigers. Admission is free for everyone.', '10:00:00', NULL, NULL, NULL, NULL, NULL),
(96, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, 'By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their', '10:30:00', NULL, NULL, NULL, NULL, NULL),
(97, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '0000-00-00', NULL, 'Join fellow UCF College of Business students, alumni faculty and administration for the Business Alumni Careerfest event. Hear from alumni who have been in your shoes and are now successful!', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(98, '', 'Graduate Student Appreciation Week: International Social wit', NULL, '0000-00-00', NULL, 'Join the International Services Center and Career Services for an International Social with Refreshments. RSVP with Daren Cain at daren.caine@ucf.edu.', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(99, '', 'String Theory Meets Star Trek Voyager - an interview of phys', NULL, '0000-00-00', NULL, 'The UCF iCubed Project presents:Â  "String Theory Meets Star Trek Voyager" -Â an interview of physicist Brian Greene and actress Kate Mulgrew.Â  The event will be hosted by multi-Emmy award winning journalist Tom Johnson.<br><br>A book signing event ', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(100, '', 'Conversation With A Female Organic Farmer, Marketer, and Ent', NULL, '0000-00-00', NULL, 'Come out and discuss what is essential to succeed as a female Organic Farmer, Marketer and Entrepreneur with other female UCF students and Maya Fiallos, the founder and Marketing Director of Maya Papaya Organic Farm. Maya will lead a conversation aro', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(101, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '0000-00-00', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Blue Raiders. Admission is free for everyone.', '02:00:00', NULL, NULL, NULL, NULL, NULL),
(102, '', '"A Day of Gaming" presented by FIEA', NULL, '0000-00-00', NULL, 'The Florida Interactive Entertainment Academy (FIEA) will demonstrate through visual presentation the beginning to end of an interactive development process. To accommodate a continuous flow of guests, FIEA will have narrative walk-throughs of the di', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(103, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '0000-00-00', NULL, 'Registrations for theÂ Knight at theÂ Museum event on Friday, April 10 have closed. If you are interested in still attending, please contact Shaloni Prine at <a target="">shaloni.prine@ucf.edu</a> to see if special arrangements can be made. Thank you', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(104, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '0000-00-00', NULL, 'Blackfish Racing and the body of animal rights campaign will be hosting a free movie screening of Blackfish on April 10th in the College of Sciences Building, room 101. Doors open at 6:30pm, movie at 7pm with vegan snacks and a prize giveaway. After ', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(105, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(106, '', 'Battle Knights III', NULL, '0000-00-00', NULL, 'It is Elements Of Hip Hop''s third annual urban dance competition! We will have 3 vs 3 crew battles, 1 vs 1 bgirl battles, and cypher king and queen. People from all over Florida and even out of state will be competing.Â The event is free and we want ', '07:00:00', NULL, NULL, NULL, NULL, NULL),
(107, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '0000-00-00', NULL, 'Music, science, and film come together in the stunning, multimedia work, <i>Icarus at the Edge of Time</i>, a collaboration by Philip Glass, Brian Greene, David Henry Hwang, and Al+Al.<br>Presented by the Ginsburg Family Foundation<br><br><i>Icarus a', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(108, '', 'Shack N'' Dash Habitat 5k Run', NULL, '0000-00-00', NULL, 'Shack nâ€™ Dash is a 5k run/shack building event hosted by the University of Central Florida Campus Chapter of Habitat for Humanity. The 5k is more than just a race, local vendors and UCF student organizations will compete with each other to build th', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(109, '', 'OMGraduation!', NULL, '0000-00-00', NULL, '<b><i>Are you a senior and<br>still not sure how to write a resume? Do you think getting a root canal sounds<br>more appealing than going to a job interview? Have you always meant to come<br>into Career Services but never was able to fit the time int', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(110, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '0000-00-00', NULL, 'Come out and support your UCF Women''s Tennis team as they take on the Ragin'' Cajuns. Admission is free for everyone.', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(111, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, '<a href="http://arts.cah.ucf.edu/" target="_blank">http://arts.cah.ucf.edu/</a> By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passi', '12:30:00', NULL, NULL, NULL, NULL, NULL),
(112, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '0000-00-00', NULL, 'Come help us promote a great cause! Knight Match is a field day filled with games like football, tug of war, 3 legged races, and a kickball tournament! We will have representatives from <b><i>Be The Match</i></b> to help spread information about beco', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(113, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.Â <ul><li>Alumni Knight Weekend</li></ul>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(114, '', 'Collide Percussion Concert', NULL, '0000-00-00', NULL, 'The UCF Celebrates the Arts event is an annual showcase<br>featuring an interactive exhibition of student artwork in areas of Studio Art,<br>Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web<br>Design, and Film. It utilizes th', '02:30:00', NULL, NULL, NULL, NULL, NULL),
(115, '', 'UCF Softball vs. Houston', NULL, '0000-00-00', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.<ul><li>Alumni Knight Weekend</li></ul>', '03:00:00', NULL, NULL, NULL, NULL, NULL),
(116, '', 'UCF Chamber Ensembles Concert', NULL, '0000-00-00', NULL, 'The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire ', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(117, '', 'UCF Baseball vs. UCONN', NULL, '0000-00-00', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(118, '', 'Theatre UCF Showcase', NULL, '0000-00-00', NULL, 'Theatre UCF students and alumni join together for a collage of musical numbers from past and future UCF productions, presentations of student projects, and scenes by students nominated for Kennedy Center Irene Ryan Acting Awards.<br><br>The UCF Celeb', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(119, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret S', NULL, '0000-00-00', NULL, 'Petruchio<br>and Katherine backstage, Romeo and Juliet on a fire escape, shipwrecked<br>identical twins â€œfalling in love with love.â€<br><br>Itâ€™s<br>hard to imagine the American Songbook without the contributions of such greats<br>as Leonard Ber', '08:00:00', NULL, NULL, NULL, NULL, NULL),
(120, '', 'UCF Men''s Tennis vs. Memphis', NULL, '0000-00-00', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Memphis Tigers. Admission is free for everyone.', '10:00:00', NULL, NULL, NULL, NULL, NULL),
(121, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '0000-00-00', NULL, 'By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their', '10:30:00', NULL, NULL, NULL, NULL, NULL),
(122, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '2015-04-10', NULL, 'Join fellow UCF College of Business students, alumni faculty and administration for the Business Alumni Careerfest event. Hear from alumni who have been in your shoes and are now successful!', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(123, '', 'Graduate Student Appreciation Week: International Social wit', NULL, '2015-04-10', NULL, 'Join the International Services Center and Career Services for an International Social with Refreshments. RSVP with Daren Cain at daren.caine@ucf.edu.', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(124, '', 'String Theory Meets Star Trek Voyager - an interview of phys', NULL, '2015-04-10', NULL, 'The UCF iCubed Project presents:Â  "String Theory Meets Star Trek Voyager" -Â an interview of physicist Brian Greene and actress Kate Mulgrew.Â  The event will be hosted by multi-Emmy award winning journalist Tom Johnson.<br><br>A book signing event ', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(125, '', 'Conversation With A Female Organic Farmer, Marketer, and Ent', NULL, '2015-04-10', NULL, 'Come out and discuss what is essential to succeed as a female Organic Farmer, Marketer and Entrepreneur with other female UCF students and Maya Fiallos, the founder and Marketing Director of Maya Papaya Organic Farm. Maya will lead a conversation aro', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(126, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '2015-04-10', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Blue Raiders. Admission is free for everyone.', '02:00:00', NULL, NULL, NULL, NULL, NULL),
(127, '', '"A Day of Gaming" presented by FIEA', NULL, '2015-04-10', NULL, 'The Florida Interactive Entertainment Academy (FIEA) will demonstrate through visual presentation the beginning to end of an interactive development process. To accommodate a continuous flow of guests, FIEA will have narrative walk-throughs of the di', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(128, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '2015-04-10', NULL, 'Registrations for theÂ Knight at theÂ Museum event on Friday, April 10 have closed. If you are interested in still attending, please contact Shaloni Prine at <a target="">shaloni.prine@ucf.edu</a> to see if special arrangements can be made. Thank you', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(129, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '2015-04-10', NULL, 'Blackfish Racing and the body of animal rights campaign will be hosting a free movie screening of Blackfish on April 10th in the College of Sciences Building, room 101. Doors open at 6:30pm, movie at 7pm with vegan snacks and a prize giveaway. After ', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(130, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-10', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(131, '', 'Battle Knights III', NULL, '2015-04-10', NULL, 'It is Elements Of Hip Hop''s third annual urban dance competition! We will have 3 vs 3 crew battles, 1 vs 1 bgirl battles, and cypher king and queen. People from all over Florida and even out of state will be competing.Â The event is free and we want ', '07:00:00', NULL, NULL, NULL, NULL, NULL),
(132, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '2015-04-10', NULL, 'Music, science, and film come together in the stunning, multimedia work, <i>Icarus at the Edge of Time</i>, a collaboration by Philip Glass, Brian Greene, David Henry Hwang, and Al+Al.<br>Presented by the Ginsburg Family Foundation<br><br><i>Icarus a', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(133, '', 'Shack N'' Dash Habitat 5k Run', NULL, '2015-04-11', NULL, 'Shack nâ€™ Dash is a 5k run/shack building event hosted by the University of Central Florida Campus Chapter of Habitat for Humanity. The 5k is more than just a race, local vendors and UCF student organizations will compete with each other to build th', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(134, '', 'OMGraduation!', NULL, '2015-04-11', NULL, '<b><i>Are you a senior and<br>still not sure how to write a resume? Do you think getting a root canal sounds<br>more appealing than going to a job interview? Have you always meant to come<br>into Career Services but never was able to fit the time int', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(135, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '2015-04-11', NULL, 'Come out and support your UCF Women''s Tennis team as they take on the Ragin'' Cajuns. Admission is free for everyone.', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(136, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-11', NULL, '<a href="http://arts.cah.ucf.edu/" target="_blank">http://arts.cah.ucf.edu/</a> By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passi', '12:30:00', NULL, NULL, NULL, NULL, NULL),
(137, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '2015-04-11', NULL, 'Come help us promote a great cause! Knight Match is a field day filled with games like football, tug of war, 3 legged races, and a kickball tournament! We will have representatives from <b><i>Be The Match</i></b> to help spread information about beco', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(138, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.Â <ul><li>Alumni Knight Weekend</li></ul>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(139, '', 'Collide Percussion Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase<br>featuring an interactive exhibition of student artwork in areas of Studio Art,<br>Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web<br>Design, and Film. It utilizes th', '02:30:00', NULL, NULL, NULL, NULL, NULL),
(140, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.<ul><li>Alumni Knight Weekend</li></ul>', '03:00:00', NULL, NULL, NULL, NULL, NULL),
(141, '', 'UCF Chamber Ensembles Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire ', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(142, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-11', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(143, '', 'Theatre UCF Showcase', NULL, '2015-04-11', NULL, 'Theatre UCF students and alumni join together for a collage of musical numbers from past and future UCF productions, presentations of student projects, and scenes by students nominated for Kennedy Center Irene Ryan Acting Awards.<br><br>The UCF Celeb', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(144, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret S', NULL, '2015-04-11', NULL, 'Petruchio<br>and Katherine backstage, Romeo and Juliet on a fire escape, shipwrecked<br>identical twins â€œfalling in love with love.â€<br><br>Itâ€™s<br>hard to imagine the American Songbook without the contributions of such greats<br>as Leonard Ber', '08:00:00', NULL, NULL, NULL, NULL, NULL),
(145, '', 'UCF Men''s Tennis vs. Memphis', NULL, '2015-04-12', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Memphis Tigers. Admission is free for everyone.', '10:00:00', NULL, NULL, NULL, NULL, NULL),
(146, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-12', NULL, 'By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their', '10:30:00', NULL, NULL, NULL, NULL, NULL),
(147, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '2015-04-10', NULL, 'Join fellow UCF College of Business students, alumni faculty and administration for the Business Alumni Careerfest event. Hear from alumni who have been in your shoes and are now successful!', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(148, '', 'Graduate Student Appreciation Week: International Social with ISC', NULL, '2015-04-10', NULL, 'Join the International Services Center and Career Services for an International Social with Refreshments. RSVP with Daren Cain at daren.caine@ucf.edu.', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(149, '', 'String Theory Meets Star Trek Voyager - an interview of physicist Brian Greene and actress Kate Mulgrew', NULL, '2015-04-10', NULL, 'The UCF iCubed Project presents:Â  "String Theory Meets Star Trek Voyager" -Â an interview of physicist Brian Greene and actress Kate Mulgrew.Â  The event will be hosted by multi-Emmy award winning journalist Tom Johnson.<br><br>A book signing event by the speakers will take place immediately after the interview.<br>For more detailes information, contact Costas Efthimiou as costas@physics.ucf.edu', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(150, '', 'Conversation With A Female Organic Farmer, Marketer, and Entrepreneur', NULL, '2015-04-10', NULL, 'Come out and discuss what is essential to succeed as a female Organic Farmer, Marketer and Entrepreneur with other female UCF students and Maya Fiallos, the founder and Marketing Director of Maya Papaya Organic Farm. Maya will lead a conversation around what she''s learned about being a female entrepreneur, marketer and organic farmer founder.Â <br><br>Maya Fiallos is the founder and Marketing Director of Maya Papaya Organic Farms. She has expert experience in Marketing and Entrepreneurship. To learn more about Maya Papaya Organic Farms visit <a href="http://mayapapayaorganic.com/" target="">http://mayapapayaorganic.com/</a>.Â <br>', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(151, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '2015-04-10', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Blue Raiders. Admission is free for everyone.', '02:00:00', NULL, NULL, NULL, NULL, NULL),
(152, '', '"A Day of Gaming" presented by FIEA', NULL, '2015-04-10', NULL, 'The Florida Interactive Entertainment Academy (FIEA) will demonstrate through visual presentation the beginning to end of an interactive development process. To accommodate a continuous flow of guests, FIEA will have narrative walk-throughs of the differing technologies and processes today''s students are mastering. Final products and artwork will be on display showcasing the works of local students and professionals.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br><br>', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(153, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '2015-04-10', NULL, 'Registrations for theÂ Knight at theÂ Museum event on Friday, April 10 have closed. If you are interested in still attending, please contact Shaloni Prine at <a target="">shaloni.prine@ucf.edu</a> to see if special arrangements can be made. Thank you. <br><br>Join UCF alumni and friends from the UCF College of Sciences Alumni Chapter and the Boston UCF Alumni Club for a once-in-a-lifetime experience in Bean Town.Â  For $10 per person*, guests will have the opportunity to view the Museum of Science''s current exhibit,Â Maya: Hidden Worlds Revealed, with a tour led by UCF professors and ancient Maya experts, Arlen and Diane Chase. Arlen and Diane consulted on the exhibit and continue to lead excavations in Caracol, Belize.Â <br><br>After the tour, guests will take a short walk to the second stop, Restaurant Dante (located in Royal Sonesta Hotel), to enjoy appetizers and a drink ticket. Black and gold business attire is suggested.Â Advanced registration is required by March 27Â atÂ <u><a href="https://www.ucfknightsnetwork.com/maya" target="">https://www.ucfknightsnetwork.com/maya</a>.</u>Alumni Chapter and the Boston UCF Alumni Club for a once-in-a-lifetime experience in Bean Town.Â <br><br><br><b>Special guests include</b><b><i>Â </i></b><b><a href="http://www.cos.ucf.edu/people/johnson-michael-d/" target="_blank">Dr. Michael Johnson</a>, dean of the UCF College<br>of Sciences,</b><b><i>Â </i></b><b><a href="http://www.cos.ucf.edu/people/chase-arlen-f/" target="_blank">Dr. Arlen Chase</a>, associate dean of the UCF<br>College of Sciences and a Pegasus Professor in the UCF Department of<br>Anthropology, and<a href="http://anthropology.cos.ucf.edu/people/chase-diane-z/" target="_blank">Dr. Diane Chase</a>, UCF''s<br>executive vice provost and Pegasus Professor.</b><br><br><br><br><i>Maya: Hidden Worlds<br>RevealedÂ </i>is the largest exhibition of its kind in the<br>United States. The exhibit invites you to uncover the rise and decline of this<br>majestic civilization â€” including its social, natural and spiritual realms â€”<br>through never-before-seen artifacts, hands-on activities, multimedia components<br>and re-created environments. You can experience a cross-section of Maya life,<br>from divine kings to the artisans and laborers who formed the backbone of their<br>society, as well as learn how the Maya people and their culture endure to this<br>day. To learn more, please visitÂ <a href="http://www.mos.org/exhibits/maya" target="_blank">http://www.mos.org/exhibits/maya</a>.Â  Â  <i>*Please let us know if you are a member of the Museum of Science<br>in Boston, as special arrangements will need to be made.</i> <br>', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(154, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '2015-04-10', NULL, 'Blackfish Racing and the body of animal rights campaign will be hosting a free movie screening of Blackfish on April 10th in the College of Sciences Building, room 101. Doors open at 6:30pm, movie at 7pm with vegan snacks and a prize giveaway. After the film, you can ask former SeaWorld trainers from the film any questions you have during the Q&amp;A session. Trainers include Samantha Berg, Kim Ashdown andÂ John Jett. <br>', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(155, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-10', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(156, '', 'Battle Knights III', NULL, '2015-04-10', NULL, 'It is Elements Of Hip Hop''s third annual urban dance competition! We will have 3 vs 3 crew battles, 1 vs 1 bgirl battles, and cypher king and queen. People from all over Florida and even out of state will be competing.Â The event is free and we want the UCF community to come experience a dance jam first hand. Come check it out!', '07:00:00', NULL, NULL, NULL, NULL, NULL),
(157, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '2015-04-10', NULL, 'Music, science, and film come together in the stunning, multimedia work, <i>Icarus at the Edge of Time</i>, a collaboration by Philip Glass, Brian Greene, David Henry Hwang, and Al+Al.<br>Presented by the Ginsburg Family Foundation<br><br><i>Icarus at the Edge of Time</i> is a mesmerizing tale set in outer space about a boy who challenges the awesome might of a black hole. Based on the children''s book by physicist Brian Greene, this futuristic re-imagining of the classic myth takes audiences of all ages on a whirlwind voyage through space and time to the very edge of understanding.<br><br>Featuring an original score by Philip Glass, script adapted by Brian Greene and David Henry Hwang, and film create and directed by Al+Al,<i> Icarus at the Edge of Time</i> has been performed by orchestras around the world and narrated by acclaimed performers, such as John Lithgow, Liev Schreiber, Kal Pen and LeVar Burton.<br><br>At UCF Celebrates the Arts 2015,Â <i>Icarus at the Edge of Time </i>will be narrated by Kate Mulgrew (Star Trek: Voyager; Orange is the New Black) and the score will be performed by the UCF Symphony Orchestra, under the direction of conductor Art Pranno.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br><br>', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(158, '', 'Shack N'' Dash Habitat 5k Run', NULL, '2015-04-11', NULL, 'Shack nâ€™ Dash is a 5k run/shack building event hosted by the University of Central Florida Campus Chapter of Habitat for Humanity. The 5k is more than just a race, local vendors and UCF student organizations will compete with each other to build the ultimate shack out of cardboard, promoting their business or club.<br><a href="https://www.facebook.com/events/331867417002603" target="_blank">https://www.facebook.com/events/331867417002603</a><br><a href="http://www.active.com/orlando-fl/running/races/shack-n-dash-5k-2015" target="">http://www.active.com/orlando-fl/running/races/shack-n-dash-5k-2015</a><br><br><br>', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(159, '', 'OMGraduation!', NULL, '2015-04-11', NULL, '<b><i>Are you a senior and<br>still not sure how to write a resume? Do you think getting a root canal sounds<br>more appealing than going to a job interview? Have you always meant to come<br>into Career Services but never was able to fit the time into your busy schedule?<br>If you find yourself stressed out about any of these questions and more,<br>OMGraduation is for you!</i></b><b>Â </b><br><br><br><br>OMGraduation is a free event hosted by Career Services, which will take place<br>twice on <b>Saturday, April 11th and 18th</b>. You can pick the day that works<br>better for you! The days are broken into two<br>sessions, so you can pick the topics that you would like to come too! Â <br> 9:30-12pm- Resume, Cover<br>Letters, Job Searching, and Networking- To RSVP, <a href="https://omgraduationmorning.eventbrite.com" target="">https://omgraduationmorning.eventbrite.com</a> Â  <br>1:30-4pm- Interviewing and<br>Salary Negotiation- To RSVP, <a href="https://omgraduationafternoon.eventbrite.com" target="">https://omgraduationafternoon.eventbrite.com</a><br><br><br><br>Get all the information you need to know before you graduate in one stop,<br>during a time that is more convenient for your schedule. <br><br><br><br>Space is very limited so please RSVP today! Choose the date and session that<br>works for you.Â  <i>If you planning on coming to both sessions, please RSVP<br>to both!</i> Â  If you have any questions,<br>contact Shauna Strickler at <a target="">shauna.strickler@ucf.edu</a>.', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(160, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '2015-04-11', NULL, 'Come out and support your UCF Women''s Tennis team as they take on the Ragin'' Cajuns. Admission is free for everyone.', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(161, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-11', NULL, '<a href="http://arts.cah.ucf.edu/" target="_blank">http://arts.cah.ucf.edu/</a> By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their actual words that were left behind in diaries, letters,<br>and other writings. The show features songs of the period, such as â€œBattle Hymn<br>of the Republic,â€ â€œAmazing Grace,â€ and â€œSometimes I Feel Like a Motherless<br>Child.â€<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br>', '12:30:00', NULL, NULL, NULL, NULL, NULL),
(162, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '2015-04-11', NULL, 'Come help us promote a great cause! Knight Match is a field day filled with games like football, tug of war, 3 legged races, and a kickball tournament! We will have representatives from <b><i>Be The Match</i></b> to help spread information about becoming a donor and how to do so, those who register to become a donor will get free food! Register your team to be apart of the kickball tournament at bfdcknightmatch@gmail.com.Â Come have a great time with us!<br><br><b><a href="http://www.twitter.com/bfdc_ucf" target="_blank">@BFDC_UCF</a></b>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(163, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.Â <ul><li>Alumni Knight Weekend</li></ul>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(164, '', 'Collide Percussion Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase<br>featuring an interactive exhibition of student artwork in areas of Studio Art,<br>Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web<br>Design, and Film. It utilizes the entire Dr. Phillips Center for Performing<br>Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that<br>demonstrate the artsâ€™ vital role in innovation, fostering creativity. This<br>event will allow UCF to share the products and performances of the arts units,<br>demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s<br>strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '02:30:00', NULL, NULL, NULL, NULL, NULL),
(165, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.<ul><li>Alumni Knight Weekend</li></ul>', '03:00:00', NULL, NULL, NULL, NULL, NULL),
(166, '', 'UCF Chamber Ensembles Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(167, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-11', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(168, '', 'Theatre UCF Showcase', NULL, '2015-04-11', NULL, 'Theatre UCF students and alumni join together for a collage of musical numbers from past and future UCF productions, presentations of student projects, and scenes by students nominated for Kennedy Center Irene Ryan Acting Awards.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '06:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `event` (`eid`, `owner`, `name`, `rating`, `date`, `approval`, `description`, `time`, `aid`, `contact_phone`, `contact_email`, `ecid`, `evid`) VALUES
(169, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret Singers perform with the Flying Horse Big Band', NULL, '2015-04-11', NULL, 'Petruchio<br>and Katherine backstage, Romeo and Juliet on a fire escape, shipwrecked<br>identical twins â€œfalling in love with love.â€<br><br>Itâ€™s<br>hard to imagine the American Songbook without the contributions of such greats<br>as Leonard Bernstein, Stephen Sondheim, Duke Ellington, Cole Porter, Rogers and<br>Hart, and...William Shakespeare? Â  Join us<br>as we celebrate the immortal Bard and his impact on the American musical<br>landscape in this world-premiere revue featuring some of your favorite songs<br>from <i>West Side Story; Kiss Me, Kate;</i> and <i>The Boys from Syracuse;</i> along<br>with popular big band tunes from UCFâ€™s Flying Horse Big Band, original<br>compositions and arrangements of Shakespeare lyrics and sonnets, and so much<br>more! Song, dance, and poetry await you in this bewitching musical evening.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '08:00:00', NULL, NULL, NULL, NULL, NULL),
(170, '', 'UCF Men''s Tennis vs. Memphis', NULL, '2015-04-12', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Memphis Tigers. Admission is free for everyone.', '10:00:00', NULL, NULL, NULL, NULL, NULL),
(171, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-12', NULL, 'By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their actual words that were left behind in diaries, letters,<br>and other writings. The show features songs of the period, such as â€œBattle Hymn<br>of the Republic,â€ â€œAmazing Grace,â€ and â€œSometimes I Feel Like a Motherless<br>Child.â€ Â  Actors bring the characters to life and join<br>with a stirringÂ <br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '10:30:00', NULL, NULL, NULL, NULL, NULL),
(172, '', 'Careerfest Business Alumni Panels (alumni & students)', NULL, '2015-04-10', NULL, 'Join fellow UCF College of Business students, alumni faculty and administration for the Business Alumni Careerfest event. Hear from alumni who have been in your shoes and are now successful!', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(173, '', 'Graduate Student Appreciation Week: International Social with ISC', NULL, '2015-04-10', NULL, 'Join the International Services Center and Career Services for an International Social with Refreshments. RSVP with Daren Cain at daren.caine@ucf.edu.', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(174, '', 'String Theory Meets Star Trek Voyager - an interview of physicist Brian Greene and actress Kate Mulgrew', NULL, '2015-04-10', NULL, 'The UCF iCubed Project presents:Â  "String Theory Meets Star Trek Voyager" -Â an interview of physicist Brian Greene and actress Kate Mulgrew.Â  The event will be hosted by multi-Emmy award winning journalist Tom Johnson.<br><br>A book signing event by the speakers will take place immediately after the interview.<br>For more detailes information, contact Costas Efthimiou as costas@physics.ucf.edu', '11:00:00', NULL, NULL, NULL, NULL, NULL),
(175, '', 'Conversation With A Female Organic Farmer, Marketer, and Entrepreneur', NULL, '2015-04-10', NULL, 'Come out and discuss what is essential to succeed as a female Organic Farmer, Marketer and Entrepreneur with other female UCF students and Maya Fiallos, the founder and Marketing Director of Maya Papaya Organic Farm. Maya will lead a conversation around what she''s learned about being a female entrepreneur, marketer and organic farmer founder.Â <br><br>Maya Fiallos is the founder and Marketing Director of Maya Papaya Organic Farms. She has expert experience in Marketing and Entrepreneurship. To learn more about Maya Papaya Organic Farms visit <a href="http://mayapapayaorganic.com/" target="">http://mayapapayaorganic.com/</a>.Â <br>', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(176, '', 'UCF Men''s Tennis vs. Middle Tennessee State', NULL, '2015-04-10', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Blue Raiders. Admission is free for everyone.', '02:00:00', NULL, NULL, NULL, NULL, NULL),
(177, '', '"A Day of Gaming" presented by FIEA', NULL, '2015-04-10', NULL, 'The Florida Interactive Entertainment Academy (FIEA) will demonstrate through visual presentation the beginning to end of an interactive development process. To accommodate a continuous flow of guests, FIEA will have narrative walk-throughs of the differing technologies and processes today''s students are mastering. Final products and artwork will be on display showcasing the works of local students and professionals.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br><br>', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(178, '', 'UCF Alumni: A Knight at the Museum in Boston', NULL, '2015-04-10', NULL, 'Registrations for theÂ Knight at theÂ Museum event on Friday, April 10 have closed. If you are interested in still attending, please contact Shaloni Prine at <a target="">shaloni.prine@ucf.edu</a> to see if special arrangements can be made. Thank you. <br><br>Join UCF alumni and friends from the UCF College of Sciences Alumni Chapter and the Boston UCF Alumni Club for a once-in-a-lifetime experience in Bean Town.Â  For $10 per person*, guests will have the opportunity to view the Museum of Science''s current exhibit,Â Maya: Hidden Worlds Revealed, with a tour led by UCF professors and ancient Maya experts, Arlen and Diane Chase. Arlen and Diane consulted on the exhibit and continue to lead excavations in Caracol, Belize.Â <br><br>After the tour, guests will take a short walk to the second stop, Restaurant Dante (located in Royal Sonesta Hotel), to enjoy appetizers and a drink ticket. Black and gold business attire is suggested.Â Advanced registration is required by March 27Â atÂ <u><a href="https://www.ucfknightsnetwork.com/maya" target="">https://www.ucfknightsnetwork.com/maya</a>.</u>Alumni Chapter and the Boston UCF Alumni Club for a once-in-a-lifetime experience in Bean Town.Â <br><br><br><b>Special guests include</b><b><i>Â </i></b><b><a href="http://www.cos.ucf.edu/people/johnson-michael-d/" target="_blank">Dr. Michael Johnson</a>, dean of the UCF College<br>of Sciences,</b><b><i>Â </i></b><b><a href="http://www.cos.ucf.edu/people/chase-arlen-f/" target="_blank">Dr. Arlen Chase</a>, associate dean of the UCF<br>College of Sciences and a Pegasus Professor in the UCF Department of<br>Anthropology, and<a href="http://anthropology.cos.ucf.edu/people/chase-diane-z/" target="_blank">Dr. Diane Chase</a>, UCF''s<br>executive vice provost and Pegasus Professor.</b><br><br><br><br><i>Maya: Hidden Worlds<br>RevealedÂ </i>is the largest exhibition of its kind in the<br>United States. The exhibit invites you to uncover the rise and decline of this<br>majestic civilization â€” including its social, natural and spiritual realms â€”<br>through never-before-seen artifacts, hands-on activities, multimedia components<br>and re-created environments. You can experience a cross-section of Maya life,<br>from divine kings to the artisans and laborers who formed the backbone of their<br>society, as well as learn how the Maya people and their culture endure to this<br>day. To learn more, please visitÂ <a href="http://www.mos.org/exhibits/maya" target="_blank">http://www.mos.org/exhibits/maya</a>.Â  Â  <i>*Please let us know if you are a member of the Museum of Science<br>in Boston, as special arrangements will need to be made.</i> <br>', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(179, '', 'Free Blackfish Screening: Q&A with Former SeaWorld Trainers', NULL, '2015-04-10', NULL, 'Blackfish Racing and the body of animal rights campaign will be hosting a free movie screening of Blackfish on April 10th in the College of Sciences Building, room 101. Doors open at 6:30pm, movie at 7pm with vegan snacks and a prize giveaway. After the film, you can ask former SeaWorld trainers from the film any questions you have during the Q&amp;A session. Trainers include Samantha Berg, Kim Ashdown andÂ John Jett. <br>', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(180, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-10', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '06:30:00', NULL, NULL, NULL, NULL, NULL),
(181, '', 'Battle Knights III', NULL, '2015-04-10', NULL, 'It is Elements Of Hip Hop''s third annual urban dance competition! We will have 3 vs 3 crew battles, 1 vs 1 bgirl battles, and cypher king and queen. People from all over Florida and even out of state will be competing.Â The event is free and we want the UCF community to come experience a dance jam first hand. Come check it out!', '07:00:00', NULL, NULL, NULL, NULL, NULL),
(182, '', 'Icarus at the Edge of Time with UCF Symphony & Kate Mulgrew', NULL, '2015-04-10', NULL, 'Music, science, and film come together in the stunning, multimedia work, <i>Icarus at the Edge of Time</i>, a collaboration by Philip Glass, Brian Greene, David Henry Hwang, and Al+Al.<br>Presented by the Ginsburg Family Foundation<br><br><i>Icarus at the Edge of Time</i> is a mesmerizing tale set in outer space about a boy who challenges the awesome might of a black hole. Based on the children''s book by physicist Brian Greene, this futuristic re-imagining of the classic myth takes audiences of all ages on a whirlwind voyage through space and time to the very edge of understanding.<br><br>Featuring an original score by Philip Glass, script adapted by Brian Greene and David Henry Hwang, and film create and directed by Al+Al,<i> Icarus at the Edge of Time</i> has been performed by orchestras around the world and narrated by acclaimed performers, such as John Lithgow, Liev Schreiber, Kal Pen and LeVar Burton.<br><br>At UCF Celebrates the Arts 2015,Â <i>Icarus at the Edge of Time </i>will be narrated by Kate Mulgrew (Star Trek: Voyager; Orange is the New Black) and the score will be performed by the UCF Symphony Orchestra, under the direction of conductor Art Pranno.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br><br>', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(183, '', 'Shack N'' Dash Habitat 5k Run', NULL, '2015-04-11', NULL, 'Shack nâ€™ Dash is a 5k run/shack building event hosted by the University of Central Florida Campus Chapter of Habitat for Humanity. The 5k is more than just a race, local vendors and UCF student organizations will compete with each other to build the ultimate shack out of cardboard, promoting their business or club.<br><a href="https://www.facebook.com/events/331867417002603" target="_blank">https://www.facebook.com/events/331867417002603</a><br><a href="http://www.active.com/orlando-fl/running/races/shack-n-dash-5k-2015" target="">http://www.active.com/orlando-fl/running/races/shack-n-dash-5k-2015</a><br><br><br>', '07:30:00', NULL, NULL, NULL, NULL, NULL),
(184, '', 'OMGraduation!', NULL, '2015-04-11', NULL, '<b><i>Are you a senior and<br>still not sure how to write a resume? Do you think getting a root canal sounds<br>more appealing than going to a job interview? Have you always meant to come<br>into Career Services but never was able to fit the time into your busy schedule?<br>If you find yourself stressed out about any of these questions and more,<br>OMGraduation is for you!</i></b><b>Â </b><br><br><br><br>OMGraduation is a free event hosted by Career Services, which will take place<br>twice on <b>Saturday, April 11th and 18th</b>. You can pick the day that works<br>better for you! The days are broken into two<br>sessions, so you can pick the topics that you would like to come too! Â <br> 9:30-12pm- Resume, Cover<br>Letters, Job Searching, and Networking- To RSVP, <a href="https://omgraduationmorning.eventbrite.com" target="">https://omgraduationmorning.eventbrite.com</a> Â  <br>1:30-4pm- Interviewing and<br>Salary Negotiation- To RSVP, <a href="https://omgraduationafternoon.eventbrite.com" target="">https://omgraduationafternoon.eventbrite.com</a><br><br><br><br>Get all the information you need to know before you graduate in one stop,<br>during a time that is more convenient for your schedule. <br><br><br><br>Space is very limited so please RSVP today! Choose the date and session that<br>works for you.Â  <i>If you planning on coming to both sessions, please RSVP<br>to both!</i> Â  If you have any questions,<br>contact Shauna Strickler at <a target="">shauna.strickler@ucf.edu</a>.', '09:30:00', NULL, NULL, NULL, NULL, NULL),
(185, '', 'UCF Women''s Tennis vs. Louisiana- Lafayette', NULL, '2015-04-11', NULL, 'Come out and support your UCF Women''s Tennis team as they take on the Ragin'' Cajuns. Admission is free for everyone.', '12:00:00', NULL, NULL, NULL, NULL, NULL),
(186, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-11', NULL, '<a href="http://arts.cah.ucf.edu/" target="_blank">http://arts.cah.ucf.edu/</a> By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their actual words that were left behind in diaries, letters,<br>and other writings. The show features songs of the period, such as â€œBattle Hymn<br>of the Republic,â€ â€œAmazing Grace,â€ and â€œSometimes I Feel Like a Motherless<br>Child.â€<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a><br>', '12:30:00', NULL, NULL, NULL, NULL, NULL),
(187, '', 'Knight Match 2015: Bone Marrow Awareness Field Day', NULL, '2015-04-11', NULL, 'Come help us promote a great cause! Knight Match is a field day filled with games like football, tug of war, 3 legged races, and a kickball tournament! We will have representatives from <b><i>Be The Match</i></b> to help spread information about becoming a donor and how to do so, those who register to become a donor will get free food! Register your team to be apart of the kickball tournament at bfdcknightmatch@gmail.com.Â Come have a great time with us!<br><br><b><a href="http://www.twitter.com/bfdc_ucf" target="_blank">@BFDC_UCF</a></b>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(188, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.Â <ul><li>Alumni Knight Weekend</li></ul>', '01:00:00', NULL, NULL, NULL, NULL, NULL),
(189, '', 'Collide Percussion Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase<br>featuring an interactive exhibition of student artwork in areas of Studio Art,<br>Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web<br>Design, and Film. It utilizes the entire Dr. Phillips Center for Performing<br>Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that<br>demonstrate the artsâ€™ vital role in innovation, fostering creativity. This<br>event will allow UCF to share the products and performances of the arts units,<br>demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s<br>strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '02:30:00', NULL, NULL, NULL, NULL, NULL),
(190, '', 'UCF Softball vs. Houston', NULL, '2015-04-11', NULL, 'Come out and support your Lady Knights as they take on the Houston Cougars. Admission is free to students with Student ID.<ul><li>Alumni Knight Weekend</li></ul>', '03:00:00', NULL, NULL, NULL, NULL, NULL),
(191, '', 'UCF Chamber Ensembles Concert', NULL, '2015-04-11', NULL, 'The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(192, '', 'UCF Baseball vs. UCONN', NULL, '2015-04-11', NULL, 'Come out and support your UCF Baseball team as they take on the UCONN Huskies. Admission is free to students with Student ID.', '04:00:00', NULL, NULL, NULL, NULL, NULL),
(193, '', 'Theatre UCF Showcase', NULL, '2015-04-11', NULL, 'Theatre UCF students and alumni join together for a collage of musical numbers from past and future UCF productions, presentations of student projects, and scenes by students nominated for Kennedy Center Irene Ryan Acting Awards.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '06:00:00', NULL, NULL, NULL, NULL, NULL),
(194, '', '"Shakespeare Swings!": Orlando Shakespeare Theater Cabaret Singers perform with the Flying Horse Big Band', NULL, '2015-04-11', NULL, 'Petruchio<br>and Katherine backstage, Romeo and Juliet on a fire escape, shipwrecked<br>identical twins â€œfalling in love with love.â€<br><br>Itâ€™s<br>hard to imagine the American Songbook without the contributions of such greats<br>as Leonard Bernstein, Stephen Sondheim, Duke Ellington, Cole Porter, Rogers and<br>Hart, and...William Shakespeare? Â  Join us<br>as we celebrate the immortal Bard and his impact on the American musical<br>landscape in this world-premiere revue featuring some of your favorite songs<br>from <i>West Side Story; Kiss Me, Kate;</i> and <i>The Boys from Syracuse;</i> along<br>with popular big band tunes from UCFâ€™s Flying Horse Big Band, original<br>compositions and arrangements of Shakespeare lyrics and sonnets, and so much<br>more! Song, dance, and poetry await you in this bewitching musical evening.<br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '08:00:00', NULL, NULL, NULL, NULL, NULL),
(195, '', 'UCF Men''s Tennis vs. Memphis', NULL, '2015-04-12', NULL, 'Come out and support your UCF Men''s Tennis team as they take on the Memphis Tigers. Admission is free for everyone.', '10:00:00', NULL, '', '', 1, 1),
(196, '', 'Orlando REP & UCF Choirs perform Civil War Voices', NULL, '2015-04-12', NULL, 'By James<br>R. Harris | Original Musical Arrangements by Mark Hayes<br>Best<br>suited for 6th grade and up<br><i>Civil<br>War Voices</i> tells<br>the compelling and passionate true stories of individuals who lived through the<br>conflict, using their actual words that were left behind in diaries, letters,<br>and other writings. The show features songs of the period, such as â€œBattle Hymn<br>of the Republic,â€ â€œAmazing Grace,â€ and â€œSometimes I Feel Like a Motherless<br>Child.â€ Â  Actors bring the characters to life and join<br>with a stirringÂ <br><br>The UCF Celebrates the Arts event is an annual showcase featuring an interactive exhibition of student artwork in areas of Studio Art, Music, Theatre, Dance, Digital Media, Gaming, Animation, Photography, Web Design, and Film. It utilizes the entire Dr. Phillips Center for Performing Arts facility, including the adjacent CNL Plaza. Each year there are several projects in our community that demonstrate the artsâ€™ vital role in innovation, fostering creativity. This event will allow UCF to share the products and performances of the arts units, demonstrate the universityâ€™s commitment to partnerships, and illustrates UCFâ€™s strong positive impact in the Central Florida Region and beyond.<br><br>Reserve your free ticket online atÂ <a href="http://arts.cah.ucf.edu/" target="">http://arts.cah.ucf.edu/</a>', '10:30:00', NULL, NULL, NULL, NULL, NULL),
(197, 'm', 'Event with good map location', NULL, '2015-04-13', NULL, 'Event with a proper address for map', '07:30:00', 24, 'nophone', 'noemail', 1, 1),
(198, 'm', 'eventevents', NULL, '1984-11-04', NULL, NULL, '12:01:00', 1, 'nono', 'nononono', 1, 1),
(199, 'm', 'eventeventevent', NULL, '0012-05-15', NULL, NULL, '17:00:00', 0, 'no', 'nono', 1, 1),
(200, 'm', 'eventeventevent5682333333333333333', NULL, '2031-01-01', NULL, NULL, '03:00:00', 26, 'no', 'no', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE IF NOT EXISTS `event_category` (
`ecid` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL
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
  `type` varchar(100) DEFAULT NULL
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
-- Table structure for table `event_voters`
--

CREATE TABLE IF NOT EXISTS `event_voters` (
  `email` varchar(255) NOT NULL DEFAULT '',
  `eid` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_voters`
--

INSERT INTO `event_voters` (`email`, `eid`, `vote`) VALUES
('m', 194, 2),
('s', 194, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
`mid` int(11) NOT NULL,
  `sent` date DEFAULT NULL,
  `opened` date DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`mid`, `sent`, `opened`, `subject`, `message`) VALUES
(1, '2015-04-09', NULL, 'mmm', 'masedlfkajsdlfl'),
(5, '2015-04-09', NULL, 'Re: mmm', '_______________\r\nSent on: 2015-04-09\r\nFrom: m\r\nTo: m\r\nSubject: mmm\r\n\r\nmasedlfkajsdlfl'),
(6, '2015-04-09', NULL, 'test 2', 'new message test 2\r\n\r\n\r\n<?php echo ''1111'' ?>'),
(7, '2015-04-09', NULL, 'Re: test 2', '_______________\r\nSent on: 2015-04-09\r\nFrom: m\r\nTo: u1@knights.ucf.edu\r\nSubject: test 2\r\n\r\nnew message test 2\r\n\r\n\r\n<?php echo ''1111''; ?>'),
(8, '2015-04-10', NULL, 'sendingmessage', 'adf;aklsdfn;klasd fkl;ads k;fdfsfdsf\r\nsdaf;lkad sf\r\nsdjnfklasd f\r\nasdffkljsd'),
(9, '2015-04-12', NULL, 'Invitation to group created 1', ''),
(10, '2015-04-12', NULL, 'Invitation to group created 1', ''),
(11, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page=6&join=2>Join the group</a>'),
(12, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page=6&join=2>Join the group</a>'),
(13, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page=6&join=2>Join the group</a>'),
(14, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page=6&join=2>Join the group</a>'),
(15, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page=6&join=2">Join the group</a>'),
(16, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page.php?rso=6&join=2">Join the group</a>'),
(17, '2015-04-12', NULL, 'Invitation to group created 1', 'You have been invited to the group "group created 1" follow the link to join this group\n\n<a href="rso_page.php?rso=6&join=2">Join the group</a>'),
(18, '2015-04-15', NULL, 'Invitation to 415123', 'You have been invited to the group "415123" follow the link to join this group\n\n<a href="rso_page.php?rso=7&join=2">Join the group</a>');

-- --------------------------------------------------------

--
-- Table structure for table `mail_list`
--

CREATE TABLE IF NOT EXISTS `mail_list` (
  `mid` int(11) NOT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail_list`
--

INSERT INTO `mail_list` (`mid`, `to_user`, `from_user`) VALUES
(1, 'm', 'm'),
(5, 'm', 'm'),
(6, 'u1@knights.ucf.edu', 'm'),
(7, 'm', 'u1@knights.ucf.edu'),
(8, 'u5@knights.ucf.edu', 'u5@knights.ucf.edu'),
(10, 'u11@knights.ucf.edu', 'm'),
(11, 'u9@knights.ucf.edu', 'm'),
(14, 'a@knights.ucf.edu', 'm'),
(15, 'a@knights.ucf.edu', 'm'),
(16, 'a@knights.ucf.edu', 'm'),
(17, 'u1@knights.ucf.edu', 'm'),
(18, 's', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `rso`
--

CREATE TABLE IF NOT EXISTS `rso` (
`rid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `joinable` bit(1) NOT NULL,
  `rtid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso`
--

INSERT INTO `rso` (`rid`, `name`, `description`, `joinable`, `rtid`) VALUES
(0, '', '', b'0', 1),
(1, 'rs', '32', b'0', 4),
(2, 'RSO 2', '', b'0', 2),
(3, 'RSO 3', '', b'0', 2),
(4, 'RSO 4', '', b'0', 2),
(6, 'group created 1', NULL, b'1', 3),
(7, '415123', '32151651532', b'0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rso_event_list`
--

CREATE TABLE IF NOT EXISTS `rso_event_list` (
  `rid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso_event_list`
--

INSERT INTO `rso_event_list` (`rid`, `eid`) VALUES
(6, 12),
(6, 197),
(7, 198),
(7, 199),
(7, 200);

-- --------------------------------------------------------

--
-- Table structure for table `rso_member_list`
--

CREATE TABLE IF NOT EXISTS `rso_member_list` (
  `rid` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `admin` bit(1) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rso_member_list`
--

INSERT INTO `rso_member_list` (`rid`, `email`, `admin`, `created`) VALUES
(1, 'meeeee', b'0', '0000-00-00 00:00:00'),
(1, 'u1@knights.ucf.edu', b'0', '2015-04-12 11:41:07'),
(1, 'u2@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(1, 'u3@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(1, 'u5@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(2, 'u11@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(2, 'u12@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(2, 'u1@knights.ucf.edu', b'0', '2015-04-12 11:41:07'),
(2, 'u2@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(2, 'u4@knights.ucf.edu', b'1', '0000-00-00 00:00:00'),
(2, 'u6@knights.ucf.edu', b'0', '0000-00-00 00:00:00'),
(3, 'u6@knights.ucf.edu', b'1', '0000-00-00 00:00:00'),
(4, 'u1@knights.ucf.edu', b'0', '2015-04-12 11:41:07'),
(6, 'a@knights.ucf.edu', b'0', '2015-04-12 11:38:34'),
(6, 'm', b'0', '2015-04-15 15:02:43'),
(6, 'u11@knights.ucf.edu', NULL, '0000-00-00 00:00:00'),
(6, 'u1@knights.ucf.edu', b'1', '2015-04-12 11:41:07'),
(6, 'u9@knights.ucf.edu', NULL, '0000-00-00 00:00:00'),
(7, 'm', b'1', '2015-04-15 15:02:43'),
(7, 's', b'0', '2015-04-15 13:24:48');

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
  `name` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `domain` varchar(255) NOT NULL,
  `rss` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`uid`, `name`, `aid`, `description`, `domain`, `rss`) VALUES
(0, NULL, 0, NULL, '', ''),
(1, 'University of Central Florida', 1, 'dafadsfds', 'ucf.edu', 'http://events.ucf.edu/upcoming/feed.rss'),
(2, 'Valencia Community College', 2, 'dafadsfds', 'valenciacollege.edu', ''),
(3, 'University of Mark', 15, 'dafadsfds', '63030540932509', ''),
(4, 'University of 55', 16, 'dafadsfds', '63030540932509', ''),
(5, 'dfggsfdgsf', 17, 'afdfasdfasdfasdfasd', 'sadfdsfa.edu', ''),
(6, 'ununi', 25, 'uniuniuni', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `university_event_list`
--

CREATE TABLE IF NOT EXISTS `university_event_list` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university_event_list`
--

INSERT INTO `university_event_list` (`uid`, `eid`) VALUES
(5, 17),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(1, 197),
(2, 197);

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
(1, 'b@knights.ucf.edu', b'0'),
(1, 'new@knights.ucf.edu', b'0'),
(1, 'newnew@knights.ucf.edu', b'0'),
(1, 'newnewnew@knights.ucf.edu', b'0'),
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
(2, 'c@valenciacollege.edu', b'0'),
(2, 's', b'1'),
(6, 'm', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `university_rso_link`
--

CREATE TABLE IF NOT EXISTS `university_rso_link` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university_rso_link`
--

INSERT INTO `university_rso_link` (`uid`, `rid`) VALUES
(1, 1),
(6, 1),
(6, 2),
(2, 3),
(5, 3),
(6, 3),
(6, 4),
(1, 6),
(2, 6),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `userlist`
--

CREATE TABLE IF NOT EXISTS `userlist` (
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `phone_number` varchar(12) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlist`
--

INSERT INTO `userlist` (`first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
('a', 'a', 'a@knights.ucf.edu', 'aaa', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('b', 'b', 'b@knights.ucf.edu', 'bbb', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('c', 'c', 'c@valenciacollege.edu', 'ccc', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('d', 'd', 'd@do.com', 'ddd', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('d', 'd', 'd@knights.ucf.edu', '33', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('d', 'd', 'e@knights.ucf.edu', '33', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('k', 'k', 'k@knights.ucf.edu', 'kkk', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('l', 'l', 'l@knights.ucf.edu', 'lll', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('m', 'm', 'm', 'm', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('me', 'me', 'meeeee', 'me', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('mrrm', 'rrmrr', 'mrm@knights.ucf.edu', '22299220000', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('new', 'account', 'new@knights.ucf.edu', 'nonono', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('newnew', 'account', 'newnew@knights.ucf.edu', 'nonono', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('newnewnew', 'account', 'newnewnew@knights.ucf.edu', 'nonono', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('s', 's', 's', 's', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 10', 'u10', 'u10@knights.ucf.edu', '4070000010', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 11', 'u11', 'u11@knights.ucf.edu', '4070000011', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 12', 'u12', 'u12@knights.ucf.edu', '4070000012', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 1', 'u1', 'u1@knights.ucf.edu', '4070000001', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 2', 'u2', 'u2@knights.ucf.edu', '4070000002', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 3', 'u3', 'u3@knights.ucf.edu', '4070000003', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 4', 'u4', 'u4@knights.ucf.edu', '4070000004', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 5', 'u5', 'u5@knights.ucf.edu', '4070000005', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 6', 'u6', 'u6@knights.ucf.edu', '4070000006', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 7', 'u7', 'u7@knights.ucf.edu', '4070000007', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 8', 'u8', 'u8@knights.ucf.edu', '4070000008', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai'),
('user 9', 'u9', 'u9@knights.ucf.edu', '4070000009', '$2a$10$lEsbfsNkwSZfzYfU46ELzu3WM/HyVi7Q5niQBhfqzr8OahoBt8Sai');

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
-- Indexes for table `event_voters`
--
ALTER TABLE `event_voters`
 ADD PRIMARY KEY (`email`,`eid`), ADD KEY `eid` (`eid`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
 ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `mail_list`
--
ALTER TABLE `mail_list`
 ADD PRIMARY KEY (`mid`), ADD KEY `to_user` (`to_user`), ADD KEY `from_user` (`from_user`);

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
-- Indexes for table `university_rso_link`
--
ALTER TABLE `university_rso_link`
 ADD PRIMARY KEY (`uid`,`rid`), ADD KEY `rid` (`rid`);

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
MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=201;
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
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rso`
--
ALTER TABLE `rso`
MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rso_type`
--
ALTER TABLE `rso_type`
MODIFY `rtid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
-- Constraints for table `event_voters`
--
ALTER TABLE `event_voters`
ADD CONSTRAINT `event_voters_ibfk_1` FOREIGN KEY (`email`) REFERENCES `userlist` (`email`),
ADD CONSTRAINT `event_voters_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `event` (`eid`);

--
-- Constraints for table `mail_list`
--
ALTER TABLE `mail_list`
ADD CONSTRAINT `mail_list_ibfk_1` FOREIGN KEY (`to_user`) REFERENCES `userlist` (`email`),
ADD CONSTRAINT `mail_list_ibfk_2` FOREIGN KEY (`from_user`) REFERENCES `userlist` (`email`);

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

--
-- Constraints for table `university_rso_link`
--
ALTER TABLE `university_rso_link`
ADD CONSTRAINT `university_rso_link_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `university` (`uid`),
ADD CONSTRAINT `university_rso_link_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `rso` (`rid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
