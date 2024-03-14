-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 13, 2015 at 03:52 AM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `SS_tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `ArticleCategory`
--

DROP TABLE IF EXISTS `ArticleCategory`;
CREATE TABLE IF NOT EXISTS `ArticleCategory` (
`ID` int(11) NOT NULL,
  `ClassName` enum('ArticleCategory') DEFAULT 'ArticleCategory',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `ArticleHolderID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ArticleCategory`
--

INSERT INTO `ArticleCategory` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `ArticleHolderID`) VALUES
(1, 'ArticleCategory', '2015-03-11 00:42:21', '2015-03-11 00:42:21', 'Properties', 9),
(2, 'ArticleCategory', '2015-03-11 00:42:26', '2015-03-11 00:42:26', 'Prices', 9),
(3, 'ArticleCategory', '2015-03-11 00:42:38', '2015-03-11 00:42:38', 'Deals', 9);

-- --------------------------------------------------------

--
-- Table structure for table `ArticleComment`
--

DROP TABLE IF EXISTS `ArticleComment`;
CREATE TABLE IF NOT EXISTS `ArticleComment` (
`ID` int(11) NOT NULL,
  `ClassName` enum('ArticleComment') DEFAULT 'ArticleComment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Comment` mediumtext,
  `ArticlePageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ArticlePage`
--

DROP TABLE IF EXISTS `ArticlePage`;
CREATE TABLE IF NOT EXISTS `ArticlePage` (
`ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Teaser` mediumtext,
  `Author` varchar(50) DEFAULT NULL,
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `BrochureID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ArticlePage`
--

INSERT INTO `ArticlePage` (`ID`, `Date`, `Teaser`, `Author`, `PhotoID`, `BrochureID`) VALUES
(10, '2015-01-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo.', 'Bilbo Baggins', 2, 4),
(11, '2015-02-05', 'Quisque auctor ex eu felis pulvinar, at vulputate diam faucibus. Praesent nec risus quis metus fermentum dapibus. In placerat quis augue nec rutrum.', 'Frodo', 5, 6),
(12, '2015-02-28', 'Aliquam velit tellus, suscipit in accumsan non, pulvinar sed turpis. Aenean ut mollis quam. Integer eget vestibulum arcu. ', 'Bilbo Baggins', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ArticlePage_Categories`
--

DROP TABLE IF EXISTS `ArticlePage_Categories`;
CREATE TABLE IF NOT EXISTS `ArticlePage_Categories` (
`ID` int(11) NOT NULL,
  `ArticlePageID` int(11) NOT NULL DEFAULT '0',
  `ArticleCategoryID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ArticlePage_Categories`
--

INSERT INTO `ArticlePage_Categories` (`ID`, `ArticlePageID`, `ArticleCategoryID`) VALUES
(1, 10, 1),
(2, 10, 2),
(3, 11, 3),
(4, 12, 2),
(5, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ArticlePage_Live`
--

DROP TABLE IF EXISTS `ArticlePage_Live`;
CREATE TABLE IF NOT EXISTS `ArticlePage_Live` (
`ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Teaser` mediumtext,
  `Author` varchar(50) DEFAULT NULL,
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `BrochureID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ArticlePage_Live`
--

INSERT INTO `ArticlePage_Live` (`ID`, `Date`, `Teaser`, `Author`, `PhotoID`, `BrochureID`) VALUES
(10, '2015-01-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo.', 'Bilbo Baggins', 79, 4),
(11, '2015-02-05', 'Quisque auctor ex eu felis pulvinar, at vulputate diam faucibus. Praesent nec risus quis metus fermentum dapibus. In placerat quis augue nec rutrum.', 'Frodo', 80, 6),
(12, '2015-02-28', 'Aliquam velit tellus, suscipit in accumsan non, pulvinar sed turpis. Aenean ut mollis quam. Integer eget vestibulum arcu. ', 'Bilbo Baggins', 81, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ArticlePage_versions`
--

DROP TABLE IF EXISTS `ArticlePage_versions`;
CREATE TABLE IF NOT EXISTS `ArticlePage_versions` (
`ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Teaser` mediumtext,
  `Author` varchar(50) DEFAULT NULL,
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `BrochureID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ArticlePage_versions`
--

INSERT INTO `ArticlePage_versions` (`ID`, `RecordID`, `Version`, `Date`, `Teaser`, `Author`, `PhotoID`, `BrochureID`) VALUES
(1, 10, 1, NULL, NULL, NULL, 0, 0),
(2, 10, 2, '2015-01-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo.', 'Bilbo Baggins', 2, 4),
(3, 11, 1, NULL, NULL, NULL, 0, 0),
(4, 11, 2, '2015-02-05', 'Quisque auctor ex eu felis pulvinar, at vulputate diam faucibus. Praesent nec risus quis metus fermentum dapibus. In placerat quis augue nec rutrum.', 'Frodo', 5, 6),
(5, 12, 1, NULL, NULL, NULL, 0, 0),
(6, 12, 2, '2015-02-28', 'Aliquam velit tellus, suscipit in accumsan non, pulvinar sed turpis. Aenean ut mollis quam. Integer eget vestibulum arcu. ', 'Bilbo Baggins', 7, 8),
(7, 10, 3, '2015-01-13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo.', 'Bilbo Baggins', 79, 4),
(8, 11, 3, '2015-02-05', 'Quisque auctor ex eu felis pulvinar, at vulputate diam faucibus. Praesent nec risus quis metus fermentum dapibus. In placerat quis augue nec rutrum.', 'Frodo', 80, 6),
(9, 12, 3, '2015-02-28', 'Aliquam velit tellus, suscipit in accumsan non, pulvinar sed turpis. Aenean ut mollis quam. Integer eget vestibulum arcu. ', 'Bilbo Baggins', 81, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

DROP TABLE IF EXISTS `ErrorPage`;
CREATE TABLE IF NOT EXISTS `ErrorPage` (
`ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

DROP TABLE IF EXISTS `ErrorPage_Live`;
CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
`ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

DROP TABLE IF EXISTS `ErrorPage_versions`;
CREATE TABLE IF NOT EXISTS `ErrorPage_versions` (
`ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
CREATE TABLE IF NOT EXISTS `File` (
`ID` int(11) NOT NULL,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `Created`, `LastEdited`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2015-03-11 00:44:18', '2015-03-11 00:44:18', 'travel-photos', 'travel-photos', 'assets/travel-photos/', NULL, 1, 0, 1),
(3, 'Folder', '2015-03-11 00:44:22', '2015-03-11 00:44:22', 'travel-brochures', 'travel-brochures', 'assets/travel-brochures/', NULL, 1, 0, 1),
(4, 'File', '2015-03-11 00:44:23', '2015-03-11 00:44:23', 'pdf1.pdf', 'pdf1', 'assets/travel-brochures/pdf1.pdf', NULL, 1, 3, 1),
(6, 'File', '2015-03-11 00:45:45', '2015-03-11 00:45:45', 'pdf3.pdf', 'pdf3', 'assets/travel-brochures/pdf3.pdf', NULL, 1, 3, 1),
(8, 'File', '2015-03-11 00:46:40', '2015-03-11 00:46:40', 'pdf2.pdf', 'pdf2', 'assets/travel-brochures/pdf2.pdf', NULL, 1, 3, 1),
(9, 'Folder', '2015-03-12 00:03:14', '2015-03-12 00:03:14', 'region-photos', 'region-photos', 'assets/region-photos/', NULL, 1, 0, 1),
(48, 'File', '2015-04-08 12:38:32', '2015-04-08 12:38:32', 'error-404.html', 'error-404.html', 'assets/error-404.html', NULL, 1, 0, 1),
(49, 'File', '2015-04-08 12:38:32', '2015-04-08 12:38:32', 'error-500.html', 'error-500.html', 'assets/error-500.html', NULL, 1, 0, 1),
(50, 'Folder', '2015-04-08 12:38:32', '2015-04-08 12:38:32', 'property-photos', 'property-photos', 'assets/property-photos/', NULL, 1, 0, 1),
(64, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-1.jpg', 'property-1.jpg', 'assets/property-photos/property-1.jpg', NULL, 1, 50, 1),
(65, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-10.jpg', 'property-10.jpg', 'assets/property-photos/property-10.jpg', NULL, 1, 50, 1),
(66, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-11.jpg', 'property-11.jpg', 'assets/property-photos/property-11.jpg', NULL, 1, 50, 1),
(67, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-2.jpg', 'property-2.jpg', 'assets/property-photos/property-2.jpg', NULL, 1, 50, 1),
(68, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-3.jpg', 'property-3.jpg', 'assets/property-photos/property-3.jpg', NULL, 1, 50, 1),
(69, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-4.jpg', 'property-4.jpg', 'assets/property-photos/property-4.jpg', NULL, 1, 50, 1),
(70, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-5.jpg', 'property-5.jpg', 'assets/property-photos/property-5.jpg', NULL, 1, 50, 1),
(71, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-6.jpg', 'property-6.jpg', 'assets/property-photos/property-6.jpg', NULL, 1, 50, 1),
(72, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-7.jpg', 'property-7.jpg', 'assets/property-photos/property-7.jpg', NULL, 1, 50, 1),
(73, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-8.jpg', 'property-8.jpg', 'assets/property-photos/property-8.jpg', NULL, 1, 50, 1),
(74, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'property-9.jpg', 'property-9.jpg', 'assets/property-photos/property-9.jpg', NULL, 1, 50, 1),
(75, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'region-1.jpg', 'region-1.jpg', 'assets/region-photos/region-1.jpg', NULL, 1, 9, 1),
(76, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'region-2.jpg', 'region-2.jpg', 'assets/region-photos/region-2.jpg', NULL, 1, 9, 1),
(77, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'region-3.jpg', 'region-3.jpg', 'assets/region-photos/region-3.jpg', NULL, 1, 9, 1),
(78, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'region-4.jpg', 'region-4.jpg', 'assets/region-photos/region-4.jpg', NULL, 1, 9, 1),
(79, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'travel-1.jpeg', 'travel-1.jpeg', 'assets/travel-photos/travel-1.jpeg', NULL, 1, 1, 1),
(80, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'travel-2.jpeg', 'travel-2.jpeg', 'assets/travel-photos/travel-2.jpeg', NULL, 1, 1, 1),
(81, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'travel-3.jpg', 'travel-3.jpg', 'assets/travel-photos/travel-3.jpg', NULL, 1, 1, 1),
(82, 'Image', '2015-04-08 12:47:20', '2015-04-08 12:47:20', 'travel-4.jpg', 'travel-4.jpg', 'assets/travel-photos/travel-4.jpg', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group` (
`ID` int(11) NOT NULL,
  `ClassName` enum('Group') DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

DROP TABLE IF EXISTS `Group_Members`;
CREATE TABLE IF NOT EXISTS `Group_Members` (
`ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

DROP TABLE IF EXISTS `Group_Roles`;
CREATE TABLE IF NOT EXISTS `Group_Roles` (
`ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

DROP TABLE IF EXISTS `LoginAttempt`;
CREATE TABLE IF NOT EXISTS `LoginAttempt` (
`ID` int(11) NOT NULL,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
CREATE TABLE IF NOT EXISTS `Member` (
`ID` int(11) NOT NULL,
  `ClassName` enum('Member') DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `Created`, `LastEdited`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`) VALUES
(1, 'Member', '2015-03-11 00:37:52', '2015-04-07 01:25:12', 'Default Admin', NULL, 'root', '68ee23a11d42457626b71ef1eefa7c0424d51c8f', '2015-04-10 01:25:12', NULL, NULL, 1, '2015-04-13 10:23:19', NULL, NULL, NULL, NULL, NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

DROP TABLE IF EXISTS `MemberPassword`;
CREATE TABLE IF NOT EXISTS `MemberPassword` (
`ID` int(11) NOT NULL,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
CREATE TABLE IF NOT EXISTS `Permission` (
`ID` int(11) NOT NULL,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `Created`, `LastEdited`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

DROP TABLE IF EXISTS `PermissionRole`;
CREATE TABLE IF NOT EXISTS `PermissionRole` (
`ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

DROP TABLE IF EXISTS `PermissionRoleCode`;
CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
`ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Property`
--

DROP TABLE IF EXISTS `Property`;
CREATE TABLE IF NOT EXISTS `Property` (
`ID` int(11) NOT NULL,
  `ClassName` enum('Property') DEFAULT 'Property',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `PricePerNight` decimal(9,2) NOT NULL DEFAULT '0.00',
  `Bedrooms` int(11) NOT NULL DEFAULT '0',
  `Bathrooms` int(11) NOT NULL DEFAULT '0',
  `FeaturedOnHomepage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RegionID` int(11) NOT NULL DEFAULT '0',
  `PrimaryPhotoID` int(11) NOT NULL DEFAULT '0',
  `AvailableStart` date DEFAULT NULL,
  `AvailableEnd` date DEFAULT NULL,
  `Description` mediumtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `Property`
--

INSERT INTO `Property` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `PricePerNight`, `Bedrooms`, `Bathrooms`, `FeaturedOnHomepage`, `RegionID`, `PrimaryPhotoID`, `AvailableStart`, `AvailableEnd`, `Description`) VALUES
(1, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Maxime qui animi.', 990.00, 6, 2, 1, 3, 64, '2015-07-23', '2015-07-23', 'Vel placeat et culpa tempora rerum expedita eos. Possimus nulla totam voluptas. Aperiam et aut voluptas perspiciatis. Rerum ab est ut voluptatum et.'),
(2, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Dolores ducimus officia qui quo.', 910.00, 4, 2, 1, 1, 65, '2015-04-18', '2015-04-26', 'Omnis praesentium inventore expedita in. Maxime molestias et quasi delectus pariatur. Omnis sit aut et accusantium cumque quo sed.'),
(3, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Nemo laudantium iure iste.', 120.00, 2, 2, 0, 3, 68, '2015-07-16', '2015-07-29', 'Numquam nobis possimus facilis. In qui eum quis suscipit atque eos incidunt. Eaque rerum illum debitis enim veritatis autem.'),
(4, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Eligendi possimus rerum reprehenderit eius et nisi', 980.00, 8, 5, 0, 3, 72, '2015-07-16', '2015-07-28', 'Enim repellendus consequuntur est sit. Dolor minima quo consectetur quia enim velit ea voluptas. Soluta optio culpa sint modi repudiandae qui. Mollitia hic impedit voluptatibus.'),
(5, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Possimus et eum ut quos.', 910.00, 4, 9, 1, 2, 73, '2015-10-25', '2015-11-04', 'Dolorem aut occaecati vitae cupiditate voluptatem. Et eos eaque corrupti sed et corporis culpa et. Et qui et quod consequatur.'),
(6, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Laboriosam molestias excepturi.', 830.00, 6, 4, 0, 2, 66, '2016-03-13', '2016-03-14', 'Repellendus distinctio qui odit vel velit. Accusamus rerum magnam dolorem. Ut beatae sapiente quidem atque aut nulla labore. Qui fugit qui consectetur possimus.'),
(7, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Neque vitae eos in.', 840.00, 7, 1, 1, 3, 71, '2015-04-11', '2015-04-13', 'Sit consequatur harum quasi libero exercitationem. Rerum optio quo reprehenderit qui. In voluptatibus cupiditate est quisquam sed sed.'),
(8, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Expedita ea ipsum saepe.', 530.00, 8, 3, 0, 4, 71, '2015-07-10', '2015-07-18', 'Illum minima et ad enim. Sunt explicabo perferendis voluptatibus quis accusantium sapiente et nulla.'),
(9, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Id aut perspiciatis et.', 150.00, 2, 2, 0, 4, 70, '2015-07-06', '2015-07-13', 'Quidem id consequuntur sunt asperiores maiores consequatur. Incidunt qui nobis ut ut molestiae. Occaecati nulla eaque illo quibusdam voluptatem autem.'),
(10, 'Property', '2015-03-12 00:17:17', '2015-04-08 03:01:08', 'Est quibusdam magnam quis sint sint.', 230.00, 1, 9, 0, 3, 67, '2015-09-25', '2015-10-04', 'Voluptatem maiores facere aut et. Cumque voluptatem dolorem iusto aliquid et. Assumenda enim reprehenderit error impedit earum. Neque molestias et non et in nobis odio.'),
(11, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptatem porro quia veniam.', 250.00, 7, 4, 1, 2, 71, '2015-11-13', '2015-11-25', 'Accusantium adipisci ut voluptatem. Quaerat est maiores nostrum sed nam. Iure incidunt molestias sint unde.'),
(12, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptatem saepe ea magni.', 650.00, 7, 2, 0, 1, 70, '2015-11-12', '2015-11-16', 'Rerum id corrupti voluptas. Labore et excepturi et repudiandae mollitia deleniti.\nVoluptate ducimus eligendi illo voluptate omnis et delectus qui. Et neque quia omnis quis.'),
(13, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Quisquam saepe.', 830.00, 4, 6, 0, 2, 74, '2015-06-17', '2015-06-17', 'Debitis maxime minus ex quisquam accusamus. Aspernatur aperiam exercitationem est. Ratione ipsa quam sed quam officiis commodi.'),
(14, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Et quas adipisci.', 460.00, 9, 6, 0, 3, 68, '2015-06-10', '2015-06-11', 'Sunt deserunt est mollitia. Veniam quis ullam numquam ratione dolore labore. Doloribus libero ad aut ad dolore neque debitis.'),
(15, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Sit aut voluptas est.', 90.00, 4, 3, 0, 3, 73, '2015-07-22', '2015-07-30', 'Aut placeat odio ea est quae. Consequatur suscipit odio vel eos quia labore at.\nProvident magni voluptatem nihil sed ut. Sed animi id quos minima.'),
(16, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Ipsa placeat dolor possimus eos eum.', 80.00, 3, 5, 0, 4, 69, '2016-03-08', '2016-03-18', 'Rerum est enim rerum unde est aut quos. Qui earum natus in corporis. Velit natus soluta tenetur autem quibusdam. Modi ipsum quidem dolorum repudiandae.'),
(17, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Esse occaecati ducimus.', 710.00, 9, 8, 0, 4, 66, '2016-01-01', '2016-01-13', 'Quod nihil quo recusandae modi dolor. Quos odit ipsam repudiandae in nulla ipsum vel. Non quod qui molestiae.'),
(18, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Pariatur et minima quaerat cum.', 340.00, 2, 6, 0, 1, 67, '2016-03-10', '2016-03-10', 'Facere labore aut tenetur nobis nulla est possimus qui. Et sequi odit quisquam asperiores sit qui.'),
(19, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Quia ullam cumque rem id autem.', 890.00, 7, 3, 0, 2, 68, '2015-09-04', '2015-09-14', 'At tempora ut quidem commodi et maiores reiciendis. Repellendus eligendi sunt incidunt magni reiciendis. Corrupti aut nihil expedita quo eos enim recusandae possimus.'),
(20, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Occaecati ut non magni.', 390.00, 4, 7, 0, 4, 69, '2015-07-19', '2015-07-26', 'Cumque iure sed tempore placeat commodi. Dolore voluptas impedit ipsam illum iste. Cum iure ipsam et sapiente inventore. Et nostrum nihil dolorem aliquam aperiam et ea.'),
(21, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptatum id sequi culpa.', 190.00, 6, 7, 0, 3, 73, '2015-06-10', '2015-06-16', 'Dolores omnis nam saepe nostrum modi. Et iste eius dolorem provident necessitatibus. Velit repudiandae amet numquam beatae autem ut.'),
(22, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Corporis et saepe quaerat animi nihil.', 790.00, 1, 6, 0, 1, 64, '2015-04-16', '2015-04-24', 'Ab magnam laborum voluptatem libero nulla assumenda molestiae libero. Reprehenderit et possimus eum.'),
(23, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Expedita sed quaerat vel sunt facere.', 370.00, 2, 7, 0, 2, 67, '2015-11-13', '2015-11-24', 'At at et laudantium id commodi ut. Voluptatem quam molestiae libero. Ducimus et eos facilis aut. Nam aut culpa voluptatem occaecati.'),
(24, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Reiciendis ducimus fugit voluptas laudantium quisq', 670.00, 9, 9, 0, 1, 74, '2016-03-14', '2016-03-16', 'Quo laborum ad quae minima. Doloremque neque autem neque possimus. Corporis magni totam sit minus.'),
(25, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Nihil eos consequuntur quos.', 500.00, 1, 5, 0, 1, 65, '2016-02-22', '2016-03-01', 'Ullam et qui est et. Et sunt cum illum perspiciatis quo debitis reiciendis. Et est voluptatem est et quaerat.'),
(26, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Debitis voluptates.', 620.00, 4, 6, 1, 4, 74, '2015-11-04', '2015-11-08', 'Dolores omnis sed sed qui dolores. Voluptas ut praesentium architecto quia nam laudantium. Dolorum sed veritatis unde odio expedita magni tenetur.'),
(27, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'At laudantium cupiditate libero quis.', 80.00, 8, 6, 0, 4, 69, '2015-07-11', '2015-07-23', 'Ea quis distinctio voluptatum est dolorem. Omnis doloremque et a qui quo. Porro quidem omnis qui ea dicta repudiandae aspernatur.'),
(28, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Sed illo eius dolor.', 460.00, 1, 1, 0, 4, 64, '2015-10-30', '2015-11-04', 'Et modi quas qui cum. Tempora at exercitationem accusantium. Quaerat ullam explicabo tenetur voluptas illo debitis. Et omnis nobis nihil quo iusto.'),
(29, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'In ex quam hic.', 550.00, 8, 4, 0, 1, 67, '2015-04-20', '2015-04-23', 'Omnis numquam quos autem. Cumque officiis consequuntur necessitatibus sint. Iure dolorum rerum et porro incidunt molestiae culpa recusandae. Ut enim vel quaerat eaque qui.'),
(30, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Magni quia est deleniti qui.', 360.00, 9, 8, 0, 1, 70, '2015-09-30', '2015-10-13', 'Odit ut voluptas voluptas harum nam. Et magni et iure autem accusantium possimus animi.\nPossimus deserunt cum dolorem. Voluptate aliquid itaque et. Sit autem totam nam hic sed numquam amet.'),
(31, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptates assumenda placeat qui.', 530.00, 3, 8, 0, 3, 66, '2015-07-27', '2015-07-31', 'Voluptas ipsum quisquam quod ut qui voluptatem dolorem. Perferendis suscipit similique quia dolorum est perferendis.'),
(32, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Dolorem harum quo deleniti.', 870.00, 3, 7, 0, 3, 72, '2015-05-06', '2015-05-15', 'Accusantium magni aliquam vel veniam. Ratione asperiores non et tempore unde aliquam inventore. Deleniti ipsa ea delectus omnis ipsum voluptas et rerum.'),
(33, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Illum consequatur.', 100.00, 8, 4, 0, 2, 68, '2015-10-01', '2015-10-06', 'Magni qui dolore nisi quo facere sint nam. Maxime corporis recusandae similique sit quidem mollitia ducimus. Quam nobis impedit hic ipsam. Inventore omnis aliquam magnam assumenda dolores provident.'),
(34, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Et et non.', 830.00, 3, 7, 0, 3, 70, '2015-06-15', '2015-06-28', 'Ad quo sit saepe debitis sed delectus. Et illum ut qui provident dignissimos et. Quis adipisci voluptatum doloribus cupiditate dolores.'),
(35, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Dolores nulla animi maiores enim minus.', 340.00, 7, 4, 0, 1, 73, '2015-09-30', '2015-10-08', 'Fuga harum excepturi consectetur asperiores rerum sed itaque. Praesentium corrupti quasi in rerum. Omnis ut qui adipisci incidunt et.'),
(36, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Quo ut suscipit nostrum dolor.', 750.00, 7, 6, 0, 1, 68, '2016-02-10', '2016-02-12', 'Nostrum quo consequatur accusantium quod. Quidem aliquam expedita deleniti assumenda quis nostrum quo.'),
(37, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Recusandae eveniet temporibus aut.', 590.00, 7, 1, 0, 2, 64, '2016-01-21', '2016-01-21', 'Eos labore quod sequi illo impedit eos nemo. Rerum soluta numquam ipsum et voluptas et dolore. Ipsa impedit amet sed dolor voluptatum cum at. Nam qui esse ex quaerat hic et. Accusamus ex aut itaque.'),
(38, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Deserunt reiciendis nemo soluta.', 330.00, 5, 6, 0, 2, 72, '2015-09-04', '2015-09-14', 'Nesciunt sint et ullam odio eaque placeat aut. Voluptate fuga aspernatur quos id non maxime. Porro esse libero minus debitis cumque. Soluta officia natus nam voluptas neque est unde.'),
(39, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Dolorem velit tenetur enim eius quia.', 510.00, 3, 8, 0, 1, 70, '2015-12-10', '2015-12-17', 'Voluptas consequuntur dolores a maiores qui. Accusamus et rerum sit eum qui facere sit. Aspernatur illo nesciunt cumque quas.'),
(40, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Id ad dicta ducimus.', 80.00, 9, 3, 0, 4, 72, '2015-06-03', '2015-06-09', 'Aliquid asperiores sunt error veritatis quam quisquam. Et ut quo fugiat et esse necessitatibus officia. Quidem rerum quo vitae libero harum quaerat.'),
(41, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Saepe autem architecto quo.', 40.00, 6, 9, 0, 1, 74, '2016-01-07', '2016-01-15', 'Rem deleniti aut facilis eos. Accusantium quo earum quam animi. Ea error fugiat hic omnis sed.'),
(42, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Velit non nostrum commodi.', 830.00, 3, 9, 0, 3, 67, '2015-07-24', '2015-08-02', 'Animi aut doloremque et modi deleniti velit. Est nesciunt necessitatibus vitae incidunt. Soluta quia maxime incidunt dolor aliquid doloremque minus.'),
(43, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Mollitia ut consequuntur eaque.', 390.00, 4, 9, 0, 2, 74, '2015-06-26', '2015-07-03', 'Sit impedit debitis delectus ratione nesciunt et quia facere. Exercitationem cupiditate reiciendis aliquam qui natus. Provident similique ut rerum quos. Quidem neque voluptates quo quia et.'),
(44, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Officia animi dicta et ea dolores facilis.', 90.00, 5, 8, 0, 1, 67, '2015-06-22', '2015-06-30', 'Odio est quis et commodi dolore asperiores. Ipsam quidem quia aut rem dolor dicta nulla. Pariatur rerum corporis consequatur non eum sint. Et aut reiciendis maxime dignissimos et incidunt expedita.'),
(45, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Quibusdam qui distinctio maxime nemo illum odio.', 370.00, 1, 4, 0, 3, 65, '2015-08-26', '2015-09-01', 'Asperiores quisquam nam molestiae molestiae. Ipsa beatae iusto dolor dolor deleniti. Quibusdam eligendi sit enim voluptatum aut ex numquam et. Ipsa ipsum accusantium optio libero ipsam.'),
(46, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptatem asperiores cumque.', 180.00, 9, 3, 0, 2, 72, '2015-07-26', '2015-08-02', 'Nam quidem dolores porro non aliquid. Eum id autem voluptatem voluptatibus ut perferendis ex. Ipsum aut nihil accusamus earum aperiam.'),
(47, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptas voluptatem voluptatem omnis explicabo odi', 680.00, 6, 2, 0, 1, 68, '2015-08-12', '2015-08-15', 'Aspernatur eum repudiandae ut repellendus reprehenderit provident. Sit quia itaque qui qui. Magni assumenda quia at placeat officia eveniet.'),
(48, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Esse et aut.', 0.00, 1, 9, 0, 1, 68, '2016-02-08', '2016-02-15', 'Voluptatum nostrum odio esse aliquid dolore. Sequi sint dignissimos qui dolorem sint illo laudantium. Rerum velit ut sint ut sint. Culpa illo omnis autem quia occaecati sint hic explicabo.'),
(49, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptatum iste ipsam ea.', 390.00, 7, 4, 0, 4, 67, '2015-06-02', '2015-06-15', 'Voluptate temporibus sapiente aut quod. Ad rem suscipit voluptatem eos quam.'),
(50, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Voluptate doloribus totam maxime.', 410.00, 3, 3, 0, 1, 66, '2015-07-06', '2015-07-11', 'Quidem ut nam delectus quaerat. Modi assumenda quis quia doloremque. Maiores cumque labore ex non repellat provident accusamus. Dicta aspernatur possimus expedita sunt necessitatibus.'),
(51, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Similique iure.', 530.00, 4, 8, 0, 1, 72, '2016-01-12', '2016-01-23', 'Alias et necessitatibus ea sit maiores a quia deleniti. Ut reiciendis quia optio dolore dolorem inventore. Enim nihil inventore dolorum commodi dolor dicta. Ad ut tempora iste qui.'),
(52, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Autem et recusandae qui.', 390.00, 2, 7, 0, 1, 65, '2015-05-15', '2015-05-15', 'Est rem exercitationem ipsa dignissimos hic. Ut modi qui nihil temporibus nam maiores deserunt. Quibusdam qui quo minus voluptate necessitatibus voluptatem et quo.'),
(53, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Non ipsum deleniti.', 440.00, 4, 8, 0, 3, 70, '2015-06-22', '2015-07-02', 'Praesentium quaerat similique deleniti voluptatum aspernatur cupiditate est. Beatae eveniet optio qui. In quod aut nulla aut quo facilis. Harum et sit voluptatem et atque quia.'),
(54, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Adipisci odio et vel iure.', 710.00, 6, 3, 0, 1, 74, '2016-01-01', '2016-01-10', 'Deleniti laborum accusamus et est. A nesciunt ab quasi et itaque veritatis. Consequatur nam quis possimus soluta in quis. Cum sunt fugiat est nulla magni. Nemo doloribus est dignissimos dolor et.'),
(55, 'Property', '2015-03-12 00:17:36', '2015-04-08 03:01:08', 'Non sit beatae.', 340.00, 7, 7, 0, 4, 68, '2015-04-27', '2015-04-30', 'Dicta consequuntur blanditiis excepturi enim. Neque corporis earum et culpa quo omnis. Est earum omnis aut. Debitis qui eligendi sit nemo consequatur.'),
(56, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Deserunt aut magni nemo.', 780.00, 1, 8, 0, 1, 67, '2015-05-01', '2015-05-14', 'Exercitationem non earum nulla amet. Totam ducimus inventore velit itaque vitae. Saepe impedit sunt soluta est cupiditate. Praesentium consectetur et est cum quaerat quos non.'),
(57, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Sit soluta ipsum qui.', 500.00, 9, 1, 0, 3, 71, '2015-06-07', '2015-06-11', 'Omnis quos sed officia rem eum velit. Error et nostrum eveniet explicabo exercitationem laboriosam qui. Excepturi magni vel facere qui molestias et.'),
(58, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Ratione id facere rerum cumque.', 700.00, 4, 6, 0, 4, 64, '2015-11-26', '2015-12-03', 'Modi quis incidunt sit velit maiores. Corrupti eveniet cum velit ut. Sed tempora mollitia aperiam consequatur in maiores.'),
(59, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Aliquid possimus ut deserunt.', 10.00, 3, 1, 0, 2, 68, '2015-12-16', '2015-12-26', 'Repellat qui magni voluptate et totam excepturi. Nulla sunt similique occaecati pariatur est nesciunt ut. Rerum harum eos odit et quia magni voluptatem.'),
(60, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Aut beatae aut.', 150.00, 4, 5, 0, 4, 68, '2015-10-23', '2015-10-24', 'Sed at aspernatur tenetur aspernatur explicabo reiciendis ipsa. Quis sit autem rerum.'),
(61, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Aut aut ut aut.', 700.00, 1, 2, 0, 4, 67, '2015-11-28', '2015-12-02', 'Nihil doloribus est necessitatibus et error et eos. Facilis est unde et et sunt autem eaque.'),
(62, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'At et veritatis qui.', 750.00, 8, 6, 0, 3, 67, '2015-11-08', '2015-11-13', 'Non quia reprehenderit eum incidunt quo. Dolore atque enim quos magnam cupiditate. Et mollitia ut enim. Praesentium commodi ipsam eaque esse iusto et sit.'),
(63, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Eligendi et tempore in qui consectetur.', 830.00, 2, 2, 0, 2, 65, '2015-04-12', '2015-04-12', 'Quos consequuntur repudiandae quia inventore voluptatum rerum. Labore non hic aut atque porro. Voluptatem rerum cupiditate numquam aut. Provident aut impedit ab aut saepe error aperiam suscipit.'),
(64, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Quia quasi quia alias.', 750.00, 5, 3, 0, 1, 68, '2015-07-24', '2015-07-24', 'Dolor illum laborum explicabo velit id quia. Excepturi veniam eveniet corporis. Assumenda rerum laborum praesentium fuga at quia et voluptatem. Est eos quo repellat porro eius architecto minus.'),
(65, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Qui qui cupiditate.', 400.00, 7, 1, 0, 3, 71, '2015-09-14', '2015-09-15', 'Quod ducimus eveniet quae suscipit aut dolorem fugit. Assumenda quia aspernatur dolores voluptas eaque rem facere. Delectus in aperiam voluptas in. Illum tempora hic recusandae voluptate.'),
(66, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Praesentium hic aliquid itaque.', 1000.00, 1, 1, 0, 2, 72, '2015-07-26', '2015-07-29', 'Quo asperiores quam non. A dolorem sequi est dicta. Ut impedit voluptatem et culpa nobis. Placeat pariatur illo aut unde et.'),
(67, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Rerum et iusto.', 660.00, 2, 4, 0, 1, 68, '2015-06-15', '2015-06-15', 'Illum autem quia maxime ducimus et earum. Est totam tempore laborum ut et. Sunt mollitia cum et et et nam distinctio.'),
(68, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Voluptas beatae sit.', 30.00, 7, 5, 0, 2, 74, '2015-04-21', '2015-04-27', 'Sint reprehenderit asperiores totam. Nam dolor nulla iure voluptas est. Molestias reprehenderit illo numquam debitis repellat hic.'),
(69, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Qui voluptas consequatur fugit perferendis ea.', 230.00, 9, 4, 0, 1, 65, '2015-11-23', '2015-11-27', 'Similique asperiores enim molestiae voluptas corrupti sint. A ratione fugiat sunt vel et. Saepe neque dolor sapiente et voluptas harum.'),
(70, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Repellat laboriosam maiores illo.', 180.00, 8, 7, 0, 4, 72, '2015-04-19', '2015-04-19', 'Temporibus voluptas dicta harum modi. Ut dicta architecto ut aut est. Magni eum voluptatem debitis vel.'),
(71, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Hic autem quidem.', 880.00, 4, 2, 0, 1, 71, '2015-07-16', '2015-07-18', 'Aut ipsa nostrum quidem quia deleniti. Et fugiat enim et.\nNemo officiis aut aperiam. Aut ut consectetur voluptate enim voluptas consequuntur in magni. Omnis qui minus dolor maiores quod ut similique.'),
(72, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Non omnis repellendus nam laborum.', 150.00, 5, 7, 0, 1, 65, '2015-07-15', '2015-07-27', 'Non iste culpa et amet at quibusdam et. Culpa dolor consequatur et sunt sed eum et.'),
(73, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Necessitatibus doloribus ut et.', 350.00, 1, 9, 0, 1, 70, '2015-10-20', '2015-10-30', 'Delectus ut eos perferendis. Et aspernatur quo rem occaecati. Quo dolorem deserunt consequatur voluptas sit ut fugiat dolor.'),
(74, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Quidem quia aliquid et aut.', 710.00, 8, 6, 0, 4, 64, '2016-02-16', '2016-02-18', 'Et similique temporibus autem mollitia veniam voluptatem dolores earum. Odit sunt ea reiciendis expedita et et sed. Dolores laborum minima laudantium qui ratione impedit esse.'),
(75, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Quos sit et hic.', 480.00, 9, 2, 0, 1, 74, '2015-12-20', '2015-12-30', 'Quisquam ducimus ut magni fugiat dolor praesentium excepturi. Ipsum ea cupiditate non at. Eos omnis unde dolorem qui exercitationem. Omnis est ut libero modi.'),
(76, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Tempora quo in dolor.', 630.00, 3, 3, 0, 1, 70, '2016-03-13', '2016-03-14', 'Aut corporis quis veniam laboriosam et. Repellat consequuntur aperiam dignissimos ut tenetur. Assumenda amet ullam nihil quia unde voluptatem.'),
(77, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Quo autem sed quis voluptas.', 940.00, 6, 7, 0, 2, 67, '2015-10-29', '2015-11-01', 'Delectus qui suscipit error consectetur perspiciatis nobis in perferendis. Dolorum dignissimos delectus ipsa ab illo id cumque. Labore corrupti repudiandae voluptate nemo.'),
(78, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Unde at libero impedit rerum.', 780.00, 3, 7, 0, 4, 66, '2015-04-07', '2015-04-18', 'At omnis consequatur pariatur dolorem sed. Nemo voluptatum inventore laudantium non ullam. Enim eligendi alias repudiandae ut atque alias. Veritatis vel consectetur cum ea et.'),
(79, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Id labore cupiditate assumenda.', 260.00, 3, 7, 0, 2, 71, '2015-08-01', '2015-08-09', 'Atque magni est non reiciendis. Distinctio molestiae ea corporis nemo perferendis. At consequatur aliquid est aut distinctio perspiciatis. Nihil earum eos porro aut ut accusamus.'),
(80, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Fuga doloribus suscipit nobis rerum.', 630.00, 7, 3, 0, 2, 66, '2015-11-08', '2015-11-13', 'Aut iusto quia repellat adipisci a sint veritatis. Qui vitae sed reiciendis non qui reprehenderit.'),
(81, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Consequuntur dolorem.', 290.00, 6, 3, 0, 3, 67, '2016-04-04', '2016-04-07', 'Rerum vel assumenda et eum ex ut. Est commodi temporibus aut. Necessitatibus ab iste et voluptas rerum. Vero fuga quis repellendus qui minima soluta neque.'),
(82, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Dicta qui voluptatem ut atque ut eveniet.', 290.00, 3, 5, 0, 2, 72, '2015-06-21', '2015-07-04', 'At architecto ad aut veritatis. Facere et id nobis quia incidunt qui. Omnis sed aut fuga sed vel illum fugit libero.'),
(83, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Eum ab consequuntur dolore.', 630.00, 2, 7, 0, 2, 64, '2015-04-22', '2015-04-22', 'Omnis porro voluptas eius rem. Doloremque qui nam cum voluptas vero ut. Quam numquam nulla ratione rerum non odit.'),
(84, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Et earum dicta repellat voluptatem repellat.', 40.00, 1, 8, 0, 1, 65, '2015-11-08', '2015-11-11', 'Sed in optio magnam ut veritatis reiciendis non. Ut et sed assumenda dolorem eos. Temporibus qui optio laudantium nobis dolores omnis est.'),
(85, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Atque necessitatibus error voluptatem.', 400.00, 9, 4, 0, 1, 67, '2016-01-31', '2016-02-04', 'Sequi enim omnis mollitia quam animi similique. Omnis et esse ad unde adipisci omnis asperiores ut. Adipisci labore velit blanditiis.'),
(86, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Enim voluptatem in necessitatibus.', 720.00, 4, 2, 0, 1, 68, '2015-08-06', '2015-08-18', 'Cumque et libero officiis eligendi deserunt. Nulla nisi dolores alias nihil. Sunt ut et corporis omnis. Ipsum reprehenderit ducimus voluptas ut aut pariatur.'),
(87, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Sint ipsam error sed occaecati.', 360.00, 3, 7, 0, 1, 74, '2015-06-18', '2015-06-22', 'Et qui id consequatur beatae et rerum in. Ut amet dolorem est omnis ut et. Error totam occaecati incidunt numquam. Suscipit ut ad doloribus qui sit amet id molestias.'),
(88, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Ipsam dolorum quo.', 550.00, 3, 1, 0, 3, 69, '2016-04-03', '2016-04-04', 'Consectetur iste est magni non quia. Incidunt occaecati est debitis repellat sunt.'),
(89, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Velit delectus possimus vel consequatur qui.', 720.00, 5, 3, 0, 2, 67, '2015-08-20', '2015-08-28', 'Labore mollitia cum repellat ut vel et nobis quo. Dolores laborum odit quam dolor voluptas.'),
(90, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Eveniet ut voluptatem.', 250.00, 8, 3, 0, 3, 65, '2016-02-18', '2016-02-28', 'Similique officia necessitatibus officiis iure doloremque enim. Architecto aliquid non esse sit assumenda odit.'),
(91, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Placeat omnis expedita est.', 650.00, 6, 6, 0, 1, 73, '2015-07-03', '2015-07-16', 'Ut sint officia molestias aut. Dolores earum id veritatis dolores. Sunt reprehenderit et at eos neque labore.'),
(92, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Recusandae cupiditate.', 60.00, 3, 1, 0, 3, 66, '2015-11-07', '2015-11-12', 'Aspernatur veniam officiis eveniet. Sed cum non sint qui minus fugiat nisi. Qui qui quidem vel nihil minus culpa omnis numquam. Ad libero iusto sed earum a.'),
(93, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Commodi itaque omnis aut.', 580.00, 8, 6, 0, 3, 69, '2015-06-24', '2015-06-25', 'Cumque corrupti optio id. Vero quasi sapiente consequuntur nihil ratione rerum.\nError labore odio ipsam cupiditate. Quis ipsam est aut aut labore veniam non. Vel quas vel repellat incidunt ex.'),
(94, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Enim provident quia modi sunt.', 220.00, 4, 8, 0, 4, 65, '2015-07-29', '2015-08-01', 'Esse vero aperiam debitis voluptatem non. Voluptatem dolor qui et laboriosam. Rerum suscipit optio iure beatae unde placeat molestias. Voluptas iusto nam nam nemo molestiae non.'),
(95, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Velit sed tempora molestias.', 80.00, 5, 2, 0, 2, 71, '2016-03-01', '2016-03-01', 'Est delectus in explicabo aut. Minus nobis quis tempora ut. Ut quae fugit porro ut aperiam. Ex voluptatem dignissimos cumque vitae cupiditate necessitatibus quisquam commodi.'),
(96, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Temporibus occaecati aut sed labore labore dolorem', 860.00, 2, 3, 0, 1, 68, '2015-11-05', '2015-11-12', 'Non omnis veritatis impedit consectetur non sunt. At ut ullam doloremque est. Dolorem ex dolor voluptatibus quisquam laudantium. Omnis voluptas deserunt fugit et et ut aspernatur.'),
(97, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Facere adipisci.', 410.00, 2, 3, 0, 1, 64, '2015-06-20', '2015-06-27', 'Et et eum exercitationem quo et. Qui asperiores odio eum consequatur repellat blanditiis. Aliquam sint soluta enim nulla.'),
(98, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Explicabo officia voluptates sapiente.', 110.00, 7, 2, 0, 4, 64, '2015-07-14', '2015-07-14', 'Amet qui aut quo quia perspiciatis debitis et. Natus facilis aut qui quos deserunt. Cumque praesentium exercitationem numquam autem eum. Dolores accusantium sapiente dolorum harum quia ipsa a.'),
(99, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Aut sed.', 950.00, 8, 9, 0, 4, 70, '2015-12-29', '2016-01-06', 'Repudiandae enim ut suscipit provident. Debitis sapiente ab cumque in deleniti.'),
(100, 'Property', '2015-03-12 00:17:37', '2015-04-08 03:01:08', 'Et vero.', 930.00, 9, 4, 0, 2, 65, '2016-02-09', '2016-02-19', 'Qui quis quis sit ipsam aspernatur qui. Nihil beatae quia neque consequatur odit et. Excepturi totam et rerum officia reiciendis odit fuga. Voluptates quo rerum quam sunt nam magnam.');

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

DROP TABLE IF EXISTS `RedirectorPage`;
CREATE TABLE IF NOT EXISTS `RedirectorPage` (
`ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

DROP TABLE IF EXISTS `RedirectorPage_Live`;
CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
`ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

DROP TABLE IF EXISTS `RedirectorPage_versions`;
CREATE TABLE IF NOT EXISTS `RedirectorPage_versions` (
`ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
CREATE TABLE IF NOT EXISTS `Region` (
`ID` int(11) NOT NULL,
  `ClassName` enum('Region') DEFAULT 'Region',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Description` mediumtext,
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `RegionsPageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Region`
--

INSERT INTO `Region` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Description`, `PhotoID`, `RegionsPageID`) VALUES
(1, 'Region', '2015-03-12 00:03:44', '2015-04-08 02:52:14', 'The Northeast', 'Vivamus commodo venenatis mi, quis efficitur ante semper eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus placerat suscipit metus.', 78, 8),
(2, 'Region', '2015-03-12 00:04:20', '2015-04-08 02:52:14', 'The Southeast', 'Nam mattis lacus quam, sed tristique nulla accumsan fermentum. Sed sapien sapien, vehicula et libero sit amet, maximus ullamcorper augue. Sed accumsan ante tellus, a elementum enim pharetra nec.', 75, 8),
(3, 'Region', '2015-03-12 00:04:47', '2015-04-08 02:53:38', 'The Northwest', '<p>Praesent consectetur nisl nibh, in sagittis quam tempor non. Praesent convallis massa quis turpis vulputate feugiat.</p>', 76, 8),
(4, 'Region', '2015-03-12 00:05:14', '2015-04-08 02:53:53', 'The Southwest', '<p>Nullam et commodo erat. Suspendisse id nisi quis enim bibendum sagittis at nec sapien. Fusce auctor, augue sed efficitur auctor, purus justo tincidunt magna, auctor sodales eros eros quis nunc.</p>', 77, 8);

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

DROP TABLE IF EXISTS `SiteConfig`;
CREATE TABLE IF NOT EXISTS `SiteConfig` (
`ID` int(11) NOT NULL,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `FacebookLink` varchar(50) DEFAULT NULL,
  `TwitterLink` varchar(50) DEFAULT NULL,
  `GoogleLink` varchar(50) DEFAULT NULL,
  `YouTubeLink` varchar(50) DEFAULT NULL,
  `FooterContent` mediumtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `Created`, `LastEdited`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `FacebookLink`, `TwitterLink`, `GoogleLink`, `YouTubeLink`, `FooterContent`) VALUES
(1, 'SiteConfig', '2015-03-11 00:37:52', '2015-03-12 00:25:46', 'One Ring Rentals', NULL, 'one-ring', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.google.com', 'http://www.youtube.com', 'Sed enim sem, efficitur a ante finibus, iaculis pretium lacus. Quisque odio felis, consequat eu metus id, vestibulum posuere quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
`ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
`ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
`ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

DROP TABLE IF EXISTS `SiteTree`;
CREATE TABLE IF NOT EXISTS `SiteTree` (
`ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','ArticleHolder','ArticlePage','HomePage','PropertySearchPage','RegionsPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2015-03-11 00:37:52', '2015-03-11 00:47:31', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(2, 'Page', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(4, 'ErrorPage', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 8, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 9, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'PropertySearchPage', '2015-03-11 00:38:58', '2015-04-07 02:27:31', 'find-a-rental', 'Find a Rental', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 4, 0),
(7, 'Page', '2015-03-11 00:39:21', '2015-03-12 00:05:33', 'list-your-rental', 'List Your Rental', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(8, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:40:15', 'regions', 'Regions', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 5, 0),
(9, 'ArticleHolder', '2015-03-11 00:40:25', '2015-03-11 00:42:44', 'travel-guides', 'Travel Guides', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(10, 'ArticlePage', '2015-03-11 00:42:48', '2015-03-11 00:44:29', 'sample-article-1', 'Sample Article 1', NULL, '<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2, 9),
(11, 'ArticlePage', '2015-03-11 00:44:35', '2015-03-11 00:45:49', 'sample-article-2', 'Sample Article 2', NULL, '<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 2, 9),
(12, 'ArticlePage', '2015-03-11 00:45:53', '2015-03-11 00:46:44', 'sample-article-3', 'Sample Article 3', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo. Etiam ut nibh at est laoreet dignissim at ut justo. Quisque ipsum nisi, tempor dapibus luctus eu, efficitur luctus nisi. In maximus vehicula dolor. Nunc ultrices nibh a efficitur pellentesque. Duis ut euismod eros. Mauris eu ipsum augue.</p>\n<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p> </p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

DROP TABLE IF EXISTS `SiteTree_EditorGroups`;
CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
`ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

DROP TABLE IF EXISTS `SiteTree_ImageTracking`;
CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
`ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

DROP TABLE IF EXISTS `SiteTree_LinkTracking`;
CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
`ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

DROP TABLE IF EXISTS `SiteTree_Live`;
CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
`ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','ArticleHolder','ArticlePage','HomePage','PropertySearchPage','RegionsPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2015-03-11 00:37:52', '2015-04-08 02:47:20', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(2, 'Page', '2015-03-11 00:37:53', '2015-04-08 02:47:21', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(4, 'ErrorPage', '2015-03-11 00:37:53', '2015-04-08 02:47:21', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 8, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-03-11 00:37:53', '2015-04-08 02:47:21', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 9, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'PropertySearchPage', '2015-03-11 00:38:58', '2015-04-08 02:47:20', 'find-a-rental', 'Find a Rental', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 4, 0),
(7, 'Page', '2015-03-11 00:39:21', '2015-04-08 02:47:20', 'list-your-rental', 'List Your Rental', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(8, 'RegionsPage', '2015-03-11 00:39:41', '2015-04-08 02:47:21', 'regions', 'Regions', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 5, 0),
(9, 'ArticleHolder', '2015-03-11 00:40:25', '2015-04-08 02:47:21', 'travel-guides', 'Travel Guides', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(10, 'ArticlePage', '2015-03-11 00:42:48', '2015-04-08 02:52:13', 'sample-article-1', 'Sample Article 1', NULL, '<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 3, 9),
(11, 'ArticlePage', '2015-03-11 00:44:35', '2015-04-08 02:52:13', 'sample-article-2', 'Sample Article 2', NULL, '<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 3, 9),
(12, 'ArticlePage', '2015-03-11 00:45:53', '2015-04-08 02:52:13', 'sample-article-3', 'Sample Article 3', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo. Etiam ut nibh at est laoreet dignissim at ut justo. Quisque ipsum nisi, tempor dapibus luctus eu, efficitur luctus nisi. In maximus vehicula dolor. Nunc ultrices nibh a efficitur pellentesque. Duis ut euismod eros. Mauris eu ipsum augue.</p>\n<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p> </p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

DROP TABLE IF EXISTS `SiteTree_versions`;
CREATE TABLE IF NOT EXISTS `SiteTree_versions` (
`ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','ArticleHolder','ArticlePage','HomePage','PropertySearchPage','RegionsPage','ErrorPage','RedirectorPage','VirtualPage') DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `Created`, `LastEdited`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 1, 1, 'Page', '2015-03-11 00:37:52', '2015-03-11 00:37:52', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 1, 1, 'Page', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 1, 1, 'Page', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 1, 1, 'ErrorPage', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 1, 1, 'ErrorPage', '2015-03-11 00:37:53', '2015-03-11 00:37:53', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 1, 2, 1, 1, 1, 'HomePage', '2015-03-11 00:37:52', '2015-03-11 00:38:46', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(7, 6, 1, 0, 1, 0, 'Page', '2015-03-11 00:38:58', '2015-03-11 00:38:58', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(8, 6, 2, 1, 1, 1, 'Page', '2015-03-11 00:38:58', '2015-03-11 00:39:06', 'find-a-rental', 'Find a Rental', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(9, 6, 3, 1, 1, 1, 'Page', '2015-03-11 00:38:58', '2015-03-11 00:39:10', 'find-a-rental', 'Find a Rental', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(10, 7, 1, 0, 1, 0, 'Page', '2015-03-11 00:39:21', '2015-03-11 00:39:21', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(11, 7, 2, 1, 1, 1, 'Page', '2015-03-11 00:39:21', '2015-03-11 00:39:29', 'list-your-rental', 'List Your Rental', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(12, 7, 3, 1, 1, 1, 'Page', '2015-03-11 00:39:21', '2015-03-11 00:39:33', 'list-your-rental', 'List Your Rental', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(13, 8, 1, 0, 1, 0, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:39:41', 'new-regions-page', 'New Regions Page', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(14, 8, 2, 1, 1, 1, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:39:48', 'regions-page', 'Regions Page', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(15, 8, 3, 0, 1, 0, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:39:52', 'regions-page', 'Regions Page', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(16, 8, 4, 1, 1, 1, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:40:01', 'regions-page', 'Regions', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(17, 8, 5, 1, 1, 1, 'RegionsPage', '2015-03-11 00:39:41', '2015-03-11 00:40:15', 'regions', 'Regions', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(18, 9, 1, 0, 1, 0, 'ArticleHolder', '2015-03-11 00:40:25', '2015-03-11 00:40:25', 'new-article-holder', 'New Article Holder', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(19, 9, 2, 1, 1, 1, 'ArticleHolder', '2015-03-11 00:40:25', '2015-03-11 00:40:39', 'travel-guides', 'Travel Guides', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(20, 9, 3, 1, 1, 1, 'ArticleHolder', '2015-03-11 00:40:25', '2015-03-11 00:40:43', 'travel-guides', 'Travel Guides', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(21, 10, 1, 0, 1, 0, 'ArticlePage', '2015-03-11 00:42:48', '2015-03-11 00:42:48', 'new-article-page', 'New Article Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(22, 10, 2, 1, 1, 1, 'ArticlePage', '2015-03-11 00:42:48', '2015-03-11 00:44:29', 'sample-article-1', 'Sample Article 1', NULL, '<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(23, 11, 1, 0, 1, 0, 'ArticlePage', '2015-03-11 00:44:35', '2015-03-11 00:44:35', 'new-article-page', 'New Article Page', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(24, 11, 2, 1, 1, 1, 'ArticlePage', '2015-03-11 00:44:35', '2015-03-11 00:45:49', 'sample-article-2', 'Sample Article 2', NULL, '<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(25, 12, 1, 0, 1, 0, 'ArticlePage', '2015-03-11 00:45:53', '2015-03-11 00:45:53', 'new-article-page', 'New Article Page', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(26, 12, 2, 1, 1, 1, 'ArticlePage', '2015-03-11 00:45:53', '2015-03-11 00:46:44', 'sample-article-3', 'Sample Article 3', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo. Etiam ut nibh at est laoreet dignissim at ut justo. Quisque ipsum nisi, tempor dapibus luctus eu, efficitur luctus nisi. In maximus vehicula dolor. Nunc ultrices nibh a efficitur pellentesque. Duis ut euismod eros. Mauris eu ipsum augue.</p>\n<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p> </p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(27, 1, 3, 1, 1, 1, 'HomePage', '2015-03-11 00:37:52', '2015-03-11 00:47:31', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(28, 6, 4, 1, 1, 1, 'PropertySearchPage', '2015-03-11 00:38:58', '2015-04-07 02:27:31', 'find-a-rental', 'Find a Rental', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(29, 10, 3, 0, 1, 0, 'ArticlePage', '2015-03-11 00:42:48', '2015-04-08 02:52:13', 'sample-article-1', 'Sample Article 1', NULL, '<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(30, 11, 3, 0, 1, 0, 'ArticlePage', '2015-03-11 00:44:35', '2015-04-08 02:52:13', 'sample-article-2', 'Sample Article 2', NULL, '<p>Praesent sodales, elit vitae efficitur rhoncus, tortor quam hendrerit quam, nec lacinia ligula felis et nibh. Sed vulputate dui id lacus placerat tincidunt. Morbi vestibulum tincidunt dignissim. Suspendisse ac sem velit. Phasellus non gravida tellus. Donec ac rhoncus nisl. Nam non dignissim erat. Aliquam faucibus nulla urna, ut scelerisque magna semper at. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla eu est vel nisi viverra dignissim. Vestibulum tempor in odio vel interdum. Aliquam nec velit ac nisl egestas aliquet. Morbi eleifend, urna vel porttitor posuere, neque elit vehicula est, id tempor est massa at ante. Ut eu maximus lacus, congue tristique mauris. Aliquam purus dui, luctus sed hendrerit ut, venenatis eu libero. Curabitur sed quam elementum, cursus urna quis, imperdiet ante.</p>\n<p>Duis quis neque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam cursus aliquam lorem, eget pellentesque metus fermentum eu. Mauris sit amet fringilla odio. Nunc ut egestas dolor, ut consequat dolor. Curabitur imperdiet ipsum imperdiet enim eleifend, vitae pulvinar dui dapibus. Pellentesque purus ipsum, feugiat sit amet iaculis at, elementum eu arcu. Vivamus a lectus ac nisi molestie fermentum porttitor quis turpis. Vestibulum eget eros eu dui consectetur malesuada ac eu libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam non sem id ipsum mattis ornare. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras volutpat auctor risus, in laoreet elit ullamcorper eget. Nunc dui risus, commodo vel placerat ut, euismod at dui.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 9),
(31, 12, 3, 0, 1, 0, 'ArticlePage', '2015-03-11 00:45:53', '2015-04-08 02:52:13', 'sample-article-3', 'Sample Article 3', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at diam porttitor, euismod sem ac, scelerisque felis. In id felis lorem. Nunc a accumsan justo. Etiam ut nibh at est laoreet dignissim at ut justo. Quisque ipsum nisi, tempor dapibus luctus eu, efficitur luctus nisi. In maximus vehicula dolor. Nunc ultrices nibh a efficitur pellentesque. Duis ut euismod eros. Mauris eu ipsum augue.</p>\n<p>Praesent porttitor augue gravida porttitor ultricies. Donec accumsan accumsan ligula eget luctus. Donec finibus fermentum rhoncus. Phasellus commodo urna eu augue porta sollicitudin. Nunc porttitor condimentum nisi ac efficitur. Pellentesque quis est auctor libero elementum malesuada. Cras quis augue tempus, pretium turpis non, egestas velit. Mauris pellentesque cursus enim a consectetur. Duis ac lacus sit amet neque rutrum aliquet ac in nunc. Quisque euismod vestibulum ipsum. Suspendisse tincidunt ultrices vulputate. In hac habitasse platea dictumst. Suspendisse gravida nunc quis eros ultrices pretium. Phasellus sit amet dictum mauris. Aliquam vehicula nulla vitae hendrerit consequat. Duis ligula ex, elementum sed volutpat at, laoreet sit amet lectus.</p>\n<p> </p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 9);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;
CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
`ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

DROP TABLE IF EXISTS `VirtualPage`;
CREATE TABLE IF NOT EXISTS `VirtualPage` (
`ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

DROP TABLE IF EXISTS `VirtualPage_Live`;
CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
`ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

DROP TABLE IF EXISTS `VirtualPage_versions`;
CREATE TABLE IF NOT EXISTS `VirtualPage_versions` (
`ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ArticleCategory`
--
ALTER TABLE `ArticleCategory`
 ADD PRIMARY KEY (`ID`), ADD KEY `ArticleHolderID` (`ArticleHolderID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `ArticleComment`
--
ALTER TABLE `ArticleComment`
 ADD PRIMARY KEY (`ID`), ADD KEY `ArticlePageID` (`ArticlePageID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `ArticlePage`
--
ALTER TABLE `ArticlePage`
 ADD PRIMARY KEY (`ID`), ADD KEY `PhotoID` (`PhotoID`), ADD KEY `BrochureID` (`BrochureID`);

--
-- Indexes for table `ArticlePage_Categories`
--
ALTER TABLE `ArticlePage_Categories`
 ADD PRIMARY KEY (`ID`), ADD KEY `ArticlePageID` (`ArticlePageID`), ADD KEY `ArticleCategoryID` (`ArticleCategoryID`);

--
-- Indexes for table `ArticlePage_Live`
--
ALTER TABLE `ArticlePage_Live`
 ADD PRIMARY KEY (`ID`), ADD KEY `PhotoID` (`PhotoID`), ADD KEY `BrochureID` (`BrochureID`);

--
-- Indexes for table `ArticlePage_versions`
--
ALTER TABLE `ArticlePage_versions`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`), ADD KEY `RecordID` (`RecordID`), ADD KEY `Version` (`Version`), ADD KEY `PhotoID` (`PhotoID`), ADD KEY `BrochureID` (`BrochureID`);

--
-- Indexes for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_versions`
--
ALTER TABLE `ErrorPage_versions`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`), ADD KEY `RecordID` (`RecordID`), ADD KEY `Version` (`Version`);

--
-- Indexes for table `File`
--
ALTER TABLE `File`
 ADD PRIMARY KEY (`ID`), ADD KEY `ParentID` (`ParentID`), ADD KEY `OwnerID` (`OwnerID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Group`
--
ALTER TABLE `Group`
 ADD PRIMARY KEY (`ID`), ADD KEY `ParentID` (`ParentID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Group_Members`
--
ALTER TABLE `Group_Members`
 ADD PRIMARY KEY (`ID`), ADD KEY `GroupID` (`GroupID`), ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
 ADD PRIMARY KEY (`ID`), ADD KEY `GroupID` (`GroupID`), ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indexes for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
 ADD PRIMARY KEY (`ID`), ADD KEY `MemberID` (`MemberID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Member`
--
ALTER TABLE `Member`
 ADD PRIMARY KEY (`ID`), ADD KEY `Email` (`Email`(255)), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
 ADD PRIMARY KEY (`ID`), ADD KEY `MemberID` (`MemberID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Permission`
--
ALTER TABLE `Permission`
 ADD PRIMARY KEY (`ID`), ADD KEY `GroupID` (`GroupID`), ADD KEY `Code` (`Code`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
 ADD PRIMARY KEY (`ID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
 ADD PRIMARY KEY (`ID`), ADD KEY `RoleID` (`RoleID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Property`
--
ALTER TABLE `Property`
 ADD PRIMARY KEY (`ID`), ADD KEY `RegionID` (`RegionID`), ADD KEY `PrimaryPhotoID` (`PrimaryPhotoID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
 ADD PRIMARY KEY (`ID`), ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
 ADD PRIMARY KEY (`ID`), ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `RedirectorPage_versions`
--
ALTER TABLE `RedirectorPage_versions`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`), ADD KEY `RecordID` (`RecordID`), ADD KEY `Version` (`Version`), ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `Region`
--
ALTER TABLE `Region`
 ADD PRIMARY KEY (`ID`), ADD KEY `PhotoID` (`PhotoID`), ADD KEY `RegionsPageID` (`RegionsPageID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
 ADD PRIMARY KEY (`ID`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteConfigID` (`SiteConfigID`), ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteConfigID` (`SiteConfigID`), ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteConfigID` (`SiteConfigID`), ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree`
--
ALTER TABLE `SiteTree`
 ADD PRIMARY KEY (`ID`), ADD KEY `ParentID` (`ParentID`), ADD KEY `URLSegment` (`URLSegment`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteTreeID` (`SiteTreeID`), ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree_ImageTracking`
--
ALTER TABLE `SiteTree_ImageTracking`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteTreeID` (`SiteTreeID`), ADD KEY `FileID` (`FileID`);

--
-- Indexes for table `SiteTree_LinkTracking`
--
ALTER TABLE `SiteTree_LinkTracking`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteTreeID` (`SiteTreeID`), ADD KEY `ChildID` (`ChildID`);

--
-- Indexes for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
 ADD PRIMARY KEY (`ID`), ADD KEY `ParentID` (`ParentID`), ADD KEY `URLSegment` (`URLSegment`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_versions`
--
ALTER TABLE `SiteTree_versions`
 ADD PRIMARY KEY (`ID`), ADD KEY `RecordID_Version` (`RecordID`,`Version`), ADD KEY `RecordID` (`RecordID`), ADD KEY `Version` (`Version`), ADD KEY `AuthorID` (`AuthorID`), ADD KEY `PublisherID` (`PublisherID`), ADD KEY `ParentID` (`ParentID`), ADD KEY `URLSegment` (`URLSegment`), ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
 ADD PRIMARY KEY (`ID`), ADD KEY `SiteTreeID` (`SiteTreeID`), ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
 ADD PRIMARY KEY (`ID`), ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
 ADD PRIMARY KEY (`ID`), ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_versions`
--
ALTER TABLE `VirtualPage_versions`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`), ADD KEY `RecordID` (`RecordID`), ADD KEY `Version` (`Version`), ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ArticleCategory`
--
ALTER TABLE `ArticleCategory`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ArticleComment`
--
ALTER TABLE `ArticleComment`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ArticlePage`
--
ALTER TABLE `ArticlePage`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ArticlePage_Categories`
--
ALTER TABLE `ArticlePage_Categories`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ArticlePage_Live`
--
ALTER TABLE `ArticlePage_Live`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ArticlePage_versions`
--
ALTER TABLE `ArticlePage_versions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ErrorPage_versions`
--
ALTER TABLE `ErrorPage_versions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `File`
--
ALTER TABLE `File`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `Group`
--
ALTER TABLE `Group`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Group_Members`
--
ALTER TABLE `Group_Members`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Member`
--
ALTER TABLE `Member`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Permission`
--
ALTER TABLE `Permission`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Property`
--
ALTER TABLE `Property`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RedirectorPage_versions`
--
ALTER TABLE `RedirectorPage_versions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Region`
--
ALTER TABLE `Region`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree`
--
ALTER TABLE `SiteTree`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_ImageTracking`
--
ALTER TABLE `SiteTree_ImageTracking`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_LinkTracking`
--
ALTER TABLE `SiteTree_LinkTracking`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `SiteTree_versions`
--
ALTER TABLE `SiteTree_versions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage_versions`
--
ALTER TABLE `VirtualPage_versions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;