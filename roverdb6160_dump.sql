CREATE DATABASE IF NOT EXISTS roverdb6160;
use roverdb6160;

-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: db-master.c2rtzjxij2h6.us-east-2.rds.amazonaws.com    Database: roverdb6160
-- ------------------------------------------------------
-- Server version	5.6.39-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `ClientList`
--

DROP TABLE IF EXISTS `ClientList`;
/*!50001 DROP VIEW IF EXISTS `ClientList`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ClientList` AS SELECT 
 1 AS `Client ID`,
 1 AS `Client's Name`,
 1 AS `Number of Pets`,
 1 AS `Joined on`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ClientsWithDiscounts`
--

DROP TABLE IF EXISTS `ClientsWithDiscounts`;
/*!50001 DROP VIEW IF EXISTS `ClientsWithDiscounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ClientsWithDiscounts` AS SELECT 
 1 AS `Client ID`,
 1 AS `Client's Name`,
 1 AS `Discount Type`,
 1 AS `Discount Amount (%)`,
 1 AS `# of Pets`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `NeedToBeCertified`
--

DROP TABLE IF EXISTS `NeedToBeCertified`;
/*!50001 DROP VIEW IF EXISTS `NeedToBeCertified`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `NeedToBeCertified` AS SELECT 
 1 AS `Tech ID`,
 1 AS `Tech's Name`,
 1 AS `Hired On`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `PetsWithSpecialNeeds`
--

DROP TABLE IF EXISTS `PetsWithSpecialNeeds`;
/*!50001 DROP VIEW IF EXISTS `PetsWithSpecialNeeds`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `PetsWithSpecialNeeds` AS SELECT 
 1 AS `Pet ID`,
 1 AS `Pet's Name`,
 1 AS `Pet Type`,
 1 AS `Gender`,
 1 AS `Pet Notes`,
 1 AS `Owner`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `TechAvailability`
--

DROP TABLE IF EXISTS `TechAvailability`;
/*!50001 DROP VIEW IF EXISTS `TechAvailability`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TechAvailability` AS SELECT 
 1 AS `Tech ID`,
 1 AS `Tech's Name`,
 1 AS `Monday`,
 1 AS `Tuesday`,
 1 AS `Wednesday`,
 1 AS `Thursday`,
 1 AS `Friday`,
 1 AS `Saturday`,
 1 AS `Sunday`,
 1 AS `Preference`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `TechOrderHistory`
--

DROP TABLE IF EXISTS `TechOrderHistory`;
/*!50001 DROP VIEW IF EXISTS `TechOrderHistory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TechOrderHistory` AS SELECT 
 1 AS `Tech ID`,
 1 AS `Tech's Name`,
 1 AS `Phone`,
 1 AS `Duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `TechTasksByOrder`
--

DROP TABLE IF EXISTS `TechTasksByOrder`;
/*!50001 DROP VIEW IF EXISTS `TechTasksByOrder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `TechTasksByOrder` AS SELECT 
 1 AS `Order ID`,
 1 AS `Tech's Name`,
 1 AS `Client's Name`,
 1 AS `Client's Address`,
 1 AS `Pet's Name`,
 1 AS `Duty`,
 1 AS `Start Order`,
 1 AS `End Order`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `PersonID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL AUTO_INCREMENT,
  `NumberOfPets` int(11) DEFAULT NULL,
  `DateJoined` date NOT NULL,
  `DiscountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `ClientID_UNIQUE` (`ClientID`),
  KEY `fk_Client_Discounts1_idx` (`DiscountID`),
  CONSTRAINT `fk_Client_Discounts1` FOREIGN KEY (`DiscountID`) REFERENCES `discounts` (`DiscountID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Person` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`PersonID`, `ClientID`, `NumberOfPets`, `DateJoined`, `DiscountID`) VALUES (1,1,2,'2018-02-12',1),(2,2,3,'2018-03-19',11),(4,3,3,'2018-04-18',12),(5,4,1,'2018-05-24',2),(6,5,1,'2018-05-05',3),(7,6,NULL,'2018-04-21',13),(8,7,1,'2018-03-15',4),(9,8,1,'2018-04-29',14),(13,9,1,'2018-05-02',NULL),(14,10,1,'2018-03-12',5),(15,11,1,'2018-04-12',NULL),(16,12,1,'2018-03-06',6),(18,13,1,'2018-03-22',NULL),(19,14,1,'2018-02-15',NULL),(20,15,3,'2018-03-06',NULL),(22,16,1,'2018-05-05',7),(23,17,1,'2018-04-18',NULL),(24,18,1,'2018-05-20',NULL),(25,19,1,'2018-04-25',8),(26,20,1,'2018-02-08',NULL),(27,21,1,'2018-01-24',NULL),(28,22,1,'2018-02-07',9),(29,23,1,'2018-03-30',10),(30,24,1,'2018-01-23',NULL),(31,25,1,'2018-01-04',NULL),(32,26,1,'2018-03-10',NULL),(33,27,3,'2018-03-23',NULL),(36,28,1,'2018-01-14',NULL),(38,29,1,'2018-02-10',NULL),(39,30,1,'2018-05-05',NULL),(40,31,1,'2018-04-26',NULL),(41,32,1,'2018-01-31',NULL),(42,33,1,'2018-02-19',NULL),(43,34,1,'2018-01-04',NULL),(44,35,1,'2018-05-14',NULL),(45,36,1,'2018-04-01',NULL),(46,37,1,'2018-04-30',NULL),(47,38,1,'2018-02-13',NULL),(48,39,1,'2018-03-18',NULL),(49,40,1,'2018-02-15',NULL),(50,41,1,'2018-04-26',NULL),(51,42,1,'2018-04-15',NULL),(52,43,1,'2018-02-08',NULL),(58,44,1,'2018-03-08',NULL),(59,45,1,'2018-04-07',NULL),(60,46,1,'2018-01-23',NULL),(61,47,1,'2018-01-26',NULL),(63,48,1,'2018-03-03',NULL),(64,49,1,'2018-03-26',NULL),(65,50,1,'2018-01-10',NULL),(66,51,1,'2018-03-16',NULL),(67,52,1,'2018-02-26',NULL),(68,53,1,'2018-03-01',NULL),(69,54,1,'2018-02-15',NULL),(70,55,1,'2018-04-17',NULL),(71,56,1,'2018-03-01',NULL),(72,57,1,'2018-04-08',NULL),(73,58,1,'2018-03-14',NULL),(74,59,1,'2018-04-02',NULL),(75,60,1,'2018-01-31',NULL),(79,61,1,'2018-03-08',NULL),(81,62,1,'2018-02-04',NULL),(84,63,1,'2018-01-19',NULL),(85,64,1,'2018-05-20',NULL),(86,65,1,'2018-05-17',NULL),(87,66,1,'2018-01-21',NULL),(88,67,1,'2018-04-17',NULL),(89,68,1,'2018-03-29',NULL),(91,69,1,'2018-04-19',NULL),(92,70,1,'2018-04-27',NULL),(93,71,1,'2018-02-07',NULL),(94,72,1,'2018-02-02',NULL),(95,73,1,'2018-03-06',NULL),(96,74,1,'2018-03-01',NULL),(97,75,1,'2018-01-10',NULL),(98,76,1,'2018-05-22',NULL),(100,77,1,'2018-03-26',NULL),(101,78,1,'2018-04-08',NULL),(102,79,1,'2018-04-21',NULL),(103,80,1,'2018-01-04',NULL),(104,81,1,'2018-02-23',NULL),(105,82,1,'2018-05-20',NULL),(107,83,1,'2018-02-12',NULL),(108,84,1,'2018-04-02',NULL),(112,85,3,'2018-03-30',NULL),(117,86,3,'2018-05-17',NULL),(118,87,3,'2018-04-19',NULL),(122,88,3,'2018-04-29',NULL),(123,89,3,'2018-03-09',NULL),(124,90,3,'2018-02-18',NULL),(131,91,3,'2018-04-12',NULL),(132,92,3,'2018-04-23',NULL),(137,93,3,'2018-02-05',NULL),(138,94,3,'2018-05-06',NULL),(139,95,3,'2018-04-22',NULL),(140,96,1,'2018-04-29',NULL),(141,97,1,'2018-02-28',NULL),(142,98,1,'2018-01-28',NULL),(143,99,1,'2018-01-26',NULL),(145,100,1,'2018-05-28',NULL),(147,101,1,'2018-04-30',NULL),(148,102,1,'2018-01-21',NULL),(151,103,1,'2018-02-10',NULL),(152,104,1,'2018-03-10',NULL),(153,105,1,'2018-05-05',NULL),(155,106,1,'2018-03-15',NULL),(156,107,1,'2018-03-14',NULL),(160,108,1,'2018-04-23',NULL),(161,109,1,'2018-02-12',NULL),(163,110,1,'2018-05-08',NULL),(165,111,1,'2018-03-29',NULL),(166,112,1,'2018-02-14',NULL),(167,113,1,'2018-02-06',NULL),(169,114,1,'2018-04-17',NULL),(170,115,1,'2018-03-01',NULL),(171,116,1,'2018-02-03',NULL),(177,117,1,'2018-04-01',NULL),(179,118,1,'2018-02-01',NULL),(181,119,NULL,'2018-02-10',NULL),(182,120,NULL,'2018-05-10',NULL),(184,121,1,'2018-04-20',NULL),(185,122,1,'2018-01-19',NULL),(187,123,NULL,'2018-02-17',NULL),(190,124,NULL,'2018-02-23',NULL),(193,125,NULL,'2018-05-28',NULL),(195,126,NULL,'2018-05-23',NULL),(196,127,NULL,'2018-03-06',NULL),(200,128,NULL,'2018-04-22',15);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `discounts` (
  `DiscountID` int(11) NOT NULL,
  `DiscountType` varchar(45) NOT NULL,
  `DiscountAmount` int(11) NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` (`DiscountID`, `DiscountType`, `DiscountAmount`) VALUES (1,'STUDENT',10),(2,'STUDENT',10),(3,'STUDENT',10),(4,'STUDENT',10),(5,'STUDENT',10),(6,'STUDENT',10),(7,'STUDENT',10),(8,'STUDENT',10),(9,'STUDENT',10),(10,'STUDENT',10),(11,'TEACHER',15),(12,'TEACHER',15),(13,'TEACHER',15),(14,'TEACHER',15),(15,'TEACHER',15);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `PetID` int(11) NOT NULL,
  `TechID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Pet1` (`PetID`),
  KEY `fk_Orders_Tech1` (`TechID`),
  CONSTRAINT `fk_Orders_Pet1` FOREIGN KEY (`PetID`) REFERENCES `pet` (`PetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`OrderID`, `PetID`, `TechID`, `StartDate`, `EndDate`) VALUES (1,1,6,'2018-02-18','2018-03-15'),(2,5,1,'2018-02-14','2018-02-15'),(3,7,2,'2018-03-10','2018-03-11'),(4,17,6,'2018-04-18','2018-05-15'),(5,114,13,'2018-05-12','2018-05-14'),(6,122,8,'2018-03-20','2018-03-20'),(7,1,13,'2018-06-04','2018-06-27'),(8,8,7,'2018-06-12','2018-06-30'),(9,10,1,'2018-06-17','2018-06-30'),(10,1,1,'2018-06-22','2018-06-30'),(11,7,12,'2018-06-21','2018-06-22'),(12,25,1,'2018-06-06','2018-06-12');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderservices`
--

DROP TABLE IF EXISTS `orderservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderservices` (
  `OrderServiceID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  PRIMARY KEY (`OrderServiceID`),
  KEY `fk_OrderServices_Orders1` (`OrderID`),
  KEY `fk_OrderServices_Services1` (`ServiceID`),
  CONSTRAINT `fk_OrderServices_Orders1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderServices_Services1` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderservices`
--

LOCK TABLES `orderservices` WRITE;
/*!40000 ALTER TABLE `orderservices` DISABLE KEYS */;
INSERT INTO `orderservices` (`OrderServiceID`, `OrderID`, `ServiceID`) VALUES (1,1,1),(2,1,8),(3,2,2),(4,2,4),(5,3,5),(6,4,1),(7,4,8),(8,5,5),(9,6,2),(10,6,3),(11,6,4),(12,7,2),(13,7,4),(14,8,5),(15,8,6),(16,9,2),(17,9,3),(18,9,4),(19,9,5),(20,10,4),(21,11,4),(22,12,3),(23,12,5),(24,12,6);
/*!40000 ALTER TABLE `orderservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `PersonID` int(11) NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `PreferredContact` varchar(5) NOT NULL,
  `StreetName` varchar(50) NOT NULL,
  `Apartment` varchar(10) DEFAULT NULL,
  `Zipcode` int(11) NOT NULL,
  `City` varchar(45) NOT NULL,
  `County` varchar(45) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL DEFAULT 'PASSWORD',
  `IsTech` tinyint(1) NOT NULL DEFAULT '0',
  `IsClient` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`PersonID`, `FName`, `LName`, `PreferredContact`, `StreetName`, `Apartment`, `Zipcode`, `City`, `County`, `State`, `Phone`, `Email`, `Password`, `IsTech`, `IsClient`) VALUES (1,'James','Smith','EMAIL','6649 N Blue Gum St','',28223,'Charlotte','Mecklenburg','NC','5046218927','jsmith@gmail.com','PASSWORD',0,0),(2,'Josephine','Darakjy','EMAIL','4 B Blue Ridge Blvd','',28223,'Charlotte','Mecklenburg','NC','8102929388','josephine_darakjy@darakjy.org','PASSWORD',0,0),(3,'Art','Venere','EMAIL','8 W Cerritos Ave ','54',8014,'Bridgeport','Gloucester','NJ','8566368749','art@venere.org','PASSWORD',0,0),(4,'Lenna','Paprocki','EMAIL','639 Main St','',28223,'Charlotte','Mecklenburg','NC','9073854412','lpaprocki@hotmail.com','PASSWORD',0,0),(5,'Donette','Foller','EMAIL','34 Center St','',28223,'Charlotte','Mecklenburg','NC','5135701893','donette.foller@cox.net','PASSWORD',0,0),(6,'Simona','Morasca','EMAIL','3 Mcauley Dr','',28223,'Charlotte','Mecklenburg','NC','4195032484','simona@morasca.com','PASSWORD',0,0),(7,'Mitsue','Tollner','EMAIL','7 Eads St','',28223,'Charlotte','Mecklenburg','NC','7735736914','mitsue_tollner@yahoo.com','PASSWORD',0,0),(8,'Leota','Dilliard','PHONE','7 W Jackson Blvd','',28223,'Charlotte','Mecklenburg','NC','4087523500','leota@hotmail.com','PASSWORD',0,0),(9,'Sage','Wieser','EMAIL','5 Boston Ave ','88',28223,'Charlotte','Mecklenburg','NC','6054142147','sage_wieser@cox.net','PASSWORD',0,0),(10,'Kris','Marrier','EMAIL','228 Runamuck Pl ','2808',21224,'Baltimore','Baltimore City','MD','4106558723','kris@gmail.com','PASSWORD',0,0),(11,'Minna','Amigon','EMAIL','2371 Jerrold Ave','',19443,'Kulpsville','Montgomery','PA','2158741229','minna_amigon@yahoo.com','PASSWORD',0,0),(12,'Abel','Maclead','PHONE','37275 St  Rt 17m M','',11953,'Middle Island','Suffolk','NY','6313353414','amaclead@gmail.com','PASSWORD',0,0),(13,'Kiley','Caldarera','PHONE','25 E 75th St ','69',28223,'Charlotte','Mecklenburg','NC','3104985651','kiley.caldarera@aol.com','PASSWORD',0,0),(14,'Graciela','Ruta','PHONE','98 Connecticut Ave Nw','',28223,'Charlotte','Mecklenburg','NC','4407808425','gruta@cox.net','PASSWORD',0,0),(15,'Cammy','Albares','PHONE','56 E Morehead St','',28223,'Charlotte','Mecklenburg','NC','9565376195','calbares@gmail.com','PASSWORD',0,0),(16,'Mattie','Poquette','PHONE','73 State Road 434 E','',28223,'Charlotte','Mecklenburg','NC','6022774385','mattie@aol.com','PASSWORD',0,0),(17,'Meaghan','Garufi','EMAIL','69734 E Carrillo St','',37110,'Mc Minnville','Warren','TN','9313139635','meaghan@hotmail.com','PASSWORD',0,0),(18,'Gladys','Rim','PHONE','322 New Horizon Blvd','',28223,'Charlotte','Mecklenburg','NC','4146619598','gladys.rim@rim.org','PASSWORD',0,0),(19,'Yuki','Whobrey','PHONE','1 State Route 27','',28223,'Charlotte','Mecklenburg','NC','3132887937','yuki_whobrey@aol.com','PASSWORD',0,0),(20,'Fletcher','Flosi','PHONE','394 Manchester Blvd','',28223,'Charlotte','Mecklenburg','NC','8158282147','fletcher.flosi@yahoo.com','PASSWORD',0,0),(21,'Bette','Nicka','PHONE','6 S 33rd St','',19014,'Aston','Delaware','PA','6105453615','bette_nicka@cox.net','PASSWORD',0,0),(22,'Veronika','Inouye','PHONE','6 Greenleaf Ave','',28223,'Charlotte','Mecklenburg','NC','4085401785','vinouye@aol.com','PASSWORD',0,0),(23,'Willard','Kolmetz','EMAIL','618 W Yakima Ave','',28223,'Charlotte','Mecklenburg','NC','9723039197','willard@hotmail.com','PASSWORD',0,0),(24,'Maryann','Royster','PHONE','74 S Westgate St','',12204,'Albany','Albany','NY','5189667987','mroyster@royster.com','PASSWORD',0,0),(25,'Alisha','Slusarski','EMAIL','3273 State St','',8846,'Middlesex','Middlesex','NJ','7326583154','alisha@slusarski.com','PASSWORD',0,0),(26,'Allene','Iturbide','EMAIL','1 Central Ave','',28223,'Charlotte','Mecklenburg','NC','7156626764','allene_iturbide@cox.net','PASSWORD',0,0),(27,'Chanel','Caudy','PHONE','86 Nw 66th St ','8673',28223,'Charlotte','Mecklenburg','NC','9133882079','chanel.caudy@caudy.org','PASSWORD',0,0),(28,'Ezekiel','Chui','EMAIL','2 Cedar Ave ','84',21601,'Easton','Talbot','MD','4106691642','ezekiel@chui.com','PASSWORD',0,0),(29,'Willow','Kusko','EMAIL','90991 Thorburn Ave','',10011,'New York','New York','NY','2125824976','wkusko@yahoo.com','PASSWORD',0,0),(30,'Bernardo','Figeroa','EMAIL','386 9th Ave N','',28223,'Charlotte','Mecklenburg','NC','9363363951','bfigeroa@aol.com','PASSWORD',0,0),(31,'Ammie','Corrio','PHONE','74874 Atlantic Ave','',28223,'Charlotte','Mecklenburg','NC','6148019788','ammie@corrio.com','PASSWORD',0,0),(32,'Francine','Vocelka','EMAIL','366 South Dr','',28223,'Charlotte','Mecklenburg','NC','5059773911','francine_vocelka@vocelka.com','PASSWORD',0,0),(33,'Ernie','Stenseth','EMAIL','45 E Liberty St','',7660,'Ridgefield Park','Bergen','NJ','2017096245','ernie_stenseth@aol.com','PASSWORD',0,0),(34,'Albina','Glick','EMAIL','4 Ralph Ct','',8812,'Dunellen','Middlesex','NJ','7329247882','albina@glick.com','PASSWORD',0,0),(35,'Alishia','Sergi','PHONE','2742 Distribution Way','',10025,'New York','New York','NY','2128601579','asergi@gmail.com','PASSWORD',0,0),(36,'Solange','Shinko','EMAIL','426 Wolf St','',28223,'Charlotte','Mecklenburg','NC','5049799175','solange@shinko.com','PASSWORD',0,0),(37,'Jose','Stockham','PHONE','128 Bransten Rd','',10011,'New York','New York','NY','2126758570','jose@yahoo.com','PASSWORD',0,0),(38,'Rozella','Ostrosky','PHONE','17 Morena Blvd','',28223,'Charlotte','Mecklenburg','NC','8058326163','rozella.ostrosky@ostrosky.com','PASSWORD',0,0),(39,'Valentine','Gillian','EMAIL','775 W 17th St','',28223,'Charlotte','Mecklenburg','NC','2108129597','valentine_gillian@gmail.com','PASSWORD',0,0),(40,'Kati','Rulapaugh','EMAIL','6980 Dorsett Rd','',28223,'Charlotte','Mecklenburg','NC','7854637829','kati.rulapaugh@hotmail.com','PASSWORD',0,0),(41,'Youlanda','Schemmer','PHONE','2881 Lewis Rd','',28223,'Charlotte','Mecklenburg','NC','5415488197','youlanda@aol.com','PASSWORD',0,0),(42,'Dyan','Oldroyd','EMAIL','7219 Woodfield Rd','',28223,'Charlotte','Mecklenburg','NC','9134134604','doldroyd@aol.com','PASSWORD',0,0),(43,'Roxane','Campain','PHONE','1048 Main St','',28223,'Charlotte','Mecklenburg','NC','9072314722','roxane@hotmail.com','PASSWORD',0,0),(44,'Lavera','Perin','EMAIL','678 3rd Ave','',33196,'Miami','Miami-Dade','FL','3056067291','lperin@perin.org','PASSWORD',0,0),(45,'Erick','Ferencz','EMAIL','20 S Babcock St','',28223,'Charlotte','Mecklenburg','NC','9077411044','erick.ferencz@aol.com','PASSWORD',0,0),(46,'Fatima','Saylors','EMAIL','2 Lighthouse Ave','',28223,'Charlotte','Mecklenburg','NC','9527682416','fsaylors@saylors.org','PASSWORD',0,0),(47,'Jina','Briddick','PHONE','38938 Park Blvd','',2128,'Boston','Suffolk','MA','6173995124','jina_briddick@briddick.com','PASSWORD',0,0),(48,'Kanisha','Waycott','PHONE','5 Tomahawk Dr','',28223,'Charlotte','Mecklenburg','NC','3234532780','kanisha_waycott@yahoo.com','PASSWORD',0,0),(49,'Emerson','Bowley','PHONE','762 S Main St','',28223,'Charlotte','Mecklenburg','NC','6083367444','emerson.bowley@bowley.org','PASSWORD',0,0),(50,'Blair','Malet','EMAIL','209 Decker Dr','',19132,'Philadelphia','Philadelphia','PA','2159079111','bmalet@yahoo.com','PASSWORD',0,0),(51,'Brock','Bolognia','EMAIL','4486 W O St ','1',10003,'New York','New York','NY','2124029216','bbolognia@yahoo.com','PASSWORD',0,0),(52,'Lorrie','Nestle','EMAIL','39 S 7th St','',37388,'Tullahoma','Coffee','TN','9318756644','lnestle@hotmail.com','PASSWORD',0,0),(53,'Sabra','Uyetake','EMAIL','98839 Hawthorne Blvd ','6101',29201,'Columbia','Richland','SC','8039255213','sabra@uyetake.org','PASSWORD',0,0),(54,'Marjory','Mastella','EMAIL','71 San Mateo Ave','',19087,'Wayne','Delaware','PA','6108145533','mmastella@mastella.com','PASSWORD',0,0),(55,'Karl','Klonowski','PHONE','76 Brooks St ','9',8822,'Flemington','Hunterdon','NJ','9088776135','karl_klonowski@yahoo.com','PASSWORD',0,0),(56,'Tonette','Wenner','PHONE','4545 Courthouse Rd','',11590,'Westbury','Nassau','NY','5169686051','twenner@aol.com','PASSWORD',0,0),(57,'Amber','Monarrez','PHONE','14288 Foster Ave ','4121',19046,'Jenkintown','Montgomery','PA','2159348655','amber_monarrez@monarrez.org','PASSWORD',0,0),(58,'Shenika','Seewald','PHONE','4 Otis St','',28223,'Charlotte','Mecklenburg','NC','8184234007','shenika@gmail.com','PASSWORD',0,0),(59,'Delmy','Ahle','EMAIL','65895 S 16th St','',2909,'Providence','Providence','RI','4014582547','delmy.ahle@hotmail.com','PASSWORD',0,0),(60,'Deeanna','Juhas','PHONE','14302 Pennsylvania Ave','',19006,'Huntingdon Valley','Montgomery','PA','2152119589','deeanna_juhas@gmail.com','PASSWORD',0,0),(61,'Blondell','Pugh','EMAIL','201 Hawk Ct','',2904,'Providence','Providence','RI','4019608259','bpugh@aol.com','PASSWORD',0,0),(62,'Jamal','Vanausdal','PHONE','53075 Sw 152nd Ter ','615',8831,'Monroe Township','Middlesex','NJ','7322341546','jamal@vanausdal.org','PASSWORD',0,0),(63,'Cecily','Hollack','EMAIL','59 N Groesbeck Hwy','',28223,'Charlotte','Mecklenburg','NC','5124863817','cecily@hollack.org','PASSWORD',0,0),(64,'Carmelina','Lindall','EMAIL','2664 Lewis Rd','',28223,'Charlotte','Mecklenburg','NC','3037247371','carmelina_lindall@lindall.com','PASSWORD',0,0),(65,'Maurine','Yglesias','PHONE','59 Shady Ln ','53',28223,'Charlotte','Mecklenburg','NC','4147481374','maurine_yglesias@yglesias.com','PASSWORD',0,0),(66,'Tawna','Buvens','EMAIL','3305 Nabell Ave ','679',10009,'New York','New York','NY','2126749610','tawna@gmail.com','PASSWORD',0,0),(67,'Penney','Weight','PHONE','18 Fountain St','',28223,'Charlotte','Mecklenburg','NC','9077979628','penney_weight@aol.com','PASSWORD',0,0),(68,'Elly','Morocco','EMAIL','7 W 32nd St','',16502,'Erie','Erie','PA','8143935571','elly_morocco@gmail.com','PASSWORD',0,0),(69,'Ilene','Eroman','PHONE','2853 S Central Expy','',21061,'Glen Burnie','Anne Arundel','MD','4109149018','ilene.eroman@hotmail.com','PASSWORD',0,0),(70,'Vallie','Mondella','PHONE','74 W College St','',28223,'Charlotte','Mecklenburg','NC','2088625339','vmondella@mondella.com','PASSWORD',0,0),(71,'Kallie','Blackwood','EMAIL','701 S Harrison Rd','',28223,'Charlotte','Mecklenburg','NC','4153152761','kallie.blackwood@gmail.com','PASSWORD',0,0),(72,'Johnetta','Abdallah','PHONE','1088 Pinehurst St','',27514,'Chapel Hill','Orange','NC','9192259345','johnetta_abdallah@aol.com','PASSWORD',0,0),(73,'Bobbye','Rhym','PHONE','30 W 80th St ','1995',28223,'Charlotte','Mecklenburg','NC','6505285783','brhym@rhym.com','PASSWORD',0,0),(74,'Micaela','Rhymes','PHONE','20932 Hedley St','',28223,'Charlotte','Mecklenburg','NC','9256473298','micaela_rhymes@gmail.com','PASSWORD',0,0),(75,'Tamar','Hoogland','PHONE','2737 Pistorio Rd ','9230',28223,'Charlotte','Mecklenburg','NC','7403438575','tamar@hotmail.com','PASSWORD',0,0),(76,'Moon','Parlato','PHONE','74989 Brandon St','',14895,'Wellsville','Allegany','NY','5858668313','moon@yahoo.com','PASSWORD',0,0),(77,'Laurel','Reitler','EMAIL','6 Kains Ave','',21215,'Baltimore','Baltimore City','MD','4105204832','laurel_reitler@reitler.com','PASSWORD',0,0),(78,'Delisa','Crupi','EMAIL','47565 W Grand Ave','',7105,'Newark','Essex','NJ','9733542040','delisa.crupi@crupi.com','PASSWORD',0,0),(79,'Viva','Toelkes','PHONE','4284 Dorigo Ln','',28223,'Charlotte','Mecklenburg','NC','7734465569','viva.toelkes@gmail.com','PASSWORD',0,0),(80,'Elza','Lipke','EMAIL','6794 Lake Dr E','',7104,'Newark','Essex','NJ','9739273447','elza@yahoo.com','PASSWORD',0,0),(81,'Devorah','Chickering','EMAIL','31 Douglas Blvd ','950',28223,'Charlotte','Mecklenburg','NC','5059758559','devorah@hotmail.com','PASSWORD',0,0),(82,'Timothy','Mulqueen','PHONE','44 W 4th St','',10309,'Staten Island','Richmond','NY','7183326527','timothy_mulqueen@mulqueen.org','PASSWORD',0,0),(83,'Arlette','Honeywell','PHONE','11279 Loytan St','',32254,'Jacksonville','Duval','FL','9047754480','ahoneywell@honeywell.com','PASSWORD',0,0),(84,'Dominque','Dickerson','PHONE','69 Marquette Ave','',28223,'Charlotte','Mecklenburg','NC','5109933758','dominque.dickerson@dickerson.org','PASSWORD',0,0),(85,'Lettie','Isenhower','EMAIL','70 W Main St','',28223,'Charlotte','Mecklenburg','NC','2166577668','lettie_isenhower@yahoo.com','PASSWORD',0,0),(86,'Myra','Munns','PHONE','461 Prospect Pl ','316',28223,'Charlotte','Mecklenburg','NC','8179147518','mmunns@cox.net','PASSWORD',0,0),(87,'Stephaine','Barfield','EMAIL','47154 Whipple Ave Nw','',28223,'Charlotte','Mecklenburg','NC','3107747643','stephaine@barfield.com','PASSWORD',0,0),(88,'Lai','Gato','PHONE','37 Alabama Ave','',28223,'Charlotte','Mecklenburg','NC','8477287286','lai.gato@gato.org','PASSWORD',0,0),(89,'Stephen','Emigh','EMAIL','3777 E Richmond St ','900',28223,'Charlotte','Mecklenburg','NC','3305375358','stephen_emigh@hotmail.com','PASSWORD',0,0),(90,'Tyra','Shields','PHONE','3 Fort Worth Ave','',19106,'Philadelphia','Philadelphia','PA','2152551641','tshields@gmail.com','PASSWORD',0,0),(91,'Tammara','Wardrip','EMAIL','4800 Black Horse Pike','',28223,'Charlotte','Mecklenburg','NC','6508031936','twardrip@cox.net','PASSWORD',0,0),(92,'Cory','Gibes','EMAIL','83649 W Belmont Ave','',28223,'Charlotte','Mecklenburg','NC','6265721096','cory.gibes@gmail.com','PASSWORD',0,0),(93,'Danica','Bruschke','EMAIL','840 15th Ave','',28223,'Charlotte','Mecklenburg','NC','2547828569','danica_bruschke@gmail.com','PASSWORD',0,0),(94,'Wilda','Giguere','PHONE','1747 Calle Amanecer ','2',28223,'Charlotte','Mecklenburg','NC','9078705536','wilda@cox.net','PASSWORD',0,0),(95,'Elvera','Benimadho','PHONE','99385 Charity St ','840',28223,'Charlotte','Mecklenburg','NC','4087038505','elvera.benimadho@cox.net','PASSWORD',0,0),(96,'Carma','Vanheusen','PHONE','68556 Central Hwy','',28223,'Charlotte','Mecklenburg','NC','5105037169','carma@cox.net','PASSWORD',0,0),(97,'Malinda','Hochard','PHONE','55 Riverside Ave','',28223,'Charlotte','Mecklenburg','NC','3177225066','malinda.hochard@yahoo.com','PASSWORD',0,0),(98,'Natalie','Fern','PHONE','7140 University Ave','',28223,'Charlotte','Mecklenburg','NC','3077048713','natalie.fern@hotmail.com','PASSWORD',0,0),(99,'Lisha','Centini','EMAIL','64 5th Ave ','1153',22102,'Mc Lean','Fairfax','VA','7032353937','lisha@centini.org','PASSWORD',0,0),(100,'Arlene','Klusman','EMAIL','3 Secor Rd','',28223,'Charlotte','Mecklenburg','NC','5047105840','arlene_klusman@gmail.com','PASSWORD',0,0),(101,'Alease','Buemi','EMAIL','4 Webbs Chapel Rd','',28223,'Charlotte','Mecklenburg','NC','3033014946','alease@buemi.com','PASSWORD',0,0),(102,'Louisa','Cronauer','PHONE','524 Louisiana Ave Nw','',28223,'Charlotte','Mecklenburg','NC','5108287047','louisa@cronauer.com','PASSWORD',0,0),(103,'Angella','Cetta','PHONE','185 Blackstone Bldge','',28223,'Charlotte','Mecklenburg','NC','8088927943','angella.cetta@hotmail.com','PASSWORD',0,0),(104,'Cyndy','Goldammer','PHONE','170 Wyoming Ave','',28223,'Charlotte','Mecklenburg','NC','9523349408','cgoldammer@cox.net','PASSWORD',0,0),(105,'Rosio','Cork','PHONE','4 10th St W','',27263,'High Point','Guilford','NC','3362435659','rosio.cork@gmail.com','PASSWORD',0,0),(106,'Celeste','Korando','EMAIL','7 W Pinhook Rd','',11563,'Lynbrook','Nassau','NY','5165092347','ckorando@hotmail.com','PASSWORD',0,0),(107,'Twana','Felger','EMAIL','1 Commerce Way','',28223,'Charlotte','Mecklenburg','NC','5039393153','twana.felger@felger.org','PASSWORD',0,0),(108,'Estrella','Samu','EMAIL','64 Lakeview Ave','',28223,'Charlotte','Mecklenburg','NC','6089767199','estrella@aol.com','PASSWORD',0,0),(109,'Donte','Kines','PHONE','3 Aspen St','',1602,'Worcester','Worcester','MA','5084298576','dkines@hotmail.com','PASSWORD',0,0),(110,'Tiffiny','Steffensmeier','PHONE','32860 Sierra Rd','',33133,'Miami','Miami-Dade','FL','3053859695','tiffiny_steffensmeier@cox.net','PASSWORD',0,0),(111,'Edna','Miceli','EMAIL','555 Main St','',16502,'Erie','Erie','PA','8144602655','emiceli@miceli.org','PASSWORD',0,0),(112,'Sue','Kownacki','EMAIL','2 Se 3rd Ave','',28223,'Charlotte','Mecklenburg','NC','9726663413','sue@aol.com','PASSWORD',0,0),(113,'Jesusa','Shin','PHONE','2239 Shawnee Mission Pky','',37388,'Tullahoma','Coffee','TN','9312738709','jshin@shin.com','PASSWORD',0,0),(114,'Rolland','Francescon','EMAIL','2726 Charcot Ave','',7501,'Paterson','Passaic','NJ','9736492922','rolland@cox.net','PASSWORD',0,0),(115,'Pamella','Schmierer','PHONE','5161 Dorsett Rd','',33030,'Homestead','Miami-Dade','FL','3054208970','pamella.schmierer@schmierer.org','PASSWORD',0,0),(116,'Glory','Kulzer','PHONE','55892 Jacksonville Rd','',21117,'Owings Mills','Baltimore','MD','4102249462','gkulzer@kulzer.org','PASSWORD',0,0),(117,'Shawna','Palaspas','EMAIL','5 N Cleveland Massillon Rd','',28223,'Charlotte','Mecklenburg','NC','8052753566','shawna_palaspas@palaspas.org','PASSWORD',0,0),(118,'Brandon','Callaro','EMAIL','7 Benton Dr','',28223,'Charlotte','Mecklenburg','NC','8082156832','brandon_callaro@hotmail.com','PASSWORD',0,0),(119,'Scarlet','Cartan','PHONE','9390 S Howell Ave','',31701,'Albany','Dougherty','GA','2297353378','scarlet.cartan@yahoo.com','PASSWORD',0,0),(120,'Oretha','Menter','EMAIL','8 County Center Dr ','647',2210,'Boston','Suffolk','MA','6174185043','oretha_menter@yahoo.com','PASSWORD',0,0),(121,'Ty','Smith','EMAIL','4646 Kaahumanu St','',7601,'Hackensack','Bergen','NJ','2016721553','tsmith@aol.com','PASSWORD',0,0),(122,'Xuan','Rochin','EMAIL','2 Monroe St','',28223,'Charlotte','Mecklenburg','NC','6509335072','xuan@gmail.com','PASSWORD',0,0),(123,'Lindsey','Dilello','EMAIL','52777 Leaders Heights Rd','',28223,'Charlotte','Mecklenburg','NC','9096399887','lindsey.dilello@hotmail.com','PASSWORD',0,0),(124,'Devora','Perez','PHONE','72868 Blackington Ave','',28223,'Charlotte','Mecklenburg','NC','5109553016','devora_perez@perez.org','PASSWORD',0,0),(125,'Herman','Demesa','PHONE','9 Norristown Rd','',12180,'Troy','Rensselaer','NY','5184972940','hdemesa@cox.net','PASSWORD',0,0),(126,'Rory','Papasergi','PHONE','83 County Road 437 ','8581',18411,'Clarks Summit','Lackawanna','PA','5708677489','rpapasergi@cox.net','PASSWORD',0,0),(127,'Talia','Riopelle','PHONE','1 N Harlem Ave ','9',7050,'Orange','Essex','NJ','9732452133','talia_riopelle@aol.com','PASSWORD',0,0),(128,'Van','Shire','EMAIL','90131 J St','',8867,'Pittstown','Hunterdon','NJ','9084092890','van.shire@shire.com','PASSWORD',0,0),(129,'Lucina','Lary','EMAIL','8597 W National Ave','',32922,'Cocoa','Brevard','FL','3217494981','lucina_lary@cox.net','PASSWORD',0,0),(130,'Bok','Isaacs','EMAIL','6 Gilson St','',10468,'Bronx','Bronx','NY','7188093762','bok.isaacs@aol.com','PASSWORD',0,0),(131,'Rolande','Spickerman','PHONE','65 W Maple Ave','',28223,'Charlotte','Mecklenburg','NC','8083153077','rolande.spickerman@spickerman.com','PASSWORD',0,0),(132,'Howard','Paulas','PHONE','866 34th Ave','',28223,'Charlotte','Mecklenburg','NC','3036234241','hpaulas@gmail.com','PASSWORD',0,0),(133,'Kimbery','Madarang','PHONE','798 Lund Farm Way','',7866,'Rockaway','Morris','NJ','9733101634','kimbery_madarang@cox.net','PASSWORD',0,0),(134,'Thurman','Manno','EMAIL','9387 Charcot Ave','',8201,'Absecon','Atlantic','NJ','6095243586','thurman.manno@yahoo.com','PASSWORD',0,0),(135,'Becky','Mirafuentes','PHONE','30553 Washington Rd','',7062,'Plainfield','Union','NJ','9088778409','becky.mirafuentes@mirafuentes.com','PASSWORD',0,0),(136,'Beatriz','Corrington','PHONE','481 W Lemon St','',2346,'Middleboro','Plymouth','MA','5085844279','beatriz@yahoo.com','PASSWORD',0,0),(137,'Marti','Maybury','PHONE','4 Warehouse Point Rd ','7',28223,'Charlotte','Mecklenburg','NC','7737754522','marti.maybury@yahoo.com','PASSWORD',0,0),(138,'Nieves','Gotter','PHONE','4940 Pulaski Park Dr','',28223,'Charlotte','Mecklenburg','NC','5035275274','nieves_gotter@gmail.com','PASSWORD',0,0),(139,'Leatha','Hagele','EMAIL','627 Walford Ave','',28223,'Charlotte','Mecklenburg','NC','2143391809','lhagele@cox.net','PASSWORD',0,0),(140,'Valentin','Klimek','EMAIL','137 Pioneer Way','',28223,'Charlotte','Mecklenburg','NC','3123035453','vklimek@klimek.org','PASSWORD',0,0),(141,'Melissa','Wiklund','EMAIL','61 13 Stoneridge ','835',28223,'Charlotte','Mecklenburg','NC','4199393613','melissa@cox.net','PASSWORD',0,0),(142,'Sheridan','Zane','PHONE','2409 Alabama Rd','',28223,'Charlotte','Mecklenburg','NC','9516453605','sheridan.zane@zane.com','PASSWORD',0,0),(143,'Bulah','Padilla','EMAIL','8927 Vandever Ave','',28223,'Charlotte','Mecklenburg','NC','2544634368','bulah_padilla@hotmail.com','PASSWORD',0,0),(144,'Audra','Kohnert','PHONE','134 Lewis Rd','',37211,'Nashville','Davidson','TN','6154067854','audra@kohnert.com','PASSWORD',0,0),(145,'Daren','Weirather','EMAIL','9 N College Ave ','3',28223,'Charlotte','Mecklenburg','NC','4149592540','dweirather@aol.com','PASSWORD',0,0),(146,'Fernanda','Jillson','EMAIL','60480 Old Us Highway 51','',21655,'Preston','Caroline','MD','4103875260','fjillson@aol.com','PASSWORD',0,0),(147,'Gearldine','Gellinger','PHONE','4 Bloomfield Ave','',28223,'Charlotte','Mecklenburg','NC','9729346914','gearldine_gellinger@gellinger.com','PASSWORD',0,0),(148,'Chau','Kitzman','PHONE','429 Tiger Ln','',28223,'Charlotte','Mecklenburg','NC','3105608022','chau@gmail.com','PASSWORD',0,0),(149,'Theola','Frey','PHONE','54169 N Main St','',11758,'Massapequa','Nassau','NY','5169485768','theola_frey@frey.com','PASSWORD',0,0),(150,'Cheryl','Haroldson','EMAIL','92 Main St','',8401,'Atlantic City','Atlantic','NJ','6095187697','cheryl@haroldson.org','PASSWORD',0,0),(151,'Laticia','Merced','EMAIL','72 Mannix Dr','',28223,'Charlotte','Mecklenburg','NC','5135087371','lmerced@gmail.com','PASSWORD',0,0),(152,'Carissa','Batman','EMAIL','12270 Caton Center Dr','',28223,'Charlotte','Mecklenburg','NC','5413264074','carissa.batman@yahoo.com','PASSWORD',0,0),(153,'Lezlie','Craghead','PHONE','749 W 18th St ','45',27577,'Smithfield','Johnston','NC','9195333762','lezlie.craghead@craghead.org','PASSWORD',0,0),(154,'Ozell','Shealy','PHONE','8 Industry Ln','',10002,'New York','New York','NY','2123328435','oshealy@hotmail.com','PASSWORD',0,0),(155,'Arminda','Parvis','EMAIL','1 Huntwood Ave','',28223,'Charlotte','Mecklenburg','NC','6029069419','arminda@parvis.com','PASSWORD',0,0),(156,'Reita','Leto','EMAIL','55262 N French Rd','',28223,'Charlotte','Mecklenburg','NC','3172341135','reita.leto@gmail.com','PASSWORD',0,0),(157,'Yolando','Luczki','EMAIL','422 E 21st St','',13214,'Syracuse','Onondaga','NY','3153044759','yolando@cox.net','PASSWORD',0,0),(158,'Lizette','Stem','EMAIL','501 N 19th Ave','',8002,'Cherry Hill','Camden','NJ','8564875412','lizette.stem@aol.com','PASSWORD',0,0),(159,'Gregoria','Pawlowicz','EMAIL','455 N Main Ave','',11530,'Garden City','Nassau','NY','5162121915','gpawlowicz@yahoo.com','PASSWORD',0,0),(160,'Carin','Deleo','EMAIL','1844 Southern Blvd','',28223,'Charlotte','Mecklenburg','NC','5013081040','cdeleo@deleo.com','PASSWORD',0,0),(161,'Chantell','Maynerich','PHONE','2023 Greg St','',28223,'Charlotte','Mecklenburg','NC','6515912583','chantell@yahoo.com','PASSWORD',0,0),(162,'Dierdre','Yum','EMAIL','63381 Jenks Ave','',19134,'Philadelphia','Philadelphia','PA','2153253042','dyum@yahoo.com','PASSWORD',0,0),(163,'Larae','Gudroe','EMAIL','6651 Municipal Rd','',28223,'Charlotte','Mecklenburg','NC','9858907262','larae_gudroe@gmail.com','PASSWORD',0,0),(164,'Latrice','Tolfree','EMAIL','81 Norris Ave ','525',11779,'Ronkonkoma','Suffolk','NY','6319577624','latrice.tolfree@hotmail.com','PASSWORD',0,0),(165,'Kerry','Theodorov','PHONE','6916 W Main St','',28223,'Charlotte','Mecklenburg','NC','9165913277','kerry.theodorov@gmail.com','PASSWORD',0,0),(166,'Dorthy','Hidvegi','PHONE','9635 S Main St','',28223,'Charlotte','Mecklenburg','NC','2086492373','dhidvegi@yahoo.com','PASSWORD',0,0),(167,'Fannie','Lungren','PHONE','17 Us Highway 111','',28223,'Charlotte','Mecklenburg','NC','5125875746','fannie.lungren@yahoo.com','PASSWORD',0,0),(168,'Evangelina','Radde','EMAIL','992 Civic Center Dr','',19123,'Philadelphia','Philadelphia','PA','2159643284','evangelina@aol.com','PASSWORD',0,0),(169,'Novella','Degroot','PHONE','303 N Radcliffe St','',28223,'Charlotte','Mecklenburg','NC','8084774775','novella_degroot@degroot.org','PASSWORD',0,0),(170,'Clay','Hoa','PHONE','73 Saint Ann St ','86',28223,'Charlotte','Mecklenburg','NC','7755018109','choa@hoa.org','PASSWORD',0,0),(171,'Jennifer','Fallick','EMAIL','44 58th St','',28223,'Charlotte','Mecklenburg','NC','8479799545','jfallick@yahoo.com','PASSWORD',0,0),(172,'Irma','Wolfgramm','PHONE','9745 W Main St','',7869,'Randolph','Morris','NJ','9735457355','irma.wolfgramm@hotmail.com','PASSWORD',0,0),(173,'Eun','Coody','PHONE','84 Bloomfield Ave','',29301,'Spartanburg','Spartanburg','SC','8642563620','eun@yahoo.com','PASSWORD',0,0),(174,'Sylvia','Cousey','EMAIL','287 Youngstown Warren Rd','',21074,'Hampstead','Carroll','MD','4102099545','sylvia_cousey@cousey.org','PASSWORD',0,0),(175,'Nana','Smith','EMAIL','6 Van Buren St','',10553,'Mount Vernon','Westchester','NY','9148552115','nana@aol.com','PASSWORD',0,0),(176,'Layla','Springe','PHONE','229 N Forty Driv','',10011,'New York','New York','NY','2122603151','layla.springe@cox.net','PASSWORD',0,0),(177,'Joesph','Degonia','EMAIL','2887 Knowlton St ','5435',28223,'Charlotte','Mecklenburg','NC','5106779785','joesph_degonia@degonia.org','PASSWORD',0,0),(178,'Annabelle','Boord','PHONE','523 Marquette Ave','',1742,'Concord','Middlesex','MA','9786976263','annabelle.boord@cox.net','PASSWORD',0,0),(179,'Stephaine','Vinning','EMAIL','3717 Hamann Industrial Pky','',28223,'Charlotte','Mecklenburg','NC','4157676596','stephaine@cox.net','PASSWORD',0,0),(180,'Nelida','Patel','PHONE','3 State Route 35 S','',7652,'Paramus','Bergen','NJ','2019711638','nelida@gmail.com','PASSWORD',0,0),(181,'Marguerita','Hiatt','EMAIL','82 N Highway 67','',28223,'Charlotte','Mecklenburg','NC','9256347158','marguerita.hiatt@gmail.com','PASSWORD',0,0),(182,'Carmela','Cookey','EMAIL','9 Murfreesboro Rd','',28223,'Charlotte','Mecklenburg','NC','7734944195','ccookey@cookey.org','PASSWORD',0,0),(183,'Junita','Brideau','PHONE','6 S Broadway St','',7009,'Cedar Grove','Essex','NJ','9739433423','jbrideau@aol.com','PASSWORD',0,0),(184,'Claribel','Varriano','EMAIL','6 Harry L Dr ','6327',28223,'Charlotte','Mecklenburg','NC','4195444900','claribel_varriano@cox.net','PASSWORD',0,0),(185,'Benton','Skursky','EMAIL','47939 Porter Ave','',28223,'Charlotte','Mecklenburg','NC','3105792907','benton.skursky@aol.com','PASSWORD',0,0),(186,'Hillary','Skulski','EMAIL','9 Wales Rd Ne ','914',34448,'Homosassa','Citrus','FL','3522422570','hillary.skulski@aol.com','PASSWORD',0,0),(187,'Merilyn','Bayless','PHONE','195 13n N','',28223,'Charlotte','Mecklenburg','NC','4087585015','merilyn_bayless@cox.net','PASSWORD',0,0),(188,'Teri','Ennaco','PHONE','99 Tank Farm Rd','',18201,'Hazleton','Luzerne','PA','5708895187','tennaco@gmail.com','PASSWORD',0,0),(189,'Merlyn','Lawler','PHONE','4671 Alemany Blvd','',7304,'Jersey City','Hudson','NJ','2015887810','merlyn_lawler@hotmail.com','PASSWORD',0,0),(190,'Georgene','Montezuma','EMAIL','98 University Dr','',28223,'Charlotte','Mecklenburg','NC','9256155185','gmontezuma@cox.net','PASSWORD',0,0),(191,'Jettie','McConnell','PHONE','50 E Wacker Dr','',8807,'Bridgewater','Somerset','NJ','9088023564','jmconnell@hotmail.com','PASSWORD',0,0),(192,'Lemuel','Latzke','PHONE','70 Euclid Ave ','722',11716,'Bohemia','Suffolk','NY','6317486479','lemuel.latzke@gmail.com','PASSWORD',0,0),(193,'Melodie','Knipp','EMAIL','326 E Main St ','6496',28223,'Charlotte','Mecklenburg','NC','8056901682','mknipp@gmail.com','PASSWORD',0,0),(194,'Candida','Corbley','PHONE','406 Main St','',8876,'Somerville','Somerset','NJ','9082758357','candida_corbley@hotmail.com','PASSWORD',0,0),(195,'Karan','Karpin','EMAIL','3 Elmwood Dr','',28223,'Charlotte','Mecklenburg','NC','5039408327','karan_karpin@gmail.com','PASSWORD',0,0),(196,'Andra','Scheyer','PHONE','9 Church St','',28223,'Charlotte','Mecklenburg','NC','5035162189','andra@gmail.com','PASSWORD',0,0),(197,'Felicidad','Poullion','EMAIL','9939 N 14th St','',8077,'Riverton','Burlington','NJ','8563059731','fpoullion@poullion.com','PASSWORD',0,0),(198,'Belen','Strassner','PHONE','5384 Southwyck Blvd','',30135,'Douglasville','Douglas','GA','7705078791','belen_strassner@aol.com','PASSWORD',0,0),(199,'Gracia','Melnyk','EMAIL','97 Airport Loop Dr','',32216,'Jacksonville','Duval','FL','9042353633','gracia@melnyk.com','PASSWORD',0,0),(200,'Jolanda','Hanafan','EMAIL','37855 Nolan Rd','',28223,'Charlotte','Mecklenburg','NC','2074589196','jhanafan@gmail.com','PASSWORD',0,0),(201,'Barrett','Toyama','PHONE','4252 N Washington Ave ','9',28223,'Charlotte','Mecklenburg','NC','8177655781','barrett.toyama@toyama.org','PASSWORD',0,0),(202,'Helga','Fredicks','PHONE','42754 S Ash Ave','',14228,'Buffalo','Erie','NY','7167524114','helga_fredicks@yahoo.com','PASSWORD',0,0),(203,'Ashlyn','Pinilla','EMAIL','703 Beville Rd','',33054,'Opa Locka','Miami-Dade','FL','3056709628','apinilla@cox.net','PASSWORD',0,0),(204,'Fausto','Agramonte','PHONE','5 Harrison Rd','',10038,'New York','New York','NY','2123131783','fausto_agramonte@yahoo.com','PASSWORD',0,0),(205,'Ronny','Caiafa','EMAIL','73 Southern Blvd','',19103,'Philadelphia','Philadelphia','PA','2156057570','ronny.caiafa@caiafa.org','PASSWORD',0,0),(206,'Marge','Limmel','EMAIL','189 Village Park Rd','',32536,'Crestview','Okaloosa','FL','8504301663','marge@gmail.com','PASSWORD',0,0),(207,'Norah','Waymire','PHONE','6 Middlegate Rd ','106',28223,'Charlotte','Mecklenburg','NC','4153067897','norah.waymire@gmail.com','PASSWORD',0,0),(208,'Aliza','Baltimore','PHONE','1128 Delaware St','',28223,'Charlotte','Mecklenburg','NC','4085043552','aliza@aol.com','PASSWORD',0,0),(209,'Mozell','Pelkowski','EMAIL','577 Parade St','',28223,'Charlotte','Mecklenburg','NC','6509471215','mpelkowski@pelkowski.org','PASSWORD',0,0),(210,'Viola','Bitsuie','PHONE','70 Mechanic St','',28223,'Charlotte','Mecklenburg','NC','8188644875','viola@gmail.com','PASSWORD',0,0),(211,'Franklyn','Emard','PHONE','4379 Highway 116','',19103,'Philadelphia','Philadelphia','PA','2155588189','femard@emard.com','PASSWORD',0,0),(212,'Willodean','Konopacki','EMAIL','55 Hawthorne Blvd','',28223,'Charlotte','Mecklenburg','NC','3372538384','willodean_konopacki@konopacki.org','PASSWORD',0,0),(213,'Beckie','Silvestrini','EMAIL','7116 Western Ave','',28223,'Charlotte','Mecklenburg','NC','3135334884','beckie.silvestrini@silvestrini.com','PASSWORD',0,0),(214,'Rebecka','Gesick','EMAIL','2026 N Plankinton Ave ','3',28223,'Charlotte','Mecklenburg','NC','5122138574','rgesick@gesick.org','PASSWORD',0,0),(215,'Frederica','Blunk','PHONE','99586 Main St','',28223,'Charlotte','Mecklenburg','NC','2144282285','frederica_blunk@gmail.com','PASSWORD',0,0),(216,'Glen','Bartolet','EMAIL','8739 Hudson St','',28223,'Charlotte','Mecklenburg','NC','2066975796','glen_bartolet@hotmail.com','PASSWORD',0,0),(217,'Freeman','Gochal','EMAIL','383 Gunderman Rd ','197',19320,'Coatesville','Chester','PA','6104763501','freeman_gochal@aol.com','PASSWORD',0,0),(218,'Vincent','Meinerding','EMAIL','4441 Point Term Mkt','',19143,'Philadelphia','Philadelphia','PA','2153721718','vincent.meinerding@hotmail.com','PASSWORD',0,0),(219,'Rima','Bevelacqua','EMAIL','2972 Lafayette Ave','',28223,'Charlotte','Mecklenburg','NC','3108585079','rima@cox.net','PASSWORD',0,0),(220,'Glendora','Sarbacher','EMAIL','2140 Diamond Blvd','',28223,'Charlotte','Mecklenburg','NC','7076538214','gsarbacher@gmail.com','PASSWORD',0,0),(221,'Avery','Steier','EMAIL','93 Redmond Rd ','492',32803,'Orlando','Orange','FL','4078089439','avery@cox.net','PASSWORD',0,0),(222,'Cristy','Lother','EMAIL','3989 Portage Tr','',28223,'Charlotte','Mecklenburg','NC','7609714322','cristy@lother.com','PASSWORD',0,0),(223,'Nicolette','Brossart','EMAIL','1 Midway Rd','',1581,'Westborough','Worcester','MA','5088379230','nicolette_brossart@brossart.com','PASSWORD',0,0),(224,'Tracey','Modzelewski','EMAIL','77132 Coon Rapids Blvd Nw','',28223,'Charlotte','Mecklenburg','NC','9362649294','tracey@hotmail.com','PASSWORD',0,0),(225,'Virgina','Tegarden','PHONE','755 Harbor Way','',28223,'Charlotte','Mecklenburg','NC','4142148697','virgina_tegarden@tegarden.com','PASSWORD',0,0),(226,'Tiera','Frankel','PHONE','87 Sierra Rd','',28223,'Charlotte','Mecklenburg','NC','6266364117','tfrankel@aol.com','PASSWORD',0,0),(227,'Alaine','Bergesen','PHONE','7667 S Hulen St ','42',10701,'Yonkers','Westchester','NY','9143009193','alaine_bergesen@cox.net','PASSWORD',0,0),(228,'Earleen','Mai','EMAIL','75684 S Withlapopka Dr ','32',28223,'Charlotte','Mecklenburg','NC','2142891973','earleen_mai@cox.net','PASSWORD',0,0),(229,'Leonida','Gobern','PHONE','5 Elmwood Park Blvd','',28223,'Charlotte','Mecklenburg','NC','2282355615','leonida@gobern.org','PASSWORD',0,0),(230,'Ressie','Auffrey','EMAIL','23 Palo Alto Sq','',33134,'Miami','Miami-Dade','FL','3056048981','ressie.auffrey@yahoo.com','PASSWORD',0,0),(231,'Justine','Mugnolo','EMAIL','38062 E Main St','',10048,'New York','New York','NY','2123049225','jmugnolo@yahoo.com','PASSWORD',0,0),(232,'Eladia','Saulter','PHONE','3958 S Dupont Hwy ','7',7446,'Ramsey','Bergen','NJ','2014744924','eladia@saulter.com','PASSWORD',0,0),(233,'Chaya','Malvin','EMAIL','560 Civic Center Dr','',28223,'Charlotte','Mecklenburg','NC','7349285182','chaya@malvin.com','PASSWORD',0,0),(234,'Gwenn','Suffield','PHONE','3270 Dequindre Rd','',11729,'Deer Park','Suffolk','NY','6312586558','gwenn_suffield@suffield.org','PASSWORD',0,0),(235,'Salena','Karpel','EMAIL','1 Garfield Ave ','7',28223,'Charlotte','Mecklenburg','NC','3307918557','skarpel@cox.net','PASSWORD',0,0),(236,'Yoko','Fishburne','PHONE','9122 Carpenter Ave','',28223,'Charlotte','Mecklenburg','NC','2035064706','yoko@fishburne.com','PASSWORD',0,0),(237,'Taryn','Moyd','EMAIL','48 Lenox St','',22030,'Fairfax','Fairfax City','VA','7033224041','taryn.moyd@hotmail.com','PASSWORD',0,0),(238,'Katina','Polidori','EMAIL','5 Little River Tpke','',1887,'Wilmington','Middlesex','MA','9786262978','katina_polidori@aol.com','PASSWORD',0,0),(239,'Rickie','Plumer','PHONE','3 N Groesbeck Hwy','',28223,'Charlotte','Mecklenburg','NC','4196931334','rickie.plumer@aol.com','PASSWORD',0,0),(240,'Alex','Loader','PHONE','37 N Elm St ','916',28223,'Charlotte','Mecklenburg','NC','2536607821','alex@loader.com','PASSWORD',0,0),(241,'Lashon','Vizarro','EMAIL','433 Westminster Blvd ','590',28223,'Charlotte','Mecklenburg','NC','9167417884','lashon@aol.com','PASSWORD',0,0),(242,'Lauran','Burnard','PHONE','66697 Park Pl ','3224',28223,'Charlotte','Mecklenburg','NC','3073427795','lburnard@burnard.com','PASSWORD',0,0),(243,'Ceola','Setter','PHONE','96263 Greenwood Pl','',28223,'Charlotte','Mecklenburg','NC','2076277565','ceola.setter@setter.org','PASSWORD',0,0),(244,'My','Rantanen','EMAIL','8 Mcarthur Ln','',18954,'Richboro','Bucks','PA','2154915633','my@hotmail.com','PASSWORD',0,0),(245,'Lorrine','Worlds','PHONE','8 Fair Lawn Ave','',33614,'Tampa','Hillsborough','FL','8137692939','lorrine.worlds@worlds.com','PASSWORD',0,0),(246,'Peggie','Sturiale','EMAIL','9 N 14th St','',28223,'Charlotte','Mecklenburg','NC','6196081763','peggie@cox.net','PASSWORD',0,0),(247,'Marvel','Raymo','PHONE','9 Vanowen St','',28223,'Charlotte','Mecklenburg','NC','9797188968','mraymo@yahoo.com','PASSWORD',0,0),(248,'Daron','Dinos','PHONE','18 Waterloo Geneva Rd','',28223,'Charlotte','Mecklenburg','NC','8472333075','daron_dinos@cox.net','PASSWORD',0,0),(249,'An','Fritz','PHONE','506 S Hacienda Dr','',8401,'Atlantic City','Atlantic','NJ','6092285265','an_fritz@hotmail.com','PASSWORD',0,0),(250,'Portia','Stimmel','EMAIL','3732 Sherman Ave','',8807,'Bridgewater','Somerset','NJ','9087227128','portia.stimmel@aol.com','PASSWORD',0,0),(251,'Rhea','Aredondo','PHONE','25657 Live Oak St','',11226,'Brooklyn','Kings','NY','7185609537','rhea_aredondo@cox.net','PASSWORD',0,0),(252,'Benedict','Sama','PHONE','4923 Carey Ave','',28223,'Charlotte','Mecklenburg','NC','3147871588','bsama@cox.net','PASSWORD',0,0),(253,'Alyce','Arias','EMAIL','3196 S Rider Trl','',28223,'Charlotte','Mecklenburg','NC','2093171801','alyce@arias.org','PASSWORD',0,0),(254,'Heike','Berganza','PHONE','3 Railway Ave ','75',7424,'Little Falls','Passaic','NJ','9739365095','heike@gmail.com','PASSWORD',0,0),(255,'Carey','Dopico','EMAIL','87393 E Highland Rd','',28223,'Charlotte','Mecklenburg','NC','3175782453','carey_dopico@dopico.org','PASSWORD',0,0),(256,'Dottie','Hellickson','PHONE','67 E Chestnut Hill Rd','',28223,'Charlotte','Mecklenburg','NC','2065406076','dottie@hellickson.org','PASSWORD',0,0),(257,'Deandrea','Hughey','PHONE','33 Lewis Rd ','46',27215,'Burlington','Alamance','NC','3368227652','deandrea@yahoo.com','PASSWORD',0,0),(258,'Kimberlie','Duenas','EMAIL','8100 Jacksonville Rd ','7',28223,'Charlotte','Mecklenburg','NC','7856298542','kimberlie_duenas@yahoo.com','PASSWORD',0,0),(259,'Martina','Staback','PHONE','7 W Wabansia Ave ','227',32822,'Orlando','Orange','FL','4074716908','martina_staback@staback.com','PASSWORD',0,0),(260,'Skye','Fillingim','PHONE','25 Minters Chapel Rd ','9',28223,'Charlotte','Mecklenburg','NC','6125082655','skye_fillingim@yahoo.com','PASSWORD',0,0),(261,'Jade','Farrar','PHONE','6882 Torresdale Ave','',29201,'Columbia','Richland','SC','8033525387','jade.farrar@yahoo.com','PASSWORD',0,0),(262,'Charlene','Hamilton','EMAIL','985 E 6th Ave','',28223,'Charlotte','Mecklenburg','NC','7073001771','charlene.hamilton@hotmail.com','PASSWORD',0,0),(263,'Geoffrey','Acey','EMAIL','7 West Ave ','1',28223,'Charlotte','Mecklenburg','NC','8472221734','geoffrey@gmail.com','PASSWORD',0,0),(264,'Stevie','Westerbeck','PHONE','26659 N 13th St','',28223,'Charlotte','Mecklenburg','NC','9498674077','stevie.westerbeck@yahoo.com','PASSWORD',0,0),(265,'Pamella','Fortino','PHONE','669 Packerland Dr ','1438',28223,'Charlotte','Mecklenburg','NC','3034042210','pamella@fortino.com','PASSWORD',0,0),(266,'Harrison','Haufler','PHONE','759 Eldora St','',28223,'Charlotte','Mecklenburg','NC','2038016193','hhaufler@hotmail.com','PASSWORD',0,0),(267,'Johnna','Engelberg','EMAIL','5 S Colorado Blvd ','449',28223,'Charlotte','Mecklenburg','NC','4259867573','jengelberg@engelberg.org','PASSWORD',0,0),(268,'Buddy','Cloney','EMAIL','944 Gaither Dr','',28223,'Charlotte','Mecklenburg','NC','4409895826','buddy.cloney@yahoo.com','PASSWORD',0,0),(269,'Dalene','Riden','EMAIL','66552 Malone Rd','',28223,'Charlotte','Mecklenburg','NC','6033156839','dalene.riden@aol.com','PASSWORD',0,0),(270,'Jerry','Zurcher','PHONE','77 Massillon Rd ','822',32937,'Satellite Beach','Brevard','FL','3215185938','jzurcher@zurcher.org','PASSWORD',0,0),(271,'Haydee','Denooyer','PHONE','25346 New Rd','',10016,'New York','New York','NY','2127928658','hdenooyer@denooyer.org','PASSWORD',0,0),(272,'Joseph','Cryer','PHONE','60 Fillmore Ave','',28223,'Charlotte','Mecklenburg','NC','7145842237','joseph_cryer@cox.net','PASSWORD',0,0),(273,'Deonna','Kippley','PHONE','57 Haven Ave ','90',28223,'Charlotte','Mecklenburg','NC','2489134677','deonna_kippley@hotmail.com','PASSWORD',0,0),(274,'Raymon','Calvaresi','PHONE','6538 E Pomona St ','60',28223,'Charlotte','Mecklenburg','NC','3178254724','raymon.calvaresi@gmail.com','PASSWORD',0,0),(275,'Alecia','Bubash','EMAIL','6535 Joyce St','',28223,'Charlotte','Mecklenburg','NC','9402767922','alecia@aol.com','PASSWORD',0,0),(276,'Ma','Layous','PHONE','78112 Morris Ave','',28223,'Charlotte','Mecklenburg','NC','2037213388','mlayous@hotmail.com','PASSWORD',0,0),(277,'Detra','Coyier','EMAIL','96950 Hidden Ln','',21001,'Aberdeen','Harford','MD','4107399277','detra@aol.com','PASSWORD',0,0),(278,'Terrilyn','Rodeigues','PHONE','3718 S Main St','',28223,'Charlotte','Mecklenburg','NC','5044634384','terrilyn.rodeigues@cox.net','PASSWORD',0,0),(279,'Salome','Lacovara','PHONE','9677 Commerce Dr','',23219,'Richmond','Richmond City','VA','8045505097','slacovara@gmail.com','PASSWORD',0,0),(280,'Garry','Keetch','PHONE','5 Green Pond Rd ','4',18966,'Southampton','Bucks','PA','2159798776','garry_keetch@hotmail.com','PASSWORD',0,0),(281,'Matthew','Neither','PHONE','636 Commerce Dr ','42',28223,'Charlotte','Mecklenburg','NC','9526517597','mneither@yahoo.com','PASSWORD',0,0),(282,'Theodora','Restrepo','PHONE','42744 Hamann Industrial Pky ','82',33136,'Miami','Miami-Dade','FL','3059368226','theodora.restrepo@restrepo.com','PASSWORD',0,0),(283,'Noah','Kalafatis','PHONE','1950 5th Ave','',28223,'Charlotte','Mecklenburg','NC','4142635287','noah.kalafatis@aol.com','PASSWORD',0,0),(284,'Carmen','Sweigard','PHONE','61304 N French Rd','',8873,'Somerset','Somerset','NJ','7329412621','csweigard@sweigard.com','PASSWORD',0,0),(285,'Lavonda','Hengel','PHONE','87 Imperial Ct ','79',28223,'Charlotte','Mecklenburg','NC','7018982154','lavonda@cox.net','PASSWORD',0,0),(286,'Junita','Stoltzman','EMAIL','94 W Dodge Rd','',28223,'Charlotte','Mecklenburg','NC','7756389963','junita@aol.com','PASSWORD',0,0),(287,'Herminia','Nicolozakes','EMAIL','4 58th St ','3519',28223,'Charlotte','Mecklenburg','NC','6029545141','herminia@nicolozakes.org','PASSWORD',0,0),(288,'Casie','Good','PHONE','5221 Bear Valley Rd','',37211,'Nashville','Davidson','TN','6153902251','casie.good@aol.com','PASSWORD',0,0),(289,'Reena','Maisto','EMAIL','9648 S Main','',21801,'Salisbury','Wicomico','MD','4103511863','reena@hotmail.com','PASSWORD',0,0),(290,'Mirta','Mallett','EMAIL','7 S San Marcos Rd','',10004,'New York','New York','NY','2128701286','mirta_mallett@gmail.com','PASSWORD',0,0),(291,'Cathrine','Pontoriero','PHONE','812 S Haven St','',28223,'Charlotte','Mecklenburg','NC','8067031435','cathrine.pontoriero@pontoriero.com','PASSWORD',0,0),(292,'Filiberto','Tawil','EMAIL','3882 W Congress St ','799',28223,'Charlotte','Mecklenburg','NC','3237652528','ftawil@hotmail.com','PASSWORD',0,0),(293,'Raul','Upthegrove','PHONE','4 E Colonial Dr','',28223,'Charlotte','Mecklenburg','NC','6195095282','rupthegrove@yahoo.com','PASSWORD',0,0),(294,'Sarah','Candlish','PHONE','45 2nd Ave ','9759',30328,'Atlanta','Fulton','GA','7707321194','sarah.candlish@gmail.com','PASSWORD',0,0),(295,'Lucy','Treston','PHONE','57254 Brickell Ave ','372',1602,'Worcester','Worcester','MA','5087695250','lucy@cox.net','PASSWORD',0,0),(296,'Judy','Aquas','PHONE','8977 Connecticut Ave Nw ','3',28223,'Charlotte','Mecklenburg','NC','2697567222','jaquas@aquas.com','PASSWORD',0,0),(297,'Yvonne','Tjepkema','EMAIL','9 Waydell St','',7004,'Fairfield','Essex','NJ','9737141721','yvonne.tjepkema@hotmail.com','PASSWORD',0,0),(298,'Kayleigh','Lace','EMAIL','43 Huey P Long Ave','',28223,'Charlotte','Mecklenburg','NC','3377409323','kayleigh.lace@yahoo.com','PASSWORD',0,0),(299,'Felix','Hirpara','PHONE','7563 Cornwall Rd ','4462',17517,'Denver','Lancaster','PA','7174915643','felix_hirpara@cox.net','PASSWORD',0,0),(300,'Tresa','Sweely','EMAIL','22 Bridle Ln','',28223,'Charlotte','Mecklenburg','NC','3143599566','tresa_sweely@hotmail.com','PASSWORD',0,0),(301,'Kristeen','Turinetti','EMAIL','70099 E North Ave','',28223,'Charlotte','Mecklenburg','NC','8172138851','kristeen@gmail.com','PASSWORD',0,0),(302,'Jenelle','Regusters','EMAIL','3211 E Northeast Loop','',33619,'Tampa','Hillsborough','FL','8139328715','jregusters@regusters.com','PASSWORD',0,0),(303,'Renea','Monterrubio','EMAIL','26 Montgomery St','',30328,'Atlanta','Fulton','GA','7706794752','renea@hotmail.com','PASSWORD',0,0),(304,'Olive','Matuszak','PHONE','13252 Lighthouse Ave','',28223,'Charlotte','Mecklenburg','NC','7609386069','olive@aol.com','PASSWORD',0,0),(305,'Ligia','Reiber','PHONE','206 Main St ','2804',28223,'Charlotte','Mecklenburg','NC','5179061108','lreiber@cox.net','PASSWORD',0,0),(306,'Christiane','Eschberger','EMAIL','96541 W Central Blvd','',28223,'Charlotte','Mecklenburg','NC','6023904944','christiane.eschberger@yahoo.com','PASSWORD',0,0),(307,'Goldie','Schirpke','PHONE','34 Saint George Ave ','2',28223,'Charlotte','Mecklenburg','NC','2072957569','goldie.schirpke@yahoo.com','PASSWORD',0,0),(308,'Loreta','Timenez','EMAIL','47857 Coney Island Ave','',20735,'Clinton','Prince Georges','MD','3016966420','loreta.timenez@hotmail.com','PASSWORD',0,0),(309,'Fabiola','Hauenstein','PHONE','8573 Lincoln Blvd','',17404,'York','York','PA','7178093119','fabiola.hauenstein@hauenstein.org','PASSWORD',0,0),(310,'Amie','Perigo','PHONE','596 Santa Maria Ave ','7913',28223,'Charlotte','Mecklenburg','NC','9724197946','amie.perigo@yahoo.com','PASSWORD',0,0),(311,'Raina','Brachle','PHONE','3829 Ventura Blvd','',28070,'Huntersville','Mecklenburg','NC','4063181515','raina.brachle@brachle.org','PASSWORD',0,0),(312,'Erinn','Canlas','EMAIL','13 S Hacienda Dr','',7039,'Livingston','Essex','NJ','9737673008','erinn.canlas@canlas.com','PASSWORD',0,0),(313,'Cherry','Lietz','PHONE','40 9th Ave Sw ','91',28070,'Huntersville','Mecklenburg','NC','2489806904','cherry@lietz.com','PASSWORD',0,0),(314,'Kattie','Vonasek','PHONE','2845 Boulder Crescent St','',28070,'Huntersville','Mecklenburg','NC','2169233715','kattie@vonasek.org','PASSWORD',0,0),(315,'Lilli','Scriven','EMAIL','33 State St','',28070,'Huntersville','Mecklenburg','NC','3256311560','lilli@aol.com','PASSWORD',0,0),(316,'Whitley','Tomasulo','EMAIL','2 S 15th St','',28070,'Huntersville','Mecklenburg','NC','8175264408','whitley.tomasulo@aol.com','PASSWORD',0,0),(317,'Barbra','Adkin','PHONE','4 Kohler Memorial Dr','',11230,'Brooklyn','Kings','NY','7182013751','badkin@hotmail.com','PASSWORD',0,0),(318,'Hermila','Thyberg','PHONE','1 Rancho Del Mar Shopping C','',2903,'Providence','Providence','RI','4018934882','hermila_thyberg@hotmail.com','PASSWORD',0,0),(319,'Jesusita','Flister','PHONE','3943 N Highland Ave','',17601,'Lancaster','Lancaster','PA','7178859118','jesusita.flister@hotmail.com','PASSWORD',0,0),(320,'Caitlin','Julia','EMAIL','5 Williams St','',2919,'Johnston','Providence','RI','4019484982','caitlin.julia@julia.org','PASSWORD',0,0),(321,'Roosevelt','Hoffis','PHONE','60 Old Dover Rd','',33014,'Hialeah','Miami-Dade','FL','3056224739','roosevelt.hoffis@aol.com','PASSWORD',0,0),(322,'Helaine','Halter','EMAIL','8 Sheridan Rd','',7304,'Jersey City','Hudson','NJ','2018324168','hhalter@yahoo.com','PASSWORD',0,0),(323,'Lorean','Martabano','PHONE','85092 Southern Blvd','',28070,'Huntersville','Mecklenburg','NC','2108564979','lorean.martabano@hotmail.com','PASSWORD',0,0),(324,'France','Buzick','EMAIL','64 Newman Springs Rd E','',11219,'Brooklyn','Kings','NY','7184788504','france.buzick@yahoo.com','PASSWORD',0,0),(325,'Justine','Ferrario','PHONE','48 Stratford Ave','',28070,'Huntersville','Mecklenburg','NC','9099933242','jferrario@hotmail.com','PASSWORD',0,0),(326,'Adelina','Nabours','EMAIL','80 Pittsford Victor Rd ','9',28070,'Huntersville','Mecklenburg','NC','2162304892','adelina_nabours@gmail.com','PASSWORD',0,0),(327,'Derick','Dhamer','EMAIL','87163 N Main Ave','',10013,'New York','New York','NY','2123044515','ddhamer@cox.net','PASSWORD',0,0),(328,'Jerry','Dallen','EMAIL','393 Lafayette Ave','',23219,'Richmond','Richmond City','VA','8047629576','jerry.dallen@yahoo.com','PASSWORD',0,0),(329,'Leota','Ragel','EMAIL','99 5th Ave ','33',30753,'Trion','Chattooga','GA','7062214243','leota.ragel@gmail.com','PASSWORD',0,0),(330,'Jutta','Amyot','EMAIL','49 N Mays St','',28070,'Huntersville','Mecklenburg','NC','3375151438','jamyot@hotmail.com','PASSWORD',0,0),(331,'Aja','Gehrett','PHONE','993 Washington Ave','',7110,'Nutley','Essex','NJ','9735442677','aja_gehrett@hotmail.com','PASSWORD',0,0),(332,'Kirk','Herritt','EMAIL','88 15th Ave Ne','',13850,'Vestal','Broome','NY','6074073716','kirk.herritt@aol.com','PASSWORD',0,0),(333,'Leonora','Mauson','PHONE','3381 E 40th Ave','',7055,'Passaic','Passaic','NJ','9734122995','leonora@yahoo.com','PASSWORD',0,0),(334,'Winfred','Brucato','PHONE','201 Ridgewood Rd','',28070,'Huntersville','Mecklenburg','NC','2082524552','winfred_brucato@hotmail.com','PASSWORD',0,0),(335,'Tarra','Nachor','PHONE','39 Moccasin Dr','',28070,'Huntersville','Mecklenburg','NC','4154111775','tarra.nachor@cox.net','PASSWORD',0,0),(336,'Corinne','Loder','PHONE','4 Carroll St','',2760,'North Attleboro','Bristol','MA','5089424186','corinne@loder.org','PASSWORD',0,0),(337,'Dulce','Labreche','EMAIL','9581 E Arapahoe Rd','',28070,'Huntersville','Mecklenburg','NC','2483578718','dulce_labreche@yahoo.com','PASSWORD',0,0),(338,'Kate','Keneipp','EMAIL','33 N Michigan Ave','',28070,'Huntersville','Mecklenburg','NC','9203536377','kate_keneipp@yahoo.com','PASSWORD',0,0),(339,'Kaitlyn','Ogg','PHONE','2 S Biscayne Blvd','',21230,'Baltimore','Baltimore City','MD','4106654903','kaitlyn.ogg@gmail.com','PASSWORD',0,0),(340,'Sherita','Saras','PHONE','8 Us Highway 22','',28070,'Huntersville','Mecklenburg','NC','7196691664','sherita.saras@cox.net','PASSWORD',0,0),(341,'Lashawnda','Stuer','EMAIL','7422 Martin Ave ','8',28070,'Huntersville','Mecklenburg','NC','4195888719','lstuer@cox.net','PASSWORD',0,0),(342,'Ernest','Syrop','PHONE','94 Chase Rd','',20785,'Hyattsville','Prince Georges','MD','3019989644','ernest@cox.net','PASSWORD',0,0),(343,'Nobuko','Halsey','EMAIL','8139 I Hwy 10 ','92',2745,'New Bedford','Bristol','MA','5088559887','nobuko.halsey@yahoo.com','PASSWORD',0,0),(344,'Lavonna','Wolny','EMAIL','5 Cabot Rd','',22102,'Mc Lean','Fairfax','VA','7034831970','lavonna.wolny@hotmail.com','PASSWORD',0,0),(345,'Lashaunda','Lizama','PHONE','3387 Ryan Dr','',21076,'Hanover','Anne Arundel','MD','4106782473','llizama@cox.net','PASSWORD',0,0),(346,'Mariann','Bilden','EMAIL','3125 Packer Ave ','9851',28070,'Huntersville','Mecklenburg','NC','5122234791','mariann.bilden@aol.com','PASSWORD',0,0),(347,'Helene','Rodenberger','PHONE','347 Chestnut St','',28070,'Huntersville','Mecklenburg','NC','6234618551','helene@aol.com','PASSWORD',0,0),(348,'Roselle','Estell','PHONE','8116 Mount Vernon Ave','',28070,'Huntersville','Mecklenburg','NC','4195715920','roselle.estell@hotmail.com','PASSWORD',0,0),(349,'Samira','Heintzman','PHONE','8772 Old County Rd ','5410',28070,'Huntersville','Mecklenburg','NC','2063114137','sheintzman@hotmail.com','PASSWORD',0,0),(350,'Margart','Meisel','EMAIL','868 State St ','38',28070,'Huntersville','Mecklenburg','NC','5136172362','margart_meisel@yahoo.com','PASSWORD',0,0),(351,'Kristofer','Bennick','PHONE','772 W River Dr','',28070,'Huntersville','Mecklenburg','NC','8123681511','kristofer.bennick@yahoo.com','PASSWORD',0,0),(352,'Weldon','Acuff','EMAIL','73 W Barstow Ave','',28070,'Huntersville','Mecklenburg','NC','8473532156','wacuff@gmail.com','PASSWORD',0,0),(353,'Shalon','Shadrick','EMAIL','61047 Mayfield Ave','',11223,'Brooklyn','Kings','NY','7182322337','shalon@cox.net','PASSWORD',0,0),(354,'Denise','Patak','EMAIL','2139 Santa Rosa Ave','',32801,'Orlando','Orange','FL','4074464358','denise@patak.org','PASSWORD',0,0),(355,'Louvenia','Beech','PHONE','598 43rd St','',28070,'Huntersville','Mecklenburg','NC','3108202117','louvenia.beech@beech.com','PASSWORD',0,0),(356,'Audry','Yaw','EMAIL','70295 Pioneer Ct','',33511,'Brandon','Hillsborough','FL','8137974816','audry.yaw@yaw.org','PASSWORD',0,0),(357,'Kristel','Ehmann','EMAIL','92899 Kalakaua Ave','',28070,'Huntersville','Mecklenburg','NC','9154521290','kristel.ehmann@aol.com','PASSWORD',0,0),(358,'Vincenza','Zepp','EMAIL','395 S 6th St ','2',28070,'Huntersville','Mecklenburg','NC','6196035125','vzepp@gmail.com','PASSWORD',0,0),(359,'Elouise','Gwalthney','EMAIL','9506 Edgemore Ave','',20710,'Bladensburg','Prince Georges','MD','3018415012','egwalthney@yahoo.com','PASSWORD',0,0),(360,'Venita','Maillard','EMAIL','72119 S Walker Ave ','63',28070,'Huntersville','Mecklenburg','NC','7145236653','venita_maillard@gmail.com','PASSWORD',0,0),(361,'Kasandra','Semidey','EMAIL','369 Latham St ','500',28070,'Huntersville','Mecklenburg','NC','3147329131','kasandra_semidey@semidey.com','PASSWORD',0,0),(362,'Xochitl','Discipio','PHONE','3158 Runamuck Pl','',28070,'Huntersville','Mecklenburg','NC','5122331831','xdiscipio@gmail.com','PASSWORD',0,0),(363,'Maile','Linahan','EMAIL','9 Plainsboro Rd ','598',27409,'Greensboro','Guilford','NC','3366702640','mlinahan@yahoo.com','PASSWORD',0,0),(364,'Krissy','Rauser','EMAIL','8728 S Broad St','',11727,'Coram','Suffolk','NY','6314434710','krauser@cox.net','PASSWORD',0,0),(365,'Pete','Dubaldi','PHONE','2215 Prosperity Dr','',7071,'Lyndhurst','Bergen','NJ','2018252514','pdubaldi@hotmail.com','PASSWORD',0,0),(366,'Linn','Paa','EMAIL','1 S Pine St','',38112,'Memphis','Shelby','TN','9014124381','linn_paa@paa.com','PASSWORD',0,0),(367,'Paris','Wide','EMAIL','187 Market St','',30342,'Atlanta','Fulton','GA','4045054445','paris@hotmail.com','PASSWORD',0,0),(368,'Wynell','Dorshorst','PHONE','94290 S Buchanan St','',28070,'Huntersville','Mecklenburg','NC','6504731262','wynell_dorshorst@dorshorst.org','PASSWORD',0,0),(369,'Quentin','Birkner','PHONE','7061 N 2nd St','',28070,'Huntersville','Mecklenburg','NC','9527027993','qbirkner@aol.com','PASSWORD',0,0),(370,'Regenia','Kannady','EMAIL','10759 Main St','',28070,'Huntersville','Mecklenburg','NC','4807261280','regenia.kannady@cox.net','PASSWORD',0,0),(371,'Sheron','Louissant','EMAIL','97 E 3rd St ','9',11101,'Long Island City','Queens','NY','7189768610','sheron@aol.com','PASSWORD',0,0),(372,'Izetta','Funnell','EMAIL','82 Winsor St ','54',30340,'Atlanta','Dekalb','GA','7708443447','izetta.funnell@hotmail.com','PASSWORD',0,0),(373,'Rodolfo','Butzen','EMAIL','41 Steel Ct','',28070,'Huntersville','Mecklenburg','NC','5072103510','rodolfo@hotmail.com','PASSWORD',0,0),(374,'Zona','Colla','EMAIL','49440 Dearborn St','',28070,'Huntersville','Mecklenburg','NC','2034611949','zona@hotmail.com','PASSWORD',0,0),(375,'Serina','Zagen','EMAIL','7 S Beverly Dr','',28070,'Huntersville','Mecklenburg','NC','2602733725','szagen@aol.com','PASSWORD',0,0),(376,'Paz','Sahagun','PHONE','919 Wall Blvd','',28070,'Huntersville','Mecklenburg','NC','6019278287','paz_sahagun@cox.net','PASSWORD',0,0),(377,'Markus','Lukasik','PHONE','89 20th St E ','779',28070,'Huntersville','Mecklenburg','NC','5869707380','markus@yahoo.com','PASSWORD',0,0),(378,'Jaclyn','Bachman','PHONE','721 Interstate 45 S','',28070,'Huntersville','Mecklenburg','NC','7198533600','jaclyn@aol.com','PASSWORD',0,0),(379,'Cyril','Daufeldt','EMAIL','3 Lawton St','',10013,'New York','New York','NY','2127458484','cyril_daufeldt@daufeldt.com','PASSWORD',0,0),(380,'Gayla','Schnitzler','EMAIL','38 Pleasant Hill Rd','',28070,'Huntersville','Mecklenburg','NC','5106863407','gschnitzler@gmail.com','PASSWORD',0,0),(381,'Erick','Nievas','PHONE','45 E Acacia Ct','',28070,'Huntersville','Mecklenburg','NC','7737049903','erick_nievas@aol.com','PASSWORD',0,0),(382,'Jennie','Drymon','PHONE','63728 Poway Rd ','1',18509,'Scranton','Lackawanna','PA','5702184831','jennie@cox.net','PASSWORD',0,0),(383,'Mitsue','Scipione','EMAIL','77 222 Dr','',28070,'Huntersville','Mecklenburg','NC','5309869272','mscipione@scipione.com','PASSWORD',0,0),(384,'Ciara','Ventura','EMAIL','53 W Carey St','',12771,'Port Jervis','Orange','NY','8458238877','cventura@yahoo.com','PASSWORD',0,0),(385,'Galen','Cantres','PHONE','617 Nw 36th Ave','',28070,'Huntersville','Mecklenburg','NC','2166006111','galen@yahoo.com','PASSWORD',0,0),(386,'Truman','Feichtner','EMAIL','539 Coldwater Canyon Ave','',7003,'Bloomfield','Essex','NJ','9738522736','tfeichtner@yahoo.com','PASSWORD',0,0),(387,'Gail','Kitty','EMAIL','735 Crawford Dr','',28070,'Huntersville','Mecklenburg','NC','9074359166','gail@kitty.com','PASSWORD',0,0),(388,'Dalene','Schoeneck','EMAIL','910 Rahway Ave','',19102,'Philadelphia','Philadelphia','PA','2152681275','dalene@schoeneck.org','PASSWORD',0,0),(389,'Gertude','Witten','EMAIL','7 Tarrytown Rd','',28144,'Salisbury','Rowan','NC','5139777043','gertude.witten@gmail.com','PASSWORD',0,0),(390,'Lizbeth','Kohl','PHONE','35433 Blake St ','588',28144,'Salisbury','Rowan','NC','3106991222','lizbeth@yahoo.com','PASSWORD',0,0),(391,'Glenn','Berray','PHONE','29 Cherry St ','7073',28144,'Salisbury','Rowan','NC','5153707348','gberray@gmail.com','PASSWORD',0,0),(392,'Lashandra','Klang','PHONE','810 N La Brea Ave','',19406,'King of Prussia','Montgomery','PA','6108091818','lashandra@yahoo.com','PASSWORD',0,0),(393,'Lenna','Newville','EMAIL','987 Main St','',27601,'Raleigh','Wake','NC','9196232524','lnewville@newville.com','PASSWORD',0,0),(394,'Laurel','Pagliuca','EMAIL','36 Enterprise St Se','',28144,'Salisbury','Rowan','NC','5096955199','laurel@yahoo.com','PASSWORD',0,0),(395,'Mireya','Frerking','PHONE','8429 Miller Rd','',10803,'Pelham','Westchester','NY','9148685965','mireya.frerking@hotmail.com','PASSWORD',0,0),(396,'Annelle','Tagala','EMAIL','5 W 7th St','',21234,'Parkville','Baltimore','MD','4107571035','annelle@yahoo.com','PASSWORD',0,0),(397,'Dean','Ketelsen','EMAIL','2 Flynn Rd','',11801,'Hicksville','Nassau','NY','5168474418','dean_ketelsen@gmail.com','PASSWORD',0,0),(398,'Levi','Munis','EMAIL','2094 Ne 36th Ave','',1603,'Worcester','Worcester','MA','5084564907','levi.munis@gmail.com','PASSWORD',0,0),(399,'Sylvie','Ryser','EMAIL','649 Tulane Ave','',28144,'Salisbury','Rowan','NC','9186449555','sylvie@aol.com','PASSWORD',0,0),(400,'Sharee','Maile','EMAIL','2094 Montour Blvd','',28144,'Salisbury','Rowan','NC','2314679978','sharee_maile@aol.com','PASSWORD',0,0),(401,'Cordelia','Storment','EMAIL','393 Hammond Dr','',28144,'Salisbury','Rowan','NC','3375666001','cordelia_storment@aol.com','PASSWORD',0,0),(402,'Mollie','Mcdoniel','PHONE','8590 Lake Lizzie Dr','',28144,'Salisbury','Rowan','NC','4199753182','mollie_mcdoniel@yahoo.com','PASSWORD',0,0),(403,'Brett','Mccullan','EMAIL','87895 Concord Rd','',28144,'Salisbury','Rowan','NC','6194619984','brett.mccullan@mccullan.com','PASSWORD',0,0),(404,'Teddy','Pedrozo','EMAIL','46314 Route 130','',28144,'Salisbury','Rowan','NC','2038923863','teddy_pedrozo@aol.com','PASSWORD',0,0),(405,'Tasia','Andreason','EMAIL','4 Cowesett Ave','',7032,'Kearny','Hudson','NJ','2019209002','tasia_andreason@yahoo.com','PASSWORD',0,0),(406,'Hubert','Walthall','PHONE','95 Main Ave ','2',28144,'Salisbury','Rowan','NC','3309031345','hubert@walthall.org','PASSWORD',0,0),(407,'Arthur','Farrow','EMAIL','28 S 7th St ','2824',7631,'Englewood','Bergen','NJ','2012385688','arthur.farrow@yahoo.com','PASSWORD',0,0),(408,'Vilma','Berlanga','PHONE','79 S Howell Ave','',28144,'Salisbury','Rowan','NC','6167373085','vberlanga@berlanga.com','PASSWORD',0,0),(409,'Billye','Miro','EMAIL','36 Lancaster Dr Se','',28144,'Salisbury','Rowan','NC','6015675386','billye_miro@cox.net','PASSWORD',0,0),(410,'Glenna','Slayton','EMAIL','2759 Livingston Ave','',38118,'Memphis','Shelby','TN','9016409178','glenna_slayton@cox.net','PASSWORD',0,0),(411,'Mitzie','Hudnall','PHONE','17 Jersey Ave','',28144,'Salisbury','Rowan','NC','3034021940','mitzie_hudnall@yahoo.com','PASSWORD',0,0),(412,'Bernardine','Rodefer','EMAIL','2 W Grand Ave','',38112,'Memphis','Shelby','TN','9019014726','bernardine_rodefer@yahoo.com','PASSWORD',0,0),(413,'Staci','Schmaltz','EMAIL','18 Coronado Ave ','563',28144,'Salisbury','Rowan','NC','6268662339','staci_schmaltz@aol.com','PASSWORD',0,0),(414,'Nichelle','Meteer','PHONE','72 Beechwood Ter','',28144,'Salisbury','Rowan','NC','7732259985','nichelle_meteer@meteer.com','PASSWORD',0,0),(415,'Janine','Rhoden','EMAIL','92 Broadway','',11103,'Astoria','Queens','NY','7182285894','jrhoden@yahoo.com','PASSWORD',0,0),(416,'Ettie','Hoopengardner','PHONE','39 Franklin Ave','',28144,'Salisbury','Rowan','NC','5097555393','ettie.hoopengardner@hotmail.com','PASSWORD',0,0),(417,'Eden','Jayson','EMAIL','4 Iwaena St','',21202,'Baltimore','Baltimore City','MD','4108907866','eden_jayson@yahoo.com','PASSWORD',0,0),(418,'Lynelle','Auber','PHONE','32820 Corkwood Rd','',7104,'Newark','Essex','NJ','9738608610','lynelle_auber@gmail.com','PASSWORD',0,0),(419,'Merissa','Tomblin','EMAIL','34 Raritan Center Pky','',28144,'Salisbury','Rowan','NC','5625796900','merissa.tomblin@gmail.com','PASSWORD',0,0),(420,'Golda','Kaniecki','EMAIL','6201 S Nevada Ave','',8755,'Toms River','Ocean','NJ','7326289909','golda_kaniecki@yahoo.com','PASSWORD',0,0),(421,'Catarina','Gleich','PHONE','78 Maryland Dr ','146',7834,'Denville','Morris','NJ','9732103994','catarina_gleich@hotmail.com','PASSWORD',0,0),(422,'Virgie','Kiel','EMAIL','76598 Rd  I 95 ','1',28144,'Salisbury','Rowan','NC','3037767548','vkiel@hotmail.com','PASSWORD',0,0),(423,'Jolene','Ostolaza','PHONE','1610 14th St Nw','',23608,'Newport News','Newport News City','VA','7576827116','jolene@yahoo.com','PASSWORD',0,0),(424,'Keneth','Borgman','EMAIL','86350 Roszel Rd','',28144,'Salisbury','Rowan','NC','6029194211','keneth@yahoo.com','PASSWORD',0,0),(425,'Rikki','Nayar','PHONE','1644 Clove Rd','',33155,'Miami','Miami-Dade','FL','3059689487','rikki@nayar.com','PASSWORD',0,0),(426,'Elke','Sengbusch','EMAIL','9 W Central Ave','',28144,'Salisbury','Rowan','NC','6028962993','elke_sengbusch@yahoo.com','PASSWORD',0,0),(427,'Hoa','Sarao','EMAIL','27846 Lafayette Ave','',32759,'Oak Hill','Volusia','FL','3865267800','hoa@sarao.org','PASSWORD',0,0),(428,'Trinidad','Mcrae','PHONE','10276 Brooks St','',28144,'Salisbury','Rowan','NC','4153319634','trinidad_mcrae@yahoo.com','PASSWORD',0,0),(429,'Mari','Lueckenbach','EMAIL','1 Century Park E','',28144,'Salisbury','Rowan','NC','8587939684','mari_lueckenbach@yahoo.com','PASSWORD',0,0),(430,'Selma','Husser','EMAIL','9 State Highway 57 ','22',7306,'Jersey City','Hudson','NJ','2019918369','selma.husser@cox.net','PASSWORD',0,0),(431,'Antione','Onofrio','EMAIL','4 S Washington Ave','',28144,'Salisbury','Rowan','NC','9094307765','aonofrio@onofrio.com','PASSWORD',0,0),(432,'Luisa','Jurney','PHONE','25 Se 176th Pl','',2138,'Cambridge','Middlesex','MA','6173652134','ljurney@hotmail.com','PASSWORD',0,0),(433,'Clorinda','Heimann','EMAIL','105 Richmond Valley Rd','',28144,'Salisbury','Rowan','NC','7602915497','clorinda.heimann@hotmail.com','PASSWORD',0,0),(434,'Dick','Wenzinger','EMAIL','22 Spruce St ','595',28144,'Salisbury','Rowan','NC','3105109713','dick@yahoo.com','PASSWORD',0,0),(435,'Ahmed','Angalich','EMAIL','2 W Beverly Blvd','',17110,'Harrisburg','Dauphin','PA','7175288996','ahmed.angalich@angalich.com','PASSWORD',0,0),(436,'Iluminada','Ohms','EMAIL','72 Southern Blvd','',28144,'Salisbury','Rowan','NC','4802932882','iluminada.ohms@yahoo.com','PASSWORD',0,0),(437,'Joanna','Leinenbach','PHONE','1 Washington St','',33461,'Lake Worth','Palm Beach','FL','5614704574','joanna_leinenbach@hotmail.com','PASSWORD',0,0),(438,'Caprice','Suell','EMAIL','90177 N 55th Ave','',37211,'Nashville','Davidson','TN','6152461824','caprice@aol.com','PASSWORD',0,0),(439,'Stephane','Myricks','EMAIL','9 Tower Ave','',28144,'Salisbury','Rowan','NC','8597177638','stephane_myricks@cox.net','PASSWORD',0,0),(440,'Quentin','Swayze','PHONE','278 Bayview Ave','',28144,'Salisbury','Rowan','NC','7345616170','quentin_swayze@yahoo.com','PASSWORD',0,0),(441,'Annmarie','Castros','PHONE','80312 W 32nd St','',28144,'Salisbury','Rowan','NC','9367517961','annmarie_castros@gmail.com','PASSWORD',0,0),(442,'Shonda','Greenbush','EMAIL','82 Us Highway 46','',7011,'Clifton','Passaic','NJ','9734822430','shonda_greenbush@cox.net','PASSWORD',0,0),(443,'Cecil','Lapage','PHONE','4 Stovall St ','72',7087,'Union City','Hudson','NJ','2016933967','clapage@lapage.com','PASSWORD',0,0),(444,'Jeanice','Claucherty','PHONE','19 Amboy Ave','',33142,'Miami','Miami-Dade','FL','3059884162','jeanice.claucherty@yahoo.com','PASSWORD',0,0),(445,'Josphine','Villanueva','PHONE','63 Smith Ln ','8343',38575,'Moss','Clay','TN','9315539774','josphine_villanueva@villanueva.com','PASSWORD',0,0),(446,'Daniel','Perruzza','PHONE','11360 S Halsted St','',28144,'Salisbury','Rowan','NC','7147713880','dperruzza@perruzza.com','PASSWORD',0,0),(447,'Cassi','Wildfong','PHONE','26849 Jefferson Hwy','',28144,'Salisbury','Rowan','NC','8476333216','cassi.wildfong@aol.com','PASSWORD',0,0),(448,'Britt','Galam','EMAIL','2500 Pringle Rd Se ','508',19440,'Hatfield','Montgomery','PA','2158883304','britt@galam.org','PASSWORD',0,0),(449,'Adell','Lipkin','EMAIL','65 Mountain View Dr','',7981,'Whippany','Morris','NJ','9736541561','adell.lipkin@lipkin.com','PASSWORD',0,0),(450,'Jacqueline','Rowling','EMAIL','1 N San Saba','',16501,'Erie','Erie','PA','8148658113','jacqueline.rowling@yahoo.com','PASSWORD',0,0),(451,'Lonny','Weglarz','EMAIL','51120 State Route 18','',28144,'Salisbury','Rowan','NC','8012939853','lonny_weglarz@gmail.com','PASSWORD',0,0),(452,'Lonna','Diestel','EMAIL','1482 College Ave','',28301,'Fayetteville','Cumberland','NC','9109223672','lonna_diestel@gmail.com','PASSWORD',0,0),(453,'Cristal','Samara','PHONE','4119 Metropolitan Dr','',28144,'Salisbury','Rowan','NC','2139758026','cristal@cox.net','PASSWORD',0,0),(454,'Kenneth','Grenet','EMAIL','2167 Sierra Rd','',28144,'Salisbury','Rowan','NC','5174992322','kenneth.grenet@grenet.org','PASSWORD',0,0),(455,'Elli','Mclaird','PHONE','6 Sunrise Ave','',13501,'Utica','Oneida','NY','3158182638','emclaird@mclaird.com','PASSWORD',0,0),(456,'Alline','Jeanty','PHONE','55713 Lake City Hwy','',28144,'Salisbury','Rowan','NC','5746562800','ajeanty@gmail.com','PASSWORD',0,0),(457,'Sharika','Eanes','PHONE','75698 N Fiesta Blvd','',32806,'Orlando','Orange','FL','4073121691','sharika.eanes@aol.com','PASSWORD',0,0),(458,'Nu','Mcnease','EMAIL','88 Sw 28th Ter','',7029,'Harrison','Hudson','NJ','9737519003','nu@gmail.com','PASSWORD',0,0),(459,'Daniela','Comnick','PHONE','7 Flowers Rd ','403',8611,'Trenton','Mercer','NJ','6092008577','dcomnick@cox.net','PASSWORD',0,0),(460,'Cecilia','Colaizzo','PHONE','4 Nw 12th St ','3849',28144,'Salisbury','Rowan','NC','6083824541','cecilia_colaizzo@colaizzo.com','PASSWORD',0,0),(461,'Leslie','Threets','EMAIL','2 A Kelley Dr','',10536,'Katonah','Westchester','NY','9148619748','leslie@cox.net','PASSWORD',0,0),(462,'Nan','Koppinger','PHONE','88827 Frankford Ave','',27401,'Greensboro','Guilford','NC','3363705333','nan@koppinger.com','PASSWORD',0,0),(463,'Izetta','Dewar','EMAIL','2 W Scyene Rd ','3',21217,'Baltimore','Baltimore City','MD','4104731708','idewar@dewar.com','PASSWORD',0,0),(464,'Tegan','Arceo','PHONE','62260 Park Stre','',8831,'Monroe Township','Middlesex','NJ','7327302692','tegan.arceo@arceo.org','PASSWORD',0,0),(465,'Ruthann','Keener','EMAIL','3424 29th St Se','',28144,'Salisbury','Rowan','NC','8302582769','ruthann@hotmail.com','PASSWORD',0,0),(466,'Joni','Breland','PHONE','35 E Main St ','43',28144,'Salisbury','Rowan','NC','8475195906','joni_breland@cox.net','PASSWORD',0,0),(467,'Vi','Rentfro','EMAIL','7163 W Clark Rd','',7728,'Freehold','Monmouth','NJ','7326054781','vrentfro@cox.net','PASSWORD',0,0),(468,'Colette','Kardas','EMAIL','21575 S Apple Creek Rd','',28144,'Salisbury','Rowan','NC','4028965943','colette.kardas@yahoo.com','PASSWORD',0,0),(469,'Malcolm','Tromblay','PHONE','747 Leonis Blvd','',22003,'Annandale','Fairfax','VA','7032215602','malcolm_tromblay@cox.net','PASSWORD',0,0),(470,'Ryan','Harnos','PHONE','13 Gunnison St','',28144,'Salisbury','Rowan','NC','9725581665','ryan@cox.net','PASSWORD',0,0),(471,'Jess','Chaffins','EMAIL','18 3rd Ave','',10016,'New York','New York','NY','2125104633','jess.chaffins@chaffins.org','PASSWORD',0,0),(472,'Sharen','Bourbon','EMAIL','62 W Austin St','',11791,'Syosset','Nassau','NY','5168161541','sbourbon@yahoo.com','PASSWORD',0,0),(473,'Nickolas','Juvera','PHONE','177 S Rider Trl ','52',34429,'Crystal River','Citrus','FL','3525988301','nickolas_juvera@cox.net','PASSWORD',0,0),(474,'Gary','Nunlee','EMAIL','2 W Mount Royal Ave','',28144,'Salisbury','Rowan','NC','3175426023','gary_nunlee@nunlee.org','PASSWORD',0,0),(475,'Diane','Devreese','PHONE','1953 Telegraph Rd','',28144,'Salisbury','Rowan','NC','8165579673','diane@cox.net','PASSWORD',0,0),(476,'Roslyn','Chavous','EMAIL','63517 Dupont St','',28144,'Salisbury','Rowan','NC','6012349632','roslyn.chavous@chavous.org','PASSWORD',0,0),(477,'Glory','Schieler','EMAIL','5 E Truman Rd','',28159,'Spencer','Rowan','NC','3258692649','glory@yahoo.com','PASSWORD',0,0),(478,'Rasheeda','Sayaphon','PHONE','251 Park Ave ','979',28159,'Spencer','Rowan','NC','4088054309','rasheeda@aol.com','PASSWORD',0,0),(479,'Alpha','Palaia','PHONE','43496 Commercial Dr ','29',8003,'Cherry Hill','Camden','NJ','8563122629','alpha@yahoo.com','PASSWORD',0,0),(480,'Refugia','Jacobos','EMAIL','2184 Worth St','',28159,'Spencer','Rowan','NC','5109748671','refugia.jacobos@jacobos.com','PASSWORD',0,0),(481,'Shawnda','Yori','PHONE','50126 N Plankinton Ave','',32750,'Longwood','Seminole','FL','4075385106','shawnda.yori@yahoo.com','PASSWORD',0,0),(482,'Mona','Delasancha','EMAIL','38773 Gravois Ave','',28159,'Spencer','Rowan','NC','3074031488','mdelasancha@hotmail.com','PASSWORD',0,0),(483,'Gilma','Liukko','PHONE','16452 Greenwich St','',11530,'Garden City','Nassau','NY','5163939967','gilma_liukko@gmail.com','PASSWORD',0,0),(484,'Janey','Gabisi','EMAIL','40 Cambridge Ave','',28159,'Spencer','Rowan','NC','6089677194','jgabisi@hotmail.com','PASSWORD',0,0),(485,'Lili','Paskin','EMAIL','20113 4th Ave E','',7032,'Kearny','Hudson','NJ','2014312989','lili.paskin@cox.net','PASSWORD',0,0),(486,'Loren','Asar','EMAIL','6 Ridgewood Center Dr','',18518,'Old Forge','Lackawanna','PA','5706483035','loren.asar@aol.com','PASSWORD',0,0),(487,'Dorothy','Chesterfield','PHONE','469 Outwater Ln','',28159,'Spencer','Rowan','NC','8586177834','dorothy@cox.net','PASSWORD',0,0),(488,'Gail','Similton','PHONE','62 Monroe St','',28159,'Spencer','Rowan','NC','7606165388','gail_similton@similton.com','PASSWORD',0,0),(489,'Catalina','Tillotson','PHONE','3338 A Lockport Pl ','6',8402,'Margate City','Atlantic','NJ','6093733332','catalina@hotmail.com','PASSWORD',0,0),(490,'Lawrence','Lorens','PHONE','9 Hwy','',2906,'Providence','Providence','RI','4014656432','lawrence.lorens@hotmail.com','PASSWORD',0,0),(491,'Carlee','Boulter','PHONE','8284 Hart St','',28159,'Spencer','Rowan','NC','7853471805','carlee.boulter@hotmail.com','PASSWORD',0,0),(492,'Thaddeus','Ankeny','PHONE','5 Washington St ','1',28159,'Spencer','Rowan','NC','9169203571','tankeny@ankeny.org','PASSWORD',0,0),(493,'Jovita','Oles','PHONE','8 S Haven St','',32114,'Daytona Beach','Volusia','FL','3862484118','joles@gmail.com','PASSWORD',0,0),(494,'Alesia','Hixenbaugh','EMAIL','9 Front St','',20001,'Washington','District of Columbia','DC','2026467516','alesia_hixenbaugh@hixenbaugh.org','PASSWORD',0,0),(495,'Lai','Harabedian','PHONE','1933 Packer Ave ','2',28159,'Spencer','Rowan','NC','4154233294','lai@gmail.com','PASSWORD',0,0),(496,'Brittni','Gillaspie','PHONE','67 Rv Cent','',28159,'Spencer','Rowan','NC','2087091235','bgillaspie@gillaspie.com','PASSWORD',0,0),(497,'Raylene','Kampa','EMAIL','2 Sw Nyberg Rd','',28159,'Spencer','Rowan','NC','5744991454','rkampa@kampa.org','PASSWORD',0,0),(498,'Flo','Bookamer','PHONE','89992 E 15th St','',28159,'Spencer','Rowan','NC','3087262182','flo.bookamer@cox.net','PASSWORD',0,0),(499,'Jani','Biddy','PHONE','61556 W 20th Ave','',28159,'Spencer','Rowan','NC','2067116498','jbiddy@yahoo.com','PASSWORD',0,0),(500,'Chauncey','Motley','PHONE','63 E Aurora Dr','',32804,'Orlando','Orange','FL','4074134842','chauncey_motley@aol.com','PASSWORD',0,0);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pet` (
  `PetID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `PetName` varchar(45) NOT NULL,
  `PetType` varchar(3) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Size` varchar(2) NOT NULL,
  PRIMARY KEY (`PetID`),
  KEY `fk_PetID_Person1_idx` (`PersonID`),
  CONSTRAINT `fk_PetID_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` (`PetID`, `PersonID`, `PetName`, `PetType`, `Gender`, `Size`) VALUES (1,1,'Captain1','Cat','F','XL'),(2,1,'Silky','Cat','M','S'),(3,2,'Columbus','Dog','F','M'),(4,2,'Fido','Cat','F','M'),(5,2,'Kitty','Cat','F','L'),(6,4,'Jake','Cat','M','S'),(7,4,'Jessie','Cat','F','S'),(8,4,'Marcus','Dog','M','M'),(9,5,'Sally','Cat','F','M'),(10,6,'Tom','Cat','F','M'),(12,8,'Joey','Dog','F','M'),(13,9,'Brittany','Dog','F','M'),(14,13,'Piper','Dog','M','M'),(15,14,'Rose','Dog','M','M'),(16,15,'Piper','Dog','M','M'),(17,16,'Rosey','Dog','M','M'),(18,18,'Savannah','Dog','M','M'),(19,19,'Savannah Rose','Dog','M','M'),(20,20,'Bobbie','Dog','M','L'),(21,20,'Billy','Dog','M','L'),(22,20,'Bart','Dog','M','XL'),(23,22,'Sals','Cat','F','M'),(24,23,'Tommie','Cat','F','M'),(25,24,'Pup Pup','Cat','F','M'),(26,25,'Joey','Dog','F','M'),(27,26,'Brittany','Dog','F','M'),(28,27,'Piper','Dog','M','M'),(29,28,'Rose','Dog','M','M'),(30,29,'Piper','Dog','M','M'),(31,30,'Rosey Lane','Dog','M','M'),(32,31,'Savannah','Dog','M','M'),(33,32,'Savannah Rose','Dog','M','M'),(34,33,'Bobbie','Dog','M','L'),(35,33,'Billy','Dog','M','L'),(36,33,'Bart','Dog','M','L'),(37,36,'Spot','Dog','M','S'),(38,38,'Bart','Dog','M','M'),(39,39,'Pete','Dog','M','L'),(40,40,'Susie','Dog','F','L'),(41,41,'Spot','Dog','M','S'),(42,42,'Bart','Dog','M','M'),(43,43,'Pete','Dog','M','L'),(44,44,'Susie','Dog','F','L'),(45,45,'Spot','Dog','M','S'),(46,46,'Bart','Dog','M','M'),(47,47,'Pete','Dog','M','L'),(48,48,'Susie','Dog','F','L'),(49,49,'Spot','Dog','M','S'),(50,50,'Bart','Dog','M','M'),(51,51,'Pete','Dog','M','L'),(52,52,'Susie','Dog','F','L'),(53,58,'Spot','Dog','M','XL'),(54,59,'Bart','Dog','M','M'),(55,60,'Pete','Dog','M','L'),(56,61,'Susie','Dog','F','L'),(57,63,'Spot','Dog','M','S'),(58,64,'Bart','Dog','M','M'),(59,65,'Pete','Dog','M','L'),(60,66,'Susie','Dog','F','L'),(61,67,'Spot','Dog','M','XL'),(62,68,'Bart','Dog','M','M'),(63,69,'Pete','Dog','M','L'),(64,70,'Spot','Dog','M','S'),(65,71,'Bart','Dog','M','M'),(66,72,'Susie','Dog','F','L'),(67,73,'Spot','Dog','M','S'),(68,74,'Spot','Dog','M','S'),(69,75,'Charlotte','Dog','F','S'),(70,79,'Charlotte','Dog','F','S'),(71,81,'Charlotte','Dog','F','S'),(72,84,'Charlotte','Dog','F','S'),(73,85,'Charlotte','Dog','F','S'),(74,86,'Hampton','Dog','M','XL'),(75,87,'Hampton','Dog','M','XL'),(76,88,'Hampton','Dog','M','XL'),(77,89,'Hampton','Dog','M','XL'),(78,91,'Charlotte','Dog','F','S'),(79,92,'Charlotte','Dog','F','S'),(80,93,'Norman','Dog','M','XL'),(81,94,'Norman','Dog','M','XL'),(82,95,'Norman','Dog','M','XL'),(83,96,'Norman','Dog','M','XL'),(84,97,'Norman','Dog','M','XL'),(85,98,'Norman','Dog','M','XL'),(86,100,'Norman','Dog','M','XL'),(87,101,'Norman','Dog','M','XL'),(88,102,'Norman','Dog','M','XL'),(89,103,'Norman','Dog','M','XL'),(90,104,'Norman','Dog','M','XL'),(91,105,'Norman','Dog','M','XL'),(92,107,'Norman','Dog','M','XL'),(93,108,'Norman','Dog','M','XL'),(94,112,'Charlotte','Dog','F','S'),(95,112,'Sam','Dog','M','XL'),(96,112,'Sally','Cat','F','S'),(97,117,'Charlotte','Dog','F','S'),(98,117,'Sammy','Dog','M','XL'),(99,117,'Sal','Cat','F','S'),(100,118,'Charlotte','Dog','F','S'),(101,118,'Sam','Dog','M','XL'),(102,118,'Sally','Cat','F','S'),(103,122,'Charlotte','Dog','F','S'),(104,122,'Sam','Dog','M','XL'),(105,122,'Sally','Cat','F','S'),(106,123,'Charlotte','Dog','F','S'),(107,123,'Sam','Dog','M','XL'),(108,123,'Sally','Cat','F','S'),(109,124,'Charlotte','Dog','F','S'),(110,124,'Sam','Dog','M','XL'),(111,124,'Sally','Cat','F','S'),(112,131,'Harris','Dog','F','S'),(113,131,'Thomas','Dog','M','XL'),(114,131,'Silky','Cat','F','S'),(115,132,'Charlotte','Dog','F','S'),(116,132,'Sam','Dog','M','XL'),(117,132,'Sally','Cat','F','S'),(118,137,'Charlotte','Dog','F','S'),(119,137,'Sam','Dog','M','XL'),(120,137,'Sally','Cat','F','S'),(121,138,'Toonses','Dog','F','S'),(122,138,'Tommy','Dog','M','XL'),(123,138,'Tor','Cat','F','S'),(124,139,'Charlotte','Dog','F','S'),(125,139,'Sam','Dog','M','XL'),(126,139,'Sally','Cat','F','S'),(127,140,'Charlotte','Dog','F','S'),(128,141,'Charlotte','Dog','F','S'),(129,142,'Savannah Rose','Dog','F','S'),(130,143,'Charlotte','Dog','F','S'),(131,145,'Kate','Dog','F','S'),(132,147,'Barcley','Dog','F','S'),(133,148,'Meghan','Dog','F','S'),(134,151,'Harry','Dog','M','S'),(135,152,'William','Dog','M','S'),(136,153,'Charlotte','Dog','F','S'),(137,155,'Charlotte','Dog','F','S'),(138,156,'Atlas','Dog','F','S'),(139,160,'Bert','Dog','F','S'),(140,161,'Burkeley','Dog','F','S'),(141,163,'Cathy','Dog','F','S'),(142,165,'David','Dog','F','S'),(143,166,'Davis','Dog','F','S'),(144,167,'Harry','Dog','M','S'),(145,169,'Harris','Dog','M','S'),(146,170,'Charlotte','Cat','F','S'),(147,171,'Charlotte','Dog','F','S'),(148,177,'Henry','Dog','F','S'),(149,179,'Jack','Dog','M','S'),(152,184,'Darin','Dog','M','S'),(153,185,'Jamies','Dog','M','S'),(154,201,'Ammy','Cat','F','L'),(155,201,'Reba','Cat','M','S'),(156,201,'Harry','Dog','M','L'),(157,201,'Stephony','Cat','F','M'),(158,201,'Kara','Cat','F','S'),(159,201,'James','Dog','M','XL'),(160,201,'Garry','Dog','M','M');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS ADDPET */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`6160_team_member`@`%`*/ /*!50003 TRIGGER ADDPET

AFTER INSERT ON pet

FOR EACH ROW

BEGIN

	UPDATE client

		SET NumberOfPets =

        (SELECT COUNT(PetID) 

		FROM pet,person WHERE client.PersonID = pet.PersonID = person.PersonID

		GROUP BY ClientID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS DROPPET */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`6160_team_member`@`%`*/ /*!50003 TRIGGER DROPPET

AFTER DELETE ON pet

FOR EACH ROW

BEGIN

	UPDATE client

		SET NumberOfPets =

        (SELECT COUNT(PetID) 

		FROM pet,person WHERE client.PersonID = pet.PersonID = person.PersonID

		GROUP BY ClientID);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ratings` (
  `RateingID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Rater` varchar(45) NOT NULL,
  `RaterComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RateingID`),
  KEY `fk_Ratings_Orders1_idx` (`OrderID`),
  CONSTRAINT `fk_Ratings_Orders1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` (`RateingID`, `OrderID`, `Rating`, `Rater`, `RaterComment`) VALUES (1,1,5,'Jim','Took great care of my senior dog'),(2,2,1,'Angry Customer','Left the front door unlocked when they were done'),(3,3,4,'Lenna P.','Was glad to find someone that does daycare for cats'),(4,4,5,'Ms P.','Was able to enjoy my vacation knowing my fur baby was getting taken care of'),(5,5,1,'Rolande','Pretty sure she just kept Silky in her carrier'),(6,6,5,'Nieves','Was a real help while I was recovering from surgery');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `services` (
  `ServiceID` int(11) NOT NULL,
  `ServiceType` varchar(45) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Cost` float NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`ServiceID`, `ServiceType`, `Description`, `Cost`) VALUES (1,'Board','Pet is kept at tech\'s home and cared for overnight.',22),(2,'Visit','Tech visits pet\'s home for care for 1 hour.',8),(3,'Walk','Tech walks pet for 1 hour.',12),(4,'Feed','Tech visits pet\'s home to put out food.',8),(5,'DayCare','Pet is kept at tech\'s home and cared, picked up same day.',15),(6,'Bathe','Tech washes pet. Can be added as a boarding or home visit service.',20),(7,'Shop','Tech picks up shoping list for pet\'s needs.',12),(8,'Medicine','Tech gives pet required medicine. Can be added as a boarding or home visit service.',12);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialneeds`
--

DROP TABLE IF EXISTS `specialneeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specialneeds` (
  `NeedsID` int(11) NOT NULL,
  `PetID` int(11) NOT NULL,
  `NeedDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`NeedsID`),
  KEY `fk_SpecialNeeds_Pet1_idx` (`PetID`),
  CONSTRAINT `fk_SpecialNeeds_Pet1` FOREIGN KEY (`PetID`) REFERENCES `pet` (`PetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialneeds`
--

LOCK TABLES `specialneeds` WRITE;
/*!40000 ALTER TABLE `specialneeds` DISABLE KEYS */;
INSERT INTO `specialneeds` (`NeedsID`, `PetID`, `NeedDescription`) VALUES (1,1,'old'),(2,2,'mean'),(3,3,'puppy'),(4,4,'kitten'),(5,5,'friendly'),(6,10,'declawed'),(7,12,'timid'),(8,14,'doesn\'t like cats'),(9,15,'afraid of thunder'),(10,17,'highly trained'),(11,19,'overweight'),(12,20,'timid'),(13,21,'drools'),(14,22,'diabetic'),(15,24,'timid'),(16,26,'timid'),(17,28,'doesn\'t like cats'),(18,29,'afraid of thunder'),(19,31,'hates leash'),(20,33,'no treats'),(21,34,'timid'),(22,35,'drools'),(23,36,'diabetic');
/*!40000 ALTER TABLE `specialneeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdiscount`
--

DROP TABLE IF EXISTS `studentdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentdiscount` (
  `DiscountID` int(11) NOT NULL,
  `Major` varchar(45) NOT NULL,
  `GraduationDate` date NOT NULL,
  `SchoolName` varchar(45) NOT NULL,
  PRIMARY KEY (`DiscountID`),
  CONSTRAINT `fk_StudentDiscount_Discounts1` FOREIGN KEY (`DiscountID`) REFERENCES `discounts` (`DiscountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdiscount`
--

LOCK TABLES `studentdiscount` WRITE;
/*!40000 ALTER TABLE `studentdiscount` DISABLE KEYS */;
INSERT INTO `studentdiscount` (`DiscountID`, `Major`, `GraduationDate`, `SchoolName`) VALUES (1,'Computer Science','2020-05-15','UNCC'),(2,'Computer Science','2022-05-15','CPCC'),(3,'Computer Science','2020-05-15','UNCC'),(4,'Geography','2020-05-15','UNCC'),(5,'Geography','2018-08-15','UNCC'),(6,'Geography','2020-05-15','UNCC'),(7,'Biology','2020-05-15','UNCC'),(8,'Biology','2020-10-15','CPCC'),(9,'Biology','2019-05-15','UNCC'),(10,'Biology','2020-05-15','UNCC');
/*!40000 ALTER TABLE `studentdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacherdiscount`
--

DROP TABLE IF EXISTS `teacherdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacherdiscount` (
  `DiscountID` int(11) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `SchoolName` varchar(45) NOT NULL,
  `Coach` tinyint(1) NOT NULL,
  PRIMARY KEY (`DiscountID`),
  CONSTRAINT `fk_TeacherDiscount_Discounts1` FOREIGN KEY (`DiscountID`) REFERENCES `discounts` (`DiscountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacherdiscount`
--

LOCK TABLES `teacherdiscount` WRITE;
/*!40000 ALTER TABLE `teacherdiscount` DISABLE KEYS */;
INSERT INTO `teacherdiscount` (`DiscountID`, `Position`, `SchoolName`, `Coach`) VALUES (11,'PROFESSOR','UNCC',0),(12,'PROFESSOR','CPCC',1),(13,'PROFESSOR','UNCC',0),(14,'PROFESSOR','CPCC',0),(15,'PROFESSOR','CPCC',1);
/*!40000 ALTER TABLE `teacherdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech`
--

DROP TABLE IF EXISTS `tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tech` (
  `PersonID` int(11) NOT NULL,
  `TechID` int(11) NOT NULL AUTO_INCREMENT,
  `SSN` varchar(9) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Certified` tinyint(1) NOT NULL,
  `Available` varchar(45) NOT NULL,
  `DateHired` date NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Preference` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `TechID_UNIQUE` (`TechID`),
  CONSTRAINT `fk_Tech_Person1` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech`
--

LOCK TABLES `tech` WRITE;
/*!40000 ALTER TABLE `tech` DISABLE KEYS */;
INSERT INTO `tech` (`PersonID`, `TechID`, `SSN`, `Title`, `Certified`, `Available`, `DateHired`, `Rating`, `Preference`) VALUES (281,1,'728352119','VET TECH',1,'SUN,WED,THU','2018-02-01',NULL,'CAT'),(283,2,'169415194','TECH',0,'SAT,SUN,FRI','2018-01-01',NULL,'CAT'),(285,3,'864017208','VET TECH',1,'SUN,TUE,WED,THU','2018-03-29',NULL,'BOTH'),(286,4,'658804894','TECH',1,'SAT,TUE,FRI','2018-05-07',NULL,'BOTH'),(287,5,'132621920','TECH',1,'SAT,SUN,WED,THU','2018-03-04',NULL,'BOTH'),(291,6,'245938504','VET (RETIRED)',1,'ALL','2018-02-02',NULL,'BOTH'),(292,7,'331090841','TECH',1,'SAT,TUE,WED','2018-01-12',NULL,'BOTH'),(293,8,'677981762','VET TECH',1,'MON,TUE,WED,FRI','2018-02-19',NULL,'DOG'),(296,9,'399949754','VET TECH',1,'SAT,SUN','2018-03-03',NULL,'CAT'),(298,10,'554369946','TECH',1,'SUN,MON,TUE','2018-02-25',NULL,'DOG'),(300,11,'780065006','TECH',0,'SAT,TUE,WED','2018-05-02',NULL,'BOTH'),(301,12,'384025068','TECH',0,'SAT,MON,TUE,WED,FRI','2018-03-15',NULL,'BOTH'),(304,13,'599554493','TECH',1,'SAT,SUN,MON','2018-01-28',NULL,'BOTH'),(374,14,'213281902','TECH',0,'SUN,MON,TUE,THU','2018-03-15',NULL,'BOTH');
/*!40000 ALTER TABLE `tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'roverdb6160'
--
/*!50003 DROP FUNCTION IF EXISTS `count_discounts_of_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tconners087`@`%` FUNCTION `count_discounts_of_type`(discount_type text) RETURNS int(11)
    READS SQL DATA
BEGIN
RETURN (SELECT count(*) FROM roverdb6160.discounts
		WHERE DiscountType LIKE discount_type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `AddNewClient`(
IN NewFName VARCHAR(45),
IN NewLName VARCHAR(45),
IN NewPreferredContact VARCHAR(5),
IN NewStreetName VARCHAR(50),
IN NewApartment VARCHAR(10),
IN NewZipcode INT,
IN NewCity VARCHAR(45),
IN NewCounty VARCHAR(45),
IN NewPhone VARCHAR(10),
IN NewEmail VARCHAR(50),
IN NewPassword VARCHAR(50))
BEGIN
	SET @NewPersonID = ((SELECT MAX(PersonID) FROM person)+1),
	@NewFName = NewFName,
	@NewLName = NewLName,
	@NewPreferredContact = NewPreferredContact,
	@NewStreetName = NewStreetName,
	@NewApartment = NewApartment,
	@NewZipcode = NewZipcode,
	@NewCity = NewCity,
	@NewCounty = NewCounty,
	@NewPhone = NewPhone,
	@NewEmail = NewEmail,
	@NewPassword = NewPassword;
	SET SQL_SAFE_UPDATES = 0;
	INSERT INTO person (PersonID,FName,LName,PreferredContact,StreetName,Apartment,Zipcode,City,County,State,Phone,Email,Password)
	VALUES (@NewPersonID,@NewFName,@NewLName,@NewPreferredContact,@NewStreetName,
	@NewApartment,@NewZipcode,@NewCity,@NewCounty,'NC',@NewPhone,@NewEmail,@NewPassword);
	INSERT INTO client (PersonID,DateJoined)
	VALUES (@NewPersonID,CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewTECH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `AddNewTECH`(
IN NewFName VARCHAR(45),
IN NewLName VARCHAR(45),
IN NewPreferredContact VARCHAR(5),
IN NewStreetName VARCHAR(50),
IN NewApartment VARCHAR(10),
IN NewZipcode INT,
IN NewCity VARCHAR(45),
IN NewCounty VARCHAR(45),
IN NewPhone VARCHAR(10),
IN NewEmail VARCHAR(50),
IN NewPassword VARCHAR(50),
IN NewSSN VARCHAR(9),
IN NewTitle VARCHAR(45),
IN NewCertified TINYINT(1),
IN NewAvailable VARCHAR(45),
IN NewPreference VARCHAR(4))
BEGIN
	SET @NewPersonID = ((SELECT MAX(PersonID) FROM person)+1),
	@NewFName = NewFName,
	@NewLName = NewLName,
	@NewPreferredContact = NewPreferredContact,
	@NewStreetName = NewStreetName,
	@NewApartment = NewApartment,
	@NewZipcode = NewZipcode,
	@NewCity = NewCity,
	@NewCounty = NewCounty,
	@NewPhone = NewPhone,
	@NewEmail = NewEmail,
	@NewPassword = NewPassword,
  	@NewSSN = NewSSN,
  	@NewTitle = NewTitle,
  	@NewCertified = NewCertified,
  	@NewAvailable = NewAvailable,
  	@NewPreference = NewPreference;
	SET SQL_SAFE_UPDATES = 0;
	INSERT INTO person (PersonID,FName,LName,PreferredContact,StreetName,Apartment,Zipcode,City,County,State,Phone,Email,Password)
	VALUES (@NewPersonID,@NewFName,@NewLName,@NewPreferredContact,@NewStreetName,
	@NewApartment,@NewZipcode,@NewCity,@NewCounty,'NC',@NewPhone,@NewEmail,@NewPassword);
	INSERT INTO tech (PersonID,SSN,Title,Certified,Available,DateHired,Preference)
	VALUES (@NewPersonID,@NewSSN,@NewTitle,@NewCertified,@NewAvailable,CURDATE(),@NewPreference);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_pet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `add_pet`(
	IN ClientEmail VARCHAR(50),
	IN NewPetName VARCHAR(45),
	IN NewPetType VARCHAR(3),
	IN NewGender VARCHAR(1),
  IN NewSize VARCHAR(2),
  IN NewNeed VARCHAR(255))
BEGIN
	SET @ClientEmail = ClientEmail,
  @ClientID = (SELECT PersonID FROM person WHERE person.Email = @ClientEmail),
  @PetName = NewPetName,
  @PetType = NewPetType,
  @Gender = NewGender,
	@NewPetID = ((SELECT MAX(PetID) FROM pet)+1),
  @Size = NewSize,
  @NewNeedsID = ((SELECT MAX(NeedsID) FROM specialneeds)+1),
  @NewNeed = NewNeed;
  SET SQL_SAFE_UPDATES = 0;
	INSERT INTO pet(PetID,PersonID,PetName,PetType,Gender,Size)
	VALUES (@NewPetID,@ClientID,@PetName,@PetType,@Gender,@Size);
	INSERT INTO specialneeds(NeedsID,PetID,NeedDescription)
  VALUES (@NewNeedsID,@NewPetID,@NewNeed);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `add_rating`(
	IN NewOrderID INT,
	IN NewRating INT,
	IN NewRater VARCHAR(45),
	IN NewRaterComment VARCHAR(255))
BEGIN
	SET @NewRateingID = ((SELECT MAX(RateingID) FROM ratings) +1),
	@NewOrderID = NewOrderID,
	@NewRating = NewRating,
	@NewRater = NewRater,
	@NewRaterComment = NewRaterComment;
	SET SQL_SAFE_UPDATES = 0;
	INSERT INTO ratings(RateingID,OrderID,Rating,Rater,RaterComment)
	VALUES (@NewRateingID,@NewOrderID,@NewRating,@NewRater,@NewRaterComment);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `add_student`(
	IN StudentEmail VARCHAR(50),
	IN SchoolName VARCHAR(50),
	IN GraduationDate DATE,
	IN Major VARCHAR(50))
BEGIN
	SET @StudentEmail = StudentEmail,
    @SchoolName = SchoolName,
    @GraduationDate = GraduationDate,
    @Major = Major,
	@NewDiscountID = ((SELECT MAX(DiscountID) FROM discounts)+1);
    SET SQL_SAFE_UPDATES = 0;
	INSERT INTO discounts(DiscountID,DiscountType,DiscountAmount)
	VALUES (@NewDiscountID,'STUDENT', 10);
	UPDATE client 
	SET DiscountID = @NewDiscountID
	WHERE client.PersonID = (SELECT PersonID FROM person WHERE Email = @StudentEmail);
	INSERT INTO studentdiscount(DiscountID,Major,GraduationDate,SchoolName)
	VALUES (@NewDiscountID,@Major,@GraduationDate,@SchoolName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_teacher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `add_teacher`(
	IN teacherEmail VARCHAR(50),
	IN SchoolName VARCHAR(50),
	IN Position DATE,
	IN Coach VARCHAR(50))
BEGIN
	SET @StudentEmail = StudentEmail,
    @SchoolName = SchoolName,
    @Position = Position,
    @Coach = Coach,
	@NewDiscountID = ((SELECT MAX(DiscountID) FROM discounts)+1);
    SET SQL_SAFE_UPDATES = 0;
	INSERT INTO discounts(DiscountID,DiscountType,DiscountAmount)
	VALUES (@NewDiscountID,'STUDENT', 10);
	UPDATE client 
	SET DiscountID = @NewDiscountID
	WHERE client.PersonID = (SELECT PersonID FROM person WHERE Email = @StudentEmail);
	INSERT INTO teacherdiscount(DiscountID,SchoolName,Position,Coach)
	VALUES (@NewDiscountID,@SchoolName,@Position,@Coach);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpgradeClientToTech` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `UpgradeClientToTech`(
IN ClientEmail VARCHAR(50),
IN NewSSN VARCHAR(9),
IN NewTitle VARCHAR(45),
IN NewCertified TINYINT(1),
IN NewAvailable VARCHAR(45),
IN NewPreference VARCHAR(4))
BEGIN
	SET @ClientEmail = ClinetEmail,
  @NewSSN = NewSSN,
  @NewTitle = NewTitle,
  @NewCertified = NewCertified,
  @NewAvailable = NewAvailable,
  @NewPreference = NewPreference,
  @PersonID = (SELECT PersonID FROM person WHERE person.Email = @ClientEmail);
  SET SQL_SAFE_UPDATES = 0;
	INSERT INTO tech (PersonID,SSN,Title,Certified,Available,DateHired,Preference)
	VALUES (@PersonID,@NewSSN,@NewTitle,@NewCertified,@NewAvailable,CURDATE(),@NewPreference);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpgradeTechToClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`6160_team_member`@`%` PROCEDURE `UpgradeTechToClient`(
IN TechEmail VARCHAR(50))
BEGIN
	SET @TechEmail = TechEmail,
	@PersonID = (SELECT PersonID FROM person WHERE person.Email = @TechEmail);
	SET SQL_SAFE_UPDATES = 0;
	INSERT INTO client (PersonID,DateJoined)
	VALUES (@PersonID,CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ClientList`
--

/*!50001 DROP VIEW IF EXISTS `ClientList`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ClientList` AS select `client`.`ClientID` AS `Client ID`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Client's Name`,`client`.`NumberOfPets` AS `Number of Pets`,`client`.`DateJoined` AS `Joined on` from (`client` join `person`) where (`client`.`PersonID` = `person`.`PersonID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ClientsWithDiscounts`
--

/*!50001 DROP VIEW IF EXISTS `ClientsWithDiscounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ClientsWithDiscounts` AS select `client`.`ClientID` AS `Client ID`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Client's Name`,`discounts`.`DiscountType` AS `Discount Type`,`discounts`.`DiscountAmount` AS `Discount Amount (%)`,`client`.`NumberOfPets` AS `# of Pets` from ((`client` join `person` on((`person`.`PersonID` = `client`.`PersonID`))) join `discounts`) where (`client`.`DiscountID` = `discounts`.`DiscountID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NeedToBeCertified`
--

/*!50001 DROP VIEW IF EXISTS `NeedToBeCertified`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `NeedToBeCertified` AS select `tech`.`TechID` AS `Tech ID`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Tech's Name`,`tech`.`DateHired` AS `Hired On` from (`person` join `tech`) where ((`tech`.`PersonID` = `person`.`PersonID`) and (`tech`.`Certified` = 0)) order by `tech`.`DateHired` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PetsWithSpecialNeeds`
--

/*!50001 DROP VIEW IF EXISTS `PetsWithSpecialNeeds`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PetsWithSpecialNeeds` AS select `pet`.`PetID` AS `Pet ID`,`pet`.`PetName` AS `Pet's Name`,`pet`.`PetType` AS `Pet Type`,(case when (`pet`.`Gender` = 'M') then 'Male' else 'Female' end) AS `Gender`,`specialneeds`.`NeedDescription` AS `Pet Notes`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Owner` from ((`pet` join `specialneeds`) join `person`) where ((`pet`.`PetID` = `specialneeds`.`PetID`) and (`pet`.`PersonID` = `person`.`PersonID`)) order by `pet`.`PetType`,`pet`.`PetID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TechAvailability`
--

/*!50001 DROP VIEW IF EXISTS `TechAvailability`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TechAvailability` AS select `tech`.`TechID` AS `Tech ID`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Tech's Name`,(case when ((`tech`.`Available` like '%MON%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Monday`,(case when ((`tech`.`Available` like '%TUE%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Tuesday`,(case when ((`tech`.`Available` like '%WED%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Wednesday`,(case when ((`tech`.`Available` like '%THU%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Thursday`,(case when ((`tech`.`Available` like '%FRI%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Friday`,(case when ((`tech`.`Available` like '%SAT%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Saturday`,(case when ((`tech`.`Available` like '%SUN%') or (`tech`.`Available` = 'ALL')) then 'X' else '' end) AS `Sunday`,`tech`.`Preference` AS `Preference` from (`person` join `tech`) where (`tech`.`PersonID` = `person`.`PersonID`) order by `tech`.`Preference`,`tech`.`Available` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TechOrderHistory`
--

/*!50001 DROP VIEW IF EXISTS `TechOrderHistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TechOrderHistory` AS select `tech`.`TechID` AS `Tech ID`,concat(`person`.`FName`,' ',`person`.`LName`) AS `Tech's Name`,`person`.`Phone` AS `Phone`,concat(`orders`.`StartDate`,' to ',`orders`.`EndDate`) AS `Duration` from ((`orders` join `tech` on((`orders`.`TechID` = `tech`.`TechID`))) join `person`) where (`tech`.`PersonID` = `person`.`PersonID`) order by `tech`.`TechID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TechTasksByOrder`
--

/*!50001 DROP VIEW IF EXISTS `TechTasksByOrder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`6160_team_member`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TechTasksByOrder` AS select `orders`.`OrderID` AS `Order ID`,(select concat(`person`.`FName`,' ',`person`.`LName`) from `person` where (`person`.`PersonID` = (select `tech`.`PersonID` from `tech` where (`tech`.`TechID` = `orders`.`TechID`)))) AS `Tech's Name`,(select concat(`person`.`FName`,' ',`person`.`LName`) from `person` where (`person`.`PersonID` = (select `pet`.`PersonID` from `pet` where (`pet`.`PetID` = `orders`.`PetID`)))) AS `Client's Name`,(select `person`.`StreetName` from `person` where (`person`.`PersonID` = (select `pet`.`PersonID` from `pet` where (`pet`.`PetID` = `orders`.`PetID`)))) AS `Client's Address`,(select concat(`pet`.`PetName`,' (',`pet`.`PetType`,')') from `pet` where (`pet`.`PetID` = `orders`.`PetID`)) AS `Pet's Name`,group_concat(distinct `services`.`ServiceType` separator ', ') AS `Duty`,`orders`.`StartDate` AS `Start Order`,`orders`.`EndDate` AS `End Order` from ((((`services` join `orders`) join `orderservices`) join `person`) join `tech`) where ((`services`.`ServiceID` = `orderservices`.`ServiceID`) and (`orders`.`OrderID` = `orderservices`.`OrderID`)) group by `orders`.`OrderID` */;
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

-- Dump completed on 2018-06-25  0:02:15
