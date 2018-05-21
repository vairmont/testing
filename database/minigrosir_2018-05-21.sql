# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: minigrosir
# Generation Time: 2018-05-21 09:34:53 +0000
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


# Dump of table agen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agen`;

CREATE TABLE `agen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` longtext NOT NULL,
  `province` varchar(40) NOT NULL,
  `district` varchar(60) NOT NULL,
  `ktp_photo` varchar(250) NOT NULL,
  `kk_photo` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `agen` WRITE;
/*!40000 ALTER TABLE `agen` DISABLE KEYS */;

INSERT INTO `agen` (`id`, `identifier`, `parent`, `business_name`, `name`, `address`, `province`, `district`, `ktp_photo`, `kk_photo`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'0','tester','address','','','','','2018-04-01 19:42:20','0000-00-00 00:00:00'),
	(2,33,1,'0','agen2','address','','','','','2018-04-01 20:19:26','0000-00-00 00:00:00'),
	(3,35,0,'0','jokow','Jl jokow','','','','','2018-04-09 13:51:26','2018-04-09 13:51:26');

/*!40000 ALTER TABLE `agen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table barcode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `barcode`;

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;

INSERT INTO `cart` (`id`, `user_id`, `voucher_id`, `subtotal`, `discount`, `tax`, `total`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,0,NULL,0,0,'2018-03-28 01:48:23','2018-05-18 12:51:30'),
	(2,33,NULL,0,NULL,0,0,'2018-05-18 12:27:49','2018-05-18 12:27:49');

/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;

INSERT INTO `cart_detail` (`id`, `cart_id`, `product_id`, `qty`, `created_at`, `updated_at`)
VALUES
	(1,1,3,0,'2018-03-28 01:51:19','2018-05-18 12:51:30'),
	(2,1,4,0,'2018-03-28 01:56:14','2018-05-18 12:51:30');

/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cash`;

CREATE TABLE `cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `starting_cash` varchar(150) NOT NULL,
  `sales` varchar(150) NOT NULL,
  `cash_out` varchar(150) NOT NULL,
  `closing_cash` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;

INSERT INTO `cash` (`id`, `user_id`, `starting_cash`, `sales`, `cash_out`, `closing_cash`, `created_at`, `updated_at`)
VALUES
	(1,33,'100000','10000','10000','10000','2018-05-18 14:50:26','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table chat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `message` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;

INSERT INTO `chat` (`id`, `order_id`, `sender_id`, `recipient_id`, `message`, `created_at`, `updated_at`)
VALUES
	(4,19,33,7,'Selamat Siang','2018-01-16 15:23:06','2018-01-16 15:23:06'),
	(5,19,7,33,'Ya selamat siang, ada yang bisa saya bantu?','2018-01-16 15:23:25','2018-01-16 15:23:25'),
	(6,19,33,7,'saya mau nanya','2018-01-16 15:23:35','2018-01-16 15:23:35'),
	(7,19,33,7,'harga barang bisa nego lagi gak ya?','2018-01-16 15:23:45','2018-01-16 15:23:45'),
	(8,19,33,7,'Halo gan','2018-01-16 15:36:06','2018-01-16 15:36:06'),
	(9,19,33,7,'Gimana gan?','2018-01-16 15:38:25','2018-01-16 15:38:25'),
	(10,17,33,7,'Gan??','2018-01-16 15:38:40','2018-01-16 15:38:40'),
	(11,17,7,33,'Ya bro? Ada apa?','2018-01-17 18:43:03','2018-01-17 18:43:03'),
	(12,19,33,7,'Test','2018-01-18 17:47:37','2018-01-18 17:47:37'),
	(13,38,54,7,'Hai bajigur','2018-01-19 17:32:37','2018-01-19 17:32:37'),
	(14,38,7,54,'Oiiii','2018-01-19 17:33:06','2018-01-19 17:33:06'),
	(15,38,7,54,'Ud makan belom??','2018-01-19 17:33:37','2018-01-19 17:33:37');

/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table commission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commission`;

CREATE TABLE `commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agen_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `margin_penjualan` int(11) DEFAULT NULL,
  `incentive` int(11) NOT NULL,
  `commission_pph` int(11) NOT NULL,
  `commission_netto` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `commission` WRITE;
/*!40000 ALTER TABLE `commission` DISABLE KEYS */;

INSERT INTO `commission` (`id`, `agen_id`, `order_id`, `margin_penjualan`, `incentive`, `commission_pph`, `commission_netto`, `created_at`, `updated_at`)
VALUES
	(1,2,2,71250,71250,0,0,'2018-04-01 20:23:30','2018-04-01 20:23:30'),
	(2,2,3,12,12,11,11,'2018-05-06 15:50:11','2018-05-06 15:50:11'),
	(3,2,2,1612,71250,1457,71405,'2018-05-06 16:04:54','2018-05-06 16:04:54');

/*!40000 ALTER TABLE `commission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `identifier`, `name`, `gender`, `phone`, `address`, `created_at`, `updated_at`)
VALUES
	(1,3,'Jordy Jonatan','','081289256242','Jl. Daan Mogot','2017-12-05 22:21:45','2017-12-06 13:03:33'),
	(27,33,'George','','08999310048','Jalan Princess Alice 2,Kelapa Dua,Tangerang','2017-12-29 13:28:31','2018-01-09 15:56:49'),
	(28,34,'Jonatan','','08921038201','Balikpapan City, East Kalimantan, Indonesia','2017-12-29 13:31:28','2017-12-29 13:31:28'),
	(29,1,'bry','','0813123213','jl panjang','2018-03-25 00:51:37','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table diskon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `diskon`;

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('percent','amount') DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `restriction` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `diskon` WRITE;
/*!40000 ALTER TABLE `diskon` DISABLE KEYS */;

INSERT INTO `diskon` (`id`, `name`, `type`, `rate`, `restriction`, `created_at`, `updated_at`)
VALUES
	(1,'diskon bulan mei','percent',10,0,'2018-04-18 09:48:30','2018-04-18 09:48:30'),
	(2,'diskon bulan juni','amount',100000,0,'2018-04-18 09:48:45','2018-04-18 09:48:45');

/*!40000 ALTER TABLE `diskon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table district
# ------------------------------------------------------------

DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table family
# ------------------------------------------------------------

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `relation` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;

INSERT INTO `family` (`id`, `parent_id`, `child_id`, `relation`, `created_at`, `updated_at`)
VALUES
	(1,1,4,'anak','2018-05-06 14:58:36','2018-04-19 15:51:28'),
	(2,2,3,'istri','2018-05-06 14:38:37','2018-04-19 15:54:36');

/*!40000 ALTER TABLE `family` ENABLE KEYS */;
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


# Dump of table incentive_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `incentive_category`;

CREATE TABLE `incentive_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `rate` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `incentive_category` WRITE;
/*!40000 ALTER TABLE `incentive_category` DISABLE KEYS */;

INSERT INTO `incentive_category` (`id`, `name`, `rate`, `created_at`, `updated_at`)
VALUES
	(1,'incentive1',2,'2018-03-28 00:14:58','0000-00-00 00:00:00'),
	(2,'incentive2',5,'2018-03-28 00:15:25','0000-00-00 00:00:00'),
	(3,'incentive3',7.5,'2018-03-28 00:15:25','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `incentive_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `role` varchar(20) NOT NULL,
  `activity` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
  `type` varchar(150) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `payment` varchar(255) NOT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `invoice_no`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `type`, `status`, `payment`, `agen_id`, `created_at`, `updated_at`)
VALUES
	(2,'1',33,161250,0,0,161250,'sembako',4,'',2,'2018-03-29 01:17:57','2018-05-06 15:59:18'),
	(3,'2',33,431341,0,0,431341,'sembako',8,'',2,'2018-05-12 13:57:34','0000-00-00 00:00:00'),
	(4,'3',33,2323,0,0,2323,'sembako',8,'',2,'2018-05-12 13:57:34','0000-00-00 00:00:00'),
	(5,'2',33,431341,0,0,431341,'sembako',3,'',2,'2018-05-12 13:57:47','0000-00-00 00:00:00'),
	(6,'3',33,2323,0,0,2323,'sembako',2,'',2,'2018-05-12 13:57:47','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_billing_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_billing_detail`;

CREATE TABLE `order_billing_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_province` varchar(50) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_district` varchar(50) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `long` varchar(255) NOT NULL,
  `customer_address2` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table order_cancel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_cancel`;

CREATE TABLE `order_cancel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `reason` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `order_cancel` WRITE;
/*!40000 ALTER TABLE `order_cancel` DISABLE KEYS */;

INSERT INTO `order_cancel` (`id`, `order_id`, `cancel_by`, `reason`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'test','2018-04-01 20:01:53','2018-04-01 20:01:53');

/*!40000 ALTER TABLE `order_cancel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `base_price` float NOT NULL,
  `nego_price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `category_id`, `qty`, `base_price`, `nego_price`, `created_at`, `updated_at`)
VALUES
	(1,2,3,2,0,2250,2100,'2018-03-29 01:17:57','2018-03-29 01:17:57'),
	(2,2,4,1,5,30000,26000,'2018-03-29 01:17:57','2018-03-29 01:17:57');

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sku` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `incentive_id` int(11) DEFAULT NULL,
  `shelf` varchar(20) NOT NULL,
  `cost` int(11) NOT NULL,
  `price_for_customer` float NOT NULL,
  `price_for_agen` float NOT NULL,
  `img_url` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `sku`, `product_name`, `description`, `store_id`, `tax_id`, `category_id`, `incentive_id`, `shelf`, `cost`, `price_for_customer`, `price_for_agen`, `img_url`, `created_at`, `updated_at`)
VALUES
	(3,2525156,'mie 50gr','',NULL,NULL,1,1,'',19000,25000,23750,NULL,'2018-04-18 06:20:08','2018-04-18 06:20:08'),
	(4,56478979,'Bihun 200gr','',1,1,2,2,'',15000,20000,19000,NULL,'2018-04-18 06:23:23','2018-04-18 06:23:23'),
	(9,676765,'sarden','',1,1,2,1,'',55000,60000,57000,NULL,'2018-04-18 06:42:29','2018-04-18 06:42:29'),
	(10,5628874,'beras 5kg','',1,1,4,2,'',58000,62500,59375,NULL,'2018-04-18 09:46:56','2018-04-18 09:46:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'cat1','slug','2018-03-25 00:47:59','0000-00-00 00:00:00'),
	(2,'cat2','slug2','2018-03-25 00:47:59','0000-00-00 00:00:00'),
	(3,'sabun','','2018-04-08 03:06:13','2018-04-08 03:06:13'),
	(4,'Sembako','','2018-04-18 09:44:51','2018-04-18 09:44:51');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table progress_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `progress_status`;

CREATE TABLE `progress_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `progress_name` varchar(150) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `progress_status` WRITE;
/*!40000 ALTER TABLE `progress_status` DISABLE KEYS */;

INSERT INTO `progress_status` (`id`, `progress_name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Pending','Pembayaran belum diterima','2018-05-07 15:29:45','0000-00-00 00:00:00'),
	(2,'Capture','Pembayaran sudah diterima','2018-05-07 15:29:50','0000-00-00 00:00:00'),
	(3,'Accept','Pembayaran sudah diterima','2018-05-07 15:29:53','0000-00-00 00:00:00'),
	(4,'Settlement','Pembayaran sudah diterima','2018-05-07 15:29:57','0000-00-00 00:00:00'),
	(5,'Fraud','Kartu kredit anda di deny oleh bank penerbit kartu','2018-05-07 15:30:00','0000-00-00 00:00:00'),
	(6,'Delivery Order','Pesanan sedang dalam proses pengiriman','2018-05-07 15:30:03','0000-00-00 00:00:00'),
	(7,'Finish','Pesanan sudah diterima oleh pembeli','2018-05-07 15:30:07','0000-00-00 00:00:00'),
	(8,'Cancel','Pesanan dibatalkan','2018-05-07 15:30:09','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `progress_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table promo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `promo`;

CREATE TABLE `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `province`;

CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_order_cancel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_cancel`;

CREATE TABLE `purchase_order_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cancel_by` int(11) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_order_detail`;

CREATE TABLE `purchase_order_detail` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table rating
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `agen_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` varchar(150) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;

INSERT INTO `rating` (`id`, `order_id`, `agen_id`, `customer_id`, `rating`, `notes`, `created_at`, `updated_at`)
VALUES
	(1,3,2,1,'5','mantap','2018-05-21 16:34:37','2018-05-21 16:34:37');

/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table receipt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `receipt`;

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin','2017-11-20 13:46:35','0000-00-00 00:00:00'),
	(2,'Manager','manager','2017-11-20 13:46:51','0000-00-00 00:00:00'),
	(3,'Supervisor','supervisor','2017-11-20 13:47:23','0000-00-00 00:00:00'),
	(4,'Kasir','kasir','2017-11-20 13:47:32','2017-11-20 13:47:42'),
	(5,'Agen','agen','2017-11-20 13:48:00','0000-00-00 00:00:00'),
	(6,'Member','member','2017-11-20 13:48:00','0000-00-00 00:00:00'),
	(7,'Customer','customer','2017-11-20 13:48:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;

INSERT INTO `stock` (`id`, `store_id`, `product_id`, `category_id`, `quantity`, `price`, `created_at`, `updated_at`)
VALUES
	(2,NULL,6,NULL,250,NULL,'2018-04-18 06:20:08','2018-04-18 06:20:08'),
	(4,1,8,NULL,200,NULL,'2018-04-18 06:23:23','2018-04-18 06:23:23'),
	(5,1,9,NULL,200,NULL,'2018-04-18 06:42:29','2018-04-18 06:42:29'),
	(6,1,10,NULL,200,NULL,'2018-04-18 09:46:56','2018-04-18 09:46:56');

/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock_adjustment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_adjustment`;

CREATE TABLE `stock_adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table stock_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_history`;

CREATE TABLE `stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `reason` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(50) NOT NULL,
  `phone` int(14) NOT NULL,
  `address` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;

INSERT INTO `store` (`id`, `store_name`, `phone`, `address`, `created_at`, `updated_at`)
VALUES
	(1,'GrosirOne Serang',7920468,'Jalan Raya Cibagus No.19, Rawu 42111, Kaligandu, Serang Sub-District, Serang City, Banten 42111','2018-04-18 13:21:54','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `website` varchar(40) NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `notes` longtext NOT NULL,
  `address_1` longtext NOT NULL,
  `address_2` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(20) NOT NULL,
  `tax_value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;

INSERT INTO `tax` (`id`, `tax_name`, `tax_value`, `created_at`, `updated_at`)
VALUES
	(1,'PPN',10,'2018-04-18 13:22:34','2018-04-18 13:22:34');

/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transfer_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transfer_order`;

CREATE TABLE `transfer_order` (
  `id` int(11) NOT NULL,
  `store_id_from` int(11) NOT NULL,
  `store_id_to` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table transfer_order_cancel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transfer_order_cancel`;

CREATE TABLE `transfer_order_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_order_id` int(11) NOT NULL,
  `cancel_by` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table transfer_order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transfer_order_detail`;

CREATE TABLE `transfer_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT '',
  `api_token` varchar(255) NOT NULL,
  `status` varchar(150) DEFAULT 'active',
  `remember_token` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `store_id`, `phone`, `password`, `api_token`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,2,0,'0000','$2y$10$GYojji5pa7m9EChRptSAGO0OM8yFCmZ1OkycDo/Ogfz9.RKxXreEy','R2AIpZfzNDlXsrHZAKxlu1EmqKA6Pmeijasm933CZnOruNwXR5VMExVHYPyQ','active','','2017-12-06 16:43:12','2018-05-12 14:11:41'),
	(33,5,0,'0812155645','$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje','OmIqqBTbcOrwF80i3PSPBBfxAg0aHDjqQTV96pXGJSsbxBPP2DlfyH9DHFIR','active','','2017-12-28 16:26:31','2017-12-28 16:22:58'),
	(35,5,0,NULL,'$2y$10$gmspt2tl8RoBlECHaJ.0DuBOgK5oehNbQdaDmW2rtzIra4xWBPN0G','key-5acb0d6e9c7d8','active','','2018-04-09 13:51:26','2018-04-09 13:51:26');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
