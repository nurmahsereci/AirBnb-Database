CREATE DATABASE  IF NOT EXISTS `airbnb_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airbnb_database`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: airbnb_database
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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,'Free Wi-Fi','High-speed internet access'),(2,'Air Conditioning','Central air conditioning'),(3,'Free Parking','Complimentary parking space available'),(4,'Gym Access','Access to on-site fitness facilities'),(5,'Pool','Outdoor swimming pool for guests'),(6,'Kitchen','Fully equipped kitchen with appliances'),(7,'Pet Friendly','Pets are welcome in the accommodation'),(8,'Wi-Fi in Common Areas','Wireless internet available in common areas'),(9,'Breakfast Included','Complimentary breakfast provided'),(10,'Private Entrance','Separate entrance for added privacy'),(11,'TV','Television with cable/satellite channels'),(12,'Laundry Facilities','On-site laundry facilities'),(13,'Smoking Allowed','Designated smoking areas'),(14,'Air Purifier','Air purification system installed'),(15,'Fireplace','Cozy fireplace in the accommodation'),(16,'Balcony','Private balcony with scenic views'),(17,'Wheelchair Accessible','Accessible for guests with disabilities'),(18,'Workspace','Dedicated workspace for remote work'),(19,'Security Cameras','Security cameras for enhanced safety'),(20,'Bike Storage','Secure storage for bicycles');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_listing`
--

DROP TABLE IF EXISTS `amenity_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity_listing` (
  `place_id` int DEFAULT NULL,
  `amenity_id` int DEFAULT NULL,
  KEY `place_id` (`place_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `amenity_listing_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `amenity_listing_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_listing`
--

LOCK TABLES `amenity_listing` WRITE;
/*!40000 ALTER TABLE `amenity_listing` DISABLE KEYS */;
INSERT INTO `amenity_listing` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10),(6,11),(6,12),(7,13),(7,14),(8,15),(8,16),(9,17),(9,18),(10,19),(10,20),(11,10),(11,9),(12,8),(12,7),(13,6),(13,5),(14,6),(14,11),(15,12),(15,10),(16,11),(16,12),(17,12),(17,17),(19,17),(19,20),(20,19),(20,20),(18,18),(18,19),(1,7),(1,11),(1,12),(1,16),(2,1),(2,5),(2,6),(2,11),(2,12),(2,15),(2,20),(3,1),(3,11),(3,12),(3,15),(3,20),(4,12),(4,19),(4,20),(5,1),(5,13),(5,20),(6,1),(6,18),(7,6),(7,16),(7,17),(7,19),(8,1),(8,2),(8,9),(8,11),(8,14),(9,1),(9,9),(9,11),(9,12),(10,8),(11,1),(11,5),(11,6),(12,6),(12,11),(12,18),(13,11),(13,2),(13,7),(13,10),(14,1),(14,14),(15,1),(15,2),(16,1),(16,6),(16,14),(15,1),(15,2),(15,6),(16,1),(16,6),(16,14),(17,6),(17,10),(18,1),(19,1),(19,9),(20,6),(20,8),(21,1),(21,3),(21,5),(22,2),(22,4),(22,5),(22,6),(22,7),(23,1),(23,2),(23,9),(23,10),(24,3),(24,4),(25,5),(25,1),(25,2),(26,8),(26,9),(26,2),(26,3),(26,7),(26,12),(26,19),(27,7),(27,8),(27,9),(27,1),(28,2),(28,3),(29,4),(29,5),(29,6),(30,1),(30,3),(30,9),(30,10);
/*!40000 ALTER TABLE `amenity_listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `id` int NOT NULL,
  `explanations` varchar(250) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `related_guest_id` int DEFAULT NULL,
  `related_host_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `related_guest_id` (`related_guest_id`),
  KEY `related_host_id` (`related_host_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`related_guest_id`) REFERENCES `guest` (`id`),
  CONSTRAINT `complaint_ibfk_3` FOREIGN KEY (`related_host_id`) REFERENCES `host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'Noise issue during stay','Open',4,3,22),(2,'Cleanliness concern in the bathroom','Resolved',11,10,16),(3,'Check-in process was confusing','Open',19,18,7),(4,'Wi-Fi not working properly','Open',23,4,3),(5,'Unpleasant smell in the room','Resolved',2,2,24),(6,'Damaged furniture in the living room','Open',15,14,11),(7,'Late check-in without prior notice','Open',6,5,20),(8,'Miscommunication on amenities','Resolved',8,7,18),(9,'Unresponsive host during the stay','Open',9,8,17),(10,'Issues with the payment process','Resolved',10,9,16),(11,'Inaccurate listing description','Open',11,10,15),(12,'Lack of heating in the winter','Open',12,11,14),(13,'Unauthorized entry to the property','Resolved',13,12,13),(14,'Security concerns in the neighborhood','Open',14,13,12),(15,'Unavailability of promised amenities','Resolved',15,14,11),(16,'Issues with refund after cancellation','Open',13,12,13),(17,'Unexpected additional charges','Open',17,16,9),(18,'Bedding not provided as described','Resolved',18,17,8),(19,'Unprofessional behavior of the host','Open',16,15,10),(20,'Overbooking issue during peak season','Resolved',5,4,21),(21,'Profile image not displaying correctly','Open',NULL,29,NULL),(22,'Unable to update profile description','Open',NULL,15,NULL),(23,'Experiencing issues with account verification','Resolved',NULL,31,NULL),(24,'Unable to view booking history','Open',NULL,3,NULL),(25,'Profile language preference not updating',NULL,NULL,NULL,23),(26,'Payment card information not saved','Resolved',NULL,NULL,9),(27,'Unable to respond to reservation requests','Open',NULL,NULL,3),(28,'Host communication problems','Resolved',NULL,18,6),(29,'Unable to respond to reservation requests','Resolved',NULL,NULL,8),(30,'Unable to respond to reservation requests','Open',NULL,NULL,1);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `birthdate` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `annual_leave` varchar(45) DEFAULT NULL,
  `reports_to` int DEFAULT NULL,
  `employee_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_id` (`employee_user_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`employee_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'1978-05-15','2018-02-01','Market Manager','30 days',NULL,42),(2,'1985-08-22','2019-06-15','Operations Manager','25 days',NULL,43),(3,'1980-03-10','2016-01-10','Head of Engineer','18 days',NULL,44),(4,'1988-11-05','2020-09-05','Senior Software Engineer','22 days',3,45),(5,'1995-06-30','2023-04-20','Junior Mobile Developer','21 days',3,46),(6,'1987-12-12','2015-07-01','Mid-level Data Engineer','23 days',3,47),(7,'1995-09-18','2013-11-15','Junior Data Scientist','20 days',6,48),(8,'1990-04-25','2021-08-10','Data Analyst Specialist','24 days',6,49),(9,'1993-01-08','2020-03-01','Product Manager Specialist','19 days',1,50),(10,'1989-07-20','2017-12-05','UX/UI Designer','26 days',3,51),(11,'1982-04-02','2021-02-15','Senior Financial Analyst','20 days',NULL,52),(12,'1979-10-15','2014-04-01','Rucruiting Coordinator','22 days',NULL,53),(13,'1988-03-28','2020-09-15','Technical Recruiter','21 days',3,54),(14,'1983-08-08','2015-01-10','Program Manager','23 days',12,55),(15,'1997-11-12','2020-07-01','Security Engineer Analyst','18 days',3,56),(16,'1982-06-05','2016-11-20','Mid-level System Engineer','22 days',3,57),(17,'1998-09-22','2021-10-15','Community Organizer','19 days',1,58),(18,'1989-12-30','2022-08-05','Global Benefits Analyst','24 days',1,59),(19,'1980-05-25','2018-12-01','Senior Security Analyst','20 days',3,60),(20,'1980-03-18','2015-03-10','Admin','25 days',19,41);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `id` int NOT NULL,
  `payment_card_info` varchar(200) DEFAULT NULL,
  `guest_user_id` int DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `guest_billing_address_id` int DEFAULT NULL,
  `profile_language_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guest_user_id` (`guest_user_id`),
  KEY `guest_billing_address_id` (`guest_billing_address_id`),
  KEY `profile_language_id` (`profile_language_id`),
  CONSTRAINT `guest_ibfk_2` FOREIGN KEY (`guest_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `guest_ibfk_3` FOREIGN KEY (`guest_billing_address_id`) REFERENCES `location` (`id`),
  CONSTRAINT `guest_ibfk_4` FOREIGN KEY (`profile_language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'**** **** **** 1234',1,'Travel enthusiast',60,1),(2,'**** **** **** 5678',2,'Explorer and food lover',61,2),(3,'**** **** **** 3456',3,'Nature lover and photographer',62,4),(4,'**** **** **** 7890',4,'City explorer and art enthusiast',63,5),(5,'**** **** **** 1235',5,'Tech geek and bookworm',64,6),(6,'**** **** **** 5679',6,'Beach bum and water sports enthusiast',65,7),(7,'**** **** **** 9013',7,'Fitness enthusiast and health advocate',66,8),(8,'**** **** **** 2345',8,'Family person and pet lover',67,9),(9,'**** **** **** 6789',9,'History buff and antique collector',68,10),(10,'**** **** **** 0123',10,'Musician and night owl',69,11),(11,'**** **** **** 3456',11,'Adventure seeker and adrenaline junkie',70,12),(12,'**** **** **** 7890',12,'Fashionista and shopping enthusiast',71,13),(13,'**** **** **** 1235',13,'Gourmet chef and food critic',72,14),(14,'**** **** **** 5679',14,'Yoga practitioner and meditation guru',73,15),(15,'**** **** **** 9013',15,'Tech entrepreneur and startup enthusiast',74,16),(16,'**** **** **** 2345',16,'Artistic soul and creative thinker',75,17),(17,'**** **** **** 6789',17,'Environmental activist and nature advocate',76,18),(18,'**** **** **** 0123',18,'Film buff and movie critic',77,19),(19,'**** **** **** 3456',19,'Fitness trainer and health coach',78,20),(20,'**** **** **** 9012',20,'Adventurous spirit',79,3),(21,'**** **** **** 4321',61,'Travel enthusiast',80,1),(22,'**** **** **** 8765',62,'Explorer and food lover',37,1),(23,'**** **** **** 6543',63,'Nature lover and photographer',38,1),(24,'**** **** **** 0987',64,'City explorer and art enthusiast',39,1),(25,'**** **** **** 5432',65,'Tech geek and bookworm',40,1),(26,'**** **** **** 4321',71,'Travel blogger exploring new destinations',21,1),(27,'**** **** **** 8765',72,'Art enthusiast and culture lover',81,4),(28,'**** **** **** 2109',73,'Nature lover and outdoor adventurer',82,3),(29,'**** **** **** 5432',74,'Digital nomad working remotely',83,4),(30,'**** **** **** 9876',75,'Foodie on a culinary journey',84,5),(31,'**** **** **** 1230',76,'Bookworm exploring literature worldwide',85,16),(32,'**** **** **** 5678',77,'Photography enthusiast capturing memories',101,3),(33,'**** **** **** 9012',78,'History buff exploring ancient civilizations',102,1),(34,'**** **** **** 3456',79,'Fitness fanatic seeking active vacations',103,1),(35,'**** **** **** 7890',80,'Tech geek exploring innovation hubs',104,1);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_booked_place`
--

DROP TABLE IF EXISTS `guest_booked_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_booked_place` (
  `guest_id` int DEFAULT NULL,
  `booked_place_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  KEY `guest_id` (`guest_id`),
  KEY `booked_place_id` (`booked_place_id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `guest_booked_place_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`id`),
  CONSTRAINT `guest_booked_place_ibfk_2` FOREIGN KEY (`booked_place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `guest_booked_place_ibfk_3` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_booked_place`
--

LOCK TABLES `guest_booked_place` WRITE;
/*!40000 ALTER TABLE `guest_booked_place` DISABLE KEYS */;
INSERT INTO `guest_booked_place` VALUES (1,1,1),(2,2,2),(3,4,4),(4,5,5),(5,6,6),(6,7,7),(7,8,8),(8,9,9),(9,10,10),(10,11,11),(11,12,12),(12,13,13),(13,14,14),(14,15,15),(15,16,16),(16,17,17),(17,18,18),(18,19,19),(19,20,20),(20,10,21),(2,2,22),(4,12,23),(6,13,24),(8,14,25),(10,19,26),(12,18,27),(14,17,28),(16,15,29),(18,17,30),(1,21,31),(2,22,32),(8,23,33),(11,24,34),(15,25,35),(5,26,36),(7,27,37),(6,28,38),(2,29,39),(9,30,40);
/*!40000 ALTER TABLE `guest_booked_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `id` int NOT NULL,
  `lang_speaking_id` int DEFAULT NULL,
  `host_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang_speaking_id` (`lang_speaking_id`),
  KEY `host_user_id` (`host_user_id`),
  CONSTRAINT `host_ibfk_1` FOREIGN KEY (`lang_speaking_id`) REFERENCES `language` (`id`),
  CONSTRAINT `host_ibfk_2` FOREIGN KEY (`host_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,1,21),(2,1,22),(3,1,23),(4,1,24),(5,5,25),(6,1,26),(7,7,27),(8,1,28),(9,9,29),(10,1,30),(11,1,31),(12,2,32),(13,1,33),(14,1,34),(15,1,35),(16,17,36),(17,17,37),(18,1,38),(19,1,39),(20,1,40),(21,1,66),(22,1,67),(23,11,68),(24,9,69),(25,1,70);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_offered_place`
--

DROP TABLE IF EXISTS `host_offered_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host_offered_place` (
  `host_id` int DEFAULT NULL,
  `offered_place_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `yearly_income_id` int DEFAULT NULL,
  KEY `offered_place_id` (`offered_place_id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `host_id` (`host_id`),
  KEY `yearly_income_id` (`yearly_income_id`),
  CONSTRAINT `host_offered_place_ibfk_1` FOREIGN KEY (`offered_place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `host_offered_place_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `host_offered_place_ibfk_3` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`),
  CONSTRAINT `host_offered_place_ibfk_4` FOREIGN KEY (`yearly_income_id`) REFERENCES `income` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_offered_place`
--

LOCK TABLES `host_offered_place` WRITE;
/*!40000 ALTER TABLE `host_offered_place` DISABLE KEYS */;
INSERT INTO `host_offered_place` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10),(11,11,11,11),(12,12,12,12),(13,13,13,13),(14,14,14,14),(15,15,15,15),(16,16,16,16),(17,17,17,17),(18,18,18,18),(19,19,19,19),(20,20,20,20),(10,10,21,10),(2,2,22,2),(12,12,23,12),(13,13,24,13),(14,14,25,14),(19,19,26,19),(18,18,27,18),(17,17,28,17),(15,15,29,15),(17,17,30,17),(21,21,31,21),(22,22,32,22),(23,23,33,23),(24,24,34,24),(25,25,35,25),(6,26,36,26),(13,27,37,27),(17,28,38,28),(20,29,39,29),(22,30,40,30);
/*!40000 ALTER TABLE `host_offered_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `id` int NOT NULL,
  `year` varchar(45) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'2024',450,1),(2,'2024',1662,2),(3,'2024',340,3),(4,'2024',728,4),(5,'2024',896,5),(6,'2024',300,6),(7,'2024',520,7),(8,'2024',940,8),(9,'2024',176,9),(10,'2024',560,10),(11,'2024',360,11),(12,'2024',4355,12),(13,'2024',2835,13),(14,'2024',350,14),(15,'2024',3750,15),(16,'2024',525,16),(17,'2024',6937,17),(18,'2024',1050,18),(19,'2024',3314,19),(20,'2024',621,20),(21,'2024',537.5,21),(22,'2024',1572,22),(23,'2024',2925,23),(24,'2024',1980,24),(25,'2024',11542.5,25),(26,'2024',7426.75,26),(27,'2024',2401,27),(28,'2024',1518.25,28),(29,'2024',427.5,29),(30,'2024',11905,30);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(2,'Spanish'),(3,'French'),(4,'German'),(5,'Italian'),(6,'Chinese'),(7,'Russian'),(8,'Arabic'),(9,'Portuguese'),(10,'Dutch'),(11,'Korean'),(12,'Swedish'),(13,'Turkish'),(14,'Hindi'),(15,'Hebrew'),(16,'Greek'),(17,'Polish'),(18,'Czech'),(19,'Thai'),(20,'Danish');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `id` int NOT NULL,
  `listed_place_id` int DEFAULT NULL,
  `cover_photo_id` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listed_place_id` (`listed_place_id`),
  KEY `cover_photo_id` (`cover_photo_id`),
  CONSTRAINT `listing_ibfk_1` FOREIGN KEY (`listed_place_id`) REFERENCES `place` (`id`),
  CONSTRAINT `listing_ibfk_2` FOREIGN KEY (`cover_photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (1,1,20,'Beautiful apartment just a 15-minute walk from the beautiful Santa Monica Beach '),(2,2,22,'This memorable place is anything but ordinary.'),(3,3,23,'Quaint cottage surrounded by nature'),(4,4,24,'Luxury penthouse with city skyline views'),(5,5,25,'Rustic villa retreat'),(6,6,26,'Charming studio with river view'),(7,7,27,'Elegant townhouse with Eiffel Tower view'),(8,8,28,'Beachfront paradise with private access'),(9,9,29,'Artistic loft in a vibrant neighborhood'),(10,10,30,'Historic house with modern amenities'),(11,11,31,'Contemporary apartment in the heart of the Beijing'),(12,12,32,'Sunny bungalow near cultural district'),(13,13,33,'elegant and cozy apartment with a breathtaking Colosseum view'),(14,14,34,'Minimalist guest suite in a quiet neighborhood'),(15,15,35,'Stylish mansion with garden and pool'),(16,16,36,'Mountain retreat with breathtaking views'),(17,17,37,'Futuristic apartment with the Bosphorus view'),(18,18,38,'Bohemian-style house in a lively district'),(19,19,39,'Countryside farmhouse with modern amenities'),(20,20,21,'Coastal cottage with a private dock'),(21,21,NULL,'Quaint apartment in the heart of Mexico City'),(22,22,NULL,'Chic studio in the city center'),(23,23,NULL,'Luxurious penthouse with panoramic views of Singapore'),(24,24,NULL,'Artistic loft in the popular part of the city'),(25,25,NULL,'Modern townhouse in the commercial and finance center of the Tokyo '),(26,26,NULL,'Cozy apartment on Lombard Street that is famous for one-block section with eight hairpin turns '),(27,27,NULL,'Spacious condo with ocean views'),(28,28,NULL,'City-center apartment with historical beautiful Valencia view'),(29,29,NULL,'Quirky and decorated with pieces from Indian culture'),(30,30,NULL,'Luxury villa where stunning architecture and a vibrant arts scene');
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `post_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'USA','California','Los Angeles','123 Main St','90001'),(2,'Spain','Catalonia','Barcelona','456 Oak St','08001'),(3,'Canada','Ontario','Toronto','789 Elm St','M5J 2T2'),(4,'Australia','New South Wales','Sydney','101 George St','2000'),(5,'United Kingdom','England','London','45 Baker St','W1U 8EW'),(6,'Germany','Bavaria','Munich','15 Marienplatz','80331'),(7,'France','Île-de-France','Paris','20 Champs-Élysées','75008'),(8,'Brazil','São Paulo','São Paulo','30 Avenida Paulista','01310-200'),(9,'South Africa','Gauteng','Johannesburg','5 Sandton Dr','2196'),(10,'India','Maharashtra','Mumbai','40 Marine Dr','400001'),(11,'China','Beijing','Beijing','50 Wangfujing St','100006'),(12,'Russia','Moscow','Moscow','25 Red Square','109012'),(13,'Italy','Lazio','Rome','35 Colosseum Rd','00184'),(14,'Mexico','Mexico City','Mexico City','60 Paseo de la Reforma','06500'),(15,'South Korea','Seoul','Seoul','10 Gwanghwamun Square','03154'),(16,'Sweden','Stockholm','Stockholm','18 Drottninggatan','11151'),(17,'Turkey','Istanbul','Istanbul','22 Istiklal Ave','34430'),(18,'Netherlands','North Holland','Amsterdam','28 Keizersgracht','1015 CR'),(19,'Greece','Attica','Athens','8 Ermou St','10563'),(20,'Thailand','Bangkok','Bangkok','12 Sukhumvit Rd','10110'),(21,'France','Île-de-France','Paris','456 Rue de la Paix','75001'),(22,'Australia','New South Wales','Sydney','789 George St','2000'),(23,'Italy','Lazio','Rome','123 Via del Corso','00186'),(24,'Canada','Ontario','Toronto','456 Yonge St','M5B 1S4'),(25,'Germany','Bavaria','Munich','789 Marienplatz','80331'),(26,'Brazil','São Paulo','São Paulo','123 Avenida Paulista','01310-000'),(27,'South Africa','Western Cape','Cape Town','456 Long St','8000'),(28,'China','Beijing','Beijing','789 Wangfujing St','100006'),(29,'Mexico','Mexico City','Mexico City','123 Paseo de la Reforma','06500'),(30,'Russia','Moscow','Moscow','456 Red Square','101000'),(31,'India','Maharashtra','Mumbai','789 Marine Drive','400020'),(32,'Argentina','Buenos Aires','Buenos Aires','123 Avenida 9 de Julio','C1073ABA'),(33,'Switzerland','Zurich','Zurich','456 Bahnhofstrasse','8001'),(34,'Singapore','Central Region','Singapore','789 Orchard Rd','238839'),(35,'Netherlands','North Holland','Amsterdam','123 Dam Square','1012'),(36,'Sweden','Stockholm','Stockholm','456 Drottninggatan','111 51'),(37,'United Arab Emirates','Dubai','Dubai','789 Sheikh Zayed Rd','PO Box 12345'),(38,'Thailand','Bangkok','Bangkok','123 Sukhumvit Rd','10110'),(39,'Portugal','Lisbon','Lisbon','456 Rua Augusta','1100-053'),(40,'South Korea','Seoul','Seoul','789 Myeongdong St','04537'),(41,'Italy','Lazio','Rome','Via Roma','00100'),(42,'Canada','Ontario','Toronto','King Street','M5V 1J2'),(43,'Australia','New South Wales','Sydney','George Street','2000'),(44,'Brazil','Sao Paulo','Sao Paulo','Avenida Paulista','01310-000'),(45,'Germany','Bavaria','Munich','Marienplatz','80331'),(46,'China','Beijing','Beijing','Wangfujing Street','100006'),(47,'South Africa','Gauteng','Johannesburg','Sandton','2196'),(48,'Mexico','Mexico City','Mexico City','Paseo de la Reforma','06500'),(49,'Netherlands','North Holland','Amsterdam','Keizersgracht','1015 CJ'),(50,'Singapore','Central Region','Singapore','Orchard Road','238825'),(51,'United Kingdom','England','London','Baker Street','W1U 6TJ'),(52,'Japan','Tokyo','Shinjuku','Kabukicho','160-0021'),(53,'United States','New York','New York City','Broadway','10001'),(54,'France','Ile-de-France','Paris','Champs-Elysees','75008'),(55,'Spain','Catalonia','Barcelona','La Rambla','08002'),(56,'India','Maharashtra','Mumbai','Colaba','400001'),(57,'Russia','Moscow','Moscow','Red Square','109012'),(58,'Switzerland','Zurich','Zurich','Bahnhofstrasse','8001'),(59,'South Korea','Seoul','Seoul','Myeongdong','04537'),(60,'Sweden','Stockholm','Stockholm','Drottninggatan','111 51'),(61,'Argentina','Buenos Aires','Buenos Aires','Avenida 9 de Julio','C1073ABA'),(62,'Thailand','Bangkok','Bangkok','Sukhumvit Road','10110'),(63,'Portugal','Lisbon','Lisbon','Rua Augusta','1100-053'),(64,'Turkey','Istanbul','Istanbul','Istiklal Avenue','34435'),(65,'Vietnam','Hanoi','Hanoi','Hoan Kiem District','100000'),(66,'Egypt','Cairo','Cairo','Tahrir Square','11516'),(67,'Peru','Lima','Lima','Miraflores','L18'),(68,'Norway','Oslo','Oslo','Karl Johans gate','0159'),(69,'Denmark','Copenhagen','Copenhagen','Strøget','1160'),(70,'Greece','Attica','Athens','Ermou Street','10563'),(71,'Ireland','Dublin','Dublin','Grafton Street','D02 CH59'),(72,'Austria','Vienna','Vienna','Kärntner Straße','1010'),(73,'Belgium','Brussels','Brussels','Grand Place','1000'),(74,'Czech Republic','Prague','Prague','Wenceslas Square','110 00'),(75,'Finland','Helsinki','Helsinki','Esplanadi','00100'),(76,'Poland','Warsaw','Warsaw','Nowy Świat','00-001'),(77,'Malaysia','Kuala Lumpur','Kuala Lumpur','Bukit Bintang','55100'),(78,'Philippines','Manila','Manila','Intramuros','1002'),(79,'South Africa','Western Cape','Cape Town','Long Street','8001'),(80,'United Arab Emirates','Dubai','Dubai','Sheikh Zayed Road','PO Box 121000'),(81,'Chile','Santiago','Santiago','Paseo Ahumada','8320000'),(82,'Indonesia','Jakarta','Jakarta','Jalan Thamrin','10310'),(83,'Netherlands','North Brabant','Eindhoven','Piazza','5611 AE'),(84,'New Zealand','Auckland','Auckland','Queen Street','1010'),(85,'Switzerland','Geneva','Geneva','Rue du Rhône','1204'),(86,'Italy','Veneto','Venice','Piazza San Marco','30124'),(87,'Spain','Andalusia','Seville','Plaza de España','41004'),(88,'Germany','Berlin','Berlin','Unter den Linden','10117'),(89,'Portugal','Porto','Porto','Rua de Santa Catarina','4000-450'),(90,'Japan','Osaka','Osaka','Dotonbori','542-0071'),(91,'Mexico','Mexico City','Mexico City','Paseo de la Reforma','06500'),(92,'Netherlands','North Holland','Amsterdam','Herengracht','1017 CE'),(93,'Singapore','Central Region','Singapore','Marina Bay Sands','018956'),(94,'United Kingdom','England','London','Oxford Street','W1C 1JG'),(95,'Japan','Tokyo','Tokyo','Shibuya','150-0001'),(96,'United States','California','San Francisco','Lombard Street','94133'),(97,'France','Provence-Alpes-Côte Azur','Nice','Promenade des Anglais','06000'),(98,'Spain','Valencia','Valencia','Ciudad de las Artes y las Ciencias','46023'),(99,'India','Delhi','New Delhi','Connaught Place','110001'),(100,'Australia','Victoria','Melbourne','Federation Square','3000'),(101,'Canada','British Columbia','Vancouver','Granville Island','V6H 3S3'),(102,'Germany','Bavaria','Nuremberg','Kaiserburg Nürnberg','90403'),(103,'China','Shanghai','Shanghai','The Bund','200002'),(104,'South Africa','Western Cape','Cape Town','Table Mountain','8001'),(105,'Mexico','Cancun','Cancun','Zona Hotelera','77500');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `media` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'profilepic',NULL),(2,'profilepic',NULL),(3,'profilepic',NULL),(4,'profilepic',NULL),(5,'profilepic',NULL),(6,'profilepic',NULL),(7,'profilepic',NULL),(8,'profilepic',NULL),(9,'profilepic',NULL),(10,'profilepic',NULL),(11,'profilepic',NULL),(12,'profilepic',NULL),(13,'profilepic',NULL),(14,'profilepic',NULL),(15,'profilepic',NULL),(16,'profilepic',NULL),(17,'profilepic',NULL),(18,'profilepic',NULL),(19,'profilepic',NULL),(20,'profilepic',NULL),(21,'place',NULL),(22,'place',NULL),(23,'place',NULL),(24,'place',NULL),(25,'place',NULL),(26,'place',NULL),(27,'place',NULL),(28,'place',NULL),(29,'place',NULL),(30,'place',NULL),(31,'place',NULL),(32,'place',NULL),(33,'place',NULL),(34,'place',NULL),(35,'place',NULL),(36,'place',NULL),(37,'place',NULL),(38,'place',NULL),(39,'place',NULL),(40,'place',NULL),(41,'profilepic',NULL),(42,'profilepic',NULL),(43,'profilepic',NULL),(44,'profilepic',NULL),(45,'profilepic',NULL),(46,'profilepic',NULL),(47,'profilepic',NULL),(48,'profilepic',NULL),(49,'profilepic',NULL),(50,'profilepic',NULL),(51,'profilepic',NULL),(52,'profilepic',NULL),(53,'profilepic',NULL),(54,'profilepic',NULL),(55,'profilepic',NULL),(56,'profilepic',NULL),(57,'profilepic',NULL),(58,'profilepic',NULL),(59,'profilepic',NULL),(60,'profilepic',NULL),(61,'profilepic',NULL),(62,'profilepic',NULL),(63,'profilepic',NULL),(64,'profilepic',NULL),(65,'profilepic',NULL),(66,'profilepic',NULL),(67,'profilepic',NULL),(68,'profilepic',NULL),(69,'profilepic',NULL),(70,'profilepic',NULL),(71,'profilepic',NULL),(72,'profilepic',NULL),(73,'profilepic',NULL),(74,'profilepic',NULL),(75,'profilepic',NULL),(76,'profilepic',NULL),(77,'profilepic',NULL),(78,'profilepic',NULL),(79,'profilepic',NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,20,'Your reservation is confirmed...','2024-01-01 20:30:00'),(2,37,'New reservation request received...','2023-04-10 12:45:00'),(3,53,'Important system update...','2023-12-31 14:20:00'),(4,48,'Annual employee performance review scheduled.','2024-01-14 10:00:00'),(5,19,'Your payment is successful...','2024-01-02 15:30:00'),(6,4,'New complaint submitted...','2024-01-07 09:15:00'),(7,67,'You achieved Superhost status!','2024-01-08 11:45:00'),(8,22,'Your listing has been featured...','2024-01-03 13:10:00'),(9,58,'Employee training session scheduled...','2024-01-04 16:00:00'),(10,15,'New complaint resolved...','2024-01-05 10:30:00'),(11,33,'System maintenance on Sunday...','2024-01-01 07:00:00'),(12,59,'Airbnb Community Meetup in your city...','2024-01-02 18:20:00'),(13,31,'Check out the latest features...','2024-01-05 09:45:00'),(14,49,'Submit your quarterly performance report...','2024-01-15 14:00:00'),(15,15,'Your reservation has been canceled..','2024-01-02 16:50:00'),(16,39,'New review received for your listing..','2024-01-02 12:15:00'),(17,17,'Double income on weekend reservations..','2024-01-03 11:00:00'),(18,18,'Changes in the cancellation policy..','2024-01-01 10:30:00'),(19,40,'Your password has been updated.','2024-01-12 13:45:00'),(20,21,'New language preferences saved.','2024-01-18 15:20:00');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `payment_status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'2024-01-14 00:00:00',10,450,'USD','Credit Card','Paid'),(2,'2024-01-09 00:00:00',15,810,'EUR','PayPal','Paid'),(3,'2024-01-16 00:00:00',12,340,'EUR','Credit Card','Paid'),(4,'2024-01-11 00:00:00',18,728,'USD','PayPal','Paid'),(5,'2024-01-02 00:00:00',8,896,'USD','Credit Card','Paid'),(6,'2024-01-16 00:00:00',0,300,'GBP','Credit Card','Paid'),(7,'2024-01-11 00:00:00',20,520,'EUR','PayPal','Paid'),(8,'2024-01-02 00:00:00',15,940,'USD','Credit Card','Paid'),(9,'2024-01-16 00:00:00',12,176,'GBP','Credit Card','Paid'),(10,'2024-01-11 00:00:00',0,210,'USD','PayPal','Paid'),(11,'2024-01-02 00:00:00',0,360,'USD','Credit Card','Paid'),(12,'2024-01-16 00:00:00',5,575,'EUR','Credit Card','Paid'),(13,'2024-01-11 00:00:00',13,735,'EUR','PayPal','Paid'),(14,'2024-01-02 00:00:00',0,200,'USD','Credit Card','Paid'),(15,'2024-01-16 00:00:00',25,1050,'USD','Credit Card','Paid'),(16,'2024-01-11 00:00:00',5,525,'USD','PayPal','Paid'),(17,'2024-01-02 00:00:00',8,792,'USD','Credit Card','Paid'),(18,'2024-01-16 00:00:00',10,640,'USD','Credit Card','Paid'),(19,'2024-01-11 00:00:00',20,2250,'USD','PayPal','Paid'),(20,'2024-01-02 00:00:00',11,621,'USD','Credit Card','Paid'),(21,'2024-01-11 00:00:00',0,350,'USD','PayPal','Paid'),(22,'2024-01-02 00:00:00',8,852,'EUR','Credit Card','Paid'),(23,'2024-01-16 00:00:00',15,3780,'EUR','Credit Card','Paid'),(24,'2024-01-11 00:00:00',20,2100,'USD','PayPal','Paid'),(25,'2024-01-02 00:00:00',0,150,'USD','Credit Card','Paid'),(26,'2024-01-09 00:11:10',18,1064,'USD','PayPal','Paid'),(27,'2024-01-10 22:40:25',8,410,'USD','Credit Card','Paid'),(28,'2024-01-10 15:29:29',10,520,'USD','Credit Card','Paid'),(29,'2024-01-11 12:00:57',20,2700,'USD','PayPal','Paid'),(30,'2024-01-12 23:19:22',15,5625,'USD','Credit Card','Paid'),(31,'2024-04-01 16:00:00',12.5,537.5,'USD',NULL,'Waiting'),(32,'2024-04-10 14:00:00',8,1572,'USD',NULL,'Waiting'),(33,'2024-05-01 12:00:00',15,2925,'USD',NULL,'Waiting'),(34,'2024-05-15 18:00:00',20,1980,'USD',NULL,'Waiting'),(35,'2024-06-01 14:00:00',10.5,11542.5,'USD',NULL,'Waiting'),(36,'2024-06-10 16:00:00',18.75,7426.75,'USD',NULL,'Waiting'),(37,'2024-07-01 10:00:00',7,2401,'USD',NULL,'Waiting'),(38,'2024-07-15 15:00:00',11.25,1518.25,'USD',NULL,'Waiting'),(39,'2024-08-01 13:00:00',14.5,427.5,'USD',NULL,'Waiting'),(40,'2024-08-10 17:00:00',9.5,11905,'USD',NULL,'Waiting');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `id` int NOT NULL,
  `place_location_id` int DEFAULT NULL,
  `number_of_room` int DEFAULT NULL,
  `max_guest_capacity` varchar(50) DEFAULT NULL,
  `price_per_night` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `place_location_id` (`place_location_id`),
  CONSTRAINT `place_ibfk_1` FOREIGN KEY (`place_location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,1,2,'4',100),(2,2,3,'6',150),(3,3,1,'2',80),(4,4,4,'8',200),(5,5,2,'3',120),(6,6,1,'2',60),(7,7,3,'5',150),(8,8,5,'10',250),(9,9,2,'4',100),(10,10,1,'2',70),(11,11,4,'6',180),(12,12,2,'3',120),(13,13,3,'6',160),(14,14,1,'2',50),(15,15,4,'8',200),(16,16,2,'4',110),(17,17,3,'6',140),(18,18,1,'2',90),(19,19,4,'7',170),(20,20,2,'3',80),(21,91,2,'4',120),(22,92,1,'2',270),(23,93,3,'6',600),(24,94,2,'3',350),(25,95,4,'8',780),(26,96,1,'2',590),(27,97,3,'6',350),(28,98,2,'4',180),(29,99,1,'2',100),(30,100,5,'10',1200);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL,
  `listing_id` int DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `rez_payment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `rez_payment_id` (`rez_payment_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`rez_payment_id`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,'2024-02-15 14:00:00','2024-02-20 11:00:00',1),(2,2,'2024-03-09 15:00:00','2024-03-15 12:00:00',2),(3,3,'2024-04-15 14:00:00','2024-04-20 11:00:00',3),(4,4,'2024-04-29 15:00:00','2024-05-03 12:00:00',4),(5,5,'2024-06-20 12:00:00','2024-06-28 10:00:00',5),(6,6,'2024-06-25 14:00:00','2024-06-30 11:00:00',6),(7,7,'2024-08-10 15:00:00','2024-08-14 12:00:00',7),(8,8,'2024-09-01 12:00:00','2024-09-05 10:00:00',8),(9,9,'2024-10-15 14:00:00','2024-10-17 11:00:00',9),(10,10,'2024-12-10 15:00:00','2024-12-13 12:00:00',10),(11,11,'2024-12-30 12:00:00','2025-01-01 10:00:00',11),(12,12,'2024-01-15 14:00:00','2024-01-20 11:00:00',12),(13,13,'2024-02-10 15:00:00','2024-02-15 12:00:00',13),(14,14,'2024-03-01 12:00:00','2024-03-05 10:00:00',14),(15,15,'2024-04-15 14:00:00','2024-04-21 11:00:00',15),(16,16,'2024-05-10 15:00:00','2024-05-15 12:00:00',16),(17,17,'2024-06-01 12:00:00','2024-06-07 10:00:00',17),(18,18,'2024-07-15 14:00:00','2024-07-23 11:00:00',18),(19,19,'2024-08-10 15:00:00','2024-08-25 12:00:00',19),(20,20,'2024-09-01 12:00:00','2024-09-10 10:00:00',20),(21,10,'2024-10-10 15:00:00','2024-10-15 12:00:00',21),(22,2,'2024-04-01 12:00:00','2024-04-07 10:00:00',22),(23,12,'2024-06-15 14:00:00','2024-07-21 11:00:00',23),(24,13,'2024-07-10 15:00:00','2024-07-25 12:00:00',24),(25,14,'2024-07-01 12:00:00','2024-07-04 10:00:00',25),(26,19,'2024-08-15 14:00:00','2024-08-22 11:00:00',26),(27,18,'2024-08-10 15:00:00','2024-08-15 12:00:00',27),(28,17,'2024-08-01 12:00:00','2024-08-05 10:00:00',28),(29,15,'2024-08-15 14:00:00','2024-08-30 11:00:00',29),(30,17,'2024-06-15 14:00:00','2024-07-30 11:00:00',30),(31,21,'2024-04-01 16:00:00','2024-04-05 12:00:00',31),(32,22,'2024-04-10 14:00:00','2024-04-15 10:00:00',32),(33,23,'2024-05-01 12:00:00','2024-05-05 10:00:00',33),(34,24,'2024-05-15 18:00:00','2024-05-20 15:00:00',34),(35,25,'2024-06-01 14:00:00','2024-06-15 11:00:00',35),(36,26,'2024-06-10 16:00:00','2024-06-22 12:00:00',36),(37,27,'2024-07-01 10:00:00','2024-07-07 08:00:00',37),(38,28,'2024-07-15 15:00:00','2024-07-23 11:00:00',38),(39,29,'2024-08-01 13:00:00','2024-08-05 09:00:00',39),(40,30,'2024-08-10 17:00:00','2024-08-19 14:00:00',40);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL,
  `reviewed_reservation_id` int DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviewed_reservation_id` (`reviewed_reservation_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`reviewed_reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,'4.5','Great experience! The place was clean and cozy.'),(2,3,'3.8','Good location, but the room could use some improvements.'),(3,5,'5.0','Absolutely fantastic! The host was very welcoming.'),(4,7,'4.2','Enjoyed the stay, but the Wi-Fi was a bit slow.'),(5,9,'4.7','Lovely place with a beautiful view. Highly recommended.'),(6,11,'3.5','Decent stay, but the furniture needs an upgrade.'),(7,13,'4.8','Superhost indeed! Everything exceeded expectations.'),(8,15,'4.0','Nice place, but the check-in process was a bit confusing.'),(9,17,'4.6','Very comfortable stay. Will definitely come back.'),(10,19,'3.9','Had a good time, but the noise from neighbors was disruptive.'),(11,21,'4.5','Accurate listing description. Clean and well-maintained.'),(12,23,'3.7','Heating was inadequate during the winter stay.'),(13,25,'4.9','Outstanding! No complaints at all.'),(14,27,'4.3','Prompt and helpful host. Enjoyed the stay.'),(15,29,'4.5','Everything was as expected. No surprises.'),(16,2,'3.8','Average stay. Some amenities were lacking.'),(17,4,'4.6','Great communication with the host. Smooth check-in.'),(18,6,'4.1','Good value for money. Comfortable accommodation.'),(19,8,'4.7','Host was very accommodating. Thoroughly enjoyed the stay.'),(20,10,'4.4','Unique experience. Authentic atmosphere. Absolutely love it!!');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Guest','Browses and reserves listings'),(2,'Host','Offers accommodations'),(3,'Manager','Manages and oversees the operations '),(4,'Admin','Superusers with overall system control'),(5,'Software Engineer','Designs and creates computer systems '),(6,'Mobile Developer','Designs, builds, and maintains mobile apps'),(7,'Data Engineer','Prepare data for analytical or operational uses'),(8,'Data Scientist','Analytical data expert who solves complex problems'),(9,'Data Analyst','Gathers and interprets data in order to solve a specific problem'),(10,'Product Manager','Develops products'),(11,'Designer','Works on the visuals'),(12,'Financial Analyst','Inform investment strategy and makes decisions'),(13,'Recruiting Coordinator','Manages the end-to-end hiring process'),(14,'Technical Recruiter','Manages end-to-end hiring process for technical roles'),(15,'Program Manager',' Manages a program with multiple, related projects'),(16,'Security Engineer','Builds the systems used to protect computer systems&networks'),(17,'System Engineer','Coordinate different teams, testing, and evaluations of system development'),(18,'Community Organizer','Networks with and mobilizes the community'),(19,'Global Benefits Analyst','Supports multinational clients '),(20,'Security Analyst','Monitors the network to detect&respond to security breaches');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `profile_img_id` int DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_img_id` (`profile_img_id`),
  KEY `location_id` (`location_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`profile_img_id`) REFERENCES `media` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','Doe','john.doe@email.com','password123',1,'123-456-7890',60,1),(2,'Jane','Smith','jane.smith@email.com','pass456',2,'987-654-3210',61,1),(3,'Michael','Williams','michael.w@email.com','pass789',3,'111-222-3333',62,1),(4,'Emily','Jones','emily.j@email.com','password456',4,'444-555-6666',63,1),(5,'Christopher','Miller','chris.m@email.com','chrisPass',5,'777-888-9999',64,1),(6,'Olivia','Brown','olivia.b@email.com','oliviaPass',6,'222-333-4444',65,1),(7,'Daniel','Davis','daniel.d@email.com','daniel123',7,'555-666-7777',66,1),(8,'Sophia','Johnson','sophia.j@email.com','sophiaPass',NULL,'888-999-0000',67,1),(9,'William','Anderson','william.a@email.com','williamPass',8,'111-222-3333',68,1),(10,'Emma','White','emma.w@email.com','emma456',9,'444-555-6666',69,1),(11,'Matthew','Hall','matthew.h@email.com','matthewPass',10,'777-888-9999',70,1),(12,'Ava','Wilson','ava.w@email.com','avaPass',11,'222-333-4444',71,1),(13,'Ethan','Moore','ethan.m@email.com','ethan123',12,'555-666-7777',72,1),(14,'Olivia','Clark','olivia.c@email.com','oliviaPass',13,'888-999-0000',73,1),(15,'Liam','Baker','liam.b@email.com','liamPass',14,'111-222-3333',74,1),(16,'Mia','Carter','mia.c@email.com','mia456',15,'444-555-6666',75,1),(17,'Jackson','Walker','jackson.w@email.com','jacksonPass',16,'777-888-9999',76,1),(18,'Sophia','Harris','sophia.h@email.com','sophiaPass',17,'222-333-4444',77,1),(19,'Aiden','Young','aiden.y@email.com','aiden123',18,'555-666-7777',78,1),(20,'Chloe','Evans','chloe.e@email.com','chloePass',19,'888-999-0000',79,1),(21,'Alex','Johnson','alex.j@email.com','alexPass',NULL,'555-987-6543',21,2),(22,'Emily','Williams','emily.w@email.com','emilyPass',20,'123-555-7890',22,2),(23,'Daniel','Brown','daniel.b@email.com','danielPass',41,'789-123-4567',23,2),(24,'Olivia','Davis','olivia.d@email.com','oliviaPass',NULL,'456-789-0123',24,2),(25,'Ethan','Miller','ethan.m@email.com','ethanPass',42,'987-012-3456',25,2),(26,'Sophia','Wilson','sophia.w@email.com','sophiaPass',43,'654-321-0987',26,2),(27,'Jackson','Taylor','jackson.t@email.com','jacksonPass',44,'321-789-4560',27,2),(28,'Ava','Moore','ava.m@email.com','avaPass',45,'012-345-6789',28,2),(29,'Logan','Lee','logan.l@email.com','loganPass',46,'789-456-1230',29,2),(30,'Mia','Garcia','mia.g@email.com','miaPass',47,'987-654-0123',30,2),(31,'Liam','Anderson','liam.a@email.com','liamPass',48,'456-789-1230',31,2),(32,'Emma','Martinez','emma.m@email.com','emmaPass',NULL,'654-012-7890',32,2),(33,'Carter','Hernandez','carter.h@email.com','carterPass',NULL,'789-123-4560',33,2),(34,'Isabella','Smith','isabella.s@email.com','isabellaPass',NULL,'012-345-6789',34,2),(35,'Landon','Johnson','landon.j@email.com','landonPass',49,'321-789-4560',35,2),(36,'Aria','Brown','aria.b@email.com','ariaPass',50,'456-789-1230',36,2),(37,'Elijah','Jones','elijah.j@email.com','elijahPass',51,'987-654-0123',37,2),(38,'Grace','Gonzalez','grace.g@email.com','gracePass',52,'654-012-7890',38,2),(39,'Caleb','Clark','caleb.c@email.com','calebPass',NULL,'789-123-4560',39,2),(40,'Zoe','Turner','zoe.t@email.com','zoePass',53,'012-345-6789',40,2),(41,'Eva','Smith','eva.s@email.com','evaPass',54,'987-654-0123',41,4),(42,'Noah','Rodriguez','noah.r@email.com','noahPass',55,'321-789-4560',42,3),(43,'Aiden','Davis','aiden.d@email.com','aidenPass',56,'789-123-4560',43,3),(44,'Avery','Lopez','avery.l@email.com','averyPass',57,'012-345-6789',44,3),(45,'Mason','Wang','mason.w@email.com','masonPass',58,'456-789-1230',45,5),(46,'Harper','Martinez','harper.m@email.com','harperPass',59,'654-012-7890',46,6),(47,'Ethan','Jones','ethan.j@email.com','ethanPass',60,'789-123-4560',105,7),(48,'Liam','Gonzalez','liam.g@email.com','liamPass',61,'012-345-6789',47,8),(49,'Ella','Hernandez','ella.h@email.com','ellaPass',62,'321-789-4560',48,9),(50,'Jackson','Perez','jackson.p@email.com','jacksonPass',63,'987-654-0123',49,10),(51,'Scarlett','Brown','scarlett.b@email.com','scarlettPass',64,'654-012-7890',50,11),(52,'Aiden','Garcia','aiden.g@email.com','aidenPass',65,'789-123-4560',51,12),(53,'Mia','Clark','mia.c@email.com','miaPass',66,'012-345-6789',52,13),(54,'Lucas','Anderson','lucas.a@email.com','lucasPass',67,'321-789-4560',53,14),(55,'Aria','Turner','aria.t@email.com','ariaPass',68,'987-654-0123',54,15),(56,'Logan','Smith','logan.s@email.com','loganPass',69,'654-012-7890',55,16),(57,'Grace','Johnson','grace.j@email.com','gracePass',NULL,'789-123-4560',56,17),(58,'Caleb','Wang','caleb.w@email.com','calebPass',70,'012-345-6789',57,18),(59,'Lily','Lopez','lily.l@email.com','lilyPass',71,'321-789-4560',58,19),(60,'Oliver','Davis','oliver.d@email.com','oliverPass',72,'987-654-0123',59,20),(61,'Aria','Brown','aria.b@email.com','ariaPass',50,'456-789-1230',80,1),(62,'Elijah','Jones','elijah.j@email.com','elijahPass',51,'987-654-0123',37,1),(63,'Grace','Gonzalez','grace.g@email.com','gracePass',52,'654-012-7890',38,1),(64,'Caleb','Clark','caleb.c@email.com','calebPass',NULL,'789-123-4560',39,1),(65,'Zoe','Turner','zoe.t@email.com','zoePass',53,'012-345-6789',40,1),(66,'Mia','Carter','mia.c@email.com','mia456',15,'444-555-6666',86,2),(67,'Jackson','Walker','jackson.w@email.com','jacksonPass',16,'777-888-9999',87,2),(68,'Sophia','Harris','sophia.h@email.com','sophiaPass',17,'222-333-4444',88,2),(69,'Aiden','Young','aiden.y@email.com','aiden123',18,'555-666-7777',89,2),(70,'Chloe','Evans','chloe.e@email.com','chloePass',NULL,'888-999-0000',90,2),(71,'Alex','Johnson','alex.j@email.com','alexPass',73,'555-111-2222',21,1),(72,'Emma','Clark','emma.c@email.com','emmaPass',74,'555-333-4444',81,1),(73,'Daniel','Brown','daniel.b@email.com','danielPass',75,'555-555-6666',82,1),(74,'Olivia','Martinez','olivia.m@email.com','oliviaPass',76,'555-777-8888',83,1),(75,'William','Anderson','william.a@email.com','williamPass',77,'555-999-0000',84,1),(76,'Sophia','Garcia','sophia.g@email.com','sophiaPass',78,'555-121-2323',85,1),(77,'James','Rodriguez','james.r@email.com','jamesPass',79,'555-343-4545',101,1),(78,'Ava','Smith','ava.s@email.com','avaPass',NULL,'555-565-6767',102,1),(79,'Logan','Wang','logan.w@email.com','loganPass',NULL,'555-787-8989',103,1),(80,'Isabella','Kim','isabella.k@email.com','isabellaPass',NULL,'555-909-0101',104,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 17:09:18
