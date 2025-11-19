-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: league_schema
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `refID` varchar(10) NOT NULL,
  `pword` varchar(255) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `bankInfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `bankInfo` (`bankInfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES ('R0001','refpass1','RefF1','RefL1','ref1@example.com','1974-05-25','ACC000001'),('R0002','refpass2','RefF2','RefL2','ref2@example.com','1991-04-04','ACC000002'),('R0003','refpass3','RefF3','RefL3','ref3@example.com','1972-04-23','ACC000003'),('R0004','refpass4','RefF4','RefL4','ref4@example.com','1980-04-16','ACC000004'),('R0005','refpass5','RefF5','RefL5','ref5@example.com','1981-04-19','ACC000005'),('R0006','refpass6','RefF6','RefL6','ref6@example.com','1974-06-19','ACC000006'),('R0007','refpass7','RefF7','RefL7','ref7@example.com','1994-11-28','ACC000007'),('R0008','refpass8','RefF8','RefL8','ref8@example.com','1975-04-08','ACC000008'),('R0009','refpass9','RefF9','RefL9','ref9@example.com','1995-02-01','ACC000009'),('R001','abcd','John','Smith','jsmith@uwo.ca','1980-01-01','TD193845748'),('R0010','refpass10','RefF10','RefL10','ref10@example.com','1970-08-28','ACC000010'),('R0011','refpass11','RefF11','RefL11','ref11@example.com','1972-12-06','ACC000011'),('R0012','refpass12','RefF12','RefL12','ref12@example.com','1973-05-02','ACC000012'),('R0013','refpass13','RefF13','RefL13','ref13@example.com','1984-11-13','ACC000013'),('R0014','refpass14','RefF14','RefL14','ref14@example.com','1988-12-22','ACC000014'),('R0015','refpass15','RefF15','RefL15','ref15@example.com','1976-06-20','ACC000015'),('R0016','refpass16','RefF16','RefL16','ref16@example.com','1973-09-16','ACC000016'),('R0017','refpass17','RefF17','RefL17','ref17@example.com','1980-05-02','ACC000017'),('R0018','refpass18','RefF18','RefL18','ref18@example.com','1989-01-04','ACC000018'),('R0019','refpass19','RefF19','RefL19','ref19@example.com','1980-03-17','ACC000019'),('R002','1234','Jane','Smith','jsmith1@ivey.ca','1990-10-04','RBC09876545'),('R0020','refpass20','RefF20','RefL20','ref20@example.com','1991-07-01','ACC000020'),('R0021','refpass21','RefF21','RefL21','ref21@example.com','1992-06-14','ACC000021'),('R0022','refpass22','RefF22','RefL22','ref22@example.com','1983-11-16','ACC000022'),('R0023','refpass23','RefF23','RefL23','ref23@example.com','1980-01-26','ACC000023'),('R0024','refpass24','RefF24','RefL24','ref24@example.com','1985-08-15','ACC000024'),('R0025','refpass25','RefF25','RefL25','ref25@example.com','1971-10-28','ACC000025'),('R0026','refpass26','RefF26','RefL26','ref26@example.com','1971-09-27','ACC000026'),('R0027','refpass27','RefF27','RefL27','ref27@example.com','1995-08-08','ACC000027'),('R0028','refpass28','RefF28','RefL28','ref28@example.com','1970-05-27','ACC000028'),('R0029','refpass29','RefF29','RefL29','ref29@example.com','1985-12-21','ACC000029'),('R003','hello!','Samantha','Boyd','sboyd@gmail.com','2004-12-31','BMO098765456'),('R0030','refpass30','RefF30','RefL30','ref30@example.com','1973-01-19','ACC000030'),('R0031','refpass31','RefF31','RefL31','ref31@example.com','1974-02-10','ACC000031'),('R0032','refpass32','RefF32','RefL32','ref32@example.com','1975-09-16','ACC000032'),('R0033','refpass33','RefF33','RefL33','ref33@example.com','1980-07-07','ACC000033'),('R0034','refpass34','RefF34','RefL34','ref34@example.com','1974-04-12','ACC000034'),('R0035','refpass35','RefF35','RefL35','ref35@example.com','1979-01-28','ACC000035'),('R0036','refpass36','RefF36','RefL36','ref36@example.com','1980-08-05','ACC000036'),('R0037','refpass37','RefF37','RefL37','ref37@example.com','1977-01-10','ACC000037'),('R0038','refpass38','RefF38','RefL38','ref38@example.com','1973-02-16','ACC000038'),('R0039','refpass39','RefF39','RefL39','ref39@example.com','1985-06-27','ACC000039'),('R004','pword3!','alex','roberts','aroberts@gmail.com','1980-05-01','BMO9876545'),('R0040','refpass40','RefF40','RefL40','ref40@example.com','1985-09-05','ACC000040'),('R0041','refpass41','RefF41','RefL41','ref41@example.com','1984-12-09','ACC000041'),('R0042','refpass42','RefF42','RefL42','ref42@example.com','1981-12-07','ACC000042'),('R0043','refpass43','RefF43','RefL43','ref43@example.com','1989-12-23','ACC000043'),('R0044','refpass44','RefF44','RefL44','ref44@example.com','1978-03-12','ACC000044'),('R0045','refpass45','RefF45','RefL45','ref45@example.com','1976-05-21','ACC000045'),('R0046','refpass46','RefF46','RefL46','ref46@example.com','1973-01-28','ACC000046'),('R0047','refpass47','RefF47','RefL47','ref47@example.com','1981-07-25','ACC000047'),('R0048','refpass48','RefF48','RefL48','ref48@example.com','1993-01-18','ACC000048'),('R0049','refpass49','RefF49','RefL49','ref49@example.com','1985-06-04','ACC000049'),('R005','123enter','sam','smith','ssmith2@yahoo.com','1990-11-06','TD0987667'),('R0050','refpass50','RefF50','RefL50','ref50@example.com','1990-11-22','ACC000050');
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 12:01:09
