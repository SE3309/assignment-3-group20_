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
-- Table structure for table `mascot`
--

DROP TABLE IF EXISTS `mascot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascot` (
  `mascot` varchar(50) NOT NULL,
  `primaryColor` varchar(50) NOT NULL,
  `secondaryColor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mascot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascot`
--

LOCK TABLES `mascot` WRITE;
/*!40000 ALTER TABLE `mascot` DISABLE KEYS */;
INSERT INTO `mascot` VALUES ('Flyers','Orange','Black'),('Knights','Green','Yellow'),('Leafs','Blue','White'),('Mascot1','Colour1','ColourAlt1'),('Mascot10','Colour10','ColourAlt10'),('Mascot11','Colour11','ColourAlt11'),('Mascot12','Colour12','ColourAlt12'),('Mascot13','Colour13','ColourAlt13'),('Mascot14','Colour14','ColourAlt14'),('Mascot15','Colour15','ColourAlt15'),('Mascot16','Colour16','ColourAlt16'),('Mascot17','Colour17','ColourAlt17'),('Mascot18','Colour18','ColourAlt18'),('Mascot19','Colour19','ColourAlt19'),('Mascot2','Colour2','ColourAlt2'),('Mascot20','Colour20','ColourAlt20'),('Mascot21','Colour21','ColourAlt21'),('Mascot22','Colour22','ColourAlt22'),('Mascot23','Colour23','ColourAlt23'),('Mascot24','Colour24','ColourAlt24'),('Mascot25','Colour25','ColourAlt25'),('Mascot3','Colour3','ColourAlt3'),('Mascot4','Colour4','ColourAlt4'),('Mascot5','Colour5','ColourAlt5'),('Mascot6','Colour6','ColourAlt6'),('Mascot7','Colour7','ColourAlt7'),('Mascot8','Colour8','ColourAlt8'),('Mascot9','Colour9','ColourAlt9'),('Raptors','Red','White'),('Wildcats','Red','White');
/*!40000 ALTER TABLE `mascot` ENABLE KEYS */;
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
