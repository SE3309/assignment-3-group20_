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
-- Table structure for table `assist`
--

DROP TABLE IF EXISTS `assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assist` (
  `matchDate` date NOT NULL,
  `matchTime` time NOT NULL,
  `timeScored` time NOT NULL,
  `facilityNo` int NOT NULL,
  `playerID` varchar(10) NOT NULL,
  `teamName` varchar(100) DEFAULT NULL,
  `assistType` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`matchDate`,`matchTime`,`timeScored`,`facilityNo`,`playerID`),
  KEY `playerID` (`playerID`),
  CONSTRAINT `assist_ibfk_1` FOREIGN KEY (`playerID`) REFERENCES `player` (`playerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assist_ibfk_2` FOREIGN KEY (`matchDate`, `matchTime`, `timeScored`, `facilityNo`) REFERENCES `goal` (`matchDate`, `matchTime`, `timeScored`, `facilityNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assist_chk_1` CHECK ((`assistType` in (_utf8mb4'primary',_utf8mb4'secondary')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assist`
--

LOCK TABLES `assist` WRITE;
/*!40000 ALTER TABLE `assist` DISABLE KEYS */;
INSERT INTO `assist` VALUES ('2025-10-04','19:00:00','00:05:00',1,'P2','Toronto Maple Leafs','primary'),('2025-10-04','19:00:00','00:05:00',1,'P3','Toronto Maple Leafs','secondary'),('2025-10-04','19:00:00','00:12:30',1,'P5','Leaside Wildcats','primary'),('2025-10-04','19:00:00','00:34:10',1,'P4','Leaside Wildcats','primary'),('2025-10-04','19:00:00','00:51:20',1,'P1','Toronto Maple Leafs','primary');
/*!40000 ALTER TABLE `assist` ENABLE KEYS */;
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
