-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: estore
-- ------------------------------------------------------
-- Server version	5.6.47

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Authorities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authorities` (
  `authoritiesId` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authoritiesId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authorities`
--

LOCK TABLES `Authorities` WRITE;
/*!40000 ALTER TABLE `Authorities` DISABLE KEYS */;
INSERT INTO `Authorities` VALUES (1,'ROLE_ADMIN','admin'),(2,'ROLE_USER','salihcandir'),(3,'ROLE_USER','alberteinstein'),(4,'ROLE_USER','test');
/*!40000 ALTER TABLE `Authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillingAddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BillingAddress` (
  `billingAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `confirmedOrder_confirmedOrderId` int(11) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`billingAddressId`),
  KEY `FKF0492D19C9326873` (`confirmedOrder_confirmedOrderId`),
  KEY `FKF0492D1936B7C582` (`customer_customerId`),
  CONSTRAINT `FKF0492D1936B7C582` FOREIGN KEY (`customer_customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKF0492D19C9326873` FOREIGN KEY (`confirmedOrder_confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillingAddress`
--

LOCK TABLES `BillingAddress` WRITE;
/*!40000 ALTER TABLE `BillingAddress` DISABLE KEYS */;
INSERT INTO `BillingAddress` VALUES (1,'','','','','','',NULL,1),(2,'','','','','','',NULL,2);
/*!40000 ALTER TABLE `BillingAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `grandTotal` double NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FK1FEF407B82E681` (`customerId`),
  CONSTRAINT `FK1FEF407B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,1998,1),(2,0,2);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartItem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartItem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `cartId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `FK4393E73309700CF` (`productId`),
  KEY `FK4393E7329EA3985` (`cartId`),
  CONSTRAINT `FK4393E7329EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FK4393E73309700CF` FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartItem`
--

LOCK TABLES `CartItem` WRITE;
/*!40000 ALTER TABLE `CartItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConfirmedOrder`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConfirmedOrder` (
  `confirmedOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `fulfillmentDate` date DEFAULT NULL,
  `grandTotal` double NOT NULL,
  `isFulfilled` tinyint(1) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`confirmedOrderId`),
  KEY `FK2AD1634F7B82E681` (`customerId`),
  KEY `FK2AD1634FD5C33C1D` (`shippingAddressId`),
  KEY `FK2AD1634F9F7DA697` (`billingAddressId`),
  CONSTRAINT `FK2AD1634F7B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FK2AD1634F9F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FK2AD1634FD5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConfirmedOrder`
--

LOCK TABLES `ConfirmedOrder` WRITE;
/*!40000 ALTER TABLE `ConfirmedOrder` DISABLE KEYS */;
INSERT INTO `ConfirmedOrder` VALUES (1,'2020-03-30',399,1,'2020-03-30',1,1,1),(2,NULL,399,0,'2020-03-30',1,1,1),(3,NULL,399,0,'2020-03-30',1,1,1),(4,NULL,2997,0,'2020-03-31',1,1,1),(5,NULL,3996,0,'2020-03-31',1,1,1),(6,NULL,1998,0,'2020-03-31',1,1,1);
/*!40000 ALTER TABLE `ConfirmedOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConfirmedOrderItem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConfirmedOrderItem` (
  `confirmedOrderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `confirmedOrderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`confirmedOrderItemId`),
  KEY `FKD1E41302A792E583` (`confirmedOrderId`),
  KEY `FKD1E41302309700CF` (`productId`),
  CONSTRAINT `FKD1E41302309700CF` FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`),
  CONSTRAINT `FKD1E41302A792E583` FOREIGN KEY (`confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConfirmedOrderItem`
--

LOCK TABLES `ConfirmedOrderItem` WRITE;
/*!40000 ALTER TABLE `ConfirmedOrderItem` DISABLE KEYS */;
INSERT INTO `ConfirmedOrderItem` VALUES (1,1,399,1,2),(2,1,399,2,2),(3,1,399,3,2),(4,3,2997,4,1),(5,4,3996,5,1),(6,2,1998,6,1);
/*!40000 ALTER TABLE `ConfirmedOrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `customerEmail` varchar(255) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `confirmedOrderId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  KEY `FK27FBE3FEA792E583` (`confirmedOrderId`),
  KEY `FK27FBE3FE29EA3985` (`cartId`),
  KEY `FK27FBE3FED5C33C1D` (`shippingAddressId`),
  KEY `FK27FBE3FE9F7DA697` (`billingAddressId`),
  CONSTRAINT `FK27FBE3FE29EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FK27FBE3FE9F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FK27FBE3FEA792E583` FOREIGN KEY (`confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`),
  CONSTRAINT `FK27FBE3FED5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'salih.candir@student.uibk.ac.at','Salih Candir','',1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','salihcandir',1,1,NULL,1),(2,'albert.einstein@example.com','Albert Einstein','',1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein',2,2,NULL,2),(3,'test@test.test','Test Account','',1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein',2,2,NULL,2);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerOrder`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerOrder` (
  `customerOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `billingAddressId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `shippingAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`customerOrderId`),
  KEY `FKAEF781F029EA3985` (`cartId`),
  KEY `FKAEF781F07B82E681` (`customerId`),
  KEY `FKAEF781F0D5C33C1D` (`shippingAddressId`),
  KEY `FKAEF781F09F7DA697` (`billingAddressId`),
  CONSTRAINT `FKAEF781F029EA3985` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`cartId`),
  CONSTRAINT `FKAEF781F07B82E681` FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKAEF781F09F7DA697` FOREIGN KEY (`billingAddressId`) REFERENCES `BillingAddress` (`billingAddressId`),
  CONSTRAINT `FKAEF781F0D5C33C1D` FOREIGN KEY (`shippingAddressId`) REFERENCES `ShippingAddress` (`shippingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerOrder`
--

LOCK TABLES `CustomerOrder` WRITE;
/*!40000 ALTER TABLE `CustomerOrder` DISABLE KEYS */;
INSERT INTO `CustomerOrder` VALUES (1,1,1,1,1),(2,1,1,1,1),(3,1,1,1,1),(4,1,1,1,1),(5,1,1,1,1),(6,1,1,1,1),(7,1,1,1,1),(8,1,1,1,1),(9,1,1,1,1),(10,1,1,1,1),(11,1,1,1,1);
/*!40000 ALTER TABLE `CustomerOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Discount` (
  `discountId` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `discountPercent` double NOT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`discountId`),
  KEY `FK1422D961309700CF` (`productId`),
  KEY `FK1422D9618F48DCA1` (`discountId`),
  CONSTRAINT `FK1422D961309700CF` FOREIGN KEY (`productId`) REFERENCES `Product` (`productId`),
  CONSTRAINT `FK1422D9618F48DCA1` FOREIGN KEY (`discountId`) REFERENCES `Product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productCategory` varchar(255) DEFAULT NULL,
  `productCondition` varchar(255) DEFAULT NULL,
  `productDescription` varchar(255) DEFAULT NULL,
  `productManufacturer` varchar(255) DEFAULT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` double NOT NULL,
  `productStatus` varchar(255) DEFAULT NULL,
  `unitInStock` int(11) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Phone','new','Smartphone','Apple','NewProductName',999,'active',10),(2,'Watch','new','Smartwatch','Apple','Apple Watch 5',399,'active',10),(3,'Laptop','new','Display: 16\", 3072x1920, 226dpi, 60Hz\r\nCPU: Intel Core i7-9750H, 6x 2.60GHz\r\n','Apple','MacBook Pro',2399,'active',5),(4,'Tablet','new','12.9-inch iPad Pro, Space Gray, 64GB','Apple','iPad Pro',999,'active',10),(5,'Headphones','new','Wireless Charging Case, H1 chip, Up to 5 hours of listening time','Apple','AirPods',199,'active',20),(8,'','new','','','delet',0,'active',0);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippingAddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShippingAddress` (
  `shippingAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `streetName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `confirmedOrder_confirmedOrderId` int(11) DEFAULT NULL,
  `customer_customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`shippingAddressId`),
  KEY `FKBB1EE46C9326873` (`confirmedOrder_confirmedOrderId`),
  KEY `FKBB1EE4636B7C582` (`customer_customerId`),
  CONSTRAINT `FKBB1EE4636B7C582` FOREIGN KEY (`customer_customerId`) REFERENCES `Customer` (`customerId`),
  CONSTRAINT `FKBB1EE46C9326873` FOREIGN KEY (`confirmedOrder_confirmedOrderId`) REFERENCES `ConfirmedOrder` (`confirmedOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippingAddress`
--

LOCK TABLES `ShippingAddress` WRITE;
/*!40000 ALTER TABLE `ShippingAddress` DISABLE KEYS */;
INSERT INTO `ShippingAddress` VALUES (1,'','','','','','',NULL,1),(2,'','','','','','',NULL,2);
/*!40000 ALTER TABLE `ShippingAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `usersId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,0,1,'$2a$10$KJ3.GZShC9uV8u381dzk8uotNk5iBWZev4bhoBFMLL8dPGTQZX6mu','admin'),(2,1,1,'$2a$10$FTGax/nv.Rod71CYDTpfReO.9jdUIbaYrTYQE6zVJwc62kL5jW0s2','salihcandir'),(3,2,1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','alberteinstein'),(4,3,1,'$2a$10$1yhEfP5e4XQgYrvURhFMMOAfec7ND/VqeMV31a9bYB6kCIAsBvz0u','test');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'estore'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-15 14:01:50
