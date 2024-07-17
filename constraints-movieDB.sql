-- 
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - moviedb
*********************************************************************
--

-- !40101 SET NAMES utf8 --;

-- !40101 SET SQL_MODE=''--;

-- !40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 --;
-- !40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 --;
-- !40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' --;
-- !40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 --;
CREATE DATABASE -- !32312 IF NOT EXISTS--`moviedb` -- !40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci --;

USE `moviedb`;

-- Table structure for table `audittrail` --

DROP TABLE IF EXISTS `audittrail`;

CREATE TABLE `audittrail` (
  `auditid` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `timestamp` time DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `recordid` int(11) DEFAULT NULL,
  `olddata` varchar(50) DEFAULT NULL,
  `newdata` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`auditid`),
  KEY `userid` (`userid`),
  CONSTRAINT `audittrail_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `audittrail` --

-- Table structure for table `directors` --

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `director_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `D.O.B` date DEFAULT NULL,
  `passport_photo` varchar(50) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  KEY `deleted_by` (`deleted_by`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`userid`),
  CONSTRAINT `directors_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`gender` in ('male','female')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `directors` --

-- Table structure for table `genres` --

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genreid` int(11) NOT NULL AUTO_INCREMENT,
  `genrename` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `rated` int(11) DEFAULT NULL,
  PRIMARY KEY (`genreid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `genres_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `genres` --

-- Table structure for table `languages` --

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `languageid` int(11) NOT NULL AUTO_INCREMENT,
  `languagename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `languages` --

-- Table structure for table `movie_cast` --

DROP TABLE IF EXISTS `movie_cast`;

CREATE TABLE `movie_cast` (
  `castid` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `starid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `roledescription` varchar(2000) NOT NULL,
  `castname` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  PRIMARY KEY (`castid`),
  KEY `movieid` (`movieid`),
  KEY `starid` (`starid`),
  KEY `roleid` (`roleid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`starid`) REFERENCES `stars` (`starid`),
  CONSTRAINT `movie_cast_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movie_cast_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`roledescription` in ('lead role','supporting cast','ensemble cast','cameo role','background cast')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in ('yes','no')),
  CONSTRAINT `CONSTRAINT_3` CHECK (`roledescription` in ('lead role','supporting cast','ensemble cast','cameo role','background cast'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movie_cast` --

-- Table structure for table `movie_genres` --

DROP TABLE IF EXISTS `movie_genres`;

CREATE TABLE `movie_genres` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `genreid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `genreid` (`genreid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`),
  CONSTRAINT `movie_genres_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movie_genres_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movie_genres` --

-- Table structure for table `movie_languages` --

DROP TABLE IF EXISTS `movie_languages`;

CREATE TABLE `movie_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `movieid` (`movieid`),
  KEY `languageid` (`languageid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_languages_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movie_languages_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `languages` (`languageid`),
  CONSTRAINT `movie_languages_ibfk_3` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movie_languages_ibfk_4` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movie_languages` --

-- Table structure for table `movie_production_companies` --

DROP TABLE IF EXISTS `movie_production_companies`;

CREATE TABLE `movie_production_companies` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_production_companies_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `movie_production_companies_ibfk_2` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movie_production_companies_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movie_production_companies` --

-- Table structure for table `movie_resolution` --

DROP TABLE IF EXISTS `movie_resolution`;

CREATE TABLE `movie_resolution` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `resolutionid` int(11) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `movie_resolution_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  CONSTRAINT `movie_resolution_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movie_resolution` --

-- Table structure for table `movies` --

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `releasedate` date NOT NULL,
  `runningtime` time NOT NULL,
  `synopsis` varchar(1000) NOT NULL,
  `coverart` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `addedby` int(11) NOT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`movieid`),
  KEY `movies_ibfk_1` (`addedby`),
  KEY `movies_ibfk_2` (`deletedby`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `movies` --

-- Table structure for table `nationalities` --

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(50) DEFAULT NULL,
  `movie_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`countryid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`movie_status` in ('Available','Banned'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `nationalities` --

-- Table structure for table `privileges` --

DROP TABLE IF EXISTS `privileges`;

CREATE TABLE `privileges` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `privileges` --

-- Table structure for table `ratings` --

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `ratingid` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`ratingid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `ratings` --

-- Table structure for table `resolution` --

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `resolutionid` int(11) NOT NULL AUTO_INCREMENT,
  `resolutionname` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`resolutionid`),
  KEY `userid` (`userid`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `resolution_ibfk_2` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `resolution` --

-- Table structure for table `roles` --

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(50) NOT NULL,
  `dateadded` datetime NOT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `addedby` int(11) NOT NULL,
  `datedeleted` datetime NOT NULL,
  `deletedby` int(11) NOT NULL,
  KEY `addedby` (`addedby`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `roles` --

-- Table structure for table `stars` --

DROP TABLE IF EXISTS `stars`;

CREATE TABLE `stars` (
  `starid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `nationalityid` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `alist` tinyint(1) NOT NULL DEFAULT 0,
  `addedby` int(11) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`starid`),
  KEY `nationalityid` (`nationalityid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`),
  CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationalityid`) REFERENCES `nationalities` (`countryid`),
  CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deletedby`) REFERENCES `users` (`userid`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`deleted` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `stars` --

-- Table structure for table `users` --

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `systemadmin` tinyint(1) NOT NULL,
  `accountactive` tinyint(1) NOT NULL,
  `dateadded` date NOT NULL,
  `addedby` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data for the table `users` --

-- !40101 SET SQL_MODE=@OLD_SQL_MODE --;
-- !40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS --;
-- !40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS --;
-- !40111 SET SQL_NOTES=@OLD_SQL_NOTES --;
