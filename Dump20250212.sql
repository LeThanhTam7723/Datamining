CREATE DATABASE  IF NOT EXISTS `ttlttbdd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ttlttbdd`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ttlttbdd
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_cart`),
  UNIQUE KEY `unique_user_cart` (`id_user`),
  CONSTRAINT `users_cart_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id_cart_detail` int NOT NULL AUTO_INCREMENT,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_cart_detail`),
  KEY `cart_cart_detail_fk` (`id_cart`),
  KEY `product_cart_detail_fk` (`id_product`),
  CONSTRAINT `cart_cart_detail_fk` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id_cart`),
  CONSTRAINT `product_cart_detail_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'áo ngắn tay','aongantay.png'),(3,'áo dài tay','aodaitay.png'),(4,'áo sơ mi','aosomi.png'),(6,'hoody','hoody.png'),(7,'vest','vest.png'),(9,'quần short','quanshort.png'),(10,'quàn jean','quanjean.png'),(11,'váy','vay.png'),(14,'quần kaki','quankaki.png'),(15,'áo ba lỗ','aobalo.png'),(48,'update category','default_avatar.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id_favorite` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id_favorite`),
  KEY `users_favorite_fk` (`id_user`),
  KEY `product_favorite_fk` (`id_product`),
  CONSTRAINT `product_favorite_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  CONSTRAINT `users_favorite_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (1,2,4),(5,2,8),(9,1,1),(17,1,5),(20,1,33),(22,1,23),(23,1,35),(24,1,37),(33,1,39),(36,3,24),(38,42,1),(40,46,5);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oder_details`
--

DROP TABLE IF EXISTS `oder_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oder_details` (
  `id_order_detail` int NOT NULL AUTO_INCREMENT,
  `id_oder` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `totalprice` double NOT NULL,
  PRIMARY KEY (`id_order_detail`),
  KEY `oders_oder_details_fk` (`id_oder`),
  KEY `product_oder_details_fk` (`id_product`),
  CONSTRAINT `oders_oder_details_fk` FOREIGN KEY (`id_oder`) REFERENCES `oders` (`id_oder`),
  CONSTRAINT `product_oder_details_fk` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oder_details`
--

LOCK TABLES `oder_details` WRITE;
/*!40000 ALTER TABLE `oder_details` DISABLE KEYS */;
INSERT INTO `oder_details` VALUES (1,7,6,200,20000000),(2,7,7,200,20000000),(3,7,10,200,20000000),(4,8,5,200,20000000),(5,8,6,200,20000000),(6,9,9,196,19600000),(7,9,41,199,19900000),(8,10,5,2,200000),(9,10,9,2,200000),(10,10,12,2,200000),(11,10,19,2,200000),(12,10,35,1,100000),(13,11,6,1,100000),(14,11,8,1,100000),(15,12,6,2,200000),(16,12,14,1,100000),(17,13,6,1,100000),(18,14,6,1,100000),(19,15,6,5,500000),(20,15,7,1,100000),(21,16,6,2,200000),(22,16,5,3,300000),(23,17,6,1,100000),(24,18,5,1,100000),(25,19,41,1,100000),(26,20,6,3,300000),(27,20,5,1,100000);
/*!40000 ALTER TABLE `oder_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oders`
--

DROP TABLE IF EXISTS `oders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oders` (
  `id_oder` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dateOrder` date NOT NULL,
  `id_payment_methop` int NOT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_oder`),
  KEY `users_oders_fk` (`id_user`),
  KEY `payment_methops_oders_fk` (`id_payment_methop`),
  KEY `status_oders_fk` (`id_status`),
  CONSTRAINT `payment_methops_oders_fk` FOREIGN KEY (`id_payment_methop`) REFERENCES `payment_methops` (`id_payment_methop`),
  CONSTRAINT `status_oders_fk` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `users_oders_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oders`
--

LOCK TABLES `oders` WRITE;
/*!40000 ALTER TABLE `oders` DISABLE KEYS */;
INSERT INTO `oders` VALUES (7,1,'2025-01-03',1,8),(8,1,'2025-01-03',1,7),(9,2,'2025-01-03',1,5),(10,1,'2025-01-03',1,5),(11,1,'2025-01-04',1,5),(12,1,'2025-01-04',1,6),(13,1,'2025-01-05',1,5),(14,1,'2025-01-05',1,5),(15,1,'2025-01-05',1,5),(16,1,'2025-01-07',1,5),(17,1,'2025-01-07',1,5),(18,1,'2025-01-07',2,5),(19,40,'2025-01-07',1,5),(20,46,'2025-01-07',1,5);
/*!40000 ALTER TABLE `oders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methops`
--

DROP TABLE IF EXISTS `payment_methops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methops` (
  `id_payment_methop` int NOT NULL AUTO_INCREMENT,
  `type_payment` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_payment_methop`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methops`
--

LOCK TABLES `payment_methops` WRITE;
/*!40000 ALTER TABLE `payment_methops` DISABLE KEYS */;
INSERT INTO `payment_methops` VALUES (1,'COD'),(2,'banking'),(3,'QRCode');
/*!40000 ALTER TABLE `payment_methops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `review` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prize` double NOT NULL,
  `quantity` decimal(10,0) NOT NULL DEFAULT '0',
  `rating` double DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `categories_product_fk` (`id_category`),
  CONSTRAINT `categories_product_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,100,'Áo polo nam trơn basic form regular vải cá sấu',100000,200,4,'product1.jpg','product1',2),(4,100,'Áo polo thể thao unisex nam nữ',100000,200,4,'product2.jpg','product1',2),(5,100,'Áo polo phối khóa kéo unisex nam nữ',100000,194,4,'product3.jpg','product1',2),(6,100,'Áo hoodie form rộng unisex nam nữ nỉ chân cua',100000,178,4,'product4.jpg','product1',6),(7,100,'Áo hoodie zip form boxy unisex nỉ bông dày dặn',100000,199,4,'product5.jpg','product1',6),(8,100,'Áo sweater unisex nam nữ basic nỉ chân cua',100000,199,4,'product6.jpg','product1',3),(9,100,'Áo sweater nam trơn basic vải da cá',100000,196,4,'product7.jpg','product1',3),(10,100,'Quần jean unisex nam nữ cạp cao ống suông rộng',100000,199,4,'product8.jpg','product1',10),(11,100,'Quần jean nam baggy cạp chun bản to ống rộng',100000,200,4,'product9.jpg','product1',10),(12,100,'Quần jean unisex nam nữ cotton form slimfit',100000,199,4,'product10.jpg','product1',10),(13,100,'Áo thun unisex nam nữ basic tee form oversize',100000,200,4,'product11.jpg','product1',2),(14,100,'Áo phông raglan unisex nam nữ basic cotton dày dặn',100000,199,4,'product12.jpg','product1',2),(15,100,'Áo phông layer pattern unisex nam nữ form oversize',100000,200,4,'product13.jpg','product1',2),(16,100,'Áo sơ mi nam tay dài form rộng vải lụa dày dặn',100000,200,4,'product14.jpg','product1',4),(17,100,'Áo sơ mi sọc nam tay dài vải Oxford',100000,200,4,'product15.jpg','product1',4),(18,100,'Áo sơ mi công sở unisex nam nữ tay dài vải lụa for',100000,200,4,'product16.jpg','product1',4),(19,100,'Quần Kaki baggy trơn unisex nam nữ lưng thun dây r',100000,199,4,'product17.jpg','product1',14),(20,100,'Sơ mi dài tay Café-DriS',100000,200,4,'product15.jpg','product1',4),(21,100,'Áo dài tay Cotton Compact',100000,200,4,'product22.jpg','product1',3),(22,100,'Áo dài tay nỉ',100000,200,4,'product23.jpg','product1',3),(23,100,'Áo dài tay Cotton Compact V2',100000,199,4,'product24.jpg','product1',3),(24,100,'Áo nỉ chui đầu Lifewear',100000,199,4,'product25.jpg','product1',3),(25,100,'Shorts thể thao 9',100000,200,4,'product26.jpg','product1',9),(26,100,'Shorts chạy bộ Ultra',100000,200,4,'product27.jpg','product1',9),(31,100,'Polo Pique Cotton',100000,200,4,'product28.jpg','product1',2),(32,100,'Polo thể thao Promax',100000,200,4,'product29.jpg','product1',2),(33,100,'Jeans Copper Denim Slim Fit',100000,200,4,'product30.jpg','product1',10),(34,100,'Áo giữ nhiệt Modal Ultra',100000,200,4,'product31.jpg','product1',2),(35,100,'Shorts thể thao 5\" Movement',100000,199,4,'product32.jpg','product1',9),(36,100,'Shorts thể thao 7\" Movement',100000,199,4,'product33.jpg','product1',9),(37,100,'Quần Joggers Daily Wear',100000,200,4,'product34.jpg','product1',14),(38,100,'Polo thể thao V1',100000,200,4,'product35.jpg','product1',2),(39,100,'Sơ mi dài tay Easycare',100000,199,4,'product36.jpg','product1',4),(40,100,'Quần dài Kaki Excool',100000,200,4,'product37.jpg','product1',14),(41,100,'Jeans Copper Denim Straight',100000,197,4,'product38.jpg','product1',10),(44,100,'asdas',100000,200,4,'product39.jpg','product1',2),(53,0,'fgwegwe',3423423,0,0,'21130526.jpg','fdf34f32f',9),(54,0,'dfgsgrfgdfsd',23123123,0,0,'21130526.jpg','fwefg23r2',6),(55,0,'hiaaaa',123345,0,0,'app_icon.png','asdfaw',15),(56,0,'fsdfsdfg',212,0,0,'app_icon.png','sd2',9),(57,0,'dsc',123,0,0,'app_icon.png','we',11),(58,0,'1234',1232,0,0,'default_avatar.png','1232',7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (5,'Chưa xác nhận'),(6,'Đã xác nhận'),(7,'Đã vận chuyển'),(8,'Đã giao hàng');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` bit(1) NOT NULL DEFAULT b'0',
  `avata` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','$2a$10$1FSYxMd3VLJ8Obx0uYKT1.1ArL6oVz3APRQKcotEyevR0B8WUFFkm','user1','nah@gmail.comcommm','0703237559','HCMdf',_binary '','default_avatar.png'),(2,'user2','password2','User Two','user2@example.com','1234567891','456 Elm St',_binary '','default_avatar.png'),(3,'user3','password3','User Three','user3@example.com','1234567892','789 Oak St',_binary '','default_avatar.png'),(4,'user4','password4','User Four','user4@example.com','1234567893','101 Pine St',_binary '\0',''),(5,'user5','password5','User Five','user5@example.com','1234567894','202 Maple St',_binary '',''),(6,'user6','password6','User Six','user6@example.com','1234567895','303 Birch St',_binary '',''),(7,'user7','password7','User Seven','user7@example.com','1234567896','404 Cedar St',_binary '\0',''),(8,'user8','password8','User Eight','user8@example.com','1234567897','505 Walnut St',_binary '',''),(9,'user9','password9','User Nine','user9@example.com','1234567898','606 Chestnut St',_binary '',''),(10,'user10','password10','User Ten','user10@example.com','1234567899','707 Poplar St',_binary '\0',''),(21,'user11','password123','John Doe','johndoe@example.com','1234567890','123 Main Street',_binary '\0',''),(22,'Ozu','Ozu123','OzuSus','OzuSus@gmail.com','0703237559','123 Main Street',_binary '\0',''),(23,'PVDUOC','PVDUOC123','PVDUOCPRT','OzuSus@gmail.com','0703237559','123 Main Street',_binary '\0',''),(24,'PVDUOC123','PVDUOC123sdasd','PVDUOCPfsdRT','OzuSus@gmaisdfl.com','070323sdf7559','123 Main sdfStreet',_binary '\0','sds'),(25,'PVDUOwerC123','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','sdewrs'),(26,'PVDUOwerC123456789','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','sdewrs'),(27,'OzuSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','sdewrs'),(28,'OzduSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','sdewrs'),(29,'OzsfsdduSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','dfgdf'),(30,'OzsfsdưerduSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','dfgdf'),(31,'OzsfsdưewrwerweerduSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0','dfgdf'),(32,'OzsfsdưeewrwerwrwerweerduSus','PVDUOC1wer23sdasd','PVDUOCPwerfsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0',NULL),(33,'sdfeqwrqe','sdf','qweqweqwe','qwew@fgewfe','324244223423','343242234',_binary '\0',NULL),(34,'sdfeqwrqe','ưef','ewf','ewfư','ef','ewf',_binary '\0',NULL),(35,'OzsfsdưeewrwerwrwerweerduSus','PVDUOC1wert23sdasd','PVDUOCPwerftsdRT','OzuSus@gmawerisdfl.com','070323sdfwer7559','123 Mawerin sdfStreet',_binary '\0',NULL),(36,'OzsfsdưeewrwerwrwerweerduSus','PVDUOC1werdt23sdasd','PVDUOCdPwerftsdRT','OzuSus@gmadwerisdfl.com','070323sddfwer7559','123 Mawerin sdfStdreet',_binary '\0',NULL),(37,'OzsfsdưeewrwerwrwerweedrduSus','PVDUOC1werdt23sdasd','PVDUOCdPwerftsdRT','OzuSus@gmadwerisdfl.com','070323sddfwer7559','123 Mawerin sdfStdreet',_binary '\0',NULL),(38,'fsd','sdf','sdf','sdf','sdfs','df',_binary '\0',NULL),(39,'OzsfsdưeewDFrwerwrwerweedrduSus','PVDUOC1werdt23sdasd','PVDUOCdPwerftsdRT','OzuSusFSD@gmadwerisdfl.com','070323sddfwer7559','123 Mawerin sdfStdreet',_binary '\0',NULL),(40,'OzsfsdưeewDFrwfdsferwrwerweedrduSus','PVDUOC1werdt23sdasd','PVDUOCdPwerftsdRT','OzuSusFSDdsf@gmadwerisdfl.com','070323sddfwer7559','123 Mawerin sdfStdreet',_binary '\0',NULL),(41,'newUserWithCart','PVDUOC1werdt23sdasd','PVDUOCdPwerftsdRT','newUserWithCart@gmadwerisdfl.com','070323sddfwer7559','123 Mawerin sdfStdreet',_binary '\0',NULL),(42,'newU','$2a$10$wch4J1CSW6iLK3MCKj3vVe0dG7tD2o8JyScMYhLEOEYbVMo5I69M6','PVDUOCdPwerftsdRT','newU@gmal.com','0703237559','123 Mawerin sdfStdreet',_binary '\0',NULL),(43,'21130327','$2a$10$qaTFt9rb65S8wdyWpUEdD.mOWzmrsj0VxiwQc2OusNJC/SBkBmGa.','OzuSus','21130327@gmail.com','0703237559','HCM-NLU',_binary '\0',NULL),(44,'new','$2a$10$GMZl1bYKv.sJw8q6S/374Oh.3L8YMIDd2ZSaX8yKvvzHTU2adnj2C','new','new@gmail.com','0702337559','new',_binary '','godzulaThum.jpg'),(45,'ohinews','$2a$10$bxfKCsOYbWnCy0CJXaDkpuFEDAndxhiBCSPad/y9udr/XaP5bcrdS','ohinews','ohinew@gmail.com','0703237559','ohinews',_binary '','background_account.png'),(46,'tam','$2a$10$1FSYxMd3VLJ8Obx0uYKT1.1ArL6oVz3APRQKcotEyevR0B8WUFFkm','tam','tamle7723@gmail.com','1231231239','dfsd45',_binary '\0',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-12 20:42:06
