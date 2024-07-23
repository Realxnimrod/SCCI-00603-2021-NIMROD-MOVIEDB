-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 10:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviedb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adduser` (`$username` VARCHAR(50), `$firstname` VARCHAR(50), `$lastname` VARCHAR(50))   if not exists(select * from `users` where `username`=$username) then
	insert `users`(`username`,`firstname`,`lastname`)
	VALUES($username,$firstname,$lastname);
end if$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `moviecast`
--

CREATE TABLE `moviecast` (
  `castid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(1000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movielanguages`
--

CREATE TABLE `movielanguages` (
  `id` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(100) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movietitles`
--

CREATE TABLE `movietitles` (
  `movieid` int(11) NOT NULL,
  `movietitle` varchar(60) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `releaseyear` int(11) DEFAULT NULL,
  `rating` decimal(5,2) DEFAULT NULL,
  `synopsis` varchar(50) DEFAULT NULL,
  `dateadded` date DEFAULT NULL,
  `moviestatus` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `addedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movietitles`
--

INSERT INTO `movietitles` (`movieid`, `movietitle`, `director`, `releaseyear`, `rating`, `synopsis`, `dateadded`, `moviestatus`, `deleted`, `addedby`) 
VALUES
       ('The Darkest Minds', 'Jennifer Nelson', 2018, 5.70, 'Teenagers wake up one day with superpowers', '2024-07-10', 'released', 0, 1),
       ('Now You See Me', 'Louis Leterrier', 2013, 7.20, '4 street magicians attract the attention of the FB', '2024-07-10', 'released', 0, NULL),
       ('Oppenheimer', 'Christopher Nolan', 2023, 8.30, 'The story behind the atomic bomb creator', '2024-06-15', 'released', 0, 2),
       ('Inception', 'Christopher Nolan', 2010, 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2024-06-16', 'released', 0, 1),
       ('The Shawshank Redemption', 'Frank Darabont', 1994, 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '2024-06-17', 'released', 0, 1),
       ('Interstellar', 'Christopher Nolan', 2014, 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', '2024-06-18', 'released', 0, 1),
       ('The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 8.7, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '2024-06-20', 'released', 0, 1),
       ('Joker', 'Todd Phillips', 2019, 8.4, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime.', '2024-06-21', 'released', 0, 1),
       ('Her', 'Spike Jonze', 2013, 8.0, 'In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.', '2024-06-22', 'released', 0, 1),
       ('The Grand Budapest Hotel', 'Wes Anderson', 2014, 8.1, 'A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel\'s glorious years under an exceptional concierge.', '2024-06-23', 'released', 0, 1),
       ('Mad Max: Fury Road', 'George Miller', 2015, 8.1, 'In a post-apocalyptic wasteland, Max teams up with a mysterious woman to escape a ruthless warlord and his army in an armored tanker truck.', '2024-06-24', 'released', 0, 1),
       ('A Quiet Place', 'John Krasinski', 2018, 7.5, 'In a post-apocalyptic world, a family is forced to live in silence while hiding from monsters with ultra-sensitive hearing.', '2024-06-25', 'released', 0, 1),
       ('Moonlight', 'Barry Jenkins', 2016, 7.4, 'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.', '2024-06-26', 'released', 0, 1),
       ('Get Out', 'Jordan Peele', 2017, 7.7, 'A young African-American man visits his Caucasian girlfriend\'s mysterious family estate.', '2024-06-27', 'released', 0, 1),
       ('Parasite', 'Bong Joon Ho', 2019, 8.6, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', '2024-06-28', 'released', 0, 1),
       ('La La Land', 'Damien Chazelle', 2016, 8.0, 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', '2024-06-29', 'released', 0, 1),
       ('Whiplash', 'Damien Chazelle', 2014, 8.5, 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', '2024-06-30', 'released', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL,
  `countryname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `alist` tinyint(1) NOT NULL,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `systemadmin` tinyint(1) NOT NULL,
  `accountactive` tinyint(1) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `firstname`, `lastname`, `password`, `salt`, `systemadmin`, `accountactive`, `dateadded`, `addedby`, `mobile`, `email`) VALUES
(1, 'administrator', 'John', 'Doe', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', ''),
(2, 'contact', 'Mary', 'Jane', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', ''),
(3, 'nimrod', 'Nimrod', 'Mutugi', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', ''),
(4, 'jess', 'Jessica', 'Wambui', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', ''),
(5, 'kyle', 'Michael', 'Kyliane', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwmovietitleswithusers`
-- (See below for the actual view)
--
CREATE TABLE `vwmovietitleswithusers` (
`movieid` int(11)
,`movietitle` varchar(60)
,`director` varchar(50)
,`releaseyear` int(11)
,`rating` decimal(5,2)
,`synopsis` varchar(50)
,`dateadded` date
,`moviestatus` varchar(50)
,`deleted` tinyint(1)
,`addedby` int(11)
,`addedbyname` varchar(110)
);

-- --------------------------------------------------------

--
-- Structure for view `vwmovietitleswithusers`
--
DROP TABLE IF EXISTS `vwmovietitleswithusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwmovietitleswithusers`  AS   (select `m`.`movieid` AS `movieid`,`m`.`movietitle` AS `movietitle`,`m`.`director` AS `director`,`m`.`releaseyear` AS `releaseyear`,`m`.`rating` AS `rating`,`m`.`synopsis` AS `synopsis`,`m`.`dateadded` AS `dateadded`,`m`.`moviestatus` AS `moviestatus`,`m`.`deleted` AS `deleted`,`m`.`addedby` AS `addedby`,ifnull(concat(`u`.`firstname`,'',`u`.`lastname`),'<N/A>') AS `addedbyname` from (`movietitles` `m` left join `users` `u` on(`u`.`userid` = `m`.`addedby`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`languageid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD PRIMARY KEY (`castid`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `starid` (`starid`),
  ADD KEY `roleid` (`roleid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieid` (`movieid`),
  ADD KEY `languageid` (`languageid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`);

--
-- Indexes for table `movietitles`
--
ALTER TABLE `movietitles`
  ADD PRIMARY KEY (`movieid`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`countryid`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`),
  ADD KEY `roles_ibfk_1` (`addedby`);

--
-- Indexes for table `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`starid`),
  ADD KEY `addedby` (`addedby`),
  ADD KEY `deletedby` (`deletedby`),
  ADD KEY `stars_ibfk_1` (`nationalityid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `languageid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moviecast`
--
ALTER TABLE `moviecast`
  MODIFY `castid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movielanguages`
--
ALTER TABLE `movielanguages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movietitles`
--
ALTER TABLE `movietitles`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `countryid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stars`
--
ALTER TABLE `stars`
  MODIFY `starid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `moviecast`
--
ALTER TABLE `moviecast`
  ADD CONSTRAINT `moviecast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `moviecast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`),
  ADD CONSTRAINT `moviecast_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`),
  ADD CONSTRAINT `moviecast_ibfk_4` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `moviecast_ibfk_5` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `movielanguages`
--
ALTER TABLE `movielanguages`
  ADD CONSTRAINT `movielanguages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `movielanguages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  ADD CONSTRAINT `movielanguages_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movielanguages_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`);

--
-- Constraints for table `stars`
--
ALTER TABLE `stars`
  ADD CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`countryid`),
  ADD CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
