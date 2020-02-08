-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 08, 2020 at 07:41 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabasheer_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(255) NOT NULL,
  `Type` int(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_course` int(11) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Lecturer` varchar(255) NOT NULL,
  `capacity` int(2) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_classes_course` (`Id_course`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_category` int(11) NOT NULL,
  `Name` int(255) NOT NULL,
  `Description` text NOT NULL,
  `Image` text NOT NULL,
  `Price` float NOT NULL,
  `Number_of_hours` int(4) NOT NULL,
  `Views` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_courses_category` (`Id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Category` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` float NOT NULL,
  `Views` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Items_category` (`Id_Category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Items` int(11) NOT NULL,
  `New_Price` float NOT NULL,
  `End_Date` date NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Offers_Items_` (`Id_Items`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Id_Student` int(11) NOT NULL,
  `Payment` float NOT NULL,
  `Payoff` varchar(255) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Payments_User` (`Id_User`),
  KEY `FK_Payments_student` (`Id_Student`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Media` text,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Post` (`Id_User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
CREATE TABLE IF NOT EXISTS `specialization` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` int(1) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Email` text NOT NULL,
  `Birthday` date NOT NULL,
  `Id_Address` int(11) NOT NULL,
  `Id_University` int(3) NOT NULL,
  `Id_Specialization` int(3) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Address` (`Id_Address`),
  KEY `FK_University` (`Id_University`),
  KEY `FK_specialization` (`Id_Specialization`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stu_class`
--

DROP TABLE IF EXISTS `stu_class`;
CREATE TABLE IF NOT EXISTS `stu_class` (
  `Id_Student` int(11) NOT NULL,
  `Id_Class` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `FK_stu_class_class` (`Id_Class`),
  KEY `FK_stu_class_students` (`Id_Student`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
CREATE TABLE IF NOT EXISTS `university` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` int(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Email` text CHARACTER SET utf8 NOT NULL,
  `Phone` int(10) NOT NULL,
  `Password` text CHARACTER SET utf8 NOT NULL,
  `Gender` int(1) NOT NULL,
  `Id_Address` int(11) NOT NULL,
  `Image` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Birthday` date NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Address` (`Id_Address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
