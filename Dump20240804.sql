-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: busmanagementsystem
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `busdrivertable`
--

DROP TABLE IF EXISTS `busdrivertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busdrivertable` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `LicenseNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busdrivertable`
--

LOCK TABLES `busdrivertable` WRITE;
/*!40000 ALTER TABLE `busdrivertable` DISABLE KEYS */;
/*!40000 ALTER TABLE `busdrivertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busrider`
--

DROP TABLE IF EXISTS `busrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busrider` (
  `RiderID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `personalcharacteristics` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RiderID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busrider`
--

LOCK TABLES `busrider` WRITE;
/*!40000 ALTER TABLE `busrider` DISABLE KEYS */;
INSERT INTO `busrider` VALUES (1,'Regular','prefers window seat'),(2,'Occasional','likes window seat'),(3,'Daily','Prefers quiet area'),(4,'Frequent','Likes back seats');
/*!40000 ALTER TABLE `busrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busstop`
--

DROP TABLE IF EXISTS `busstop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busstop` (
  `StopID` int NOT NULL AUTO_INCREMENT,
  `Location` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`StopID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busstop`
--

LOCK TABLES `busstop` WRITE;
/*!40000 ALTER TABLE `busstop` DISABLE KEYS */;
INSERT INTO `busstop` VALUES (1,'Downtown'),(2,'uptwon'),(3,'suburb Central'),(4,'Airport'),(5,'University');
/*!40000 ALTER TABLE `busstop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driverschedule`
--

DROP TABLE IF EXISTS `driverschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driverschedule` (
  `DriverScheduleID` int NOT NULL AUTO_INCREMENT,
  `Employee` int DEFAULT NULL,
  `RouteID` int DEFAULT NULL,
  `WeeklySchedule` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`DriverScheduleID`),
  KEY `Employee` (`Employee`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `driverschedule_ibfk_1` FOREIGN KEY (`Employee`) REFERENCES `busdrivertable` (`EmployeeID`),
  CONSTRAINT `driverschedule_ibfk_2` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driverschedule`
--

LOCK TABLES `driverschedule` WRITE;
/*!40000 ALTER TABLE `driverschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `driverschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare`
--

DROP TABLE IF EXISTS `fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare` (
  `FareID` int NOT NULL AUTO_INCREMENT,
  `riderclass` varchar(50) DEFAULT NULL,
  `routeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FareID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare`
--

LOCK TABLES `fare` WRITE;
/*!40000 ALTER TABLE `fare` DISABLE KEYS */;
INSERT INTO `fare` VALUES (1,'Tourist','city'),(2,'regular','Intercity'),(3,'Occasional','city'),(4,'Monthly Pass','Suburban'),(5,'Tourist','city'),(6,'regular','Intercity'),(7,'Occasional','city'),(8,'Monthly Pass','Suburban');
/*!40000 ALTER TABLE `fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `RouteID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Express'),(2,'local'),(3,'integrity'),(4,'Night');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestep`
--

DROP TABLE IF EXISTS `routestep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routestep` (
  `RouteID` int NOT NULL,
  `stopID` int NOT NULL,
  PRIMARY KEY (`RouteID`,`stopID`),
  KEY `stopID` (`stopID`),
  CONSTRAINT `routestep_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`),
  CONSTRAINT `routestep_ibfk_2` FOREIGN KEY (`stopID`) REFERENCES `busstop` (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestep`
--

LOCK TABLES `routestep` WRITE;
/*!40000 ALTER TABLE `routestep` DISABLE KEYS */;
/*!40000 ALTER TABLE `routestep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestop`
--

DROP TABLE IF EXISTS `routestop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routestop` (
  `RouteID` int NOT NULL,
  `stopID` int NOT NULL,
  PRIMARY KEY (`RouteID`,`stopID`),
  KEY `stopID` (`stopID`),
  CONSTRAINT `routestop_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`),
  CONSTRAINT `routestop_ibfk_2` FOREIGN KEY (`stopID`) REFERENCES `busstop` (`StopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestop`
--

LOCK TABLES `routestop` WRITE;
/*!40000 ALTER TABLE `routestop` DISABLE KEYS */;
INSERT INTO `routestop` VALUES (1,1),(3,1),(4,1),(2,2),(3,2),(4,2),(2,3),(1,4);
/*!40000 ALTER TABLE `routestop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routetimingschedule`
--

DROP TABLE IF EXISTS `routetimingschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routetimingschedule` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `RouteID` int DEFAULT NULL,
  `KeyStopTimes` varchar(200) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `RouteID` (`RouteID`),
  CONSTRAINT `routetimingschedule_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routetimingschedule`
--

LOCK TABLES `routetimingschedule` WRITE;
/*!40000 ALTER TABLE `routetimingschedule` DISABLE KEYS */;
INSERT INTO `routetimingschedule` VALUES (1,1,'08:00,12:00,18:00','08:00:00'),(2,2,'09:00,13:00,19:00','09:00:00'),(3,3,'10:00,14:00,20:00','10:00:00'),(4,4,'11:00,15:00,21:00','11:00:00');
/*!40000 ALTER TABLE `routetimingschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduletype`
--

DROP TABLE IF EXISTS `scheduletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduletype` (
  `ScheduleTypeID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ScheduleTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduletype`
--

LOCK TABLES `scheduletype` WRITE;
/*!40000 ALTER TABLE `scheduletype` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-04 12:25:05
