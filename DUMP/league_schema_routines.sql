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
-- Temporary view structure for view `team1roster`
--

DROP TABLE IF EXISTS `team1roster`;
/*!50001 DROP VIEW IF EXISTS `team1roster`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `team1roster` AS SELECT 
 1 AS `playerID`,
 1 AS `fName`,
 1 AS `lName`,
 1 AS `dob`,
 1 AS `address`,
 1 AS `phoneNum`,
 1 AS `email`,
 1 AS `goalsScored`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gameresults`
--

DROP TABLE IF EXISTS `gameresults`;
/*!50001 DROP VIEW IF EXISTS `gameresults`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gameresults` AS SELECT 
 1 AS `matchDate`,
 1 AS `matchTime`,
 1 AS `refID`,
 1 AS `homeTeam`,
 1 AS `awayTeam`,
 1 AS `facilityNo`,
 1 AS `homeGoals`,
 1 AS `awayGoals`,
 1 AS `homeTeamPoints`,
 1 AS `awayTeamPoints`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `team1roster`
--

/*!50001 DROP VIEW IF EXISTS `team1roster`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `team1roster` AS select `p`.`playerID` AS `playerID`,`p`.`fName` AS `fName`,`p`.`lName` AS `lName`,`p`.`dob` AS `dob`,`p`.`address` AS `address`,`p`.`phoneNum` AS `phoneNum`,`p`.`email` AS `email`,count(`g`.`playerID`) AS `goalsScored` from (`player` `p` left join `goal` `g` on((`g`.`playerID` = `p`.`playerID`))) where (`p`.`teamName` = 'Team1') group by `p`.`playerID`,`p`.`fName`,`p`.`lName`,`p`.`dob`,`p`.`address`,`p`.`phoneNum`,`p`.`email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gameresults`
--

/*!50001 DROP VIEW IF EXISTS `gameresults`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gameresults` AS with `goals_per_team` as (select `goal`.`matchDate` AS `matchDate`,`goal`.`matchTime` AS `matchTime`,`goal`.`facilityNo` AS `facilityNo`,`goal`.`teamName` AS `teamName`,count(0) AS `goals` from `goal` group by `goal`.`matchDate`,`goal`.`matchTime`,`goal`.`facilityNo`,`goal`.`teamName`) select `m`.`matchDate` AS `matchDate`,`m`.`matchTime` AS `matchTime`,`m`.`refID` AS `refID`,`m`.`homeTeam` AS `homeTeam`,`m`.`awayTeam` AS `awayTeam`,`m`.`facilityNo` AS `facilityNo`,`gh`.`goals` AS `homeGoals`,`ga`.`goals` AS `awayGoals`,(case when (`gh`.`goals` > `ga`.`goals`) then 2 when (`gh`.`goals` = `ga`.`goals`) then 1 else 0 end) AS `homeTeamPoints`,(case when (`ga`.`goals` > `gh`.`goals`) then 2 when (`ga`.`goals` = `gh`.`goals`) then 1 else 0 end) AS `awayTeamPoints` from ((`matchevent` `m` left join `goals_per_team` `gh` on(((`m`.`matchDate` = `gh`.`matchDate`) and (`m`.`matchTime` = `gh`.`matchTime`) and (`m`.`facilityNo` = `gh`.`facilityNo`) and (`m`.`homeTeam` = `gh`.`teamName`)))) left join `goals_per_team` `ga` on(((`m`.`matchDate` = `ga`.`matchDate`) and (`m`.`matchTime` = `ga`.`matchTime`) and (`m`.`facilityNo` = `ga`.`facilityNo`) and (`m`.`awayTeam` = `ga`.`teamName`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 12:01:10
