CREATE DATABASE  IF NOT EXISTS `montgomery_county_crime` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `montgomery_county_crime`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: montgomery_county_crime
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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(45) NOT NULL,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'MCPD'),(2,'RCPD'),(3,'GPD'),(4,'TPPD');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `full_incident_details`
--

DROP TABLE IF EXISTS `full_incident_details`;
/*!50001 DROP VIEW IF EXISTS `full_incident_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `full_incident_details` AS SELECT 
 1 AS `incident_id`,
 1 AS `cr_number`,
 1 AS `agency_name`,
 1 AS `city`,
 1 AS `zip_code`,
 1 AS `street_name`,
 1 AS `street_type`,
 1 AS `district_name`,
 1 AS `crime_name1`,
 1 AS `crime_name2`,
 1 AS `crime_name3`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `incident_offenses`
--

DROP TABLE IF EXISTS `incident_offenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident_offenses` (
  `offense_code` varchar(45) NOT NULL,
  `incident_id` varchar(45) NOT NULL,
  PRIMARY KEY (`offense_code`,`incident_id`),
  KEY `fk_incident_offenses_incidents1_idx` (`incident_id`),
  CONSTRAINT `fk_incident_offenses_incidents1` FOREIGN KEY (`incident_id`) REFERENCES `incidents` (`incident_id`),
  CONSTRAINT `fk_incident_offenses_offenses1` FOREIGN KEY (`offense_code`) REFERENCES `offenses` (`offense_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident_offenses`
--

LOCK TABLES `incident_offenses` WRITE;
/*!40000 ALTER TABLE `incident_offenses` DISABLE KEYS */;
INSERT INTO `incident_offenses` VALUES ('2399','201087096'),('2303','201087097'),('5202','201087097'),('5707','201087097'),('1315','201087100'),('3562','201087102'),('5311','201087104'),('1313','201087108'),('5707','201087119'),('3550','201087135'),('2903','201087136'),('3512','201087139'),('3562','201087143'),('3582','201087143'),('3615','201087148'),('5311','201087148'),('2589','201087150'),('4199','201087152'),('2903','201087158'),('2601','201087161'),('2999','201087163'),('1210','201087164'),('3699','201087164'),('1399','201087165'),('1399','201087167'),('9106','201087171'),('3615','201087174'),('9199','201087177'),('9106','201087179'),('2601','201087181'),('5404','201087184'),('2303','201087186'),('2305','201087188'),('4199','201087194'),('4199','201087195'),('4199','201087197'),('2205','201087200'),('9042','201087209'),('4199','201087211'),('3562','201087212'),('2303','201087213'),('3562','201087217'),('5404','201087217'),('2308','201087218'),('2304','201087219'),('9199','201087221'),('2303','201087222'),('3562','201087223'),('5707','201087223'),('9106','201087224'),('4104','201087225'),('9199','201087227'),('9106','201087228'),('5404','201087229'),('4104','201087230'),('4104','201087231'),('9199','201087233'),('5311','201087235'),('3532','201087238'),('5404','201087238'),('1206','201087239'),('9199','201087241'),('9106','201087242'),('5404','201087244'),('2303','201087245'),('5707','201087245'),('4104','201087247'),('5404','201087248'),('3564','201087249'),('5311','201087249'),('5707','201087249'),('3582','201087250'),('2202','201087251'),('5404','201087252'),('2605','201087254'),('1205','201087255'),('5404','201087256'),('9199','201087258'),('2404','201087259'),('1399','201087262'),('2399','201087262'),('5404','201087263'),('1305','201087264'),('2202','201087264'),('2604','201087265'),('2399','201087266'),('2604','201087269'),('5404','201087271'),('5404','201087272'),('2305','201087274'),('1313','201087276'),('9101','201087278'),('2305','201087280');
/*!40000 ALTER TABLE `incident_offenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `incident_id` varchar(45) NOT NULL,
  `cr_number` varchar(45) NOT NULL,
  `police_district_id` int NOT NULL,
  `location_id` int NOT NULL,
  `agency_id` int NOT NULL,
  PRIMARY KEY (`incident_id`),
  KEY `fk_incidents_police_districts_idx` (`police_district_id`),
  KEY `fk_incidents_locations1_idx` (`location_id`),
  KEY `fk_incidents_agencies1_idx` (`agency_id`),
  CONSTRAINT `fk_incidents_agencies1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`),
  CONSTRAINT `fk_incidents_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `fk_incidents_police_districts` FOREIGN KEY (`police_district_id`) REFERENCES `police_districts` (`police_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES ('201087096','16033231',1,1,1),('201087097','16033232',2,2,1),('201087100','16033233',3,3,1),('201087102','16033238',4,4,1),('201087104','16033235',5,5,2),('201087108','16033248',6,6,1),('201087119','16033252',5,7,2),('201087135','16033263',7,8,1),('201087136','16033276',8,9,1),('201087139','16033280',9,10,2),('201087143','16033265',10,11,1),('201087148','16033275',11,12,1),('201087150','16033287',12,13,3),('201087152','16033291',6,14,1),('201087158','16033309',13,15,2),('201087161','16033313',14,16,1),('201087163','16033316',15,17,2),('201087164','16033267',6,18,1),('201087165','16033314',10,19,1),('201087167','16033290',16,20,1),('201087171','16033317',17,21,1),('201087174','16033304',18,22,1),('201087177','16033299',2,2,1),('201087179','16033310',19,23,4),('201087181','16033335',20,24,1),('201087184','16033237',6,25,1),('201087186','16033340',21,26,1),('201087188','16033338',22,27,1),('201087194','16033349',22,27,1),('201087195','16033323',9,28,1),('201087197','16033337',23,29,1),('201087200','16033352',24,30,1),('201087209','16033345',25,31,1),('201087211','16033382',26,32,1),('201087212','16033353',27,33,1),('201087213','16033342',28,34,3),('201087217','16033369',29,35,2),('201087218','16033393',19,36,4),('201087219','16033403',30,37,1),('201087221','16033404',31,38,1),('201087222','16033358',30,39,1),('201087223','16033398',4,40,1),('201087224','16033378',32,41,1),('201087225','16033390',33,42,1),('201087227','16033407',34,43,1),('201087228','16033395',32,44,1),('201087229','16033394',35,45,1),('201087230','16033388',7,46,1),('201087231','16033420',36,47,1),('201087233','16033424',37,48,1),('201087235','16033430',38,49,1),('201087238','16033416',39,50,1),('201087239','16033431',10,51,1),('201087241','16033436',40,52,1),('201087242','16033435',41,53,1),('201087244','16033425',42,54,1),('201087245','16033396',43,55,3),('201087247','16033412',44,56,1),('201087248','16033444',45,57,1),('201087249','16033405',46,58,1),('201087250','16033433',47,59,1),('201087251','16033456',48,60,1),('201087252','16033465',49,61,1),('201087254','16033434',50,62,2),('201087255','16033437',31,63,1),('201087256','16033471',51,64,1),('201087258','16033473',52,65,1),('201087259','16033475',53,66,1),('201087262','16033457',54,67,1),('201087263','16033460',55,68,1),('201087264','16033459',56,69,1),('201087265','16033332',57,70,1),('201087266','16033483',58,71,3),('201087269','16033392',59,72,1),('201087271','16033485',60,73,1),('201087272','16033449',61,74,1),('201087274','16033494',62,75,1),('201087276','16033495',63,76,1),('201087278','16033496',54,77,1),('201087280','16033489',64,78,1);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `incidents_by_city`
--

DROP TABLE IF EXISTS `incidents_by_city`;
/*!50001 DROP VIEW IF EXISTS `incidents_by_city`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `incidents_by_city` AS SELECT 
 1 AS `city`,
 1 AS `total_incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `incidents_by_district`
--

DROP TABLE IF EXISTS `incidents_by_district`;
/*!50001 DROP VIEW IF EXISTS `incidents_by_district`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `incidents_by_district` AS SELECT 
 1 AS `district_name`,
 1 AS `total_incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `incidents_per_agency`
--

DROP TABLE IF EXISTS `incidents_per_agency`;
/*!50001 DROP VIEW IF EXISTS `incidents_per_agency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `incidents_per_agency` AS SELECT 
 1 AS `agency_name`,
 1 AS `total_incidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `street_id` int NOT NULL,
  `address_number` varchar(45) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_locations_streets1_idx` (`street_id`),
  CONSTRAINT `fk_locations_streets1` FOREIGN KEY (`street_id`) REFERENCES `streets` (`street_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,1,'19600','GERMANTOWN','MD','20874'),(2,2,'13700','ROCKVILLE','MD','20906'),(3,3,'19700','GERMANTOWN','MD','20876'),(4,4,'900','SILVER SPRING','MD','20910'),(5,5,'1','ROCKVILLE','MD','20850'),(6,6,'19600','GERMANTOWN','MD','20874'),(7,7,'300','ROCKVILLE','MD','20850'),(8,8,'8500','SILVER SPRING','MD','20910'),(9,9,'900','TAKOMA PARK','MD','20912'),(10,10,'13000','ROCKVILLE','MD','20850'),(11,11,'8600','SILVER SPRING','MD','20901'),(12,12,'900','SILVER SPRING','MD','20910'),(13,13,'500','GAITHERSBURG','MD','20877'),(14,14,'20000','GERMANTOWN','MD','20874'),(15,15,'700','ROCKVILLE','MD','20850'),(16,16,'7800','POTOMAC','MD','20854'),(17,17,'300','ROCKVILLE','MD','20850'),(18,18,'12900','GERMANTOWN','MD','20874'),(19,19,'200','SILVER SPRING','MD','20901'),(20,20,'14400','BOYDS','MD','20841'),(21,21,'7400','BETHESDA','MD','20817'),(22,22,'10100','SILVER SPRING','MD','20902'),(23,23,'700','TAKOMA PARK','MD','20912'),(24,24,'9000','DAMASCUS','MD','20872'),(25,25,'19900','GERMANTOWN','MD','20874'),(26,26,'1','GAITHERSBURG','MD','20878'),(27,27,'10100','SILVER SPRING','MD','20903'),(28,28,'13200','ROCKVILLE','MD','20851'),(29,29,'2000','ROCKVILLE','MD','20851'),(30,30,'8700','BETHESDA','MD','20817'),(31,31,'4700','CHEVY CHASE','MD','20814'),(32,22,'14100','ROCKVILLE','MD','20906'),(33,32,'4700','ROCKVILLE','MD','20853'),(34,33,'700','GAITHERSBURG','MD','20877'),(35,34,'400','POTOMAC','MD','20850'),(36,35,'8300','TAKOMA PARK','MD','20912'),(37,36,'12200','SILVER SPRING','MD','20904'),(38,37,'100','SILVER SPRING','MD','20901'),(39,38,'12000','SILVER SPRING','MD','20904'),(40,39,'8100','SILVER SPRING','MD','20910'),(41,40,'18400','OLNEY','MD','20832'),(42,41,'2600','SILVER SPRING','MD','20906'),(43,42,'2200','SILVER SPRING','MD','20910'),(44,43,'18100','OLNEY','MD','20832'),(45,44,'20500','GERMANTOWN','MD','20876'),(46,45,'8400','SILVER SPRING','MD','20910'),(47,46,'8700','SILVER SPRING','MD','20903'),(48,47,'9900','ROCKVILLE','MD','20850'),(49,48,'11400','SILVER SPRING','MD','20904'),(50,22,'12400','SILVER SPRING','MD','20906'),(51,49,'1','SILVER SPRING','MD','20901'),(52,50,'10700','GAITHERSBURG','MD','20878'),(53,51,'18000','GERMANTOWN','MD','20874'),(54,52,'1200','SILVER SPRING','MD','20868'),(55,53,'15700','GAITHERSBURG','MD','20878'),(56,3,'19700','GERMANTOWN','MD','20874'),(57,54,'18300','MONTGOMERY VILLAGE','MD','20886'),(58,22,'12300','SILVER SPRING','MD','20902'),(59,55,'18500','GERMANTOWN','MD','20874'),(60,56,'4600','CHEVY CHASE','MD','20815'),(61,5,'100','ROCKVILLE','MD','20850'),(62,57,'300','ROCKVILLE','MD','20850'),(63,58,'1','SILVER SPRING','MD','20901'),(64,22,'10400','SILVER SPRING','MD','20902'),(65,59,'11700','POTOMAC','MD','20854'),(66,60,'300','SILVER SPRING','MD','20904'),(67,61,'20700','GERMANTOWN','MD','20874'),(68,27,'12200','SILVER SPRING','MD','20904'),(69,62,'1700','SILVER SPRING','MD','20902'),(70,63,'700','ROCKVILLE','MD','20850'),(71,64,'1','GAITHERSBURG','MD','20878'),(72,65,'3400','SILVER SPRING','MD','20906'),(73,66,'7100','CHEVY CHASE','MD','20814'),(74,67,'11200','SILVER SPRING','MD','20902'),(75,68,'1400','SILVER SPRING','MD','20910'),(76,69,'13400','POTOMAC','MD','20854'),(77,70,'13400','GERMANTOWN','MD','20874'),(78,71,'2600','SILVER SPRING','MD','20906');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offenses`
--

DROP TABLE IF EXISTS `offenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offenses` (
  `offense_code` varchar(45) NOT NULL,
  `nibrs_code` varchar(45) NOT NULL,
  `crime_name1` varchar(255) NOT NULL,
  `crime_name2` varchar(255) NOT NULL,
  `crime_name3` varchar(255) NOT NULL,
  PRIMARY KEY (`offense_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offenses`
--

LOCK TABLES `offenses` WRITE;
/*!40000 ALTER TABLE `offenses` DISABLE KEYS */;
INSERT INTO `offenses` VALUES ('1205','120','Crime Against Property','Robbery','ROBBERY - STREET-OTHER WEAPON'),('1206','120','Crime Against Property','Robbery','ROBBERY - STREET-STRONG-ARM'),('1210','120','Crime Against Property','Robbery','ROBBERY - FORCIBLE PURSE SNATCHING'),('1305','13A','Crime Against Person','Aggravated Assault','ASSAULT - AGGRAVATED - NON-FAMILY-OTHER WEAPON'),('1313','13B','Crime Against Person','Simple Assault','ASSAULT - SIMPLE'),('1315','13A','Crime Against Person','Aggravated Assault','ASSAULT - AGGRAVATED'),('1399','13B','Crime Against Person','Simple Assault','ASSAULT - 2ND DEGREE'),('2202','220','Crime Against Property','Burglary/Breaking and Entering','BURGLARY - FORCED ENTRY-RESIDENTIAL'),('2205','220','Crime Against Property','Burglary/Breaking and Entering','BURGLARY'),('2303','23C','Crime Against Property','Shoplifting','LARCENY - SHOPLIFTING'),('2304','23G','Crime Against Property','Theft of Motor Vehicle Parts or Accessories','LARCENY - AUTO PARTS'),('2305','23F','Crime Against Property','Theft From Motor Vehicle','LARCENY - FROM AUTO'),('2308','23D','Crime Against Property','Theft from Building','LARCENY - FROM BLDG'),('2399','23H','Crime Against Property','All other Larceny','LARCENY'),('2404','240','Crime Against Property','Motor Vehicle Theft','AUTO THEFT - VEHICLE THEFT'),('2589','250','Crime Against Property','Counterfeiting/Forgery','FORGERY'),('2601','26A','Crime Against Property','False Pretenses/Swindle/Confidence Game','FRAUD - CONFIDENCE GAME'),('2604','26C','Crime Against Property','Impersonation','FRAUD - IMPERSONATION'),('2605','26B','Crime Against Property','Credit Card/Automatic Teller Machine Fraud','FRAUD - ILLEGAL USE CREDIT CARDS'),('2903','290','Crime Against Property','Destruction/Damage/Vandalism of Property','DAMAGE PROPERTY - PUBLIC'),('2999','290','Crime Against Property','Destruction/Damage/Vandalism of Property','DAMAGE PROPERTY'),('3512','35A','Crime Against Society','Drug/Narcotic Violations','DRUGS - HEROIN - POSSESS'),('3532','35A','Crime Against Society','Drug/Narcotic Violations','DRUGS - COCAINE - POSSESS'),('3550','35B','Crime Against Society','Drug Equipment Violations','DRUGS - NARCOTIC EQUIP - POSSESS'),('3562','35A','Crime Against Society','Drug/Narcotic Violations','DRUGS - MARIJUANA - POSSESS'),('3564','35A','Crime Against Society','Drug/Narcotic Violations','DRUGS - MARIJUANA'),('3582','35A','Crime Against Society','Drug/Narcotic Violations','DRUGS - BARBITURATE - POSSESS'),('3615','90C','Crime Against Society','All Other Offenses','SEX OFFENSE - INDECENT EXPOSURE TO ADULT'),('3699','11D','Crime Against Person','Fondling','SEX OFFENSE - FONDLING'),('4104','90G','Crime Against Society','Liquor Law Violations','LIQUOR - POSSESS'),('4199','90G','Crime Against Society','Liquor Law Violations','LIQUOR'),('5202','520','Crime Against Society','Weapon Law Violations','WEAPON - CONCEALED'),('5311','90C','Crime Against Society','Disorderly Conduct','PUBLIC PEACE - DISORDERLY CONDUCT'),('5404','90D','Crime Against Society','Driving Under the Influence','DRIVING UNDER THE INFLUENCE LIQUOR'),('5707','90J','Crime Against Society','Trespass of Real Property','TRESPASSING'),('9042','90Z','Other','All Other Offenses','SUICIDE - ATTEMPT'),('9101','90Z','Other','All Other Offenses','SUDDEN DEATH'),('9106','90Z','Other','All Other Offenses','MENTAL ILLNESS'),('9199','90Z','Other','All Other Offenses','POLICE INFORMATION');
/*!40000 ALTER TABLE `offenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police_districts`
--

DROP TABLE IF EXISTS `police_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `police_districts` (
  `police_district_id` int NOT NULL AUTO_INCREMENT,
  `district_number` varchar(45) NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `sector` varchar(45) NOT NULL,
  `beat` varchar(45) NOT NULL,
  `pra` varchar(45) NOT NULL,
  PRIMARY KEY (`police_district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police_districts`
--

LOCK TABLES `police_districts` WRITE;
/*!40000 ALTER TABLE `police_districts` DISABLE KEYS */;
INSERT INTO `police_districts` VALUES (1,'5D','GERMANTOWN','N','5N1','595'),(2,'4D','WHEATON','K','4K2','337'),(3,'5D','GERMANTOWN','M','5M1','468'),(4,'3D','SILVER SPRING','G','3G1','93'),(5,'1D','ROCKVILLE','A','1A3','277'),(6,'5D','GERMANTOWN','N','5N1','702'),(7,'3D','SILVER SPRING','G','3G1','94'),(8,'3D','SILVER SPRING','H','3H1','129'),(9,'1D','ROCKVILLE','A','1A2','299'),(10,'3D','SILVER SPRING','H','3H1','126'),(11,'3D','SILVER SPRING','G','3G1','671'),(12,'6D','MONTGOMERY VILLAGE','P','6P2','428'),(13,'1D','ROCKVILLE','A','1A3','242'),(14,'2D','BETHESDA','E','20000','214'),(15,'1D','ROCKVILLE','A','1A3','254'),(16,'5D','GERMANTOWN','N','5N2','586'),(17,'2D','BETHESDA','E','2000','520'),(18,'3D','SILVER SPRING','G','3G2','174'),(19,'8D','CITY OF TAKOMA PARK','T','8T2','803'),(20,'5D','GERMANTOWN','M','5M2','612'),(21,'6D','MONTGOMERY VILLAGE','P','6P1','549'),(22,'3D','SILVER SPRING','H','3H2','140'),(23,'1D','ROCKVILLE','A','1A2','521'),(24,'2D','BETHESDA','E','200','56'),(25,'2D','BETHESDA','E','20','15'),(26,'4D','WHEATON','K','4K1','534'),(27,'4D','WHEATON','K','4K2','339'),(28,'6D','MONTGOMERY VILLAGE','R','6R1','548'),(29,'1D','ROCKVILLE','B','1B1','239'),(30,'3D','SILVER SPRING','I','3I1','146'),(31,'3D','SILVER SPRING','G','3G2','123'),(32,'4D','WHEATON','J','4J2','401'),(33,'4D','WHEATON','K','4K2','335'),(34,'2D','BETHESDA','D','2D1','87'),(35,'5D','GERMANTOWN','M','5M1','471'),(36,'3D','SILVER SPRING','H','3H1','128'),(37,'6D','MONTGOMERY VILLAGE','P','6P1','721'),(38,'3D','SILVER SPRING','I','3I1','145'),(39,'4D','WHEATON','K','4K1','351'),(40,'6D','MONTGOMERY VILLAGE','P','6P1','441'),(41,'5D','GERMANTOWN','N','5N2','448'),(42,'4D','WHEATON','J','4J1','680'),(43,'6D','MONTGOMERY VILLAGE','P','6P3','435'),(44,'5D','GERMANTOWN','M','5M1','470'),(45,'6D','MONTGOMERY VILLAGE','R','6R1','505'),(46,'4D','WHEATON','L','4L1','536'),(47,'5D','GERMANTOWN','N','5N2','594'),(48,'2D','BETHESDA','E','20','17'),(49,'1D','ROCKVILLE','A','1A3','261'),(50,'1D','ROCKVILLE','A','1A3','283'),(51,'4D','WHEATON','L','4L2','172'),(52,'1D','ROCKVILLE','B','1B2','230'),(53,'3D','SILVER SPRING','I','3I1','151'),(54,'5D','GERMANTOWN','N','5N1','465'),(55,'3D','SILVER SPRING','I','3I1','519'),(56,'3D','SILVER SPRING','G','3G2','101'),(57,'1D','ROCKVILLE','A','1A3','439'),(58,'6D','MONTGOMERY VILLAGE','P','6P1','442'),(59,'4D','WHEATON','K','4K1','346'),(60,'2D','BETHESDA','D','2D2','31'),(61,'4D','WHEATON','L','4L2','324'),(62,'3D','SILVER SPRING','G','3G1','89'),(63,'1D','ROCKVILLE','B','1B2','454'),(64,'4D','WHEATON','K','4K1','531');
/*!40000 ALTER TABLE `police_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets` (
  `street_id` int NOT NULL AUTO_INCREMENT,
  `street_name` varchar(255) NOT NULL,
  `street_type` varchar(255) NOT NULL,
  PRIMARY KEY (`street_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'CRYSTAL ROCK','DR'),(2,'CONNECTICUT','AVE'),(3,'FREDERICK','RD'),(4,'SILVER SPRING','AVE'),(5,'MARYLAND','AVE'),(6,'WATERS','RD'),(7,'HUNGERFORD','DR'),(8,'RAMSEY','AVE'),(9,'MAPLEWOOD','AVE'),(10,'ATLANTIC','AVE'),(11,'GEREN','RD'),(12,'ELLSWORTH','DR'),(13,'FREDERICK','AVE'),(14,'CENTURY','BLV'),(15,'PLEASANT','DR'),(16,'HIDDEN MEADOW','TER'),(17,'WASHINGTON','ST'),(18,'MIDDLEBROOK','RD'),(19,'HARTWELL','RD'),(20,'SATURN','WAY'),(21,'WESTLAKE','TER'),(22,'GEORGIA','AVE'),(23,'HUDSON','AVE'),(24,'GUE','RD'),(25,'AIRCRAFT','DR'),(26,'GRAND CORNER','AVE'),(27,'NEW HAMPSHIRE','AVE'),(28,'MIDWAY','AVE'),(29,'VEIRS MILL','RD'),(30,'HARTSDALE','AVE'),(31,'BRADLEY','BLV'),(32,'ASPEN HILL','RD'),(33,'RUSSELL','AVE'),(34,'WATTS BRANCH','PKW'),(35,'ROANOKE','AVE'),(36,'TECH','RD'),(37,'CROYDON','CT'),(38,'CHERRY HILL','RD'),(39,'FENTON','ST'),(40,'PARADISE COVE','TER'),(41,'URBANA','DR'),(42,'WASHINGTON','AVE'),(43,'OLD BALTIMORE','RD'),(44,'GERMANTOWN','RD'),(45,'COLESVILLE','RD'),(46,'PINEY BRANCH','RD'),(47,'MEDICAL CENTER','DR'),(48,'LOCKWOOD','DR'),(49,'WAYNE','AVE'),(50,'DARNESTOWN','RD'),(51,'COTTAGE GARDEN','DR'),(52,'SPENCERVILLE','RD'),(53,'SHADY GROVE','RD'),(54,'CONTOUR','RD'),(55,'NUTMEG','PL'),(56,'DORSET','AVE'),(57,'LINCOLN','AVE'),(58,'MANCHESTER','PL'),(59,'SLATESTONE','CT'),(60,'WILLINGTON','DR'),(61,'CRYSTAL HILL','CIR'),(62,'FLORA','LA'),(63,'GRAND CHAMPION','DR'),(64,'SCHOOL','DR'),(65,'CHISWICK','CT'),(66,'WOODMONT','AVE'),(67,'TRIANGLE','LA'),(68,'BLAIR MILL','RD'),(69,'BISSEL','LA'),(70,'BIDDEFORD','CT'),(71,'TELLURIDE','PL');
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_offenses`
--

DROP TABLE IF EXISTS `top_offenses`;
/*!50001 DROP VIEW IF EXISTS `top_offenses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_offenses` AS SELECT 
 1 AS `offense_name`,
 1 AS `crime_against`,
 1 AS `times_charged`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'montgomery_county_crime'
--

--
-- Final view structure for view `full_incident_details`
--

/*!50001 DROP VIEW IF EXISTS `full_incident_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `full_incident_details` AS select `i`.`incident_id` AS `incident_id`,`i`.`cr_number` AS `cr_number`,`a`.`agency_name` AS `agency_name`,`l`.`city` AS `city`,`l`.`zip_code` AS `zip_code`,`s`.`street_name` AS `street_name`,`s`.`street_type` AS `street_type`,`pd`.`district_name` AS `district_name`,`o`.`crime_name1` AS `crime_name1`,`o`.`crime_name2` AS `crime_name2`,`o`.`crime_name3` AS `crime_name3` from ((((((`incidents` `i` join `agencies` `a` on((`a`.`agency_id` = `i`.`agency_id`))) join `locations` `l` on((`l`.`location_id` = `i`.`location_id`))) join `streets` `s` on((`s`.`street_id` = `l`.`street_id`))) join `police_districts` `pd` on((`pd`.`police_district_id` = `i`.`police_district_id`))) join `incident_offenses` `io` on((`io`.`incident_id` = `i`.`incident_id`))) join `offenses` `o` on((`o`.`offense_code` = `io`.`offense_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidents_by_city`
--

/*!50001 DROP VIEW IF EXISTS `incidents_by_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidents_by_city` AS select `l`.`city` AS `city`,count(`i`.`incident_id`) AS `total_incidents` from (`locations` `l` join `incidents` `i` on((`i`.`location_id` = `l`.`location_id`))) group by `l`.`city` order by `total_incidents` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidents_by_district`
--

/*!50001 DROP VIEW IF EXISTS `incidents_by_district`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidents_by_district` AS select `pd`.`district_name` AS `district_name`,count(`i`.`incident_id`) AS `total_incidents` from (`police_districts` `pd` join `incidents` `i` on((`i`.`police_district_id` = `pd`.`police_district_id`))) group by `pd`.`district_name` order by `total_incidents` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidents_per_agency`
--

/*!50001 DROP VIEW IF EXISTS `incidents_per_agency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidents_per_agency` AS select `a`.`agency_name` AS `agency_name`,count(`i`.`incident_id`) AS `total_incidents` from (`agencies` `a` join `incidents` `i` on((`i`.`agency_id` = `a`.`agency_id`))) group by `a`.`agency_name` order by `total_incidents` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_offenses`
--

/*!50001 DROP VIEW IF EXISTS `top_offenses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_offenses` AS select `o`.`crime_name3` AS `offense_name`,`o`.`crime_name1` AS `crime_against`,count(`io`.`incident_id`) AS `times_charged` from (`offenses` `o` join `incident_offenses` `io` on((`io`.`offense_code` = `o`.`offense_code`))) group by `o`.`crime_name3`,`o`.`crime_name1` order by `times_charged` desc */;
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

-- Dump completed on 2026-05-11 21:28:03
