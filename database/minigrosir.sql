-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 17, 2018 at 07:50 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minigrosir`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `identifier` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT '',
  `phone` varchar(150) DEFAULT '',
  `department` varchar(150) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `identifier`, `name`, `phone`, `department`, `created_at`, `updated_at`) VALUES
(4, 1, 'Jordy Jonatan', '081289256242', 'Developer', '2017-12-05 08:46:18', '2017-12-06 06:03:11'),
(5, 2, 'Developer', '0000', 'Developer', '2017-12-05 08:51:35', '2017-12-06 06:03:12'),
(6, 53, 'Admin', '0000', 'Developer', '2018-01-05 08:45:23', '2018-01-05 08:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `agen`
--

CREATE TABLE `agen` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agen`
--

INSERT INTO `agen` (`id`, `identifier`, `parent`, `business_name`, `name`, `address`, `province`, `district`, `ktp_photo`, `kk_photo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', 'tester', 'address', '', '', '', '', '2018-04-01 12:42:20', '0000-00-00 00:00:00'),
(2, 35, 1, '0', 'agen2', 'address', '', '', '', '', '2018-04-01 13:19:26', '0000-00-00 00:00:00'),
(3, 33, 0, '0', 'jokow', 'Jl jokow', '', '', '', '', '2018-04-09 06:51:26', '2018-04-09 06:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `barcode`
--

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `voucher_id`, `subtotal`, `discount`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 33, NULL, 0, NULL, 0, 0, '2018-03-27 18:48:23', '2018-03-28 18:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `cart_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0, '2018-03-27 18:51:19', '2018-03-28 18:17:57'),
(2, 1, 4, 0, '2018-03-27 18:56:14', '2018-03-28 18:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `message` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `order_id`, `sender_id`, `recipient_id`, `message`, `created_at`, `updated_at`) VALUES
(4, 19, 33, 7, 'Selamat Siang', '2018-01-16 08:23:06', '2018-01-16 08:23:06'),
(5, 19, 7, 33, 'Ya selamat siang, ada yang bisa saya bantu?', '2018-01-16 08:23:25', '2018-01-16 08:23:25'),
(6, 19, 33, 7, 'saya mau nanya', '2018-01-16 08:23:35', '2018-01-16 08:23:35'),
(7, 19, 33, 7, 'harga barang bisa nego lagi gak ya?', '2018-01-16 08:23:45', '2018-01-16 08:23:45'),
(8, 19, 33, 7, 'Halo gan', '2018-01-16 08:36:06', '2018-01-16 08:36:06'),
(9, 19, 33, 7, 'Gimana gan?', '2018-01-16 08:38:25', '2018-01-16 08:38:25'),
(10, 17, 33, 7, 'Gan??', '2018-01-16 08:38:40', '2018-01-16 08:38:40'),
(11, 17, 7, 33, 'Ya bro? Ada apa?', '2018-01-17 11:43:03', '2018-01-17 11:43:03'),
(12, 19, 33, 7, 'Test', '2018-01-18 10:47:37', '2018-01-18 10:47:37'),
(13, 38, 54, 7, 'Hai bajigur', '2018-01-19 10:32:37', '2018-01-19 10:32:37'),
(14, 38, 7, 54, 'Oiiii', '2018-01-19 10:33:06', '2018-01-19 10:33:06'),
(15, 38, 7, 54, 'Ud makan belom??', '2018-01-19 10:33:37', '2018-01-19 10:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `agen_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `margin_penjualan` int(11) DEFAULT NULL,
  `incentive` int(11) NOT NULL,
  `commission_pph` int(11) NOT NULL,
  `commission_netto` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `agen_id`, `order_id`, `margin_penjualan`, `incentive`, `commission_pph`, `commission_netto`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 71250, 71250, 0, 0, '2018-04-01 13:23:30', '2018-04-01 13:23:30'),
(2, 2, 3, 12, 12, 11, 11, '2018-05-06 08:50:11', '2018-05-06 08:50:11'),
(3, 2, 2, 1612, 71250, 1457, 71405, '2018-05-06 09:04:54', '2018-05-06 09:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `identifier` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `address` longtext,
  `lat` varchar(150) DEFAULT '0',
  `lng` varchar(150) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `identifier`, `name`, `phone`, `address`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(1, 3, 'Jordy Jonatan', '081289256242', 'Jl. Daan Mogot', '0', '0', '2017-12-05 15:21:45', '2017-12-06 06:03:33'),
(27, 33, 'George', '08999310048', 'Jalan Princess Alice 2,Kelapa Dua,Tangerang', '-6.2429802', '106.6138121', '2017-12-29 06:28:31', '2018-01-09 08:56:49'),
(28, 34, 'Jonatan', '08921038201', 'Balikpapan City, East Kalimantan, Indonesia', '0', '0', '2017-12-29 06:31:28', '2017-12-29 06:31:28'),
(29, 1, 'bry', '0813123213', 'jl panjang', '0', '0', '2018-03-24 17:51:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` enum('percent','amount') DEFAULT NULL,
  `rate` int(11) NOT NULL,
  `restriction` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`id`, `name`, `type`, `rate`, `restriction`, `created_at`, `updated_at`) VALUES
(1, 'diskon bulan mei', 'percent', 10, 0, '2018-04-18 02:48:30', '2018-04-18 02:48:30'),
(2, 'diskon bulan juni', 'amount', 100000, 0, '2018-04-18 02:48:45', '2018-04-18 02:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `relation` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`id`, `parent_id`, `child_id`, `relation`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'anak', '2018-05-06 07:58:36', '2018-04-19 08:51:28'),
(2, 2, 3, 'istri', '2018-05-06 07:38:37', '2018-04-19 08:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `fcm`
--

CREATE TABLE `fcm` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT '',
  `device_platform` varchar(150) DEFAULT '',
  `uuid` varchar(150) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fcm`
--

INSERT INTO `fcm` (`id`, `user_id`, `role_id`, `fcm_token`, `device_platform`, `uuid`, `created_at`, `updated_at`) VALUES
(11, 33, 2, 'fK5dbeioCAc:APA91bF9E22H0OwUTho7dzkxzFbu9kaQAqsCTbOwl7p1-pmw63uNFaM2RhCT0aYOQP0VNkwfV5Vr1sBohUqOEv2zFdB43y-IhfsSrZCOz1VzHFPJ2Sh7G7F7SoT9KSc_zvDHqJ4i2qrx', 'Android', 'e9f514591774e2e', '2018-01-04 08:33:51', '2018-01-04 08:33:51'),
(31, 54, 2, 'ej5NtYrT5xU:APA91bE6NhOmW55sLKjeaKTSEbax76yHVdJ1N10V1X1hKDDu3fxeztGiQjoFXg4j8cgiLUR5--eFDUqeS_9kdt7JBO5QZWbuJzyLUjzeFfg_NvVA4ajN97SkKjUC1vd42fTMRO_LWFbw', 'Android', '85f07cd331a95c3c', '2018-01-19 10:28:46', '2018-01-19 10:28:46'),
(32, 7, 4, 'fXIFLmdfd-8:APA91bFZ2iHAOt23jhY0w-I6EMA_59jT3BvIOSyiHUgnlU5-uIVBWf5CnxIgKpQuULtxxHwV04chiHtwOKgoWseoIm1Ywu1drNX7fdpuRpfUpsx4kWq8vqMFK35ogtTLOToBNTzrJt0n', 'Android', '3e570fcb43352536', '2018-01-19 18:06:36', '2018-01-19 18:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `incentive_category`
--

CREATE TABLE `incentive_category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rate` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `incentive_category`
--

INSERT INTO `incentive_category` (`id`, `name`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'incentive1', 2, '2018-03-27 17:14:58', '0000-00-00 00:00:00'),
(2, 'incentive2', 5, '2018-03-27 17:15:25', '0000-00-00 00:00:00'),
(3, 'incentive3', 7.5, '2018-03-27 17:15:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `role` varchar(20) NOT NULL,
  `activity` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `invoice_no`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `type`, `status`, `payment`, `agen_id`, `created_at`, `updated_at`) VALUES
(2, '1', 33, 161250, 0, 0, 161250, 'sembako', 4, 'cash', 2, '2018-03-28 18:17:57', '2018-05-06 08:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_billing_detail`
--

CREATE TABLE `order_billing_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_province` varchar(50) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_district` varchar(50) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel`
--

CREATE TABLE `order_cancel` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `reason` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_cancel`
--

INSERT INTO `order_cancel` (`id`, `order_id`, `cancel_by`, `reason`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'test', '2018-04-01 13:01:53', '2018-04-01 13:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `base_price` float NOT NULL,
  `nego_price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `category_id`, `qty`, `base_price`, `nego_price`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 2, 0, 2250, 2100, '2018-03-28 18:17:57', '2018-03-28 18:17:57'),
(2, 2, 4, 1, 5, 30000, 26000, '2018-03-28 18:17:57', '2018-03-28 18:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `sku` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL DEFAULT '',
  `store_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `incentive_id` int(11) DEFAULT NULL,
  `cost` int(11) NOT NULL,
  `price_for_customer` float NOT NULL,
  `price_for_agen` float NOT NULL,
  `img_url` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `sku`, `product_name`, `store_id`, `tax_id`, `category_id`, `incentive_id`, `cost`, `price_for_customer`, `price_for_agen`, `img_url`, `created_at`, `updated_at`) VALUES
(6, 2525156, 'mie 50gr', NULL, NULL, 1, 1, 19000, 25000, 23750, NULL, '2018-04-17 23:20:08', '2018-04-17 23:20:08'),
(8, 56478979, 'Bihun 200gr', 1, 1, 2, 2, 15000, 20000, 19000, NULL, '2018-04-17 23:23:23', '2018-04-17 23:23:23'),
(9, 676765, 'sarden', 1, 1, 2, 1, 55000, 60000, 57000, NULL, '2018-04-17 23:42:29', '2018-04-17 23:42:29'),
(10, 5628874, 'beras 5kg', 1, 1, 4, 2, 58000, 62500, 59375, NULL, '2018-04-18 02:46:56', '2018-04-18 02:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'cat1', 'slug', '2018-03-24 17:47:59', '0000-00-00 00:00:00'),
(2, 'cat2', 'slug2', '2018-03-24 17:47:59', '0000-00-00 00:00:00'),
(3, 'sabun', '', '2018-04-07 20:06:13', '2018-04-07 20:06:13'),
(4, 'Sembako', '', '2018-04-18 02:44:51', '2018-04-18 02:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `progress_status`
--

CREATE TABLE `progress_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `progress_name` varchar(150) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `progress_status`
--

INSERT INTO `progress_status` (`id`, `progress_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 'Pembayaran belum diterima', '2018-05-07 08:29:45', '0000-00-00 00:00:00'),
(2, 'Capture', 'Pembayaran sudah diterima', '2018-05-07 08:29:50', '0000-00-00 00:00:00'),
(3, 'Accept', 'Pembayaran sudah diterima', '2018-05-07 08:29:53', '0000-00-00 00:00:00'),
(4, 'Settlement', 'Pembayaran sudah diterima', '2018-05-07 08:29:57', '0000-00-00 00:00:00'),
(5, 'Fraud', 'Kartu kredit anda di deny oleh bank penerbit kartu', '2018-05-07 08:30:00', '0000-00-00 00:00:00'),
(6, 'Delivery Order', 'Pesanan sedang dalam proses pengiriman', '2018-05-07 08:30:03', '0000-00-00 00:00:00'),
(7, 'Finish', 'Pesanan sudah diterima oleh pembeli', '2018-05-07 08:30:07', '0000-00-00 00:00:00'),
(8, 'Cancel', 'Pesanan dibatalkan', '2018-05-07 08:30:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` int(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_cancel`
--

CREATE TABLE `purchase_order_cancel` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cancel_by` int(11) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2017-11-20 06:46:35', '0000-00-00 00:00:00'),
(2, 'Manager', 'manager', '2017-11-20 06:46:51', '0000-00-00 00:00:00'),
(3, 'Supervisor', 'supervisor', '2017-11-20 06:47:23', '0000-00-00 00:00:00'),
(4, 'Kasir', 'kasir', '2017-11-20 06:47:32', '2017-11-20 06:47:42'),
(5, 'Agen', 'agen', '2017-11-20 06:48:00', '0000-00-00 00:00:00'),
(6, 'Member', 'member', '2017-11-20 06:48:00', '0000-00-00 00:00:00'),
(7, 'Customer', 'customer', '2017-11-20 06:48:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `store_id`, `product_id`, `category_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(2, NULL, 6, NULL, 250, NULL, '2018-04-17 23:20:08', '2018-04-17 23:20:08'),
(4, 1, 8, NULL, 200, NULL, '2018-04-17 23:23:23', '2018-04-17 23:23:23'),
(5, 1, 9, NULL, 200, NULL, '2018-04-17 23:42:29', '2018-04-17 23:42:29'),
(6, 1, 10, NULL, 200, NULL, '2018-04-18 02:46:56', '2018-04-18 02:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment`
--

CREATE TABLE `stock_adjustment` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--

CREATE TABLE `stock_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `reason` varchar(40) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `phone` int(14) NOT NULL,
  `address` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `store_name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'GrosirOne Serang', 7920468, 'Jalan Raya Cibagus No.19, Rawu 42111, Kaligandu, Serang Sub-District, Serang City, Banten 42111', '2018-04-18 06:21:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(20) NOT NULL,
  `tax_value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `tax_name`, `tax_value`, `created_at`, `updated_at`) VALUES
(1, 'PPN', 10, '2018-04-18 06:22:34', '2018-04-18 06:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_order`
--

CREATE TABLE `transfer_order` (
  `id` int(11) NOT NULL,
  `store_id_from` int(11) NOT NULL,
  `store_id_to` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_order_cancel`
--

CREATE TABLE `transfer_order_cancel` (
  `id` int(11) NOT NULL,
  `transfer_order_id` int(11) NOT NULL,
  `cancel_by` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_order_detail`
--

CREATE TABLE `transfer_order_detail` (
  `id` int(11) NOT NULL,
  `transfer_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT '',
  `api_token` varchar(255) NOT NULL,
  `status` varchar(150) DEFAULT 'active',
  `remember_token` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `phone`, `password`, `api_token`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 4, '081234567', '$2y$10$X4Lnzx08Fubv8/D67W4rXObEUUqO/7E0aO3C/ojQpV809RcNNvNNK', 'R2AIpZfzNDlXsrHZAKxlu1EmqKA6Pmeijasm933CZnOruNwXR5VMExVHYPyQ', 'active', '', '2017-12-06 09:43:12', '2018-05-02 08:13:50'),
(33, 1, '0812155645', '$2y$10$81fghEe6XwCWbPA3mrpnluDX4Ukv7Hy6kbmoJNtiPRkmCkmgRDoje', 'OmIqqBTbcOrwF80i3PSPBBfxAg0aHDjqQTV96pXGJSsbxBPP2DlfyH9DHFIR', 'active', '', '2017-12-28 09:26:31', '2017-12-28 09:22:58'),
(35, 5, NULL, '$2y$10$gmspt2tl8RoBlECHaJ.0DuBOgK5oehNbQdaDmW2rtzIra4xWBPN0G', 'key-5acb0d6e9c7d8', 'active', '', '2018-04-09 06:51:26', '2018-04-09 06:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id` int(11) NOT NULL,
  `voucher_code` varchar(150) NOT NULL,
  `discount_rate` int(11) NOT NULL,
  `for` varchar(50) NOT NULL DEFAULT '',
  `product_category` int(11) DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_until` date NOT NULL,
  `quota` int(11) NOT NULL,
  `description` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id`, `voucher_code`, `discount_rate`, `for`, `product_category`, `valid_from`, `valid_until`, `quota`, `description`, `created_at`, `updated_at`) VALUES
(1, 'BRDIS10', 10, 'Customer', 1, '2017-11-13', '2030-11-23', 5, 'Discount 20%', '2017-11-15 12:14:22', '2018-01-08 08:19:39'),
(2, 'BRDIS01', 10, 'Reseller', 1, '2017-11-13', '2017-11-30', 5, 'Discount 10%', '2017-11-15 09:51:16', '2018-01-08 07:17:53'),
(3, 'BRDIS02', 5, 'Customer', 1, '2017-11-13', '2017-11-27', 1, 'Discount 5%', '2017-11-15 09:51:20', '2018-01-08 07:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_use`
--

CREATE TABLE `voucher_use` (
  `id` int(11) UNSIGNED NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_use`
--

INSERT INTO `voucher_use` (`id`, `voucher_id`, `order_id`, `created_at`, `updated_at`) VALUES
(3, 2, 21, '2018-01-08 08:06:41', '2018-01-08 08:06:41'),
(4, 2, 22, '2018-01-08 08:08:13', '2018-01-08 08:08:13'),
(5, 1, 24, '2018-01-08 09:55:18', '2018-01-08 09:55:18'),
(6, 1, 25, '2018-01-08 10:01:23', '2018-01-08 10:01:23'),
(7, 1, 26, '2018-01-08 10:13:52', '2018-01-08 10:13:52'),
(8, 1, 29, '2018-01-10 09:43:18', '2018-01-10 09:43:18'),
(9, 1, 30, '2018-01-10 10:03:47', '2018-01-10 10:03:47'),
(10, 1, 31, '2018-01-10 10:37:01', '2018-01-10 10:37:01'),
(11, 1, 38, '2018-01-19 10:30:06', '2018-01-19 10:30:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fcm`
--
ALTER TABLE `fcm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incentive_category`
--
ALTER TABLE `incentive_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_billing_detail`
--
ALTER TABLE `order_billing_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_cancel`
--
ALTER TABLE `order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress_status`
--
ALTER TABLE `progress_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_cancel`
--
ALTER TABLE `purchase_order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_order_cancel`
--
ALTER TABLE `transfer_order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_order_detail`
--
ALTER TABLE `transfer_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_use`
--
ALTER TABLE `voucher_use`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `agen`
--
ALTER TABLE `agen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `barcode`
--
ALTER TABLE `barcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `family`
--
ALTER TABLE `family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `incentive_category`
--
ALTER TABLE `incentive_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order_billing_detail`
--
ALTER TABLE `order_billing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_cancel`
--
ALTER TABLE `order_cancel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `progress_status`
--
ALTER TABLE `progress_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_order_cancel`
--
ALTER TABLE `purchase_order_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transfer_order_cancel`
--
ALTER TABLE `transfer_order_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transfer_order_detail`
--
ALTER TABLE `transfer_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `voucher_use`
--
ALTER TABLE `voucher_use`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
