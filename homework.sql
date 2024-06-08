CREATE DATABASE  IF NOT EXISTS `arknights` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arknights`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: arknights
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ÂåªÁîü`
--

DROP TABLE IF EXISTS `ÂåªÁîü`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ÂåªÁîü` (
  `ËÅåÂ∑•Âè∑` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ÊàøÈó¥Âè∑` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Â≠¶ÂéÜ` enum('Âàù‰∏≠','È´ò‰∏≠','Êú¨Áßë','Á°ïÂ£´','ÂçöÂ£´','ÂçöÂ£´Âêé') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ËÅåÁß∞` text COLLATE utf8mb4_unicode_ci,
  `ÁßëÁõÆ` text COLLATE utf8mb4_unicode_ci,
  `ÊéíÁè≠‰ø°ÊÅØ` text COLLATE utf8mb4_unicode_ci,
  `ÂßìÂêç` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ÊÄßÂà´` enum('Áî∑','Â•≥') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Âπ¥ÈæÑ` tinyint DEFAULT NULL,
  `Â∑•ËµÑ` int DEFAULT NULL,
  PRIMARY KEY (`ËÅåÂ∑•Âè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ÂåªÁîü`
--

LOCK TABLES `ÂåªÁîü` WRITE;
/*!40000 ALTER TABLE `ÂåªÁîü` DISABLE KEYS */;
INSERT INTO `ÂåªÁîü` VALUES ('D0001','104','ÂçöÂ£´','‰∏ªÊ≤ªÂåªÂ∏à','Ë°ÄÊ∂≤Áßë','Âë®‰∫åÂà∞Âë®‰∫î','ÂçéÊ≥ïÁê≥','Â•≥',22,29000),('D0006','105','ÂçöÂ£´Âêé','ÂâØ‰∏ª‰ªªÂåªÂ∏à','Â§ñÁßë','Âë®‰∏ÄÂà∞Âë®Âõõ','ËâæÈõÖÊ≥ïÊãâ','Â•≥',20,100000),('D0007','106','ÂçöÂ£´','ÂâØ‰∏ª‰ªªÂåªÂ∏à','ÂëºÂê∏Áßë','Âë®‰∫åÂà∞Âë®Âõõ','ÊµÅÊòé','Áî∑',22,20000),('D1234','101','ÂçöÂ£´','‰∏ª‰ªªÂåªÂ∏à','ÂÜÖÁßë','Âë®‰∏ÄËá≥Âë®‰∫î','ËµµÂÖ≠','Áî∑',50,20000),('D5678','102','Á°ïÂ£´','ÂâØ‰∏ª‰ªªÂåªÂ∏à','Â§ñÁßë','Âë®‰∏ÄËá≥Âë®Âõõ','Â≠ô‰∏É','Â•≥',40,18000),('D9012','103','Êú¨Áßë','‰∏ªÊ≤ªÂåªÂ∏à','ÂÑøÁßë','Âë®‰∫åËá≥Âë®‰∫î','Âë®ÂÖ´','Áî∑',35,15000);
/*!40000 ALTER TABLE `ÂåªÁîü` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ÊÇ£ËÄÖ`
--

DROP TABLE IF EXISTS `ÊÇ£ËÄÖ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ÊÇ£ËÄÖ` (
  `Ë∫´‰ªΩËØÅÂè∑` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ÂßìÂêç` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ÊÄßÂà´` enum('Áî∑','Â•≥') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Âπ¥ÈæÑ` tinyint DEFAULT NULL,
  `ÁóÖÂè≤` text COLLATE utf8mb4_unicode_ci,
  `ÈÇÆÁÆ±` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ËÅîÁ≥ªÁîµËØù` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ë∫´‰ªΩËØÅÂè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ÊÇ£ËÄÖ`
--

LOCK TABLES `ÊÇ£ËÄÖ` WRITE;
/*!40000 ALTER TABLE `ÊÇ£ËÄÖ` DISABLE KEYS */;
INSERT INTO `ÊÇ£ËÄÖ` VALUES ('10001','Ëø∑Ëø≠È¶ô','Â•≥',14,'ÂøÉËÑèÁóÖ','mdx@qq.com','15855920176'),('10004','Â∞èÁæä','Â•≥',14,'Â§±ËÅ™Áóá','xiaoyang@qq.com','18269836660'),('10090','ÁöáÂ•≥','Â•≥',25,'È™®Êäò','q@qq.com','12345678987'),('13453','Áéã‰πü','Áî∑',25,'È£éÊπøÈ™®ÁóÖ','wy@qq.com','13800138001'),('54321','ÊùéÂõõ','Â•≥',28,'È´òË°ÄÂéã','lisi@example.com','13800138001');
/*!40000 ALTER TABLE `ÊÇ£ËÄÖ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ÊÇ£ËÄÖÁî®Êà∑`
--

DROP TABLE IF EXISTS `ÊÇ£ËÄÖÁî®Êà∑`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ÊÇ£ËÄÖÁî®Êà∑` (
  `Ë∫´‰ªΩËØÅÂè∑` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ë¥¶Âè∑` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ÂØÜÁ†Å` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ë¥¶Âè∑`),
  KEY `ÊÇ£ËÄÖÁî®Êà∑_ibfk_1` (`Ë∫´‰ªΩËØÅÂè∑`),
  CONSTRAINT `ÊÇ£ËÄÖÁî®Êà∑_ibfk_1` FOREIGN KEY (`Ë∫´‰ªΩËØÅÂè∑`) REFERENCES `ÊÇ£ËÄÖ` (`Ë∫´‰ªΩËØÅÂè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ÊÇ£ËÄÖÁî®Êà∑`
--

LOCK TABLES `ÊÇ£ËÄÖÁî®Êà∑` WRITE;
/*!40000 ALTER TABLE `ÊÇ£ËÄÖÁî®Êà∑` DISABLE KEYS */;
INSERT INTO `ÊÇ£ËÄÖÁî®Êà∑` VALUES ('54321','lisi','password2'),('10001','mdx','mdx'),('10090','queen','q'),('13453','wy','wy'),('10004','xy','xy');
/*!40000 ALTER TABLE `ÊÇ£ËÄÖÁî®Êà∑` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ÊîØ‰ªò`
--

DROP TABLE IF EXISTS `ÊîØ‰ªò`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ÊîØ‰ªò` (
  `ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ë¥¶ÂçïÂè∑` tinyint NOT NULL,
  `ÊîØ‰ªòÊó∂Èó¥` datetime DEFAULT NULL,
  `ÊîØ‰ªòÈáëÈ¢ù` int DEFAULT NULL,
  PRIMARY KEY (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`,`Ë¥¶ÂçïÂè∑`),
  KEY `ÊîØ‰ªò_ibfk_2` (`Ë¥¶ÂçïÂè∑`),
  CONSTRAINT `ÊîØ‰ªò_ibfk_1` FOREIGN KEY (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`) REFERENCES `ÊÇ£ËÄÖ` (`Ë∫´‰ªΩËØÅÂè∑`),
  CONSTRAINT `ÊîØ‰ªò_ibfk_2` FOREIGN KEY (`Ë¥¶ÂçïÂè∑`) REFERENCES `Ë¥¶Âçï` (`Ë¥¶ÂçïÂè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ÊîØ‰ªò`
--

LOCK TABLES `ÊîØ‰ªò` WRITE;
/*!40000 ALTER TABLE `ÊîØ‰ªò` DISABLE KEYS */;
INSERT INTO `ÊîØ‰ªò` VALUES ('10090',4,'2000-01-01 00:00:00',11),('13453',3,'2000-01-01 00:00:00',12),('54321',2,'2024-06-02 11:00:00',800);
/*!40000 ALTER TABLE `ÊîØ‰ªò` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Áî®Êà∑`
--

DROP TABLE IF EXISTS `Áî®Êà∑`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Áî®Êà∑` (
  `Ë¥¶Âè∑` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ÂØÜÁ†Å` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ë¥¶Âè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Áî®Êà∑`
--

LOCK TABLES `Áî®Êà∑` WRITE;
/*!40000 ALTER TABLE `Áî®Êà∑` DISABLE KEYS */;
INSERT INTO `Áî®Êà∑` VALUES ('amiya','cute'),('doctor','doctor'),('kaierxi','kex');
/*!40000 ALTER TABLE `Áî®Êà∑` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ë¥¶Âçï`
--

DROP TABLE IF EXISTS `Ë¥¶Âçï`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ë¥¶Âçï` (
  `Ë¥¶ÂçïÂè∑` tinyint NOT NULL,
  `ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ÊîØ‰ªòÊó∂Èó¥` datetime DEFAULT NULL,
  `ÊîØ‰ªòÈáëÈ¢ù` int DEFAULT NULL,
  `Áä∂ÊÄÅ` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Ë¥¶ÂçïÂè∑`),
  KEY `Ë¥¶Âçï_ibfk_1` (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`),
  CONSTRAINT `Ë¥¶Âçï_ibfk_1` FOREIGN KEY (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`) REFERENCES `ÊÇ£ËÄÖ` (`Ë∫´‰ªΩËØÅÂè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ë¥¶Âçï`
--

LOCK TABLES `Ë¥¶Âçï` WRITE;
/*!40000 ALTER TABLE `Ë¥¶Âçï` DISABLE KEYS */;
INSERT INTO `Ë¥¶Âçï` VALUES (2,'54321','2024-06-02 11:00:00',800,'Â∑≤ÊîØ‰ªò'),(3,'13453',NULL,12,'Â∑≤ÊîØ‰ªò'),(4,'10090','2000-01-01 00:00:00',11,'Â∑≤ÊîØ‰ªò');
/*!40000 ALTER TABLE `Ë¥¶Âçï` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `È¢ÑÁ∫¶`
--

DROP TABLE IF EXISTS `È¢ÑÁ∫¶`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `È¢ÑÁ∫¶` (
  `È¢ÑÁ∫¶ÁºñÂè∑` tinyint DEFAULT NULL,
  `ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ÂåªÁîüËÅåÂ∑•Âè∑` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `È¢ÑÁ∫¶Êó∂Èó¥` datetime DEFAULT NULL,
  `Áä∂ÊÄÅ` enum('Êú™Â∞±ËØä','Â∑≤Â∞±ËØä') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`,`ÂåªÁîüËÅåÂ∑•Âè∑`),
  KEY `È¢ÑÁ∫¶_ibfk_2` (`ÂåªÁîüËÅåÂ∑•Âè∑`),
  CONSTRAINT `È¢ÑÁ∫¶_ibfk_1` FOREIGN KEY (`ÊÇ£ËÄÖË∫´‰ªΩËØÅÂè∑`) REFERENCES `ÊÇ£ËÄÖ` (`Ë∫´‰ªΩËØÅÂè∑`),
  CONSTRAINT `È¢ÑÁ∫¶_ibfk_2` FOREIGN KEY (`ÂåªÁîüËÅåÂ∑•Âè∑`) REFERENCES `ÂåªÁîü` (`ËÅåÂ∑•Âè∑`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `È¢ÑÁ∫¶`
--

LOCK TABLES `È¢ÑÁ∫¶` WRITE;
/*!40000 ALTER TABLE `È¢ÑÁ∫¶` DISABLE KEYS */;
INSERT INTO `È¢ÑÁ∫¶` VALUES (4,'10001','D0001','2024-06-12 09:00:00','Êú™Â∞±ËØä',NULL),(3,'10004','D0001','2024-06-23 09:00:00','Â∑≤Â∞±ËØä',4),(6,'10004','D1234','2024-06-22 09:00:00','Â∑≤Â∞±ËØä',NULL),(7,'10090','D0001','2024-07-11 15:00:00','Â∑≤Â∞±ËØä',4),(5,'13453','D0001','2024-07-21 12:00:00','Â∑≤Â∞±ËØä',4),(2,'54321','D5678','2024-06-06 10:00:00','Êú™Â∞±ËØä',NULL);
/*!40000 ALTER TABLE `È¢ÑÁ∫¶` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'arknights'
--
/*!50003 DROP PROCEDURE IF EXISTS `AdminLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminLogin`(
    IN p_account VARCHAR(20),IN p_password VARCHAR(50),out account VARCHAR(20))
begin
     select ’À∫≈ into account from ”√ªß where ’À∫≈ = p_account AND √‹¬Î = p_password;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelAppointment`(
    IN p_appointment_id INT
)
BEGIN
    START TRANSACTION;

    DELETE FROM ‘§‘º WHERE ‘§‘º±‡∫≈ = p_appointment_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDoctor`(
    IN p_doctor_id VARCHAR(5)
)
BEGIN
    START TRANSACTION;
    DELETE FROM “Ω…˙ 
    WHERE ÷∞π§∫≈ = p_doctor_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePatientData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePatientData`(
    IN p_patient_id VARCHAR(5)
)
BEGIN
    START TRANSACTION;

    DELETE FROM ÷ß∏∂ WHERE ªº’ﬂ…Ì∑›÷§∫≈ = p_patient_id;
    DELETE FROM ’Àµ• WHERE ªº’ﬂ…Ì∑›÷§∫≈ = p_patient_id;
    DELETE FROM ‘§‘º WHERE ªº’ﬂ…Ì∑›÷§∫≈ = p_patient_id;
    DELETE FROM ªº’ﬂ”√ªß WHERE …Ì∑›÷§∫≈ = p_patient_id;
    DELETE FROM ªº’ﬂ WHERE …Ì∑›÷§∫≈ = p_patient_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePatientUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePatientUser`(
    IN p_patient_id VARCHAR(5)
)
BEGIN
    DELETE FROM ªº’ﬂ”√ªß WHERE …Ì∑›÷§∫≈ = p_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
    IN p_account VARCHAR(20)
)
BEGIN
    DELETE FROM ”√ªß WHERE ’À∫≈ = p_account;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPatientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPatientInfo`(
    OUT patient_info TEXT
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id VARCHAR(5);
    DECLARE v_name VARCHAR(10);
    DECLARE v_gender ENUM('ƒ–', '≈Æ');
    DECLARE v_age TINYINT;
    DECLARE v_history TEXT;
    DECLARE v_email VARCHAR(20);
    DECLARE v_phone VARCHAR(11);
    DECLARE v_appt_id TINYINT;
    DECLARE v_doc_id VARCHAR(5);
    DECLARE v_appt_time DATETIME;
    DECLARE v_appt_status ENUM('Œ¥æÕ’Ô', '“—æÕ’Ô');
    DECLARE v_priority INT;
    DECLARE v_bill_id TINYINT;
    DECLARE v_bill_time DATETIME;
    DECLARE v_bill_amount INT;
    DECLARE v_bill_status TEXT;

    DECLARE cur CURSOR FOR
        SELECT 
            p.…Ì∑›÷§∫≈, 
            p.–’√˚, 
            p.–‘±, 
            p.ƒÍ¡‰, 
            p.≤° ∑, 
            p.” œ‰, 
            p.¡™œµµÁª∞,
            IFNULL(a.‘§‘º±‡∫≈, 0) AS ‘§‘º±‡∫≈,
            IFNULL(a.“Ω…˙÷∞π§∫≈, 'Œﬁ‘§‘º') AS “Ω…˙÷∞π§∫≈,
            IFNULL(a.‘§‘º ±º‰, NULL) AS ‘§‘º ±º‰,
            IFNULL(a.◊¥Ã¨, 'Œﬁ‘§‘º') AS ‘§‘º◊¥Ã¨,
            IFNULL(a.priority, 0) AS priority,
            IFNULL(b.’Àµ•∫≈, 0) AS ’Àµ•∫≈,
            IFNULL(b.÷ß∏∂ ±º‰, NULL) AS ÷ß∏∂ ±º‰,
            IFNULL(b.÷ß∏∂Ω∂Ó, 0) AS ÷ß∏∂Ω∂Ó,
            IFNULL(b.◊¥Ã¨, 'Œﬁ’Àµ•') AS ’Àµ•◊¥Ã¨
        FROM ªº’ﬂ p
        LEFT JOIN ‘§‘º a ON p.…Ì∑›÷§∫≈ = a.ªº’ﬂ…Ì∑›÷§∫≈
        LEFT JOIN ’Àµ• b ON p.…Ì∑›÷§∫≈ = b.ªº’ﬂ…Ì∑›÷§∫≈;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    SET patient_info = '';
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO 
            v_id, 
            v_name, 
            v_gender, 
            v_age, 
            v_history, 
            v_email, 
            v_phone,
            v_appt_id,
            v_doc_id,
            v_appt_time,
            v_appt_status,
            v_priority,
            v_bill_id,
            v_bill_time,
            v_bill_amount,
            v_bill_status;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET patient_info = CONCAT(
            patient_info, 
            '…Ì∑›÷§∫≈£∫', v_id, '\n',
            '–’√˚£∫', v_name, '\n',
            '–‘±£∫', v_gender, '\n',
            'ƒÍ¡‰£∫', v_age, '\n',
            '≤° ∑£∫', v_history, '\n',
            '” œ‰£∫', v_email, '\n',
            '¡™œµµÁª∞£∫', v_phone, '\n',
            '‘§‘º±‡∫≈£∫', v_appt_id, '\n',
            '“Ω…˙÷∞π§∫≈£∫', v_doc_id, '\n',
            '‘§‘º ±º‰£∫', IFNULL(DATE_FORMAT(v_appt_time, '%Y-%m-%d %H:%i:%s'), 'Œﬁ‘§‘º'), '\n',
            '‘§‘º◊¥Ã¨£∫', v_appt_status, '\n',
            '”≈œ»º∂£∫', v_priority, '\n',
            '’Àµ•∫≈£∫', v_bill_id, '\n',
            '÷ß∏∂ ±º‰£∫', IFNULL(DATE_FORMAT(v_bill_time, '%Y-%m-%d %H:%i:%s'), 'Œﬁ’Àµ•'), '\n',
            '÷ß∏∂Ω∂Ó£∫', v_bill_amount, '\n',
            '’Àµ•◊¥Ã¨£∫', v_bill_status, '\n\n'
        );
    END LOOP;
    
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBillInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBillInfo`(
    IN patient_id VARCHAR(5),
    OUT bill_info TEXT
)
BEGIN
    DECLARE result_found INT DEFAULT 0;
    SELECT COUNT(*) INTO result_found FROM ’Àµ• WHERE ªº’ﬂ…Ì∑›÷§∫≈ = patient_id;
    IF result_found > 0 THEN
        SELECT CONCAT('’Àµ•∫≈£∫', ’Àµ•∫≈, '\nªº’ﬂ…Ì∑›÷§∫≈£∫', ªº’ﬂ…Ì∑›÷§∫≈, '\n÷ß∏∂ ±º‰£∫', IFNULL(÷ß∏∂ ±º‰, 'N/A'), '\n÷ß∏∂Ω∂Ó£∫', ÷ß∏∂Ω∂Ó, '\n◊¥Ã¨£∫', ◊¥Ã¨)
        INTO bill_info
        FROM ’Àµ•
        WHERE ªº’ﬂ…Ì∑›÷§∫≈ = patient_id;
    ELSE
        SET bill_info = 'Œ¥’“µΩ∏√ªº’ﬂµƒ’Àµ•–≈œ¢';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDoctorInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDoctorInfo`(
    IN p_doctor_id VARCHAR(5),
    OUT doctor_info TEXT
)
BEGIN
    DECLARE result_found INT DEFAULT 0;
    SELECT COUNT(*) INTO result_found FROM “Ω…˙ WHERE ÷∞π§∫≈ = p_doctor_id;
    IF result_found > 0 THEN
        SELECT CONCAT_WS('|', ÷∞π§∫≈, ∑øº‰∫≈, —ß¿˙, ÷∞≥∆, ø∆ƒø, ≈≈∞‡–≈œ¢, –’√˚, –‘±, ƒÍ¡‰, π§◊ )
        INTO doctor_info
        FROM “Ω…˙
        WHERE ÷∞π§∫≈ = p_doctor_id;
    ELSE
        SET doctor_info = 'Œ¥’“µΩ∏√“Ω…˙µƒ–≈œ¢';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientAppointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientAppointments`(
    IN p_patient_id VARCHAR(5)
)
BEGIN
    SELECT * FROM ‘§‘º WHERE ªº’ﬂ…Ì∑›÷§∫≈ = p_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPatientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatientInfo`(
    IN patient_id VARCHAR(5),
    OUT patient_info VARCHAR(255)
)
BEGIN
    DECLARE result_found INT DEFAULT 0;
    SELECT COUNT(*) INTO result_found FROM ªº’ﬂ WHERE …Ì∑›÷§∫≈ = patient_id;
    IF result_found > 0 THEN
        SELECT CONCAT('…Ì∑›÷§∫≈£∫', …Ì∑›÷§∫≈, '\n–’√˚£∫', –’√˚, '\n–‘±£∫', –‘±, '\nƒÍ¡‰£∫', ƒÍ¡‰, '\n≤° ∑£∫', ≤° ∑, '\n” œ‰£∫', ” œ‰, '\n¡™œµµÁª∞£∫', ¡™œµµÁª∞)
        INTO patient_info
        FROM ªº’ﬂ
        WHERE …Ì∑›÷§∫≈ = patient_id;
    ELSE
        SET patient_info = 'Œ¥’“µΩ∏√ªº’ﬂµƒ–≈œ¢';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertAppointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAppointment`(
    IN p_doctor_id VARCHAR(5),
    IN p_time DATETIME,
    IN p_patient_id VARCHAR(5),
    IN p_priority INT
)
BEGIN
    DECLARE new_id INT;
    SELECT IFNULL(MAX(‘§‘º±‡∫≈), 0) + 1 INTO new_id FROM ‘§‘º;
    
    INSERT INTO ‘§‘º (‘§‘º±‡∫≈, “Ω…˙÷∞π§∫≈, ‘§‘º ±º‰, ªº’ﬂ…Ì∑›÷§∫≈, ◊¥Ã¨, priority)
    VALUES (new_id, p_doctor_id, p_time, p_patient_id, 'Œ¥æÕ’Ô', p_priority);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBill`(
    IN p_bill_id TINYINT,
    IN p_patient_id VARCHAR(5),
    IN p_amount INT
)
BEGIN
    DECLARE new_bill_id INT;
    SET new_bill_id = p_bill_id;

    INSERT INTO ’Àµ• (’Àµ•∫≈, ªº’ﬂ…Ì∑›÷§∫≈, ÷ß∏∂ ±º‰, ÷ß∏∂Ω∂Ó, ◊¥Ã¨)
    VALUES (new_bill_id, p_patient_id, NULL, p_amount, 'Œ¥÷ß∏∂');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDoctor`(
    IN p_doctor_id VARCHAR(5),
    IN p_room_no VARCHAR(3),
    IN p_education TEXT,
    IN p_title TEXT,
    IN p_subject TEXT,
    IN p_schedule TEXT,
    IN p_name VARCHAR(10),
    IN p_gender ENUM('ƒ–', '≈Æ'),
    IN p_age TINYINT,
    IN p_salary INT
)
BEGIN
    INSERT INTO “Ω…˙ (÷∞π§∫≈, ∑øº‰∫≈, —ß¿˙, ÷∞≥∆, ø∆ƒø, ≈≈∞‡–≈œ¢, –’√˚, –‘±, ƒÍ¡‰, π§◊ )
    VALUES (p_doctor_id, p_room_no, p_education, p_title, p_subject, p_schedule, p_name, p_gender, p_age, p_salary);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
    IN p_account VARCHAR(20),
    IN p_password VARCHAR(20)
)
BEGIN
    INSERT INTO ”√ªß (’À∫≈, √‹¬Î) VALUES (p_account, p_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PatientLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientLogin`(
    IN p_account VARCHAR(20),IN p_password VARCHAR(50),out account VARCHAR(20))
begin
      select ’À∫≈ into account from ªº’ﬂ”√ªß where ’À∫≈ = p_account AND √‹¬Î = p_password;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
    IN p_id VARCHAR(5),
    IN p_account VARCHAR(20),
    IN p_password VARCHAR(20),
    IN p_name VARCHAR(10),
    IN p_gender ENUM('ƒ–', '≈Æ'),
    IN p_age TINYINT,
    IN p_history TEXT,
    IN p_email VARCHAR(20),
    IN p_phone VARCHAR(11)
)
BEGIN
    
    INSERT INTO ªº’ﬂ (…Ì∑›÷§∫≈, –’√˚, –‘±, ƒÍ¡‰, ≤° ∑, ” œ‰, ¡™œµµÁª∞)
    VALUES (p_id, p_name, p_gender, p_age, p_history, p_email, p_phone);
    
    
    INSERT INTO ªº’ﬂ”√ªß (…Ì∑›÷§∫≈, ’À∫≈, √‹¬Î)
    VALUES (p_id, p_account, p_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateAppointmentStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAppointmentStatus`(
    IN p_appointment_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    
    IF EXISTS (SELECT 1 FROM ‘§‘º WHERE ‘§‘º±‡∫≈ = p_appointment_id AND ◊¥Ã¨ = 'Œ¥æÕ’Ô') THEN
        
        UPDATE ‘§‘º
        SET ◊¥Ã¨ = '“—æÕ’Ô'
        WHERE ‘§‘º±‡∫≈ = p_appointment_id;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBillStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBillStatus`(
    IN p_bill_id INT,
    IN p_payment_time DATETIME
)
BEGIN
    DECLARE p_patient_id VARCHAR(5);

    SELECT ªº’ﬂ…Ì∑›÷§∫≈ INTO p_patient_id
    FROM ’Àµ•
    WHERE ’Àµ•∫≈ = p_bill_id;

    UPDATE ’Àµ•
    SET ◊¥Ã¨ = '“—÷ß∏∂', ÷ß∏∂ ±º‰ = p_payment_time
    WHERE ’Àµ•∫≈ = p_bill_id;

    INSERT INTO ÷ß∏∂ (ªº’ﬂ…Ì∑›÷§∫≈, ’Àµ•∫≈, ÷ß∏∂ ±º‰, ÷ß∏∂Ω∂Ó)
    VALUES (p_patient_id, p_bill_id, p_payment_time, (SELECT ÷ß∏∂Ω∂Ó FROM ’Àµ• WHERE ’Àµ•∫≈ = p_bill_id));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctorSalary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctorSalary`(
    IN p_doctor_id VARCHAR(5),
    IN p_salary INT
)
BEGIN
    START TRANSACTION;
    UPDATE “Ω…˙ 
    SET π§◊  = p_salary 
    WHERE ÷∞π§∫≈ = p_doctor_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctorTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctorTitle`(
    IN p_doctor_id VARCHAR(5),
    IN p_title TEXT
)
BEGIN
    START TRANSACTION;
    UPDATE “Ω…˙ 
    SET ÷∞≥∆ = p_title 
    WHERE ÷∞π§∫≈ = p_doctor_id;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePatientEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePatientEmail`(
    IN p_patient_id VARCHAR(18),
    IN p_email VARCHAR(50)
)
BEGIN
    UPDATE ªº’ﬂ
    SET ” œ‰ = p_email
    WHERE …Ì∑›÷§∫≈ = p_patient_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePatientPhone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePatientPhone`(
    IN p_patient_id VARCHAR(18),
    IN p_phone VARCHAR(20)
)
BEGIN
    UPDATE ªº’ﬂ
    SET ¡™œµµÁª∞ = p_phone
    WHERE …Ì∑›÷§∫≈ = p_patient_id;
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

-- Dump completed on 2024-06-09  4:52:58
