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
-- Table structure for table `医生`
--

DROP TABLE IF EXISTS `医生`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `医生` (
  `职工号` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `房间号` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `学历` enum('初中','高中','本科','硕士','博士','博士后') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `职称` text COLLATE utf8mb4_unicode_ci,
  `科目` text COLLATE utf8mb4_unicode_ci,
  `排班信息` text COLLATE utf8mb4_unicode_ci,
  `姓名` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `性别` enum('男','女') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `年龄` tinyint DEFAULT NULL,
  `工资` int DEFAULT NULL,
  PRIMARY KEY (`职工号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `医生`
--

LOCK TABLES `医生` WRITE;
/*!40000 ALTER TABLE `医生` DISABLE KEYS */;
INSERT INTO `医生` VALUES ('D0001','104','博士','主治医师','血液科','周二到周五','华法琳','女',22,29000),('D0006','105','博士后','副主任医师','外科','周一到周四','艾雅法拉','女',20,100000),('D0007','106','博士','副主任医师','呼吸科','周二到周四','流明','男',22,20000),('D1234','101','博士','主任医师','内科','周一至周五','赵六','男',50,20000),('D5678','102','硕士','副主任医师','外科','周一至周四','孙七','女',40,18000),('D9012','103','本科','主治医师','儿科','周二至周五','周八','男',35,15000);
/*!40000 ALTER TABLE `医生` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `患者`
--

DROP TABLE IF EXISTS `患者`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `患者` (
  `身份证号` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `姓名` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `性别` enum('男','女') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `年龄` tinyint DEFAULT NULL,
  `病史` text COLLATE utf8mb4_unicode_ci,
  `邮箱` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `联系电话` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`身份证号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `患者`
--

LOCK TABLES `患者` WRITE;
/*!40000 ALTER TABLE `患者` DISABLE KEYS */;
INSERT INTO `患者` VALUES ('10001','迷迭香','女',14,'心脏病','mdx@qq.com','15855920176'),('10004','小羊','女',14,'失聪症','xiaoyang@qq.com','18269836660'),('10090','皇女','女',25,'骨折','q@qq.com','12345678987'),('13453','王也','男',25,'风湿骨病','wy@qq.com','13800138001'),('54321','李四','女',28,'高血压','lisi@example.com','13800138001');
/*!40000 ALTER TABLE `患者` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `患者用户`
--

DROP TABLE IF EXISTS `患者用户`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `患者用户` (
  `身份证号` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `账号` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `密码` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`账号`),
  KEY `患者用户_ibfk_1` (`身份证号`),
  CONSTRAINT `患者用户_ibfk_1` FOREIGN KEY (`身份证号`) REFERENCES `患者` (`身份证号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `患者用户`
--

LOCK TABLES `患者用户` WRITE;
/*!40000 ALTER TABLE `患者用户` DISABLE KEYS */;
INSERT INTO `患者用户` VALUES ('54321','lisi','password2'),('10001','mdx','mdx'),('10090','queen','q'),('13453','wy','wy'),('10004','xy','xy');
/*!40000 ALTER TABLE `患者用户` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `支付`
--

DROP TABLE IF EXISTS `支付`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `支付` (
  `患者身份证号` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `账单号` tinyint NOT NULL,
  `支付时间` datetime DEFAULT NULL,
  `支付金额` int DEFAULT NULL,
  PRIMARY KEY (`患者身份证号`,`账单号`),
  KEY `支付_ibfk_2` (`账单号`),
  CONSTRAINT `支付_ibfk_1` FOREIGN KEY (`患者身份证号`) REFERENCES `患者` (`身份证号`),
  CONSTRAINT `支付_ibfk_2` FOREIGN KEY (`账单号`) REFERENCES `账单` (`账单号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `支付`
--

LOCK TABLES `支付` WRITE;
/*!40000 ALTER TABLE `支付` DISABLE KEYS */;
INSERT INTO `支付` VALUES ('10090',4,'2000-01-01 00:00:00',11),('13453',3,'2000-01-01 00:00:00',12),('54321',2,'2024-06-02 11:00:00',800);
/*!40000 ALTER TABLE `支付` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `用户`
--

DROP TABLE IF EXISTS `用户`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `用户` (
  `账号` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `密码` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`账号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `用户`
--

LOCK TABLES `用户` WRITE;
/*!40000 ALTER TABLE `用户` DISABLE KEYS */;
INSERT INTO `用户` VALUES ('amiya','cute'),('doctor','doctor'),('kaierxi','kex');
/*!40000 ALTER TABLE `用户` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `账单`
--

DROP TABLE IF EXISTS `账单`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `账单` (
  `账单号` tinyint NOT NULL,
  `患者身份证号` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `支付时间` datetime DEFAULT NULL,
  `支付金额` int DEFAULT NULL,
  `状态` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`账单号`),
  KEY `账单_ibfk_1` (`患者身份证号`),
  CONSTRAINT `账单_ibfk_1` FOREIGN KEY (`患者身份证号`) REFERENCES `患者` (`身份证号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `账单`
--

LOCK TABLES `账单` WRITE;
/*!40000 ALTER TABLE `账单` DISABLE KEYS */;
INSERT INTO `账单` VALUES (2,'54321','2024-06-02 11:00:00',800,'已支付'),(3,'13453',NULL,12,'已支付'),(4,'10090','2000-01-01 00:00:00',11,'已支付');
/*!40000 ALTER TABLE `账单` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `预约`
--

DROP TABLE IF EXISTS `预约`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `预约` (
  `预约编号` tinyint DEFAULT NULL,
  `患者身份证号` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `医生职工号` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `预约时间` datetime DEFAULT NULL,
  `状态` enum('未就诊','已就诊') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`患者身份证号`,`医生职工号`),
  KEY `预约_ibfk_2` (`医生职工号`),
  CONSTRAINT `预约_ibfk_1` FOREIGN KEY (`患者身份证号`) REFERENCES `患者` (`身份证号`),
  CONSTRAINT `预约_ibfk_2` FOREIGN KEY (`医生职工号`) REFERENCES `医生` (`职工号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `预约`
--

LOCK TABLES `预约` WRITE;
/*!40000 ALTER TABLE `预约` DISABLE KEYS */;
INSERT INTO `预约` VALUES (4,'10001','D0001','2024-06-12 09:00:00','未就诊',NULL),(3,'10004','D0001','2024-06-23 09:00:00','已就诊',4),(6,'10004','D1234','2024-06-22 09:00:00','已就诊',NULL),(7,'10090','D0001','2024-07-11 15:00:00','已就诊',4),(5,'13453','D0001','2024-07-21 12:00:00','已就诊',4),(2,'54321','D5678','2024-06-06 10:00:00','未就诊',NULL);
/*!40000 ALTER TABLE `预约` ENABLE KEYS */;
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
     select �˺� into account from �û� where �˺� = p_account AND ���� = p_password;
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

    DELETE FROM ԤԼ WHERE ԤԼ��� = p_appointment_id;

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
    DELETE FROM ҽ�� 
    WHERE ְ���� = p_doctor_id;
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

    DELETE FROM ֧�� WHERE �������֤�� = p_patient_id;
    DELETE FROM �˵� WHERE �������֤�� = p_patient_id;
    DELETE FROM ԤԼ WHERE �������֤�� = p_patient_id;
    DELETE FROM �����û� WHERE ���֤�� = p_patient_id;
    DELETE FROM ���� WHERE ���֤�� = p_patient_id;

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
    DELETE FROM �����û� WHERE ���֤�� = p_patient_id;
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
    DELETE FROM �û� WHERE �˺� = p_account;
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
    DECLARE v_gender ENUM('��', 'Ů');
    DECLARE v_age TINYINT;
    DECLARE v_history TEXT;
    DECLARE v_email VARCHAR(20);
    DECLARE v_phone VARCHAR(11);
    DECLARE v_appt_id TINYINT;
    DECLARE v_doc_id VARCHAR(5);
    DECLARE v_appt_time DATETIME;
    DECLARE v_appt_status ENUM('δ����', '�Ѿ���');
    DECLARE v_priority INT;
    DECLARE v_bill_id TINYINT;
    DECLARE v_bill_time DATETIME;
    DECLARE v_bill_amount INT;
    DECLARE v_bill_status TEXT;

    DECLARE cur CURSOR FOR
        SELECT 
            p.���֤��, 
            p.����, 
            p.�Ա�, 
            p.����, 
            p.��ʷ, 
            p.����, 
            p.��ϵ�绰,
            IFNULL(a.ԤԼ���, 0) AS ԤԼ���,
            IFNULL(a.ҽ��ְ����, '��ԤԼ') AS ҽ��ְ����,
            IFNULL(a.ԤԼʱ��, NULL) AS ԤԼʱ��,
            IFNULL(a.״̬, '��ԤԼ') AS ԤԼ״̬,
            IFNULL(a.priority, 0) AS priority,
            IFNULL(b.�˵���, 0) AS �˵���,
            IFNULL(b.֧��ʱ��, NULL) AS ֧��ʱ��,
            IFNULL(b.֧�����, 0) AS ֧�����,
            IFNULL(b.״̬, '���˵�') AS �˵�״̬
        FROM ���� p
        LEFT JOIN ԤԼ a ON p.���֤�� = a.�������֤��
        LEFT JOIN �˵� b ON p.���֤�� = b.�������֤��;
    
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
            '���֤�ţ�', v_id, '\n',
            '������', v_name, '\n',
            '�Ա�', v_gender, '\n',
            '���䣺', v_age, '\n',
            '��ʷ��', v_history, '\n',
            '���䣺', v_email, '\n',
            '��ϵ�绰��', v_phone, '\n',
            'ԤԼ��ţ�', v_appt_id, '\n',
            'ҽ��ְ���ţ�', v_doc_id, '\n',
            'ԤԼʱ�䣺', IFNULL(DATE_FORMAT(v_appt_time, '%Y-%m-%d %H:%i:%s'), '��ԤԼ'), '\n',
            'ԤԼ״̬��', v_appt_status, '\n',
            '���ȼ���', v_priority, '\n',
            '�˵��ţ�', v_bill_id, '\n',
            '֧��ʱ�䣺', IFNULL(DATE_FORMAT(v_bill_time, '%Y-%m-%d %H:%i:%s'), '���˵�'), '\n',
            '֧����', v_bill_amount, '\n',
            '�˵�״̬��', v_bill_status, '\n\n'
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
    SELECT COUNT(*) INTO result_found FROM �˵� WHERE �������֤�� = patient_id;
    IF result_found > 0 THEN
        SELECT CONCAT('�˵��ţ�', �˵���, '\n�������֤�ţ�', �������֤��, '\n֧��ʱ�䣺', IFNULL(֧��ʱ��, 'N/A'), '\n֧����', ֧�����, '\n״̬��', ״̬)
        INTO bill_info
        FROM �˵�
        WHERE �������֤�� = patient_id;
    ELSE
        SET bill_info = 'δ�ҵ��û��ߵ��˵���Ϣ';
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
    SELECT COUNT(*) INTO result_found FROM ҽ�� WHERE ְ���� = p_doctor_id;
    IF result_found > 0 THEN
        SELECT CONCAT_WS('|', ְ����, �����, ѧ��, ְ��, ��Ŀ, �Ű���Ϣ, ����, �Ա�, ����, ����)
        INTO doctor_info
        FROM ҽ��
        WHERE ְ���� = p_doctor_id;
    ELSE
        SET doctor_info = 'δ�ҵ���ҽ������Ϣ';
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
    SELECT * FROM ԤԼ WHERE �������֤�� = p_patient_id;
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
    SELECT COUNT(*) INTO result_found FROM ���� WHERE ���֤�� = patient_id;
    IF result_found > 0 THEN
        SELECT CONCAT('���֤�ţ�', ���֤��, '\n������', ����, '\n�Ա�', �Ա�, '\n���䣺', ����, '\n��ʷ��', ��ʷ, '\n���䣺', ����, '\n��ϵ�绰��', ��ϵ�绰)
        INTO patient_info
        FROM ����
        WHERE ���֤�� = patient_id;
    ELSE
        SET patient_info = 'δ�ҵ��û��ߵ���Ϣ';
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
    SELECT IFNULL(MAX(ԤԼ���), 0) + 1 INTO new_id FROM ԤԼ;
    
    INSERT INTO ԤԼ (ԤԼ���, ҽ��ְ����, ԤԼʱ��, �������֤��, ״̬, priority)
    VALUES (new_id, p_doctor_id, p_time, p_patient_id, 'δ����', p_priority);
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

    INSERT INTO �˵� (�˵���, �������֤��, ֧��ʱ��, ֧�����, ״̬)
    VALUES (new_bill_id, p_patient_id, NULL, p_amount, 'δ֧��');
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
    IN p_gender ENUM('��', 'Ů'),
    IN p_age TINYINT,
    IN p_salary INT
)
BEGIN
    INSERT INTO ҽ�� (ְ����, �����, ѧ��, ְ��, ��Ŀ, �Ű���Ϣ, ����, �Ա�, ����, ����)
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
    INSERT INTO �û� (�˺�, ����) VALUES (p_account, p_password);
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
      select �˺� into account from �����û� where �˺� = p_account AND ���� = p_password;
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
    IN p_gender ENUM('��', 'Ů'),
    IN p_age TINYINT,
    IN p_history TEXT,
    IN p_email VARCHAR(20),
    IN p_phone VARCHAR(11)
)
BEGIN
    
    INSERT INTO ���� (���֤��, ����, �Ա�, ����, ��ʷ, ����, ��ϵ�绰)
    VALUES (p_id, p_name, p_gender, p_age, p_history, p_email, p_phone);
    
    
    INSERT INTO �����û� (���֤��, �˺�, ����)
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

    
    IF EXISTS (SELECT 1 FROM ԤԼ WHERE ԤԼ��� = p_appointment_id AND ״̬ = 'δ����') THEN
        
        UPDATE ԤԼ
        SET ״̬ = '�Ѿ���'
        WHERE ԤԼ��� = p_appointment_id;
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

    SELECT �������֤�� INTO p_patient_id
    FROM �˵�
    WHERE �˵��� = p_bill_id;

    UPDATE �˵�
    SET ״̬ = '��֧��', ֧��ʱ�� = p_payment_time
    WHERE �˵��� = p_bill_id;

    INSERT INTO ֧�� (�������֤��, �˵���, ֧��ʱ��, ֧�����)
    VALUES (p_patient_id, p_bill_id, p_payment_time, (SELECT ֧����� FROM �˵� WHERE �˵��� = p_bill_id));
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
    UPDATE ҽ�� 
    SET ���� = p_salary 
    WHERE ְ���� = p_doctor_id;
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
    UPDATE ҽ�� 
    SET ְ�� = p_title 
    WHERE ְ���� = p_doctor_id;
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
    UPDATE ����
    SET ���� = p_email
    WHERE ���֤�� = p_patient_id;
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
    UPDATE ����
    SET ��ϵ�绰 = p_phone
    WHERE ���֤�� = p_patient_id;
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
