CREATE DATABASE  IF NOT EXISTS `uat_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uat_user`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 68.178.164.174    Database: uat_user
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allergy_master`
--

DROP TABLE IF EXISTS `allergy_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy_master` (
  `allergy_id` int NOT NULL AUTO_INCREMENT,
  `allergy_name` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`allergy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `ArticleID` int NOT NULL AUTO_INCREMENT,
  `articleImage` varchar(500) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `AuthorDesignation` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT NULL,
  `ArticleContent` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ArticleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `Blog_ID` int NOT NULL AUTO_INCREMENT,
  `CategoryId` int DEFAULT NULL,
  `Header` varchar(250) DEFAULT NULL,
  `SubHeader` varchar(250) DEFAULT NULL,
  `Body` longtext,
  `AnchorImage` varchar(500) DEFAULT NULL,
  `Keywords` varchar(500) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `AuthorName` varchar(250) DEFAULT NULL,
  `BlogDate` varchar(45) DEFAULT NULL,
  `EssId1` int DEFAULT '0',
  `EssId2` int DEFAULT '0',
  `EssId3` int DEFAULT '0',
  `EssId4` int DEFAULT '0',
  `EssId5` int DEFAULT '0',
  `ReadingTime` int DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Description` longtext,
  `Url` longtext,
  PRIMARY KEY (`Blog_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blogtype`
--

DROP TABLE IF EXISTS `blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogtype` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `BlogId` int DEFAULT NULL,
  `BlogType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `BlogId_UNIQUE` (`BlogId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `BlogId` int DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `IsBookmarked` bit(1) DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinic_categories`
--

DROP TABLE IF EXISTS `clinic_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Clinic_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condition_master`
--

DROP TABLE IF EXISTS `condition_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition_master` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ConditionName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consentartefacts`
--

DROP TABLE IF EXISTS `consentartefacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consentartefacts` (
  `ConsentId` varchar(100) NOT NULL,
  `ConsentRequestId` varchar(100) DEFAULT NULL,
  `HIUId` varchar(100) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `PatientId` varchar(100) DEFAULT NULL,
  `ConsentArtefact` text,
  `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConsentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consetartefacts`
--

DROP TABLE IF EXISTS `consetartefacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consetartefacts` (
  `ConsentId` varchar(100) NOT NULL,
  `ConsentRequestId` varchar(100) DEFAULT NULL,
  `HIUId` varchar(100) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `PatientId` varchar(100) DEFAULT NULL,
  `ConsentArtefact` text,
  `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConsentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrylist`
--

DROP TABLE IF EXISTS `countrylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryname` text,
  `dialingcode` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrylist2`
--

DROP TABLE IF EXISTS `countrylist2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylist2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `countryname` text NOT NULL,
  `dialingcode` varchar(100) NOT NULL,
  `isocode` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrylistbk`
--

DROP TABLE IF EXISTS `countrylistbk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylistbk` (
  `id` int NOT NULL DEFAULT '0',
  `countryname` text,
  `dialingcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dental_clinics`
--

DROP TABLE IF EXISTS `dental_clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dental_clinics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `offer` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `clinic` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Category` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussions` (
  `DiscussionId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Content` text,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DiscussionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disease_master`
--

DROP TABLE IF EXISTS `disease_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_master` (
  `disease_id` int NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forumposts`
--

DROP TABLE IF EXISTS `forumposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forumposts` (
  `forumpostid` int NOT NULL AUTO_INCREMENT,
  `PostID` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `PostText` text NOT NULL,
  `PostDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumpostid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labadmins`
--

DROP TABLE IF EXISTS `labadmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labadmins` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `LabId` int NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EpochTime` bigint NOT NULL,
  `IsMain` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labmembers`
--

DROP TABLE IF EXISTS `labmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labmembers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `LabId` int NOT NULL,
  `Role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CreatedBy` int NOT NULL,
  `DeletedBy` int NOT NULL,
  `EpochTime` bigint NOT NULL,
  `PromotedBy` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labotpentries`
--

DROP TABLE IF EXISTS `labotpentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labotpentries` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `OtpCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ExpiryTime` datetime(6) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labsignupusers`
--

DROP TABLE IF EXISTS `labsignupusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labsignupusers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LabName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Pincode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedAtEpoch` bigint NOT NULL,
  `HFID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `LabReference` int NOT NULL DEFAULT '0',
  `IsSuperAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `DeletedBy` int NOT NULL DEFAULT '0',
  `ProfilePhoto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_LabSignupUsers_HFID` (`HFID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labuserreports`
--

DROP TABLE IF EXISTS `labuserreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labuserreports` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `EpochTime` bigint NOT NULL,
  `LabId` int NOT NULL DEFAULT '0',
  `BranchId` int NOT NULL DEFAULT '0',
  `Resend` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserReferenceId` int DEFAULT NULL,
  `MemberType` int DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `RelationType` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `PhoneNo` varchar(100) DEFAULT NULL,
  `AltPhoneNo` varchar(100) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `otp_code` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3897 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `PostId` int NOT NULL AUTO_INCREMENT,
  `DiscussionId` int DEFAULT NULL,
  `Content` text,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportmaster`
--

DROP TABLE IF EXISTS `reportmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportmaster` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scp`
--

DROP TABLE IF EXISTS `scp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19099 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblemployee` (
  `ID` int DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblreportaccess`
--

DROP TABLE IF EXISTS `tblreportaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblreportaccess` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `ReportId` int DEFAULT NULL,
  `AccessTo` varchar(100) DEFAULT NULL,
  `IsActive` tinyint DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `AccessMappingId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblrequest`
--

DROP TABLE IF EXISTS `tblrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrequest` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SentBy` int DEFAULT NULL,
  `Receivedby` int DEFAULT NULL,
  `Accepted` int DEFAULT NULL,
  `Rejected` int DEFAULT NULL,
  `Requested` int DEFAULT NULL,
  `Isactive` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Sent` int DEFAULT '0',
  `IsDependent` int DEFAULT '0',
  `DependentUserId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_allergy`
--

DROP TABLE IF EXISTS `user_allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_allergy` (
  `user_allergy_id` int NOT NULL AUTO_INCREMENT,
  `allergy_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `yesNo` int DEFAULT NULL,
  PRIMARY KEY (`user_allergy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(80) DEFAULT NULL,
  `user_lastname` varchar(80) DEFAULT NULL,
  `user_gender` varchar(45) DEFAULT NULL,
  `user_dob` varchar(45) DEFAULT NULL,
  `user_bloodgroup` varchar(80) DEFAULT NULL,
  `user_state` varchar(80) DEFAULT NULL,
  `user_city` varchar(80) DEFAULT NULL,
  `user_country` varchar(80) DEFAULT NULL,
  `user_contact` varchar(45) DEFAULT NULL,
  `user_icecontact` varchar(45) DEFAULT NULL,
  `user_relativecontact` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_doctor` varchar(45) DEFAULT NULL,
  `user_membernumber` varchar(100) DEFAULT NULL,
  `user_height` double DEFAULT NULL,
  `user_weight` double DEFAULT NULL,
  `user_smoke` int DEFAULT NULL,
  `user_alcohol` int DEFAULT NULL,
  `user_image` varchar(250) DEFAULT NULL,
  `user_password` varchar(64) DEFAULT NULL,
  `user_reference` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `user_isactive` int DEFAULT '1',
  `generated_key` varchar(45) DEFAULT NULL,
  `user_relation` varchar(45) DEFAULT NULL,
  `user_request` int DEFAULT NULL,
  `user_response` int DEFAULT NULL,
  `req_sentto` int DEFAULT NULL,
  `req_receivedby` int DEFAULT NULL,
  `countrycode` varchar(255) DEFAULT NULL,
  `subscriptionplan_status` varchar(50) DEFAULT 'Basic',
  `abha_card_image` varchar(500) DEFAULT NULL,
  `date_ofsubscriptionPlan` datetime DEFAULT NULL,
  `date_ofExpiryPlan` datetime DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_disease`
--

DROP TABLE IF EXISTS `user_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_disease` (
  `user_disease_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `disease_id` int DEFAULT NULL,
  `user_self` varchar(20) DEFAULT NULL,
  `user_mother` varchar(20) DEFAULT NULL,
  `user_father` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_familyprescription`
--

DROP TABLE IF EXISTS `user_familyprescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_familyprescription` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `MemberId` int NOT NULL,
  `Conditions` varchar(255) NOT NULL,
  `Medication` varchar(255) NOT NULL,
  `Power` varchar(255) NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  `Timings` varchar(255) NOT NULL,
  `DateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `UserId` int NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `AccessTo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `otherConditions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_medications`
--

DROP TABLE IF EXISTS `user_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_medications` (
  `medication_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `medication_name` varchar(200) NOT NULL,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_prescriptionaccess`
--

DROP TABLE IF EXISTS `user_prescriptionaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_prescriptionaccess` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `AccessTo` varchar(455) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_reports`
--

DROP TABLE IF EXISTS `user_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reports` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `ReportName` varchar(500) DEFAULT NULL,
  `MemberId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ReportUrl` varchar(500) DEFAULT NULL,
  `ReportId` int DEFAULT NULL,
  `IsActive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CreatedDate` datetime DEFAULT NULL,
  `AccessMappingId` varchar(45) DEFAULT NULL,
  `FileSize` double NOT NULL DEFAULT '0',
  `UploadType` varchar(45) DEFAULT NULL,
  `newIsActive` varchar(10) DEFAULT NULL,
  `UploadedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LabId` int DEFAULT NULL,
  `LabUserReportId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_surgery_details`
--

DROP TABLE IF EXISTS `user_surgery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_surgery_details` (
  `user_surgery_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_surgery_details` varchar(200) DEFAULT NULL,
  `user_surgery_year` varchar(45) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `drname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_surgery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usp_userfeedback`
--

DROP TABLE IF EXISTS `usp_userfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usp_userfeedback` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `DateCr` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wellness_kit`
--

DROP TABLE IF EXISTS `wellness_kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wellness_kit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AnchorImage` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'uat_user'
--
/*!50003 DROP PROCEDURE IF EXISTS `"usp_removeBookmark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `"usp_removeBookmark`(_BlogId int)
BEGIN
if exists(select BlogId from Bookmark where BlogId =_BlogId)
then
delete from  Bookmark where BlogId= _BlogId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adduser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adduser`(`_user_firstname` varchar(80) , `_user_lastname` varchar(80), `_user_gender` varchar(45), `_user_dob`varchar(45), `_user_bloodgroup`varchar(80), `_user_state` varchar(80), `_user_city`varchar(80), `_user_country`varchar(80), `_user_contact`varchar(45), `_user_icecontact`varchar(45), `_user_relativecontact`varchar(45), `_user_email`varchar(45), `_user_doctor`varchar(45), `_user_membernumber`varchar(100),`_user_creater`int)
BEGIN
Insert into user_details (user_firstname, user_lastname, user_gender, user_dob, user_bloodgroup, user_state, user_city, user_country, user_contact, user_icecontact, user_relativecontact, user_email, user_doctor, user_membernumber,user_creater) 
VALUES (`_user_firstname`, `_user_lastname`, `_user_gender`, `_user_dob`, `_user_bloodgroup`, `_user_state`, `_user_city`, `_user_country`, `_user_contact`, `_user_icecontact`, `_user_relativecontact`, `_user_email`, `_user_doctor`, `_user_membernumber`,`_user_creater`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adduser_surgery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `adduser_surgery`(
`_user_id` INT, 
`_user_surgery_details` VARCHAR(500), 
`_user_surgery_id` VARCHAR(500), 
`_user_surgery_year` VARCHAR(500), 
`_SpType` Varchar(10), 
OUT _Result INT
)
BEGIN
	IF(_SpType = 'C')
    THEN    
		INSERT INTO user_surgery_details(user_id, user_surgery_details, user_surgery_year)
        VALUE(_user_id, _user_surgery_details, _user_surgery_year);
        SET _Result = last_insert_id();
    END IF;
    
   /* IF(_SpType = 'U')
    THEN
		-- SELECT Id, UserId, ReportName, ReportUrl, ReportId, IsActive, CreatedDate FROM user_reports;
		UPDATE user_reports SET name = _name, phone = _phone, email= _email, subject = _subject, message = _message, Isactive = 'Active'
        WHERE Id = _Id;
        SET _Result = _Id;
    END IF;
    
    IF(_SpType = 'D')
    THEN
		UPDATE tblcontact SET Isactive = 'Deactive'
        WHERE Id = _Id;
        SET _Result = _Id;
    END IF;
    
-- SELECT Id, name, phone, email, subject, message, createddate FROM db_letslearnindia.tblcontact;
    IF(_SpType = 'E')
    THEN
		SELECT * FROM tblcontact WHERE Id = _Id;
    END IF;
    */
    IF(_SpType = 'R')
    THEN
		SELECT user_surgery_details, user_surgery_year from user_surgery_details where user_id=`_user_id` ;
	END IF;
    
    IF(_SpType = 'D')
    THEN
		delete  from user_surgery_details where user_id=`_user_id` and user_surgery_id =_user_surgery_id ;
       
        /*SET _Result = _Id;*/
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_update_allergy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `add_update_allergy`(`_user_id` int, `_allergy_id` int, `_yesNo` int)
BEGIN
	IF NOT Exists(Select 1 FROM user_allergy WHERE user_id = _user_id and allergy_id = _allergy_id)
	THEN
		INSERT INTO user_allergy(user_id, allergy_id, yesNo) 
						  Values(_user_id, _allergy_id, _yesNo);
	ELSE 
		UPDATE user_allergy SET yesNo = `_yesNo` WHERE user_id = _user_id and allergy_id = _allergy_id ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_update_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `add_update_disease`(`_user_id` int, `_disease_id` int, `_user_self` int, `_user_mother` int, `_user_father` int)
BEGIN
	IF NOT Exists(Select 1 FROM user_disease WHERE user_id = _user_id and disease_id= _disease_id)
	THEN
		INSERT INTO user_disease(user_id, disease_id, user_self, user_mother, user_father) 
						  Values(_user_id, _disease_id, _user_self, _user_mother, _user_father);
	ELSE 
		UPDATE user_disease SET user_self =_user_self , user_mother = _user_mother, user_father = _user_father WHERE user_id = _user_id and disease_id = _disease_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_update_userdetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `add_update_userdetails`(`_user_firstname` varchar(80) , `_user_lastname` varchar(80),`_user_dob`varchar(45), `_user_contact`varchar(45), `_user_email`varchar(45), `_user_gender` varchar(45), `_user_bloodgroup`varchar(80), `_user_pincode`varchar(80), `_user_state` varchar(80), `_user_city`varchar(80), `_user_icecontact`varchar(45), `_user_membernumber`varchar(100),_user_image varchar(500), _user_id varchar(100),_countrycode varchar(100))
BEGIN
IF NOT Exists(Select 1 FROM user_details WHERE user_email = _user_email)
then
Insert into user_details (user_firstname, user_lastname,user_dob,user_contact,user_email, user_gender, user_bloodgroup, pincode,user_state, user_city, user_icecontact,user_membernumber,user_image,countrycode) 
VALUES (`_user_firstname`, `_user_lastname`, `_user_dob`,`_user_contact`,`_user_email`, `_user_gender`, `_user_bloodgroup`, `_user_state`, `_user_city`, `_user_icecontact`,`_user_membernumber`, _user_image,_countrycode);

ELSE 
		UPDATE user_details SET user_firstname=_user_firstname, user_lastname=_user_lastname,user_dob=_user_dob,user_contact=_user_contact,user_email=_user_email,user_gender=_user_gender, user_bloodgroup=_user_bloodgroup,  pincode=_user_pincode,user_state=_user_state, user_city=_user_city, user_icecontact=_user_icecontact, user_membernumber= _user_membernumber, user_image=_user_image, countrycode=_countrycode WHERE user_email = _user_email AND user_id = _user_id;
        End If;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDependentDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetDependentDetails`(IN userId INT)
BEGIN
    SELECT 
        user_id, 
        user_FirstName, 
        user_LastName, 
        user_membernumber,
        user_image
        -- COALESCE(NULLIF(user_image, ''), '/journal-page-images/article/random-img.jpg') AS user_image
    FROM user_details 
    WHERE user_id = userId AND user_isactive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFamilyPrescriptions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetFamilyPrescriptions`(
    IN _UserId INT
)
BEGIN
    SELECT f.Id, f.MemberId, f.Conditions,f.otherConditions, f.Medication, f.Power, f.Dosage, f.Timings, u.user_firstname,f.UserId
    FROM user_familyprescription f
    left join user_details u on f.MemberId = u.user_id
    WHERE f.UserId = _UserId 
    or f.UserId in (SELECT distinct UserId FROM user_prescriptionAccess WHERE FIND_IN_SET(_UserId, AccessTo) > 0)
    
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMultipleReportFilePaths` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetMultipleReportFilePaths`(IN reportIdList JSON)
BEGIN
    -- Create a temporary table to store IDs
    CREATE TEMPORARY TABLE TempReportIds (ReportId INT);

    -- Insert JSON values into the temporary table
    INSERT INTO TempReportIds (ReportId)
    SELECT CAST(JSON_UNQUOTE(json_extract(reportIdList, CONCAT('$[', n.n, ']'))) AS UNSIGNED)
    FROM (SELECT 0 n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
          UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) n
    WHERE JSON_LENGTH(reportIdList) > n.n;

    -- Fetch reports using the temporary table
    SELECT Id, CONCAT("/upload/report/", ReportUrl) AS FullPath 
    FROM user_reports 
    WHERE Id IN (SELECT ReportId FROM TempReportIds);

    -- Drop the temporary table to clean up
    DROP TEMPORARY TABLE IF EXISTS TempReportIds;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getquestionandrelatedpost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `getquestionandrelatedpost`(_CatId int)
BEGIN
	DECLARE _PostID INT DEFAULT 0; 
	SELECT PostId, DiscussionId, Content, CreatedBy, CreatedAt FROM posts where DiscussionId = _CatId order by PostId Desc; -- category 
	SET _PostId = (SELECT PostId FROM posts where DiscussionId = _CatId order by PostId Desc); -- category 
	SELECT forumpostid, PostID, user_id, PostText, PostDate FROM forumposts where PostID = _PostID order by forumpostid Desc; -- ans 
	-- SELECT _PostID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReportFilePath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetReportFilePath`(IN _Id INT)
BEGIN
    SELECT CONCAT('/upload/report/', ReportUrl) AS FullPath
    FROM user_reports
    WHERE Id = _Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReportNameByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetReportNameByUserId`(
   IN p_ID INT,
    IN p_ReportName VARCHAR(255)
)
BEGIN

  UPDATE user_reports
    SET ReportName = p_ReportName
    WHERE Id = p_ID;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserAllReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetUserAllReports`(IN p_UserId INT, IN p_MemberId INT)
BEGIN
    SELECT 
        ur.Id, 
        ur.UserId, 
        u.user_id,

        -- If MemberId exists, fetch dependent user's name; otherwise, show the report owner's name
        COALESCE(
            (SELECT d.user_firstname FROM user_details d WHERE d.user_id = ur.MemberId), 
            u.user_firstname
        ) AS UserName,

        ur.ReportName, 
        CASE 
            WHEN ur.ReportId = 3 THEN 'lab report'
            WHEN ur.ReportId = 4 THEN 'dental report'
            WHEN ur.ReportId = 5 THEN 'Immunization'
            WHEN ur.ReportId = 6 THEN 'medications/prescription'
            WHEN ur.ReportId = 7 THEN 'radiology'
            WHEN ur.ReportId = 8 THEN 'Opthalmology'
            WHEN ur.ReportId = 9 THEN 'special report'
            WHEN ur.ReportId = 10 THEN 'mediclaim/insurance'
            ELSE 'Other Report'
        END AS ReportType,

        ta.AccessTo, 
        ur.MemberId,
        ur.CreatedDate
    FROM tblreportaccess ta
    INNER JOIN user_reports ur 
        ON ta.Id = ur.Id 
        AND ur.IsActive = 1 
    INNER JOIN user_details u 
        ON ur.UserId = u.user_id  -- Join to get the report owner's name
    WHERE ur.IsActive = 1  
    AND (u.user_id = p_UserId OR ur.MemberId = p_MemberId OR FIND_IN_SET(p_UserId, ta.AccessTo) > 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserAndDependentsMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetUserAndDependentsMembers`(IN userId INT)
BEGIN
    SELECT 
        1 AS _type,
        u.user_id, 
        u.User_Reference, 
        u.user_FirstName, 
        u.user_LastName, 
        u.user_Email, 
        u.user_Contact, 
        u.user_relation, 
        IFNULL(u.user_image, '') AS user_image, 
        u.user_membernumber,
        CASE 
            WHEN IFNULL(u.user_reference, 0) > 0 THEN 1 
            ELSE 0 
        END AS IsDependent,
        u.user_reference AS DependentUserId
    FROM user_details u
    WHERE (u.user_id = userId OR u.user_reference = userId) 
        AND u.user_isactive = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `getUserDetails`(_Id int)
BEGIN
select user_id, user_firstname, user_lastname, user_gender, user_dob, user_bloodgroup, user_state, user_city,pincode,CONCAT( c.dialingcode, ' ', u.user_contact) AS user_contact, user_icecontact, user_relativecontact, user_email, user_relation, user_doctor, user_membernumber,countrycode, user_image,c.dialingcode,date_ofExpiryPlan,subscriptionplan_status
from user_details u
left join countrylist2 c ON TRIM(SUBSTRING_INDEX(u.countrycode, ' ', 1)) = TRIM(c.isocode) where user_id= _Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `getUserId`(`_user_email`varchar(45))
BEGIN
SELECT user_id , generated_key FROM user_details WHERE user_email= _user_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserMailByKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `getUserMailByKey`(`_user_key`varchar(45))
BEGIN
SELECT user_id , user_email FROM user_details WHERE generated_key= _user_key;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `getUserPassword`(_Id int)
BEGIN
select user_id, user_password from user_details where user_id= _Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `GetUserReports`(
    IN p_user_ids VARCHAR(255),    -- List of user IDs (e.g., '330,331')
    IN p_check_access_for INT      -- User ID to check access (e.g., 330 for Harsh)
)
BEGIN
    SET @sql = CONCAT(
        'SELECT 
            ur.Id, 
            ur.UserId, 
            u.user_id,
            u.user_firstname AS MainUserName, 
            ur.ReportName, 
            CASE 
                WHEN ur.ReportId = 3 THEN "lab report"
                WHEN ur.ReportId = 4 THEN "dental report"
                WHEN ur.ReportId = 5 THEN "Immunization"
                WHEN ur.ReportId = 6 THEN "medications/prescription"
                WHEN ur.ReportId = 7 THEN "radiology"
                WHEN ur.ReportId = 8 THEN "Opthalmology"
                WHEN ur.ReportId = 9 THEN "special report"
                WHEN ur.ReportId = 10 THEN "mediclaim/insurance"
                ELSE "Other Report"
            END AS ReportType,
            ta.AccessTo, 
            COALESCE(d.user_firstname, u.user_firstname) AS UserName,
            ur.CreatedDate
        FROM tblreportaccess ta
        INNER JOIN user_reports ur 
            ON ta.Id = ur.Id 
            AND ur.IsActive = 1 
        INNER JOIN user_details u 
            ON ur.UserId = u.user_id 
        LEFT JOIN user_details d 
            ON d.user_id = SUBSTRING_INDEX(ta.AccessTo, ",", -1)
        WHERE ur.IsActive = 1 
        AND u.user_id IN (', p_user_ids, ')  -- Fetch all user_ids in list
        
        UNION 
        
        SELECT 
            ur.Id, 
            ur.UserId, 
            u.user_id,
            u.user_firstname AS MainUserName, 
            ur.ReportName, 
            CASE 
                WHEN ur.ReportId = 3 THEN "lab report"
                WHEN ur.ReportId = 4 THEN "dental report"
                WHEN ur.ReportId = 5 THEN "Immunization"
                WHEN ur.ReportId = 6 THEN "medications/prescription"
                WHEN ur.ReportId = 7 THEN "radiology"
                WHEN ur.ReportId = 8 THEN "Opthalmology"
                WHEN ur.ReportId = 9 THEN "special report"
                WHEN ur.ReportId = 10 THEN "mediclaim/insurance"
                ELSE "Other Report"
            END AS ReportType,
            ta.AccessTo, 
            COALESCE(d.user_firstname, u.user_firstname) AS UserName,
            ur.CreatedDate
        FROM tblreportaccess ta
        INNER JOIN user_reports ur 
            ON ta.Id = ur.Id 
            AND ur.IsActive = 1 
        INNER JOIN user_details u 
            ON ur.UserId = u.user_id 
        LEFT JOIN user_details d 
            ON d.user_id = SUBSTRING_INDEX(ta.AccessTo, ",", -1)
        WHERE ur.IsActive = 1 
        AND FIND_IN_SET("', p_check_access_for, '", ta.AccessTo) > 0;' -- Fetch additional records if Harsh has access
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_allergy_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `get_allergy_master`(IN in_user_id INT)
BEGIN
    SELECT allergy_id, allergy_name 
    FROM allergy_master
    WHERE user_id = in_user_id OR user_id IS NULL
    ORDER BY 
        CASE WHEN allergy_name = 'Medications' THEN 1 ELSE 0 END,
        allergy_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_disease_master` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `get_disease_master`(IN in_user_id INT)
BEGIN
    SELECT disease_id, disease_name 
    FROM disease_master
    WHERE user_id = in_user_id OR user_id IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_allergy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `get_user_allergy`(`_user_id` int)
BEGIN
	SELECT user_allergy_id, allergy_id, user_id, yesNo FROM user_allergy where user_id = _user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_disease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `get_user_disease`(`_user_id` int)
BEGIN
	SELECT user_disease_id, user_id, disease_id, user_self, user_mother, user_father FROM user_disease where user_id= `_user_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_surgery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `get_user_surgery`(`_user_id` int)
BEGIN
	SELECT user_surgery_id, user_id, user_surgery_details, user_surgery_year FROM user_surgery_details where user_id = _user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertOrUpdateUserFamilyPrescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `InsertOrUpdateUserFamilyPrescription`(
    IN _Id INT,
    IN _MemberId INT,
    IN _Conditions VARCHAR(255),
    In _otherConditions varchar(100),
    IN _Medication VARCHAR(255),
    IN _Power VARCHAR(255),
    IN _Dosage VARCHAR(255),
    IN _Timings VARCHAR(255),
    IN _UserId INT
)
BEGIN
    -- Check if Id is NULL, 0 or blank
    IF _Id IS NULL OR _Id = 0 THEN
        -- Insert new record if Id is not provided (is NULL or 0)
        INSERT INTO user_familyprescription (MemberId, Conditions,otherConditions, Medication, Power, Dosage, Timings, UserId,CreatedBy)
        VALUES (_MemberId, _Conditions,_otherConditions, _Medication, _Power, _Dosage, _Timings, _UserId,_UserId);
    ELSE
        -- Update the existing record if a valid Id is provided
        UPDATE user_familyprescription
        SET 
            MemberId = _MemberId,
            Conditions = _Conditions,
            otherConditions=_otherConditions,
            Medication = _Medication,
            Power = _Power,
            Dosage = _Dosage,
            Timings = _Timings,
            CreatedBy = _UserId
        WHERE Id = _Id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_forum_post` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `insert_forum_post`(
    IN _post_id int,
	IN _user_id int,
    IN _Posttext TEXT,
    in _type varchar(20)
)
BEGIN
if(_type= 'C') then
    INSERT INTO forumposts (PostID, user_id, PostText) VALUES (_post_id, _user_id, _posttext);
	elseif (_type= 'R') then
	Select PostText, PostDate, PostID from forumposts WHere PostID = _post_id order by PostDate DESC;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removeForumPost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `removeForumPost`(`_UserId` int, _forumpostid int, OUT `_Result` INT(3))
BEGIN
	IF(Select 1 from forumposts Where forumpostid = _forumpostid and user_id = _UserId) 
    THEN
		Delete from forumposts Where forumpostid = _forumpostid and user_id = _UserId;
         set _Result = 1;
	ELSE
         set _Result = 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removeReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `removeReport`(`_UserId` int, _Id int, OUT `_Result` INT(3))
BEGIN
	IF(Select 1 from user_reports Where Id = _Id and UserId = _UserId) 
    THEN
		Delete from user_reports Where Id = _Id and UserId = _UserId;
         set _Result = 1;
	ELSE
         set _Result = 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetMemberCountByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `sp_GetMemberCountByUser`(
    IN in_userId INT,
    OUT out_memberCount INT
)
BEGIN
   SELECT COUNT(*) into out_memberCount
FROM (
    SELECT user_id FROM user_details WHERE user_reference = in_userId AND user_isactive=1
    UNION 
    SELECT  Receivedby FROM tblrequest WHERE Receivedby = in_userId AND Accepted = 1
) AS combined_members;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `updateuser`(`_user_id`varchar(45),`_user_height` DOUBLE,`_user_weight` DOUBLE,`_user_smoke` int,`_user_alcohol` int, `_user_blood_group` VARCHAR(10), `_spType` varchar(10))
BEGIN
	IF(`_spType` = 'U')
    THEN
		Update user_details set user_height=`_user_height`, user_weight=`_user_weight`, user_smoke =`_user_smoke`, user_alcohol = `_user_alcohol` , user_bloodgroup = `_user_blood_group` where user_id = _user_id ;
    ELSEIF(`_spType` = 'E')
	THEN
		Select user_height, user_weight, user_smoke, user_alcohol,user_bloodgroup FROM user_details where user_id = _user_id ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_acceptRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_acceptRequest`(_user_id int,_requestedid int, _accepted int,_rejected int, _dependentUserId int)
BEGIN
	DECLARE _IsDependent INT;
	SET _IsDependent = 0;
	
    UPDATE tblrequest set accepted=_accepted ,rejected=_rejected 
	WHERE  sentby = _requestedid and receivedby = _user_id and DependentUserId = _dependentUserId;
        -- AND u.user_request = 1;
        
	IF(_dependentUserId > 0)
		THEN
			SET   _IsDependent = 1;
		ELSE 
			SET   _IsDependent = 1;
	END IF;
	
    IF(_accepted = 1)
		THEN
			/*IF(_dependentUserId > 0)
				THEN
					INSERT INTO tblrequest(sentby, requested, accepted, receivedby, rejected, CreatedDate, Sent, )
							VALUES(_user_id, 1, _accepted, _requestedid, 0, CURRENT_TIMESTAMP(), 1);
				ELSE
					INSERT INTO tblrequest(sentby, requested, accepted, receivedby, rejected, CreatedDate, Sent)
							VALUES(_user_id, 1, _accepted, _requestedid, 0, CURRENT_TIMESTAMP(), 1);
            END IF;*/
			INSERT INTO tblrequest(sentby, requested, accepted, receivedby, rejected, CreatedDate, Sent, DependentUserId, IsDependent)
							VALUES(_user_id, 1, _accepted, _requestedid, 0, CURRENT_TIMESTAMP(), 1, _dependentUserId, _IsDependent);	
	END IF;
        
                            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_addBookmark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_addBookmark`(_BlogId int, _CategoryId int, _UserId int ,  OUT `_Result` INT(3))
BEGIN
if exists(select BlogId from Bookmark where BlogId =_BlogId)
then 
	delete from  Bookmark where BlogId= _BlogId;
    set _Result = 2;
ELSE
	insert into Bookmark (BlogId, CategoryId, UserId) values (_BlogId, _CategoryId, _UserId);
    set _Result = 1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_addmember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_addmember`(
_UserReferenceId int, 
_MemberType int,
_FirstName VARCHAR(255), 
_LastName VARCHAR(255), 
_RelationType VARCHAR(100), 
_EmailId VARCHAR(100), 
_PhoneNo VARCHAR(100),
_AltPhoneNo VARCHAR(100), 
OUT _Result INT
)
BEGIN
	IF NOT EXISTS(Select EmailId from members where EmailId = _EmailId)
    THEN
		INSERT INTO members(UserReferenceId, MemberType, FirstName, LastName, RelationType, EmailId, PhoneNo, AltPhoneNo, CreatedDate)
        Values(_UserReferenceId, _MemberType, _FirstName, _LastName, _RelationType, _EmailId, _PhoneNo, _AltPhoneNo, current_timestamp());
        SET _Result = 1;
	ELSE
		 SET _Result = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_addreport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_addreport`(
`_UserId` INT, 
`_reportname` VARCHAR(500), 
`_reporturl` VARCHAR(500), 
`_reportId` INT, 
`_memberId` VARCHAR(500), 
`_SpType` Varchar(10), 
OUT _Result INT
)
BEGIN
	IF(_SpType = 'C')
    THEN    
		INSERT INTO user_reports(UserId, ReportName, ReportUrl, ReportId, MemberId, IsActive, CreatedDate)
        VALUE(_UserId, _reportname, _reporturl, _reportId, _memberId, true,current_timestamp()  );
        SET _Result = last_insert_id();
    END IF;
    
   /* IF(_SpType = 'U')
    THEN
		-- SELECT Id, UserId, ReportName, ReportUrl, ReportId, IsActive, CreatedDate FROM user_reports;
		UPDATE user_reports SET name = _name, phone = _phone, email= _email, subject = _subject, message = _message, Isactive = 'Active'
        WHERE Id = _Id;
        SET _Result = _Id;
    END IF;
    
    IF(_SpType = 'D')
    THEN
		UPDATE tblcontact SET Isactive = 'Deactive'
        WHERE Id = _Id;
        SET _Result = _Id;
    END IF;
    
-- SELECT Id, name, phone, email, subject, message, createddate FROM db_letslearnindia.tblcontact;
    IF(_SpType = 'E')
    THEN
		SELECT * FROM tblcontact WHERE Id = _Id;
    END IF;
    */
    IF(_SpType = 'R')
    THEN
		SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId Where UserId = _UserId AND ur.ReportId = _reportId and ur.MemberId= _memberId AND ur.IsActive = true;
	END IF;
    
     IF(_SpType = 'UR')
    THEN
		SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId Where UserId = _UserId AND ur.ReportId = _reportId  AND ur.IsActive = true;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_addreportwithaccess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_addreportwithaccess`(
`_UserId` INT, 
`_reportname` VARCHAR(500), 
`_reporturl` VARCHAR(500), 
`_reportId` INT, 
`_rId` INT, 
`_memberId` VARCHAR(500), 
`_SpType` Varchar(10),
`_FileSize` Double,
`_UploadType` varchar(40),
OUT _Result INT
)
BEGIN
DECLARE last_inserted_id INT;
	IF(_SpType = 'C')
    THEN    
		INSERT INTO user_reports(UserId, ReportName, MemberId,ReportUrl, ReportId,  IsActive, CreatedDate, FileSize, UploadType)
        VALUE(_UserId, _reportname, _rId,_reporturl, _reportId, true,current_timestamp(), _FileSize, _UploadType);
         SET last_inserted_id = LAST_INSERT_ID();
        
        INSERT INTO tblreportaccess(UserId, ReportId, AccessTo, IsActive, CreatedDate, AccessMappingId)
        VALUE(_UserId, _reportId, _memberId,  true,current_timestamp() ,last_inserted_id );
        SET _Result = last_insert_id();
    END IF;
    
    IF(_SpType = 'U')
    THEN
		-- SELECT Id, UserId, ReportName, ReportUrl, ReportId, IsActive, CreatedDate FROM user_reports;
		UPDATE tblreportaccess set  AccessTo = _memberId,  CreatedDate=current_timestamp()
        WHERE UserId = _UserId and ReportId=_reportId and AccessMappingId=_rId;
        SET _Result = 1;
    END IF;
    
   /* IF(_SpType = 'D')
    THEN
		UPDATE tblcontact SET Isactive = 'Deactive'
        WHERE Id = _Id;
        SET _Result = _Id;
    END IF;
    
-- SELECT Id, name, phone, email, subject, message, createddate FROM db_letslearnindia.tblcontact;
    IF(_SpType = 'E')
    THEN
		SELECT * FROM tblcontact WHERE Id = _Id;
    END IF;
    */
    IF(_SpType = 'R')
    THEN
    	SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate, ur.UploadType, '' user_firstname FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId Where UserId = _UserId AND ur.ReportId = _reportId and ur.MemberId= _memberId 
        AND ur.IsActive = true;
	END IF;
    
    -- for listing reports
    IF(_SpType = 'LR')
    THEN
		IF(_UploadType = 'dependent')
			THEN
				SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate,ur.FileSize, 
                ur.UploadType,    
               '' user_firstname
				FROM user_reports ur 
                inner join reportmaster r on r.Id = ur.ReportId 
				inner join tblreportaccess ra on ra.AccessMappingId = ur.Id
				
				Where 
                ur.ReportId = _reportId 
				and ra.ReportId = _reportId 
				and ((ur.UserId = _UserId and ra.UserId = _UserId) or FIND_IN_SET(_UserId, ra.AccessTo))
				and FIND_IN_SET(_rId, ra.AccessTo)
			 	and ur.UploadType = 'dependent' 
				AND ur.IsActive = true ;
                
                
				-- group by ur.Id;
			ELSE
				SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate, 
                ur.UploadType,    
                 (Select user_firstname from user_details where user_id = (  CASE 
					WHEN ur.UploadType = 'dependent' THEN 
						SUBSTRING_INDEX(ra.AccessTo, ',', -1)
					ELSE 
						0 END) )as  user_firstname
                        
                        FROM user_reports ur 
                inner join reportmaster r on r.Id = ur.ReportId 
				inner join tblreportaccess ra on ra.AccessMappingId = ur.Id
				Where ur.UserId = _memberId  
				and ra.UserId = _memberId 
				AND ur.ReportId = _reportId 
				and ra.ReportId = _reportId 
				and FIND_IN_SET(_UserId, ra.AccessTo)
                and (ur.UploadType is null or ur.UploadType = '')
				AND ur.IsActive = true;
				-- group by ur.Id;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_changepassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_changepassword`(
`_UserId` int,
`_OldPassword` varchar(100), 
`_NewPassword` varchar(100), 
OUT _Result int(5)
)
BEGIN
	/*IF EXISTS(SELECT user_id FROM user_details WHERE BINARY user_password = `_OldPassword`)*/
	IF EXISTS(SELECT user_id FROM user_details WHERE user_id = _UserId)
		THEN
			UPDATE user_details SET user_password = `_NewPassword`
        WHERE user_id = _UserId;
        SET _Result = 1;
    ELSE
		SET _Result = 0;
    END IF;
    SELECT _Result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chkBookmark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_chkBookmark`(_BlogId int, out _Result int)
BEGIN
if exists (select BlogId from Bookmark where BlogId =_BlogId)
then set _Result =(select BlogId from Bookmark where BlogId =_BlogId limit 1);
else set _Result=0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_DeleteDentalClinic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_DeleteDentalClinic`(
    IN p_id INT
)
BEGIN
    DELETE FROM Dental_Clinics WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_DeleteReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `USP_DeleteReport`(IN p_Id INT)
BEGIN
    DELETE FROM user_reports 
    WHERE Id = p_Id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_existingmember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_existingmember`(
    IN _user_id INT, 
    IN `_hf_number` VARCHAR(80), 
    IN _spType VARCHAR(10),  
    OUT _Result INT(5)
)
BEGIN
    DECLARE existinguser_id INT;
    DECLARE request_sent INT;
    DECLARE _Accepted INT;
    DECLARE _Rejected INT;
    DECLARE _Requested INT;
    DECLARE _ParentId INT;
    DECLARE _IsDependent INT;
    DECLARE _DependentUserId INT;
    DECLARE _ParentExists INT;

    SET _ParentId = IFNULL((SELECT user_reference FROM user_details WHERE user_membernumber = _hf_number), 0);

    IF (_ParentId > 0) THEN
        SELECT user_id INTO _DependentUserId FROM user_details WHERE user_membernumber = _hf_number;
        SET _IsDependent = 1;
        SET existinguser_id = _ParentId; 
    ELSE    
        SET _IsDependent = 0;
        SET _DependentUserId = 0;
        SELECT user_id INTO existinguser_id FROM user_details WHERE user_membernumber = _hf_number;
    END IF;

    -- Check if independent member exists for dependent members
    IF (_IsDependent = 1) THEN
      if exists( select  1 from tblrequest where Accepted=1 and sentby in (_ParentId,_user_id) and Receivedby in (_ParentId,_user_id))
      then
      set _ParentExists=1;
      else
       set _ParentExists=0;
       end if;
     

    END IF;

    IF _spType = 'C' THEN
        -- If dependent and independent member doesn't exist, return error
        IF (_IsDependent = 1 AND _ParentExists = 0) THEN
            SET _Result = 7; -- First add the independent member
        ELSE
            -- Check if the user exists and insert into tblrequest
            IF (existinguser_id = _user_id) THEN
                SET _Result = 6; -- Same user ID
            ELSEIF EXISTS (SELECT user_id FROM user_details WHERE user_membernumber = _hf_number) THEN
                -- Check if a request has been already sent
                IF NOT EXISTS (SELECT 1 FROM tblrequest WHERE SentBy = _user_id AND Receivedby = existinguser_id AND DependentUserId = _DependentUserId) THEN
                    -- Insert into tblrequest if no request has been sent
                    INSERT INTO tblrequest (SentBy, Requested, Accepted, Receivedby, Rejected, CreatedDate, IsDependent, DependentUserId)
                    VALUES (_user_id, 1, 0, existinguser_id, 0, CURRENT_TIMESTAMP(), _IsDependent, _DependentUserId);
                    SET _Result = 1;
                ELSE
                    SELECT Accepted, Rejected, Requested 
                    INTO _Accepted, _Rejected, _Requested 
                    FROM tblrequest 
                    WHERE SentBy = _user_id AND Receivedby = existinguser_id AND DependentUserId = _DependentUserId;

                    IF (_Accepted = 1) THEN
                        SET _Result = 3; -- Already accepted
                    ELSEIF (_Rejected = 1) THEN
                        SET _Result = 4; -- Rejected
                    ELSEIF (_Requested = 1) THEN
                        SET _Result = 5; -- Request already sent
                    END IF;
                END IF;
            ELSE
                SET _Result = 0; -- Member does not exist
            END IF;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetAllReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `USP_GetAllReports`(
    IN p_UserId varchar(500), 
    IN p_membersId VARCHAR(255),
    IN p_SearchQuery VARCHAR(100) -- New search parameter
)
BEGIN
    if(p_SearchQuery is  null)
    then
SELECT 
    ur.Id, 
    ur.UserId, 
    u.user_id,
 COALESCE(
            (SELECT d.user_firstname FROM user_details d WHERE d.user_id = ur.MemberId), 
            u.user_firstname
        ) AS UserName, 
    ur.ReportName, 
    CASE 
        WHEN ur.ReportId = 3 THEN 'lab report'
        WHEN ur.ReportId = 4 THEN 'dental report'
        WHEN ur.ReportId = 5 THEN 'Immunization'
        WHEN ur.ReportId = 6 THEN 'medications/prescription'
        WHEN ur.ReportId = 7 THEN 'radiology'
        WHEN ur.ReportId = 8 THEN 'Opthalmology'
        WHEN ur.ReportId = 9 THEN 'special report'
        WHEN ur.ReportId = 10 THEN 'mediclaim/insurance'
        ELSE 'Other Report'
    END AS ReportType,
    ta.AccessTo, 
    
    ur.CreatedDate
FROM tblreportaccess ta
INNER JOIN user_reports ur 
    ON ta.Id = ur.Id 
    AND ur.IsActive = 1 
INNER JOIN user_details u 
    ON ur.UserId = u.user_id 
LEFT JOIN user_details d 
    ON FIND_IN_SET(d.user_id, ta.AccessTo) > 0 -- Check if user exists in AccessTo list
WHERE ur.IsActive = 1  
AND (FIND_IN_SET(p_UserId, ta.AccessTo) > 0 AND u.user_id = p_membersId)
or  d.user_id=p_membersId;
 -- Joining on both user_id & user_reference
   
    else
     SELECT 
    ur.Id, 
    ur.UserId, 
u.user_id,
    u.user_firstname AS MainUserName, 
    ur.ReportName, 
     CASE 
            WHEN ur.ReportId = 3 THEN 'lab report'
            WHEN ur.ReportId = 4 THEN 'dental report'
            WHEN ur.ReportId = 5 THEN 'Immunization'
            WHEN ur.ReportId = 6 THEN 'medications/prescription'
            WHEN ur.ReportId = 7 THEN 'radiology'
            WHEN ur.ReportId = 8 THEN 'Opthalmology'
            WHEN ur.ReportId = 9 THEN 'special report'
            WHEN ur.ReportId = 10 THEN 'mediclaim/insurance'
            ELSE 'Other Report'
        END AS ReportType,
    ta.AccessTo, 
    COALESCE(d.user_firstname, u.user_firstname) AS UserName, -- Show dependent user or UserId if blank
    ur.CreatedDate
FROM tblreportaccess ta
INNER JOIN user_reports ur 
    ON ta.Id = ur.Id 
    AND ur.IsActive = 1 
INNER JOIN user_details u 
    ON ur.UserId = u.user_id 
LEFT JOIN user_details d 
    ON d.user_id = SUBSTRING_INDEX(ta.AccessTo, ',', -1) -- Extract last value after comma
WHERE ur.IsActive = 1 and u.user_id in (p_UserId,p_membersId)

    -- Search condition: Filter by ReportName if search query is not empty
    AND (ur.ReportName LIKE CONCAT('%', p_SearchQuery, '%') OR p_SearchQuery = '')
    ORDER BY ur.CreatedDate DESC;
    
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getallRequests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getallRequests`(_user_id int)
BEGIN
    SELECT 
        u.user_id,
        u.user_firstname,
        u.user_lastname,
        u.user_membernumber,
        u.user_request,
        u.user_response,
        u.user_image,
        u.user_email,
        u.user_contact,
        r.sentby,
        r.IsDependent,
		CASE 
			WHEN r.IsDependent = 1 THEN 
				(SELECT CONCAT('Name: ', user_firstname, ', relation: ', user_relation) 
				 FROM user_details 
				 WHERE user_id = r.DependentUserId)
			ELSE ''
		END AS dependent_info,
        r.DependentUserId
    FROM tblrequest  r
    inner Join user_details u on u.user_id = r.sentby
   -- inner join tblrequest r
    WHERE 
        r.receivedby = _user_id and r.accepted = 0 and r.rejected = 0;
        -- AND u.user_request = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getArticleList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getArticleList`(articletype int)
BEGIN
if(articletype=1)
then
select articleImage,Title,ArticleContent,Author,AuthorDesignation,IsActive from Articles order by createdDate desc limit 1;

else if(articletype=2)
then
select articleImage,Title,ArticleContent,Author,AuthorDesignation,IsActive from Articles order by createdDate asc ;
else
select articleImage,Title,ArticleContent,Author,AuthorDesignation,IsActive from Articles order by createdDate desc ;
end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetBlogsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `USP_GetBlogsById`(`_CategoryId` int, Isbookmarked int)
BEGIN
if(Isbookmarked >0)
	then 
     Select b.Blog_ID, b.CategoryId, b.AnchorImage, b.Title, b.Url, bo.BlogId  , 'Add Members/bookmark.png'  as ImgUrl
  from Blog b inner join  bookmark bo on b.Blog_ID= bo.BlogId where b.CategoryId=`_CategoryId` order by BlogId desc;
    Else
    Select b.Blog_ID, b.CategoryId, b.AnchorImage, b.Title, b.Url, bo.BlogId  ,  
CASE WHEN bo.BlogId>0  then 'Add Members/bookmark.png' else  'Add Members/save-not-active.png' end as ImgUrl
  from Blog b left join  bookmark bo on b.Blog_ID= bo.BlogId where b.CategoryId=`_CategoryId` order by BlogId desc;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetlinkReportDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_GetlinkReportDetails`(IN reportIds TEXT)
BEGIN
    SET @query = CONCAT(
        'SELECT ur.Id,
            ur.ReportName, 
            CASE 
                WHEN ur.ReportId = 3 THEN ''lab report''
                WHEN ur.ReportId = 4 THEN ''dental report''
                WHEN ur.ReportId = 5 THEN ''Immunization''
                WHEN ur.ReportId = 6 THEN ''medications/prescription''
                WHEN ur.ReportId = 7 THEN ''radiology''
                WHEN ur.ReportId = 8 THEN ''Opthalmology''
                WHEN ur.ReportId = 9 THEN ''special report''
                WHEN ur.ReportId = 10 THEN ''mediclaim/insurance''
                ELSE ''Other Report''
            END AS ReportType,
            COALESCE(d.user_firstname, u.user_firstname) AS UserName,
            ur.ReportUrl
        FROM tblreportaccess ta
        INNER JOIN user_reports ur 
            ON ta.Id = ur.Id 
            AND ur.IsActive = 1 
        INNER JOIN user_details u 
            ON ur.UserId = u.user_id 
        LEFT JOIN user_details d 
            ON d.user_id = SUBSTRING_INDEX(ta.AccessTo, '','', -1) -- Extract last value after comma
        WHERE ur.IsActive = 1 
        AND ur.Id IN (', reportIds, ')'
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getmember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getmember`(`_UserId` int, `_MemberId` int, `_SpType` varchar(10), `_ReportId` int,`_RId` int)
BEGIN
IF(_SpType = 'LS')
    THEN
	 WITH UserHierarchy AS (
			/*SELECT 1 as _type ,user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, IFNULL(user_image, '') user_image,user_membernumber, 0 as IsDependent, 0 as DependentUserId FROM user_details -- below line newly added next condition user_isactive=1;
				where  user_id = (Select User_Reference from user_details where user_id = _UserId) and user_isactive=1
				union
			SELECT 2 as _type, user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, IFNULL(user_image, '') user_image,user_membernumber, r.IsDependent, r.DependentUserId FROM user_details u
			 inner Join tblrequest r on u.user_id = (case when r.DependentUserId > 0 then r.DependentUserId else r.receivedby end)
			 where user_isactive=1 and r.accepted=1 and r.sentby=_UserId
				union 
			 SELECT 3 as _type,user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, IFNULL(user_image, '') user_image,user_membernumber , 0 as IsDependent, 0 as DependentUserId FROM user_details u
			 where  User_Reference=_UserId and user_isactive=1 */
                             WITH CTE_1 AS (
    SELECT 
        1 AS _type,
        u.user_id, 
        u.User_Reference, 
        u.user_FirstName, 
        u.user_LastName, 
        u.user_Email, 
        u.user_Contact, 
        u.user_relation, 
        IFNULL(u.user_image, '') AS user_image, 
        u.user_membernumber,
        CASE 
            WHEN IFNULL(u.user_reference, 0) > 0 THEN 1 
            ELSE 0 
        END AS IsDependent,
        u.user_reference AS DependentUserId
    FROM user_details u
    WHERE u.user_reference = _UserId and u.user_isactive = 1
),
CTE_2 AS (
    SELECT 
        2 AS _type,
        u.user_id, 
        u.User_Reference, 
        u.user_FirstName, 
        u.user_LastName, 
        u.user_Email, 
        u.user_Contact, 
        u.user_relation, 
        IFNULL(u.user_image, '') AS user_image, 
        u.user_membernumber, 
        CASE 
            WHEN IFNULL(u.user_reference, 0) > 0 THEN 1 
            ELSE 0 
        END AS IsDependent,
        CASE 
            WHEN r.DependentUserId > 0 THEN r.DependentUserId 
            ELSE r.ReceivedBy 
        END AS DependentUserId
    FROM user_details u
    INNER JOIN tblRequest r ON u.user_id =  (case when r.DependentUserId > 0 then r.DependentUserId else r.sentby end)
    WHERE r.Accepted = 1 
      AND r.Receivedby = _UserId 
      AND u.user_id NOT IN (SELECT user_id FROM CTE_1) 
      AND u.user_isactive = 1 
),
CTE_3 AS (
    SELECT 
        3 AS _type,
        u.user_id, 
        u.User_Reference, 
        u.user_FirstName, 
        u.user_LastName, 
        u.user_Email, 
        u.user_Contact, 
        u.user_relation, 
        IFNULL(u.user_image, '') AS user_image, 
        u.user_membernumber,
        CASE 
            WHEN IFNULL(u.user_reference, 0) > 0 THEN 1 
            ELSE 0 
        END AS IsDependent,
        u.user_reference AS DependentUserId
    FROM user_details u
    WHERE u.user_id IN (
        SELECT case when r.DependentUserId=0 then r.ReceivedBy else r.DependentUserId end
        FROM tblRequest r 
        WHERE r.Accepted = 1 
          AND r.SentBy = _UserId  
    )
      AND u.user_id NOT IN (SELECT user_id FROM CTE_1)
      AND u.user_id NOT IN (SELECT user_id FROM CTE_2)
      and u.user_isactive = 1
)/*,
CTE_4 AS (
    SELECT 
        4 AS _type,
        u.user_id, 
        u.User_Reference, 
        u.user_FirstName, 
        u.user_LastName, 
        u.user_Email, 
        u.user_Contact, 
        u.user_relation, 
        IFNULL(u.user_image, '') AS user_image, 
        u.user_membernumber,
        CASE 
            WHEN IFNULL(u.user_reference, 0) > 0 THEN 1 
            ELSE 0 
        END AS IsDependent,
        u.user_reference AS DependentUserId
    FROM user_details u
    WHERE u.user_id IN (
        SELECT Distinct TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(AccessTo, ',', n.n), ',', -1)) AS AccessTo
FROM tblreportaccess 
CROSS JOIN (
    SELECT a.N + b.N * 10 + 1 AS n
    FROM (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a
    CROSS JOIN (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
) n
WHERE userid = _UserId AND AccessTo != ''
  AND n.n <= LENGTH(AccessTo) - LENGTH(REPLACE(AccessTo, ',', '')) + 1 and TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(AccessTo, ',', n.n), ',', -1)) != ''
    )
      AND u.user_id NOT IN (SELECT user_id FROM CTE_1)
      AND u.user_id NOT IN (SELECT user_id FROM CTE_2)
      AND u.user_id Not In(Select user_id from CTE_3)
      and u.user_isactive = 1
)*/

SELECT * FROM CTE_1
UNION
SELECT * FROM CTE_2
UNION
SELECT * FROM CTE_3
-- union 
-- Select * from CTE_4
             )
             
             	SELECT p._type, p.user_id, p.User_Reference, p.user_FirstName, p.user_LastName, p.user_Email, p.user_Contact, p.user_relation, p.user_image, p.user_membernumber, p.IsDependent, IFNULL(p.DependentUserId, 0) AS DependentUserId FROM
                (SELECT _type, user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, user_image, user_membernumber, IsDependent, DependentUserId, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY _type ASC) AS row_priority FROM
                UserHierarchy) p ;
                

       END IF;
    
IF(_SpType = 'E')
    THEN
    SELECT user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, IFNULL(user_image, '') user_image,user_membernumber, 0 IsDependent, 0 DependentUserId FROM user_details u
         where  user_isactive=1 and FIND_IN_SET(u.user_id, (SELECT group_concat(AccessTo) FROM user_reports r 
         inner join tblreportaccess ra on ra.AccessMappingId = r.Id  
          where r.Id = _RId));
    
     -- SELECT user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, user_image,user_membernumber FROM user_details u
     --    where  user_isactive=1 and u.user_id in (SELECT ra.AccessTo FROM user_reports r 
       --  inner join tblreportaccess ra on ra.AccessMappingId = r.Id  
        --  where r.Id = _RId);
         -- where r.UserId = _UserId and r.Id = _RId);
    
       -- SELECT user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, user_image,user_membernumber FROM user_details u
    --     inner join tblreportaccess ra on ra.UserId = u.user_id 
     --   inner join user_reports r on ra.AccessMappingId = r.id 
    --    where  user_id=_UserId and user_isactive=1 and ra.ReportId=_ReportId and ra.AccessMappingId = r.id ;
     --   where  User_Reference=_UserId and user_isactive=1 ;
     
     
   --     union
  --  SELECT user_id, User_Reference, user_FirstName, user_LastName, user_Email, user_Contact, user_relation, user_image,user_membernumber FROM user_details 
    --    where  user_id = (Select User_Reference from user_details where user_id = _UserId) ;
     --   union
  -- select UserId, ReportId, AccessTo, null, null,null,null,null,null from tblreportaccess where UserId=_UserId and ReportId=_ReportId;
   End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getMembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getMembers`(_UserId int)
BEGIN
	Select user_Id, user_FirstName, user_LastName FROM user_details
    where User_Reference=_UserId 
    union all
    Select user_Id, user_FirstName, user_LastName FROM user_details
    inner join tblrequest r
    where  User_Reference=_UserId  and r.sentby = _UserId and r.accepted=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetMembersWithReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `USP_GetMembersWithReports`(
    IN p_UserId INT,
    IN p_MemberIds TEXT
)
BEGIN
    -- Fetching member details (FirstName) from usp_getmember
    -- and reports details from USP_GetAllReports

    SELECT 
        m.user_Id, 
        m.user_FirstName,
        r.ReportName,
        r.ReportUrl,
        r.ReportId
    FROM 
        members m
    INNER JOIN 
        reports r ON r.UserId = m.user_Id
    WHERE 
        FIND_IN_SET(m.user_Id, p_MemberIds) > 0
        AND m.UserId = p_UserId;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GetMembersWithReportss` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `USP_GetMembersWithReportss`(
    IN p_UserId INT,
    IN p_MemberIds TEXT
)
BEGIN
    -- Fetching member details (FirstName) from usp_getmember
    -- and reports details from USP_GetAllReports

    SELECT 
        m.user_Id, 
        m.user_FirstName,
        r.ReportName,
        r.ReportUrl,
        r.ReportId
    FROM 
        members m
    INNER JOIN 
        reports r ON r.UserId = m.user_Id
    WHERE 
        FIND_IN_SET(m.user_Id, p_MemberIds) > 0
        AND m.UserId = p_UserId;
        

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getnotifiedRequests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getnotifiedRequests`(_user_id INT)
BEGIN
    SELECT 
        u.user_id,
        u.user_firstname,
        u.user_lastname,
        u.user_membernumber,
        u.user_request,
        u.user_response,
        u.user_image,
        u.user_email,
        u.user_contact,
        r.sentby,
        r.IsDependent,
        CASE 
            WHEN r.IsDependent = 1 THEN 
                (SELECT CONCAT('Name: ', user_firstname, ', relation: ', user_relation) 
                 FROM user_details 
                 WHERE user_id = r.DependentUserId)
            ELSE ''
        END AS dependent_info,
        r.DependentUserId
       
    FROM tblrequest r
    INNER JOIN user_details u ON u.user_id = r.sentby
    WHERE 
        r.receivedby = _user_id 
        AND r.accepted = 0 
        AND r.rejected = 0 
        AND r.requested = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getReport`(`_UserId` INT,  _reportId int)
BEGIN
/*SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive,  ur.CreatedDate FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId
-- below join newly added ra.AccessMappingId,
 left join tblreportaccess ra on ra.AccessMappingId = ur.Id
 Where (ur.UserId = _UserId OR find_in_set(_UserId ,ra.AccessTo)) AND ur.ReportId = _reportId group by ur.Id;*/
 
 SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive,  ur.CreatedDate,ur.FileSize, UploadType, '' user_firstname 
 FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId
 Where (ur.UserId = _UserId  AND ur.ReportId = _reportId) and ur.IsActive = true
/*OR EXISTS (
       SELECT 1
       FROM tblreportaccess a
       WHERE FIND_IN_SET(_UserId, a.AccessTo) > 0 
         AND a.AccessMappingId = ur.Id 
         And a.ReportId = _reportId
   )
   */
   
   
group by ur.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getreportmaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_getreportmaster`()
BEGIN
	Select Id, Name, IsActive, CreatedDate FROM reportmaster;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_GetReportType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GetReportType`(
/*`_UserId` INT, */
`_reportId` INT, 
/*`_memberId` INT, */
`_SpType` Varchar(10), 
OUT _Result INT
)
BEGIN
	IF(_SpType = 'R')
    THEN    
		SELECT Id, Name, IsActive, CreatedDate FROM reportmaster  Where Id = _reportId AND IsActive = true;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getReportwithacess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getReportwithacess`(`_Accessto` INT,  _reportId int, _memberId int)
BEGIN
SELECT ur.Id, ur.UserId, ur.ReportName, ur.ReportUrl, ur.ReportId, ur.MemberId, r.Name as ReportType, ur.IsActive, ur.CreatedDate FROM user_reports ur inner join reportmaster r on r.Id = ur.ReportId
inner join tblreportaccess ra on ra.UserId= _memberId
 Where ur.UserId= _memberId and ur.ReportId = _reportId and ra.accessto = _Accessto group by ur.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getRequests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getRequests`(_user_id int)
BEGIN
select  user_firstname, user_lastname from user_details where user_id = _user_id and user_request =1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getusedstorage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getusedstorage`(`_UserId` int)
BEGIN
	SELECT  IFNULL(ROUND(SUM(FileSize)/1024, 2), 0) usedstorage  FROM user_reports where UserId = _UserId group by UserId; -- 1 GB
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_getuserdetailsbyId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_getuserdetailsbyId`(`_user_id` int)
BEGIN
	SELECT user_id, user_firstname, user_lastname, user_gender, user_dob, user_bloodgroup, user_state, user_city, user_country, user_contact, user_icecontact, user_relativecontact, user_email, user_doctor, user_membernumber, user_relation,user_image, user_reference FROM user_details WHERE user_id = `_user_id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_InsertDentalClinic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_InsertDentalClinic`(
    IN p_offer VARCHAR(255),
    IN p_address VARCHAR(255),
    IN p_clinic VARCHAR(255),
    IN p_image VARCHAR(255)
)
BEGIN
    INSERT INTO Dental_Clinics (offer, address, clinic, image)
    VALUES (p_offer, p_address, p_clinic, p_image);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_isuserexists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_isuserexists`(
	`_MobileNoOrEmail` varchar(100),
    OUT `_Result` INT(3)
    )
BEGIN
	IF Exists(Select user_id From user_details where CONCAT(COUNTRYCODE, user_contact) = `_MobileNoOrEmail`)
    THEN
		SET `_Result` = (Select user_id From user_details where CONCAT(COUNTRYCODE, user_contact) = `_MobileNoOrEmail` LIMIT 1);
	ELSEIF Exists(Select user_email From user_details where user_email = `_MobileNoOrEmail`)
    THEN
		SET `_Result` = (Select user_id From user_details where user_email = `_MobileNoOrEmail`  LIMIT 1);
	ELSE
		SET `_Result` = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_login`(
    IN _username VARCHAR(250),
    IN _password VARCHAR(64)  -- Hashed password
)
BEGIN
    -- Retrieve the user details including the stored password hash
    SELECT user_id, user_email, user_password,user_contact  FROM user_details l
    WHERE user_email = _username AND BINARY `user_password` = _password and user_isactive=1;
    
    
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_removeBookmark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_removeBookmark`(_BlogId int)
BEGIN
if exists(select BlogId from Bookmark where BlogId =_BlogId)
then
delete from  Bookmark where BlogId= _BlogId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_removemember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_removemember`(`_UserId` int, `_UserRedId` int, _DependentUserId int)
BEGIN
IF EXISTS (SELECT 1 FROM user_details WHERE  user_id = _UserId  and User_Reference=_UserRedId)
THEN
  update user_details set User_Reference= 0 where user_id = _UserId  and User_Reference=_UserRedId ;
delete from tblrequest where DependentUserId=_UserId;
    
elseIF  (_DependentUserId=0)
THEN

delete from tblrequest where   sentBy=_UserId and  receivedby = _UserRedId;
delete from tblrequest where   sentBy=_UserRedId and  receivedby = _UserId;
 
 elseIF EXISTS (SELECT 1 FROM user_details WHERE  user_id = _UserId  and User_Reference=_DependentUserId)
THEN
  delete  FROM tblrequest where receivedby = _DependentUserId and sentby= _UserRedId and DependentUserId = _UserId;
       delete  FROM tblrequest where receivedby = _UserRedId  and sentby= _DependentUserId  and DependentUserId = _UserId;
END IF;

	/*update user_details set user_isactive = 0 where user_id = _UserId;*/
	-- IF(_UserId > 0)
    -- THEN
   
  --  union
 
  
    
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_signup`(`_user_firstname` varchar(80) , `_user_lastname` varchar(80), `_user_dob`date, `_user_contact`varchar(45), `_user_email`varchar(45), `_user_password` varchar(64),  `_user_membernumber` varchar(100), `_user_reference` varchar(100), `_user_isactive` bool, `_user_uniquekey` varchar(100), _user_relation varchar(100), _user_gender varchar(40), _chkmail int(1), OUT _Result int(5),_countrycode varchar(250))
BEGIN

/*IF NOT Exists(Select 1 FROM user_details WHERE user_email = _user_email or user_contact=_user_contact)*/
 IF `_chkmail` = 0 OR NOT EXISTS (
        SELECT 1 FROM user_details
        WHERE (_chkmail = 1 AND (user_email = `_user_email` OR user_contact = `_user_contact`))
              OR _chkmail = 0)
then
Insert into user_details (user_firstname, user_lastname,  user_dob, user_contact, user_email, user_password, user_membernumber, user_reference, user_isactive, generated_key, user_relation, user_gender,countrycode) 
VALUES (`_user_firstname`, `_user_lastname`,  `_user_dob`,  `_user_contact`, `_user_email`, `_user_password`, `_user_membernumber`, `_user_reference`, `_user_isactive`, _user_uniquekey, _user_relation, _user_gender,_countrycode);
set _Result = last_insert_id();
else
set _Result = 0;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_UpdateDentalClinic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_UpdateDentalClinic`(
    IN p_id INT,
    IN p_offer VARCHAR(255),
    IN p_address VARCHAR(255),
    IN p_clinic VARCHAR(255),
    IN p_image VARCHAR(255)
)
BEGIN
    UPDATE Dental_Clinics
    SET offer = p_offer,
        address = p_address,
        clinic = p_clinic,
        image = p_image
    WHERE id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_updateUserDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_updateUserDetails`(
    IN _user_id INT,
    IN _user_email VARCHAR(255),
    IN _user_contact VARCHAR(15)
)
BEGIN
    UPDATE user_details
    SET user_email = _user_email,
        user_contact = _user_contact
    WHERE user_id = _user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_userfeedback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_userfeedback`(
    IN `_UserId` INT, 
    IN `_FeedBack` TEXT
)
BEGIN
    INSERT INTO usp_userfeedback (FeedBack, UserId, DateCr)
    VALUES (_FeedBack, _UserId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_userStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`bt_admin`@`%` PROCEDURE `usp_userStatus`(_UserId int, OUT _Result int(5))
BEGIN
IF EXISTS(SELECT user_id FROM user_details WHERE user_id= _UserId)
then
update user_details set user_isactive= 1 where user_id= _UserId;
 SET _Result = 1;
 else
 SET _Result = 0;
 end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 16:10:58
