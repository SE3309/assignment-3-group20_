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
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facilityNo` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`facilityNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'1 York Street','Scotiabank Arena'),(2,'2 Facility Rd','Field 2'),(3,'3 Facility Rd','Field 3'),(4,'4 Facility Rd','Field 4'),(5,'5 Facility Rd','Field 5'),(6,'6 Facility Rd','Field 6'),(7,'7 Facility Rd','Field 7'),(8,'8 Facility Rd','Field 8'),(9,'9 Facility Rd','Field 9'),(10,'10 Facility Rd','Field 10'),(11,'11 Facility Rd','Field 11'),(12,'12 Facility Rd','Field 12'),(13,'13 Facility Rd','Field 13'),(14,'14 Facility Rd','Field 14'),(15,'15 Facility Rd','Field 15'),(16,'16 Facility Rd','Field 16'),(17,'17 Facility Rd','Field 17'),(18,'18 Facility Rd','Field 18'),(19,'19 Facility Rd','Field 19'),(20,'20 Facility Rd','Field 20'),(21,'21 Facility Rd','Field 21'),(22,'22 Facility Rd','Field 22'),(23,'23 Facility Rd','Field 23'),(24,'24 Facility Rd','Field 24'),(25,'25 Facility Rd','Field 25'),(26,'26 Facility Rd','Field 26'),(27,'27 Facility Rd','Field 27'),(28,'28 Facility Rd','Field 28'),(29,'29 Facility Rd','Field 29'),(30,'30 Facility Rd','Field 30'),(31,'31 Facility Rd','Field 31'),(32,'32 Facility Rd','Field 32'),(33,'33 Facility Rd','Field 33'),(34,'34 Facility Rd','Field 34'),(35,'35 Facility Rd','Field 35'),(36,'36 Facility Rd','Field 36'),(37,'37 Facility Rd','Field 37'),(38,'38 Facility Rd','Field 38'),(39,'39 Facility Rd','Field 39'),(40,'40 Facility Rd','Field 40'),(41,'41 Facility Rd','Field 41'),(42,'42 Facility Rd','Field 42'),(43,'43 Facility Rd','Field 43'),(44,'44 Facility Rd','Field 44'),(45,'45 Facility Rd','Field 45'),(46,'46 Facility Rd','Field 46'),(47,'47 Facility Rd','Field 47'),(48,'48 Facility Rd','Field 48'),(49,'49 Facility Rd','Field 49'),(50,'50 Facility Rd','Field 50'),(51,'51 Facility Rd','Field 51');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
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
