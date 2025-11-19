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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `teamName` varchar(100) NOT NULL,
  `leagueName` varchar(50) NOT NULL,
  `inPlayoffs` tinyint(1) NOT NULL DEFAULT (0),
  `city` varchar(50) DEFAULT NULL,
  `mascot` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teamName`),
  KEY `fk_team_mascot` (`mascot`),
  CONSTRAINT `fk_team_mascot` FOREIGN KEY (`mascot`) REFERENCES `mascot` (`mascot`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Donmills Flyers','East',0,'Toronto','Flyers'),('Leaside Wildcats','East',0,'London','Wildcats'),('London Knights','West',0,'London','Knights'),('Team1','National',0,'London','Mascot1'),('Team10','West',0,'Waterloo','Mascot10'),('Team11','National',0,'Toronto','Mascot11'),('Team12','West',0,'Hamilton','Mascot12'),('Team13','National',0,'Waterloo','Mascot13'),('Team14','East',0,'Waterloo','Mascot14'),('Team15','East',0,'Kingston','Mascot15'),('Team16','Atlantic',0,'Toronto','Mascot16'),('Team17','East',0,'Ottawa','Mascot17'),('Team18','Atlantic',0,'Ottawa','Mascot18'),('Team19','National',0,'Hamilton','Mascot19'),('Team2','National',0,'Toronto','Mascot2'),('Team20','Atlantic',0,'Ottawa','Mascot20'),('Team21','West',0,'Toronto','Mascot21'),('Team22','National',0,'London','Mascot22'),('Team23','National',0,'Toronto','Mascot23'),('Team24','West',0,'Toronto','Mascot24'),('Team25','National',0,'Toronto','Mascot25'),('Team3','West',0,'London','Mascot3'),('Team4','West',0,'Kingston','Mascot4'),('Team5','National',0,'Waterloo','Mascot5'),('Team6','National',0,'Toronto','Mascot6'),('Team7','Atlantic',0,'Kingston','Mascot7'),('Team8','East',0,'Hamilton','Mascot8'),('Team9','East',0,'Waterloo','Mascot9'),('Toronto Maple Leafs','East',0,'Toronto','Leafs'),('Toronto Raptors','East',0,'Toronto','Raptors');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
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
