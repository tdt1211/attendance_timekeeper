-- MySQL dump 10.13  Distrib 8.4.4, for Linux (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.4.4
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;


/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;


/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;


/*!50503 SET NAMES utf8mb4 */
;


/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;


/*!40103 SET TIME_ZONE='+00:00' */
;


/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;


/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;


/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;


/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `attendance`
--
DROP TABLE IF EXISTS `attendance`;


/*!40101 SET @saved_cs_client     = @@character_set_client */
;


/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `attendance` (
    `user_id` tinyint DEFAULT NULL,
    `name` varchar(12) DEFAULT NULL,
    `department` varchar(9) DEFAULT NULL,
    `date` varchar(10) DEFAULT NULL,
    `checkin` varchar(5) DEFAULT NULL,
    `checkout` varchar(5) DEFAULT NULL) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `attendance`
--
LOCK TABLES `attendance` WRITE;


/*!40000 ALTER TABLE `attendance` DISABLE KEYS */
;

INSERT INTO `attendance`
    VALUES (1, 'Nguyễn Văn A', 'Nhân sự', '05/07/2025', '08:00', '17:00'),
    (2, 'Nguyễn Văn B', 'Tài Chính', '05/07/2025', '08:05', '17:00'),
    (3, 'Võ Văn C', 'Lao Công', '04/07/2025', '08:00', '17:00'),
    (4, 'Võ Thị D', 'Nhân sự', '04/07/2025', '08:10', '17:00'),
    (5, 'Trần Thị E', 'Tài Chính', '05/07/2025', '08:02', '17:00'),
    (6, 'Nhâm Thị F', 'Quản lý', '04/07/2025', '08:10', '17:00'),
    (6, 'Nhâm Thị F', 'Quản lý', '2025-07-04', '08:10', '17:00');


/*!40000 ALTER TABLE `attendance` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--
DROP TABLE IF EXISTS `sqlite_sequence`;


/*!40101 SET @saved_cs_client     = @@character_set_client */
;


/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `sqlite_sequence` (
    `name` varchar(10) DEFAULT NULL,
    `seq` tinyint DEFAULT NULL) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;


/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `sqlite_sequence`
--
LOCK TABLES `sqlite_sequence` WRITE;


/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */
;

INSERT INTO `sqlite_sequence`
    VALUES ('attendance', 6);


/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */
;

UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;


/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;


/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;


/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2025-04-11 13:29:54
