-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: treefrogbank
-- ------------------------------------------------------
-- Server version	8.0.28

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bank',7,'add_bank'),(26,'Can change bank',7,'change_bank'),(27,'Can delete bank',7,'delete_bank'),(28,'Can view bank',7,'view_bank'),(29,'Can add consumption type_list',8,'add_consumptiontype_list'),(30,'Can change consumption type_list',8,'change_consumptiontype_list'),(31,'Can delete consumption type_list',8,'delete_consumptiontype_list'),(32,'Can view consumption type_list',8,'view_consumptiontype_list'),(33,'Can add credit_card',9,'add_credit_card'),(34,'Can change credit_card',9,'change_credit_card'),(35,'Can delete credit_card',9,'delete_credit_card'),(36,'Can view credit_card',9,'view_credit_card'),(37,'Can add credit card_type',10,'add_creditcard_type'),(38,'Can change credit card_type',10,'change_creditcard_type'),(39,'Can delete credit card_type',10,'delete_creditcard_type'),(40,'Can view credit card_type',10,'view_creditcard_type'),(41,'Can add customer',11,'add_customer'),(42,'Can change customer',11,'change_customer'),(43,'Can delete customer',11,'delete_customer'),(44,'Can view customer',11,'view_customer'),(45,'Can add credit card_history',12,'add_creditcard_history'),(46,'Can change credit card_history',12,'change_creditcard_history'),(47,'Can delete credit card_history',12,'delete_creditcard_history'),(48,'Can view credit card_history',12,'view_creditcard_history'),(49,'Can add credit cardhistory type_list',13,'add_creditcardhistorytype_list'),(50,'Can change credit cardhistory type_list',13,'change_creditcardhistorytype_list'),(51,'Can delete credit cardhistory type_list',13,'delete_creditcardhistorytype_list'),(52,'Can view credit cardhistory type_list',13,'view_creditcardhistorytype_list'),(53,'Can add loan',14,'add_loan'),(54,'Can change loan',14,'change_loan'),(55,'Can delete loan',14,'delete_loan'),(56,'Can view loan',14,'view_loan'),(57,'Can add repayment',15,'add_repayment'),(58,'Can change repayment',15,'change_repayment'),(59,'Can delete repayment',15,'delete_repayment'),(60,'Can view repayment',15,'view_repayment'),(61,'Can add transaction_history',16,'add_transaction_history'),(62,'Can change transaction_history',16,'change_transaction_history'),(63,'Can delete transaction_history',16,'delete_transaction_history'),(64,'Can view transaction_history',16,'view_transaction_history'),(65,'Can add account',17,'add_account'),(66,'Can change account',17,'change_account'),(67,'Can delete account',17,'delete_account'),(68,'Can view account',17,'view_account'),(69,'Can add transaction type_list',18,'add_transactiontype_list'),(70,'Can change transaction type_list',18,'change_transactiontype_list'),(71,'Can delete transaction type_list',18,'delete_transactiontype_list'),(72,'Can view transaction type_list',18,'view_transactiontype_list');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(60) NOT NULL,
  `balance` double NOT NULL,
  `account_customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_account_account_customer_id_0ec6093e_fk_bank_customer_id` (`account_customer_id`),
  CONSTRAINT `bank_account_account_customer_id_0ec6093e_fk_bank_customer_id` FOREIGN KEY (`account_customer_id`) REFERENCES `bank_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES (1,'144030663',80,1),(2,'125678',60,1),(3,'15646',0,2),(4,'465489',0,3);
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_bank`
--

DROP TABLE IF EXISTS `bank_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_bank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_bank`
--

LOCK TABLES `bank_bank` WRITE;
/*!40000 ALTER TABLE `bank_bank` DISABLE KEYS */;
INSERT INTO `bank_bank` VALUES (1,'树蛙银行',0.045);
/*!40000 ALTER TABLE `bank_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_consumptiontype_list`
--

DROP TABLE IF EXISTS `bank_consumptiontype_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_consumptiontype_list` (
  `CoTypeId` int NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`CoTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_consumptiontype_list`
--

LOCK TABLES `bank_consumptiontype_list` WRITE;
/*!40000 ALTER TABLE `bank_consumptiontype_list` DISABLE KEYS */;
INSERT INTO `bank_consumptiontype_list` VALUES (0,'无'),(1,'教育'),(2,'交通'),(3,'通讯'),(4,'购物'),(5,'医疗'),(6,'旅行');
/*!40000 ALTER TABLE `bank_consumptiontype_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_credit_card`
--

DROP TABLE IF EXISTS `bank_credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_credit_card` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `limit_remain` double NOT NULL,
  `creditcard_account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_credit_card_creditcard_account_i_b4b9283d_fk_bank_acco` (`creditcard_account_id`),
  CONSTRAINT `bank_credit_card_creditcard_account_i_b4b9283d_fk_bank_acco` FOREIGN KEY (`creditcard_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_credit_card`
--

LOCK TABLES `bank_credit_card` WRITE;
/*!40000 ALTER TABLE `bank_credit_card` DISABLE KEYS */;
INSERT INTO `bank_credit_card` VALUES (1,2000,1),(2,2000,2),(3,50000,3),(4,10000,4);
/*!40000 ALTER TABLE `bank_credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_creditcard_history`
--

DROP TABLE IF EXISTS `bank_creditcard_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_creditcard_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` date NOT NULL,
  `amount` double NOT NULL,
  `creditCardHistory_account_id` bigint NOT NULL,
  `creditCardhistoryType_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_creditcard_hist_creditCardHistory_ac_f013a489_fk_bank_acco` (`creditCardHistory_account_id`),
  KEY `bank_creditcard_hist_creditCardhistoryTyp_b0dceac4_fk_bank_cred` (`creditCardhistoryType_id`),
  CONSTRAINT `bank_creditcard_hist_creditCardHistory_ac_f013a489_fk_bank_acco` FOREIGN KEY (`creditCardHistory_account_id`) REFERENCES `bank_account` (`id`),
  CONSTRAINT `bank_creditcard_hist_creditCardhistoryTyp_b0dceac4_fk_bank_cred` FOREIGN KEY (`creditCardhistoryType_id`) REFERENCES `bank_creditcardhistorytype_list` (`CeTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_creditcard_history`
--

LOCK TABLES `bank_creditcard_history` WRITE;
/*!40000 ALTER TABLE `bank_creditcard_history` DISABLE KEYS */;
INSERT INTO `bank_creditcard_history` VALUES (1,'2022-07-02',10,1,2),(2,'2022-07-02',20,1,2),(3,'2022-07-03',30,1,1),(4,'2022-07-03',0,2,1),(5,'2022-07-03',0,3,1),(6,'2022-07-03',0,4,1),(7,'2022-07-02',10,1,2),(8,'2022-07-02',20,1,2),(9,'2022-07-03',30,1,1),(10,'2022-07-03',0,2,1),(11,'2022-07-03',0,3,1),(12,'2022-07-03',0,4,1);
/*!40000 ALTER TABLE `bank_creditcard_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_creditcard_type`
--

DROP TABLE IF EXISTS `bank_creditcard_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_creditcard_type` (
  `credit` int NOT NULL,
  `limit` double NOT NULL,
  PRIMARY KEY (`credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_creditcard_type`
--

LOCK TABLES `bank_creditcard_type` WRITE;
/*!40000 ALTER TABLE `bank_creditcard_type` DISABLE KEYS */;
INSERT INTO `bank_creditcard_type` VALUES (1,2000),(2,10000),(3,50000);
/*!40000 ALTER TABLE `bank_creditcard_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_creditcardhistorytype_list`
--

DROP TABLE IF EXISTS `bank_creditcardhistorytype_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_creditcardhistorytype_list` (
  `CeTypeId` int NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`CeTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_creditcardhistorytype_list`
--

LOCK TABLES `bank_creditcardhistorytype_list` WRITE;
/*!40000 ALTER TABLE `bank_creditcardhistorytype_list` DISABLE KEYS */;
INSERT INTO `bank_creditcardhistorytype_list` VALUES (1,'信用卡还款'),(2,'信用卡支出');
/*!40000 ALTER TABLE `bank_creditcardhistorytype_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_customer`
--

DROP TABLE IF EXISTS `bank_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `customer_credit_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_customer_customer_credit_id_654674f6_fk_bank_cred` (`customer_credit_id`),
  CONSTRAINT `bank_customer_customer_credit_id_654674f6_fk_bank_cred` FOREIGN KEY (`customer_credit_id`) REFERENCES `bank_creditcard_type` (`credit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_customer`
--

LOCK TABLES `bank_customer` WRITE;
/*!40000 ALTER TABLE `bank_customer` DISABLE KEYS */;
INSERT INTO `bank_customer` VALUES (1,'张三',1),(2,'李四',3),(3,'王五',2);
/*!40000 ALTER TABLE `bank_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_loan`
--

DROP TABLE IF EXISTS `bank_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_loan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `year_interest_rate` double NOT NULL,
  `time_limit` int NOT NULL,
  `time` date NOT NULL,
  `loan_customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_loan_loan_customer_id_5641b7f6_fk_bank_customer_id` (`loan_customer_id`),
  CONSTRAINT `bank_loan_loan_customer_id_5641b7f6_fk_bank_customer_id` FOREIGN KEY (`loan_customer_id`) REFERENCES `bank_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_loan`
--

LOCK TABLES `bank_loan` WRITE;
/*!40000 ALTER TABLE `bank_loan` DISABLE KEYS */;
INSERT INTO `bank_loan` VALUES (1,1000,0.045,25,'2022-07-03',1),(2,1000,0.045,25,'2022-07-03',1),(3,1000,0.045,25,'2022-07-03',1),(4,1000,0.045,25,'2022-07-03',1),(5,1000,0.045,25,'2022-07-03',1),(6,1000,0.045,25,'2022-07-03',1);
/*!40000 ALTER TABLE `bank_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_repayment`
--

DROP TABLE IF EXISTS `bank_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_repayment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `time` date NOT NULL,
  `repayment_customer_id` bigint NOT NULL,
  `repayment_loan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_repayment_repayment_customer_i_d0e33222_fk_bank_cust` (`repayment_customer_id`),
  KEY `bank_repayment_repayment_loan_id_b629ec76_fk_bank_loan_id` (`repayment_loan_id`),
  CONSTRAINT `bank_repayment_repayment_customer_i_d0e33222_fk_bank_cust` FOREIGN KEY (`repayment_customer_id`) REFERENCES `bank_customer` (`id`),
  CONSTRAINT `bank_repayment_repayment_loan_id_b629ec76_fk_bank_loan_id` FOREIGN KEY (`repayment_loan_id`) REFERENCES `bank_loan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_repayment`
--

LOCK TABLES `bank_repayment` WRITE;
/*!40000 ALTER TABLE `bank_repayment` DISABLE KEYS */;
INSERT INTO `bank_repayment` VALUES (1,85,'2023-07-03',1,5),(2,81.175,'2023-07-03',1,5),(3,81.175,'2025-07-03',1,5);
/*!40000 ALTER TABLE `bank_repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_transaction_history`
--

DROP TABLE IF EXISTS `bank_transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_transaction_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `time` date NOT NULL,
  `useCreditCard` tinyint(1) NOT NULL,
  `consumptionType_id` int NOT NULL,
  `inAccount_id` bigint DEFAULT NULL,
  `outAccount_id` bigint DEFAULT NULL,
  `transactionType_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_transaction_his_consumptionType_id_6bf3a03e_fk_bank_cons` (`consumptionType_id`),
  KEY `bank_transaction_his_transactionType_id_91cfc5ec_fk_bank_tran` (`transactionType_id`),
  KEY `bank_transaction_his_inAccount_id_00d36941_fk_bank_acco` (`inAccount_id`),
  KEY `bank_transaction_his_outAccount_id_c5bd4e58_fk_bank_acco` (`outAccount_id`),
  CONSTRAINT `bank_transaction_his_consumptionType_id_6bf3a03e_fk_bank_cons` FOREIGN KEY (`consumptionType_id`) REFERENCES `bank_consumptiontype_list` (`CoTypeId`),
  CONSTRAINT `bank_transaction_his_inAccount_id_00d36941_fk_bank_acco` FOREIGN KEY (`inAccount_id`) REFERENCES `bank_account` (`id`),
  CONSTRAINT `bank_transaction_his_outAccount_id_c5bd4e58_fk_bank_acco` FOREIGN KEY (`outAccount_id`) REFERENCES `bank_account` (`id`),
  CONSTRAINT `bank_transaction_his_transactionType_id_91cfc5ec_fk_bank_tran` FOREIGN KEY (`transactionType_id`) REFERENCES `bank_transactiontype_list` (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_transaction_history`
--

LOCK TABLES `bank_transaction_history` WRITE;
/*!40000 ALTER TABLE `bank_transaction_history` DISABLE KEYS */;
INSERT INTO `bank_transaction_history` VALUES (1,100,'2022-07-03',0,0,1,NULL,1),(2,100,'2022-07-03',0,0,1,NULL,1),(3,100,'2022-07-03',0,0,1,NULL,1),(4,10,'2022-07-02',0,1,NULL,1,2),(5,10,'2022-07-02',0,1,NULL,1,2),(6,20,'2022-07-02',1,1,NULL,1,2),(7,10,'2022-07-02',1,1,NULL,1,2),(8,10,'2022-07-02',1,1,NULL,1,2),(9,10,'2022-07-02',0,2,2,1,3),(10,20,'2022-07-02',1,2,2,1,3),(11,30,'2022-07-03',0,0,NULL,1,2),(12,0,'2022-07-03',0,0,NULL,2,2),(13,0,'2022-07-03',0,0,NULL,3,2),(14,0,'2022-07-03',0,0,NULL,4,2),(15,100,'2022-07-03',0,0,1,NULL,1),(16,20,'2022-07-02',0,1,NULL,1,2),(17,10,'2022-07-02',1,1,NULL,1,2),(18,10,'2022-07-02',0,2,2,1,3),(19,20,'2022-07-02',1,2,2,1,3),(20,30,'2022-07-03',0,0,NULL,1,2),(21,0,'2022-07-03',0,0,NULL,2,2),(22,0,'2022-07-03',0,0,NULL,3,2),(23,0,'2022-07-03',0,0,NULL,4,2);
/*!40000 ALTER TABLE `bank_transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_transactiontype_list`
--

DROP TABLE IF EXISTS `bank_transactiontype_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_transactiontype_list` (
  `TypeId` int NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_transactiontype_list`
--

LOCK TABLES `bank_transactiontype_list` WRITE;
/*!40000 ALTER TABLE `bank_transactiontype_list` DISABLE KEYS */;
INSERT INTO `bank_transactiontype_list` VALUES (1,'存款'),(2,'取款'),(3,'转账');
/*!40000 ALTER TABLE `bank_transactiontype_list` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(17,'bank','account'),(7,'bank','bank'),(8,'bank','consumptiontype_list'),(9,'bank','credit_card'),(12,'bank','creditcard_history'),(10,'bank','creditcard_type'),(13,'bank','creditcardhistorytype_list'),(11,'bank','customer'),(14,'bank','loan'),(15,'bank','repayment'),(16,'bank','transaction_history'),(18,'bank','transactiontype_list'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-02 14:30:59.302995'),(2,'auth','0001_initial','2022-07-02 14:31:00.531683'),(3,'admin','0001_initial','2022-07-02 14:31:00.705164'),(4,'admin','0002_logentry_remove_auto_add','2022-07-02 14:31:00.711136'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-02 14:31:00.718139'),(6,'contenttypes','0002_remove_content_type_name','2022-07-02 14:31:00.837622'),(7,'auth','0002_alter_permission_name_max_length','2022-07-02 14:31:00.910171'),(8,'auth','0003_alter_user_email_max_length','2022-07-02 14:31:00.928375'),(9,'auth','0004_alter_user_username_opts','2022-07-02 14:31:00.935381'),(10,'auth','0005_alter_user_last_login_null','2022-07-02 14:31:01.184107'),(11,'auth','0006_require_contenttypes_0002','2022-07-02 14:31:01.187107'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-02 14:31:01.193155'),(13,'auth','0008_alter_user_username_max_length','2022-07-02 14:31:01.545919'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-02 14:31:01.601755'),(15,'auth','0010_alter_group_name_max_length','2022-07-02 14:31:01.642341'),(16,'auth','0011_update_proxy_permissions','2022-07-02 14:31:01.651761'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-02 14:31:01.711259'),(18,'sessions','0001_initial','2022-07-02 14:31:01.754199'),(19,'bank','0001_initial','2022-07-03 06:56:26.595860'),(20,'bank','0002_bank_rate','2022-07-03 08:38:57.355900'),(21,'bank','0003_alter_transaction_history_inaccount_and_more','2022-07-03 09:55:22.773129');
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

-- Dump completed on 2022-07-04  0:23:06
