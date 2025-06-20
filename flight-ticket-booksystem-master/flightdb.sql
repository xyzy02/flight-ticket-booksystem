CREATE DATABASE  IF NOT EXISTS `flightdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flightdb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: flightdb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add airplane',7,'add_airplane'),(26,'Can change airplane',7,'change_airplane'),(27,'Can delete airplane',7,'delete_airplane'),(28,'Can view airplane',7,'view_airplane'),(29,'Can add airport',8,'add_airport'),(30,'Can change airport',8,'change_airport'),(31,'Can delete airport',8,'delete_airport'),(32,'Can view airport',8,'view_airport'),(33,'Can add city',9,'add_city'),(34,'Can change city',9,'change_city'),(35,'Can delete city',9,'delete_city'),(36,'Can view city',9,'view_city'),(37,'Can add flight',10,'add_flight'),(38,'Can change flight',10,'change_flight'),(39,'Can delete flight',10,'delete_flight'),(40,'Can view flight',10,'view_flight'),(41,'Can add passenger',11,'add_passenger'),(42,'Can change passenger',11,'change_passenger'),(43,'Can delete passenger',11,'delete_passenger'),(44,'Can view passenger',11,'view_passenger'),(45,'Can add transaction record',12,'add_transactionrecord'),(46,'Can change transaction record',12,'change_transactionrecord'),(47,'Can delete transaction record',12,'delete_transactionrecord'),(48,'Can view transaction record',12,'view_transactionrecord'),(49,'Can add second flight',13,'add_secondflight'),(50,'Can change second flight',13,'change_secondflight'),(51,'Can delete second flight',13,'delete_secondflight'),(52,'Can view second flight',13,'view_secondflight'),(53,'Can add cabin pricing',14,'add_cabinpricing'),(54,'Can change cabin pricing',14,'change_cabinpricing'),(55,'Can delete cabin pricing',14,'delete_cabinpricing'),(56,'Can view cabin pricing',14,'view_cabinpricing');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$260000$IyuOdBETZu0Gy62ibxBdoM$z7xDJ36GlqMYRGZUNCCiVxKYJsD0pwAz7clz3/bKJcQ=','2025-06-20 12:24:56.000000',1,'admin','','','',1,1,'2025-06-16 00:56:18.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,9),(2,2,10),(3,2,11),(4,2,12);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_airplane`
--

DROP TABLE IF EXISTS `booksystem_airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_airplane` (
  `airplane_id` varchar(10) NOT NULL,
  `model` varchar(10) DEFAULT NULL,
  `first_class_seats` smallint unsigned NOT NULL,
  `economy_class_seats` smallint unsigned NOT NULL,
  PRIMARY KEY (`airplane_id`),
  KEY `booksystem__airplan_1aae39_idx` (`airplane_id`),
  CONSTRAINT `booksystem_airplane_chk_1` CHECK ((`first_class_seats` >= 0)),
  CONSTRAINT `booksystem_airplane_chk_2` CHECK ((`economy_class_seats` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_airplane`
--

LOCK TABLES `booksystem_airplane` WRITE;
/*!40000 ALTER TABLE `booksystem_airplane` DISABLE KEYS */;
INSERT INTO `booksystem_airplane` VALUES ('A001','A330',20,250),('A002','A330',20,250),('A003','A330',20,250),('A004','A330',20,250),('A005','A330',20,250),('B001','747',10,80),('B002','747',10,80),('B003','747',10,80),('B004','747',10,80),('C001','C919',50,300),('C002','C919',50,300),('C003','C919',50,300),('C004','C919',50,300),('C005','C919',50,300);
/*!40000 ALTER TABLE `booksystem_airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_airport`
--

DROP TABLE IF EXISTS `booksystem_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_airport` (
  `airport_code` varchar(4) NOT NULL,
  `name` varchar(10) NOT NULL,
  `city_id` varchar(3) NOT NULL,
  PRIMARY KEY (`airport_code`),
  KEY `booksystem_airport_city_id_f92d4aa0_fk_booksystem_city_city_code` (`city_id`),
  KEY `booksystem__airport_7b92e3_idx` (`airport_code`),
  CONSTRAINT `booksystem_airport_city_id_f92d4aa0_fk_booksystem_city_city_code` FOREIGN KEY (`city_id`) REFERENCES `booksystem_city` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_airport`
--

LOCK TABLES `booksystem_airport` WRITE;
/*!40000 ALTER TABLE `booksystem_airport` DISABLE KEYS */;
INSERT INTO `booksystem_airport` VALUES ('0011','上海浦东国际机场','001'),('0012','上海虹桥国际机场','001'),('0021','成都天府国际机场','002'),('0031','北京大兴国际机场','003'),('0041','重庆江北国际机场','004'),('0051','广州白云国际机场','005'),('0061','深圳宝安国际机场','006');
/*!40000 ALTER TABLE `booksystem_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_cabinpricing`
--

DROP TABLE IF EXISTS `booksystem_cabinpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_cabinpricing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cabin_class` varchar(7) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `flightnumber_id` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booksystem_cabinpricing_flightnumber_id_cabin_cl_0c493937_uniq` (`flightnumber_id`,`cabin_class`),
  KEY `booksystem__flightn_3dafb1_idx` (`flightnumber_id`,`cabin_class`),
  CONSTRAINT `booksystem_cabinpric_flightnumber_id_b14c7ef3_fk_booksyste` FOREIGN KEY (`flightnumber_id`) REFERENCES `booksystem_flight` (`flight_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_cabinpricing`
--

LOCK TABLES `booksystem_cabinpricing` WRITE;
/*!40000 ALTER TABLE `booksystem_cabinpricing` DISABLE KEYS */;
INSERT INTO `booksystem_cabinpricing` VALUES (6,'first',1600.00,'CA0003'),(7,'economy',500.00,'CA0003'),(8,'economy',800.00,'CA0001'),(9,'first',2200.00,'CA0001'),(10,'first',2500.00,'CA0002'),(11,'economy',1000.00,'CA0002'),(12,'first',2000.00,'CA0004'),(13,'economy',1000.00,'CA0004'),(14,'first',2000.00,'3U0001'),(15,'economy',800.00,'3U0001'),(16,'first',2000.00,'3U0002'),(17,'economy',400.00,'3U0002'),(18,'first',500.00,'3U0003'),(19,'economy',150.00,'3U0003'),(20,'first',1500.00,'ZH0001'),(21,'economy',750.00,'ZH0001'),(22,'first',1800.00,'ZH0002'),(23,'economy',650.00,'ZH0002'),(24,'first',300.00,'ZH0003'),(25,'economy',130.00,'ZH0003'),(26,'economy',130.00,'ZH0004'),(27,'first',280.00,'ZH0004'),(28,'first',1000.00,'ZH0005'),(29,'economy',500.00,'ZH0005'),(30,'first',1000.00,'CA0005'),(31,'economy',450.00,'CA0005');
/*!40000 ALTER TABLE `booksystem_cabinpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_city`
--

DROP TABLE IF EXISTS `booksystem_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_city` (
  `city_code` varchar(3) NOT NULL,
  `city_name` varchar(10) NOT NULL,
  PRIMARY KEY (`city_code`),
  KEY `booksystem__city_co_e72d48_idx` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_city`
--

LOCK TABLES `booksystem_city` WRITE;
/*!40000 ALTER TABLE `booksystem_city` DISABLE KEYS */;
INSERT INTO `booksystem_city` VALUES ('001','上海'),('002','成都'),('003','北京'),('004','重庆'),('005','广州'),('006','深圳');
/*!40000 ALTER TABLE `booksystem_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_flight`
--

DROP TABLE IF EXISTS `booksystem_flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_flight` (
  `flight_number` varchar(7) NOT NULL,
  `weekly_days` varchar(27) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time(6) NOT NULL,
  `arrive_date` date NOT NULL,
  `arrival_time` time(6) NOT NULL,
  `airplane_id` varchar(10) NOT NULL,
  `arrival_airport_id` varchar(4) NOT NULL,
  `departure_airport_id` varchar(4) NOT NULL,
  PRIMARY KEY (`flight_number`),
  KEY `booksystem_flight_airplane_id_e964cff9_fk_booksyste` (`airplane_id`),
  KEY `booksystem_flight_arrival_airport_id_b453c9db_fk_booksyste` (`arrival_airport_id`),
  KEY `booksystem_flight_departure_airport_id_5276592d_fk_booksyste` (`departure_airport_id`),
  CONSTRAINT `booksystem_flight_airplane_id_e964cff9_fk_booksyste` FOREIGN KEY (`airplane_id`) REFERENCES `booksystem_airplane` (`airplane_id`),
  CONSTRAINT `booksystem_flight_arrival_airport_id_b453c9db_fk_booksyste` FOREIGN KEY (`arrival_airport_id`) REFERENCES `booksystem_airport` (`airport_code`),
  CONSTRAINT `booksystem_flight_departure_airport_id_5276592d_fk_booksyste` FOREIGN KEY (`departure_airport_id`) REFERENCES `booksystem_airport` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_flight`
--

LOCK TABLES `booksystem_flight` WRITE;
/*!40000 ALTER TABLE `booksystem_flight` DISABLE KEYS */;
INSERT INTO `booksystem_flight` VALUES ('3U0001','Monday, Friday','2025-06-20','12:00:00.000000','2025-06-20','15:00:00.000000','B001','0021','0031'),('3U0002','Monday, Friday','2025-06-20','10:00:00.000000','2025-06-20','13:30:00.000000','B002','0041','0012'),('3U0003','Monday, Friday','2025-06-20','21:00:00.000000','2025-06-20','21:30:00.000000','B003','0021','0041'),('CA0001','Monday, Friday','2025-06-20','02:00:00.000000','2025-06-20','05:20:00.000000','C001','0021','0011'),('CA0002','Monday, Friday','2025-06-20','03:00:00.000000','2025-06-20','06:20:00.000000','C002','0021','0012'),('CA0003','Tuesday, Friday','2025-06-20','07:00:00.000000','2025-06-20','12:30:00.000000','C003','0021','0011'),('CA0004','Monday, Friday','2025-06-20','08:30:00.000000','2025-06-20','10:30:00.000000','C004','0031','0012'),('CA0005','Monday, Friday','2025-06-20','18:00:00.000000','2025-06-21','01:30:00.000000','C005','0021','0031'),('ZH0001','Monday, Friday','2025-06-20','08:00:00.000000','2025-06-20','18:00:00.000000','B004','0021','0012'),('ZH0002','Monday, Friday','2025-06-20','15:30:00.000000','2025-06-20','18:00:00.000000','A001','0051','0021'),('ZH0003','Monday, Friday','2025-06-20','17:00:00.000000','2025-06-20','17:30:00.000000','A002','0061','0051'),('ZH0004','Monday, Friday','2025-06-20','18:00:00.000000','2025-06-20','18:30:00.000000','A003','0061','0051'),('ZH0005','Monday, Friday','2025-06-20','15:00:00.000000','2025-06-20','17:10:00.000000','A005','0051','0011');
/*!40000 ALTER TABLE `booksystem_flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_passenger`
--

DROP TABLE IF EXISTS `booksystem_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_passenger` (
  `id_card` varchar(18) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id_card`),
  KEY `booksystem__id_card_8e3bf4_idx` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_passenger`
--

LOCK TABLES `booksystem_passenger` WRITE;
/*!40000 ALTER TABLE `booksystem_passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `booksystem_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_secondflight`
--

DROP TABLE IF EXISTS `booksystem_secondflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_secondflight` (
  `flight_id` varchar(7) NOT NULL,
  `second_flight` varchar(7) NOT NULL,
  `weekly_days` varchar(27) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_time` time(6) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time(6) NOT NULL,
  `airplane_id` varchar(10) NOT NULL,
  `transfer_airport_id` varchar(4) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `booksystem_secondfli_airplane_id_6d71bf41_fk_booksyste` (`airplane_id`),
  KEY `booksystem_secondfli_transfer_airport_id_b171286c_fk_booksyste` (`transfer_airport_id`),
  KEY `booksystem__flight__533cbc_idx` (`flight_id`),
  CONSTRAINT `booksystem_secondfli_airplane_id_6d71bf41_fk_booksyste` FOREIGN KEY (`airplane_id`) REFERENCES `booksystem_airplane` (`airplane_id`),
  CONSTRAINT `booksystem_secondfli_flight_id_ee663b6a_fk_booksyste` FOREIGN KEY (`flight_id`) REFERENCES `booksystem_flight` (`flight_number`),
  CONSTRAINT `booksystem_secondfli_transfer_airport_id_b171286c_fk_booksyste` FOREIGN KEY (`transfer_airport_id`) REFERENCES `booksystem_airport` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_secondflight`
--

LOCK TABLES `booksystem_secondflight` WRITE;
/*!40000 ALTER TABLE `booksystem_secondflight` DISABLE KEYS */;
INSERT INTO `booksystem_secondflight` VALUES ('CA0003','CA00032','Tuesday','2025-06-20','09:00:00.000000','2025-06-20','09:50:00.000000','C003','0031'),('CA0005','CA00052','Monday','2025-06-20','20:00:00.000000','2025-06-20','23:00:00.000000','C005','0051'),('ZH0001','ZH00012','Monday, Friday','2025-06-20','12:00:00.000000','2025-06-20','15:00:00.000000','B004','0061');
/*!40000 ALTER TABLE `booksystem_secondflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksystem_transactionrecord`
--

DROP TABLE IF EXISTS `booksystem_transactionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksystem_transactionrecord` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `cabin_class` varchar(7) NOT NULL,
  `operation_date` date NOT NULL,
  `operation_type` varchar(8) NOT NULL,
  `transaction_price` decimal(8,2) NOT NULL,
  `buyer_id` int DEFAULT NULL,
  `flight_number_id` varchar(7) NOT NULL,
  `passenger_id` varchar(18) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `booksystem_transactionrecord_buyer_id_6eb52e15_fk_auth_user_id` (`buyer_id`),
  KEY `booksystem_transacti_flight_number_id_bbe046c1_fk_booksyste` (`flight_number_id`),
  KEY `booksystem__passeng_6ddb54_idx` (`passenger_id`,`operation_type`,`buyer_id`),
  CONSTRAINT `booksystem_transacti_flight_number_id_bbe046c1_fk_booksyste` FOREIGN KEY (`flight_number_id`) REFERENCES `booksystem_flight` (`flight_number`),
  CONSTRAINT `booksystem_transacti_passenger_id_5c13ab09_fk_booksyste` FOREIGN KEY (`passenger_id`) REFERENCES `booksystem_passenger` (`id_card`),
  CONSTRAINT `booksystem_transactionrecord_buyer_id_6eb52e15_fk_auth_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksystem_transactionrecord`
--

LOCK TABLES `booksystem_transactionrecord` WRITE;
/*!40000 ALTER TABLE `booksystem_transactionrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `booksystem_transactionrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-06-16 10:11:54.030421','A001','A001',1,'[{\"added\": {}}]',7,2),(2,'2025-06-16 10:13:18.464473','A001','A001',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(3,'2025-06-16 10:13:52.929556','001','上海',1,'[{\"added\": {}}]',9,2),(4,'2025-06-16 10:13:55.784000','0001','上海浦东国际机场',1,'[{\"added\": {}}]',8,2),(5,'2025-06-16 10:14:22.756039','0002','上海虹桥国际机场',1,'[{\"added\": {}}]',8,2),(6,'2025-06-16 10:14:46.712817','002','成都',1,'[{\"added\": {}}]',9,2),(7,'2025-06-16 10:14:48.226937','0003','成都天府国际机场',1,'[{\"added\": {}}]',8,2),(8,'2025-06-16 10:16:44.343446','CNA0001','CNA0001',1,'[{\"added\": {}}]',10,2),(9,'2025-06-16 10:17:16.513070','CNA0002','CNA0002',1,'[{\"added\": {}}]',10,2),(10,'2025-06-16 10:20:29.832005','2','CNA0001 - First Class',1,'[{\"added\": {}}]',14,2),(11,'2025-06-16 10:20:46.034625','3','CNA0001 - Economy Class',1,'[{\"added\": {}}]',14,2),(12,'2025-06-16 10:21:01.000911','4','CNA0002 - First Class',1,'[{\"added\": {}}]',14,2),(13,'2025-06-16 10:21:10.697587','5','CNA0002 - Economy Class',1,'[{\"added\": {}}]',14,2),(14,'2025-06-16 11:11:01.127726','CNA0001','CNA0001',2,'[{\"changed\": {\"fields\": [\"Departure airport\", \"Arrival airport\"]}}]',10,2),(15,'2025-06-16 11:15:13.349416','003','北京',1,'[{\"added\": {}}]',9,2),(16,'2025-06-16 11:15:21.331985','0004','北京大兴国际机场',1,'[{\"added\": {}}]',8,2),(17,'2025-06-16 11:16:43.228267','CNA0003','CNA0003',1,'[{\"added\": {}}]',10,2),(18,'2025-06-16 11:19:03.724269','CN0003','CN0003',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(19,'2025-06-16 11:19:17.319019','CNA0003','CNA0003',3,'',10,2),(20,'2025-06-16 11:19:38.365028','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(21,'2025-06-16 11:19:53.462998','CA0003','CA0003',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(22,'2025-06-16 11:20:00.060033','CA0002','CA0002',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(23,'2025-06-16 11:20:13.565376','CNA0002','CNA0002',3,'',10,2),(24,'2025-06-16 11:20:13.571847','CNA0001','CNA0001',3,'',10,2),(25,'2025-06-16 11:20:13.574392','CN0003','CN0003',3,'',10,2),(26,'2025-06-16 11:21:17.670632','CA0003','CA0003 -> CA00032',1,'[{\"added\": {}}]',13,2),(27,'2025-06-16 11:21:37.456890','6','CA0003 - First Class',1,'[{\"added\": {}}]',14,2),(28,'2025-06-16 11:21:56.286982','7','CA0003 - Economy Class',1,'[{\"added\": {}}]',14,2),(29,'2025-06-16 11:22:12.707610','8','CA0001 - Economy Class',1,'[{\"added\": {}}]',14,2),(30,'2025-06-16 11:22:36.380709','9','CA0001 - First Class',1,'[{\"added\": {}}]',14,2),(31,'2025-06-16 11:22:53.816693','10','CA0002 - First Class',1,'[{\"added\": {}}]',14,2),(32,'2025-06-16 11:23:02.783470','11','CA0002 - Economy Class',1,'[{\"added\": {}}]',14,2),(33,'2025-06-16 11:46:48.812646','CA004','CA004',1,'[{\"added\": {}}]',10,2),(34,'2025-06-16 11:47:28.716744','B0001','B0001',1,'[{\"added\": {}}]',7,2),(35,'2025-06-16 11:47:44.050086','CA0004','CA0004',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(36,'2025-06-16 11:47:49.721541','CA004','CA004',3,'',10,2),(37,'2025-06-16 11:48:34.988929','3U0001','3U0001',1,'[{\"added\": {}}]',10,2),(38,'2025-06-16 11:48:59.172551','12','CA0004 - First Class',1,'[{\"added\": {}}]',14,2),(39,'2025-06-16 11:49:11.508080','13','CA0004 - Economy Class',1,'[{\"added\": {}}]',14,2),(40,'2025-06-16 11:49:25.209925','14','3U0001 - First Class',1,'[{\"added\": {}}]',14,2),(41,'2025-06-16 11:49:33.977953','15','3U0001 - Economy Class',1,'[{\"added\": {}}]',14,2),(42,'2025-06-16 14:08:51.901352','004','重庆',1,'[{\"added\": {}}]',9,2),(43,'2025-06-16 14:09:33.982643','0041','重庆江北国际机场',1,'[{\"added\": {}}]',8,2),(44,'2025-06-16 14:09:47.986383','0031','北京大兴国际机场',2,'[{\"changed\": {\"fields\": [\"Airport code\"]}}]',8,2),(45,'2025-06-16 14:10:15.053622','CA0004','CA0004',2,'[{\"changed\": {\"fields\": [\"Arrival airport\"]}}]',10,2),(46,'2025-06-16 14:10:32.852693','CA0003','CA0003 -> CA00032',2,'[{\"changed\": {\"fields\": [\"Transfer airport\"]}}]',13,2),(47,'2025-06-16 14:11:05.584109','3U0001','3U0001',2,'[{\"changed\": {\"fields\": [\"Departure airport\"]}}]',10,2),(48,'2025-06-16 14:11:14.921202','0004','北京大兴国际机场',3,'',8,2),(49,'2025-06-16 14:11:27.772080','0021','成都天府国际机场',2,'[{\"changed\": {\"fields\": [\"Airport code\"]}}]',8,2),(50,'2025-06-16 14:11:41.953634','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Arrival airport\"]}}]',10,2),(51,'2025-06-16 14:11:48.287381','CA0002','CA0002',2,'[{\"changed\": {\"fields\": [\"Arrival airport\"]}}]',10,2),(52,'2025-06-16 14:11:56.887689','CA0003','CA0003',2,'[{\"changed\": {\"fields\": [\"Arrival airport\"]}}]',10,2),(53,'2025-06-16 14:12:15.136515','3U0001','3U0001',2,'[{\"changed\": {\"fields\": [\"Arrival airport\"]}}]',10,2),(54,'2025-06-16 14:12:36.784570','0003','成都天府国际机场',3,'',8,2),(55,'2025-06-16 14:12:54.871490','0012','上海虹桥国际机场',2,'[{\"changed\": {\"fields\": [\"Airport code\"]}}]',8,2),(56,'2025-06-16 14:13:08.111108','CA0002','CA0002',2,'[{\"changed\": {\"fields\": [\"Departure airport\"]}}]',10,2),(57,'2025-06-16 14:13:16.390516','CA0004','CA0004',2,'[{\"changed\": {\"fields\": [\"Departure airport\"]}}]',10,2),(58,'2025-06-16 14:13:45.477626','0002','上海虹桥国际机场',3,'',8,2),(59,'2025-06-16 14:14:29.823098','0011','上海浦东国际机场',2,'[{\"changed\": {\"fields\": [\"Airport code\"]}}]',8,2),(60,'2025-06-16 14:14:38.293786','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Departure airport\"]}}]',10,2),(61,'2025-06-16 14:14:45.446975','CA0003','CA0003',2,'[{\"changed\": {\"fields\": [\"Departure airport\"]}}]',10,2),(62,'2025-06-16 14:15:06.945884','0001','上海浦东国际机场',3,'',8,2),(63,'2025-06-16 14:16:56.191234','3U0002','3U0002',1,'[{\"added\": {}}]',10,2),(64,'2025-06-16 14:18:47.294724','3U0002','3U0002 -> 3U0022',1,'[{\"added\": {}}]',13,2),(65,'2025-06-16 14:19:00.942599','3U0002','3U0002 -> 3U00022',2,'[{\"changed\": {\"fields\": [\"Second flight\"]}}]',13,2),(66,'2025-06-16 14:19:45.376387','3U0003','3U0003',1,'[{\"added\": {}}]',10,2),(67,'2025-06-16 14:21:06.753677','16','3U0002 - First Class',1,'[{\"added\": {}}]',14,2),(68,'2025-06-16 14:21:20.117342','17','3U0002 - Economy Class',1,'[{\"added\": {}}]',14,2),(69,'2025-06-16 14:24:59.797788','18','3U0003 - First Class',1,'[{\"added\": {}}]',14,2),(70,'2025-06-16 14:25:09.730532','19','3U0003 - Economy Class',1,'[{\"added\": {}}]',14,2),(71,'2025-06-16 22:16:29.813973','B001','B001',2,'[{\"changed\": {\"fields\": [\"Airplane id\"]}}]',7,2),(72,'2025-06-16 22:16:45.947314','3U0001','3U0001',2,'[{\"changed\": {\"fields\": [\"Airplane\"]}}]',10,2),(73,'2025-06-16 22:17:17.178762','3U0002','3U0002 -> 3U00022',2,'[{\"changed\": {\"fields\": [\"Airplane\"]}}]',13,2),(74,'2025-06-16 22:17:30.038359','B0001','B0001',3,'',7,2),(75,'2025-06-16 22:18:42.252455','A001','A001',2,'[{\"changed\": {\"fields\": [\"Economy class seats\"]}}]',7,2),(76,'2025-06-16 22:21:00.220231','B001','B001',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(77,'2025-06-16 22:21:16.136979','A001','A001',2,'[]',7,2),(78,'2025-06-16 22:21:46.686977','A002','A002',1,'[{\"added\": {}}]',7,2),(79,'2025-06-16 22:21:59.753038','A003','A003',1,'[{\"added\": {}}]',7,2),(80,'2025-06-16 22:22:09.968580','A004','A004',1,'[{\"added\": {}}]',7,2),(81,'2025-06-16 22:22:18.772081','A005','A005',1,'[{\"added\": {}}]',7,2),(82,'2025-06-16 22:22:40.469467','B002','B002',1,'[{\"added\": {}}]',7,2),(83,'2025-06-16 22:22:54.022729','B002','B002',2,'[{\"changed\": {\"fields\": [\"First class seats\", \"Economy class seats\"]}}]',7,2),(84,'2025-06-16 22:23:12.020411','B003','B003',1,'[{\"added\": {}}]',7,2),(85,'2025-06-16 22:23:21.055096','B004','B004',1,'[{\"added\": {}}]',7,2),(86,'2025-06-16 22:24:48.589715','A001','A001',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(87,'2025-06-16 22:24:53.774012','A002','A002',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(88,'2025-06-16 22:24:58.822539','A003','A003',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(89,'2025-06-16 22:25:04.664271','A004','A004',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(90,'2025-06-16 22:25:11.455840','A005','A005',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,2),(91,'2025-06-16 22:26:02.991090','C001','C001',1,'[{\"added\": {}}]',7,2),(92,'2025-06-16 22:26:13.605896','C002','C002',1,'[{\"added\": {}}]',7,2),(93,'2025-06-16 22:26:24.790562','C003','C003',1,'[{\"added\": {}}]',7,2),(94,'2025-06-16 22:26:38.890513','C004','C004',1,'[{\"added\": {}}]',7,2),(95,'2025-06-16 22:27:04.040557','005','广州',1,'[{\"added\": {}}]',9,2),(96,'2025-06-16 22:27:21.441791','006','深圳',1,'[{\"added\": {}}]',9,2),(97,'2025-06-16 22:28:16.075261','0051','广州白云国际机场',1,'[{\"added\": {}}]',8,2),(98,'2025-06-16 22:28:28.757608','0061','深圳宝安国际机场',1,'[{\"added\": {}}]',8,2),(99,'2025-06-16 22:29:24.809459','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\", \"Airplane\"]}}]',10,2),(100,'2025-06-16 22:31:27.964181','9','CA0001 - First Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(101,'2025-06-16 22:31:41.810814','8','CA0001 - Economy Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(102,'2025-06-16 22:32:26.747776','CA0002','CA0002',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\", \"Airplane\"]}}]',10,2),(103,'2025-06-16 22:32:59.461902','10','CA0002 - First Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(104,'2025-06-16 22:33:07.694668','11','CA0002 - Economy Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(105,'2025-06-16 22:34:34.350765','CA0003','CA0003',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\", \"Airplane\"]}}]',10,2),(106,'2025-06-16 22:35:14.112950','CA0003','CA0003 -> CA00032',2,'[{\"changed\": {\"fields\": [\"Transfer date\", \"Transfer time\", \"Departure date\", \"Departure time\", \"Airplane\"]}}]',13,2),(107,'2025-06-16 22:35:32.032580','7','CA0003 - Economy Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(108,'2025-06-16 22:35:44.781434','6','CA0003 - First Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(109,'2025-06-16 22:36:43.413077','CA0004','CA0004',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\", \"Airplane\"]}}]',10,2),(110,'2025-06-16 22:37:07.433741','12','CA0004 - First Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(111,'2025-06-16 22:37:16.465127','13','CA0004 - Economy Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(112,'2025-06-16 22:38:02.832018','3U0001','3U0001',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\"]}}]',10,2),(113,'2025-06-16 22:38:15.614012','14','3U0001 - First Class',2,'[]',14,2),(114,'2025-06-16 22:38:20.783956','16','3U0002 - First Class',2,'[]',14,2),(115,'2025-06-16 22:38:44.016965','15','3U0001 - Economy Class',2,'[]',14,2),(116,'2025-06-16 22:39:46.731556','3U0002','3U0002',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrive date\", \"Arrival time\", \"Airplane\"]}}]',10,2),(117,'2025-06-16 22:40:10.402659','16','3U0002 - First Class',2,'[]',14,2),(118,'2025-06-16 22:40:28.920310','17','3U0002 - Economy Class',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,2),(119,'2025-06-16 22:40:53.501634','3U0003','3U0003',2,'[{\"changed\": {\"fields\": [\"Departure date\", \"Departure time\", \"Arrival time\", \"Airplane\"]}}]',10,2),(120,'2025-06-16 22:41:01.268087','19','3U0003 - Economy Class',2,'[]',14,2),(121,'2025-06-16 22:41:04.634820','18','3U0003 - First Class',2,'[]',14,2),(122,'2025-06-16 22:44:18.735563','ZH0001','ZH0001',1,'[{\"added\": {}}]',10,2),(123,'2025-06-16 22:44:24.555432','3U0003','3U0003',2,'[]',10,2),(124,'2025-06-16 22:48:15.791238','3U0002','3U0002 -> 3U00022',3,'',13,2),(125,'2025-06-16 22:49:39.912045','ZH0001','ZH0001 -> ZH00012',1,'[{\"added\": {}}]',13,2),(126,'2025-06-16 22:51:35.825044','ZH0002','ZH0002',1,'[{\"added\": {}}]',10,2),(127,'2025-06-16 22:52:27.510075','20','ZH0001 - First Class',1,'[{\"added\": {}}]',14,2),(128,'2025-06-16 22:52:39.145216','21','ZH0001 - Economy Class',1,'[{\"added\": {}}]',14,2),(129,'2025-06-16 22:52:54.729851','22','ZH0002 - First Class',1,'[{\"added\": {}}]',14,2),(130,'2025-06-16 22:53:06.148899','23','ZH0002 - Economy Class',1,'[{\"added\": {}}]',14,2),(131,'2025-06-16 22:53:58.826911','ZH0003','ZH0003',1,'[{\"added\": {}}]',10,2),(132,'2025-06-16 22:54:28.578004','ZH004','ZH004',1,'[{\"added\": {}}]',10,2),(133,'2025-06-16 22:54:39.095613','ZH0004','ZH0004',2,'[{\"changed\": {\"fields\": [\"Flight number\"]}}]',10,2),(134,'2025-06-16 22:54:45.855621','ZH004','ZH004',3,'',10,2),(135,'2025-06-16 22:55:13.980129','24','ZH0003 - First Class',1,'[{\"added\": {}}]',14,2),(136,'2025-06-16 22:55:26.195603','25','ZH0003 - Economy Class',1,'[{\"added\": {}}]',14,2),(137,'2025-06-16 22:55:43.247621','26','ZH0004 - Economy Class',1,'[{\"added\": {}}]',14,2),(138,'2025-06-16 22:55:56.380153','27','ZH0004 - First Class',1,'[{\"added\": {}}]',14,2),(139,'2025-06-16 22:57:40.668146','ZH0005','ZH0005',1,'[{\"added\": {}}]',10,2),(140,'2025-06-16 22:57:57.999721','28','ZH0005 - First Class',1,'[{\"added\": {}}]',14,2),(141,'2025-06-16 22:58:08.965743','29','ZH0005 - Economy Class',1,'[{\"added\": {}}]',14,2),(142,'2025-06-16 23:10:47.274729','3U0003','3U0003',2,'[{\"changed\": {\"fields\": [\"Arrive date\"]}}]',10,2),(143,'2025-06-16 23:20:53.265260','C005','C005',1,'[{\"added\": {}}]',7,2),(144,'2025-06-16 23:22:24.369311','CA0005','CA0005',1,'[{\"added\": {}}]',10,2),(145,'2025-06-16 23:23:16.452585','CA0005','CA0005 -> CA00052',1,'[{\"added\": {}}]',13,2),(146,'2025-06-16 23:23:31.163648','CA0005','CA0005',2,'[{\"changed\": {\"fields\": [\"Arrival time\"]}}]',10,2),(147,'2025-06-16 23:23:46.769755','30','CA0005 - First Class',1,'[{\"added\": {}}]',14,2),(148,'2025-06-16 23:23:58.236554','31','CA0005 - Economy Class',1,'[{\"added\": {}}]',14,2),(149,'2025-06-16 23:24:16.670836','2','2 - 大卫',3,'',12,2),(150,'2025-06-16 23:24:16.687180','1','1 - 大卫',3,'',12,2),(151,'2025-06-17 09:30:36.286119','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Arrival time\"]}}]',10,2),(152,'2025-06-17 09:31:54.743029','A001','A001',2,'[{\"changed\": {\"fields\": [\"First class seats\", \"Economy class seats\"]}}]',7,2),(153,'2025-06-17 09:35:17.319404','C001','C001',2,'[{\"changed\": {\"fields\": [\"First class seats\", \"Economy class seats\"]}}]',7,2),(154,'2025-06-17 09:35:43.314437','A001','A001',2,'[{\"changed\": {\"fields\": [\"First class seats\", \"Economy class seats\"]}}]',7,2),(155,'2025-06-20 12:25:32.251202','6','2',3,'',4,2),(156,'2025-06-20 12:25:32.416315','7','3',3,'',4,2),(157,'2025-06-20 12:25:32.598689','12','9',3,'',4,2),(158,'2025-06-20 12:25:32.655689','1','David',3,'',4,2),(159,'2025-06-20 12:25:32.712664','10','lzw',3,'',4,2),(160,'2025-06-20 12:25:32.762678','11','lzw2',3,'',4,2),(161,'2025-06-20 12:25:32.812718','14','一',3,'',4,2),(162,'2025-06-20 12:26:25.129870','2','admin',2,'[{\"changed\": {\"fields\": [\"Email address\", \"User permissions\"]}}]',4,2),(163,'2025-06-20 12:26:55.910707','C001','C001',2,'[{\"changed\": {\"fields\": [\"First class seats\", \"Economy class seats\"]}}]',7,2),(164,'2025-06-20 12:29:01.896352','320204200503152313','3',3,'',11,2),(165,'2025-06-20 12:29:01.974489','320204200503152312','2',3,'',11,2),(166,'2025-06-20 12:29:02.082731','320204200503152311','1',3,'',11,2),(167,'2025-06-20 12:29:02.132358','320204200503152310','lzw2',3,'',11,2),(168,'2025-06-20 12:29:02.182359','123456123456123456','9',3,'',11,2),(169,'2025-06-20 12:29:02.248535','123','大卫',3,'',11,2),(170,'2025-06-20 12:29:38.066979','ZH0001','ZH0001 -> ZH00012',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',13,2),(171,'2025-06-20 12:30:06.366586','ZH0005','ZH0005',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(172,'2025-06-20 12:30:11.382555','ZH0004','ZH0004',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(173,'2025-06-20 12:30:16.035753','ZH0003','ZH0003',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(174,'2025-06-20 12:30:21.332242','ZH0002','ZH0002',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(175,'2025-06-20 12:30:26.576723','ZH0001','ZH0001',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(176,'2025-06-20 12:30:32.707283','CA0005','CA0005',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(177,'2025-06-20 12:30:37.237987','CA0004','CA0004',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(178,'2025-06-20 12:30:40.654050','CA0004','CA0004',2,'[]',10,2),(179,'2025-06-20 12:30:50.594356','CA0003','CA0003',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(180,'2025-06-20 12:30:57.622452','CA0003','CA0003',2,'[]',10,2),(181,'2025-06-20 12:31:03.308284','CA0002','CA0002',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(182,'2025-06-20 12:31:07.996734','CA0001','CA0001',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(183,'2025-06-20 12:31:13.114945','3U0003','3U0003',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(184,'2025-06-20 12:31:18.010985','3U0002','3U0002',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2),(185,'2025-06-20 12:31:22.541438','3U0001','3U0001',2,'[{\"changed\": {\"fields\": [\"Weekly days\"]}}]',10,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'booksystem','airplane'),(8,'booksystem','airport'),(14,'booksystem','cabinpricing'),(9,'booksystem','city'),(10,'booksystem','flight'),(11,'booksystem','passenger'),(13,'booksystem','secondflight'),(12,'booksystem','transactionrecord'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-16 00:45:21.606250'),(2,'auth','0001_initial','2025-06-16 00:45:22.522807'),(3,'admin','0001_initial','2025-06-16 00:45:22.765005'),(4,'admin','0002_logentry_remove_auto_add','2025-06-16 00:45:22.780636'),(5,'admin','0003_logentry_add_action_flag_choices','2025-06-16 00:45:22.824134'),(6,'contenttypes','0002_remove_content_type_name','2025-06-16 00:45:23.118297'),(7,'auth','0002_alter_permission_name_max_length','2025-06-16 00:45:23.251924'),(8,'auth','0003_alter_user_email_max_length','2025-06-16 00:45:23.326404'),(9,'auth','0004_alter_user_username_opts','2025-06-16 00:45:23.352300'),(10,'auth','0005_alter_user_last_login_null','2025-06-16 00:45:23.461182'),(11,'auth','0006_require_contenttypes_0002','2025-06-16 00:45:23.469183'),(12,'auth','0007_alter_validators_add_error_messages','2025-06-16 00:45:23.490253'),(13,'auth','0008_alter_user_username_max_length','2025-06-16 00:45:23.612957'),(14,'auth','0009_alter_user_last_name_max_length','2025-06-16 00:45:23.734619'),(15,'auth','0010_alter_group_name_max_length','2025-06-16 00:45:23.787289'),(16,'auth','0011_update_proxy_permissions','2025-06-16 00:45:23.803955'),(17,'auth','0012_alter_user_first_name_max_length','2025-06-16 00:45:23.919959'),(18,'booksystem','0001_initial','2025-06-16 00:45:25.206604'),(19,'sessions','0001_initial','2025-06-16 00:45:25.270450'),(20,'booksystem','0002_auto_20250616_2220','2025-06-16 23:07:56.770573');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9ptmofaeulqhauuzvwtc9dlnt8rv98v6','.eJztV02PmzAQ_S-cs5H5NOTW9txjT83KMvZ4cZdAZEylaJX_3vECmxCcVKn21lwsxJt5M543zIi3gPHeVqzvwDAtg00QBqvzdyUXr9A4QP7izUu7Fm1jjS7XzmQ9ot36eyuh_jrazggq3lWOVpWFSgAymqaChkmeJTEhpMyLIleKFrTIKaECBBBa8oQTqSIQUhYFhzKTAklr4L-BCW0PyLft0zik2z4B7jBujD4Hsygk274gSn44Sm4BsYhE6RPJniLi3Oqada2xIJmq9Utlu2Dz8y2wh70zldqAsGg2YKzpdyUYBOIfmLorlIQ9N7Y3wLg2eyS6yAyfiwif05AmeGZKYlJZkmKCNOb4Bs8ZzY3b8XoW5HTD9yAFnlCIG0EmEn-NTin46nRCrd45NIw2hJyReos7YpNLOrgobTrLRM27jtWg8DYhWQWAfdXuDrP3OZlb740WyBRh8dcLlxHMB8y21mXVG2512zjJMLiLf1x9yGsNbzqFgk5RLmX-9gUjpR_wJ4l9SeaXfLDyCZ8CVXhKCdueZlQ6lyL8a8CF_CceT1I-PS9tJl3zQdd7Oyg_b4dbfTS3GN0jcncDTi6daxx5Re3oZHBF73vLv2DzKzCafcqnfsHl_-IXeflKuDCaahnPanlNhXBpMhKQcBP7p0F6ZRrguvCOg_DWOEhS_zigSDfcYJoCvmGBLaRnQDK6HZ9X43Z47I3_ZG88n7WKR_PHMnksk8cyeSyTf1wm-L_UMs98ed8zHeuAG1GxCrj7EyvrVrwGM0RxXWNFEWzaBoLjH35UfqU:1uRBm7:D5asmyI8ZKL6oJ83pX4_o2hGtk2_aK8qkgONKaGX8xY','2025-06-30 23:29:31.748784'),('oot77fzeouohxfh2vu8xrd5kp5yeefmi','.eJxVjMsOwiAQRf-FtSFDGcLg0r3fQIaXVA0kpV0Z_12bdKHbe865L-F5W6vfRl78nMRZTOL0uwWOj9x2kO7cbl3G3tZlDnJX5EGHvPaUn5fD_TuoPOq3tpPBwoqDA3I6QCmKEhaVkShYRkBmALKWXWTKJhhwDpVmpRC0IfH-ANfhNwk:1uRMD7:neLyVXRx9EI1XRnsgY7cEuTMrb6w9GgtLtOFRQS5FS0','2025-07-01 10:38:05.677448'),('qd72ne5t6nabti4b02y1kpugejayjvu2','.eJxVjMsOwiAQRf-FtSFDGcLg0r3fQIaXVA0kpV0Z_12bdKHbe865L-F5W6vfRl78nMRZTOL0uwWOj9x2kO7cbl3G3tZlDnJX5EGHvPaUn5fD_TuoPOq3tpPBwoqDA3I6QCmKEhaVkShYRkBmALKWXWTKJhhwDpVmpRC0IfH-ANfhNwk:1uR2Yd:RBjR1vJjkmis_EgMydGYmvvHmne_bbfIp1ScBTskBXo','2025-06-30 13:38:59.961606');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 12:44:15
