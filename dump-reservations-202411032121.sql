-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: reservations
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'city express'),(2,'Ibis'),(3,'Marriot');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_available`
--

DROP TABLE IF EXISTS `room_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_available` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `room_type_id` int NOT NULL,
  `available_date` date NOT NULL,
  `available_inventory` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_available_hotels_FK` (`hotel_id`),
  KEY `room_available_rooms_types_FK` (`room_type_id`),
  CONSTRAINT `room_available_hotels_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `room_available_rooms_types_FK` FOREIGN KEY (`room_type_id`) REFERENCES `rooms_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_available`
--

LOCK TABLES `room_available` WRITE;
/*!40000 ALTER TABLE `room_available` DISABLE KEYS */;
INSERT INTO `room_available` VALUES (1,1,1,'2024-11-02',18),(2,1,1,'2024-11-03',18),(3,1,1,'2024-11-04',18),(4,1,1,'2024-11-05',0),(5,1,1,'2024-11-06',18),(6,1,1,'2024-11-07',18),(7,1,1,'2024-11-08',18),(8,1,1,'2024-11-09',18),(9,1,2,'2024-11-02',12),(10,1,2,'2024-11-03',12),(11,1,2,'2024-11-04',12),(12,1,2,'2024-11-05',0),(13,1,2,'2024-11-06',12),(14,1,2,'2024-11-07',12),(15,1,2,'2024-11-08',12),(16,1,2,'2024-11-09',12),(17,1,3,'2024-11-02',3),(18,1,3,'2024-11-03',3),(19,1,3,'2024-11-04',3),(20,1,3,'2024-11-05',0),(21,1,3,'2024-11-06',3),(22,1,3,'2024-11-07',3),(23,1,3,'2024-11-08',3),(24,1,3,'2024-11-09',3),(25,2,1,'2024-11-02',8),(26,2,1,'2024-11-03',7),(27,2,1,'2024-11-04',8),(28,2,1,'2024-11-05',8),(29,2,1,'2024-11-06',0),(30,2,1,'2024-11-07',8),(31,2,1,'2024-11-08',8),(32,2,1,'2024-11-09',8),(33,2,2,'2024-11-02',5),(34,2,2,'2024-11-03',5),(35,2,2,'2024-11-04',5),(36,2,2,'2024-11-05',5),(37,2,2,'2024-11-06',0),(38,2,2,'2024-11-07',5),(39,2,2,'2024-11-08',5),(40,2,2,'2024-11-09',5),(41,2,3,'2024-11-02',2),(42,2,3,'2024-11-03',2),(43,2,3,'2024-11-04',2),(44,2,3,'2024-11-05',2),(45,2,3,'2024-11-06',0),(46,2,3,'2024-11-07',2),(47,2,3,'2024-11-08',2),(48,2,3,'2024-11-09',2),(49,3,1,'2024-11-02',0),(50,3,1,'2024-11-03',10),(51,3,1,'2024-11-04',10),(52,3,1,'2024-11-05',10),(53,3,1,'2024-11-06',10),(54,3,1,'2024-11-07',10),(55,3,1,'2024-11-08',10),(56,3,1,'2024-11-09',0),(57,3,2,'2024-11-02',0),(58,3,2,'2024-11-03',7),(59,3,2,'2024-11-04',7),(60,3,2,'2024-11-05',7),(61,3,2,'2024-11-06',7),(62,3,2,'2024-11-07',7),(63,3,2,'2024-11-08',7),(64,3,2,'2024-11-09',0),(65,3,3,'2024-11-02',0),(66,3,3,'2024-11-03',1),(67,3,3,'2024-11-04',1),(68,3,3,'2024-11-05',1),(69,3,3,'2024-11-06',1),(70,3,3,'2024-11-07',1),(71,3,3,'2024-11-08',1),(72,3,3,'2024-11-09',0);
/*!40000 ALTER TABLE `room_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms_inventory`
--

DROP TABLE IF EXISTS `rooms_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `room_type_id` int NOT NULL,
  `rooms_total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_prices_hotels_FK` (`hotel_id`),
  KEY `rooms_prices_rooms_types_FK` (`room_type_id`),
  CONSTRAINT `rooms_prices_hotels_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `rooms_prices_rooms_types_FK` FOREIGN KEY (`room_type_id`) REFERENCES `rooms_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms_inventory`
--

LOCK TABLES `rooms_inventory` WRITE;
/*!40000 ALTER TABLE `rooms_inventory` DISABLE KEYS */;
INSERT INTO `rooms_inventory` VALUES (1,1,1,13),(2,1,2,14),(3,1,3,15),(4,2,1,14),(5,2,2,16),(6,2,3,18),(7,3,1,15),(8,3,2,18),(9,3,3,21);
/*!40000 ALTER TABLE `rooms_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms_price`
--

DROP TABLE IF EXISTS `rooms_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `room_type_id` int NOT NULL,
  `price_per_night` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_price_hotels_FK` (`hotel_id`),
  KEY `rooms_price_rooms_types_FK` (`room_type_id`),
  CONSTRAINT `rooms_price_hotels_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `rooms_price_rooms_types_FK` FOREIGN KEY (`room_type_id`) REFERENCES `rooms_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms_price`
--

LOCK TABLES `rooms_price` WRITE;
/*!40000 ALTER TABLE `rooms_price` DISABLE KEYS */;
INSERT INTO `rooms_price` VALUES (1,1,1,800.00),(2,1,2,1200.00),(3,1,3,3000.00),(4,2,1,800.00),(5,2,2,1200.00),(6,2,3,3000.00),(7,3,1,800.00),(8,3,2,1200.00),(9,3,3,3000.00);
/*!40000 ALTER TABLE `rooms_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms_types`
--

DROP TABLE IF EXISTS `rooms_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms_types`
--

LOCK TABLES `rooms_types` WRITE;
/*!40000 ALTER TABLE `rooms_types` DISABLE KEYS */;
INSERT INTO `rooms_types` VALUES (1,'sencilla'),(2,'doble'),(3,'presidencial');
/*!40000 ALTER TABLE `rooms_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `adult_total` int NOT NULL,
  `child_total` int NOT NULL,
  `hotel_id` int NOT NULL,
  `room_type_id` int NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `status` enum('confirmed','cancelled','completed') NOT NULL DEFAULT 'confirmed',
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_hotels_FK` (`hotel_id`),
  KEY `sale_rooms_types_FK` (`room_type_id`),
  CONSTRAINT `sale_hotels_FK` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `sale_rooms_types_FK` FOREIGN KEY (`room_type_id`) REFERENCES `rooms_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'John Cena',1,0,2,1,'2024-11-03','2024-11-04','confirmed',800.00);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'reservations'
--
/*!50003 DROP PROCEDURE IF EXISTS `Get_Available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Get_Available`(in hotelId int,roomTypeId int, availableDate Date)
BEGIN
	IF hotelId = 0 and roomTypeId=0 THEN
		select ra.id,ra.hotel_id,ra.room_type_id 
		,ra.available_date ,ra.available_inventory 
		from room_available ra
		where ra.available_date = availableDate;
	ELSE
		select ra.id,ra.hotel_id,ra.room_type_id 
		,ra.available_date ,ra.available_inventory 
		from room_available ra
		where ra.hotel_id = hotelId 
		and ra.room_type_id = roomTypeId
		and ra.available_date = availableDate;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Available_Range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Get_Available_Range`(in hotelId int,roomTypeId int, availableDate Date, DepDate Date)
BEGIN
	IF hotelId = 0 and roomTypeId=0 THEN
		select ra.id,ra.hotel_id,ra.room_type_id 
		,ra.available_date ,ra.available_inventory 
		from room_available ra
		where ra.available_date >= availableDate
		and ra.available_date <=DepDate;
	ELSE
		select ra.id,ra.hotel_id,ra.room_type_id 
		,ra.available_date ,ra.available_inventory 
		from room_available ra
		where ra.hotel_id = hotelId 
		and ra.room_type_id = roomTypeId
		and ra.available_date >= availableDate
		and ra.available_date <DepDate;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Hotels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Get_Hotels`(IN HotelName VARCHAR(100)
)
BEGIN
    IF HotelName is null or HotelName = '' THEN
        SELECT h.id,h.name FROM hotels h;
    ELSE
        SELECT h.id,h.name FROM hotels h
        WHERE h.name LIKE CONCAT('%', HotelName, '%');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Set_Available_Range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Set_Available_Range`(in hotelId int,roomTypeId int, availableDate Date, DepDate Date, amount int)
BEGIN
	IF hotelId > 0 and roomTypeId>0 THEN
		
		UPDATE room_available SET 
		available_inventory = available_inventory -amount
		where hotel_id = hotelId 
		and room_type_id = roomTypeId
		and available_date >= availableDate
		and available_date <DepDate;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Set_DecreaseRoomInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Set_DecreaseRoomInventory`(IN hotelId INT,
    IN roomId INT,
    IN quantity INT
)
BEGIN
    DECLARE available_rooms INT;

    -- Verificar el inventario disponible
    SELECT rooms_total INTO available_rooms
    FROM rooms_inventory
    WHERE hotel_id = hotelId  AND room_type_id = roomId;

    -- Si hay suficiente inventario, actualizar el inventario disponible
    IF available_rooms >= quantity THEN
        UPDATE rooms_inventory 
        SET rooms_total = available_rooms - quantity
        WHERE hotel_id = hotelId  AND room_type_id = roomId;
    ELSE
        -- En caso de inventario insuficiente, se lanza un error
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Inventario insuficiente para la fecha seleccionada.';
    END IF;
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

-- Dump completed on 2024-11-03 21:21:15
