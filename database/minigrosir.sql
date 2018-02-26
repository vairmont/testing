# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: brother
# Generation Time: 2018-01-22 17:06:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT '',
  `phone` varchar(150) DEFAULT '',
  `department` varchar(150) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `identifier`, `name`, `phone`, `department`, `created_at`, `updated_at`)
VALUES
	(4,1,'Jordy Jonatan','081289256242','Developer','2017-12-05 15:46:18','2017-12-06 13:03:11'),
	(5,2,'Developer','0000','Developer','2017-12-05 15:51:35','2017-12-06 13:03:12'),
	(6,53,'Admin','0000','Developer','2018-01-05 15:45:23','2018-01-05 15:45:23');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



# Dump of table cart_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart_detail`;

CREATE TABLE `cart_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



# Dump of table chat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_progress_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `message` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;

INSERT INTO `chat` (`id`, `order_progress_id`, `order_id`, `category_id`, `sender_id`, `recipient_id`, `message`, `created_at`, `updated_at`)
VALUES
	(4,15,19,3,33,7,'Selamat Siang','2018-01-16 15:23:06','2018-01-16 15:23:06'),
	(5,15,19,3,7,33,'Ya selamat siang, ada yang bisa saya bantu?','2018-01-16 15:23:25','2018-01-16 15:23:25'),
	(6,15,19,3,33,7,'saya mau nanya','2018-01-16 15:23:35','2018-01-16 15:23:35'),
	(7,15,19,3,33,7,'harga barang bisa nego lagi gak ya?','2018-01-16 15:23:45','2018-01-16 15:23:45'),
	(8,16,19,3,33,7,'Halo gan','2018-01-16 15:36:06','2018-01-16 15:36:06'),
	(9,16,19,3,33,7,'Gimana gan?','2018-01-16 15:38:25','2018-01-16 15:38:25'),
	(10,12,17,3,33,7,'Gan??','2018-01-16 15:38:40','2018-01-16 15:38:40'),
	(11,12,17,3,7,33,'Ya bro? Ada apa?','2018-01-17 18:43:03','2018-01-17 18:43:03'),
	(12,16,19,3,33,7,'Test','2018-01-18 17:47:37','2018-01-18 17:47:37'),
	(13,43,38,1,54,7,'Hai bajigur','2018-01-19 17:32:37','2018-01-19 17:32:37'),
	(14,43,38,1,7,54,'Oiiii','2018-01-19 17:33:06','2018-01-19 17:33:06'),
	(15,43,38,1,7,54,'Ud makan belom??','2018-01-19 17:33:37','2018-01-19 17:33:37');

/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'JAKARTA','2017-11-15 12:46:34','2017-11-15 12:46:35'),
	(2,'CIKARANG','2017-11-15 12:46:34','2017-11-15 12:46:35'),
	(3,'BOGOR','2017-11-15 12:46:34','2017-11-15 12:46:35'),
	(4,'BANDUNG','2017-11-15 12:46:34','2017-11-15 12:46:35'),
	(5,'TASIKMALAYA','2017-11-15 12:46:34','2017-11-15 12:46:35'),
	(6,'SUBANG','2017-11-15 12:46:51','0000-00-00 00:00:00'),
	(7,'CIREBON','2017-11-15 12:46:59','0000-00-00 00:00:00'),
	(8,'CIANJUR','2017-11-15 12:47:05','0000-00-00 00:00:00'),
	(9,'TANGERANG','2017-11-15 12:47:13','0000-00-00 00:00:00'),
	(10,'YOGYAKARTA','2017-11-15 12:47:20','0000-00-00 00:00:00'),
	(11,'WONOSOBO','2017-11-15 12:47:27','0000-00-00 00:00:00'),
	(12,'PEKALONGAN','2017-11-15 12:47:34','0000-00-00 00:00:00'),
	(13,'SALATIGA','2017-11-15 12:48:38','0000-00-00 00:00:00'),
	(14,'UNGARAN','2017-11-15 12:48:45','0000-00-00 00:00:00'),
	(15,'KLATEN','2017-11-15 12:48:53','0000-00-00 00:00:00'),
	(16,'KENDAL','2017-11-15 12:49:00','0000-00-00 00:00:00'),
	(17,'PURWOKERTO','2017-11-15 12:49:10','0000-00-00 00:00:00'),
	(18,'CILACAP','2017-11-15 12:49:17','0000-00-00 00:00:00'),
	(19,'TEGAL','2017-11-15 12:49:26','0000-00-00 00:00:00'),
	(20,'REMBANG','2017-11-15 12:49:33','0000-00-00 00:00:00'),
	(21,'KEBUMEN','2017-11-15 12:49:38','0000-00-00 00:00:00'),
	(22,'BANJARNEGARA','2017-11-15 12:49:43','0000-00-00 00:00:00'),
	(23,'SEMARANG','2017-11-15 12:49:50','0000-00-00 00:00:00'),
	(24,'SURABAYA','2017-11-15 12:49:59','0000-00-00 00:00:00'),
	(25,'MADIUN','2017-11-15 12:50:05','0000-00-00 00:00:00'),
	(26,'MADURA','2017-11-15 12:50:11','0000-00-00 00:00:00'),
	(27,'MALANG','2017-11-15 12:50:21','0000-00-00 00:00:00'),
	(28,'BOJONEGORO','2017-11-15 12:50:31','0000-00-00 00:00:00'),
	(29,'TUBAN','2017-11-15 12:50:39','0000-00-00 00:00:00'),
	(30,'MEDAN','2017-11-15 12:50:48','0000-00-00 00:00:00'),
	(31,'BATAM','2017-11-15 12:50:55','0000-00-00 00:00:00'),
	(32,'PALEMBANG','2017-11-15 12:51:02','0000-00-00 00:00:00'),
	(33,'PRABUMULIH','2017-11-15 12:51:34','0000-00-00 00:00:00'),
	(34,'PEKANBARU','2017-11-15 12:51:43','0000-00-00 00:00:00'),
	(35,'DENPASAR','2017-11-15 12:51:52','0000-00-00 00:00:00'),
	(36,'PADANG','2017-11-15 12:51:57','0000-00-00 00:00:00'),
	(37,'TANJUNG PINANG','2017-11-15 12:52:05','0000-00-00 00:00:00'),
	(38,'JAMBI','2017-11-15 12:52:12','0000-00-00 00:00:00'),
	(39,'MAKASSAR','2017-11-15 12:52:18','0000-00-00 00:00:00'),
	(40,'BALIKPAPAN','2017-11-15 12:52:26','0000-00-00 00:00:00'),
	(41,'PONTIANAK','2017-11-15 12:52:33','0000-00-00 00:00:00'),
	(42,'TANJUNG BALAI KARIMUN','2017-11-15 12:52:41','0000-00-00 00:00:00'),
	(43,'PAPUA','2017-11-15 12:52:46','0000-00-00 00:00:00'),
	(44,'BANJARMASIN','2017-11-15 12:52:54','0000-00-00 00:00:00'),
	(45,'PALANGKARAYA','2017-11-15 12:53:01','0000-00-00 00:00:00'),
	(46,'KUPANG','2017-11-15 12:53:07','0000-00-00 00:00:00'),
	(47,'PALU','2017-11-15 12:53:13','0000-00-00 00:00:00'),
	(48,'LAMPUNG','2017-11-15 12:53:28','0000-00-00 00:00:00'),
	(49,'ACEH','2017-11-15 12:53:46','0000-00-00 00:00:00'),
	(50,'SUKABUMI','2017-11-15 12:53:58','0000-00-00 00:00:00'),
	(51,'SEMARANG','2017-11-15 12:54:27','0000-00-00 00:00:00'),
	(52,'SOLO','2017-11-15 12:54:32','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address_1` longtext,
  `lat` varchar(150) DEFAULT '0',
  `lng` varchar(150) DEFAULT '0',
  `address_2` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `identifier`, `name`, `phone`, `city_id`, `address_1`, `lat`, `lng`, `address_2`, `created_at`, `updated_at`)
VALUES
	(1,3,'Jordy Jonatan','081289256242',1,'Jl. Daan Mogot','0','0','Jl. Daan Mogot Raya','2017-12-05 22:21:45','2017-12-06 13:03:33'),
	(27,33,'George','08999310048',1,'Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village','2017-12-29 13:28:31','2018-01-09 15:56:49'),
	(28,34,'Jonatan','08921038201',40,'Balikpapan City, East Kalimantan, Indonesia','0','0','balikpapan raya','2017-12-29 13:31:28','2017-12-29 13:31:28'),
	(29,35,'Hadi','56789',4,'Dago, Bandung City, West Java, Indonesia','0','0','bandung raya','2017-12-29 13:32:36','2017-12-29 13:32:36'),
	(30,36,'Andi','6789',4,'Bandung, Bandung City, West Java, Indonesia','0','0','bandung','2017-12-29 13:33:28','2017-12-29 13:33:28'),
	(31,37,'Handy Wijaya','081219204788',1,'Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429834','106.6138174','Emetra','2017-12-29 14:01:52','2017-12-29 14:01:52'),
	(33,49,'Andi','65659',1,'Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429819','106.6138166','Tangerang','2018-01-04 14:49:42','2018-01-04 14:49:42'),
	(34,54,'Felix Boenawan','08121957740',1,'Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429808','106.613816','Monaco Village','2018-01-05 16:18:51','2018-01-05 16:18:51');

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dealer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dealer`;

CREATE TABLE `dealer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `store_name` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address_1` longtext,
  `lat` varchar(150) DEFAULT '0',
  `lng` varchar(150) DEFAULT '0',
  `address_2` longtext,
  `printer_inkjet` int(11) DEFAULT NULL,
  `printer_laser` int(11) DEFAULT NULL,
  `printer_label` int(11) DEFAULT NULL,
  `scanner` int(11) DEFAULT NULL,
  `mesin_jahit` int(11) DEFAULT NULL,
  `lain_lain` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `dealer` WRITE;
/*!40000 ALTER TABLE `dealer` DISABLE KEYS */;

INSERT INTO `dealer` (`id`, `identifier`, `store_name`, `name`, `phone`, `city_id`, `address_1`, `lat`, `lng`, `address_2`, `printer_inkjet`, `printer_laser`, `printer_label`, `scanner`, `mesin_jahit`, `lain_lain`, `created_at`, `updated_at`)
VALUES
	(1,4,'Brother Indonesia','Brother Indonesia','0000',1,'South Mangga Dua, Central Jakarta City, Jakarta, Indonesia','-6.1418556','106.82816230000003','Jl. A',1,1,1,1,1,1,'2017-12-05 22:51:16','2017-12-06 18:30:23');

/*!40000 ALTER TABLE `dealer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;

INSERT INTO `favorite` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`)
VALUES
	(7,33,1,'2018-01-10 16:26:00','2018-01-10 16:26:00'),
	(8,33,2,'2018-01-10 16:26:17','2018-01-10 16:26:17');

/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fcm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fcm`;

CREATE TABLE `fcm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT '',
  `device_platform` varchar(150) DEFAULT '',
  `uuid` varchar(150) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

LOCK TABLES `fcm` WRITE;
/*!40000 ALTER TABLE `fcm` DISABLE KEYS */;

INSERT INTO `fcm` (`id`, `user_id`, `role_id`, `fcm_token`, `device_platform`, `uuid`, `created_at`, `updated_at`)
VALUES
	(11,33,2,'fK5dbeioCAc:APA91bF9E22H0OwUTho7dzkxzFbu9kaQAqsCTbOwl7p1-pmw63uNFaM2RhCT0aYOQP0VNkwfV5Vr1sBohUqOEv2zFdB43y-IhfsSrZCOz1VzHFPJ2Sh7G7F7SoT9KSc_zvDHqJ4i2qrx','Android','e9f514591774e2e','2018-01-04 15:33:51','2018-01-04 15:33:51'),
	(31,54,2,'ej5NtYrT5xU:APA91bE6NhOmW55sLKjeaKTSEbax76yHVdJ1N10V1X1hKDDu3fxeztGiQjoFXg4j8cgiLUR5--eFDUqeS_9kdt7JBO5QZWbuJzyLUjzeFfg_NvVA4ajN97SkKjUC1vd42fTMRO_LWFbw','Android','85f07cd331a95c3c','2018-01-19 17:28:46','2018-01-19 17:28:46'),
	(32,7,4,'fXIFLmdfd-8:APA91bFZ2iHAOt23jhY0w-I6EMA_59jT3BvIOSyiHUgnlU5-uIVBWf5CnxIgKpQuULtxxHwV04chiHtwOKgoWseoIm1Ywu1drNX7fdpuRpfUpsx4kWq8vqMFK35ogtTLOToBNTzrJt0n','Android','3e570fcb43352536','2018-01-20 01:06:36','2018-01-20 01:06:36');

/*!40000 ALTER TABLE `fcm` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table newspromo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newspromo`;

CREATE TABLE `newspromo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT '',
  `description` longtext,
  `image` varchar(255) DEFAULT '',
  `customer` int(11) DEFAULT NULL,
  `reseller` int(11) DEFAULT NULL,
  `dealer` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `newspromo` WRITE;
/*!40000 ALTER TABLE `newspromo` DISABLE KEYS */;

INSERT INTO `newspromo` (`id`, `title`, `description`, `image`, `customer`, `reseller`, `dealer`, `created_at`, `updated_at`)
VALUES
	(1,'Test Newspromo','this is description of news & promo','storage/app/image/V702YPDsWg55v07b3trNxU29pIwxnzdLUG2nbU6n.jpeg',1,1,0,'2017-11-20 16:05:44','2018-01-05 15:48:08'),
	(2,'Test2','This is for testing purpose','storage/app/image/DKZFUTsMyYz3BLcWc1VBvqpZXcgk8DsPvAWf0W7c.jpeg',1,0,1,'2017-11-20 16:38:28','2018-01-05 15:46:26'),
	(3,'Test3','This is for testing purpose','storage/app/image/hiogJe7OHVDtAQps0wUxY2lIAyCh4uXNGfSDqyPK.jpeg',1,1,1,'2017-11-20 16:40:21','2018-01-05 15:48:01');

/*!40000 ALTER TABLE `newspromo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `invoice_no`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `created_at`, `updated_at`)
VALUES
	(16,'5a421ea663832',33,21500000,0,0,21500000,'2018-01-23 00:04:40','2018-01-16 14:19:35'),
	(17,'5a421ec64689f',33,21500000,0,0,21500000,'2018-01-23 00:04:40','2018-01-16 14:23:23'),
	(18,'5a421ec7ad8b9',33,21500000,0,0,21500000,'2018-01-23 00:04:40','2018-01-16 14:19:37'),
	(19,'5a421ec8c474e',33,21500000,0,0,21500000,'2018-01-23 00:04:40','2018-01-16 14:23:24'),
	(21,'5a532691d2f75',33,20000000,0,0,20000000,'2018-01-23 00:04:40','2018-01-08 15:06:41'),
	(22,'5a5326edaece7',33,20000000,2000000,0,18000000,'2018-01-23 00:04:40','2018-01-08 15:08:13'),
	(23,'5a533d5148756',33,40000000,0,0,40000000,'2018-01-23 00:04:40','2018-01-08 16:43:45'),
	(24,'5a5340060348f',33,40000000,4000000,0,36000000,'2018-01-23 00:04:40','2018-01-08 16:55:18'),
	(25,'5a534173af00d',33,40000000,4000000,0,36000000,'2018-01-23 00:04:40','2018-01-08 17:01:23'),
	(26,'5a534460008e3',33,20000000,2000000,0,18000000,'2018-01-23 00:04:40','2018-01-08 17:13:52'),
	(27,'5a536eee5d52d',33,20000000,0,0,20000000,'2018-01-23 00:04:40','2018-01-08 20:15:26'),
	(28,'5a547e8a7e972',33,40000000,0,0,40000000,'2018-01-23 00:04:40','2018-01-09 15:34:18'),
	(29,'5a55e0369af1d',33,5000000,500000,0,4500000,'2018-01-23 00:04:40','2018-01-10 16:43:18'),
	(30,'5a55e50337b48',33,5000000,500000,0,4500000,'2018-01-23 00:04:40','2018-01-10 17:03:47'),
	(31,'5a55eccda82f0',33,5500000,500000,0,5000000,'2018-01-23 00:04:40','2018-01-10 17:37:01'),
	(32,'5a55f02227da1',33,5500000,0,0,5500000,'2018-01-23 00:04:40','2018-01-10 17:51:14'),
	(33,'5a5efb6a1138b',33,10000000,0,0,10000000,'2018-01-23 00:04:40','2018-01-17 14:29:46'),
	(34,'5a5efecb128ac',33,10000000,0,0,10000000,'2018-01-23 00:04:40','2018-01-17 14:44:11'),
	(35,'5a607c394b37c',7,8000000,0,0,8000000,'2018-01-23 00:04:40','2018-01-18 17:51:37'),
	(36,'5a607dc908436',7,450000,0,0,450000,'2018-01-23 00:04:40','2018-01-18 17:58:17'),
	(37,'5a607f3d9b9ed',7,4000000,0,0,4000000,'2018-01-23 00:04:40','2018-01-18 18:04:29'),
	(38,'5a61c8aeabadb',54,5000000,500000,0,4500000,'2018-01-23 00:04:40','2018-01-19 17:30:06');

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_action`;

CREATE TABLE `order_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_progress_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `take_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `order_action` WRITE;
/*!40000 ALTER TABLE `order_action` DISABLE KEYS */;

INSERT INTO `order_action` (`id`, `order_progress_id`, `order_id`, `category_id`, `take_by`, `created_at`, `updated_at`)
VALUES
	(4,12,17,3,7,'2018-01-23 00:01:32','2017-12-26 17:07:18'),
	(5,11,17,1,7,'2018-01-23 00:01:32','2017-12-26 17:07:17'),
	(6,16,19,3,7,'2018-01-23 00:01:32','2017-12-26 17:09:03'),
	(7,15,19,1,7,'2018-01-23 00:01:32','2017-12-26 17:09:06'),
	(8,10,16,3,7,'2018-01-23 00:01:32','2018-01-17 17:41:43'),
	(9,43,38,1,7,'2018-01-23 00:01:32','2018-01-19 17:31:40');

/*!40000 ALTER TABLE `order_action` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_billing_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_billing_detail`;

CREATE TABLE `order_billing_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address_1` longtext,
  `lat` varchar(150) DEFAULT NULL,
  `lng` varchar(150) DEFAULT NULL,
  `address_2` longtext,
  `city_id` int(11) DEFAULT NULL,
  `zip_code` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

LOCK TABLES `order_billing_detail` WRITE;
/*!40000 ALTER TABLE `order_billing_detail` DISABLE KEYS */;

INSERT INTO `order_billing_detail` (`id`, `order_id`, `name`, `email`, `phone`, `address_1`, `lat`, `lng`, `address_2`, `city_id`, `zip_code`, `created_at`, `updated_at`)
VALUES
	(5,16,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2017-12-26 17:04:22'),
	(6,17,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2017-12-26 17:04:54'),
	(7,18,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2017-12-26 17:04:55'),
	(8,19,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2017-12-26 17:04:56'),
	(9,20,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2018-01-08 14:59:40'),
	(10,21,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2018-01-08 15:06:41'),
	(11,22,'Jordy Jonatan','jorjonna@gmail.com','081289256242','Jalan Citra Garden 2X, RT.10/RW.12, Pegadungan, Kalideres, RT.9/RW.12, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11840','-6.1409145','106.7058562','Citra Garden 2',1,'11830','2018-01-23 00:01:54','2018-01-08 15:08:13'),
	(12,23,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429812','106.6138181','Monaco village',1,'11830','2018-01-23 00:01:54','2018-01-08 16:43:45'),
	(13,24,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429812','106.6138181','Monaco village',1,'11830','2018-01-23 00:01:54','2018-01-08 16:55:18'),
	(14,25,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429812','106.6138181','Monaco village',1,'1120','2018-01-23 00:01:54','2018-01-08 17:01:23'),
	(15,26,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429812','106.6138181','Monaco village',1,'11830','2018-01-23 00:01:54','2018-01-08 17:13:52'),
	(16,27,'George','george@dev.com','08999310048','Jalan Tanah Lot,Kalideres,Kota Jakarta Barat','-6.1523982','106.7133284','Monaco village',1,'11820','2018-01-23 00:01:54','2018-01-08 20:15:26'),
	(17,28,'George','george@dev.com','08999310048','Jalan Boulevard Raya Gading Serpong,Kelapa Dua,Tangerang','-6.242762665323885','106.61527972170416','Monaco village',1,'1130','2018-01-23 00:01:54','2018-01-09 15:34:18'),
	(18,29,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,NULL,'2018-01-23 00:01:54','2018-01-10 16:43:18'),
	(19,30,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,NULL,'2018-01-23 00:01:54','2018-01-10 17:03:47'),
	(20,31,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,NULL,'2018-01-23 00:01:54','2018-01-10 17:37:01'),
	(21,32,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,NULL,'2018-01-23 00:01:54','2018-01-10 17:51:14'),
	(22,33,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,'8757','2018-01-23 00:01:54','2018-01-17 14:29:46'),
	(23,34,'George','george@dev.com','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429802','106.6138121','Monaco village',1,NULL,'2018-01-23 00:01:54','2018-01-17 14:44:11'),
	(24,35,'Developer','dev@brother.co.id','0000','Harco Mangga Dua, South Mangga Dua, Central Jakarta City, Jakarta, Indonesia','-6.138984300000001','106.82849290000001','Jl. A',1,NULL,'2018-01-23 00:01:54','2018-01-18 17:51:37'),
	(25,36,'Developer','dev@brother.co.id','0000','Harco Mangga Dua, South Mangga Dua, Central Jakarta City, Jakarta, Indonesia','-6.138984300000001','106.82849290000001','Jl. A',1,NULL,'2018-01-23 00:01:54','2018-01-18 17:58:17'),
	(26,37,'Developer','dev@brother.co.id','0000','Harco Mangga Dua, South Mangga Dua, Central Jakarta City, Jakarta, Indonesia','-6.138984300000001','106.82849290000001','Jl. A',1,NULL,'2018-01-23 00:01:54','2018-01-18 18:04:29'),
	(27,38,'Felix Boenawan','felix.boenawan@gmail.com','08121957740','Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.2429808','106.613816','Monaco Village',1,NULL,'2018-01-23 00:01:54','2018-01-19 17:30:06');

/*!40000 ALTER TABLE `order_billing_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_cancel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_cancel`;

CREATE TABLE `order_cancel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_progress_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `reason` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `order_cancel` WRITE;
/*!40000 ALTER TABLE `order_cancel` DISABLE KEYS */;

INSERT INTO `order_cancel` (`id`, `order_progress_id`, `order_id`, `category_id`, `cancel_by`, `reason`, `created_at`, `updated_at`)
VALUES
	(4,13,18,1,3,'test','2017-12-26 17:07:56','2017-12-26 17:07:56'),
	(5,14,18,3,3,'test','2017-12-26 17:07:59','2017-12-26 17:07:59'),
	(6,11,17,1,7,'test','2017-12-26 17:28:44','0000-00-00 00:00:00'),
	(7,20,21,3,33,'Stok habis','2018-01-16 13:58:34','2018-01-16 13:58:34'),
	(8,19,21,1,33,'Stok habis','2018-01-16 14:04:39','2018-01-16 14:04:39'),
	(9,42,37,1,7,'Salah order','2018-01-18 18:05:05','2018-01-18 18:05:05');

/*!40000 ALTER TABLE `order_cancel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_progress_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `base_price` float NOT NULL,
  `nego_price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`id`, `order_progress_id`, `order_id`, `product_id`, `category_id`, `qty`, `base_price`, `nego_price`, `created_at`, `updated_at`)
VALUES
	(25,9,16,1,1,4,5000000,5000000,'2017-12-26 17:04:22','2017-12-26 17:04:22'),
	(26,10,16,2,3,3,500000,500000,'2017-12-26 17:04:22','2017-12-26 17:04:22'),
	(27,11,17,1,1,4,5000000,5000000,'2017-12-26 17:04:54','2017-12-26 17:04:54'),
	(28,12,17,2,3,3,500000,500000,'2017-12-26 17:04:54','2017-12-26 17:04:54'),
	(29,13,18,1,1,4,5000000,5000000,'2017-12-26 17:04:55','2017-12-26 17:04:55'),
	(30,14,18,2,3,3,500000,500000,'2017-12-26 17:04:55','2017-12-26 17:04:55'),
	(31,15,19,1,1,4,5000000,5000000,'2017-12-26 17:04:56','2017-12-26 17:04:56'),
	(32,16,19,2,3,3,500000,500000,'2017-12-26 17:04:56','2017-12-26 17:04:56'),
	(33,17,20,1,1,4,5000000,5000000,'2018-01-08 14:59:40','2018-01-08 14:59:40'),
	(34,18,20,2,3,4,500000,500000,'2018-01-08 14:59:40','2018-01-08 14:59:40'),
	(35,19,21,1,1,4,5000000,5000000,'2018-01-08 15:06:41','2018-01-08 15:06:41'),
	(36,20,21,2,3,4,500000,500000,'2018-01-08 15:06:41','2018-01-08 15:06:41'),
	(37,21,22,1,1,4,5000000,5000000,'2018-01-08 15:08:13','2018-01-08 15:08:13'),
	(38,22,22,2,3,4,500000,500000,'2018-01-08 15:08:13','2018-01-08 15:08:13'),
	(39,23,23,1,1,8,5000000,5000000,'2018-01-08 16:43:45','2018-01-08 16:43:45'),
	(40,24,24,1,1,8,5000000,5000000,'2018-01-08 16:55:18','2018-01-08 16:55:18'),
	(41,25,25,1,1,8,5000000,5000000,'2018-01-08 17:01:23','2018-01-08 17:01:23'),
	(42,26,26,1,1,4,5000000,5000000,'2018-01-08 17:13:52','2018-01-08 17:13:52'),
	(43,27,26,2,3,4,500000,500000,'2018-01-08 17:13:52','2018-01-08 17:13:52'),
	(44,28,27,1,1,4,5000000,5000000,'2018-01-08 20:15:26','2018-01-08 20:15:26'),
	(45,29,27,2,3,4,500000,500000,'2018-01-08 20:15:26','2018-01-08 20:15:26'),
	(46,30,28,1,1,8,5000000,5000000,'2018-01-09 15:34:18','2018-01-09 15:34:18'),
	(47,31,29,1,1,1,5000000,5000000,'2018-01-10 16:43:18','2018-01-10 16:43:18'),
	(48,32,30,1,1,1,5000000,5000000,'2018-01-10 17:03:47','2018-01-10 17:03:47'),
	(49,33,31,1,1,1,5000000,5000000,'2018-01-10 17:37:01','2018-01-10 17:37:01'),
	(50,34,31,2,3,1,500000,500000,'2018-01-10 17:37:01','2018-01-10 17:37:01'),
	(51,35,32,1,1,1,5000000,5000000,'2018-01-10 17:51:14','2018-01-10 17:51:14'),
	(52,36,32,2,3,1,500000,500000,'2018-01-10 17:51:14','2018-01-10 17:51:14'),
	(53,37,33,1,1,1,5000000,5000000,'2018-01-17 14:29:46','2018-01-17 14:29:46'),
	(54,37,33,3,1,1,5000000,5000000,'2018-01-17 14:29:46','2018-01-17 14:41:28'),
	(55,39,34,1,1,1,5000000,5000000,'2018-01-17 14:44:11','2018-01-17 14:44:11'),
	(56,39,34,3,1,1,5000000,5000000,'2018-01-17 14:44:11','2018-01-17 14:44:11'),
	(57,40,35,1,1,2,4000000,4000000,'2018-01-18 17:51:37','2018-01-18 17:51:37'),
	(58,41,36,2,3,1,450000,450000,'2018-01-18 17:58:17','2018-01-18 17:58:17'),
	(59,42,37,3,1,1,4000000,4000000,'2018-01-18 18:04:29','2018-01-18 18:04:29'),
	(60,43,38,1,1,1,5000000,4000000,'2018-01-19 17:30:06','2018-01-19 17:32:47');

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item_detail`;

CREATE TABLE `order_item_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_detail_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

LOCK TABLES `order_item_detail` WRITE;
/*!40000 ALTER TABLE `order_item_detail` DISABLE KEYS */;

INSERT INTO `order_item_detail` (`id`, `order_detail_id`, `product_id`, `serial_number`, `created_at`, `updated_at`)
VALUES
	(43,25,1,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(44,25,1,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(45,25,1,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(46,25,1,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(47,26,2,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(48,26,2,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(49,26,2,'','2018-01-23 00:02:23','2017-12-26 17:04:22'),
	(50,27,1,'','2018-01-23 00:02:23','2017-12-26 17:04:54'),
	(51,27,1,'','2018-01-23 00:02:23','2017-12-26 17:04:54'),
	(52,27,1,'','2018-01-23 00:02:23','2017-12-26 17:04:54'),
	(53,27,1,'','2018-01-23 00:02:23','2017-12-26 17:04:54'),
	(54,28,2,'8995952008230','2018-01-23 00:02:23','2018-01-19 13:20:50'),
	(55,28,2,'8997878003146','2018-01-23 00:02:23','2018-01-19 13:20:50'),
	(56,28,2,'8993005124029','2018-01-23 00:02:23','2018-01-19 13:20:50'),
	(57,29,1,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(58,29,1,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(59,29,1,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(60,29,1,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(61,30,2,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(62,30,2,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(63,30,2,'','2018-01-23 00:02:23','2017-12-26 17:04:55'),
	(64,31,1,'abc','2018-01-23 00:02:23','2017-12-26 17:18:10'),
	(65,31,1,'abcd','2018-01-23 00:02:23','2017-12-26 17:18:10'),
	(66,31,1,'abcde','2018-01-23 00:02:23','2017-12-26 17:18:10'),
	(67,31,1,'abcdef','2018-01-23 00:02:23','2017-12-26 17:18:10'),
	(68,32,2,'','2018-01-23 00:02:23','2017-12-26 17:04:56'),
	(69,32,2,'','2018-01-23 00:02:23','2017-12-26 17:04:56'),
	(70,32,2,'','2018-01-23 00:02:23','2017-12-26 17:04:56'),
	(71,33,1,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(72,33,1,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(73,33,1,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(74,33,1,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(75,34,2,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(76,34,2,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(77,34,2,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(78,34,2,'','2018-01-23 00:02:23','2018-01-08 14:59:40'),
	(79,35,1,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(80,35,1,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(81,35,1,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(82,35,1,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(83,36,2,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(84,36,2,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(85,36,2,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(86,36,2,'','2018-01-23 00:02:23','2018-01-08 15:06:41'),
	(87,37,1,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(88,37,1,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(89,37,1,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(90,37,1,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(91,38,2,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(92,38,2,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(93,38,2,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(94,38,2,'','2018-01-23 00:02:23','2018-01-08 15:08:13'),
	(95,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(96,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(97,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(98,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(99,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(100,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(101,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(102,39,1,'','2018-01-23 00:02:23','2018-01-08 16:43:45'),
	(103,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(104,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(105,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(106,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(107,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(108,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(109,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(110,40,1,'','2018-01-23 00:02:23','2018-01-08 16:55:18'),
	(111,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(112,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(113,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(114,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(115,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(116,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(117,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(118,41,1,'','2018-01-23 00:02:23','2018-01-08 17:01:23'),
	(119,42,1,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(120,42,1,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(121,42,1,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(122,42,1,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(123,43,2,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(124,43,2,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(125,43,2,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(126,43,2,'','2018-01-23 00:02:23','2018-01-08 17:13:52'),
	(127,44,1,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(128,44,1,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(129,44,1,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(130,44,1,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(131,45,2,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(132,45,2,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(133,45,2,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(134,45,2,'','2018-01-23 00:02:23','2018-01-08 20:15:26'),
	(135,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(136,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(137,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(138,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(139,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(140,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(141,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(142,46,1,'','2018-01-23 00:02:23','2018-01-09 15:34:18'),
	(143,47,1,'','2018-01-23 00:02:23','2018-01-10 16:43:18'),
	(144,48,1,'','2018-01-23 00:02:23','2018-01-10 17:03:47'),
	(145,49,1,'','2018-01-23 00:02:23','2018-01-10 17:37:01'),
	(146,50,2,'','2018-01-23 00:02:23','2018-01-10 17:37:01'),
	(147,51,1,'','2018-01-23 00:02:23','2018-01-10 17:51:14'),
	(148,52,2,'','2018-01-23 00:02:23','2018-01-10 17:51:14'),
	(149,53,1,'','2018-01-23 00:02:23','2018-01-17 14:29:46'),
	(150,54,3,'','2018-01-23 00:02:23','2018-01-17 14:29:46'),
	(151,55,1,'','2018-01-23 00:02:23','2018-01-17 14:44:11'),
	(152,56,3,'','2018-01-23 00:02:23','2018-01-17 14:44:11'),
	(153,57,1,'','2018-01-23 00:02:23','2018-01-18 17:51:37'),
	(154,57,1,'','2018-01-23 00:02:23','2018-01-18 17:51:37'),
	(155,58,2,'','2018-01-23 00:02:23','2018-01-18 17:58:17'),
	(156,59,3,'','2018-01-23 00:02:23','2018-01-18 18:04:29'),
	(157,60,1,'','2018-01-23 00:02:23','2018-01-19 17:30:06');

/*!40000 ALTER TABLE `order_item_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_progress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_progress`;

CREATE TABLE `order_progress` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_order` varchar(150) DEFAULT NULL,
  `status_payment` varchar(150) DEFAULT NULL,
  `status_progress` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

LOCK TABLES `order_progress` WRITE;
/*!40000 ALTER TABLE `order_progress` DISABLE KEYS */;

INSERT INTO `order_progress` (`id`, `order_id`, `category_id`, `status_order`, `status_payment`, `status_progress`, `created_at`, `updated_at`)
VALUES
	(9,16,1,'new','pending','waiting','2017-12-26 17:04:22','2017-12-26 17:08:17'),
	(10,16,3,'progress','pending','approval','2017-12-26 17:04:22','2018-01-18 17:25:49'),
	(11,17,1,'cancel','pending','offering','2017-12-26 17:04:54','2017-12-26 17:28:03'),
	(12,17,3,'progress','settlement','delivery order','2017-12-26 17:04:54','2018-01-19 13:20:50'),
	(13,18,1,'cancel','pending','waiting','2017-12-26 17:04:55','2017-12-26 17:07:56'),
	(14,18,3,'cancel','pending','waiting','2017-12-26 17:04:55','2017-12-26 17:07:59'),
	(15,19,1,'finish','settlement','closed','2017-12-26 17:04:56','2018-01-19 15:28:45'),
	(16,19,3,'progress','accept','approved','2017-12-26 17:04:56','2017-12-26 17:13:35'),
	(19,21,1,'cancel','pending','waiting','2018-01-08 15:06:41','2018-01-16 14:04:39'),
	(20,21,3,'cancel','pending','waiting','2018-01-08 15:06:41','2018-01-16 13:58:34'),
	(21,22,1,'new','pending','waiting','2018-01-08 15:08:13','2018-01-08 15:08:13'),
	(22,22,3,'new','pending','waiting','2018-01-08 15:08:13','2018-01-08 15:08:13'),
	(23,23,1,'new','pending','waiting','2018-01-08 16:43:45','2018-01-08 16:43:45'),
	(24,24,1,'new','pending','waiting','2018-01-08 16:55:18','2018-01-08 16:55:18'),
	(25,25,1,'new','pending','waiting','2018-01-08 17:01:23','2018-01-08 17:01:23'),
	(26,26,1,'new','pending','waiting','2018-01-08 17:13:52','2018-01-08 17:13:52'),
	(27,26,3,'new','pending','waiting','2018-01-08 17:13:52','2018-01-08 17:13:52'),
	(28,27,1,'new','pending','waiting','2018-01-08 20:15:26','2018-01-08 20:15:26'),
	(29,27,3,'new','pending','waiting','2018-01-08 20:15:26','2018-01-08 20:15:26'),
	(30,28,1,'new','pending','waiting','2018-01-09 15:34:18','2018-01-09 15:34:18'),
	(31,29,1,'new','pending','waiting','2018-01-10 16:43:18','2018-01-10 16:43:18'),
	(32,30,1,'new','pending','waiting','2018-01-10 17:03:47','2018-01-10 17:03:47'),
	(33,31,1,'new','pending','waiting','2018-01-10 17:37:01','2018-01-10 17:37:01'),
	(34,31,3,'new','pending','waiting','2018-01-10 17:37:01','2018-01-10 17:37:01'),
	(35,32,1,'new','pending','waiting','2018-01-10 17:51:14','2018-01-10 17:51:14'),
	(36,32,3,'new','pending','waiting','2018-01-10 17:51:14','2018-01-10 17:51:14'),
	(37,33,1,'new','pending','waiting','2018-01-17 14:29:46','2018-01-17 14:29:46'),
	(39,34,1,'new','pending','waiting','2018-01-17 14:44:11','2018-01-17 14:44:11'),
	(40,35,1,'new','pending','waiting','2018-01-18 17:51:37','2018-01-18 17:51:37'),
	(41,36,3,'new','pending','waiting','2018-01-18 17:58:17','2018-01-18 17:58:17'),
	(42,37,1,'cancel','pending','waiting','2018-01-18 18:04:29','2018-01-18 18:05:05'),
	(43,38,1,'progress','pending','approval','2018-01-19 17:30:06','2018-01-19 17:32:47');

/*!40000 ALTER TABLE `order_progress` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL,
  `price_for_customer` float NOT NULL,
  `price_for_reseller` float NOT NULL,
  `description` longtext NOT NULL,
  `img_url` longtext NOT NULL,
  `brochure_url` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `product_name`, `category_id`, `price_for_customer`, `price_for_reseller`, `description`, `img_url`, `brochure_url`, `created_at`, `updated_at`)
VALUES
	(1,'Brother Printer 1',1,5000000,4000000,'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum','storage/app/image/mxN0gInkBP11OiZLSVghoWBb4EDpr4bqDukKzhZN.png','storage/app/brochure/Lmer3pa9i2n5049F9NJUXMQ9sfxnRz9i6HKnwNWO.pdf','2017-11-15 20:44:28','2018-01-17 14:27:52'),
	(2,'TEST',3,500000,450000,'TESTING PURPOSE','storage/app/image/HeYZNACjvxcHdB0X4ZsJg84sLJ3DdI2beIUwAgtN.png','storage/app/brochure/U8ViiIws0nHJpmfYKHyema7WwVFSrzTM5F7CtxfG.pdf','2017-11-15 20:51:03','2017-11-20 15:05:29'),
	(3,'Brother Printer 2',1,5000000,4000000,'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum','storage/app/image/mxN0gInkBP11OiZLSVghoWBb4EDpr4bqDukKzhZN.png','storage/app/brochure/Lmer3pa9i2n5049F9NJUXMQ9sfxnRz9i6HKnwNWO.pdf','2017-11-15 20:44:28','2018-01-17 14:27:56');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Printer Inkjet','printer_inkjet','2017-11-20 13:39:45','2017-11-20 13:40:58'),
	(2,'Printer Laser','printer_laser','2017-11-20 13:39:53','2017-11-20 13:41:04'),
	(3,'Printer Label','printer_label','2017-11-20 13:40:00','2017-11-20 13:41:10'),
	(4,'Scanner','scanner','2017-11-20 13:40:07','2017-11-20 13:41:15'),
	(5,'Mesin Jahit','mesin_jahit','2017-11-20 13:40:16','2017-11-20 13:41:23'),
	(6,'Lain-lain','lain_lain','2017-11-20 13:40:30','2017-11-20 13:41:31');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reseller
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reseller`;

CREATE TABLE `reseller` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `store_name` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `store_photo` varchar(150) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address_1` longtext,
  `lat` varchar(150) DEFAULT '0',
  `lng` varchar(150) DEFAULT '0',
  `address_2` longtext,
  `printer_inkjet` int(11) DEFAULT NULL,
  `printer_laser` int(11) DEFAULT NULL,
  `printer_label` int(11) DEFAULT NULL,
  `scanner` int(11) DEFAULT NULL,
  `mesin_jahit` int(11) DEFAULT NULL,
  `lain_lain` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

LOCK TABLES `reseller` WRITE;
/*!40000 ALTER TABLE `reseller` DISABLE KEYS */;

INSERT INTO `reseller` (`id`, `identifier`, `store_name`, `name`, `phone`, `store_photo`, `city_id`, `address_1`, `lat`, `lng`, `address_2`, `printer_inkjet`, `printer_laser`, `printer_label`, `scanner`, `mesin_jahit`, `lain_lain`, `created_at`, `updated_at`)
VALUES
	(1,5,'Brother Indonesia','Support','0000',NULL,1,'Mangga Dua Square, Ancol, North Jakarta City, Jakarta, Indonesia','-6.138442599999999','106.83184060000008','Jl. A',1,1,1,1,1,1,'2017-12-05 22:53:49','2017-12-06 18:31:54'),
	(2,7,'Brother Indonesia','Developer','0000',NULL,1,'Harco Mangga Dua, South Mangga Dua, Central Jakarta City, Jakarta, Indonesia','-6.138984300000001','106.82849290000001','Jl. A',1,1,1,0,0,0,'2017-12-05 22:53:49','2018-01-18 18:59:59'),
	(6,50,'sasa','joe','021','storage/app/image/Kdxu0pEAxVQWqXfg5nfW7YrHmXONeZpUYu7WggXO.png',1,'jl.jl','0','0','sasa',1,1,0,0,0,0,'2018-01-04 14:51:35','2018-01-04 14:51:35'),
	(7,52,'Dev Store','Jordy','09564','',1,'Jalan Princess Alice 2,Kelapa Dua,Tangerang','-6.242981','106.6138172','Tangerang',1,1,0,0,0,0,'2018-01-04 16:49:53','2018-01-04 16:49:53'),
	(8,55,'Toko Kelontong','Amir','54613','',3,'Bogor, Bogor City, West Java, Indonesia','-6.597146899999999','106.8060388','Bogor',1,0,0,0,0,0,'2018-01-20 00:28:53','2018-01-20 00:28:53'),
	(9,56,'Toko ghh','Jkl','3265','',49,'Jalan Perumahan Citra Utama 2,Kalideres,Kota Jakarta Barat','-6.1349801','106.6996337','Citra',1,0,0,0,0,0,'2018-01-20 00:42:38','2018-01-20 00:42:38'),
	(10,57,'Sdf','Sdf','235','',40,'Jalan Perumahan Citra Utama 2,Kalideres,Kota Jakarta Barat','-6.1350057','106.6996228','Ghj',1,0,0,0,0,0,'2018-01-20 00:51:01','2018-01-20 00:51:01'),
	(11,58,'Jl','Jl','123','',49,'Jalan Perumahan Citra Utama 2,Kalideres,Kota Jakarta Barat','-6.134982','106.6996212','Ty',1,0,0,0,0,0,'2018-01-20 00:54:18','2018-01-20 00:54:18'),
	(12,59,'Toko Cahya','Cahyadi','456456','storage/app/image/nIyT1mpNNBcA3pym4pIMyg56x80FnQkYCSQAGBvx.jpeg',44,'Jalan Perumahan Citra Utama 2,Kalideres,Kota Jakarta Barat','-6.1349882','106.6996136','Banjarmasin',1,1,1,1,1,1,'2018-01-20 01:02:41','2018-01-20 01:02:42');

/*!40000 ALTER TABLE `reseller` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin','2017-11-20 13:46:35','0000-00-00 00:00:00'),
	(2,'Customer','customer','2017-11-20 13:46:51','0000-00-00 00:00:00'),
	(3,'Reseller Owner','reseller_owner','2017-11-20 13:47:23','0000-00-00 00:00:00'),
	(4,'Reseller Staff','reseller_staff','2017-11-20 13:47:32','2017-11-20 13:47:42'),
	(5,'Master Dealer','master_dealer','2017-11-20 13:48:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `cp_name` varchar(150) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `province` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `pic` varchar(150) NOT NULL,
  `telephone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `onsite` varchar(150) DEFAULT '0',
  `inhouse` varchar(150) DEFAULT '0',
  `sic` varchar(150) DEFAULT '0',
  `sellbro` varchar(150) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

INSERT INTO `service` (`id`, `city_id`, `cp_name`, `type_id`, `status_id`, `province`, `address`, `pic`, `telephone`, `email`, `onsite`, `inhouse`, `sic`, `sellbro`, `created_at`, `updated_at`)
VALUES
	(1,1,'Citra Abadi',1,1,'DKI','Jakarta Timur Ruko Manggis 3','Bob Andrean','021000000','bobandrean@gmail.com','1',NULL,'1','1','2017-11-16 12:16:37','2017-11-20 14:14:02'),
	(2,2,'Citra Raya',3,1,'Kab. Bekasi','MEIKARTA Ruko 3 Mangga','Boen','021000000','bobandrean@gmail.com','1',NULL,'1',NULL,'2017-11-16 12:16:37','2017-11-20 14:42:04'),
	(3,1,'TEST',3,1,'DKI','Jl. RAYA','JOE','021000000','joe@gmail.com','1','1',NULL,NULL,'2017-11-20 14:39:46','2017-11-20 14:41:55');

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_status`;

CREATE TABLE `service_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `service_status` WRITE;
/*!40000 ALTER TABLE `service_status` DISABLE KEYS */;

INSERT INTO `service_status` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'BRANCH OFFICE','branch_office','2017-11-20 14:02:01','2017-11-20 14:09:10'),
	(2,'HEAD OFFICE','head_office','2017-11-20 14:02:10','2017-11-20 14:09:13'),
	(3,'ITSC PARTNER','itsc_partner','2017-11-20 14:06:42','2017-11-20 14:09:17'),
	(4,'TSG PARTNER','tsg_partner','2017-11-20 14:06:48','2017-11-20 14:09:22'),
	(5,'ITSC','itsc','2017-11-20 14:08:13','2017-11-20 14:09:24');

/*!40000 ALTER TABLE `service_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_type`;

CREATE TABLE `service_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;

INSERT INTO `service_type` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'SERVICE CENTER','service_center','2017-11-20 13:54:26','2017-11-20 13:54:35'),
	(2,'DISTRIBUTOR & SERVICE CENTER','distributor_and_service_center','2017-11-20 13:54:50','2017-11-20 13:55:01'),
	(3,'CUSTOMER CARE','customer_care','2017-11-20 13:55:18','0000-00-00 00:00:00'),
	(4,'ITSC Partner','itsc_partner','2017-11-20 13:56:24','0000-00-00 00:00:00'),
	(5,'Standby Engineer','standby_engineer','2017-11-20 13:56:46','0000-00-00 00:00:00'),
	(6,'DEALER & SERVICE CENTER','dealer_and_service_center','2017-11-20 13:57:07','2017-11-20 13:57:18'),
	(7,'MASTER DEALER & SERVICE CENTER','mater_dealer_and_service_center','2017-11-20 13:58:53','2017-11-20 14:00:49'),
	(8,'SI SERVICE PARTNER','si_service_center','2017-11-20 14:00:04','2017-11-20 14:00:56');

/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ticket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(150) NOT NULL DEFAULT '',
  `department` varchar(150) NOT NULL DEFAULT '',
  `subject` varchar(150) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'Unreplied',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;

INSERT INTO `ticket` (`id`, `sender_id`, `department`, `subject`, `message`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'1','Customer Service','Test Subject','Hi','Unreplied','2017-11-16 13:43:07','2017-12-05 16:22:40'),
	(5,'1','Customer Service','Test Subject','Hi','Replied','2017-11-16 13:43:07','2017-12-05 16:22:41'),
	(6,'1','Customer Service','Test Subject','Hi','Closed','2017-11-16 13:43:07','2017-12-05 16:22:42'),
	(7,'1','Customer Service','Test Subject','Hi','Closed','2017-11-16 13:43:07','2017-12-05 16:50:41'),
	(8,'3','Technical','Test','Hi','Unread','2017-12-16 16:01:16','2017-12-16 16:02:50'),
	(9,'33','Customer Service','test','testetststs','Unreplied','2018-01-05 14:01:36','2018-01-05 14:01:36'),
	(10,'33','Technical','Add to cart issue','I can\'t add to cart. It show me there is a problem with the server. Please help me','Unreplied','2018-01-05 15:02:15','2018-01-05 15:02:15'),
	(11,'7','Technical','Tidak bisa login','Selamat siang, saya tidak bisa login.','Unreplied','2018-01-19 16:58:59','2018-01-19 16:58:59');

/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `api_key` varchar(255) DEFAULT '',
  `status` varchar(150) DEFAULT 'active',
  `remember_token` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `email`, `password`, `api_key`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,1,'jorjonna@gmail.com','$2y$10$JhmCIKdDVrROlQ913JjiyOMprsCuvB8Wn8H.CzgqMGQli1UtinBF6','key-5a265cda9f1dc','active','','2017-12-28 16:26:31','2017-12-28 16:22:58'),
	(2,1,'dev@dev.com','$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje','key-5a265e17644da','active','','2017-12-05 15:51:35','2017-12-05 15:51:35'),
	(3,2,'jordyjonatan93@yahoo.com','$2y$10$dHXpldcwNzipHXoJOr4dneDEMGNY075WpDjNq3OvvPMqVRC9pUjFy','key-5a265e17644db','active','','2017-12-29 13:58:45','2017-12-29 13:58:45'),
	(4,5,'support@brother.co.id','$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje','key-5a265e17644dc','active','','2017-12-06 16:51:20','2017-12-06 16:51:20'),
	(5,3,'support@brother.co.id','$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje','key-5a265e17644dd','active','','2017-12-05 22:53:05','0000-00-00 00:00:00'),
	(7,4,'dev@brother.co.id','$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje','key-5a265e17644de','active','','2017-12-06 16:43:12','2017-12-06 16:43:12'),
	(33,2,'george@dev.com','$2y$10$3amjYRBf1YENxQdoXyVLOOw//MnjfoP7rezSRSzgcSUDnS.RxBc8q','key-5a45e08f04630','active','','2018-01-05 13:15:19','2018-01-05 13:15:19'),
	(34,2,'abc@def.com','$2y$10$zGWxjbKaYhYtkU025ITiuu28CnNojlPUDW0rqJkwwD6Bdg1yXNHW.','key-5a45e14017855','active','','2018-01-15 12:25:55','2018-01-15 12:25:55'),
	(35,2,'zvb@msak.com','$2y$10$ZBlmkd/cgYD2L6kksjVFUu08acTnHdWXc1w2G84inZnz/ktO2md5S','key-5a45e1840b660','active','','2017-12-29 13:32:43','2017-12-29 13:32:43'),
	(36,2,'andi@jsak.com','$2y$10$lcvwl242OOVe4SP6yOcGK.Ghh1tFHUCJGcckSOpLOGL8MKcU5tNya','key-5a45e1b893828','active','','2017-12-29 13:33:33','2017-12-29 13:33:33'),
	(37,2,'handywijaya33@gmail.com','$2y$10$d/dA3eiA98ab.832..Ne/.7NufVsaDsTqj1FNORCnTRfg8l4bw.66','key-5a45e860265ee','active','','2017-12-29 14:02:18','2017-12-29 14:02:18'),
	(49,2,'andi@andi.com','$2y$10$SdqgPCzJn8sCRD.TvGrvoO22WPV/ufgppRTXwKf.N5BbEyGQ4EH3O','key-5a4ddc96ad1ae','active','','2018-01-04 14:50:07','2018-01-04 14:50:07'),
	(50,4,'skas@jsaa.com','$2y$10$YzTDVnhsWGXet.Iet9jyA.tRyK90Y/zi2.rbuyrbdhkqM33/bGW3y','key-5a4ddd0792a2b','inactive','','2018-01-04 14:51:35','2018-01-04 14:51:35'),
	(51,4,'hdjd@nfm.com','$2y$10$hXEy/mCWAcOIgznk90XFceIfdMNTQRHAjwTd3roekSSMeP2HRIePe','key-5a4de347bdaa9','inactive','','2018-01-04 15:18:15','2018-01-04 15:18:15'),
	(52,4,'dev@store.com','$2y$10$PVgT4.azax4lcLRI9lzXMefLq5lwNWFA5ln8ABESgOwSiCRq.bZ6O','key-5a4df8c16d1d2','active','','2018-01-04 16:50:13','2018-01-04 16:50:13'),
	(53,1,'admin@admin.com','$2y$10$UQGUZFuPuyn3U8Mf3PRRLeut3mzmMJGD0Q5kRC6k/7B5qLSmBILmG','key-5a4f3b230be23','active','','2018-01-05 15:45:23','2018-01-05 15:45:23'),
	(54,2,'felix.boenawan@gmail.com','$2y$10$232a4IX2Y4X37KT8w9nTke9w1H6qoNc8jr/dYMMV4SQ4TcB5ivrsK','key-5a4f42fb795ff','active','','2018-01-05 16:19:15','2018-01-05 16:19:15'),
	(55,4,'ty@tq.com','$2y$10$I8HFSxA7F8Tij7ZClaiehOJ9nTgMhanLfd8h5jVOPCnzW79vnlizC','key-5a622ad4f2e86','inactive','','2018-01-20 00:28:53','2018-01-20 00:28:53'),
	(56,4,'de@de.com','$2y$10$OtAxGp.3HrwvBc5/WXsGF.7/L3YE0tC5rEV4SN0oxRb100gKbK1Ym','key-5a622e0e5c8fb','inactive','','2018-01-20 00:42:38','2018-01-20 00:42:38'),
	(57,4,'vb@bv.com','$2y$10$GkGMbSGWSONixibUCjO2Vupz..pnpkLDJk2taUA1WKnOyfRehIgAW','key-5a623005ebfe8','inactive','','2018-01-20 00:51:01','2018-01-20 00:51:01'),
	(58,4,'jl@jl.com','$2y$10$p8msA2USExlhAP3/gnM0PueKTVOeXF.BenxQobwhKWY85/eQTW2v6','key-5a6230cae9537','inactive','','2018-01-20 00:54:18','2018-01-20 00:54:18'),
	(59,4,'cahya@abadi.com','$2y$10$HCxUObTT4FGwHSe5nT0C5ekqykAvyvdMODVN12XiWPpipbLCIqSRe','key-5a6232c1c913e','inactive','','2018-01-20 01:02:41','2018-01-20 01:02:41');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table verify_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `verify_code`;

CREATE TABLE `verify_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `otp` varchar(150) DEFAULT '',
  `hash` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `verify_code` WRITE;
/*!40000 ALTER TABLE `verify_code` DISABLE KEYS */;

INSERT INTO `verify_code` (`id`, `otp`, `hash`, `created_at`, `updated_at`)
VALUES
	(5,'910779','$2y$10$/I3ytSB4IMYrjCCrnMl7nuh2k3C72X1iA3KOoxCa531kg8B4VNYfW','2018-01-05 12:41:19','2018-01-05 12:41:19'),
	(6,'303828','$2y$10$44lJXMwTVLnsZxdHq3gGde.J6G10gSzOhV6zGjy2mjMOCIveq2q.y','2018-01-05 12:41:58','2018-01-05 12:41:58'),
	(7,'294003','$2y$10$BjU6FxsRHFk7RAxz/QMU/uapdkvHvB/0QS7U9xSzsgvSelkp8J9eu','2018-01-05 12:48:50','2018-01-05 12:48:50');

/*!40000 ALTER TABLE `verify_code` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher`;

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(150) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `for` varchar(50) NOT NULL DEFAULT '',
  `product_category` int(11) DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `quota` int(11) NOT NULL,
  `description` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;

INSERT INTO `voucher` (`id`, `voucher_code`, `discount_rate`, `for`, `product_category`, `valid_from`, `valid_until`, `quota`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'BRDIS10',10,'Customer',1,'2017-11-13','2030-11-23',5,'Discount 20%','2017-11-15 19:14:22','2018-01-08 15:19:39'),
	(2,'BRDIS01',10,'Reseller',1,'2017-11-13','2017-11-30',5,'Discount 10%','2017-11-15 16:51:16','2018-01-08 14:17:53'),
	(3,'BRDIS02',5,'Customer',1,'2017-11-13','2017-11-27',1,'Discount 5%','2017-11-15 16:51:20','2018-01-08 14:17:54');

/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voucher_use
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voucher_use`;

CREATE TABLE `voucher_use` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

LOCK TABLES `voucher_use` WRITE;
/*!40000 ALTER TABLE `voucher_use` DISABLE KEYS */;

INSERT INTO `voucher_use` (`id`, `voucher_id`, `order_id`, `created_at`, `updated_at`)
VALUES
	(3,2,21,'2018-01-08 15:06:41','2018-01-08 15:06:41'),
	(4,2,22,'2018-01-08 15:08:13','2018-01-08 15:08:13'),
	(5,1,24,'2018-01-08 16:55:18','2018-01-08 16:55:18'),
	(6,1,25,'2018-01-08 17:01:23','2018-01-08 17:01:23'),
	(7,1,26,'2018-01-08 17:13:52','2018-01-08 17:13:52'),
	(8,1,29,'2018-01-10 16:43:18','2018-01-10 16:43:18'),
	(9,1,30,'2018-01-10 17:03:47','2018-01-10 17:03:47'),
	(10,1,31,'2018-01-10 17:37:01','2018-01-10 17:37:01'),
	(11,1,38,'2018-01-19 17:30:06','2018-01-19 17:30:06');

/*!40000 ALTER TABLE `voucher_use` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
