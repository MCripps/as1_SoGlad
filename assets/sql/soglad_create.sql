CREATE DATABASE  IF NOT EXISTS `soglad` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `soglad`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: soglad
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lists the varios product categories e.g. rings, bracelets, necklaces, pendants, charms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'rings'),(2,'bangles'),(3,'necklaces'),(4,'earrings'),(5,'pendant'),(6,'cufflinks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type`
--

LOCK TABLES `content_type` WRITE;
/*!40000 ALTER TABLE `content_type` DISABLE KEYS */;
INSERT INTO `content_type` VALUES (1,'general'),(2,'news'),(3,'email'),(4,'facebook');
/*!40000 ALTER TABLE `content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_photos`
--

DROP TABLE IF EXISTS `product_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT 'Indicates the relative location of the image',
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`product_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_photos`
--

LOCK TABLES `product_photos` WRITE;
/*!40000 ALTER TABLE `product_photos` DISABLE KEYS */;
INSERT INTO `product_photos` VALUES (1,1,'circlePendant1.jpg','Circle Pendant'),(2,1,'circlePendant2.jpg','Circle Pendant'),(3,2,'trianglePendant1.jpg','Triangle Pendant'),(4,2,'trianglePendant2.jpg','Triangle Pendant'),(5,3,'starPendant1.jpg','Star Pendant'),(6,3,'starPendant2.jpg','Star Pendant'),(7,4,'smallHeart.jpg','Small Heart Pendant'),(8,4,'smallHeart2.jpg','Small Heart Pendant'),(9,5,'lazyHeart1.jpg','Lazy Heart Pendant'),(10,5,'lazyHeart2.jpg','Lazy Heart Pendant'),(11,6,'loveHeart1.jpg','Love Heart Pendant'),(12,6,'loveHeart2.jpg','Love Heart Pendant'),(13,8,'bee.jpg','Sterling silver bee'),(14,9,'cufflinks1.jpg','Sterling silver cufflinks'),(15,10,'cufflinks2.jpg','Sterling silver cufflinks'),(16,11,'cufflinks3.jpg','Sterling silver cufflinks'),(17,7,'bracelet1.jpg','Sterling silver bangle'),(18,7,'bracelet2.jpg','Sterling silver bangle'),(19,12,'doubleDiskNecklace.jpg','Necklace with two discs');
/*!40000 ALTER TABLE `product_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `cost` varchar(100) DEFAULT NULL COMMENT 'Can''t be a number as we may speciy offers e.g. "1 for £22, two for £40"',
  `categoryId` int(11) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '0 - Unisex\n1 - Female\n2 - Male',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_count` varchar(1) DEFAULT NULL COMMENT 'ANTIPATTERN ALERT!\nI am recording how many photos exist for this product as this is used to determine the css style to use when formatting the product photos - uurgh! Really I should be writinng my sql to derive this number by joining to the product_photos table and counting how many there are but my SQL skills are not great so for now we will hard code this.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product category_idx` (`categoryId`),
  CONSTRAINT `product category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Circle Pendant','A beautiful circle pendant 2cm in diameter. Personalised with your initial and on a sterling silver chain.','£22.00',5,0,'2015-02-13 00:11:43','2'),(2,'Triangle Pendant','A beautiful triangle pendant, 1.5cm across. Personalised with your initial and on a 18cm sterling silver chain.','£20.00',5,0,'2015-02-13 00:11:43','2'),(3,'Star Pendant','A beautiful star pendant 1.5cm across. Personalised with your initial and on a 18cm sterling silver chain.','£20.00',5,0,'2015-02-13 00:11:43','2'),(4,'Small Heart Pendant','A beautiful small heart 1cm across. Personalised with your initial and on a sterling silver charm carrier. Fits on Pandora, Chamilia and other charm bracelets','£22 each or £40 for 2',5,1,'2015-02-13 00:11:43','2'),(5,'Lazy Heart Pendant','A beautiful lazy heart 2cm across. Personalised with your initial and on a 18cm sterling silver chain.','£25.00',5,1,'2015-02-13 00:11:43','2'),(6,'Love Heart Pendant','A beautiful love heart 2cm across. Personalised with your initial and on a 18cm sterling silver chain.','£25.00',5,1,'2015-02-13 00:11:43','2'),(7,'Sterling silver bangle','Handmade sterling silver bangle, with as many personalised fine silver charms as you\''d like. I can also add numbers for 18th, 21st birthdays etc. The bangle has an internal diameter of 6.4cm.','Bangle & one heart £30, extra hearts at £10 each',2,1,'2015-02-13 00:11:43','2'),(8,'Sterling silver bee','Handmade and hand etched chunky fine silver bumble bee, 2cm x 1.5cm, on a sterling silver 18\" chain.','£25',5,1,'2015-02-13 00:11:43','1'),(9,'Sterling silver cufflinks','Handmade solid fine silver cufflinks from vintage button designs with sterling silver backs.','Gift boxed, £40 a pair',6,2,'2015-02-13 00:11:43','1'),(10,'Sterling silver cufflinks','Handmade solid fine silver cufflinks from vintage button designs with sterling silver backs.','Gift boxed, £40 a pair',6,2,'2015-02-13 00:11:43','1'),(11,'Sterling silver cufflinks','Handmade solid fine silver cufflinks from vintage button designs with sterling silver backs.','Gift boxed, £40 a pair',6,2,'2015-02-13 00:11:43','1'),(12,'Necklace with two discs','Double disc initialled necklace. The silver discs are 1.3cm wide and patterned on the back.','£25.00',3,0,'2015-02-13 00:11:43','1');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_content`
--

DROP TABLE IF EXISTS `site_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_content` (
  `id` int(11) NOT NULL,
  `content_typeId` int(11) NOT NULL COMMENT '''References the content_type table''',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(45) DEFAULT 'Marcus Cripps',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`content_typeId`),
  KEY `content type_idx` (`content_typeId`),
  CONSTRAINT `content type` FOREIGN KEY (`content_typeId`) REFERENCES `content_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holds all static content used to populate the web pages e.g. news, about information etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_content`
--

LOCK TABLES `site_content` WRITE;
/*!40000 ALTER TABLE `site_content` DISABLE KEYS */;
INSERT INTO `site_content` VALUES (1,1,'So Glad Vintage Style Silver Jewellery','I make all the jewellery to order using silver clay. Once fired the pieces are 99.9% pure silver, also known as fine silver as they have a higher silver content than sterling silver, which is 92.5% silver. Each item is handmade with a vintage theme. Because of this, no two items ever turn out the same. Each piece is truly unique.','Marcus Cripps','2015-02-10 23:26:53'),(1,2,'So Glad Facebook','For up to date photos and the latest designs of my new items please visit <a href=\"https://www.facebook.com/SoGladSilverJewellery\">my facebook page</a>.','Marcus Cripps','2015-02-10 23:32:58'),(1,3,'So Glad Email','Email me at helen@soglad.co.uk for more information','Marcus Cripps','2015-02-10 23:29:23'),(2,2,'International Interest!','So far, So Glad jewellery has been sent New Zealand, Hong Kong, USA & Sweden','Marcus Cripps','2014-03-17 23:32:58'),(2,4,'So Glad Facebook','Visit me on facebook at <a href=\"https://www.facebook.com/SoGladSilverJewellery\">www.facebook.com/SoGladSilverJewellery</a>','Marcus Cripps','2015-02-10 23:32:58'),(3,2,'Delivery Info','I can make most items within 5 - 10 days and will post your order at cost or you can collect from my studio in Derby','Marcus Cripps','2014-05-14 22:32:58');
/*!40000 ALTER TABLE `site_content` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-13  0:17:09
