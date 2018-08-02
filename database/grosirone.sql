-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 02 Agu 2018 pada 09.39
-- Versi Server: 5.6.34-log
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
-- Database: `grosirone`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
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
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `identifier`, `name`, `phone`, `department`, `created_at`, `updated_at`) VALUES
(4, 1, 'Jordy Jonatan', '081289256242', 'Developer', '2017-12-05 08:46:18', '2017-12-06 06:03:11'),
(5, 2, 'Developer', '0000', 'Developer', '2017-12-05 08:51:35', '2017-12-06 06:03:12'),
(6, 53, 'Admin', '0000', 'Developer', '2018-01-05 08:45:23', '2018-01-05 08:45:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `agen`
--

CREATE TABLE `agen` (
  `id` int(11) UNSIGNED NOT NULL,
  `identifier` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT '1',
  `business_name` varchar(100) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `address` longtext,
  `ktp_photo` varchar(250) NOT NULL,
  `kk_photo` varchar(250) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `wanee` int(20) DEFAULT '0',
  `rating` varchar(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `agen`
--

INSERT INTO `agen` (`id`, `identifier`, `parent`, `business_name`, `name`, `address`, `ktp_photo`, `kk_photo`, `photo`, `wanee`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'sukses', 'Richard', 'address', '', '', 'storage/app/photo_agen/IfhWgzKGlSLMFbyVf5ZsdcO8zrwfn4WxUZCswiUe.png', 881134, '5.0', '2018-04-01 12:42:20', '2018-08-02 07:49:15'),
(2, 33, 1, 'kasir', 'Rohim', 'GrosirOne Serang', '', '', 'storage/app/photo_agen/ugpGecBL35WNDqurngqA4ZN8zqTbWvhNKyz91o1i.jpeg', -79400, '0.0', '2018-04-01 13:19:26', '2018-08-02 05:32:01'),
(3, 35, 0, '0', 'jokow', 'Jl jokow', '', '', '', 0, '0', '2018-04-09 06:51:26', '2018-04-09 06:51:26'),
(4, 41, 0, 'sukses', 'bobby', 'address', '', '', NULL, 0, '0', '2018-05-24 07:37:16', '2018-05-24 07:37:16'),
(5, 49, 1, 'MENGGAPAI BINTANG', 'JOE', 'JALAN BINTANG', '', '', NULL, 0, '0', '2018-06-25 22:58:16', '2018-06-25 22:58:16'),
(6, 50, 1, 'Bintang Kejora', 'Kejer Aku', 'Jl. Mawar', '', '', 'storage/app/photo_agen/lLUGiMremCSWBKweh4WrEtWsyg2nSXBuj8Qy2OtV.jpeg', 0, '0', '2018-06-25 22:59:49', '2018-06-25 23:04:12'),
(7, 51, 1, 'FAJAR UTAMA', 'BOB', 'Jalan Raya', 'storage/app/photo_ktp/i80MtVdkLMijZBPWvyKQKNFH2fJY2PezKFhpmACu.png', 'storage/app/photo_kk/jWz4N5gTzSi42n5Pxj9upEZyCq21YDXzdhMOUPIM.png', NULL, 0, '0', '2018-06-25 23:28:40', '2018-06-25 23:47:37'),
(8, 52, 1, 'Nama usaha', 'Nama lengkap', 'Alamat lengkap', '', '', NULL, 0, '0', '2018-06-25 23:44:32', '2018-06-25 23:44:32'),
(9, 53, 1, 'MENGGAPAI BINTANG 1', 'JOE', 'JALAN BINTANG', '', '', 'storage/app/photo_agen/7zpPAELc2wssReebz3G5BmfGD1qyh8fpN1jKGIPC.jpeg', 0, '0.0', '2018-06-25 23:45:32', '2018-07-26 02:19:23'),
(10, 54, 1, 'Boenawan Forever', 'Yolawati', 'Aku padamu yola', 'storage/app/photo_ktp/pO5STAyiqYHND8DAuo4Z49f1MjwY50VmIgxhzMk1.jpeg', 'storage/app/photo_kk/zesEqjxXOccnkcOrn8kqR97cviYRuiVAXzooxV3k.jpeg', 'storage/app/photo_agen/9LHVwqZHUJTh7kNTCeHSTgngKr5FmblBsRN74zMt.jpeg', 0, '0', '2018-06-25 23:49:50', '2018-06-25 23:49:52'),
(11, 55, 0, 'sukses', 'Coba coba', 'address', 'storage/app/photo_ktp/9TXIaxa0htw8ysIVRze8xuMvraMUGqwQBf5CcfAw.jpeg', '', NULL, 0, '0.0', '2018-06-26 00:55:18', '2018-07-30 21:24:26'),
(12, 56, 1, 'OneVis', 'Garuda', 'Tangerang', 'storage/app/photo_ktp/A6VwSUTQJmSjusB6en3vMj4GcTjvjfPSy1skhXhK.jpeg', 'storage/app/photo_kk/dEICVbBJn590yLUVUVu8SZ0OOLeNlxvdbc4p7Mtb.jpeg', 'storage/app/photo_agen/4z0EomoJ3XHVhLnFkRBeGOvVxeD3nIQ0g3wBPqja.jpeg', 0, '0', '2018-06-26 05:33:06', '2018-06-26 05:33:08'),
(13, 57, 1, 'Pakci', 'Richard', 'Citra 1', 'storage/app/photo_ktp/1xLEnwT2jvJi5zuufSxbT1pzWPZbkcOKseoDOaA5.jpeg', '', 'storage/app/photo_agen/3rtQHuDUnfpzCgIuGpfRuR5ZJBNdfxVTrBAqXDNw.jpeg', 0, '0', '2018-06-27 22:57:08', '2018-06-27 22:57:10'),
(14, 64, 1, 'Budi Shop', 'Budiarto', 'GLC europe 2 no 1', '', '', 'storage/app/photo_agen/muZB1bIOD06DR7ZyMX5MyjnsybBXNKwseDB4PAVf.jpeg', 736761, '4.5', '2018-07-01 23:58:01', '2018-08-02 00:43:25'),
(15, 70, 1, 'Grosiran', 'Grosir Satu', 'Serang', '', '', NULL, 0, '0', '2018-07-02 15:22:32', '2018-07-02 15:22:32'),
(16, 75, 1, 'Alfitha', 'Hasanuddin Thawil', 'Jl. H. Rausin Rt. 002 Rw. 01 No. B1 Kel. Palmerah Jakarta barat', '', '', NULL, 0, '0', '2018-07-16 23:20:50', '2018-07-16 23:20:50'),
(17, 78, 1, 'Mar\'ie Belanja', 'Jaka Setia', 'Jalan kapuk raya rt 002 rw 03 nomor 61a, kapuk muara, penjaringan, jakarta utara', 'storage/app/photo_ktp/57yHHPGINC0AGIUdSvWEu8PNXy9IAfFOLi1a6Vs9.jpeg', '', 'storage/app/photo_agen/Ogv07OoYgUHmsGi0U4oo1nemNhSQiaynqwvLk6Ai.jpeg', 0, '0', '2018-07-17 18:26:24', '2018-07-17 18:26:26'),
(19, 81, 1, 'Angin ribut', 'Addin', 'Sutera niaga', 'storage/app/photo_ktp/GGapBzt33mjCr90VIhqVLxwdWHy4rM9sZlcaW50Y.jpeg', 'storage/app/photo_kk/Lw9YY8Fjfct0mjBcnUP9wOast3aPG52CI2ml0hdV.jpeg', 'storage/app/photo_agen/E8QwpZ9fanqVUJdo6lIYNNEsm9ZlM3krj3vAbEIi.jpeg', 0, '0', '2018-07-24 23:59:49', '2018-07-24 23:59:51'),
(20, 84, 1, 'Grosirone Serang', 'Grosir One Serang', 'Jl.  TB Suep Cigambus', 'storage/app/photo_ktp/srh8LlX5FCvtrZKAvGQX3IirO340VZKY16SD76yz.jpeg', 'storage/app/photo_kk/BU9CcVWx4cJj5t8OWBeG9QZBFBr8oGk6mW5wTDAY.jpeg', 'storage/app/photo_agen/NjhsBVbVEaPtikBsW0TxGicJ2cbip3eUd5csSJPR.jpeg', 0, '0.0', '2018-07-27 01:40:17', '2018-07-29 00:37:31'),
(21, 86, 1, 'Tesrinf', 'Tesring', 'Jln coba', 'storage/app/photo_ktp/mrcQCazp0EHCneXbx50ccP8EYOxQXKagV0Zk9p7N.jpeg', 'storage/app/photo_kk/jKFYsoDNcJwRueeqP74CatMTveBIZIyQToc8a6oa.jpeg', 'storage/app/photo_agen/GikmTpRSyqG4SgnSmG5SqpgTxcRU0orkmxNZF1pv.jpeg', 0, '0.0', '2018-07-27 03:42:11', '2018-07-30 00:48:40'),
(22, 87, 1, 'Sembako', 'Yusuf Hidayat', 'Kasemen, kota serang', '', '', NULL, 0, '0', '2018-07-27 09:19:40', '2018-07-27 09:19:40'),
(23, 88, 1, 'Cemara', 'Hasbi', 'Kp.cicayur 1 Rt 01/ Rw04 desa pagedangan kecamatan pagedangn tangerang', '', '', NULL, 0, '0', '2018-07-27 16:55:06', '2018-07-27 16:55:06'),
(24, 89, 1, 'SEMOGA BERKAH', 'Rivai', 'Griya persada 1 blok A4 no 41', '', '', 'storage/app/photo_agen/SzbdPXiDCp5wUgzBcTa8KsxRsS4Bm9Uq1TZu5YPd.jpeg', 0, '0', '2018-07-28 02:10:31', '2018-07-28 02:10:33'),
(25, 92, 1, 'Toko Dua Putri', 'Hermanto', 'Kp. Dukuh Manggah Rt.012 Rw.003 Desa Legok Kec.Legok Kab.Tangerang Prov. Banten', 'storage/app/photo_ktp/IMyMNy08aUuZ2BB5xwnRaltRvfrmUj4LsWff7Ai8.jpeg', 'storage/app/photo_kk/sPIgabac22rRnFslroDkmrKvlGnaLJextV17Lwc0.jpeg', 'storage/app/photo_agen/5XREJAOw87pmSpBjsk52Tt5s3JyZ79MmEHHh8P6c.jpeg', 0, '0', '2018-07-28 17:02:33', '2018-07-28 17:02:35'),
(26, 94, 1, 'Cv.Bina Putra Mandiri', 'Syamsul Aripin', 'Kp. Pagedangan 02/01 Desa Cicalengka kecamatan Pagedangan', '', '', 'storage/app/photo_agen/Crzkz4w0J4Yzevb7W6DT4rLnxefyEnDHD2ooVkBq.jpeg', 0, '0.0', '2018-07-28 20:28:59', '2018-07-29 22:09:51'),
(27, 95, 1, 'Lancar Jaya', 'Bobby', 'Serang, banten', '', '', NULL, 0, '0', '2018-07-28 21:04:16', '2018-07-28 21:04:16'),
(28, 96, 1, 'NeOcoffee', 'Ahmad fauzan', 'Kp. Kawoyang tengah ds cemplang kec jawilan kab Serang', '', '', 'storage/app/photo_agen/tAPMcOR90palaEh0cElMkl0FbG58KKOeyPeDflf9.jpeg', 0, '0.0', '2018-07-28 21:07:55', '2018-07-28 22:31:43'),
(29, 97, 1, 'Benajir', 'Hidayatullah', 'Kp.kasunyatan', '', '', NULL, 0, '0.0', '2018-07-28 21:08:51', '2018-08-02 06:21:41'),
(30, 98, 1, 'Manggala', 'Ahmad Muhibi', 'Kp. Gaga Bengkanang RT. 001/002 Ds. Onyam Kec.Gunung Kaler Kab. Tangerang Prov. Banten', '', '', 'storage/app/photo_agen/7tAWi9bxUgxHsGlCLEfPpGAExzxzRs1RXhrQ8okd.jpeg', 0, '0.0', '2018-07-28 21:10:10', '2018-08-02 05:48:31'),
(31, 99, 1, 'Toko dewi', 'Herman', 'Kebaharan dukuh serang', 'storage/app/photo_ktp/HLx6HY8YcXL69avzHdPH5vt51vHekZfydEozob73.jpeg', 'storage/app/photo_kk/oSpuYDwdUg6nqc0sGqqVMwJ74henH118WigwuxSW.jpeg', 'storage/app/photo_agen/nCq64MaqXQNotn8J3IGThc5P9C3rWd2y36g32ZqJ.jpeg', 0, '0.0', '2018-07-28 21:11:05', '2018-08-01 05:04:51'),
(32, 100, 1, 'DeOlshop', 'Dyah Putri Ayu Dinastyar', 'Jl. Jayadiningrat 1, Kramatwatu Serang', 'storage/app/photo_ktp/Bppa4PbzN9Mz1mHj8YVjvn5knwYefv6pd8oCjL3d.jpeg', 'storage/app/photo_kk/vJFr6v13ZbpKhLBwpvncru45w4k7oZAgaFXnhnTi.png', 'storage/app/photo_agen/AfdWhjIN0JlPE2660CSRpDs3fa9Pf7zU70C6w8tW.jpeg', 0, '0.0', '2018-07-28 21:11:17', '2018-07-29 16:46:15'),
(33, 101, 1, 'El_Lael', 'Eka Jamalullael', 'Kp.klebet rt/rw 004/001 ds.gandaria kec.mekar baru kab.tangerang-banten', 'storage/app/photo_ktp/T0MG8IvEt52wqO7EFWJHRsAEfKn49KJ3bkLX7jpH.jpeg', 'storage/app/photo_kk/9AusDGbQCSJbUFxMGSFZUAqOiHdlF4A1m85AszR1.png', 'storage/app/photo_agen/msWrSyl2euAyYvfHC40qVrkrzL5APYRQcl7FHN7m.jpeg', 0, '0.0', '2018-07-28 21:12:35', '2018-07-28 22:17:11'),
(34, 102, 1, 'Afrin Grosir', 'Dimas Galih Arsandy Aryadi', 'Link. Muncung, Sumur Pecung, Serang, Banten', '', '', 'storage/app/photo_agen/InJ4dcomjg7z4eGBT87h04f0FdwneRMhswH3XZ5B.jpeg', 5272, '5.0', '2018-07-28 21:13:54', '2018-08-02 06:11:41'),
(35, 103, 1, 'toko cahaya', 'Rani fitriani', 'kp.gedeg rt/rw 03/03 kel.kuranji kec.taktakan kota serang', 'storage/app/photo_ktp/iOFLKBgiJ9bv4n3pqMJpKt3xdhaKd6rG56dyR3Tv.jpeg', 'storage/app/photo_kk/GSm14AgsVOia0892LPkrbj3tbpPyxAgDSRCvkNVF.jpeg', 'storage/app/photo_agen/qmxM21EfzLwSbC3QaYsKkkPRu4tqUKLRSzNMyGHK.jpeg', 0, '0.0', '2018-07-28 21:19:00', '2018-07-31 20:28:19'),
(36, 104, 1, 'RANTAU', 'Hamid', 'Lingkungan sumur putat Rt.001 Rw.002 Kelurahan Cipocok Jaya, Kecamatan Cipocok Jaya, Kota Serang', '', '', NULL, 0, '0', '2018-07-28 21:20:51', '2018-07-28 21:20:51'),
(37, 105, 1, 'RIZKY PUTRA', 'Imam ghojali', 'Lontar baru rt 03 rw 04', '', '', 'storage/app/photo_agen/424LSPGRN0B5Algblcp7DLQ1BsfBHxkDrOLXj20g.jpeg', 0, '0.0', '2018-07-28 21:21:36', '2018-07-28 22:18:44'),
(38, 106, 1, 'Bedug jaya', 'Ahmad fikri', 'Ciceri permai', 'storage/app/photo_ktp/kbIkTrbi1UuXrZNt55QWnSadcZ41M4jc0jeLWQQ0.jpeg', '', 'storage/app/photo_agen/WmgUUVVq49aSuNAIEIWlbBIgXUnMt5dnuU7Xa1E3.png', 0, '0', '2018-07-28 21:22:48', '2018-07-28 21:23:38'),
(39, 107, 1, 'Bintang Songo', 'Muhammad Khalifatullah', 'Jl. Ciwaru, Kec. Cipocok Jaya Kota Serang', '', '', NULL, 0, '0', '2018-07-28 21:26:01', '2018-07-28 21:26:01'),
(40, 108, 1, 'Warung SB', 'Samsul bahri', 'Kp. Pancur melati Rt/01 RW/05 kel pancur kec Taktakan kota serang', 'storage/app/photo_ktp/eMJXZYEQqfwgKolk3rKSaKCyFGi39P7EuD1DDbVP.jpeg', '', 'storage/app/photo_agen/brka7Rr3XKJTRe32zd3BnypmAPqyzfZu7DEquYmd.jpeg', 0, '0.0', '2018-07-28 21:29:55', '2018-07-28 22:35:06'),
(41, 109, 1, 'twin store', 'Rani fitriani', 'kp. gedeg  kel. kuranji rt/rw 03/03 kec.taktakan kota serang', 'storage/app/photo_ktp/CSw8K2dh4gCegYVOKkQJ56Xwb95RibYusHatliDv.jpeg', 'storage/app/photo_kk/bITFW9PP6qtFBAOjnOdaUrDBDzcKOczoioGZgHMg.jpeg', 'storage/app/photo_agen/fRjPtyH6qhPIIyKZQGqq3eUumZ30Gl9Ir8T75czG.jpeg', 0, '0', '2018-07-28 21:30:05', '2018-07-28 21:30:06'),
(42, 110, 1, 'HASAFA SHOP', 'hasna Salsabila Hanifah Khairunnisa Gunawan', 'perum. talaga bestari blok B5 no 33 Wanakerta Sindang jaya Tangerang', 'storage/app/photo_ktp/GM8BYUwjLq49WSOqCdjwFI0fS0DCuDKljGFkZ8NE.jpeg', '', 'storage/app/photo_agen/WVrNKq1jLSrZFSziJ96VQtkmZmutweh7fcmTJ4lm.jpeg', 0, '0', '2018-07-28 21:33:05', '2018-07-28 21:33:22'),
(43, 111, 1, '2M', 'Rahmat', 'Kp sawah RT 05 RW 02 desa vitamin kecamatan jiput', '', '', NULL, 0, '0.0', '2018-07-28 21:37:13', '2018-07-28 21:58:33'),
(44, 112, 1, 'rakyatgrosir', 'didinhazdudin', 'serang', '', '', 'storage/app/photo_agen/xYpvhQalYYyvAni4021wDiDhWsgrrLQbhYCwzltu.jpeg', 0, '0', '2018-07-28 21:43:32', '2018-07-28 21:43:34'),
(45, 113, 1, 'Kong M', 'Aep Saepudin', 'Jln jembatan besi 5 rt 007/004 no 17', 'storage/app/photo_ktp/C6TpIpyYtkb5J67zApRe2chgIPoimwTM7Qbs25q9.jpeg', '', 'storage/app/photo_agen/CWGl7IvgxAPVfZT3mqeVoqNt3U8g2BXY55AGyy0a.jpeg', 0, '0', '2018-07-28 21:45:53', '2018-07-28 21:45:57'),
(46, 115, 1, 'toko bella', 'nabella indah fratiwi', 'taman mutiara indah blok c8 no 21', 'storage/app/photo_ktp/Q7OxUdU2HjAsxxCK1aSPMJ2iQA6WExjfvN0fV33j.jpeg', 'storage/app/photo_kk/pB8Ty1zmX3p8cWR0qpIFJODUlk45P1nFIMdvWOeu.jpeg', 'storage/app/photo_agen/bgUlEt2U21zJKxHs9WHHMCBcJnatMF9HgTl0xnZS.jpeg', 0, '0.0', '2018-07-28 21:53:24', '2018-08-01 01:41:28'),
(47, 116, 1, 'Keluarga Madhani', 'Marica Aldila', 'Taman Nirwana blok D.16 Kel.Pengasinan Kec. Rawalumbu', 'storage/app/photo_ktp/qbTHxJSBAYM1IemoepDO9nxHpZm0uZXYUz1KQNKs.jpeg', 'storage/app/photo_kk/FyTZOiOZe8HzN2D2xbFzYo9npxTmZO9QCEaK7bx6.jpeg', 'storage/app/photo_agen/2vVfSzDK2QbRSpCoNgwZf8K091l0ITNl8ulai7Lk.jpeg', 0, '0', '2018-07-28 22:16:45', '2018-07-28 22:16:47'),
(48, 123, 1, 'Ashlin Fundation', 'Asep Solihin', 'Kp. Bojong Rt 001/009 Kel. Sayar Kec. Taktakan Kota Serang', 'storage/app/photo_ktp/cO76NnYAiMib4CO5EZUyLvnIBCCjpMryM6Nec50A.jpeg', '', 'storage/app/photo_agen/YMdx22a9ietZ7c9GfAqZvrCePjV4Fa5ETDGhWHdn.jpeg', 0, '0', '2018-07-28 22:33:41', '2018-07-28 22:33:47'),
(49, 125, 1, 'Wong dewek', 'Nawahi', 'Kebaharan duku', 'storage/app/photo_ktp/LBHoeA3BgH66yMVTwsPoYsXIBySiBeKULwQUtLMF.jpeg', 'storage/app/photo_kk/VQzl7vOhHrlbbkqc54us926x6WaK97YkLhSU6gMm.jpeg', 'storage/app/photo_agen/3bqwGp8FztV9Atkh3UnLXx1towTgyKiWcjKft3gI.jpeg', 0, '0.0', '2018-07-28 22:51:20', '2018-08-01 04:44:18'),
(50, 127, 1, 'Gilba Family', 'Muhyidin Arif', 'Bumi Agung Permai A7/18, RT/RW 007/011, Unyur, Serang', 'storage/app/photo_ktp/ZZvVkV2fIaLDrvGB9JxzNhj5HMjB3g9EVEGSvhrp.jpeg', 'storage/app/photo_kk/baRxRz15Gn7NgudbDvT6tG4QZiBPltBfr9LjewxC.jpeg', 'storage/app/photo_agen/18T6dWizCRgznLTtObHmWOPAmhVsfHOBFEp80mjS.jpeg', 0, '0.0', '2018-07-28 22:56:25', '2018-07-28 22:57:12'),
(52, 129, 1, 'Grosironesiti', 'Siti fatimah', 'Kp ciwaluran', '', '', 'storage/app/photo_agen/8iRuW5UtjDZ7OGFxD0SBVV3URYdkloOFMN1VPLfQ.jpeg', 0, '0', '2018-07-29 22:39:36', '2018-07-29 22:39:38'),
(53, 130, 1, 'Grosirone', 'Nandar', 'Kalibata', '', '', NULL, 0, '0.0', '2018-07-29 23:27:10', '2018-07-29 23:29:10'),
(54, 131, 1, 'Ranu shop', 'Ranu Mahesti', 'Link. Kelebut Rt 002 rw 005 kel. Banjar Agung Kec. Cipocok Jaya Kota Serang', 'storage/app/photo_ktp/ZS9koAcrshaUOi74ALBtNMokHvrooKW7vGmnwsDQ.jpeg', 'storage/app/photo_kk/N7yYlxowEcwV5HNjKZwadPawhSsAH5IYmDrmIeSN.jpeg', 'storage/app/photo_agen/nfsBKIOrrG6bTNHchQgwqDHtYYktBp23BTk4LPS0.jpeg', 0, '0.0', '2018-07-30 01:13:56', '2018-08-01 18:34:56'),
(55, 133, 1, 'Gilba Store', 'Muhyidin Arif', 'Bumi Agung Permai Blok A7/18 Kota Serang', 'storage/app/photo_ktp/JjFO5kuEMVFuAW0FSiAqHJyA6ypkIkgMR2t8Tp6h.jpeg', 'storage/app/photo_kk/t6HGPuvtEgCbvnf80vWnYHuoB4DEB8NgtDjeCfIT.png', 'storage/app/photo_agen/38C4M91zWykVMwAGLNvWuZtGMjBojaTORVaixqi8.jpeg', 0, '0', '2018-07-30 01:36:06', '2018-07-30 01:36:08'),
(56, 134, 1, 'Agen grosir One', 'Ridho Kuswanto', 'Lingk. Kaliwadas Rt 04 Rw 06 Kel lopang kec serang', '', '', 'storage/app/photo_agen/kpcGOCrLZIBJhywvVW8EClfqZNU518lUrYufJTzF.jpeg', 0, '0', '2018-07-30 03:40:35', '2018-07-30 03:40:37'),
(57, 136, 1, 'Rantau shop', 'Hamid', 'Hamid', 'storage/app/photo_ktp/tifUZnHSHBj1jnzn2FSmfatDFUClPMZL500cZudN.jpeg', 'storage/app/photo_kk/6FeKUXuCNGLHn829QewbgkwwWyYcfZgkmLNT79Jv.jpeg', 'storage/app/photo_agen/zfwm7IMfKCVj15IaIXLMMi08xNdWv0A1hdpV2lqP.jpeg', 0, '0.0', '2018-07-30 06:06:35', '2018-08-02 00:06:41'),
(58, 139, 1, 'TSM Cikupa', 'Jhonny Satria Sinukaban', 'Jl. Cikupamas III No 5 Cikupamas Tangerang', 'storage/app/photo_ktp/uf8dg6D5o9gEoFiL5gO86eZq4G24QycBM1wo8QjY.jpeg', '', 'storage/app/photo_agen/ogWl1ee2fzySpVEaRaNLOwdj5GYIrTiGLXhNiNGd.jpeg', 0, '0.0', '2018-07-30 22:54:05', '2018-08-02 01:30:20'),
(59, 143, 1, 'MARTA PUTRA GROUP', 'MUSRIADI FAHMI MARTA', 'BIREUEN,  ACEH', 'storage/app/photo_ktp/yIxxreg4XD54vRtfAsLFJFVS7in2bflyGpLAcT1S.jpeg', 'storage/app/photo_kk/HvHCav2N4ARqzWwVZm7MZHwsXYAmRreDFyKwC0js.jpeg', 'storage/app/photo_agen/AlPPrMM0Zq4l4nTQIiwfZszLplM60oG7MB3xGpQr.jpeg', 0, '0', '2018-07-31 21:04:10', '2018-07-31 21:04:15'),
(60, 151, 1, 'Pt triputera', 'Hendy', 'Pagar alam', '', '', 'storage/app/photo_agen/aCoMqH0Qng7tefNeCYGIKa89x3XgB0QTh4L4uZ05.jpeg', 0, '0', '2018-08-01 18:57:30', '2018-08-01 18:57:32'),
(61, 153, 1, 'GROSIR ONE', 'SHOF RIJAL', 'KP. JAMBLANG 01/02 KEL. SAWAH LUHUR KEC.KASEMEN KOTA SERANG', 'storage/app/photo_ktp/8vIIMwlyBjNwupeFZpLkCWec1VCePVt9aJUgWRJa.jpeg', 'storage/app/photo_kk/DOamBdUqE4SNKeXwWhkMKBWakRKOgiKUAGEqQ7Nk.jpeg', 'storage/app/photo_agen/0p1iy4xTuiR6AkaKu7jZh1Q3oLKZnGI9T4PBxmfd.png', 0, '0.0', '2018-08-01 20:33:41', '2018-08-02 01:31:32'),
(62, 155, 1, 'BERKAH JAYA', 'SHOF RIJAL', 'KP. JAMBLANG 01/02 KEL. SAWAH LUHUR KEC. KASEMEN KOTA SERANG', 'storage/app/photo_ktp/AVbBLLHuMZfXFj7Vbm2itAT5jOZBXz9dyEzJsy7g.jpeg', 'storage/app/photo_kk/XxsHIQb3MUQEnZpG5r3vlxT5clwrwkog5gwQQFZh.jpeg', 'storage/app/photo_agen/8Hsj3ArYklhbff8DlJUyM7XniH0mf11VfIXVdRpr.png', 0, '0', '2018-08-01 20:59:19', '2018-08-01 20:59:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barcode`
--

CREATE TABLE `barcode` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
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
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `voucher_id`, `subtotal`, `discount`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(64, 63, NULL, 0, NULL, 0, 0, '2018-07-11 00:18:20', '2018-07-11 00:18:34'),
(68, 71, NULL, 0, NULL, 0, 0, '2018-07-12 03:48:36', '2018-07-12 03:48:36'),
(71, 73, NULL, 0, NULL, 0, 0, '2018-07-16 03:23:12', '2018-07-16 03:23:19'),
(78, 74, NULL, 117200, NULL, 0, 117200, '2018-07-17 06:27:58', '2018-07-17 20:03:08'),
(80, 66, NULL, 0, NULL, 0, 0, '2018-07-16 23:04:25', '2018-07-16 23:04:25'),
(87, 76, NULL, 0, NULL, 0, 0, '2018-07-17 01:43:06', '2018-07-17 01:43:06'),
(88, 69, NULL, 0, NULL, 0, 0, '2018-08-02 07:13:11', '2018-08-02 07:13:37'),
(92, 72, NULL, 356600, NULL, 0, 356600, '2018-07-19 01:22:05', '2018-07-30 20:38:11'),
(94, 82, NULL, 193350, NULL, 0, 193350, '2018-07-25 03:33:52', '2018-07-30 22:50:42'),
(97, 60, NULL, 0, NULL, 0, 0, '2018-07-28 10:14:39', '2018-07-28 10:14:45'),
(101, 85, NULL, 80100, NULL, 0, 80100, '2018-07-27 01:49:09', '2018-07-27 01:49:29'),
(123, 114, NULL, 0, NULL, 0, 0, '2018-07-28 21:48:56', '2018-07-28 21:48:56'),
(127, 124, NULL, 0, NULL, 0, 0, '2018-07-30 03:15:52', '2018-07-31 16:58:39'),
(132, 47, NULL, 0, NULL, 0, 0, '2018-08-01 03:43:42', '2018-08-01 03:44:50'),
(133, 126, NULL, 0, NULL, 0, 0, '2018-07-28 23:40:47', '2018-07-28 23:40:47'),
(190, 83, NULL, 0, NULL, 0, 0, '2018-07-29 21:06:22', '2018-07-29 21:06:22'),
(194, 1, NULL, 0, NULL, 0, 0, '2018-07-30 01:02:47', '2018-07-30 01:02:47'),
(196, 135, NULL, 0, NULL, 0, 0, '2018-07-30 05:55:58', '2018-07-30 05:55:58'),
(198, 137, NULL, 26700, NULL, 0, 26700, '2018-07-30 06:21:11', '2018-07-30 06:21:11'),
(199, 138, NULL, 0, NULL, 0, 0, '2018-07-30 17:26:55', '2018-07-30 17:26:55'),
(205, 140, NULL, 124500, NULL, 0, 124500, '2018-08-01 02:06:38', '2018-08-01 02:06:47'),
(206, 141, NULL, 0, NULL, 0, 0, '2018-07-31 01:05:08', '2018-07-31 01:05:08'),
(207, 142, NULL, 247000, NULL, 0, 247000, '2018-07-31 01:31:17', '2018-07-31 01:31:17'),
(214, 144, NULL, 0, NULL, 0, 0, '2018-07-31 22:49:43', '2018-07-31 22:49:43'),
(217, 146, NULL, 0, NULL, 0, 0, '2018-08-01 01:27:21', '2018-08-01 01:27:21'),
(218, 147, NULL, 0, NULL, 0, 0, '2018-08-01 01:36:51', '2018-08-01 01:36:51'),
(221, 120, NULL, 0, NULL, 0, 0, '2018-08-01 03:16:58', '2018-08-01 03:16:58'),
(222, 148, NULL, 0, NULL, 0, 0, '2018-08-01 05:33:39', '2018-08-01 05:33:39'),
(223, 150, NULL, 0, NULL, 0, 0, '2018-08-01 09:58:06', '2018-08-01 09:58:06'),
(224, 154, NULL, 0, NULL, 0, 0, '2018-08-01 20:58:25', '2018-08-01 20:58:25'),
(227, 156, NULL, 0, NULL, 0, 0, '2018-08-02 00:16:54', '2018-08-02 00:16:54'),
(229, 157, NULL, 1200, NULL, 0, 1200, '2018-08-02 01:33:25', '2018-08-02 01:33:25'),
(230, 158, NULL, 0, NULL, 0, 0, '2018-08-02 01:38:14', '2018-08-02 01:38:14'),
(231, 159, NULL, 0, NULL, 0, 0, '2018-08-02 03:48:53', '2018-08-02 03:48:53'),
(232, 33, NULL, 0, NULL, 0, 0, '2018-08-02 03:56:26', '2018-08-02 03:56:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_detail`
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
-- Dumping data untuk tabel `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `cart_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(129, 78, 24, 1, '2018-07-17 06:27:58', '2018-07-17 06:27:58'),
(130, 78, 20, 2, '2018-07-17 06:28:00', '2018-07-17 20:03:02'),
(131, 78, 23, 1, '2018-07-17 06:28:07', '2018-07-17 06:28:07'),
(132, 78, 18, 1, '2018-07-17 20:03:08', '2018-07-17 20:03:08'),
(148, 92, 20, 2, '2018-07-19 01:22:05', '2018-07-19 20:35:53'),
(150, 92, 19, 1, '2018-07-19 20:35:55', '2018-07-19 20:35:55'),
(151, 92, 23, 1, '2018-07-19 20:35:57', '2018-07-19 20:35:57'),
(152, 92, 15, 1, '2018-07-19 20:36:00', '2018-07-19 20:36:00'),
(178, 94, 13, 1, '2018-07-25 03:33:52', '2018-07-25 03:33:52'),
(179, 94, 57, 1, '2018-07-25 22:00:50', '2018-07-25 22:00:50'),
(180, 94, 24, 3, '2018-07-26 22:36:27', '2018-07-30 22:50:42'),
(186, 101, 24, 3, '2018-07-27 01:49:09', '2018-07-27 01:49:29'),
(193, 94, 137, 1, '2018-07-27 03:57:02', '2018-07-27 03:57:02'),
(212, 97, 24, -1, '2018-07-28 10:12:00', '2018-07-28 10:12:00'),
(213, 97, 20, -1, '2018-07-28 10:12:01', '2018-07-28 10:12:01'),
(215, 88, 24, -8, '2018-07-28 14:53:02', '2018-07-28 14:53:02'),
(364, 94, 54, 1, '2018-07-30 00:28:25', '2018-07-30 00:28:25'),
(365, 94, 48, 1, '2018-07-30 00:28:49', '2018-07-30 00:28:49'),
(384, 198, 24, 1, '2018-07-30 06:21:11', '2018-07-30 06:21:11'),
(385, 92, 16, 1, '2018-07-30 20:38:11', '2018-07-30 20:38:11'),
(400, 207, 15, 1, '2018-07-31 01:31:17', '2018-07-31 01:31:17'),
(410, 88, 18, -1, '2018-08-01 01:23:16', '2018-08-01 01:23:16'),
(416, 205, 78, 3, '2018-08-01 02:06:38', '2018-08-01 02:06:47'),
(421, 229, 138, 1, '2018-08-02 01:33:25', '2018-08-02 01:33:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cash`
--

CREATE TABLE `cash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `starting_cash` int(15) NOT NULL,
  `sales` int(15) NOT NULL,
  `topup` int(11) NOT NULL,
  `closing_cash` int(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cash`
--

INSERT INTO `cash` (`id`, `user_id`, `starting_cash`, `sales`, `topup`, `closing_cash`, `created_at`, `updated_at`) VALUES
(1, 33, 100000, 0, 0, 100000, '2018-07-28 05:33:32', '2018-07-28 05:33:32'),
(2, 1, 1234, 0, 0, 0, '2018-06-11 23:15:04', '2018-06-11 23:15:04'),
(3, 1, 23333, 0, 0, 0, '2018-06-11 23:15:17', '2018-06-11 23:15:17'),
(4, 1, 233311, 0, 0, 0, '2018-06-12 01:27:25', '2018-06-12 01:27:25'),
(5, 1, 44222, 0, 0, 0, '2018-06-12 01:30:46', '2018-06-12 01:30:46'),
(6, 1, 33322, 0, 0, 0, '2018-06-12 01:32:07', '2018-06-12 01:32:07'),
(7, 1, 44444, 0, 0, 0, '2018-06-12 01:32:24', '2018-06-12 01:32:24'),
(8, 1, 43444, 0, 0, 0, '2018-06-12 01:33:32', '2018-06-12 01:33:32'),
(9, 1, 10000, 0, 0, 0, '2018-06-26 00:18:06', '2018-06-26 00:18:06'),
(10, 1, 80000, 0, 0, 0, '2018-06-26 00:22:04', '2018-06-26 00:22:04'),
(11, 1, 1000, 0, 0, 0, '2018-06-26 00:25:47', '2018-06-26 00:25:47'),
(12, 1, 5000, 0, 0, 0, '2018-06-26 00:32:45', '2018-06-26 00:32:45'),
(13, 1, 25, 0, 0, 0, '2018-06-26 01:15:19', '2018-06-26 01:15:19'),
(14, 1, 80, 0, 0, 0, '2018-06-26 01:18:25', '2018-06-26 01:18:25'),
(15, 1, 458, 0, 0, 0, '2018-06-26 01:26:27', '2018-06-26 01:26:27'),
(16, 1, 280, 0, 0, 0, '2018-06-26 01:35:15', '2018-06-26 01:35:15'),
(17, 1, 500, 0, 0, 0, '2018-06-26 01:41:14', '2018-06-26 01:41:14'),
(18, 1, 844, 0, 0, 0, '2018-06-26 01:45:35', '2018-06-26 01:45:35'),
(19, 1, 58888, 0, 0, 0, '2018-06-26 01:49:57', '2018-06-26 01:49:57'),
(20, 1, 2542, 0, 0, 0, '2018-06-26 01:53:42', '2018-06-26 01:53:42'),
(21, 1, 100000, 0, 0, 0, '2018-06-27 07:23:09', '2018-06-27 07:23:09'),
(22, 1, 10000, 0, 0, 0, '2018-06-27 07:24:31', '2018-06-27 07:24:31'),
(23, 1, 100000, 0, 0, 0, '2018-06-27 07:26:19', '2018-06-27 07:26:19'),
(24, 1, 100000, 0, 0, 0, '2018-06-27 07:28:00', '2018-06-27 07:28:00'),
(25, 1, 100000, 0, 0, 0, '2018-06-27 07:31:43', '2018-06-27 07:31:43'),
(26, 1, 500000, 0, 0, 0, '2018-07-26 03:18:55', '2018-07-26 03:18:55'),
(27, 1, 50000, 0, 0, 0, '2018-07-26 03:25:22', '2018-07-26 03:25:22'),
(28, 33, 500000, 0, 0, 490000, '2018-07-27 02:25:19', '2018-07-27 02:25:19'),
(29, 1, 500000, 140000, 0, 490000, '2018-07-27 02:23:51', '2018-07-27 02:23:51'),
(30, 1, 10000, 0, 0, 0, '2018-07-27 02:18:57', '2018-07-27 02:18:57'),
(31, 1, 10000, 0, 0, 0, '2018-07-27 02:18:58', '2018-07-27 02:18:58'),
(32, 1, 1222222, 9700, 0, 1231922, '2018-07-28 06:03:16', '2018-07-28 06:03:16'),
(33, 1, 1222222, 0, 0, 1222222, '2018-07-29 00:36:03', '2018-07-29 00:36:03'),
(34, 1, 100000, 0, 0, 100000, '2018-07-29 05:57:47', '2018-07-29 05:57:47'),
(35, 33, 100001, 0, 0, 0, '2018-07-28 06:24:32', '2018-07-28 06:24:32'),
(36, 1, 100000, 0, 0, 0, '2018-07-28 09:47:06', '2018-07-28 09:47:06'),
(37, 1, 100000, 65800, 0, 165800, '2018-07-28 09:47:10', '2018-07-28 09:47:10'),
(38, 1, 5000, 0, 0, 0, '2018-07-28 09:49:02', '2018-07-28 09:49:02'),
(39, 1, 5000, 65800, 0, 70800, '2018-07-28 09:49:05', '2018-07-28 09:49:05'),
(40, 1, 5000, 0, 0, 0, '2018-07-28 09:56:50', '2018-07-28 09:56:50'),
(41, 1, 5000, 0, 0, 0, '2018-07-28 09:56:50', '2018-07-28 09:56:50'),
(42, 1, 10000, 0, 0, 0, '2018-07-28 09:57:13', '2018-07-28 09:57:13'),
(43, 1, 10000, 0, 0, 10000, '2018-07-29 06:01:18', '2018-07-29 06:01:18'),
(44, 1, 50000, 0, 0, 0, '2018-07-29 00:07:25', '2018-07-29 00:07:25'),
(45, 1, 50000, 0, 0, 0, '2018-07-29 00:07:25', '2018-07-29 00:07:25'),
(46, 1, 50000, 0, 0, 0, '2018-07-29 00:07:29', '2018-07-29 00:07:29'),
(47, 33, 50000, 0, 0, 50000, '2018-07-29 00:17:52', '2018-07-29 00:17:52'),
(48, 33, 50000, 0, 0, 50000, '2018-07-29 00:27:19', '2018-07-29 00:27:19'),
(49, 1, 10000, 188550, 111000, 309550, '2018-07-29 00:28:32', '2018-07-29 00:28:32'),
(50, 1, 20000, 16900, 0, 36900, '2018-07-29 00:29:55', '2018-07-29 00:29:55'),
(51, 1, 80000, 0, 0, 0, '2018-07-29 00:37:24', '2018-07-29 00:37:24'),
(52, 1, 80000, 0, 0, 80000, '2018-07-29 00:37:43', '2018-07-29 00:37:43'),
(53, 1, 50000, 0, 0, 0, '2018-07-29 00:38:36', '2018-07-29 00:38:36'),
(54, 1, 50000, 0, 0, 50000, '2018-07-29 00:39:10', '2018-07-29 00:39:10'),
(55, 1, 8000, 0, 0, 8000, '2018-07-29 00:39:30', '2018-07-29 00:39:30'),
(56, 1, 50000, 0, 0, 50000, '2018-07-29 05:02:17', '2018-07-29 05:02:17'),
(57, 1, 50000, 0, 0, 50000, '2018-07-29 05:03:12', '2018-07-29 05:03:12'),
(58, 1, 10000, 9700, 0, 19700, '2018-07-29 05:33:02', '2018-07-29 05:33:02'),
(59, 1, 50000, 0, 0, 50000, '2018-07-29 05:48:46', '2018-07-29 05:48:46'),
(60, 1, 10000, 0, 0, 10000, '2018-07-29 05:54:31', '2018-07-29 05:54:31'),
(61, 1, 2000, 0, 0, 2000, '2018-07-29 06:41:17', '2018-07-29 06:41:17'),
(62, 1, 5000, 0, 0, 0, '2018-07-29 06:01:37', '2018-07-29 06:01:37'),
(63, 1, 5000, 12200, 0, 17200, '2018-07-29 06:18:31', '2018-07-29 06:18:31'),
(64, 1, 5000, 0, 0, 0, '2018-07-29 06:08:12', '2018-07-29 06:08:12'),
(65, 1, 5000, 0, 0, 5000, '2018-07-29 06:09:16', '2018-07-29 06:09:16'),
(66, 1, 5000, 0, 0, 0, '2018-07-29 06:10:48', '2018-07-29 06:10:48'),
(67, 1, 5000, 0, 0, 5000, '2018-07-29 06:20:01', '2018-07-29 06:20:01'),
(68, 1, 1212, 0, 0, 0, '2018-07-29 06:20:18', '2018-07-29 06:20:18'),
(69, 1, 1212, 0, 0, 1212, '2018-07-29 07:24:37', '2018-07-29 07:24:37'),
(70, 1, 5700, 0, 0, 5700, '2018-07-29 07:21:54', '2018-07-29 07:21:54'),
(71, 1, 5000, 0, 0, 5000, '2018-07-29 07:34:59', '2018-07-29 07:34:59'),
(72, 1, 5000, 0, 0, 5000, '2018-07-29 07:38:47', '2018-07-29 07:38:47'),
(73, 1, 5000, 0, 0, 5000, '2018-07-29 07:55:52', '2018-07-29 07:55:52'),
(74, 1, 2580, 0, 0, 2580, '2018-07-29 07:59:49', '2018-07-29 07:59:49'),
(75, 1, 4567, 22450, 0, 27017, '2018-07-29 08:44:29', '2018-07-29 08:44:29'),
(76, 1, 1515, 0, 0, 0, '2018-07-29 08:03:47', '2018-07-29 08:03:47'),
(77, 1, 1515, 0, 0, 1515, '2018-07-29 08:03:54', '2018-07-29 08:03:54'),
(78, 1, 5111, 0, 0, 5111, '2018-07-30 20:46:47', '2018-07-30 20:46:47'),
(79, 1, 5111, 0, 0, 5111, '2018-07-29 08:06:24', '2018-07-29 08:06:24'),
(80, 1, 12333, 0, 0, 0, '2018-07-29 08:08:39', '2018-07-29 08:08:39'),
(81, 1, 12333, 1048150, 111000, 1171483, '2018-07-29 08:08:43', '2018-07-29 08:08:43'),
(82, 1, 2333, 0, 0, 0, '2018-07-29 08:10:43', '2018-07-29 08:10:43'),
(83, 1, 2333, 29500, 0, 31833, '2018-07-29 08:10:47', '2018-07-29 08:10:47'),
(84, 1, 15555, 0, 0, 0, '2018-07-29 08:12:51', '2018-07-29 08:12:51'),
(85, 1, 15555, 0, 0, 15555, '2018-07-29 08:13:18', '2018-07-29 08:13:18'),
(86, 1, 4561, 0, 0, 0, '2018-07-29 08:17:21', '2018-07-29 08:17:21'),
(87, 1, 4561, 0, 0, 4561, '2018-07-29 08:19:34', '2018-07-29 08:19:34'),
(88, 1, 22222, 0, 0, 0, '2018-07-29 08:22:02', '2018-07-29 08:22:02'),
(89, 1, 22222, 0, 0, 22222, '2018-07-29 08:22:09', '2018-07-29 08:22:09'),
(90, 1, 1231231, 0, 0, 1231231, '2018-07-30 20:47:23', '2018-07-30 20:47:23'),
(91, 1, 1231231, 0, 0, 1231231, '2018-07-30 20:47:32', '2018-07-30 20:47:32'),
(92, 1, 22222, 0, 0, 0, '2018-07-29 08:24:28', '2018-07-29 08:24:28'),
(93, 1, 22222, 51500, 0, 73722, '2018-07-29 08:24:31', '2018-07-29 08:24:31'),
(94, 1, 2222, 0, 0, 0, '2018-07-29 08:26:28', '2018-07-29 08:26:28'),
(95, 1, 2222, 0, 0, 0, '2018-07-29 08:26:29', '2018-07-29 08:26:29'),
(96, 1, 12222, 0, 0, 12222, '2018-07-29 20:43:28', '2018-07-29 20:43:28'),
(97, 1, 100000, 96650, 0, 196650, '2018-07-30 00:59:40', '2018-07-30 00:59:40'),
(98, 33, 50000, 0, 0, 50000, '2018-07-30 01:00:50', '2018-07-30 01:00:50'),
(99, 1, 50000, 0, 0, 0, '2018-07-30 01:02:14', '2018-07-30 01:02:14'),
(100, 1, 50000, 9700, 0, 59700, '2018-07-30 01:02:55', '2018-07-30 01:02:55'),
(101, 33, 50000, 25700, 0, 75700, '2018-07-30 01:05:09', '2018-07-30 01:05:09'),
(102, 33, 503700, 7200, 0, 510900, '2018-07-30 21:02:43', '2018-07-30 21:02:43'),
(103, 33, 503700, 132700, 0, 636400, '2018-07-31 03:54:07', '2018-07-31 03:54:07'),
(104, 33, 503700, 132650, 70000, 706350, '2018-08-01 03:53:36', '2018-08-01 03:53:36'),
(105, 33, 503700, 79450, 0, 583150, '2018-08-02 03:57:01', '2018-08-02 03:57:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
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
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id`, `order_id`, `sender_id`, `recipient_id`, `message`, `created_at`, `updated_at`) VALUES
(72, 93, 64, 63, 'Halo pak nandar', '2018-07-05 04:06:09', '2018-07-05 04:06:09'),
(73, 93, 63, 64, 'Halo pak budi', '2018-07-05 04:06:25', '2018-07-05 04:06:25'),
(74, 93, 63, 64, 'Sudah dimana', '2018-07-05 04:06:29', '2018-07-05 04:06:29'),
(75, 93, 63, 64, 'Pak budi kapan dikirim barang saya ?', '2018-07-06 00:03:21', '2018-07-06 00:03:21'),
(76, 93, 64, 63, 'Sebentar ya pak lagi di siapin', '2018-07-06 00:03:33', '2018-07-06 00:03:33'),
(77, 93, 64, 63, 'Sebentar pak', '2018-07-06 00:05:09', '2018-07-06 00:05:09'),
(78, 93, 63, 64, 'Oke ,, alamatnya ikutin pin map ya pak', '2018-07-06 00:06:28', '2018-07-06 00:06:28'),
(79, 100, 69, 64, 'Woi dikirim kapan?', '2018-07-12 03:37:06', '2018-07-12 03:37:06'),
(80, 100, 64, 69, 'Sabar ya', '2018-07-12 03:40:41', '2018-07-12 03:40:41'),
(81, 100, 64, 69, 'Lg di collect', '2018-07-12 03:40:47', '2018-07-12 03:40:47'),
(82, 101, 60, 1, 'Oii', '2018-07-12 04:09:25', '2018-07-12 04:09:25'),
(83, 101, 1, 60, 'Pak alamatnya ikutin map?', '2018-07-12 04:11:10', '2018-07-12 04:11:10'),
(84, 101, 60, 1, 'Iyee', '2018-07-12 04:11:27', '2018-07-12 04:11:27'),
(85, 101, 1, 60, 'Apa', '2018-07-12 04:12:23', '2018-07-12 04:12:23'),
(86, 101, 60, 1, 'Apa luuuu', '2018-07-12 04:13:25', '2018-07-12 04:13:25'),
(87, 101, 1, 60, 'Kirim woi', '2018-07-12 04:13:50', '2018-07-12 04:13:50'),
(88, 101, 60, 1, 'Udah di terima belum pesanan saya???', '2018-07-12 04:14:37', '2018-07-12 04:14:37'),
(89, 101, 1, 60, 'Sudah woi', '2018-07-12 04:15:02', '2018-07-12 04:15:02'),
(90, 101, 1, 60, 'Pak', '2018-07-12 04:16:44', '2018-07-12 04:16:44'),
(91, 101, 60, 1, 'Mana adaaa', '2018-07-12 04:17:05', '2018-07-12 04:17:05'),
(92, 101, 60, 1, 'Dinner bareng ga pak?', '2018-07-12 04:17:24', '2018-07-12 04:17:24'),
(93, 101, 1, 60, 'Din apa pak??', '2018-07-12 04:17:59', '2018-07-12 04:17:59'),
(94, 101, 60, 1, 'Gatau ni tergantung sebelah saya', '2018-07-12 04:18:25', '2018-07-12 04:18:25'),
(95, 101, 60, 1, 'Pecel ntap pak', '2018-07-12 04:19:51', '2018-07-12 04:19:51'),
(96, 101, 1, 60, 'Yosep ga lu bales ??', '2018-07-12 04:19:52', '2018-07-12 04:19:52'),
(97, 101, 60, 1, 'Ohiya lupa cuii', '2018-07-12 04:20:00', '2018-07-12 04:20:00'),
(98, 101, 1, 60, 'Pecel dimana ?? Wandi pda ttup', '2018-07-12 04:20:16', '2018-07-12 04:20:16'),
(99, 101, 60, 1, 'Masa masih tutup?', '2018-07-12 04:20:43', '2018-07-12 04:20:43'),
(100, 101, 1, 60, 'Masih pak', '2018-07-12 04:21:17', '2018-07-12 04:21:17'),
(101, 101, 60, 1, 'Tau drmn lu', '2018-07-12 04:22:18', '2018-07-12 04:22:18'),
(102, 101, 1, 60, 'Darii pak roy kimochi', '2018-07-12 04:23:58', '2018-07-12 04:23:58'),
(103, 100, 69, 64, 'Siap', '2018-07-13 05:43:10', '2018-07-13 05:43:10'),
(104, 100, 69, 64, 'Baiknya sebelum pesanan selesai di menu pesanan ada indikator tanda seperti inbox yg blm di read', '2018-07-13 05:44:38', '2018-07-13 05:44:38'),
(105, 100, 69, 64, 'Tp next update gpp, di record aja', '2018-07-13 05:44:58', '2018-07-13 05:44:58'),
(106, 100, 69, 64, 'Tes', '2018-07-13 05:45:18', '2018-07-13 05:45:18'),
(107, 100, 69, 64, 'Chat rada lemot', '2018-07-13 05:47:42', '2018-07-13 05:47:42'),
(108, 100, 69, 64, 'Text yg di kirim terkesan blm terkirim,  bandwith bisa di cek gk bro?  Ngaruhnya apa ya?', '2018-07-13 05:49:18', '2018-07-13 05:49:18'),
(109, 102, 69, 64, 'Tes', '2018-07-13 05:49:28', '2018-07-13 05:49:28'),
(110, 100, 69, 64, 'Tesssssss', '2018-07-13 05:49:47', '2018-07-13 05:49:47'),
(111, 100, 69, 64, '1', '2018-07-13 05:49:52', '2018-07-13 05:49:52'),
(112, 100, 69, 64, '2', '2018-07-13 05:49:58', '2018-07-13 05:49:58'),
(113, 100, 69, 64, '3', '2018-07-13 05:50:04', '2018-07-13 05:50:04'),
(114, 100, 69, 64, '4', '2018-07-13 05:50:11', '2018-07-13 05:50:11'),
(115, 100, 69, 64, 'Keknya jeda send sama delivery pi<br />\n<br />\n<br />\nKeknya respond dari servernya perlu di tes kl yg login banyak user..', '2018-07-13 05:52:40', '2018-07-13 05:52:40'),
(116, 100, 69, 64, 'Keluar error text', '2018-07-13 05:53:15', '2018-07-13 05:53:15'),
(117, 100, 69, 64, '1', '2018-07-13 05:53:23', '2018-07-13 05:53:23'),
(118, 100, 69, 64, '2', '2018-07-13 05:53:27', '2018-07-13 05:53:27'),
(119, 100, 69, 64, '3', '2018-07-13 05:53:33', '2018-07-13 05:53:33'),
(120, 100, 69, 64, 'Respond 4-5 detik keliatannya', '2018-07-13 05:54:05', '2018-07-13 05:54:05'),
(121, 102, 69, 64, 'Tes', '2018-07-14 06:46:54', '2018-07-14 06:46:54'),
(122, 102, 69, 64, 'Tes lagi?', '2018-07-14 06:47:03', '2018-07-14 06:47:03'),
(123, 100, 69, 64, 'Tes', '2018-07-16 05:38:31', '2018-07-16 05:38:31'),
(124, 100, 69, 64, 'Tes', '2018-07-16 05:38:56', '2018-07-16 05:38:56'),
(125, 100, 69, 64, 'W', '2018-07-16 05:39:02', '2018-07-16 05:39:02'),
(126, 100, 69, 64, 'C', '2018-07-16 05:39:04', '2018-07-16 05:39:04'),
(127, 102, 69, 64, 'Tes', '2018-07-16 05:39:29', '2018-07-16 05:39:29'),
(128, 102, 69, 64, 'Tes', '2018-07-16 05:39:39', '2018-07-16 05:39:39'),
(129, 101, 1, 60, 'Tes', '2018-07-16 09:21:43', '2018-07-16 09:21:43'),
(130, 107, 1, 47, 'Woi coi', '2018-07-16 10:33:18', '2018-07-16 10:33:18'),
(131, 107, 1, 47, 'Woi coi', '2018-07-16 10:33:20', '2018-07-16 10:33:20'),
(132, 108, 69, 64, 'Tes', '2018-07-16 17:08:44', '2018-07-16 17:08:44'),
(133, 110, 1, 74, 'Hari ini diantar ya pak', '2018-07-16 21:21:15', '2018-07-16 21:21:15'),
(134, 110, 1, 74, 'Hari ini diantar ya pak', '2018-07-16 21:21:17', '2018-07-16 21:21:17'),
(135, 110, 74, 1, 'Iya', '2018-07-16 21:21:29', '2018-07-16 21:21:29'),
(136, 110, 74, 1, 'Iya', '2018-07-16 21:21:31', '2018-07-16 21:21:31'),
(137, 112, 1, 66, 'Ini aja pak?', '2018-07-16 23:06:02', '2018-07-16 23:06:02'),
(138, 112, 66, 1, 'Oke segera', '2018-07-16 23:06:14', '2018-07-16 23:06:14'),
(139, 113, 72, 1, 'Test', '2018-07-16 23:11:28', '2018-07-16 23:11:28'),
(140, 118, 47, 1, 'Coi', '2018-07-17 00:01:14', '2018-07-17 00:01:14'),
(141, 118, 47, 1, 'Anter skrg dong coi', '2018-07-17 00:03:02', '2018-07-17 00:03:02'),
(142, 118, 47, 1, 'Oiii', '2018-07-17 00:03:42', '2018-07-17 00:03:42'),
(143, 118, 47, 1, 'Tes', '2018-07-17 00:06:04', '2018-07-17 00:06:04'),
(144, 109, 60, 1, 'Tes', '2018-07-17 03:13:47', '2018-07-17 03:13:47'),
(145, 109, 60, 1, 'Oi han', '2018-07-19 00:05:28', '2018-07-19 00:05:28'),
(146, 122, 1, 72, 'Konci', '2018-07-19 00:28:19', '2018-07-19 00:28:19'),
(147, 122, 1, 72, 'Oi konci', '2018-07-19 00:28:42', '2018-07-19 00:28:42'),
(148, 122, 72, 1, 'Oi', '2018-07-19 00:29:28', '2018-07-19 00:29:28'),
(149, 122, 1, 72, 'Tit', '2018-07-19 00:29:53', '2018-07-19 00:29:53'),
(150, 122, 72, 1, 'Pak', '2018-07-19 00:30:58', '2018-07-19 00:30:58'),
(151, 122, 72, 1, 'Pak', '2018-07-19 00:31:02', '2018-07-19 00:31:02'),
(152, 122, 1, 72, 'Qwd', '2018-07-19 00:31:19', '2018-07-19 00:31:19'),
(153, 121, 1, 60, 'Kobci', '2018-07-19 00:31:50', '2018-07-19 00:31:50'),
(154, 100, 69, 64, 'Dan', '2018-07-20 23:57:55', '2018-07-20 23:57:55'),
(155, 100, 69, 64, 'Tes', '2018-07-20 23:58:00', '2018-07-20 23:58:00'),
(156, 108, 69, 64, 'Tes', '2018-07-21 00:00:40', '2018-07-21 00:00:40'),
(157, 123, 1, 47, 'Malam', '2018-07-21 11:47:10', '2018-07-21 11:47:10'),
(158, 123, 47, 1, 'Ya', '2018-07-21 11:47:25', '2018-07-21 11:47:25'),
(159, 125, 1, 60, 'Pak', '2018-07-25 03:12:23', '2018-07-25 03:12:23'),
(160, 125, 1, 60, 'Sore pak', '2018-07-25 03:12:46', '2018-07-25 03:12:46'),
(161, 125, 60, 1, 'Apa pak?', '2018-07-25 03:13:04', '2018-07-25 03:13:04'),
(162, 224, 64, 83, 'Siap pak', '2018-07-29 21:11:01', '2018-07-29 21:11:01'),
(163, 224, 64, 83, 'Segera kami ambil dan kirimkan', '2018-07-29 21:11:15', '2018-07-29 21:11:15'),
(164, 224, 83, 64, 'Baik pak mohon ditunggu', '2018-07-29 21:13:34', '2018-07-29 21:13:34'),
(165, 241, 102, 120, 'Tunggu ya soree', '2018-07-31 22:27:03', '2018-07-31 22:27:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `city`
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
-- Struktur dari tabel `commission`
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
-- Dumping data untuk tabel `commission`
--

INSERT INTO `commission` (`id`, `agen_id`, `order_id`, `margin_penjualan`, `incentive`, `commission_pph`, `commission_netto`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 71250, 71250, 0, 0, '2018-04-01 13:23:30', '2018-04-01 13:23:30'),
(2, 2, 3, 12, 12, 11, 11, '2018-05-06 08:50:11', '2018-05-06 08:50:11'),
(3, 2, 2, 1612, 71250, 1457, 71405, '2018-05-06 09:04:54', '2018-05-06 09:04:54'),
(4, 1, 3, 0, 0, 0, 0, '2018-06-11 12:08:18', '2018-06-11 12:08:18'),
(7, 1, 23, 10235, 4902, 303, 14835, '2018-07-01 23:56:07', '2018-07-01 23:56:07'),
(8, 14, 83, 13700, 5480, 384, 18796, '2018-07-02 00:19:15', '2018-07-02 00:19:15'),
(9, 14, 87, 2412, 2153, 91, 4474, '2018-07-02 00:21:43', '2018-07-02 00:21:43'),
(10, 14, 86, 13018, 12634, 513, 25138, '2018-07-02 00:22:39', '2018-07-02 00:22:39'),
(11, 14, 85, 2818, 1127, 79, 3866, '2018-07-02 00:22:42', '2018-07-02 00:22:42'),
(12, 14, 85, 2818, 1127, 79, 3866, '2018-07-02 00:22:45', '2018-07-02 00:22:45'),
(13, 2, 81, 1335, 534, 37, 1832, '2018-07-02 00:22:52', '2018-07-02 00:22:52'),
(14, 14, 88, 2750, 4125, 138, 6738, '2018-07-02 00:37:52', '2018-07-02 00:37:52'),
(28, 1, 96, 1335, 534, 37, 1832, '2018-07-10 03:18:08', '2018-07-10 03:18:08'),
(29, 64, 97, 2670, 1068, 75, 3663, '2018-07-10 23:20:22', '2018-07-10 23:20:22'),
(30, 1, 110, 4750, 4172, 178, 8743, '2018-07-16 21:37:58', '2018-07-16 21:37:58'),
(31, 1, 101, 745, 298, 21, 1022, '2018-07-16 21:52:51', '2018-07-16 21:52:51'),
(35, 1, 111, 1335, 5534, 37, 6832, '2018-07-16 22:58:46', '2018-07-16 22:58:46'),
(36, 1, 112, 1335, 5534, 37, 6832, '2018-07-16 23:12:00', '2018-07-16 23:12:00'),
(37, 1, 112, 1335, 5534, 37, 6832, '2018-07-16 23:12:06', '2018-07-16 23:12:06'),
(38, 64, 124, 2150, 6124, 65, 8209, '2018-07-25 02:56:01', '2018-07-25 02:56:01'),
(39, 64, 98, 1175, 7350, 70, 8454, '2018-07-25 02:56:05', '2018-07-25 02:56:05'),
(40, 64, 99, 1862, 8725, 112, 10476, '2018-07-25 02:57:38', '2018-07-25 02:57:38'),
(41, 64, 100, 3070, 1228, 86, 4212, '2018-07-25 02:57:41', '2018-07-25 02:57:41'),
(42, 64, 100, 3070, 1228, 86, 4212, '2018-07-25 02:57:44', '2018-07-25 02:57:44'),
(43, 64, 119, 1335, 5534, 37, 6832, '2018-07-25 02:57:53', '2018-07-25 02:57:53'),
(44, 64, 119, 1335, 5534, 37, 6832, '2018-07-25 02:58:24', '2018-07-25 02:58:24'),
(45, 1, 125, 1335, 5534, 37, 6832, '2018-07-25 03:17:20', '2018-07-25 03:17:20'),
(46, 1, 121, 610, 5915, 30, 6494, '2018-07-26 02:41:28', '2018-07-26 02:41:28'),
(47, 64, 155, 2012, 5805, 56, 7761, '2018-07-28 22:03:59', '2018-07-28 22:03:59'),
(48, 102, 157, 280, 5280, 11, 5549, '2018-07-28 22:45:24', '2018-07-28 22:45:24'),
(49, 102, 241, 613, 5245, 117, 5741, '2018-08-01 03:19:37', '2018-08-01 21:50:11'),
(50, 102, 247, 1722, 240, 39, 1923, '2018-08-01 03:24:14', '2018-08-01 03:24:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `identifier` int(11) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `wanee` int(20) NOT NULL DEFAULT '0',
  `name` varchar(150) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` longtext,
  `lat` varchar(50) NOT NULL DEFAULT '0',
  `long` varchar(50) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `identifier`, `agen_id`, `wanee`, `name`, `photo`, `gender`, `address`, `lat`, `long`, `created_at`, `updated_at`) VALUES
(1, 3, 0, 0, 'Jordy Jonatan', '', '', 'Jl. Daan Mogot', '', '', '2017-12-05 15:21:45', '2017-12-06 06:03:33'),
(27, 33, 0, 0, 'George', '', '', 'Jalan Princess Alice 2,Kelapa Dua,Tangerang', '', '', '2017-12-29 06:28:31', '2018-01-09 08:56:49'),
(28, 34, 0, 0, 'Jonatan', '', '', 'Balikpapan City, East Kalimantan, Indonesia', '', '', '2017-12-29 06:31:28', '2017-12-29 06:31:28'),
(29, 1, 0, 0, 'bry', '', '', 'jl panjang', '', '', '2018-03-24 17:51:37', '0000-00-00 00:00:00'),
(32, 38, 2, 0, 'raja', '', 'laki-laki', 'jl coba-coba', '', '', '2018-05-22 08:33:52', '2018-05-22 08:33:52'),
(35, 47, 1, 0, 'suryanto', 'storage/app/photo_customer/DmtcBbR8TAWHNSvwpia7GJIWZtPPc9EvCRhiD6ji.png', 'pria', 'jl pelanggan setia', '-6.108829', '106.173477', '2018-06-05 06:14:40', '2018-07-02 03:54:12'),
(37, 59, 7, 0, 'Tes cust', NULL, 'Pria', 'Baywalk mall', '-6.107799', '106.77909279999994', '2018-07-01 11:47:42', '2018-07-01 11:47:42'),
(38, 60, 1, 0, 'JORDY JONATAN', 'storage/app/photo_customer/e4kKpDfZi3Gwocxu7UxdFK9wVJnFkErGvJErgO7M.jpeg', 'Pria', 'Apartment Baywalk', '-6.107799', '106.77909279999994', '2018-07-01 11:52:16', '2018-07-17 00:15:00'),
(39, 61, 1, 0, 'Soni', 'storage/app/photo_customer/xvvqTzummt0ycQMTxAAN3JWBexw5WdgOVfXvGy6H.jpeg', 'Pria', 'Jl pluit raya', '-6.116298333333333', '106.76221333333334', '2018-07-01 11:55:42', '2018-07-01 11:56:40'),
(40, 62, 14, 0, 'Grosiran', 'storage/app/photo_customer/DjMlqzmAhCCILUGqqtzN933SJjT37Ouixkn4Y7fQ.jpeg', 'Pria', 'Gading serpong', '-6.2416645', '106.640847', '2018-07-01 21:20:47', '2018-07-01 21:21:50'),
(41, 63, 14, 0, 'Nandar', NULL, 'Pria', 'Serang', '-6.2431123', '106.6298351', '2018-07-01 23:55:47', '2018-07-16 00:03:28'),
(42, 65, 14, 0, 'Budiarto', NULL, 'Pria', 'GLC europe 2 no 1', '-6.2431175', '106.6298388', '2018-07-02 00:01:23', '2018-07-02 00:01:23'),
(43, 66, 1, 0, 'Addin', 'storage/app/photo_customer/jxunbwqhHBEe1wmBmb7WCPSFwLHl0Jpg0dwhXbR4.jpeg', 'Pria', 'Jalan masjid mujahidin ruko redio serpong', '-6.2430648', '106.6297901', '2018-07-02 00:04:12', '2018-07-02 00:04:59'),
(44, 67, 14, 0, 'Fadzri', NULL, 'Pria', 'Serang', '-6.2408283', '106.6480133', '2018-07-02 00:07:18', '2018-07-02 00:07:18'),
(45, 68, 14, 0, 'Muhamad Nizar', NULL, 'Pria', 'ruko rodeo C21', '-6.2431165', '106.6297901', '2018-07-02 00:30:52', '2018-07-02 00:30:52'),
(46, 69, 14, 0, 'Erben', 'storage/app/photo_customer/Eezz1bIpQB3tlhvSTu6YsIvzWFvLNyRWrhlEUZbQ.jpeg', 'Pria', 'Serpong', '-6.2410648', '106.6744288', '2018-07-02 15:01:37', '2018-08-02 07:51:42'),
(47, 71, 1, 0, 'Poltak', NULL, 'Pria', 'North land', '-6.240758', '106.648081', '2018-07-10 03:08:08', '2018-07-10 03:08:08'),
(48, 72, 1, 0, 'Richard', 'storage/app/photo_customer/AR3P21pWnhdlKRwnEIFuSueFZMKlEtsikkOm1mEJ.jpeg', 'Pria', 'Gading serpong', '-6.2407574', '106.6480811', '2018-07-11 23:56:09', '2018-07-29 22:13:04'),
(49, 73, 1, 0, 'Joses Dixon', NULL, 'Pria', 'Gading Serpong', '-6.24086', '106.64896980000003', '2018-07-12 05:19:04', '2018-07-12 05:19:04'),
(50, 74, 1, 0, 'Mufti Makaarim', NULL, 'Pria', 'Batuputih Cibubur Kav 15 Depok', '-6.240701708017141', '106.64812359037496', '2018-07-16 21:17:02', '2018-07-16 21:17:02'),
(51, 76, 14, 0, 'Chris Lee', NULL, 'Pria', 'Jalan lengkong Raya perumahan residence 1', '-6.2767304', '106.66489679999995', '2018-07-17 01:42:50', '2018-07-17 01:42:50'),
(52, 77, 1, 0, 'Bayu setiawan', NULL, 'Pria', 'Kebayoran residence cluster symphony blok d6', '-6.2407985', '106.6480379', '2018-07-17 02:02:43', '2018-07-17 02:02:43'),
(53, 82, 1, 0, 'Suhaeni', NULL, 'Wanita', 'BSD', '-6.24086', '106.64896980000003', '2018-07-25 01:10:38', '2018-07-25 01:10:38'),
(54, 83, 14, 0, 'Budiarto Lim', NULL, 'Pria', 'Serpong', '-6.2407616', '106.6480784', '2018-07-25 02:46:16', '2018-07-25 02:46:16'),
(55, 85, 20, 0, 'muhamad nizar', NULL, 'Pria', 'jl. tb suep', '-6.1089605', '106.1716172', '2018-07-27 01:47:29', '2018-07-27 01:47:29'),
(56, 90, 20, 0, 'H.Muhyidin Arif', NULL, 'Pria', 'Jl. Ayip usman, Bumi Agung Permai 1 Blok A7/18 Serang', '-6.1018213', '106.1664597', '2018-07-28 16:05:13', '2018-07-28 16:05:13'),
(57, 91, 20, 0, 'H.Muhyidin Arif', NULL, 'Pria', 'Jl. Ayip Usman, BAP1 Blok A7/18 Unyur Serang', '-6.1036353', '106.16755', '2018-07-28 16:11:55', '2018-07-28 16:11:55'),
(58, 114, 37, 0, 'Imam ghojali', 'storage/app/photo_customer/wayb2C0IgNnaO24hbT2hE41KvaTy0sLnYkzf0WwS.jpeg', 'Pria', 'Lontar baru', '-6.1089664', '106.171635', '2018-07-28 21:48:18', '2018-07-28 21:51:45'),
(59, 119, 38, 0, 'Ahmad fikri', NULL, 'Pria', 'Ciceri permai', '-6.1089664', '106.171635', '2018-07-28 22:22:15', '2018-07-28 22:22:15'),
(60, 120, 34, 0, 'Vinka', NULL, 'Wanita', 'Muncung', '-6.1089664', '106.171635', '2018-07-28 22:24:20', '2018-07-28 22:24:20'),
(61, 121, 35, 0, 'Rani fitriani', NULL, 'Wanita', 'kp.gedeg kel.kuranji rt/rw 03/03 kec.taktakan kota serang', '-6.1089749', '106.1716241', '2018-07-28 22:25:27', '2018-07-28 22:25:27'),
(62, 122, 1, 0, 'Ricad', NULL, 'Pria', 'Minigrosir', '-6.1089664', '106.171635', '2018-07-28 22:27:10', '2018-07-28 22:27:10'),
(63, 124, 32, 0, 'Dyah Putri Ayu Dinastyar', NULL, 'Wanita', 'Jl. Jayadiningrat 1,Kramatwatu Serang', '-6.1089664', '106.171635', '2018-07-28 22:37:18', '2018-07-28 22:37:18'),
(64, 126, 49, 0, NULL, NULL, 'Pria', NULL, '-6.1089664', '106.171635', '2018-07-28 22:55:31', '2018-07-30 03:24:08'),
(65, 132, 14, 0, 'Muhyidin Arif', NULL, 'Pria', 'Bumi Agung Permai Blok A7/17 Rt. 007/011 Kel. Unyur Kec. Serang Kota Serang', '-6.102131911547194', '106.16619243985201', '2018-07-30 01:19:43', '2018-07-30 01:19:43'),
(66, 135, 34, 0, 'Saiful amin', NULL, 'Pria', 'Sumu pecung', '-6.1204066', '106.1660494', '2018-07-30 05:55:23', '2018-07-30 05:55:23'),
(67, 137, 34, 0, 'Fajar moy', NULL, 'Pria', 'Sumur pecung', '-6.1204066', '106.1660494', '2018-07-30 06:16:02', '2018-07-30 06:16:02'),
(68, 138, 40, 0, 'Wiwin mardianah', NULL, 'Wanita', 'Jl. Empat lima kp pancur melati RT/01 RW/05 Ds pancur kec.taktakan kota serang Banten', '-6.1121235', '106.1541845', '2018-07-30 17:26:21', '2018-07-30 17:26:21'),
(69, 140, 34, 0, 'Hj. Supiyati', NULL, 'Wanita', 'Jagarayu', '-6.1378279', '106.1391646', '2018-07-31 00:46:18', '2018-07-31 00:46:18'),
(70, 141, 34, 0, 'ratu devi', NULL, 'Wanita', 'benggala', '-6.121574', '106.15491070000007', '2018-07-31 01:04:29', '2018-07-31 01:04:29'),
(71, 142, 34, 0, 'Kuswara', NULL, 'Pria', 'Jagarayu', '-6.139096', '106.1395321', '2018-07-31 01:25:17', '2018-07-31 01:25:17'),
(72, 144, 54, 0, 'Riana', NULL, 'Wanita', 'Kp. Cibebek', '-6.1213105', '106.1738462', '2018-07-31 22:49:15', '2018-07-31 22:49:15'),
(73, 145, 46, 0, 'Nabella indah p', NULL, 'Wanita', 'taman mutiara indah blok c8 no 21', '-6.0990759', '106.1743242', '2018-08-01 00:42:00', '2018-08-01 00:42:00'),
(74, 146, 46, 0, 'nabella indah p', NULL, 'Wanita', 'taman mutiara indah blok c8 no 21', '-6.0990759', '106.1743242', '2018-08-01 01:27:05', '2018-08-01 01:27:05'),
(75, 147, 34, 0, 'Hevi farida iriani', NULL, 'Wanita', 'Cipocok', '-6.1236315', '106.1669537', '2018-08-01 01:36:32', '2018-08-01 01:36:32'),
(76, 148, 34, 0, 'Miftahul Rahman', NULL, 'Pria', 'Sumur Pecung', '-6.1226122', '106.1659966', '2018-08-01 05:33:24', '2018-08-01 05:33:24'),
(77, 149, 30, 0, 'Dedi Maulana', NULL, 'Pria', 'Ciloang, Serang', '-6.1248082', '106.1777597', '2018-08-01 06:38:27', '2018-08-01 06:38:27'),
(78, 150, 34, 0, 'Ridwan', NULL, 'Pria', 'Sumur pecung', '-6.1219954', '106.1652614', '2018-08-01 09:57:36', '2018-08-01 09:57:36'),
(79, 154, 34, 0, 'Desi santika', NULL, 'Wanita', 'Gelam', '-6.1229176', '106.15566569999999', '2018-08-01 20:57:27', '2018-08-01 20:57:27'),
(80, 156, 34, 0, 'Bude juju', NULL, 'Wanita', 'Sumurpecung', '-6.1198815', '106.166795', '2018-08-02 00:16:42', '2018-08-02 00:16:42'),
(81, 157, 58, 0, 'Supri', NULL, 'Pria', 'Cikupa', '-6.2164568', '106.5011289', '2018-08-02 01:32:36', '2018-08-02 01:32:36'),
(82, 158, 58, 0, 'Jhonny Satria', NULL, 'Pria', 'Jl. Cikupamas III No 5 Cikupamas Tangerang', '-6.2164559', '106.5011313', '2018-08-02 01:36:07', '2018-08-02 01:36:07'),
(83, 159, 34, 0, 'Ratna N L S', NULL, 'Wanita', 'sumur pecung', '-6.1198989', '106.1677156', '2018-08-02 03:48:39', '2018-08-02 03:48:39'),
(84, 160, 49, 0, 'Irna corina', NULL, 'Wanita', 'Kebaharan dukuh', '-6.0925831', '106.1549693', '2018-08-02 04:48:32', '2018-08-02 04:48:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
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
-- Dumping data untuk tabel `diskon`
--

INSERT INTO `diskon` (`id`, `name`, `type`, `rate`, `restriction`, `created_at`, `updated_at`) VALUES
(1, 'diskon bulan mei', 'percent', 10, 0, '2018-04-18 02:48:30', '2018-04-18 02:48:30'),
(2, 'diskon bulan juni', 'amount', 100000, 0, '2018-04-18 02:48:45', '2018-04-18 02:48:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `district`
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
-- Struktur dari tabel `family`
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
-- Dumping data untuk tabel `family`
--

INSERT INTO `family` (`id`, `parent_id`, `child_id`, `relation`, `created_at`, `updated_at`) VALUES
(4, 1, 11, 'Istri', '2018-06-26 00:55:18', '2018-06-26 00:55:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fcm`
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
-- Dumping data untuk tabel `fcm`
--

INSERT INTO `fcm` (`id`, `user_id`, `role_id`, `fcm_token`, `device_platform`, `uuid`, `created_at`, `updated_at`) VALUES
(40, 60, 2, 'fKqPnABUKUg:APA91bG2SnC_x1N4PHPFpBCOu86qgFKlvA7FugTe-TFG4zqXEBSzhBikmcpsG9CNak0Qsxz_bb8faqqucyhMQtLEJjx3kKx35vFvF64CbK5SXYKPm7glSvS93C2g1iZMeijStEBWeMEdkS49DqNdXr6F9Ur9AqROOg', 'Android', '2b84f2463c05f2c2', '2018-07-16 23:47:50', '2018-07-16 23:47:50'),
(42, 60, 2, 'eOwz9PUsqy8:APA91bEpcjcs8QSLFF4Q_GclUgI1L8kvUkK2f6TZbcF5XjsW1Pto3PEl3BYZEO_9B_WO0aMcRf_Xb9dW1dcpYdERLnGpaM_mYav-R8Jx57g0ubbLdhaUPWM8pikR_cwfkztjsFc0nj3IrAfDBV6UgjWWWkvQmQY7VQ', 'iOS', 'A7601619-6B68-42B1-B16D-1E8881996AB4', '2018-07-17 00:13:40', '2018-07-17 00:13:40'),
(43, 74, 2, 'e37H23XhJTA:APA91bFIG_sqN2QBMOdV-Vi5N2EzBXnQGtRjUtinPVs1GM2X1A2pVTE7y1l9S-zvFE0XJl8UvZvJQ5rA6xbbtEAuctFI1x63WX-7q8aAu8s_oqzBBVpydx3pm2sGXn7tlHXD6DYdSv5vgf7ZgjUcoTnYJ3X6zfGqhQ', 'iOS', '0D7585C1-9095-4983-A2B6-CA340995BF36', '2018-07-17 00:16:56', '2018-07-17 00:16:56'),
(45, 76, 2, 'ejDnvXYOK9o:APA91bEwpUwUDqyRk5us_vd45jD3lJ2--k18s08xqK5SygZYy8YXPmrZcvKGwaWVESiWsXB0HF_yHBSvzr90PJZS1dgXWvf8HssEiZD0qZuhTrj0p5Q8YfRUwI234PmOmpnFjpaGZV8LOww3BGjtiCKkm7BoZe5L8g', 'Android', 'f6361779972ee534', '2018-07-17 01:43:06', '2018-07-17 01:43:06'),
(46, 69, 2, 'fFstMfvJFew:APA91bGosDk0jKeDtOaTWOWBI9zOgB6p7goGYG74bpOholB5aBA5YTiPxAYyJEFK-y0cj5f0IqZTb2vRmth24dRmCl0UbBMHlslrJaM-4nyRsOyb0ba6KGwZX1HHC8V3jIJ3HCgB9HYawD72caBZuXCK4zHkQe3i7A', 'Android', 'cf1599d65c10c41b', '2018-07-17 03:09:56', '2018-07-17 03:09:56'),
(48, 72, 2, 'dFRkF_cliO0:APA91bEdWbump1MuyzDPB7WgDlNJ6PVUIrWMHLC0ogiygfAMg6lOHkzzg509NwqGOjzIYg3QyIhHcW41zAjAl4sryNQtsROc_WCtWNR9aWTqBcD5IOwm6f0v7klHqrhxHruZnGTUzZEJSy0W3oM00faCGnsPt7a5vg', 'Android', '3d18f5df9df9d862', '2018-07-18 05:13:03', '2018-07-18 05:13:03'),
(49, NULL, 2, 'c0cE4useZTY:APA91bGUDmI7x6fi3bx4K70ODoZAN4gESFKVdcUCx-DrugVG0pCffXalIpoykTM0Q_aMKWQ1vy4bzjwFtd6KAOIIN5sVT-JS5gPmrRWAtTb_mrt47qJQIqMD2XI54e09YEfv5QK6WlRNkpjvgFmUDMnIjgFcvTkPCg', 'Android', '8c74342f80b0da7d', '2018-07-18 23:34:59', '2018-07-18 23:34:59'),
(50, 47, 2, 'cppYgGTsy_4:APA91bH_GnbWZKmT6UtNgfk5BSpY8jhlmA2kJOEgGkqg7zOYxmred04NQ-bWUtZEdS6Q9PubKUSLkz2SJA5DRzv8GCaoZw44Y47Flqnl_2u94wItaUqRt4gC08enwznRABH2c8dBtR1effqHe0fb24RP14hSAUftkA', 'Android', 'e9f514591774e2e', '2018-07-19 00:03:19', '2018-07-19 00:03:19'),
(51, 1, 5, 'd7OFQttB7Cc:APA91bHtJdfo13wyXLlPYPLRk6N5FR1sESrZh-PUM52KdnTCTHGYikRlw55p5yjs2yTQv9JCCoB2ieM3SQRvPFhvEKXJiQJlB0eIonEMLW6fFTbLzs0FUpamTQIHa34stXgJxgHHDOedZX6RbjhVcZLrTvHDz5WgCQ', 'Android', 'e9f514591774e2e', '2018-07-19 00:04:46', '2018-07-19 00:04:46'),
(52, 47, 2, 'f2C3lOnOtk4:APA91bFvcFN95bLOJzHrfCTnnWl36Unni49hVDH3Ce0eZgIKJYiaowzdU0YHWDLMXzJNi_gbr037UUI9QJ0IaxS3iY7oT4SaPOpfRb9ePHsNZFmywGYV5zO35eWgIaicD6Bg8Dv3DSxrKf6SkXVt_la69PwIUFpP-A', 'Android', '18dfb1919530cb99', '2018-07-20 00:42:28', '2018-07-20 00:42:28'),
(53, 1, 5, 'fiaU5BniS_g:APA91bGeMiWED7Z9bPviBts2cAchyhog77un6dTvyGkC_KM0r_UuHN-nyNpw4AwXXnyduNWnzCodZFod6ovrV_EPR6DqAAm5kXy6frkJtgoAWxCwJ57vmcmOU-eqVApQGwWpIIS_7gy02qBSWduoljIU--V5ABdSIQ', 'Android', 'd77af0e7424c45e1', '2018-07-20 00:58:10', '2018-07-20 00:58:10'),
(54, 64, 5, 'fU4KTOU5Ce8:APA91bFAmgHDpkQ6sZWmM0pguMwEuBPsHJCpireXmNNqDSGSb0mbu54ZqReJc9bk3qfZh3YmCXJoocV_o52wSiRdrUW8qpyZqvxOm30s4t4aFqtllccUSIAJlVU1iOZswHHkbRNJQ-mzk6Q20zh2cKrx9QE8MB7Jtg', 'Android', '7482f2d34ccdaae5', '2018-07-22 08:38:24', '2018-07-22 08:38:24'),
(55, 1, 5, 'c48OPmwysXY:APA91bEwyZqXA2q1TZxcs1kjEEYsgn4BNjTJXzwRGftRkA83Q-Z9IozE7WdgHDnF-yZt7gmlzVn_WsREUX7gG7ZEHNML9PD6TUlaEUgoreOwcVEyuOhaQEWlJ-ywJtI_4bW4W_AhU4OZGxlN70dH_0jgNw7r0Va4dQ', 'Android', 'a188090ab01aeff', '2018-07-25 01:08:47', '2018-07-25 01:08:47'),
(56, 82, 2, 'fWZx9CeWpVU:APA91bEX_dGMj6ktoU1bFfti2TbzYH4sip4lAOSVDPBh4ViUIw7BFBUZY_U6XguZsyBhaSVpqBFXeukLhq35jULsJRSa0ygP42bIOwPg0HwN3gqNf7W3bkPUbqa8Bj-mO2e1XBrptkL-eqJYDigTCqLq25WCct1JOA', 'Android', 'a188090ab01aeff', '2018-07-25 01:11:36', '2018-07-25 01:11:36'),
(59, 82, 2, 'fDEQmGc8c2s:APA91bEm2Xa_WwwCxrp1o4aCyXr2JbqQqRSzNp3tLQBSlu_PgeAMYNOR2Dxozk493VmIFKypuN2mIcfCb4oajge9Q-LsN2O4mhcWpsvCWRsgXegDClRHZi5iSnQJYL7h661mfpI4BpoWwfg2uyKl4UknqCzxD5JcVg', 'Android', 'a188090ab01aeff', '2018-07-25 02:45:02', '2018-07-25 02:45:02'),
(60, 83, 2, 'dBA-JU1j5Lg:APA91bH-YCVB2WXHHHrSwrT6MlLrE9aFhoTqh8HXUpab8Xgm4hUOmtxEBkZHoS0S4nOU9Uxpjl-B1OY9zX6yH3UCTI-iOJ5m9hjLE26ejtzwLUjVumMDPKw2pYz9Pv4bkDl-JkEEG2y86ZWjiy6YmxOt59ohBiqsTw', 'Android', '10ed3e75a7b4f782', '2018-07-25 02:46:31', '2018-07-25 02:46:31'),
(62, 1, 5, 'dv1pW2C74PA:APA91bH3SueAHJ5lPvPtHZg-OI2aVNX1lcXcXPM2SbOvXF6HRZrAeEsVJze1m9B0Yu_v1bBFKHX4oSTCeN7wqdVgWgZZ-BF3xn0NfJ97BJ8q53olzyF3OWJUYrmSrT-hi7A3KQzmpanw5wBS1_Qllf2uMItRVdo59w', 'Android', '2b84f2463c05f2c2', '2018-07-26 02:19:31', '2018-07-26 02:19:31'),
(63, 84, 5, 'cLPwiywoyes:APA91bFkcen7sfmohauxeS39_b3vTtx_yZn2Em3n65fhy8sPruNU_rIftHCU1ycnXuEeFKKwIsHYK17_vbgY2M672GH0in8Ogwy89-c8-YDB4jEXK-Iyw467i4zAJNiihz68STaGjpEIjx_SUqU620iOQ3PqzgrVEw', 'Android', '30a4bd533aee5979', '2018-07-27 01:42:01', '2018-07-27 01:42:01'),
(64, 85, 2, 'fe4MWpTSm04:APA91bG28rvKXjTsYEg2JS5SwgF1YL2K5CNcx3ZZGe0vDwIPVPelEHaTu0Zo5a-dljl5dY4-BmM69Mi2bdLJBeog-Cy-7LwtXmwM6FeJU8FMSn4_fhXzP2NCTKzEnNGOK3W6FvJImNtpgx1t05D85dNeiRgR8tbirg', 'Android', '9843bbb36040cfe6', '2018-07-27 01:47:41', '2018-07-27 01:47:41'),
(67, 60, 2, 'cv5rsSkNN08:APA91bEuoLpkCk0DEf3CuLUhqeczYAH1IReW3jOsmREYaD4sQdwtrB7Snxc98i1EPocJYDv_I3BwA01vHKvEyblATUXhrYh2ywAEeqtDmiJDvyu6r_wnyyTpG0e5kMqK0x28fyNtDnyk0ErBu8Tp72YHplUZAyxrPQ', 'Android', 'aa24d4751e30c5b6', '2018-07-28 09:32:14', '2018-07-28 09:32:14'),
(69, 72, 2, 'fd8KcgI_p1U:APA91bEaBNDt7ksdfClO2zpsphOFLo7zNa1kx2skW3aRfrBH3Mnm2D7z-wMBbwG7LoCm1R4cgdQ-qKhcwem8xdYd-ooYa8QABhz0VUMFKa28fjHFmXALc9WAsI4cnyXVeYAdnKdm9oJzJ6-yX27S8B08DlFBfItwGQ', 'Android', '3d18f5df9df9d862', '2018-07-28 15:54:18', '2018-07-28 15:54:18'),
(70, 102, 5, 'f-cWT1v4noE:APA91bFfslGgiHvT3dHB8LbFaRM6QoPCTYPcni4ojbyVX6R2H1BNMQIBlOU5o9lJKI-IWDYeTS2AhEQ44sgbVYoC-gqiTcvgghE4d4fMQ-iTnQ4_MajZZMDjWOrEBqss45YRSaFmfLiXDZzfBwh2StO5Id3WLiiu0w', 'Android', '9bc421c5e39185c2', '2018-07-28 21:30:48', '2018-07-28 21:30:48'),
(71, 100, 5, 'feq92axv7es:APA91bEDbg7w0etGd2MQ4dNolBGwFrIVVs3mLpv-odvRy07_v1wesCRfbn-_EOoHCWL5nHc42Qid0bYZlhaSwZ091MdDVNBtHLR6QECuxOlUpvZdDnqHAOyCyjhXkLui3t7zVGgchhV2bavrvZiUQ-8cCVzTKMrnIw', 'Android', 'cb4fe46ffede3707', '2018-07-28 21:30:53', '2018-07-28 21:30:53'),
(72, 103, 5, 'cQNXQy9Xn7k:APA91bHK7Na62AwLEY556LfzT8BpA7HlTdCePFxaRjfFV9N9j5GLn7rlf_lHf7GTI0PwioelwNHp2kEjUIk20dr8zOraup79-p6z6DIrf1GoLOrKfURBWZtDsSYBxfPHqeBWdVDNwYCAGIeFO4FhbJcFL5w8uSu6lA', 'Android', '2e8e4b9c94a3a5d8', '2018-07-28 21:31:14', '2018-07-28 21:31:14'),
(75, 105, 5, 'ec7OJV-AWAM:APA91bHhx1awtx1P1x0Wx30g8ApQ9cX4uJn97e_D2k6laj8Dqdwl4wFUQALw1KwNbe9zaCigvT9ZJlMN1AlMVb5CvSS7YtGYivFhMkIYMa27SYG1N-DH8Ou1bdhQOoMIZSorpuKz4Hs2ojuBCfSXaTL3bqMK9FSF5A', 'Android', 'ee573f88773371c0', '2018-07-28 21:35:48', '2018-07-28 21:35:48'),
(76, 97, 5, 'cz2tRNUrtsk:APA91bGuQKgpisMUfGA9RkJMIm4hKmc_fx-t2PyZW1jnJbS5-cQlolF-dA5NOPCGmtFPnC3h1XqrEi3FW-FiOG_jwaid2DqgvbIyTVei2ixDKN7XV18iLSTK3cu2kQuBdOexQmwt32-h6dkMTm6PlA8nAedXhwFwrg', 'Android', 'ead93862f864b5d', '2018-07-28 21:36:30', '2018-07-28 21:36:30'),
(77, 99, 5, 'cFAMvGyGQKE:APA91bF-nwaFp3xyLUIF4G7oM-9BFVvGVmTpW5cjas_rtg6qB_zW_W-I9fTjpBvZlprnDg36iq-UCnA2zqBmTJdZL0okTm9B_px07IUoI-ZkuRblkxvda-temDsf7LL3a33HB4BS888EoBfDZmruG-OGQt8fRwq-ew', 'Android', 'cbd10bfe01b633dc', '2018-07-28 21:37:54', '2018-07-28 21:37:54'),
(78, 96, 5, 'dIT8sdFbb2Y:APA91bEMeZlwNoJ2iG8jXagkMSJaCzA4-2WHhLrvTIJn2ygRW-x_LDG1S-nNRtM-468FwQCy1LXvMuPVxvthkwZ0hBa1KUCg0YEjgsSDS66e_HKgJlP-A1_DEONRjLwV4S-mqBp-QekhdlRwY0FUDIpW4IBxuA9b1g', 'Android', 'e9ef9f671f312089', '2018-07-28 21:40:53', '2018-07-28 21:40:53'),
(79, 114, 2, 'dMpDUwxov9E:APA91bFPI_pB2eNhhJVvxHhwVWd7Ji9e6wDt-JO-aAp85Df1f-rZ0wjwPOPh64iXOz_bRwpoT1maYitglJ4VOcH9McduEtxMKXLQDawunBxfyPiYWBClq67zXUMUDojBJFgsfhimCxOJ5b7hN8zsqcdAwG3vJdLDsw', 'Android', 'ee573f88773371c0', '2018-07-28 21:48:56', '2018-07-28 21:48:56'),
(80, 64, 5, 'dIF-ZSgqV3U:APA91bF-p8YSl4NYzmmCO0WmHD1gSKWfWTe6T_rxPoANoGRq4swxlknd0iw3MjX5CkUXs9SMcYo6bVPtciM_zEzKXYWlg6zGOWgvYatT0gZuxUODQYsVFXG1NCvMjnDk7bAOBrK9bQxrNK2x24_vpeAU3t8qYPbRLg', 'Android', '118f46ab560c9787', '2018-07-28 21:51:43', '2018-07-28 21:51:43'),
(81, 83, 2, 'dV09hncqtBE:APA91bEZiqg-5Zy7GzWjQKuzE2ra7Idq98244Mib87po7fmuyPxVgfE3ooz2NytYuTc0JqLp3koQ23N533X7RxDVxoswavxVvTAnXv1zWGY8PIzQ7uxF7NVoULvONTqZrCKSauGO8UZIzzmc36MUEtN6eVIcE5JhHg', 'Android', '118f46ab560c9787', '2018-07-28 21:52:09', '2018-07-28 21:52:09'),
(83, 98, 5, 'eAGFKxuyFsw:APA91bFGEIqMrpEWHdgwiypugtacMTlSFIuMAxffhkYJHzW-ACSqbTM5xopAsrMYLeBKfvITauDMOnzq-30wSz2PEyrkUBhW3vex29L3yreGwZL3wFrCGcgI8WbY97ZZ6yApiJeFRRlf8KchN42quhjkn3g2OJavhQ', 'Android', '621fdc0c0316a3e3', '2018-07-28 22:11:37', '2018-07-28 22:11:37'),
(84, 115, 5, 'cJVQoovUYMg:APA91bHi8AIbQiQks0M7kFQ2UctgDpqQU7U_mr8NZB6gRlQH1Gpciw3rdXyVGQT2SZl9BkHVU5VwUTHPicTdKXDh_JKK9s8mzVfKZOD88f9nSQ7k5wmbly8Kq0nwfo2BsE_RESYEhYwEgucdrA8hcTjq10fd2XIeXA', 'Android', 'e0d0ba60e5822da1', '2018-07-28 22:13:55', '2018-07-28 22:13:55'),
(86, 101, 5, 'duKp3mAFLs8:APA91bFPxe2FpQdYUZwxsKwL8wdmVLbfVfCTiZYMDG6ayPnGDhqdOSBVveuuGlweJAXSLwq-CAX5lqJfcsL0lleK_9o3OCrHVIHih6cKmUPu9acZU-HvGDKiJkzQ3wQKPuhZit1q8cg33yMM7R-HiR55NAnQadktTA', 'Android', 'eda1ac8507b9b67b', '2018-07-28 22:16:44', '2018-07-28 22:16:44'),
(87, 108, 5, 'd1i34cE1TIg:APA91bG3w6TOOz7GT3K_n_7XBSVn6BbFCswU9sw1tApcnQJUpu92RH3gn6h4K-t7b_dGGdqC-RZ_jWRixDJh97kJjrHRhH04EDChPHsRgClO7SbI3oq2oCnDowbWfpNRXb2fSIERRWYcGli9bX4hCEEZ9OxSC0Qx7w', 'Android', '4d65160e89b64182', '2018-07-28 22:17:14', '2018-07-28 22:17:14'),
(88, 120, 2, 'fmxz030oxww:APA91bFtYsJe9ATSKZ8jwjHD7hrWp9y-0oDvwB68_rLwvEi4xVm6QdYpQFzBSvT5nbZKkohTUw3miTlRHDbQKOyI4fzP6a-U_ra_v_rNzLa02KrXaD60ea13HjeuijMFepjZItUrKQ4kAT5aTs2hLUwd0ShDkt5eoQ', 'Android', '9bc421c5e39185c2', '2018-07-28 22:24:46', '2018-07-28 22:24:46'),
(89, 124, 2, 'eJ0XmM3YX6M:APA91bFVQ8sMzBpsIFI9CbvIqE3i0GLIbwN44aC2AyBeOKRfiHN0ixUqniPDqPRBDETXXIRO5kmOL4hGV_nE6DVL1Et163yeKzIcEcIzs8jvh5NxT9Br9XiiHk0p1vC_Yo89kPdoWz0XTgUJjU47_LHUVqKkPYbGSA', 'Android', 'cb4fe46ffede3707', '2018-07-28 22:37:44', '2018-07-28 22:37:44'),
(91, 125, 5, 'eiOMtnkzrb4:APA91bEWLLsYjQTWBrzuKolCKx31knXrdhBoobhjQrfvHIQ6Dx691sU82OwTYyDXN-p0OG9q_xmwq11oq-bqgosUQjfN0faF9FLvC6tRdguhXCLrUN3gb-WR2vWNvGDcTJ3CfwgkSuEhOUoyubQUH3jV2ZpNVwb7QA', 'Android', '3b855c72c898d072', '2018-07-28 22:51:49', '2018-07-28 22:51:49'),
(92, 126, 2, 'czwLE09FElw:APA91bHwjPstKGM1rAnUPrM78362uVy0VdQZEzy6Wj3zoMpYBroFkeBmO3Ao-P_LLFVJm2WU0gcbo0bAF6QPM2_JP2YkF4HHNACFv1D4dLxgoe81OPU_NKdlCIhu4vIiHxngc-JnprpmyZYwRN-Fj-tyR9Rh15rBAg', 'Android', '3b855c72c898d072', '2018-07-28 22:56:11', '2018-07-28 22:56:11'),
(96, 73, 2, 'c9PbENZe1-4:APA91bHib57CifuVAHTW-fFCrTujpkt-qW3JP6pZQqJRAqo3xpOOQZL_hJgb0IM7Vk0Jw3f8uquvdZcWX98NAQITjuneW6xLFxC04iIq4GENqEBvL5rxULd1Lp29jHVomRQyNCliDTztSKVlh_dNPfopAqmJ_9DQxg', 'Android', '951ac083817b2a3b', '2018-07-29 02:08:49', '2018-07-29 02:08:49'),
(100, 72, 2, 'c7ol1I3JO8I:APA91bEqG89yTDsIffSLxv_AsS-xXaHW8pmzbb3dfj2E2UXk7NnBG6BBrBM8X_CvO7vtywU993pAhQ5jVclRoTcd30RKcJ4T3hea1z7kKdYrgN1QdPa02L1rNh6X7IeLiRb4DKPGI7C2vSdfA9mwS0Rw2kzhqu7Lgw', 'Android', '3d18f5df9df9d862', '2018-07-29 22:10:55', '2018-07-29 22:10:55'),
(102, 130, 5, 'eqsdrLWitq0:APA91bF7WzUNf78yhwWnLPTuYi778Rt-rZ3GLZ4EKDkLMhJd5ZCcVJHjfHe84KmzjE-Yx4nhy1rDIOlzS_tlDNWxAlxm9YKXIIg6KIPFrYxAAYR2IK-XFRO8b08umhFRmO-nU7pOac7qblFWrAcOFXeZzMTlfZkl3g', 'Android', '39d61908c9ccfb43', '2018-07-29 23:29:06', '2018-07-29 23:29:06'),
(105, 131, 5, 'dkmvmg6vGyU:APA91bG22_NXKuzpUarUKUqS_Zo2b-21fNVOz4nFUZA24mT49Ps8iSyx7I3y5z2s2YHvkkSO-ehXnsc9HvoSIAr2g3vwASnA62JOsEBx_v2eChu6d3MfBlEYmG3RTIwuv7QtEnclrDLiwvJOXzFtbGZE2yeGK1dYfA', 'Android', 'b9b4930d0b354c02', '2018-07-30 01:15:13', '2018-07-30 01:15:13'),
(106, 131, 5, 'eJyJCJWoi80:APA91bGud1do4hVuYdy2X8xuSGWR1untEhp4CSyKYTsX-8A346vY6aBnnB2ytkEXi2Yi8A_MxC4FavitaIvEZjKLMu6TfmXh-EmElmXgvxLMjXVS_dfj--ptUfhneWzJ0COjY3LhwL1RXfJkEZMevGw-EG7ANjLrcQ', 'Android', '236cd1a92eec9808', '2018-07-30 01:17:12', '2018-07-30 01:17:12'),
(108, 125, 5, 'dMckXG57luk:APA91bGtiA6paNp2rgRtaEuPwT7h983LvyNbzmR-KatPSVoDTS0vBZwjUZM4_WK9rdUgTZ1RENr4QFugVHK1EGZkM50DQB5TD3g9RzmvEwSdsGqFCcKcDFc0hXP1y-lAr6cS_hJ9Zo-hR1kJz8zQv3ygrSbs-DDqhw', 'Android', '53c2567d5a9a342d', '2018-07-30 03:08:06', '2018-07-30 03:08:06'),
(109, 124, 2, 'c0SFX0fdT3k:APA91bFpf9fvCtpo0sZ3dtl3Q4zK3ZFEcHNsGVOPCWMUZk8yKymT0JsrA4F7O_9aclEZs08ifF1xvgb1T0C9QIbXb6m3jZu1qi5JeZqdrb6kHzAYJh30EDM80SDLuN-6J5dHBg3bImL7uFtvlv-Ua2YhFbnKhAlEbg', 'Android', 'dcd9b7c04f5a2d89', '2018-07-30 03:09:33', '2018-07-30 03:09:33'),
(110, 135, 2, 'c50fvQay88Q:APA91bFS-I8opsB5t185CaJ73HEtt8ik9xBwREuwaEARXa_rCHZtvohi1B-eNGgKSMJOE5vuvGYaUI4tPxDvhcFWI-RE-49NQaZ82PxeCWKCABXyz545PMOF_WKmVFqeSlvrnk4LXCy7LAVk9MfW4x0Nuwl9fUZChw', 'Android', 'da33b29abb5de3d5', '2018-07-30 05:55:58', '2018-07-30 05:55:58'),
(111, 137, 2, 'dfkXnOHHSnA:APA91bHpK9dKI6oGMMYOmU-9g7XaEbkCjHCaF6P0TTHPod0eu39MUOSZjvyq92T3uX9rK-rqXnaU7gN-8ckF77cVZQPlcRDOTZVws9y1kRgCrT-63yT4-JEv2Tg55O97ZyYNStTCe-YjADMR7wmDjbOP-y9SCbKHaQ', 'Android', '6eb1f8dcc1afa63c', '2018-07-30 06:16:29', '2018-07-30 06:16:29'),
(112, 138, 2, 'fRozKobFvs8:APA91bGrq2IJU_Zo59O1DjfMQbenryC0IXKWEkpNhzcBEQ81lARrm9tTwK7kb1d9G2fPgmL--mKqbYZwL8RcnUtyOC8u23eciblDJ35Hb4gMvDMvYTEwTXrQHYzvC6xCbYCSwEt5aAanJXHSc3Spn6xECMf0nCCWog', 'Android', '8f6b638deee34749', '2018-07-30 17:26:55', '2018-07-30 17:26:55'),
(113, 72, 2, 'cMiO4Am8ATw:APA91bEaK1wCHSgKyXDT6X06T6WJyyo7_yzTcwzsnTNwB5mEvpdz8S-91oyu45McxrBjNm6E6FiIc_fUPEYiz2_kGpj-fwjU-JwE4WLtHPJ9dM8W-cdgiglEDzQj31dVoiGFV28K1ofghf6rE5D-LuMJLGThFYcylg', 'Android', '8c74342f80b0da7d', '2018-07-30 20:36:02', '2018-07-30 20:36:02'),
(116, 140, 2, 'ecrdoRgPkdM:APA91bEj9fM42AYPjBiSNCs09Rj5NGzOqBV-0OlfDJmN_ccL4aVne9wFKC2mz5Qgoy9LoI2ZkIztdQjEw_ZJ2QhUzP3yVKNQWkDBJY3WlQHHXcgHj6HubucNaI_0RscFNW4F0WZ22anUz5PaUA4-lQi1ar55Hgw-Xw', 'Android', '13650d48f320b20c', '2018-07-31 00:46:40', '2018-07-31 00:46:40'),
(117, 141, 2, 'erGWuFClDyw:APA91bG9tcydyHIXNAr-fNNTt5VwPOqqTtlvmpqn3ok1CbJZ2X5vKnvKOYXQu4H6SwXyumvguqfcsMSTNJxXCUDL2EE7T8Jbw2J80doDsl1mKMGU209ObTNO2BnjzNmyBfoLdBFCi74XGuix8qSZyYs23p8RWsu8gA', 'Android', '1b223bbee8727c9a', '2018-07-31 01:05:08', '2018-07-31 01:05:08'),
(118, 142, 2, 'fpFxeid4Cvg:APA91bFFedFH-fPpKrp7EBTeJADQRCLlwQttpFyTF1lZ5bZI3ztB64sA2wyKp2q0nkCSM6owd95ujXr57-OSOgNQCgoSrFo7Yr4spJ3Cxth5ix9y9rpglSDs46WzrTfoLZwvTJJ2O-UNThx5C6WVoVU47s7XJX-rzQ', 'Android', '251cebf65ee98d09', '2018-07-31 01:25:42', '2018-07-31 01:25:42'),
(119, 60, 2, 'eeb5SSRDEqk:APA91bFbuT39mBV5aHroyZT0nGas67qJQiZPgNP-fHZDJdRxopRHIYzinrMTv909E-MQIZN_z6--ScZbbt2HWvG_aEuuYQTukfZiBBa6V1ziOTfTWP51mmrIl_DBnjYuP-cdl7o5XuPuY1MkOuQQ6CbLEylMpjD6gw', 'Android', '2b84f2463c05f2c2', '2018-07-31 21:55:48', '2018-07-31 21:55:48'),
(121, 144, 2, 'f1d9dcussJ0:APA91bFWcDQIgyGckdAwLED1rQ1SaoRA3TZhUkNcbOmDf6V3zE76fMygo8J3hh5E51GsG9egbqiC1IR6axrLG1OJOuJzr-Zh5hoFQ-SOICpXIJC7F74myj35FetP0Mr1cQyD7QuHL1fo6ESdkcA4LOk0fCQHYwFN3Q', 'Android', '87fb61b3dca8584', '2018-07-31 22:49:44', '2018-07-31 22:49:44'),
(125, 146, 2, 'ekJN37eo-Es:APA91bHxAPlKDnQDWt2QbL6Qb7VJTaPUp8HWmcd536QjBvWyyqV7gi9KORSTc4P3lRpo2oUVLudKqKpXPyaGos5PGojith4JU_lns9n2peliVLDPiGDNhego5w0P5uOrVj7fFMTkRD8dxeWoNyp37EXZHAY-ZKypbw', 'Android', 'e0d0ba60e5822da1', '2018-08-01 01:27:21', '2018-08-01 01:27:21'),
(126, 147, 2, 'drOUEfZ0LEU:APA91bEAu9VbMPaplI3oSGhFHS265s2tglr0GvsXYsHZfeTl3c7y--Gn57XyKmlHc8AoupMlDhsW8xN6JMhrDHMqJE-RIdo7rV-3Log33ao0zzZ2PErLeJKO3xBfJyzaUmdhepQjmIL3IHJk0PUQi2sYq_bW1UKLCQ', 'Android', '690acaec2655fbc', '2018-08-01 01:36:51', '2018-08-01 01:36:51'),
(127, 33, 5, 'dxEtsDAwz08:APA91bE7VHEuTXfsiVA7M2MLG0-pliNfqxpy5qdNcZzCw1Zy9VuUXdI-lAmjfp7-RNDiVPmjm4old-kfeafJOMYA6AufKcwPqgqnY3qjL5zipPMdvKeT9KEz_q3dmj6-7HoTtedhzhpUjaynK6INFupSL7M9yB6vnw', 'Android', '122dae8267c44a82', '2018-08-01 02:24:56', '2018-08-01 02:24:56'),
(129, 72, 2, 'cZVYemNGcdc:APA91bHCXiqlWvgHi3bTcr-M_LBv3PO65nF5j8kI1aPzl5EBoUqmH6M3eIu8uxZE6t166XRJzHXL0qEFXOoB0tPXOLWmE-dnXxcEZZyy92mGXBT4ob0Qb11q15yYFxeHIjv5vnlk2jxUKxouHc7uADarXCDQklwTqA', 'Android', '8c74342f80b0da7d', '2018-08-01 04:44:48', '2018-08-01 04:44:48'),
(130, 148, 2, 'eDC7-OrJzCU:APA91bGdP1M-FPA-wsITP26iQ9sLAlh2FPAXYCsZOVuSH6hl6KtmLm61K8tqBzlqMcQXgXujcNYtozZUWTQHKdcigfGcb0dEc20_n1jPGWPJdUy4vdF3LEUr1yVVDlckhCXaXuA1DKalzdbpvidhsQ_gEfcCZgr_Qg', 'Android', '44c86900ce7d0d23', '2018-08-01 05:33:39', '2018-08-01 05:33:39'),
(131, 150, 2, 'fTdw-gemnFg:APA91bEH-B9E32E-NESG77cAQFHQIi9ErA9ZgJCF0q4k1CdcXH7x3fpLYKUUHc2m1WSvvI0KD5l_PBgU6B9Z2gGIgdYwfp8bx8MA8Ml7MVxHyZK4UclDp-bRhcH4rhT8NO_HxxIDo6Vj1x896_vHGKLYD8M-Vej5Ig', 'Android', '0a95277267912e83', '2018-08-01 09:58:06', '2018-08-01 09:58:06'),
(133, 154, 2, 'cWJah9FvqV0:APA91bE4RJ95XGj8Rdc_0BGKLwBEX0oR2eiy4bu_MzFZQF270_oUx4JTvFh0iGXcy14n3C2zMFZ1Ztg1jyfvjScldyju4ewbW991ds-vDllE7Zvre-LHMIy7gV1N8vAktzUmq_w5rzch3CqjHbLelOJ_wqC36-B2HA', 'Android', 'd5c06f98399a499a', '2018-08-01 20:58:25', '2018-08-01 20:58:25'),
(135, 60, 2, 'feJ3ArZrHM4:APA91bG-Xy96BM0QeSFHmMQLgvXG4b0iND5I4NAPv3DS5kmyFvotfJIHEQar8bFh0rcwK-jjC8n4xBAbVDseouLNplDf5GewR_dMkl9q735hB_KJil1lFq71Cyaeu18MSPjCKLjoF7RGKD4qnK1HpC7TB3b2ftoAkg', 'Android', 'aa24d4751e30c5b6', '2018-08-01 21:33:09', '2018-08-01 21:33:09'),
(138, 136, 5, 'fpTq_AKk00g:APA91bEeRGKPQpMa8jDRzyZrmEahM8EhDUsAryX1c11LcshRvJXVx_TVEtMc_-hrTkYyauC8JPaq3jDLQDDsSU23dBcwU4csOAbYT0PGLPwxSXKkjAU_2WcNhjOeQb9WJYHmkzeMAIi7eCkBEVw4IDJp5yXe61hcYQ', 'Android', 'ca5cdbcc84ab92c6', '2018-08-02 00:06:05', '2018-08-02 00:06:05'),
(140, 156, 2, 'dVNjNPJcWA0:APA91bHIJSaCUmpsF8gfVP-WK22xfspj6IyqM8egZHZSJgtFSwN9fcQZwTyeo2YWLv_I796AbjV_rWXnPXT0kkdh0QI_mTxP0KH9GV0X9oNeqBBofLtu_I164fEn5GcZazaQAnjd9h8X3LbD4WlncHFQSPfu1HtGCw', 'Android', '35b0ecba13d6b532', '2018-08-02 00:16:55', '2018-08-02 00:16:55'),
(141, 1, 5, 'dKCxTHKr5iw:APA91bGDEJdxMj6YDm__D204DvyzeUPxrPxKqe82HGrnppbACXumDAB9yejlSJPt0Q4nwXtYNO_n2bcx39VS7Gg9VlsTOazqVV6phH_NxPY-fRHzgvUXwVfm_VythvvcGtZhUTFWKInmptQSNs57ZWIm_wmZT_gWNg', 'Android', '8c74342f80b0da7d', '2018-08-02 00:38:25', '2018-08-02 00:38:25'),
(142, 139, 5, 'd0HzK8NOWaw:APA91bHFi3RhF4yHxBPdtZVmSWjEnVHOtviTn2K9rVZcxD9NxOj1f_2RRmkt2jOxtrefMXPPtS6G3i7iInr9tYCXWAdhMNfNiqstZUPr6n_zYC5748gi9qTpCi5wMmMSSHfreScX2eND8oAGwDY_Aq4dajnMlPibVA', 'Android', '2d41490ebcb69472', '2018-08-02 00:59:59', '2018-08-02 00:59:59'),
(143, 139, 5, 'dz1TTdZB8XQ:APA91bFbud-uYsUldFCmwBr82ITmRbeYsNfU-2fjVBZggfpxZRnfLxHVv3fhyZyRv4Xq1JZ9DzIP5Qln0KkPptSLNl6-uljJ96VeC2xDdZZVpGEmcOasahB80swB0PYFXC8VGbWfQGJOsLMCp4KXBuFeEV0MfxhImw', 'Android', 'd429bb789e180524', '2018-08-02 01:25:24', '2018-08-02 01:25:24'),
(144, 157, 2, 'feMIefPQIgw:APA91bHo_foD11Ebd9XoDV1p1L0NMFgn5j_rgMYnnp9FL6VZVCxHvwvhvKUd7tpJMb3GDrxsAWmMH3Sym4WFYNtu2cPr7IermAJo1diE2emzgKa6rw4FwuF9K8z-f1IJARb0k0g-XC2End1LUbEcc8OJiywE3wrZEQ', 'Android', '531d94005a4ea842', '2018-08-02 01:33:04', '2018-08-02 01:33:04'),
(145, 158, 2, 'eCiuva8GjXc:APA91bGgg4GszGGkom7kVJCz2cQ2wEQjxJ29ed3Z-GE39EGzR_VjW9ihQFE5g3oseHY610Aw3wjECusnQPoA7ISFKUU6i4quSBN9w-YkZaIkAJ1Enrs-wi1Ce7aqbw6HdmarEID5uBYXxTbJ0mzigg--YMnq6M-fBQ', 'Android', 'd429bb789e180524', '2018-08-02 01:38:14', '2018-08-02 01:38:14'),
(146, 159, 2, 'dVN5UPiAXhg:APA91bGc-WPmPmQW4050cIVKgipFlC8nJMfvxfPXMyjE0wClYP36MWtiHKdkNZnGVtsfCPF3OitQ8YUoi0MTcS92EAt2j53_4uUoqSlPQo2YqE-htup5np_LY539CoqvjnUR0LvXu9oKGxv7bPVeF0vNAmQ2DR80Fw', 'Android', '6076a1585e6c45ca', '2018-08-02 03:48:52', '2018-08-02 03:48:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `incentive_category`
--

CREATE TABLE `incentive_category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rate` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `incentive_category`
--

INSERT INTO `incentive_category` (`id`, `name`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'incentive1', 2, '2018-03-27 17:14:58', '0000-00-00 00:00:00'),
(2, 'incentive2', 5, '2018-03-27 17:15:25', '0000-00-00 00:00:00'),
(3, 'incentive3', 7.5, '2018-03-27 17:15:25', '0000-00-00 00:00:00'),
(4, 'incentive4', 10, '2018-05-31 06:28:40', '0000-00-00 00:00:00'),
(5, 'incentive5', 15, '2018-05-28 05:48:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `role` varchar(20) NOT NULL,
  `activity` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice_no` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `type` varchar(150) NOT NULL DEFAULT 'sembako',
  `status` int(11) DEFAULT NULL,
  `payment` varchar(255) NOT NULL DEFAULT 'cash',
  `agen_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id`, `invoice_no`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `type`, `status`, `payment`, `agen_id`, `created_at`, `updated_at`) VALUES
(126, '201807274967', 33, 16500, 0, 0, 16500, 'sembako', NULL, 'cash', NULL, '2018-07-27 00:45:24', '2018-07-27 00:45:24'),
(127, '20180727E29E', 33, 27000, 0, 0, 27000, 'sembako', NULL, 'cash', NULL, '2018-07-27 01:09:13', '2018-07-27 01:09:13'),
(129, '20180727AAA9', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:15:04', '2018-07-27 02:15:04'),
(130, '201807279E76', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:16:45', '2018-07-27 02:16:45'),
(131, '2018072752A9', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:16:49', '2018-07-27 02:16:49'),
(132, '201807279CBD', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:16:58', '2018-07-27 02:16:58'),
(133, '201807279CBD', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:16:58', '2018-07-27 02:16:58'),
(134, '20180727A11F', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:17:06', '2018-07-27 02:17:06'),
(135, '201807277A8C', 1, 20000, 0, NULL, 20000, 'Topup', 7, 'cash', NULL, '2018-07-27 02:17:08', '2018-07-27 02:17:08'),
(136, '20180727988C', 33, 61400, 0, 0, 61400, 'sembako', 6, 'cash', NULL, '2018-07-27 03:26:04', '2018-07-27 03:26:04'),
(137, '20180728067B', 1, 7200, 0, 0, 7200, 'sembako', 6, 'cash', NULL, '2018-07-28 05:50:02', '2018-07-28 05:50:02'),
(138, '2018072832FD', 1, 2500, 0, 0, 2500, 'sembako', 6, 'cash', NULL, '2018-07-28 05:59:37', '2018-07-28 05:59:37'),
(139, '201807284F48', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:11:56', '2018-07-28 06:11:56'),
(140, '2018072818AE', 1, 9700, 0, 0, 9700, 'sembako', 6, 'cash', NULL, '2018-07-28 06:17:29', '2018-07-28 06:17:29'),
(141, '20180728F4C5', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:31:15', '2018-07-28 06:31:15'),
(142, '201807286B37', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:35:19', '2018-07-28 06:35:19'),
(143, '201807286F3A', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:40:20', '2018-07-28 06:40:20'),
(144, '20180728A36D', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:47:41', '2018-07-28 06:47:41'),
(145, '201807288F86', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:52:03', '2018-07-28 06:52:03'),
(146, '20180728D227', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:56:23', '2018-07-28 06:56:23'),
(147, '201807280BE9', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 06:57:51', '2018-07-28 06:57:51'),
(148, '20180728E79E', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 07:12:39', '2018-07-28 07:12:39'),
(149, '201807287CB9', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 08:09:31', '2018-07-28 08:09:31'),
(150, '20180728DB32', 1, 0, 0, 0, 0, 'sembako', 6, 'cash', NULL, '2018-07-28 08:18:27', '2018-07-28 08:18:27'),
(151, '20180728437F', 1, 9700, 0, 0, 9700, 'sembako', 6, 'cash', NULL, '2018-07-28 08:26:00', '2018-07-28 08:26:00'),
(152, '2018072830E2', 1, 27000, 0, 0, 27000, 'sembako', 6, 'cash', NULL, '2018-07-28 08:31:03', '2018-07-28 08:31:03'),
(153, '20180728C007', 1, 9700, 0, 0, 9700, 'sembako', 6, 'cash', NULL, '2018-07-28 09:33:05', '2018-07-28 09:33:05'),
(154, '201807280BEF', 1, 9700, 0, 0, 9700, 'sembako', 6, 'cash', NULL, '2018-07-28 10:30:48', '2018-07-28 10:30:48'),
(157, '201807294D75', 120, 5600, 0, 0, 10600, 'sembako', 7, 'cash', 102, '2018-07-28 22:38:39', '2018-07-28 22:45:24'),
(158, '201807294519', 1, 10000, 0, NULL, 10000, 'Topup', 9, 'cash', NULL, '2018-07-28 22:43:07', '2018-07-29 00:28:32'),
(159, '20180729BDDF', 1, 1000, 0, NULL, 1000, 'Topup', 9, 'cash', NULL, '2018-07-28 22:44:27', '2018-07-29 00:28:32'),
(160, '20180729CB8F', 1, 36700, 0, 0, 36700, 'sembako', 9, 'cash', NULL, '2018-07-28 22:51:23', '2018-07-29 00:28:32'),
(161, '201807293ACE', 126, 167000, 0, 0, 167000, 'sembako', 2, 'cash', 125, '2018-07-28 22:59:47', '2018-07-28 23:00:30'),
(162, '201807291BC7', 1, 99000, 0, 0, 99000, 'sembako', 9, 'cash', NULL, '2018-07-28 23:03:42', '2018-07-29 00:28:32'),
(164, '20180729E539', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-28 23:54:23', '2018-07-29 00:28:32'),
(165, '20180729F121', 1, 8450, 0, 0, 8450, 'sembako', 9, 'cash', NULL, '2018-07-29 00:03:23', '2018-07-29 00:28:32'),
(166, '20180729C6DA', 1, 25000, 0, NULL, 25000, 'Topup', 9, 'cash', NULL, '2018-07-29 00:09:01', '2018-07-29 00:28:32'),
(167, '20180729C6DA', 1, 25000, 0, NULL, 25000, 'Topup', 9, 'cash', NULL, '2018-07-29 00:09:01', '2018-07-29 00:28:32'),
(168, '20180729CECE', 1, 25000, 0, NULL, 25000, 'Topup', 9, 'cash', NULL, '2018-07-29 00:09:02', '2018-07-29 00:28:32'),
(169, '20180729CECE', 1, 25000, 0, NULL, 25000, 'Topup', 9, 'cash', NULL, '2018-07-29 00:09:02', '2018-07-29 00:28:32'),
(170, '20180729E828', 1, 25000, 0, 0, 25000, 'sembako', 9, 'cash', NULL, '2018-07-29 00:11:06', '2018-07-29 00:28:32'),
(171, '20180729051C', 33, 5000, 0, 0, 5000, 'sembako', 9, 'cash', NULL, '2018-07-29 00:18:20', '2018-07-29 00:27:14'),
(172, '20180729530C', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 00:28:06', '2018-07-29 00:28:32'),
(173, '201807299FE5', 1, 16900, 0, 0, 16900, 'sembako', 9, 'cash', NULL, '2018-07-29 00:29:45', '2018-07-29 00:29:55'),
(174, '20180729330F', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 00:37:35', '2018-07-29 00:37:43'),
(175, '2018072989C0', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 00:38:53', '2018-07-29 00:39:09'),
(176, '20180729FF31', 1, 0, 0, 0, 0, 'sembako', 9, 'cash', NULL, '2018-07-29 00:39:02', '2018-07-29 00:39:09'),
(177, '20180729893B', 1, 51500, 0, 0, 51500, 'sembako', 9, 'cash', NULL, '2018-07-29 04:44:05', '2018-07-29 04:44:26'),
(178, '20180729CEF6', 1, 31700, 0, 0, 31700, 'sembako', 9, 'cash', NULL, '2018-07-29 05:02:47', '2018-07-29 05:03:11'),
(179, '201807291B5C', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 05:24:03', '2018-07-29 05:33:02'),
(180, '2018072962EF', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 05:47:33', '2018-07-29 05:48:46'),
(181, '20180729BF52', 1, 27000, 0, 0, 27000, 'sembako', 9, 'cash', NULL, '2018-07-29 05:53:23', '2018-07-29 05:54:30'),
(182, '201807291740', 1, 14400, 0, 0, 14400, 'sembako', 9, 'cash', NULL, '2018-07-29 05:56:00', '2018-07-29 05:56:08'),
(183, '201807296F2C', 1, 16900, 0, 0, 16900, 'sembako', 9, 'cash', NULL, '2018-07-29 06:01:44', '2018-07-29 06:01:55'),
(184, '20180729AD5A', 1, 38900, 0, 0, 38900, 'sembako', 9, 'cash', NULL, '2018-07-29 06:02:17', '2018-07-29 06:03:08'),
(185, '201807299311', 1, 78500, 0, 0, 78500, 'sembako', 9, 'cash', NULL, '2018-07-29 06:04:21', '2018-07-29 06:04:29'),
(186, '201807299F1C', 1, 29500, 0, 0, 29500, 'sembako', 9, 'cash', NULL, '2018-07-29 06:06:56', '2018-07-29 06:07:04'),
(187, '20180729F594', 1, 29500, 0, 0, 29500, 'sembako', 9, 'cash', NULL, '2018-07-29 06:08:56', '2018-07-29 06:09:16'),
(188, '201807293464', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 06:10:57', '2018-07-29 06:18:31'),
(189, '20180729A75B', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 06:20:32', '2018-07-29 06:41:16'),
(190, '20180729C4E5', 1, 0, 0, 0, 0, 'sembako', 9, 'cash', NULL, '2018-07-29 06:22:39', '2018-07-29 06:41:16'),
(191, '20180729634B', 1, 51500, 0, 0, 51500, 'sembako', 9, 'cash', NULL, '2018-07-29 06:23:00', '2018-07-29 06:41:16'),
(192, '20180729CA8B', 1, 29500, 0, 0, 29500, 'sembako', 9, 'cash', NULL, '2018-07-29 06:23:54', '2018-07-29 06:41:16'),
(193, '201807298B8D', 1, 16900, 0, 0, 16900, 'sembako', 9, 'cash', NULL, '2018-07-29 06:28:27', '2018-07-29 06:41:16'),
(194, '201807294FEE', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 06:29:11', '2018-07-29 06:41:16'),
(195, '20180729D2D0', 1, 17750, 0, 0, 17750, 'sembako', 9, 'cash', NULL, '2018-07-29 06:34:48', '2018-07-29 06:41:16'),
(196, '20180729CCE5', 1, 8450, 0, 0, 8450, 'sembako', 9, 'cash', NULL, '2018-07-29 06:38:12', '2018-07-29 06:41:16'),
(197, '20180729570B', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 06:38:26', '2018-07-29 06:41:16'),
(198, '20180729D137', 1, 16900, 0, 0, 16900, 'sembako', 9, 'cash', NULL, '2018-07-29 06:40:50', '2018-07-29 06:41:16'),
(199, '20180729BCD0', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 13:57:14', '2018-07-29 07:38:37'),
(200, '20180729A397', 1, 29500, 0, 0, 29500, 'sembako', 1, 'cash', NULL, '2018-07-29 13:58:45', '2018-07-29 13:58:45'),
(201, '201807292E1C', 1, 70500, 0, 0, 70500, 'sembako', 1, 'cash', NULL, '2018-07-29 14:05:15', '2018-07-29 14:05:15'),
(202, '20180729B30C', 1, 29500, 0, 0, 29500, 'sembako', 1, 'cash', NULL, '2018-07-29 14:05:39', '2018-07-29 14:05:39'),
(203, '201807297B05', 1, 8450, 0, 0, 8450, 'sembako', 9, 'cash', NULL, '2018-07-29 14:09:58', '2018-07-29 07:38:37'),
(204, '201807297049', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 14:10:23', '2018-07-29 07:38:37'),
(205, '201807298046', 1, 8450, 0, 0, 8450, 'sembako', 9, 'cash', NULL, '2018-07-29 07:16:34', '2018-07-29 07:38:37'),
(206, '201807297D10', 1, 16900, 0, 0, 16900, 'sembako', 1, 'cash', NULL, '2018-07-29 07:27:20', '2018-07-29 07:27:20'),
(207, '201807295502', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 07:34:50', '2018-07-29 07:38:37'),
(208, '20180729BCB3', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 07:36:37', '2018-07-29 07:38:37'),
(209, '20180729D73C', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 07:39:13', '2018-07-29 07:39:24'),
(210, '20180729D77A', 1, 15650, 0, 0, 15650, 'sembako', 1, 'cash', NULL, '2018-07-29 07:57:06', '2018-07-29 07:57:06'),
(211, '201807292BF1', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-29 07:59:36', '2018-07-29 07:59:48'),
(212, '20180729D622', 1, 27150, 0, 0, 27150, 'sembako', 9, 'cash', NULL, '2018-07-29 08:00:21', '2018-07-29 08:06:23'),
(213, '20180729586D', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 08:04:13', '2018-07-29 08:06:23'),
(214, '201807299769', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 08:05:52', '2018-07-29 08:06:23'),
(215, '201807290BB6', 1, 29500, 0, 0, 29500, 'sembako', 9, 'cash', NULL, '2018-07-29 08:10:11', '2018-07-29 08:13:17'),
(216, '20180729743B', 1, 27000, 0, 0, 27000, 'sembako', 9, 'cash', NULL, '2018-07-29 08:13:05', '2018-07-29 08:13:17'),
(217, '20180729BAE8', 1, 12200, 0, 0, 12200, 'sembako', 9, 'cash', NULL, '2018-07-29 08:16:33', '2018-07-29 08:19:34'),
(218, '2018072975D0', 1, 51500, 0, 0, 51500, 'sembako', 9, 'cash', NULL, '2018-07-29 08:19:23', '2018-07-29 08:24:33'),
(219, '20180729124B', 1, 51500, 0, 0, 51500, 'sembako', 9, 'cash', NULL, '2018-07-29 08:20:51', '2018-07-29 08:22:08'),
(220, '201807295111', 1, 9700, 0, 0, 9700, 'sembako', 1, 'cash', NULL, '2018-07-29 08:21:31', '2018-07-29 08:21:31'),
(221, '20180729E1D0', 1, 22450, 0, 0, 22450, 'sembako', 9, 'cash', NULL, '2018-07-29 08:44:19', '2018-07-29 08:52:47'),
(222, '20180729F3BA', 1, 27000, 0, 0, 27000, 'sembako', 1, 'cash', NULL, '2018-07-29 08:52:30', '2018-07-29 08:52:30'),
(223, '20180730229B', 1, 64000, 0, 0, 64000, 'sembako', 9, 'cash', NULL, '2018-07-29 20:45:11', '2018-07-29 20:45:39'),
(225, '201807309BC0', 1, 31700, 0, 0, 31700, 'sembako', 9, 'cash', NULL, '2018-07-30 00:12:51', '2018-07-30 00:59:41'),
(226, '2018073069F1', 1, 64950, 0, 0, 64950, 'sembako', 9, 'cash', NULL, '2018-07-30 00:16:19', '2018-07-30 00:59:41'),
(227, '20180730C6F4', 33, 7200, 0, 0, 7200, 'sembako', 1, 'cash', NULL, '2018-07-30 01:00:44', '2018-07-30 01:00:44'),
(228, '20180730FF28', 1, 9700, 0, 0, 9700, 'sembako', 9, 'cash', NULL, '2018-07-30 01:02:38', '2018-07-30 01:02:56'),
(229, '201807301722', 33, 25700, 0, 0, 25700, 'sembako', 9, 'cash', NULL, '2018-07-30 01:04:48', '2018-07-30 01:05:12'),
(230, '201807303173', 33, 44400, 0, 0, 44400, 'sembako', 7, 'cash', NULL, '2018-07-30 05:59:29', '2018-07-30 05:59:32'),
(231, '20180731FD60', 33, 7200, 0, 0, 7200, 'sembako', 1, 'cash', NULL, '2018-07-30 20:59:07', '2018-07-30 20:59:07'),
(232, '201807316E3D', 33, 7200, 0, 0, 7200, 'sembako', 9, 'cash', NULL, '2018-07-30 21:02:17', '2018-07-30 21:02:44'),
(233, '201807318E36', 33, 17800, 0, 0, 17800, 'sembako', 9, 'cash', NULL, '2018-07-30 21:19:46', '2018-07-31 03:54:07'),
(234, '2018073117D0', 33, 39100, 0, 0, 39100, 'sembako', 9, 'cash', NULL, '2018-07-30 21:32:09', '2018-07-31 03:54:07'),
(235, '20180731B538', 33, 64000, 0, 0, 64000, 'sembako', 9, 'cash', NULL, '2018-07-31 00:46:23', '2018-07-31 03:54:07'),
(236, '201807316283', 33, 11800, 0, 0, 11800, 'sembako', 9, 'cash', NULL, '2018-07-31 02:29:48', '2018-07-31 03:54:07'),
(237, '20180801D935', 33, 13550, 0, 0, 13550, 'sembako', 9, 'cash', NULL, '2018-07-31 19:26:02', '2018-08-01 03:53:36'),
(238, '2018080151AF', 33, 12750, 0, 0, 12750, 'sembako', 9, 'cash', NULL, '2018-07-31 19:40:08', '2018-08-01 03:53:36'),
(239, '2018080132E5', 33, 6500, 0, 0, 6500, 'sembako', 9, 'cash', NULL, '2018-07-31 19:50:03', '2018-08-01 03:53:36'),
(240, '20180801CE2B', 33, 12800, 0, 0, 12800, 'sembako', 9, 'cash', NULL, '2018-07-31 19:53:11', '2018-08-01 03:53:36'),
(241, '20180801C665', 120, 12250, 0, 0, 17250, 'sembako', 7, 'cash', 102, '2018-07-31 22:25:41', '2018-08-01 03:19:37'),
(242, '201808016CE5', 33, 12000, 0, 0, 12000, 'sembako', 1, 'cash', NULL, '2018-08-01 00:33:00', '2018-08-01 00:33:00'),
(243, '2018080138C4', 33, 36550, 0, 0, 36550, 'sembako', 9, 'cash', NULL, '2018-08-01 01:25:54', '2018-08-01 03:53:36'),
(244, '201808012402', 33, 18000, 0, 0, 18000, 'sembako', 9, 'cash', NULL, '2018-08-01 01:42:55', '2018-08-01 03:53:36'),
(245, '20180801F0E7', 33, 32500, 0, 0, 32500, 'sembako', 9, 'cash', NULL, '2018-08-01 02:26:53', '2018-08-01 03:53:36'),
(246, '201808014676', 33, 20000, 0, NULL, 20000, 'Topup', 9, 'cash', NULL, '2018-08-01 02:35:40', '2018-08-01 03:53:36'),
(247, '20180801908A', 120, 50350, 0, 0, 50350, 'sembako', 7, 'cash', 102, '2018-08-01 03:06:15', '2018-08-01 03:24:14'),
(248, '201808013FB0', 33, 50000, 0, NULL, 50000, 'Topup', 9, 'cash', NULL, '2018-08-01 03:21:34', '2018-08-01 03:53:36'),
(249, '201808027087', 33, 10000, 0, 0, 10000, 'sembako', 9, 'cash', NULL, '2018-08-01 21:00:51', '2018-08-02 03:57:02'),
(250, '20180802A38B', 33, 26700, 0, 0, 26700, 'sembako', 9, 'cash', NULL, '2018-08-01 22:40:23', '2018-08-02 03:57:02'),
(251, '2018080253BC', 33, 27400, 0, 0, 27400, 'sembako', 9, 'cash', NULL, '2018-08-02 01:28:33', '2018-08-02 03:57:02'),
(252, '20180802B313', 33, 15350, 0, 0, 15350, 'sembako', 9, 'cash', NULL, '2018-08-02 03:56:17', '2018-08-02 03:57:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_billing_detail`
--

CREATE TABLE `order_billing_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `long` varchar(255) NOT NULL,
  `customer_address2` varchar(255) NOT NULL,
  `notes` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order_billing_detail`
--

INSERT INTO `order_billing_detail` (`id`, `order_id`, `customer_name`, `customer_phone`, `customer_address`, `lat`, `long`, `customer_address2`, `notes`, `created_at`, `updated_at`) VALUES
(49, 95, 'Nandar', '089688397844', '', '-6.24086', '106.64896980000003', 'Serang', NULL, '2018-07-06 03:33:43', '2018-07-06 03:33:43'),
(50, 96, 'Poltak', '08111708772', '', '-6.2407615', '106.6480779', 'North land', NULL, '2018-07-10 03:11:27', '2018-07-10 03:11:27'),
(51, 97, 'Nandar', '089688397844', '', '-6.24086', '106.64896980000003', 'Serang', NULL, '2018-07-10 23:13:42', '2018-07-10 23:13:42'),
(52, 98, 'Nandar', '089688397844', '', '-6.2407453', '106.648083', 'Serang', NULL, '2018-07-10 23:29:08', '2018-07-10 23:29:08'),
(53, 99, 'Nandar', '089688397844', '', '-6.2407438', '106.648082', 'Serang', 'Cepet mas', '2018-07-10 23:29:51', '2018-07-10 23:29:51'),
(54, 100, 'Erben', '08118161618', '', '-6.2406421', '106.6483635', 'Serpong', NULL, '2018-07-12 03:36:38', '2018-07-12 03:36:38'),
(55, 101, 'JONATAN JORDY', '08999310048', '', '-6.240606666666667', '106.64817333333333', 'Depo bangunan', NULL, '2018-07-12 04:08:55', '2018-07-12 04:08:55'),
(56, 102, 'Erben', '08118161618', '', '-6.243698065193519', '106.65578686126571', 'Serpong', NULL, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(57, 106, 'suryanto', '087654321', '', '-6.240241', '106.647747', 'depo bangunan', 'sebrang papan', '2018-07-16 10:17:20', '2018-07-16 10:17:20'),
(58, 107, 'suryanto', '087654321', '', '-6.24086', '106.64896980000003', 'jl pelanggan setia', 'Tes ya', '2018-07-16 10:32:51', '2018-07-16 10:32:51'),
(59, 108, 'Erben', '08118161618', '', '-6.2410639', '106.6744318', 'Serpong', NULL, '2018-07-16 17:08:09', '2018-07-16 17:08:09'),
(60, 109, 'JORDY JONATAN', '08999310048', '', '-6.241174399999999', '106.6283611', 'Summarecon serpong', 'Cepetan ya mas', '2018-07-16 19:40:11', '2018-07-16 19:40:11'),
(61, 110, 'Mufti Makaarim', '081319109844', '', '-6.241261080393478', '106.64823622651478', 'Batuputih Cibubur Kav 15 Depok', NULL, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(62, 111, 'suryanto', '087654321', '', '-6.2407693', '106.6480722', 'jl pelanggan setia', NULL, '2018-07-16 22:20:59', '2018-07-16 22:20:59'),
(63, 112, 'Addin', '0817714108', '', '-6.240838099172091', '106.64791878640203', 'Jalan masjid mujahidin ruko redio serpong', 'Tolong di anter paling lama 2 jam dari sekarang', '2018-07-16 23:04:20', '2018-07-16 23:04:20'),
(64, 113, 'Richard', '0899123456', '', '-6.2407751', '106.6480748', 'Gading serpong', NULL, '2018-07-16 23:11:19', '2018-07-16 23:11:19'),
(65, 114, 'suryanto', '087654321', '', '-6.2407597', '106.6480797', 'jl pelanggan setia', NULL, '2018-07-16 23:27:30', '2018-07-16 23:27:30'),
(66, 115, 'suryanto', '087654321', '', '-6.240761', '106.6480804', 'jl pelanggan setia', NULL, '2018-07-16 23:41:10', '2018-07-16 23:41:10'),
(67, 116, 'suryanto', '087654321', '', '-6.240241', '106.647747', 'depo bangunan', 'sebrang papan', '2018-07-16 23:44:58', '2018-07-16 23:44:58'),
(68, 117, 'suryanto', '087654321', '', '-6.2407595', '106.6480802', 'jl pelanggan setia', NULL, '2018-07-16 23:59:41', '2018-07-16 23:59:41'),
(69, 118, 'suryanto', '087654321', '', '-6.24076', '106.6480794', 'jl pelanggan setia', NULL, '2018-07-17 00:00:56', '2018-07-17 00:00:56'),
(70, 119, 'Erben', '08118161618', '', '-6.2407983', '106.6480379', 'Serpong', NULL, '2018-07-17 02:01:05', '2018-07-17 02:01:05'),
(71, 120, 'Richard', '0899123456', '', '-6.2407595', '106.6480809', 'Gading serpong', NULL, '2018-07-19 00:05:16', '2018-07-19 00:05:16'),
(72, 121, 'JORDY JONATAN', '08999310048', '', '-6.2407682', '106.648077', 'Apartment Baywalk', NULL, '2018-07-19 00:06:28', '2018-07-19 00:06:28'),
(73, 122, 'Richard', '0899123456', '', '-6.2407593', '106.6480796', 'Gading serpong', NULL, '2018-07-19 00:24:10', '2018-07-19 00:24:10'),
(74, 123, 'suryanto', '087654321', '', '-6.24086', '106.64896980000003', 'jl pelanggan setia', NULL, '2018-07-21 11:46:49', '2018-07-21 11:46:49'),
(75, 124, 'Budiarto Lim', '08127071302', '', '-6.2407617', '106.6480791', 'Serpong', 'Yang tercepat', '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(76, 125, 'JORDY JONATAN', '08999310048', '', '-6.2407611', '106.6480806', 'Apartment Baywalk', NULL, '2018-07-25 03:12:02', '2018-07-25 03:12:02'),
(77, 126, '', '', '', '', '', '', '', '2018-07-27 00:45:24', '2018-07-27 00:45:24'),
(78, 127, '', '', '', '', '', '', '', '2018-07-27 01:09:13', '2018-07-27 01:09:13'),
(79, 128, 'suryanto', '087654321', '', '-6.1089664', '106.171635', 'jl pelanggan setia', NULL, '2018-07-27 01:58:00', '2018-07-27 01:58:00'),
(80, 136, '', '', '', '', '', '', '', '2018-07-27 03:26:04', '2018-07-27 03:26:04'),
(81, 137, '', '', '', '', '', '', '', '2018-07-28 05:50:02', '2018-07-28 05:50:02'),
(82, 138, '', '', '', '', '', '', '', '2018-07-28 05:59:37', '2018-07-28 05:59:37'),
(83, 139, '', '', '', '', '', '', '', '2018-07-28 06:11:56', '2018-07-28 06:11:56'),
(84, 140, '', '', '', '', '', '', '', '2018-07-28 06:17:29', '2018-07-28 06:17:29'),
(85, 141, '', '', '', '', '', '', '', '2018-07-28 06:31:15', '2018-07-28 06:31:15'),
(86, 142, '', '', '', '', '', '', '', '2018-07-28 06:35:19', '2018-07-28 06:35:19'),
(87, 143, '', '', '', '', '', '', '', '2018-07-28 06:40:20', '2018-07-28 06:40:20'),
(88, 144, '', '', '', '', '', '', '', '2018-07-28 06:47:41', '2018-07-28 06:47:41'),
(89, 145, '', '', '', '', '', '', '', '2018-07-28 06:52:03', '2018-07-28 06:52:03'),
(90, 146, '', '', '', '', '', '', '', '2018-07-28 06:56:23', '2018-07-28 06:56:23'),
(91, 147, '', '', '', '', '', '', '', '2018-07-28 06:57:51', '2018-07-28 06:57:51'),
(92, 148, '', '', '', '', '', '', '', '2018-07-28 07:12:39', '2018-07-28 07:12:39'),
(93, 149, '', '', '', '', '', '', '', '2018-07-28 08:09:31', '2018-07-28 08:09:31'),
(94, 150, '', '', '', '', '', '', '', '2018-07-28 08:18:27', '2018-07-28 08:18:27'),
(95, 151, '', '', '', '', '', '', '', '2018-07-28 08:26:00', '2018-07-28 08:26:00'),
(96, 152, '', '', '', '', '', '', '', '2018-07-28 08:31:03', '2018-07-28 08:31:03'),
(97, 153, '', '', '', '', '', '', '', '2018-07-28 09:33:05', '2018-07-28 09:33:05'),
(98, 154, '', '', '', '', '', '', '', '2018-07-28 10:30:48', '2018-07-28 10:30:48'),
(99, 155, 'Budiarto Lim', '08127071302', '', '-6.1089671', '106.1716175', 'Serpong', NULL, '2018-07-28 21:58:13', '2018-07-28 21:58:13'),
(100, 156, 'suryanto', '087654321', '', '-6.10892020980357', '106.17158369037634', 'jl pelanggan setia', NULL, '2018-07-28 22:14:44', '2018-07-28 22:14:44'),
(101, 157, 'Vinka', '081220211201', '', '-6.1089664', '106.171635', 'Muncung', NULL, '2018-07-28 22:38:39', '2018-07-28 22:38:39'),
(102, 160, '', '', '', '', '', '', '', '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(103, 161, 'Nawahi', '0895619384179', '', '-6.1089664', '106.171635', 'Kebaharan dukuh', NULL, '2018-07-28 22:59:47', '2018-07-28 22:59:47'),
(104, 162, '', '', '', '', '', '', '', '2018-07-28 23:03:42', '2018-07-28 23:03:42'),
(105, 163, 'suryanto', '087654321', '', '-6.1090850830078125', '106.17324829101561', 'jl pelanggan setia', NULL, '2018-07-28 23:10:02', '2018-07-28 23:10:02'),
(106, 164, '', '', '', '', '', '', '', '2018-07-28 23:54:23', '2018-07-28 23:54:23'),
(107, 165, '', '', '', '', '', '', '', '2018-07-29 00:03:23', '2018-07-29 00:03:23'),
(108, 170, '', '', '', '', '', '', '', '2018-07-29 00:11:06', '2018-07-29 00:11:06'),
(109, 171, '', '', '', '', '', '', '', '2018-07-29 00:18:20', '2018-07-29 00:18:20'),
(110, 172, '', '', '', '', '', '', '', '2018-07-29 00:28:07', '2018-07-29 00:28:07'),
(111, 173, '', '', '', '', '', '', '', '2018-07-29 00:29:45', '2018-07-29 00:29:45'),
(112, 174, '', '', '', '', '', '', '', '2018-07-29 00:37:35', '2018-07-29 00:37:35'),
(113, 175, '', '', '', '', '', '', '', '2018-07-29 00:38:53', '2018-07-29 00:38:53'),
(114, 176, '', '', '', '', '', '', '', '2018-07-29 00:39:02', '2018-07-29 00:39:02'),
(115, 177, '', '', '', '', '', '', '', '2018-07-29 04:44:05', '2018-07-29 04:44:05'),
(116, 178, '', '', '', '', '', '', '', '2018-07-29 05:02:47', '2018-07-29 05:02:47'),
(117, 179, '', '', '', '', '', '', '', '2018-07-29 05:24:03', '2018-07-29 05:24:03'),
(118, 180, '', '', '', '', '', '', '', '2018-07-29 05:47:33', '2018-07-29 05:47:33'),
(119, 181, '', '', '', '', '', '', '', '2018-07-29 05:53:23', '2018-07-29 05:53:23'),
(120, 182, '', '', '', '', '', '', '', '2018-07-29 05:56:00', '2018-07-29 05:56:00'),
(121, 183, '', '', '', '', '', '', '', '2018-07-29 06:01:44', '2018-07-29 06:01:44'),
(122, 184, '', '', '', '', '', '', '', '2018-07-29 06:02:17', '2018-07-29 06:02:17'),
(123, 185, '', '', '', '', '', '', '', '2018-07-29 06:04:21', '2018-07-29 06:04:21'),
(124, 186, '', '', '', '', '', '', '', '2018-07-29 06:06:56', '2018-07-29 06:06:56'),
(125, 187, '', '', '', '', '', '', '', '2018-07-29 06:08:57', '2018-07-29 06:08:57'),
(126, 188, '', '', '', '', '', '', '', '2018-07-29 06:10:57', '2018-07-29 06:10:57'),
(127, 189, '', '', '', '', '', '', '', '2018-07-29 06:20:32', '2018-07-29 06:20:32'),
(128, 190, '', '', '', '', '', '', '', '2018-07-29 06:22:39', '2018-07-29 06:22:39'),
(129, 191, '', '', '', '', '', '', '', '2018-07-29 06:23:00', '2018-07-29 06:23:00'),
(130, 192, '', '', '', '', '', '', '', '2018-07-29 06:23:54', '2018-07-29 06:23:54'),
(131, 193, '', '', '', '', '', '', '', '2018-07-29 06:28:27', '2018-07-29 06:28:27'),
(132, 194, '', '', '', '', '', '', '', '2018-07-29 06:29:11', '2018-07-29 06:29:11'),
(133, 195, '', '', '', '', '', '', '', '2018-07-29 06:34:48', '2018-07-29 06:34:48'),
(134, 196, '', '', '', '', '', '', '', '2018-07-29 06:38:12', '2018-07-29 06:38:12'),
(135, 197, '', '', '', '', '', '', '', '2018-07-29 06:38:26', '2018-07-29 06:38:26'),
(136, 198, '', '', '', '', '', '', '', '2018-07-29 06:40:50', '2018-07-29 06:40:50'),
(137, 199, '', '', '', '', '', '', '', '2018-07-29 13:57:14', '2018-07-29 13:57:14'),
(138, 200, '', '', '', '', '', '', '', '2018-07-29 13:58:45', '2018-07-29 13:58:45'),
(139, 201, '', '', '', '', '', '', '', '2018-07-29 14:05:15', '2018-07-29 14:05:15'),
(140, 202, '', '', '', '', '', '', '', '2018-07-29 14:05:40', '2018-07-29 14:05:40'),
(141, 203, '', '', '', '', '', '', '', '2018-07-29 14:09:59', '2018-07-29 14:09:59'),
(142, 204, '', '', '', '', '', '', '', '2018-07-29 14:10:23', '2018-07-29 14:10:23'),
(143, 205, '', '', '', '', '', '', '', '2018-07-29 07:16:34', '2018-07-29 07:16:34'),
(144, 206, '', '', '', '', '', '', '', '2018-07-29 07:27:20', '2018-07-29 07:27:20'),
(145, 207, '', '', '', '', '', '', '', '2018-07-29 07:34:50', '2018-07-29 07:34:50'),
(146, 208, '', '', '', '', '', '', '', '2018-07-29 07:36:37', '2018-07-29 07:36:37'),
(147, 209, '', '', '', '', '', '', '', '2018-07-29 07:39:13', '2018-07-29 07:39:13'),
(148, 210, '', '', '', '', '', '', '', '2018-07-29 07:57:06', '2018-07-29 07:57:06'),
(149, 211, '', '', '', '', '', '', '', '2018-07-29 07:59:36', '2018-07-29 07:59:36'),
(150, 212, '', '', '', '', '', '', '', '2018-07-29 08:00:21', '2018-07-29 08:00:21'),
(151, 213, '', '', '', '', '', '', '', '2018-07-29 08:04:13', '2018-07-29 08:04:13'),
(152, 214, '', '', '', '', '', '', '', '2018-07-29 08:05:52', '2018-07-29 08:05:52'),
(153, 215, '', '', '', '', '', '', '', '2018-07-29 08:10:11', '2018-07-29 08:10:11'),
(154, 216, '', '', '', '', '', '', '', '2018-07-29 08:13:05', '2018-07-29 08:13:05'),
(155, 217, '', '', '', '', '', '', '', '2018-07-29 08:16:33', '2018-07-29 08:16:33'),
(156, 218, '', '', '', '', '', '', '', '2018-07-29 08:19:23', '2018-07-29 08:19:23'),
(157, 219, '', '', '', '', '', '', '', '2018-07-29 08:20:51', '2018-07-29 08:20:51'),
(158, 220, '', '', '', '', '', '', '', '2018-07-29 08:21:31', '2018-07-29 08:21:31'),
(159, 221, '', '', '', '', '', '', '', '2018-07-29 08:44:19', '2018-07-29 08:44:19'),
(160, 222, '', '', '', '', '', '', '', '2018-07-29 08:52:30', '2018-07-29 08:52:30'),
(161, 223, '', '', '', '', '', '', '', '2018-07-29 20:45:11', '2018-07-29 20:45:11'),
(162, 224, 'Budiarto Lim', '08127071302', '', '-6.1295856', '106.144991', 'Serpong', NULL, '2018-07-29 21:06:20', '2018-07-29 21:06:20'),
(163, 225, '', '', '', '', '', '', '', '2018-07-30 00:12:51', '2018-07-30 00:12:51'),
(164, 226, '', '', '', '', '', '', '', '2018-07-30 00:16:19', '2018-07-30 00:16:19'),
(165, 227, '', '', '', '', '', '', '', '2018-07-30 01:00:44', '2018-07-30 01:00:44'),
(166, 228, '', '', '', '', '', '', '', '2018-07-30 01:02:39', '2018-07-30 01:02:39'),
(167, 229, '', '', '', '', '', '', '', '2018-07-30 01:04:48', '2018-07-30 01:04:48'),
(168, 230, '', '', '', '', '', '', '', '2018-07-30 05:59:29', '2018-07-30 05:59:29'),
(169, 231, '', '', '', '', '', '', '', '2018-07-30 20:59:07', '2018-07-30 20:59:07'),
(170, 232, '', '', '', '', '', '', '', '2018-07-30 21:02:17', '2018-07-30 21:02:17'),
(171, 233, '', '', '', '', '', '', '', '2018-07-30 21:19:46', '2018-07-30 21:19:46'),
(172, 234, '', '', '', '', '', '', '', '2018-07-30 21:32:09', '2018-07-30 21:32:09'),
(173, 235, '', '', '', '', '', '', '', '2018-07-31 00:46:23', '2018-07-31 00:46:23'),
(174, 236, '', '', '', '', '', '', '', '2018-07-31 02:29:48', '2018-07-31 02:29:48'),
(175, 237, '', '', '', '', '', '', '', '2018-07-31 19:26:02', '2018-07-31 19:26:02'),
(176, 238, '', '', '', '', '', '', '', '2018-07-31 19:40:08', '2018-07-31 19:40:08'),
(177, 239, '', '', '', '', '', '', '', '2018-07-31 19:50:03', '2018-07-31 19:50:03'),
(178, 240, '', '', '', '', '', '', '', '2018-07-31 19:53:11', '2018-07-31 19:53:11'),
(179, 241, 'Vinka', '081220211201', '', '-6.1219954', '106.1652614', 'Muncung', NULL, '2018-07-31 22:25:41', '2018-07-31 22:25:41'),
(180, 242, '', '', '', '', '', '', '', '2018-08-01 00:33:00', '2018-08-01 00:33:00'),
(181, 243, '', '', '', '', '', '', '', '2018-08-01 01:25:54', '2018-08-01 01:25:54'),
(182, 244, '', '', '', '', '', '', '', '2018-08-01 01:42:55', '2018-08-01 01:42:55'),
(183, 245, '', '', '', '', '', '', '', '2018-08-01 02:26:53', '2018-08-01 02:26:53'),
(184, 247, 'Vinka', '081220211201', '', '-6.1088257', '106.1716018', 'Muncung', NULL, '2018-08-01 03:06:15', '2018-08-01 03:06:15'),
(185, 249, '', '', '', '', '', '', '', '2018-08-01 21:00:51', '2018-08-01 21:00:51'),
(186, 250, '', '', '', '', '', '', '', '2018-08-01 22:40:23', '2018-08-01 22:40:23'),
(187, 251, '', '', '', '', '', '', '', '2018-08-02 01:28:33', '2018-08-02 01:28:33'),
(188, 252, '', '', '', '', '', '', '', '2018-08-02 03:56:17', '2018-08-02 03:56:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_cancel`
--

CREATE TABLE `order_cancel` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `cancel_by` int(11) DEFAULT NULL,
  `reason` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `price_for_customer` float NOT NULL,
  `price_for_agen` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `category_id`, `qty`, `price_for_customer`, `price_for_agen`, `created_at`, `updated_at`) VALUES
(130, 95, 24, 1, 1, 26700, 25365, '2018-07-06 03:33:43', '2018-07-06 03:33:43'),
(131, 96, 24, 1, 1, 26700, 25365, '2018-07-10 03:11:27', '2018-07-10 03:11:27'),
(132, 97, 24, 1, 2, 26700, 25365, '2018-07-10 23:13:42', '2018-07-10 23:13:42'),
(133, 98, 81, 4, 1, 23500, 22325, '2018-07-10 23:29:08', '2018-07-10 23:29:08'),
(134, 99, 83, 4, 1, 24500, 23275, '2018-07-10 23:29:51', '2018-07-10 23:29:51'),
(135, 99, 82, 4, 1, 12750, 12112.5, '2018-07-10 23:29:51', '2018-07-10 23:29:51'),
(136, 100, 24, 1, 1, 26700, 25365, '2018-07-12 03:36:38', '2018-07-12 03:36:38'),
(137, 100, 25, 1, 1, 7700, 7315, '2018-07-12 03:36:38', '2018-07-12 03:36:38'),
(138, 100, 20, 1, 1, 27000, 25650, '2018-07-12 03:36:38', '2018-07-12 03:36:38'),
(139, 101, 22, 1, 1, 14900, 14155, '2018-07-12 04:08:55', '2018-07-12 04:08:55'),
(140, 102, 52, 3, 1, 45000, 42750, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(141, 102, 51, 3, 1, 5000, 4750, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(142, 102, 53, 3, 1, 45000, 42750, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(143, 102, 63, 3, 1, 10900, 10355, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(144, 102, 71, 3, 1, 27300, 25935, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(145, 102, 69, 3, 1, 6400, 6080, '2018-07-13 05:37:17', '2018-07-13 05:37:17'),
(146, 103, 24, 1, 5, 26700, 25365, '2018-07-16 10:11:36', '2018-07-16 10:11:36'),
(147, 104, 24, 1, 5, 26700, 25365, '2018-07-16 10:16:33', '2018-07-16 10:16:33'),
(148, 105, 24, 1, 5, 26700, 25365, '2018-07-16 10:16:54', '2018-07-16 10:16:54'),
(149, 106, 24, 1, 5, 26700, 25365, '2018-07-16 10:17:20', '2018-07-16 10:17:20'),
(150, 107, 15, 1, 1, 247000, 234650, '2018-07-16 10:32:51', '2018-07-16 10:32:51'),
(151, 108, 24, 1, 3, 26700, 25365, '2018-07-16 17:08:08', '2018-07-16 17:08:08'),
(152, 108, 19, 1, 2, 13550, 12872.5, '2018-07-16 17:08:08', '2018-07-16 17:08:08'),
(153, 108, 20, 1, 2, 27000, 25650, '2018-07-16 17:08:08', '2018-07-16 17:08:08'),
(154, 108, 23, 1, 1, 29650, 28167.5, '2018-07-16 17:08:08', '2018-07-16 17:08:08'),
(155, 108, 27, 1, 1, 29900, 28405, '2018-07-16 17:08:09', '2018-07-16 17:08:09'),
(156, 109, 15, 1, 1, 247000, 234650, '2018-07-16 19:40:11', '2018-07-16 19:40:11'),
(157, 110, 20, 1, 1, 27000, 25650, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(158, 110, 24, 1, 1, 26700, 25365, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(159, 110, 56, 3, 5, 2500, 2375, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(160, 110, 55, 3, 4, 7200, 6840, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(161, 110, 102, 6, 1, 19650, 18667.5, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(162, 110, 100, 6, 1, 17500, 16625, '2018-07-16 21:20:11', '2018-07-16 21:20:11'),
(163, 111, 24, 1, 1, 26700, 25365, '2018-07-16 22:20:59', '2018-07-16 22:20:59'),
(164, 112, 24, 1, 1, 26700, 25365, '2018-07-16 23:04:20', '2018-07-16 23:04:20'),
(165, 113, 82, 4, 1, 12750, 12112.5, '2018-07-16 23:11:19', '2018-07-16 23:11:19'),
(166, 114, 23, 1, 1, 29650, 28167.5, '2018-07-16 23:27:30', '2018-07-16 23:27:30'),
(167, 115, 20, 1, 1, 27000, 25650, '2018-07-16 23:41:10', '2018-07-16 23:41:10'),
(168, 116, 20, 1, 1, 27000, 25650, '2018-07-16 23:44:58', '2018-07-16 23:44:58'),
(169, 117, 139, 2, 1, 8800, 8360, '2018-07-16 23:59:41', '2018-07-16 23:59:41'),
(170, 118, 49, 3, 1, 5000, 4750, '2018-07-17 00:00:56', '2018-07-17 00:00:56'),
(171, 119, 24, 1, 1, 26700, 25365, '2018-07-17 02:01:05', '2018-07-17 02:01:05'),
(172, 120, 24, 1, 2, 26700, 25365, '2018-07-19 00:05:16', '2018-07-19 00:05:16'),
(173, 121, 49, 3, 1, 5000, 4750, '2018-07-19 00:06:28', '2018-07-19 00:06:28'),
(174, 121, 55, 3, 1, 7200, 6840, '2018-07-19 00:06:28', '2018-07-19 00:06:28'),
(175, 122, 20, 1, 1, 27000, 25650, '2018-07-19 00:24:10', '2018-07-19 00:24:10'),
(176, 122, 15, 1, 1, 247000, 234650, '2018-07-19 00:24:10', '2018-07-19 00:24:10'),
(177, 122, 28, 1, 1, 75000, 71250, '2018-07-19 00:24:10', '2018-07-19 00:24:10'),
(178, 122, 26, 1, 1, 15350, 14582.5, '2018-07-19 00:24:10', '2018-07-19 00:24:10'),
(179, 123, 49, 3, 1, 5000, 4750, '2018-07-21 11:46:49', '2018-07-21 11:46:49'),
(180, 123, 57, 3, 1, 500, 475, '2018-07-21 11:46:49', '2018-07-21 11:46:49'),
(181, 124, 24, 1, 1, 26700, 25365, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(182, 124, 21, 1, 1, 7500, 7125, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(183, 124, 139, 2, 1, 8800, 8360, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(184, 124, 106, 7, 1, 1900, 1805, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(185, 124, 130, 7, 1, 6200, 5890, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(186, 124, 38, 8, 1, 7250, 6887.5, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(187, 124, 31, 8, 1, 3750, 3562.5, '2018-07-25 02:52:48', '2018-07-25 02:52:48'),
(188, 125, 24, 1, 1, 26700, 25365, '2018-07-25 03:12:02', '2018-07-25 03:12:02'),
(189, 126, 137, 2, 1, 1250, 1187.5, '2018-07-27 00:45:24', '2018-07-27 00:45:24'),
(190, 126, 56, 3, 1, 2500, 2375, '2018-07-27 00:45:24', '2018-07-27 00:45:24'),
(191, 126, 82, 4, 1, 12750, 12112.5, '2018-07-27 00:45:24', '2018-07-27 00:45:24'),
(192, 127, 56, 3, 1, 2500, 2375, '2018-07-27 01:09:13', '2018-07-27 01:09:13'),
(193, 127, 83, 4, 1, 24500, 23275, '2018-07-27 01:09:13', '2018-07-27 01:09:13'),
(194, 128, 15, 1, 3, 247000, 234650, '2018-07-27 01:58:00', '2018-07-27 01:58:00'),
(195, 136, 53, 3, 1, 45000, 42750, '2018-07-27 03:26:04', '2018-07-27 03:26:04'),
(196, 136, 118, 7, 1, 5500, 5225, '2018-07-27 03:26:04', '2018-07-27 03:26:04'),
(197, 136, 63, 3, 1, 10900, 10355, '2018-07-27 03:26:04', '2018-07-27 03:26:04'),
(198, 137, 56, 3, 0, 2500, 2375, '2018-07-28 05:50:02', '2018-07-28 05:50:02'),
(199, 137, 55, 3, 1, 7200, 6840, '2018-07-28 05:50:02', '2018-07-28 05:50:02'),
(200, 138, 56, 3, 1, 2500, 2375, '2018-07-28 05:59:37', '2018-07-28 05:59:37'),
(201, 140, 55, 3, 1, 7200, 6840, '2018-07-28 06:17:29', '2018-07-28 06:17:29'),
(202, 140, 56, 3, 1, 2500, 2375, '2018-07-28 06:17:29', '2018-07-28 06:17:29'),
(203, 151, 55, 3, 1, 7200, 6840, '2018-07-28 08:26:00', '2018-07-28 08:26:00'),
(204, 151, 56, 3, 1, 2500, 2375, '2018-07-28 08:26:00', '2018-07-28 08:26:00'),
(205, 152, 83, 4, 1, 24500, 23275, '2018-07-28 08:31:03', '2018-07-28 08:31:03'),
(206, 152, 56, 3, 1, 2500, 2375, '2018-07-28 08:31:03', '2018-07-28 08:31:03'),
(207, 153, 55, 3, 1, 7200, 6840, '2018-07-28 09:33:05', '2018-07-28 09:33:05'),
(208, 153, 56, 3, 1, 2500, 2375, '2018-07-28 09:33:05', '2018-07-28 09:33:05'),
(209, 154, 55, 3, 1, 7200, 6840, '2018-07-28 10:30:48', '2018-07-28 10:30:48'),
(210, 154, 83, 4, 0, 24500, 23275, '2018-07-28 10:30:48', '2018-07-28 10:30:48'),
(211, 154, 56, 3, 1, 2500, 2375, '2018-07-28 10:30:48', '2018-07-28 10:30:48'),
(212, 155, 24, 1, 1, 26700, 25365, '2018-07-28 21:58:13', '2018-07-28 21:58:13'),
(213, 155, 19, 1, 1, 13550, 12872.5, '2018-07-28 21:58:13', '2018-07-28 21:58:13'),
(214, 156, 26, 1, 1, 15350, 14582.5, '2018-07-28 22:14:44', '2018-07-28 22:14:44'),
(215, 156, 24, 1, 1, 26700, 25365, '2018-07-28 22:14:44', '2018-07-28 22:14:44'),
(216, 157, 136, 2, 1, 5600, 5320, '2018-07-28 22:38:39', '2018-07-28 22:38:39'),
(217, 160, 55, 3, 1, 7200, 6840, '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(218, 160, 137, 2, 0, 1250, 1187.5, '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(219, 160, 56, 3, 0, 2500, 2375, '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(220, 160, 83, 4, 1, 24500, 23275, '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(221, 160, 49, 3, 1, 5000, 4750, '2018-07-28 22:51:23', '2018-07-28 22:51:23'),
(222, 161, 24, 1, 1, 26700, 25365, '2018-07-28 22:59:47', '2018-07-28 22:59:47'),
(223, 161, 20, 1, 3, 26460, 25650, '2018-07-28 22:59:47', '2018-07-28 22:59:47'),
(224, 161, 23, 1, 2, 29650, 28167.5, '2018-07-28 22:59:47', '2018-07-28 22:59:47'),
(225, 162, 83, 4, 2, 24500, 23275, '2018-07-28 23:03:42', '2018-07-28 23:03:42'),
(226, 162, 49, 3, 1, 5000, 4750, '2018-07-28 23:03:42', '2018-07-28 23:03:42'),
(227, 162, 53, 3, 1, 45000, 42750, '2018-07-28 23:03:42', '2018-07-28 23:03:42'),
(228, 163, 20, 1, 1, 27000, 25650, '2018-07-28 23:10:02', '2018-07-28 23:10:02'),
(229, 164, 56, 3, 1, 2500, 2375, '2018-07-28 23:54:23', '2018-07-28 23:54:23'),
(230, 164, 55, 3, 1, 7200, 6840, '2018-07-28 23:54:23', '2018-07-28 23:54:23'),
(231, 165, 137, 2, 1, 1250, 1187.5, '2018-07-29 00:03:23', '2018-07-29 00:03:23'),
(232, 165, 55, 3, 1, 7200, 6840, '2018-07-29 00:03:23', '2018-07-29 00:03:23'),
(233, 170, 137, 2, 0, 1250, 1187.5, '2018-07-29 00:11:06', '2018-07-29 00:11:06'),
(234, 170, 82, 4, 0, 12750, 12112.5, '2018-07-29 00:11:06', '2018-07-29 00:11:06'),
(235, 170, 83, 4, 1, 24500, 23275, '2018-07-29 00:11:06', '2018-07-29 00:11:06'),
(236, 170, 57, 3, 1, 500, 475, '2018-07-29 00:11:06', '2018-07-29 00:11:06'),
(237, 171, 57, 3, 10, 500, 475, '2018-07-29 00:18:20', '2018-07-29 00:18:20'),
(238, 172, 56, 3, 1, 2500, 2375, '2018-07-29 00:28:07', '2018-07-29 00:28:07'),
(239, 172, 55, 3, 1, 7200, 6840, '2018-07-29 00:28:07', '2018-07-29 00:28:07'),
(240, 173, 55, 3, 2, 7200, 6840, '2018-07-29 00:29:45', '2018-07-29 00:29:45'),
(241, 173, 56, 3, 1, 2500, 2375, '2018-07-29 00:29:45', '2018-07-29 00:29:45'),
(242, 174, 56, 3, 2, 2500, 2375, '2018-07-29 00:37:35', '2018-07-29 00:37:35'),
(243, 174, 55, 3, 1, 7200, 6840, '2018-07-29 00:37:35', '2018-07-29 00:37:35'),
(244, 175, 56, 3, 2, 2500, 2375, '2018-07-29 00:38:53', '2018-07-29 00:38:53'),
(245, 175, 55, 3, 1, 7200, 6840, '2018-07-29 00:38:53', '2018-07-29 00:38:53'),
(246, 177, 83, 4, 2, 24500, 23275, '2018-07-29 04:44:05', '2018-07-29 04:44:05'),
(247, 177, 56, 3, 1, 2500, 2375, '2018-07-29 04:44:05', '2018-07-29 04:44:05'),
(248, 178, 55, 3, 1, 7200, 6840, '2018-07-29 05:02:47', '2018-07-29 05:02:47'),
(249, 178, 83, 4, 1, 24500, 23275, '2018-07-29 05:02:47', '2018-07-29 05:02:47'),
(250, 179, 56, 3, 1, 2500, 2375, '2018-07-29 05:24:03', '2018-07-29 05:24:03'),
(251, 179, 55, 3, 1, 7200, 6840, '2018-07-29 05:24:03', '2018-07-29 05:24:03'),
(252, 180, 55, 3, 1, 7200, 6840, '2018-07-29 05:47:33', '2018-07-29 05:47:33'),
(253, 180, 56, 3, 1, 2500, 2375, '2018-07-29 05:47:33', '2018-07-29 05:47:33'),
(254, 181, 56, 3, 1, 2500, 2375, '2018-07-29 05:53:23', '2018-07-29 05:53:23'),
(255, 181, 83, 4, 1, 24500, 23275, '2018-07-29 05:53:23', '2018-07-29 05:53:23'),
(256, 182, 55, 3, 2, 7200, 6840, '2018-07-29 05:56:00', '2018-07-29 05:56:00'),
(257, 183, 55, 3, 2, 7200, 6840, '2018-07-29 06:01:44', '2018-07-29 06:01:44'),
(258, 183, 56, 3, 1, 2500, 2375, '2018-07-29 06:01:44', '2018-07-29 06:01:44'),
(259, 184, 55, 3, 2, 7200, 6840, '2018-07-29 06:02:17', '2018-07-29 06:02:17'),
(260, 184, 83, 4, 1, 24500, 23275, '2018-07-29 06:02:17', '2018-07-29 06:02:17'),
(261, 185, 56, 3, 2, 2500, 2375, '2018-07-29 06:04:21', '2018-07-29 06:04:21'),
(262, 185, 83, 4, 3, 24500, 23275, '2018-07-29 06:04:21', '2018-07-29 06:04:21'),
(263, 186, 56, 3, 2, 2500, 2375, '2018-07-29 06:06:56', '2018-07-29 06:06:56'),
(264, 186, 83, 4, 1, 24500, 23275, '2018-07-29 06:06:56', '2018-07-29 06:06:56'),
(265, 187, 55, 3, 0, 7200, 6840, '2018-07-29 06:08:57', '2018-07-29 06:08:57'),
(266, 187, 82, 4, 0, 12750, 12112.5, '2018-07-29 06:08:57', '2018-07-29 06:08:57'),
(267, 187, 56, 3, 2, 2500, 2375, '2018-07-29 06:08:57', '2018-07-29 06:08:57'),
(268, 187, 83, 4, 1, 24500, 23275, '2018-07-29 06:08:57', '2018-07-29 06:08:57'),
(269, 188, 56, 3, 2, 2500, 2375, '2018-07-29 06:10:57', '2018-07-29 06:10:57'),
(270, 188, 55, 3, 1, 7200, 6840, '2018-07-29 06:10:57', '2018-07-29 06:10:57'),
(271, 189, 56, 3, 2, 2500, 2375, '2018-07-29 06:20:32', '2018-07-29 06:20:32'),
(272, 189, 55, 3, 1, 7200, 6840, '2018-07-29 06:20:32', '2018-07-29 06:20:32'),
(273, 191, 83, 4, 2, 24500, 23275, '2018-07-29 06:23:00', '2018-07-29 06:23:00'),
(274, 191, 56, 3, 1, 2500, 2375, '2018-07-29 06:23:00', '2018-07-29 06:23:00'),
(275, 192, 56, 3, 2, 2500, 2375, '2018-07-29 06:23:54', '2018-07-29 06:23:54'),
(276, 192, 83, 4, 1, 24500, 23275, '2018-07-29 06:23:54', '2018-07-29 06:23:54'),
(277, 193, 55, 3, 2, 7200, 6840, '2018-07-29 06:28:27', '2018-07-29 06:28:27'),
(278, 193, 56, 3, 1, 2500, 2375, '2018-07-29 06:28:27', '2018-07-29 06:28:27'),
(279, 194, 56, 3, 2, 2500, 2375, '2018-07-29 06:29:11', '2018-07-29 06:29:11'),
(280, 194, 55, 3, 1, 7200, 6840, '2018-07-29 06:29:11', '2018-07-29 06:29:11'),
(281, 195, 56, 3, 2, 2500, 2375, '2018-07-29 06:34:48', '2018-07-29 06:34:48'),
(282, 195, 82, 4, 1, 12750, 12112.5, '2018-07-29 06:34:48', '2018-07-29 06:34:48'),
(283, 196, 137, 2, 1, 1250, 1187.5, '2018-07-29 06:38:12', '2018-07-29 06:38:12'),
(284, 196, 55, 3, 1, 7200, 6840, '2018-07-29 06:38:12', '2018-07-29 06:38:12'),
(285, 197, 137, 2, 2, 1250, 1187.5, '2018-07-29 06:38:26', '2018-07-29 06:38:26'),
(286, 197, 55, 3, 1, 7200, 6840, '2018-07-29 06:38:26', '2018-07-29 06:38:26'),
(287, 198, 55, 3, 2, 7200, 6840, '2018-07-29 06:40:50', '2018-07-29 06:40:50'),
(288, 198, 56, 3, 1, 2500, 2375, '2018-07-29 06:40:50', '2018-07-29 06:40:50'),
(289, 199, 56, 3, 1, 2500, 2375, '2018-07-29 13:57:14', '2018-07-29 13:57:14'),
(290, 199, 55, 3, 1, 7200, 6840, '2018-07-29 13:57:14', '2018-07-29 13:57:14'),
(291, 200, 56, 3, 2, 2500, 2375, '2018-07-29 13:58:45', '2018-07-29 13:58:45'),
(292, 200, 83, 4, 1, 24500, 23275, '2018-07-29 13:58:45', '2018-07-29 13:58:45'),
(293, 201, 82, 4, 2, 12750, 12112.5, '2018-07-29 14:05:15', '2018-07-29 14:05:15'),
(294, 201, 52, 3, 1, 45000, 42750, '2018-07-29 14:05:15', '2018-07-29 14:05:15'),
(295, 202, 56, 3, 2, 2500, 2375, '2018-07-29 14:05:39', '2018-07-29 14:05:39'),
(296, 202, 83, 4, 1, 24500, 23275, '2018-07-29 14:05:40', '2018-07-29 14:05:40'),
(297, 203, 137, 2, 1, 1250, 1187.5, '2018-07-29 14:09:58', '2018-07-29 14:09:58'),
(298, 203, 55, 3, 1, 7200, 6840, '2018-07-29 14:09:59', '2018-07-29 14:09:59'),
(299, 204, 137, 2, 2, 1250, 1187.5, '2018-07-29 14:10:23', '2018-07-29 14:10:23'),
(300, 204, 55, 3, 1, 7200, 6840, '2018-07-29 14:10:23', '2018-07-29 14:10:23'),
(301, 205, 137, 2, 1, 1250, 1187.5, '2018-07-29 07:16:34', '2018-07-29 07:16:34'),
(302, 205, 55, 3, 1, 7200, 6840, '2018-07-29 07:16:34', '2018-07-29 07:16:34'),
(303, 206, 55, 3, 2, 7200, 6840, '2018-07-29 07:27:20', '2018-07-29 07:27:20'),
(304, 206, 56, 3, 1, 2500, 2375, '2018-07-29 07:27:20', '2018-07-29 07:27:20'),
(305, 207, 56, 3, 1, 2500, 2375, '2018-07-29 07:34:50', '2018-07-29 07:34:50'),
(306, 207, 55, 3, 1, 7200, 6840, '2018-07-29 07:34:50', '2018-07-29 07:34:50'),
(307, 208, 56, 3, 2, 2500, 2375, '2018-07-29 07:36:37', '2018-07-29 07:36:37'),
(308, 208, 55, 3, 1, 7200, 6840, '2018-07-29 07:36:37', '2018-07-29 07:36:37'),
(309, 209, 56, 3, 2, 2500, 2375, '2018-07-29 07:39:13', '2018-07-29 07:39:13'),
(310, 209, 55, 3, 1, 7200, 6840, '2018-07-29 07:39:13', '2018-07-29 07:39:13'),
(311, 210, 55, 3, 2, 7200, 6840, '2018-07-29 07:57:06', '2018-07-29 07:57:06'),
(312, 210, 137, 2, 1, 1250, 1187.5, '2018-07-29 07:57:06', '2018-07-29 07:57:06'),
(313, 211, 55, 3, 1, 7200, 6840, '2018-07-29 07:59:36', '2018-07-29 07:59:36'),
(314, 211, 56, 3, 1, 2500, 2375, '2018-07-29 07:59:36', '2018-07-29 07:59:36'),
(315, 212, 55, 3, 2, 7200, 6840, '2018-07-29 08:00:21', '2018-07-29 08:00:21'),
(316, 212, 82, 4, 1, 12750, 12112.5, '2018-07-29 08:00:21', '2018-07-29 08:00:21'),
(317, 213, 56, 3, 2, 2500, 2375, '2018-07-29 08:04:13', '2018-07-29 08:04:13'),
(318, 213, 55, 3, 1, 7200, 6840, '2018-07-29 08:04:13', '2018-07-29 08:04:13'),
(319, 214, 56, 3, 2, 2500, 2375, '2018-07-29 08:05:52', '2018-07-29 08:05:52'),
(320, 214, 55, 3, 1, 7200, 6840, '2018-07-29 08:05:52', '2018-07-29 08:05:52'),
(321, 215, 56, 3, 2, 2500, 2375, '2018-07-29 08:10:11', '2018-07-29 08:10:11'),
(322, 215, 83, 4, 1, 24500, 23275, '2018-07-29 08:10:11', '2018-07-29 08:10:11'),
(323, 216, 56, 3, 1, 2500, 2375, '2018-07-29 08:13:05', '2018-07-29 08:13:05'),
(324, 216, 83, 4, 1, 24500, 23275, '2018-07-29 08:13:05', '2018-07-29 08:13:05'),
(325, 217, 56, 3, 2, 2500, 2375, '2018-07-29 08:16:33', '2018-07-29 08:16:33'),
(326, 217, 55, 3, 1, 7200, 6840, '2018-07-29 08:16:33', '2018-07-29 08:16:33'),
(327, 218, 83, 4, 2, 24500, 23275, '2018-07-29 08:19:23', '2018-07-29 08:19:23'),
(328, 218, 56, 3, 1, 2500, 2375, '2018-07-29 08:19:23', '2018-07-29 08:19:23'),
(329, 219, 83, 4, 2, 24500, 23275, '2018-07-29 08:20:51', '2018-07-29 08:20:51'),
(330, 219, 56, 3, 1, 2500, 2375, '2018-07-29 08:20:51', '2018-07-29 08:20:51'),
(331, 220, 56, 3, 1, 2500, 2375, '2018-07-29 08:21:31', '2018-07-29 08:21:31'),
(332, 220, 55, 3, 1, 7200, 6840, '2018-07-29 08:21:31', '2018-07-29 08:21:31'),
(333, 221, 82, 4, 1, 12750, 12112.5, '2018-07-29 08:44:19', '2018-07-29 08:44:19'),
(334, 221, 55, 3, 1, 7200, 6840, '2018-07-29 08:44:19', '2018-07-29 08:44:19'),
(335, 221, 56, 3, 1, 2500, 2375, '2018-07-29 08:44:19', '2018-07-29 08:44:19'),
(336, 222, 56, 3, 1, 2500, 2375, '2018-07-29 08:52:30', '2018-07-29 08:52:30'),
(337, 222, 83, 4, 1, 24500, 23275, '2018-07-29 08:52:30', '2018-07-29 08:52:30'),
(338, 223, 14, 1, 0, 126000, 119700, '2018-07-29 20:45:11', '2018-07-29 20:45:11'),
(339, 223, 13, 1, 1, 64000, 60800, '2018-07-29 20:45:11', '2018-07-29 20:45:11'),
(340, 224, 20, 1, -2, 27000, 25650, '2018-07-29 21:06:20', '2018-07-29 21:06:20'),
(341, 224, 19, 1, -1, 13550, 12872.5, '2018-07-29 21:06:20', '2018-07-29 21:06:20'),
(342, 224, 13, 1, -2, 64000, 60800, '2018-07-29 21:06:20', '2018-07-29 21:06:20'),
(343, 224, 24, 1, 1, 26700, 25365, '2018-07-29 21:06:20', '2018-07-29 21:06:20'),
(344, 225, 55, 3, 1, 7200, 6840, '2018-07-30 00:12:51', '2018-07-30 00:12:51'),
(345, 225, 83, 4, 1, 24500, 23275, '2018-07-30 00:12:51', '2018-07-30 00:12:51'),
(346, 225, 132, 7, 0, 2450, 2327.5, '2018-07-30 00:12:51', '2018-07-30 00:12:51'),
(347, 226, 82, 4, 1, 12750, 12112.5, '2018-07-30 00:16:19', '2018-07-30 00:16:19'),
(348, 226, 55, 3, 1, 7200, 6840, '2018-07-30 00:16:19', '2018-07-30 00:16:19'),
(349, 226, 52, 3, 1, 45000, 42750, '2018-07-30 00:16:19', '2018-07-30 00:16:19'),
(350, 227, 55, 3, 1, 7200, 6840, '2018-07-30 01:00:44', '2018-07-30 01:00:44'),
(351, 228, 83, 4, 0, 24500, 23275, '2018-07-30 01:02:38', '2018-07-30 01:02:38'),
(352, 228, 56, 3, 1, 2500, 2375, '2018-07-30 01:02:38', '2018-07-30 01:02:38'),
(353, 228, 55, 3, 1, 7200, 6840, '2018-07-30 01:02:38', '2018-07-30 01:02:38'),
(354, 229, 84, 4, 1, 12750, 12112.5, '2018-07-30 01:04:48', '2018-07-30 01:04:48'),
(355, 229, 49, 3, 1, 5000, 4750, '2018-07-30 01:04:48', '2018-07-30 01:04:48'),
(356, 229, 37, 8, 1, 7950, 7552.5, '2018-07-30 01:04:48', '2018-07-30 01:04:48'),
(357, 230, 16, 8, 1, 12400, 11780, '2018-07-30 05:59:29', '2018-07-30 05:59:29'),
(358, 230, 21, 1, 1, 7500, 7125, '2018-07-30 05:59:29', '2018-07-30 05:59:29'),
(359, 230, 132, 7, 10, 2450, 2327.5, '2018-07-30 05:59:29', '2018-07-30 05:59:29'),
(360, 231, 55, 3, 1, 7200, 6840, '2018-07-30 20:59:07', '2018-07-30 20:59:07'),
(361, 232, 55, 3, 1, 7200, 6840, '2018-07-30 21:02:17', '2018-07-30 21:02:17'),
(362, 233, 134, 7, 5, 2300, 2185, '2018-07-30 21:19:46', '2018-07-30 21:19:46'),
(363, 233, 108, 7, 1, 6300, 5985, '2018-07-30 21:19:46', '2018-07-30 21:19:46'),
(364, 234, 24, 1, 1, 26700, 25365, '2018-07-30 21:32:09', '2018-07-30 21:32:09'),
(365, 234, 16, 8, 1, 12400, 11780, '2018-07-30 21:32:09', '2018-07-30 21:32:09'),
(366, 235, 13, 1, 1, 64000, 60800, '2018-07-31 00:46:23', '2018-07-31 00:46:23'),
(367, 236, 134, 7, 3, 2300, 2185, '2018-07-31 02:29:48', '2018-07-31 02:29:48'),
(368, 236, 132, 7, 2, 2450, 2327.5, '2018-07-31 02:29:48', '2018-07-31 02:29:48'),
(369, 237, 19, 1, 1, 13550, 12872.5, '2018-07-31 19:26:02', '2018-07-31 19:26:02'),
(370, 238, 82, 4, 1, 12750, 12112.5, '2018-07-31 19:40:08', '2018-07-31 19:40:08'),
(371, 239, 40, 8, 1, 6500, 6175, '2018-07-31 19:50:03', '2018-07-31 19:50:03'),
(372, 240, 63, 3, 1, 10900, 10355, '2018-07-31 19:53:11', '2018-07-31 19:53:11'),
(373, 240, 58, 3, 1, 1900, 1805, '2018-07-31 19:53:11', '2018-07-31 19:53:11'),
(374, 241, 132, 7, 5, 2401, 2327.5, '2018-07-31 22:25:41', '2018-07-31 22:25:41'),
(375, 242, 138, 2, 10, 1200, 1140, '2018-08-01 00:33:00', '2018-08-01 00:33:00'),
(376, 243, 18, 1, 1, 6850, 6507.5, '2018-08-01 01:25:54', '2018-08-01 01:25:54'),
(377, 243, 132, 7, 2, 2450, 2327.5, '2018-08-01 01:25:54', '2018-08-01 01:25:54'),
(378, 243, 16, 8, 2, 12400, 11780, '2018-08-01 01:25:54', '2018-08-01 01:25:54'),
(379, 244, 16, 8, 1, 12400, 11780, '2018-08-01 01:42:55', '2018-08-01 01:42:55'),
(380, 244, 136, 2, 1, 5600, 5320, '2018-08-01 01:42:55', '2018-08-01 01:42:55'),
(381, 245, 80, 4, 1, 15000, 14250, '2018-08-01 02:26:53', '2018-08-01 02:26:53'),
(382, 245, 79, 4, 1, 17500, 16625, '2018-08-01 02:26:53', '2018-08-01 02:26:53'),
(383, 247, 115, 7, 1, 15250, 14487.5, '2018-08-01 03:06:15', '2018-08-01 03:06:15'),
(384, 247, 63, 3, 3, 10682, 10355, '2018-08-01 03:06:15', '2018-08-01 03:06:15'),
(385, 247, 138, 2, 2, 1200, 1140, '2018-08-01 03:06:15', '2018-08-01 03:06:15'),
(386, 249, 94, 8, 2, 5000, 4750, '2018-08-01 21:00:51', '2018-08-01 21:00:51'),
(387, 250, 24, 1, 1, 26700, 25365, '2018-08-01 22:40:23', '2018-08-01 22:40:23'),
(388, 251, 39, 8, 4, 6850, 6507.5, '2018-08-02 01:28:33', '2018-08-02 01:28:33'),
(389, 252, 26, 1, 1, 15350, 14582.5, '2018-08-02 03:56:17', '2018-08-02 03:56:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `sku` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL DEFAULT '',
  `description` longtext,
  `store_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `incentive_id` int(11) DEFAULT NULL,
  `shelf` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL,
  `price_for_customer` float NOT NULL,
  `price_for_agen` float NOT NULL,
  `img_url` longtext,
  `alias` varchar(18) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `sku`, `product_name`, `description`, `store_id`, `tax_id`, `category_id`, `incentive_id`, `shelf`, `cost`, `price_for_customer`, `price_for_agen`, `img_url`, `alias`, `created_at`, `updated_at`) VALUES
(13, 16601, 'Platinum Beras 5kg', 'Kwalitas beras sama persis seperti maknyus . pecahan beras lebih banyak,tanpa pewangi ,tanpa pemutih dan tanpa pewanget ,beras ini sehat langsung dari solo.berasnya sangat pulen.', 1, 1, 1, 1, NULL, 57898, 64000, 60800, 'storage/app/image/P4KM3ZEZFrDd6LTQ4b4kt0bBOOJGr76wHOL70gDg.png', 'BERAS PLAT 5KG    ', '2018-05-24 22:27:53', '2018-07-27 09:48:06'),
(14, 16602, 'Platinum Beras 10kg', 'Kwalitas beras sama persis seperti maknyus . pecahan beras lebih banyak,tanpa pewangi ,tanpa pemutih dan tanpa pewanget ,beras ini sehat langsung dari solo.berasnya sangat pulen.', 1, 1, 1, 1, NULL, 113895, 126000, 119700, 'storage/app/image/3mFGAqeOy8MGlUas2MYM8kBSUBsac9jA1X45k6P2.png', 'BERAS PLAT 10KG   ', '2018-05-27 22:41:19', '2018-06-27 20:54:08'),
(15, 16603, 'Platinum Beras 20KG', 'Kwalitas beras sama persis seperti maknyus . pecahan beras lebih banyak,tanpa pewangi ,tanpa pemutih dan tanpa pewanget ,beras ini sehat langsung dari solo.berasnya sangat pulen.', 1, 1, 1, 1, NULL, 220408, 247000, 234650, 'storage/app/image/5Vovv3dSFYLTngCsU7x23MfXYs3e0fKUn8rvdGSO.png', 'BERAS PLAT 20KG   ', '2018-05-27 22:44:09', '2018-06-27 20:55:28'),
(16, 15501, 'GMP GULA KEMASAN 1KG', NULL, 1, 1, 8, 1, NULL, 11071, 12400, 11780, 'storage/app/image/QTkbxxReG13TVyfbFMRIsyAbTJ1SPZb6IeMTDLNV.png', 'GULA GMP 1KG      ', '2018-05-27 22:47:01', '2018-06-27 21:32:58'),
(17, 14809, 'FORVITA MARGARINE 200GR', 'Margarine Forvita Sachet cocok untuk roti bakar dan untuk makanan panggang atau bakar lainnya, juga cocok untuk membuar kue dan roti karena memiliki wangi yang khas.', 1, 1, 8, 4, NULL, 4148, 6500, 6175, 'storage/app/image/Ecdah7gyUmp8Fo4sBlJIQt0MIKvGVBgQ4lVvHkxi.png', 'MARGARIN FOR 200G', '2018-05-27 22:52:40', '2018-07-31 19:19:57'),
(18, 14801, 'FITRI MINYAK GORENG 450ML', 'Minyak Goreng Fitri harga bersahabat, produk berkualitas, pasti puas', 1, 1, 1, 1, NULL, 5595, 6850, 6507.5, 'storage/app/image/cm5ARXZqcZwrg9g42MrPjcYVl7bd7wfTCk9sfdv0.png', 'MINYAK GR FT 450ML', '2018-05-27 22:54:02', '2018-06-27 21:33:43'),
(19, 14802, 'FITRI MINYAK GORENG 900ML', 'Minyak Goreng Fitri harga bersahabat, produk berkualitas, pasti puas', 1, 1, 1, 1, NULL, 11071, 13550, 12872.5, 'storage/app/image/JVbzUFXbYe7kSYgdVZ3FdIckzcHpaEndU4BnCZ2d.png', 'MINYAK GR FT 900ML', '2018-05-27 22:54:53', '2018-06-27 21:33:55'),
(20, 14803, 'FITRI MINYAK GORENG 1800ML', 'Minyak Goreng Fitri harga bersahabat, produk berkualitas, pasti puas', 1, 1, 1, 1, NULL, 22092, 27000, 25650, 'storage/app/image/dl3xa9OfbvUKFhJMJxJJ54J08kYhSOc7ShsduJHs.png', 'MINYAK GR FT 18KML', '2018-05-27 22:55:30', '2018-06-27 21:34:05'),
(21, 14805, 'FRAISWELL MINYAK GORENG 500ML', 'Fraiswell, minyak goreng yang terbuat dari kelapa sawit pilihan yang akan menambah cita rasa dan aroma menggiurkan pada masakan Anda. Kandungannya yang kaya akan vitamin E dan Pro Vitamin A menjaga kadar antioksidan yang dibutuhkan tubuh Anda sekaligus membantu menjaga kesehatan tubuh. Warna minyak yang kuning jernih alami berasal dari beta karoten; memastikan minyak goreng ini aman dikonsumsi siapa saja.', 1, 1, 1, 1, NULL, 6122, 7500, 7125, 'storage/app/image/bOo6vrEELTJW1iBJYwi1o8YNpTpwI3V9Fs4yIJXs.png', 'MINYAK GR FW 500ML', '2018-05-27 22:57:00', '2018-07-11 21:56:17'),
(22, 14806, 'FRAISWELL MINYAK GORENG 1000ML', 'Fraiswell, minyak goreng yang terbuat dari kelapa sawit pilihan yang akan menambah cita rasa dan aroma menggiurkan pada masakan Anda. Kandungannya yang kaya akan vitamin E dan Pro Vitamin A menjaga kadar antioksidan yang dibutuhkan tubuh Anda sekaligus membantu menjaga kesehatan tubuh. Warna minyak yang kuning jernih alami berasal dari beta karoten; memastikan minyak goreng ini aman dikonsumsi siapa saja.', 1, 1, 1, 1, NULL, 12168, 14900, 14155, 'storage/app/image/gkPNJko5rg2T76xwyc664IIq0mlHJ7kEf3p1d4Bj.png', 'MINYAK GR FW 1K ML', '2018-05-27 22:57:38', '2018-06-27 21:35:30'),
(23, 14807, 'FRAISWELL MINYAK GORENG 2000ML', 'Fraiswell, minyak goreng yang terbuat dari kelapa sawit pilihan yang akan menambah cita rasa dan aroma menggiurkan pada masakan Anda. Kandungannya yang kaya akan vitamin E dan Pro Vitamin A menjaga kadar antioksidan yang dibutuhkan tubuh Anda sekaligus membantu menjaga kesehatan tubuh. Warna minyak yang kuning jernih alami berasal dari beta karoten; memastikan minyak goreng ini aman dikonsumsi siapa saja.', 1, 1, 1, 1, NULL, 24218, 29650, 28167.5, 'storage/app/image/d17NZs0KSsTdxr76dKpSSWuxHBhF57izhRAegQSC.png', 'MINYAK GR FW 2K ML', '2018-05-27 22:58:17', '2018-06-27 21:35:02'),
(24, 16305, 'BOLA MINYAK GORENG 2000ML', 'BOLA Minyak Goreng Sawit adalah pilihan tepat untuk hasil gorengan yang sempurna. Terbuat dari sawit pilihan menghasilkan minyak yang jernih dan murni. Hidangan jadi lebih renyah, lebih krenyes dan lebih spesial dengan difortifikasi Vitamin A ', 1, 1, 1, 1, NULL, 21769, 26700, 25365, 'storage/app/image/FZ0ZNvzoVnxdE94VQOK5PDWmbh9iHq52KZiVMN78.png', 'MINYAK GR BL 2K ML', '2018-05-27 22:59:10', '2018-06-11 09:14:33'),
(25, 14811, 'TROPICAL MINYAK GORENG 500ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 6276, 7700, 7315, 'storage/app/image/gmYxPNLgoZJGdFER2ENpewKW2s1JA9Gzbz5Z53NH.png', 'MINYAK GR TR 500ML', '2018-05-27 23:02:02', '2018-07-11 21:55:34'),
(26, 14812, 'TROPICAL MINYAK GORENG 1000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 12517, 15350, 14582.5, 'storage/app/image/dhhvnZU2Az1y83hTEcufea8SipIGwhQ4cYYKQ8sE.png', 'MINYAK GR TR 1K ML', '2018-05-27 23:02:43', '2018-07-11 21:55:17'),
(27, 14813, 'TROPICAL MINYAK GORENG 2000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 24422, 29900, 28405, 'storage/app/image/DANaLE0DqjBskfsSK7Eww1zjuV3o3CpCfk2C1TGS.png', 'MINYAK GR TR 2K ML', '2018-05-27 23:04:33', '2018-07-11 21:55:59'),
(28, 14814, 'TROPICAL MG JERIGEN 5 LITER', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 65816, 75000, 71250, 'storage/app/image/4qkddRGTHLqHGzRzPVv4uDcnOJrxJPqDyrIeBnNx.png', 'MINYAK GR TR 5LT  ', '2018-05-27 23:05:17', '2018-07-11 22:12:40'),
(29, 14815, 'TROPICAL MG BOTOL 1000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 13631, 16700, 15865, 'storage/app/image/HDt2JiT4HotiMQqnnOeTIQJ8CXkETumFLYn93TMd.png', 'MINYAK GR TR 1KML ', '2018-05-27 23:06:04', '2018-07-11 22:07:15'),
(30, 14816, 'TROPICAL MG BOTOL 2000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 27143, 33250, 31587.5, 'storage/app/image/Yx9boRUR1xOucrXLWoqLmj3mKz81v2opzMVucy9U.png', 'MG BOTOL TR 2K ML ', '2018-05-27 23:06:50', '2018-07-11 22:14:42'),
(31, 10133, 'MAISSY MAIZENA BOX 100GR', 'Tepung maissy maizena bisa digunakan sebagai bahan pengental sup atau saus, dan digunakan untuk membuat sirup jagung dan pemanis lainnya', 1, 1, 8, 5, NULL, 2248, 3750, 3562.5, 'storage/app/image/HkR1fGDUuotE0RqGLOrJv3aqhTbgMO2j8cWSfg7x.png', 'MAISSY BOX 100GR  ', '2018-05-27 23:08:18', '2018-07-11 21:57:28'),
(32, 10134, 'MAISSY MAIZENA BOX 1KG', 'Tepung maissy maizena bisa digunakan sebagai bahan pengental sup atau saus, dan digunakan untuk membuat sirup jagung dan pemanis lainnya', 1, 1, 8, 5, NULL, 6375, 10500, 9975, 'storage/app/image/nLoYagvAJ3pIuyRdih2RV4QgdDYdTm9eoVPWVM7e.png', 'MAISSY BOX 1KG    ', '2018-05-27 23:09:04', '2018-07-31 03:13:02'),
(33, 13812, 'PRIMERA EKONOMIS 1KG', 'tepung roti primera ekonomis untuk balutan roti agar nampak lbh tebal dan lbh kremes tepung roti nya. tepung roti ini lebih menarik agak kuning kemerahan , kalau yg biasa agak pucat.', 1, 1, 8, 2, NULL, 13895, 18000, 17100, 'storage/app/image/6dQi6SXFrRWD5Kvmhy2JQqMNZa1NRxT80BEFkGPH.png', 'TEPUNG PRIM 1KG   ', '2018-05-27 23:11:25', '2018-06-07 09:34:57'),
(34, 13813, 'PRIMERA EKONOMIS 500GR', 'tepung roti primera ekonomis untuk balutan roti agar nampak lbh tebal dan lbh kremes tepung roti nya. tepung roti ini lebih menarik agak kuning kemerahan , kalau yg biasa agak pucat.', 1, 1, 8, 2, NULL, 6947, 9250, 8787.5, 'storage/app/image/IAEE5Ii3Ep3Pl9GIHDsPLxqpbiqHvJH7DDxpYaxz.png', 'TEPUNG PRIM 500GR ', '2018-05-27 23:12:20', '2018-06-07 09:35:16'),
(35, 14107, 'SATU LAUT KETAN HITAM 250GR', 'Tepung ketan hitam satu laut terbuat dari beras ketan pilihan tanpa bahan pengawet dan zat pewarna. berkwalitas baik untuk aneka kue.', 1, 1, 8, 2, NULL, 6966, 8750, 8312.5, 'storage/app/image/uyGg38n96osJuKPEdjhSlqrl9SQv23FkyAo5G2nN.png', 'KETAN HTM SL 250GR', '2018-05-27 23:12:58', '2018-07-11 21:58:08'),
(36, 14108, 'SATU LAUT GULA HALUS 250GR', 'Tepung Gula Satu Laut adalah gula yang telah mengalami proses penghalusan sehingga berbentuk bubuk gula sangat cocok untuk membuat krim dan taburan kue.', 1, 1, 8, 2, NULL, 3908, 4900, 4655, 'storage/app/image/s2qf61kCtzqlISw1bStrvV9MGsZ1kCQ4R87BTGKF.png', 'GULA LAUT SL 250GR', '2018-05-27 23:13:41', '2018-07-31 19:17:48'),
(37, 14701, 'BOLA SALJU TERIGU PACK 1KG', 'Tepung Terigu BOLA SALJU dibuat dari gandum pilihan berkualitas tinggi yang menghasilkan tepung terigu serbaguna yang ideal untuk pembuatan aneka penganan favorit.', 1, 1, 8, 2, NULL, 6413, 7950, 7552.5, 'storage/app/image/WrvmkYlQAhvdcbx142ENYngUrPltVdSsR4wSKEUH.png', 'TERIGU PK BS 1KG  ', '2018-05-27 23:14:37', '2018-06-11 10:13:55'),
(38, 14706, 'BOLA SALJU MERAH TERIGU PACK 1KG', 'Tepung Terigu BOLA SALJU dibuat dari gandum pilihan berkualitas tinggi yang menghasilkan tepung terigu serbaguna yang ideal untuk pembuatan aneka penganan favorit.', 1, 1, 8, 2, NULL, 5789, 7250, 6887.5, 'storage/app/image/2HoiFuvz55yTQLH6ySz7xHwjcjydL0VQDy3p9Uw5.png', 'TERIGU PK M BS 1KG', '2018-05-27 23:15:40', '2018-06-11 10:14:08'),
(39, 14702, 'JAWARA TERIGU PACK 1KG', 'Tepung terigu dengan kualitas yang baik sangat cocok untuk membuat kue dan makanan lainnya.', 1, 1, 8, 2, NULL, 5552, 6850, 6507.5, 'storage/app/image/1cNxJHsMtAnlHrm7xdWUQVFsfBX19qQDbikH7fVW.png', 'TERIGU JAWARA 1KG ', '2018-05-27 23:16:17', '2018-07-31 18:48:48'),
(40, 16301, 'BOLA TEPUNG BERAS 500GR', 'Bola Tepung Beras berasal dari beras pilihan dengan kualitas terpercaya diimpor dari thailand, cocok untuk sajian kue-kue tradisional, jajanan pasar, dan goreng-gorengan. Serta terjamin kualitas dan standar keamaannya. Bersertifikat halal dari MUI.', 1, 1, 8, 2, NULL, 4841, 6500, 6175, 'storage/app/image/vZ6NFzOoZvIXcbd6oJxOoIcHuIfUFPTnbi1kfliG.png', 'TEPUNG BS BL 500G', '2018-05-27 23:16:49', '2018-07-31 19:25:42'),
(41, 16302, 'BOLA TEPUNG KETAN 500GR', 'Bola Tepung Beras ketan berasal dari beras ketan pilihan dengan kualitas terpercaya diimpor dari thailand, cocok untuk sajian kue-kue tradisional, jajanan pasar, dan goreng-gorengan. Serta terjamin kualitas dan standar keamaannya. Bersertifikat halal dari MUI.', 1, 1, 8, 2, NULL, 6605, 8200, 7790, 'storage/app/image/JIp7jNW68CLprW1j8dqTxwbbSKVFNbrtzhiTYRGK.png', 'TEPUNG KN BL 500GR', '2018-05-27 23:17:20', '2018-07-31 19:26:03'),
(42, 16307, 'BOLA TEPUNG TAPIOKA 500GR', 'Tepung Tapioka cap Bola tepung yang terbuat dari singkong pilihan dengan kualitas paling bagus. Bersertifikat halal MUI.', 1, 1, 8, 2, NULL, 5055, 7000, 6650, 'storage/app/image/ktwF24hKHOoRBGXo7CbSqhiWNXphI1kizQGzCySc.png', 'TEPUNG TA BL 500GR', '2018-05-27 23:17:48', '2018-07-31 19:22:30'),
(43, 10101, 'LADA BUBUK MERICAMU 2GR', 'Lada adalah salah satu bumbu dapur dalam masakan yang memiliki rasa yang pedas, pahit, dan juga hangat. Lada dengan bentuk serbuk bisa langsung di gunakan tanpa harus menghaluskannya terlebih dahulu sehingga akan sangat memudahkan proses memasak', 1, 1, 3, 5, NULL, 232, 500, 475, 'storage/app/image/jve7VS2fJdOC1JNzsfprhUTSS5wXodE5T5MzEYnW.png', 'LADA BUBUK MER 2GR', '2018-05-27 23:18:39', '2018-06-11 10:12:32'),
(44, 101119, 'MERICAMU EKONOMIS 1KG', NULL, 1, 1, 3, 2, NULL, 50796, 80000, 76000, 'storage/app/image/VtFycdvE7tUs7rbw692kR2PINKQUYFCDATVrirly.png', 'MER EKONOMIS 11KG ', '2018-05-27 23:20:06', '2018-07-31 20:40:46'),
(45, 10126, 'MERICAMU LADA BIJI 50GR', 'Mericamu Lada Biji merupakan merica yang merupakan butir atau biji yang praktis dan tahan lama, yang digunakan sebagai bahan tambahan masakan.', 1, 1, 3, 1, NULL, 8273, 10000, 9500, 'storage/app/image/3Gk4QxcC1iOpQakvnmzdQWAaW7Q3Ot9yXZ0e28G7.png', 'LADA BIJI MER 50GR', '2018-05-27 23:20:34', '2018-07-31 20:35:22'),
(46, 10132, 'LADA BUBUK SELERAKU 2GR', 'Lada Bubuk Seleraku merupakan merica alami dengan cita rasa nusantara.', 1, 1, 3, 5, NULL, 492, 1000, 950, 'storage/app/image/lUAYygzPfjkRPixNB8HI4RSRAUFSScbQjU1HmtIr.png', 'LADA BUBUK SEL 2GR', '2018-05-27 23:22:15', '2018-07-31 20:34:34'),
(47, 12103, 'LEE KUM KE BOTOL 145GR', NULL, 1, 1, 3, 1, NULL, 9031, 11153, 10595.3, 'storage/app/image/5lXLETDhlbzc8eTTfTCiZzWJSdtxlwMeN7g650mN.png', 'BOTOL LEEKUM 145GR', '2018-05-27 23:23:53', '2018-06-07 09:41:33'),
(48, 12104, 'LEE KUM KEE SACHET 30GR', 'LEE KUM KEE Oyster Sauce Panda merupakan saus tiram khas chinese food dengan cita rasa kualitas premium berkemasan sachet. Saus tiram ini memiliki bahan-bahan jaminan mutu yang merupakan resep asli warisan turun temurun yang telah bertahan hingga 125 tahun lamanya. Saus dengan tekstur yang lembut ini ideal digunakan sebagai saus sebagai bumbu untuk menambah cita rasa sekaligus melezatkan makanan.', 1, 1, 3, 1, NULL, 2031, 2500, 2375, 'storage/app/image/tHHL6qqVu8V0kluCDiXt1HqFlRKw9R3THgHIeJ0o.png', 'LEEKUM SACHET 30GR', '2018-05-27 23:24:45', '2018-06-11 09:59:03'),
(49, 14004, 'AROMATA BUMBU TABUR BALADO 100GR', 'Aromata bumbu tabur balado, siap pakai lebih dominan rasa sedikit pedas , manis , gurih . Kemasan praktis bisa diaplikasikan untuk kentang goreng atau produk yang lainnya.  ', 1, 1, 3, 4, NULL, 2953, 5000, 4750, 'storage/app/image/ovQxblkaGQQFgLCtYcvVd6eZhLTYUd9hLfIDmclM.png', 'BUMBU ARO B 100GR ', '2018-05-27 23:25:20', '2018-06-11 09:55:46'),
(50, 14005, 'AROMATA BUMBU TABUR JG BAKAR 100GR', 'Aromata Bumbu Tabur Jagung Bakar merupakan bumbu tabur dengan rasa jagung bakar yang kuat dan khas, warna oranye muda dan ukuran partikel bumbu yang halus sehingga lebih merata bila ditaburkan serta lebih hemat penggunaannya. Sangat praktis untuk digunakan sebagai bumbu tabur pada makanan, seperti kentang goreng, jagung bakar, kerupuk, keripik, snack, dll.', 1, 1, 3, 5, NULL, 2951, 5000, 4750, 'storage/app/image/qaLwMxeOJXgfDAk5cpoPXZEwetqbpTjtbqd7bvEb.png', 'BUMBU ARO JG 100GR', '2018-05-27 23:26:06', '2018-07-31 19:09:41'),
(51, 14006, 'AROMATA BUMBU TABUR BARBEKYU 100GR', 'Aromata Bumbu Tabur Barbekyu merupakan bumbu dengan rasa beef barbekyu yang khas, dipadukan dengan rasa manis dan gurih disajikan dengan warna oranye muda.', 1, 1, 3, 5, NULL, 2996, 5000, 4750, 'storage/app/image/ZMtMeLWvPf7A2u3jQ7VldwSFfKaSeTfkAGj743l6.png', 'BUMBU ARO BQ 100GR', '2018-05-27 23:26:42', '2018-07-31 19:01:24'),
(52, 14008, 'AROMATA BUMBU TABUR BALADO 1KG', 'Aromata bumbu tabur balado, siap pakai lebih dominan rasa sedikit pedas , manis , gurih . Kemasan praktis bisa diaplikasikan untuk kentang goreng atau produk yang lainnya.', 1, 1, 3, 5, NULL, 26670, 45000, 42750, 'storage/app/image/8fLwm9o60FJVBvxI0QjG2HdUTG4W1kvkkBgtlU2M.png', 'BUMBU ARO B 1KG   ', '2018-05-27 23:27:18', '2018-07-31 18:55:31'),
(53, 14009, 'AROMATA BUMBU TABUR JAGUNG BAKAR 1KG', 'Aromata Bumbu Tabur Jagung Bakar merupakan bumbu tabur dengan rasa jagung bakar yang kuat dan khas, warna oranye muda dan ukuran partikel bumbu yang halus sehingga lebih merata bila ditaburkan serta lebih hemat penggunaannya. Sangat praktis untuk digunakan sebagai bumbu tabur pada makanan, seperti kentang goreng, jagung bakar, kerupuk, keripik, snack, dll.', 1, 1, 3, 5, NULL, 26689, 45000, 42750, 'storage/app/image/7I0s0yfkBKIMzWfaaVKNeMCrjiXdwgyaEUd0kIK1.png', 'BUMBU ARO JG 1KG  ', '2018-05-27 23:28:06', '2018-07-31 19:07:57'),
(54, 14010, 'AROMATA BUMBU TABUR BARBEKYU 1KG', 'Aromata Bumbu Tabur Barbekyu merupakan bumbu dengan rasa beef barbekyu yang khas, dipadukan dengan rasa manis dan gurih disajikan dengan warna oranye muda.', 1, 1, 3, 5, NULL, 26762, 45000, 42750, 'storage/app/image/5NKXKJ7EvmhcsuRAUkdDagcogvwrgEOhnW7sRnrr.png', 'BUMBU ARO BQ 1KG  ', '2018-05-27 23:28:42', '2018-07-31 19:01:29'),
(55, 15702, 'ACC SANTAN 200ML', 'Santan kelapa siap pakai dengan komposisi : santan kelapa, air, bahan penstabil ( nabati ).', 1, 1, 3, 1, NULL, 6024, 7200, 6840, 'storage/app/image/oHoW1x4ibTxRpfQzufNl8zC5Qo02TCx1BsTheQdO.png', 'ACC SANTAN 200ML  ', '2018-05-27 23:29:15', '2018-06-07 09:43:11'),
(56, 15705, 'ACC SANTAN 65ML', 'Santan kelapa siap pakai dengan komposisi : santan kelapa, air, bahan penstabil ( nabati ).', 1, 1, 3, 2, NULL, 1896, 2500, 2375, 'storage/app/image/cRaGdIDKjlRooNCi9bLpVKjCAmavv4TfwYHvXY21.png', 'ACC SANTAN 65ML   ', '2018-05-27 23:29:47', '2018-06-07 09:43:25'),
(57, 15901, 'AHEN GULA MERAH 20GR', 'Ahen gula merah elain manfaat sebagai bahan masakan tradisional dengan cita rasanya yang manis. ', 1, 1, 3, 4, NULL, 315, 500, 475, 'storage/app/image/TfL2lpNjLDzgIeeUgnB2Q660X0SUvqRvXu2YDHlE.png', 'GULA MERAH AH 20GR', '2018-05-27 23:30:16', '2018-06-07 09:43:43'),
(58, 16004, 'IBU JARI GARAM DAPUR 250GR', 'Garam dapur cap ibu jari cocok untuk berbagai olahan masakan.', 1, 1, 3, 2, NULL, 1405, 1900, 1805, 'storage/app/image/JWwY7JWu9LxFDWX4IakaznikIJ0jmIu4tJetwuva.png', 'GARAM IBJ 250GR   ', '2018-05-27 23:30:47', '2018-07-31 19:08:58'),
(61, 16502, 'SASA MSG 250GR', 'Sasa merupakan salah satu penyedap rasa yang sangat disukai oleh ibu-ibu rumah tangga karena sangat berkualitas', 1, 1, 3, 1, NULL, 9135, 10750, 10212.5, 'storage/app/image/RySR2o21sKjLjBkACjxlUmTerQycGpXIwt9gcqib.png', 'SASA MSG 250GR', '2018-05-27 23:32:29', '2018-06-11 10:03:49'),
(62, 16503, 'SAJIKU TEPUNG BUMBU 250GR', 'Sajiku tepung bumbu serba guna dari perpaduan tepung dan rempah-rempah dengan kelezatan yang istimewa.', 1, 1, 3, 1, NULL, 4949, 6400, 6080, 'storage/app/image/ly20VxtCVk2BEcusdEb8y6PU2qY4tg5bqyULLlNT.png', 'TEPUNG SJ 250GR   ', '2018-05-27 23:33:06', '2018-06-13 00:27:05'),
(63, 16505, 'BANGO KECAP 220ML', 'Bango kecap manis refill merupakan kecap manis dalam bentuk kemasan mengutamakan kemurnian, yang terbuat dari kedelai hitam berkualitas tinggi. Bango terbuat dari bahan - bahan terpilih yaitu : kacang kedelai hitam, gula kelapa, garam dan air tanpa adanya bahan pengawet atau bahan kimia tambahan.', 1, 1, 3, 1, NULL, 9439, 10900, 10355, 'storage/app/image/Nev5Q4L5UWW1jvku55wK7OXjWzuHRehKyufGII9G.png', 'BANGO KCP 220ML', '2018-05-27 23:33:49', '2018-06-11 09:20:22'),
(64, 16506, 'BANGO KECAP 30ML', 'Bango kecap manis refill merupakan kecap manis dalam bentuk kemasan mengutamakan kemurnian, yang terbuat dari kedelai hitam berkualitas tinggi. Bango terbuat dari bahan - bahan terpilih yaitu : kacang kedelai hitam, gula kelapa, garam dan air tanpa adanya bahan pengawet atau bahan kimia tambahan.', 1, 1, 3, 1, NULL, 1080, 1250, 1187.5, 'storage/app/image/poAddyvYjDupuiVpoE9ZCJPjqwroYkDgQyUH6vEb.png', 'BANGO KCP 30ML', '2018-05-27 23:34:15', '2018-06-07 09:46:30'),
(65, 16509, 'ROYCO AYAM 9GR', 'Royco Ayam bumbu pelezat royco rasa ayam dengan bahan dan rempah pilihan, rasa gurihnya dari daging khas dan sumsum tulang. Hadir dalam kemasan sachet yang memberikan takaran pas untuk masakan.', 1, 1, 3, 1, NULL, 383, 500, 475, 'storage/app/image/puZ57GD5eRAeLkxDqnN4aw8XeluCI2vIiVXJQi5G.png', 'ROYCO AYAM 9GR', '2018-05-27 23:34:46', '2018-07-31 20:36:20'),
(66, 16510, 'ROYCO SAPI 9GR', 'Bumbu penyedap khas Indonesia, dapat menghasilkan masakan dengan citarasa gurih & rasa daging sapi yang mantap, terbuat dari daging sapi pilihan dan rempah-rempah alami khas indonesia mudah terserap sehingga cocok untuk beragam hidangan berkuah, aneka tumisan dan lain-lain', 1, 1, 3, 1, NULL, 383, 500, 475, 'storage/app/image/T0h9ypD5AZ3yyrHaSOCFwvf0n6pfhWcuOOJbUftw.png', 'ROYCO SAPI 9GR', '2018-05-27 23:35:18', '2018-06-11 09:22:35'),
(67, 16511, 'MASAKO AYAM 11GR', 'Bumbu penyedap siap pakai Masako rasa ayam, dibuat dari ekstrak daging ayam segar, garam, gula, penguat rasa, bumbu rempah dan lemak ayam yang dapat meningkatkan kelezatan dan kesedapan aneka masakan anda.', 1, 1, 3, 1, NULL, 370, 500, 475, 'storage/app/image/FoI1xoRjMlvWNMijwqvmn2a6inOmdIShmEmNAoks.png', 'MASAKO AYAM 11GR', '2018-05-27 23:35:50', '2018-07-11 22:06:18'),
(68, 16512, 'MASAKO SAPI 11GR', NULL, 1, 1, 3, 1, NULL, 370, 5000, 475, 'storage/app/image/CSexAkKralJLZZj7IpTIencxj1d7WhwQLiWDJHi4.png', 'MASAKO SAPI 11GR', '2018-05-27 23:36:26', '2018-07-11 22:06:31'),
(69, 16514, 'INDOFOOD SAUS SAMBAL 140ML', 'Sambal Indofood Ekstra Pedas cocok sebagai pendamping segala jenis makanan, memberi kepedasan lebih yang juga dapat dikonsumsi dengan masakan apapun, seperti mie, gorengan atau nasi goreng', 1, 1, 3, 1, NULL, 5051, 6400, 6080, 'storage/app/image/QFgxIFtTQtAQsnRc60wrFGFwyYTjDBazImfwoT0j.png', 'SAMBAL IDF 140ML  ', '2018-05-27 23:36:57', '2018-06-07 09:48:03'),
(70, 16515, 'SAJIKU TP BAKWAN 90GR', 'Sajiku tepung bumbu bakwan dibuat dengan perpaduan tepat antara tepung dan rempah pilihan menghasilkan bakwan dengan tekstur yang crispy serta rasa dan aroma yang lezat dengan cara yang praktis', 1, 1, 3, 1, NULL, 2194, 2900, 2755, 'storage/app/image/wCaVnJike4bYqKemcsUKBaz4iaKHJIbWBFvOfQcH.png', 'TEPUNG SJ BWN 90GR', '2018-05-27 23:37:27', '2018-06-11 09:23:30'),
(71, 16516, 'BANGO KECAP 600ML', 'Bango kecap manis refill merupakan kecap manis dalam bentuk kemasan mengutamakan kemurnian, yang terbuat dari kedelai hitam berkualitas tinggi. Bango terbuat dari bahan - bahan terpilih yaitu : kacang kedelai hitam, gula kelapa, garam dan air tanpa adanya bahan pengawet atau bahan kimia tambahan.', 1, 1, 3, 1, NULL, 23469, 27300, 25935, 'storage/app/image/aPgqEKtknckMLgd39pChnVTIfInxUp9A9a3oq5Es.png', 'BANGO KCP 600ML', '2018-05-27 23:38:04', '2018-06-07 09:46:17'),
(72, 17101, 'PUTRA BANTEN SAUS SAMBAL 525GR', 'Putra banten saus sambal memiliki cita rasa yang pedas dan menjadi salah satu pelengkap untuk penyedap makanan, saus juga biasa dihidangkan untuk pelengkap cemilan. Selain menjadi pelengkap makanan dan cemilan, Saus juga bisa digunakan untuk bumbu masakan rumahan maupun di restaurant atau tempat makan lainnya agar lebih meningkatkan cita rasa yang lebih nikmat.', 1, 1, 3, 2, NULL, 1871, 2500, 2375, 'storage/app/image/FDl9dhS4skD3VXGjXk9P6CN3iNEsyDWkvFXcUzMb.png', 'SAMBAL PB 525GR   ', '2018-05-27 23:38:33', '2018-07-11 22:00:43'),
(73, 17102, 'KECAP PB KECAP BENTENG 600ML', 'Kecap benteng membuat makanan yang rasanya biasa saja menjadi luar biasa, kecap ini memiliki rasa manis yang enak tidak berlebihan dan teksturnya yang tidak terlalu kental namun tidak juga encer ', 1, 1, 3, 2, NULL, 11579, 15000, 14250, 'storage/app/image/e1mRcdBBClCu8PMSzl9qYiN62PbSuTaKGEzdudRP.png', 'KCP PB 600ML', '2018-05-27 23:39:06', '2018-07-11 22:01:03'),
(74, 17103, 'MAHKOTA SAUS SAMBAL 15X40 GR', 'Mahkota Saus Sambal memberikan rasa pedas yang khas juga menambah rasa pada masakan.', 1, 1, 3, 2, NULL, 4168, 5750, 5462.5, 'storage/app/image/jO11M9pLVK49gW9GDgDWtP9SIrHyxD9FtY0vFd67.png', 'SAMBAL MKT 15X40GR', '2018-05-27 23:39:42', '2018-07-31 20:36:57'),
(75, 16501, 'GARAM FLIPPER 200GR', 'Garam flipper adalah jenis garam yang dibuat dari bahan bermutu tinggi dan diolah dengan teknologi modern sehingga terjaga keaslian dan kebersihannya, bisa digunakan sebagai garam meja untuk menambah kelezatan masakan Anda', 1, 1, 3, 2, NULL, 1862, 2500, 2375, 'storage/app/image/Wd2T4jwAqSGHdRUbgo76D4By5HSKuUZsHaOrvpbo.png', 'GRM FLIPPER 200GR ', '2018-05-27 23:40:10', '2018-06-13 00:26:33'),
(76, 16801, 'FIESTA MITRA NUGGET 500GR', 'Fiesta mitra nugget adalah produk terbaik asli olahan dada ayam utuh yang terpilih berkualitas terbaik, diproses dengan cara di fillet dan di beri tepung berbumbu berkualitas tinggi memiliki tekstur lembut di dalam renyah di luar dan memiliki citarasa yang tinggi dimulut.', 1, 1, 4, 1, NULL, 35351, 41500, 39425, 'storage/app/image/HMPEk3leqhMuhjq9dTYl6h3kdXovqLEqDizwqHKI.png', 'NUGGET FST 500GR  ', '2018-05-28 00:45:25', '2018-07-31 20:33:55'),
(77, 16802, 'FIESTA MITRA SPICY WING 500GR', 'Fiesta spicy wing (daging sayap ayam berbumbu) harga murah, Ayam dengan bumbu spesial dan rasa yang enak khas fiesta. Penyajian hanya cukup di goreng. Penyajian yang sangat mudah dan rasa yang tidak diragukan lagi enaknya, menjadikan produk ini selalu menjadi best seller.\r\n', 1, 1, 4, 1, NULL, 43474, 51000, 48450, 'storage/app/image/j7FyPZ1hygIKzeH8DtkyzXJw2GwOrJPU7Dk1zPSd.png', 'SPC WING FST 500GR', '2018-05-28 00:46:06', '2018-06-11 09:53:02'),
(78, 16803, 'FIESTA MITRA STRIKIE 500GR', 'Terbuat dari daging dada ayam giling berbentuk stik.', 1, 1, 4, 1, NULL, 35351, 41500, 39425, 'storage/app/image/HMPEk3leqhMuhjq9dTYl6h3kdXovqLEqDizwqHKI.png', 'STRIKIE FST 500GR ', '2018-05-28 00:46:43', '2018-06-11 09:53:14'),
(79, 16804, 'CHAMP NUGGET 250GR', 'Terbuat dari ayam olahan yang dibalut dengan adonan tepung roti Cocok untuk sarapan, bekal anak sekolah ataupun catering Nugget Ayam yg Murah, Nikmat dan Bergizi', 1, 1, 4, 1, NULL, 14820, 17500, 16625, 'storage/app/image/ZVmLYfWhwDDJR7mqrh9DoUxUvwEp4GE1r0PHb4Zg.png', 'NUGGET CP 250GR   ', '2018-05-28 00:47:11', '2018-06-11 09:49:17'),
(80, 16805, 'CHAMP CHICKEN SAUSAGE 375GR', 'Terbuat dari daging ayam dengan aroma asap yang khas.', 1, 1, 4, 1, NULL, 13204, 15000, 14250, 'storage/app/image/FClywy10otfNC9FGzu647SofgQ2ncegemhCaENjU.png', 'CKN SAU CP 375GR  ', '2018-05-28 00:47:47', '2018-06-11 09:49:29'),
(81, 16806, 'CHAMP CHICKEN BALL 500GR', 'Baso terbuat dari daging ayam', 1, 1, 4, 1, NULL, 20052, 23500, 22325, 'storage/app/image/kCnfOtPuxRpRH2cJ8BBYccyvQvefBLm5C9rN1uTZ.png', 'CKN BALL CP 500GR ', '2018-05-28 00:48:12', '2018-06-11 09:49:46'),
(82, 16807, 'AKUMO CHICKEN NUGET 250GR', 'Nugget Ayam yg terbuat dari daging ayam pilihan dan higienis dan mempunyai rasa yg khas', 1, 1, 4, 1, NULL, 10881, 12750, 12112.5, 'storage/app/image/85F0U1IizLU4ciUzKbZYV6qDUJvakjhgncCwTfAz.png', 'NUGGET C AKM 250GR', '2018-05-28 00:49:35', '2018-07-31 20:32:03'),
(83, 16808, 'AKUMO CHICKEN NUGET 500GR', 'Nugget Ayam yg terbuat dari daging ayam pilihan dan higienis dan mempunyai rasa yg khas', 1, 1, 4, 1, NULL, 20851, 24500, 23275, 'storage/app/image/ZkLn7K5I6lF7rrusUc6XtJmVV8Gn1CSqqETpJ0Uh.png', 'NUGGET C AKM 500GR', '2018-05-28 00:50:47', '2018-07-31 20:32:26'),
(84, 16809, 'AKUMO CHICKEN STICK 250GR', 'Nugget Ayam yg terbuat dari daging ayam pilihan dan higienis dan mempunyai rasa yg khas', 1, 1, 4, 1, NULL, 10881, 12750, 12112.5, 'storage/app/image/IRIRIyB0gVbvr9hRhGIb2gkzMiVgfl8y6FksYuyp.png', 'CKN STK AKM 250GR ', '2018-05-28 00:51:28', '2018-07-31 20:32:18'),
(85, 16813, 'OKEY LONG CHICKEN SAUSAGE 500GR', 'Sosis Ayam panjang Bisa di goreng, direbus (dijadikan isian sup) atau dipanggang', 1, 1, 4, 1, NULL, 16937, 19950, 18952.5, 'storage/app/image/KtJJHzGBjtzE96k2zA3x38GY4aEuDjazNzpXWVuI.png', 'CKN SAU L OK 500GR', '2018-05-28 00:56:50', '2018-06-11 09:47:52'),
(86, 16814, 'OKEY CHICKEN STICK 500GR', 'Daging olahan ayam yang berbentuk stick, cocok untuk dijadikan cemilan dengan menggunakan mayonais, saus tomat atau saus sambal', 1, 1, 4, 1, NULL, 16714, 19750, 18762.5, 'storage/app/image/ndX2bx1Ko55yAYSzvcWRuVjoyFUh0pqyQgGyBjt3.png', 'CKN STICK OK 500GR', '2018-05-28 00:57:14', '2018-06-11 09:48:24'),
(87, 10301, 'DELLIS MERAH MAKARONI 1KG', 'Dellis Merah Makaroni kerupuk mentah untuk cemilan digoreng menggunakan minyak panas hasilnya akan mekar seperti kerupuk, jika ingin dibikin bantet makaroni digoreng dengan api kecil lalu taburi bubuk cabe kering plus penyedap rasa.', 1, 1, 8, 2, NULL, 10390, 13000, 12350, 'storage/app/image/Dw6CiqTu0oS2fV44Q44ZTBExobYMEFVFgrF3G0Tu.png', 'MAKARONI DM 1KG', '2018-05-28 00:58:26', '2018-07-31 19:14:29'),
(88, 14101, 'PUTRAKU KRP BAWANG 5KG', 'Putraku kerupuk bawang terbukti kualitas dan rasanya, kami menggunakan bahan kerupuk alami tanpa bahan pengawet dan bahan kimia lainnya sangat mudah dimasak dan tidak mudah keras serta basi', 1, 1, 8, 1, NULL, 64076, 71000, 67450, 'storage/app/image/ftOICsPRoXWQMnxegcpjy8KkxthrI8qqmnNlbiTN.png', 'KRUPUK BWG PK 5KG ', '2018-05-28 00:59:41', '2018-06-11 09:24:21'),
(89, 14102, 'PUTRAKU KRP GADO-GADO 5KG', 'Putraku kerupuk gado-gado yang cocok untuk camilan atau dipadukan dengan lauk lainnya, seperti nasi goreng, gado gado ataupun tahu petis.', 1, 1, 8, 1, NULL, 65654, 73000, 69350, 'storage/app/image/YQRRHf4YY2QIvxu9YHWiKAeUnRS2vuGEMm9HkmTA.png', 'KRUPUK GD PK 5KG  ', '2018-05-28 01:00:18', '2018-06-11 09:24:36'),
(90, 14103, 'PUTRAKU KRP SARI UDANG 5KG', 'Putraku kerupuk sari udang terbukti kualitas dan rasanya, kami menggunakan bahan kerupuk alami tanpa bahan pengawet dan bahan kimia lainnya sangat mudah dimasak dan tidak mudah keras serta basi', 1, 1, 8, 1, NULL, 64902, 72500, 68875, 'storage/app/image/ClvIoBh7EqMBasmK3u2Zmuw7qeb2yJQXynXWdK6H.png', 'KRUPUK SU PK 5KG  ', '2018-05-28 01:00:59', '2018-06-11 09:24:50'),
(91, 14104, 'PUTRAKU KRP MAWAR PUTIH 5KG', 'Putraku kerupuk mawar putih terbukti kualitas dan rasanya, kami menggunakan bahan kerupuk alami tanpa bahan pengawet dan bahan kimia lainnya sangat mudah dimasak dan tidak mudah keras serta basi', 1, 1, 8, 1, NULL, 76842, 85750, 81462.5, 'storage/app/image/Y81o8tMFvyKFvdoaoUuN9uYJnwGih7kPFBHXfnOl.png', 'KRUPUK MP PK 5KG  ', '2018-05-28 01:02:15', '2018-06-11 09:25:25'),
(92, 14105, 'PUTRAKU KRP MAWAR ORANGE 5KG', 'Putraku kerupuk mawar orange terbukti kualitas dan rasanya, kami menggunakan bahan kerupuk alami tanpa bahan pengawet dan bahan kimia lainnya sangat mudah dimasak dan tidak mudah keras serta basi', 1, 1, 8, 1, NULL, 76825, 85750, 81462.5, 'storage/app/image/QsBZoVJ4tSRzPlvEcgP79QGvA4DrS8yX9iZLQVFS.png', 'KRUPUK MO KP 5KG  ', '2018-05-28 01:02:42', '2018-06-11 09:25:38'),
(93, 14106, 'PUTRAKU POTATO CHIPS 5KG', 'Putraku Potato Chips terbuat dari bahan kerupuk alami tanpa bahan pengawet dan bahan kimia lainnya, sangat mudah digoreng dan bisa dijadikan cemilan bersantai bersama keluarga dirumah.', 1, 1, 8, 1, NULL, 79920, 89000, 84550, 'storage/app/image/aWpHcBbm8hMl9iuctiN7rhwN8SHd8fDfMDH2fk2d.png', 'POTATO CHIP PK 5KG', '2018-05-28 01:03:04', '2018-07-31 18:47:32'),
(94, 15201, 'KRUPUKKU UDANG 200GR', 'Krupukku udang , krupuk nikmat dan berkualitas terbuat dari bahan-bahan alami pilihan dan segarterbuat dari bahan-bahan alami. Segar dan tidak menggunakan bahan pengawet, pewarna, pemanis buatan, sehingga cocok dikonsumsi untuk keluarga.', 1, 1, 8, 2, NULL, 3597, 5000, 4750, 'storage/app/image/UIkEa5HUdVnge185JKmihJeUJ2tKG35BVbyrag67.png', 'KRUPUK UD KP 200GR', '2018-05-28 01:03:31', '2018-06-11 09:27:07'),
(95, 15202, 'KRUPUK IKAN 200GR', 'Krupukku ikan , krupuk nikmat dan berkualitas terbuat dari bahan-bahan alami pilihan dan segarterbuat dari bahan-bahan alami. Segar dan tidak menggunakan bahan pengawet, pewarna, pemanis buatan, sehingga cocok dikonsumsi untuk keluarga.', 1, 1, 8, 2, NULL, 3597, 5000, 4750, 'storage/app/image/PqtcoxljbLXLuqcZbOt9SfvF8sIBvaoagqw9Y89y.png', 'KRUPUK IK KP 200GR', '2018-05-28 01:04:00', '2018-06-11 09:28:35'),
(96, 15203, 'KRUPUKKU BAWANG 200GR', 'Krupukku bawang , krupuk nikmat dan berkualitas terbuat dari bahan-bahan alami pilihan dan segarterbuat dari bahan-bahan alami. Segar dan tidak menggunakan bahan pengawet, pewarna, pemanis buatan, sehingga cocok dikonsumsi untuk keluarga.', 1, 1, 8, 2, NULL, 3597, 5000, 4750, 'storage/app/image/HIrCqC5zgGmLXqkWemIiVeU0Pv2Uo1xRdyASdYVi.png', 'KRUPUK BG KP 200GR', '2018-05-28 01:04:58', '2018-06-11 09:28:50'),
(97, 12901, 'MAYA SARDEN TOMAT KECIL 155GR', 'Maya sarden tomat kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6131, 7300, 6935, 'storage/app/image/JXj1F301bS4kAfAkuErznknfL0GCYBMqN5iQsJyP.png', 'SARDEN TK MY 155GR', '2018-05-28 01:06:03', '2018-06-07 09:57:42'),
(98, 12902, 'MAYA SARDEN TOMAT BESAR 425GR', 'Maya sarden tomat kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 14368, 17500, 16625, 'storage/app/image/7MfruJycWEx5cRJMF0ayFZ2RdjuNBFH5ucnvefae.png', 'SARDEN TB MY 425GR', '2018-05-28 01:06:35', '2018-06-07 09:58:22'),
(99, 12903, 'MAYA SARDEN CHILLI KECIL 155GR', 'Maya sarden chilli kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6131, 7300, 6935, 'storage/app/image/goF0DGUXqZLUxAGyu7TNJ0KTO5wds0qBYZ5GhOOq.png', 'SARDEN CK MY 155GR', '2018-05-28 01:07:06', '2018-06-07 09:58:39'),
(100, 12904, 'MAYA SARDEN CHILLI BESAR 425GR', 'Maya sarden chilli kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 14314, 17500, 16625, 'storage/app/image/goF0DGUXqZLUxAGyu7TNJ0KTO5wds0qBYZ5GhOOq.png', 'SARDEN CB MY 425GR', '2018-05-28 01:07:44', '2018-06-07 10:00:18'),
(101, 12908, 'MAYA MARCKEREL KECIL 155GR', 'Mackerel kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan saat perlu makan dalam keadaan mendesak yang tidak memiliki banyak waktu untuk memasak, karena sangat praktis tinggal buka kaleng, hangatkan sebentar, dan ikan mungil dengan sausnya siap disantap. Kalau perlu dengan sedikit tambahan bawang merah dan bawang putih jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6370, 7850, 7457.5, 'storage/app/image/7MfruJycWEx5cRJMF0ayFZ2RdjuNBFH5ucnvefae.png', 'MARCKERE K MY 155G', '2018-05-28 01:08:15', '2018-07-31 18:54:33'),
(102, 12909, 'MAYA MECKEREL BESAR 425GR', NULL, 1, 1, 6, 1, NULL, 15965, 19650, 18667.5, 'storage/app/image/GooYoqlLIXR4Ab2TDeyOCLDb7CRtYJSyiHPrZans.png', 'MARCKER B MY 425GR', '2018-05-28 01:08:44', '2018-06-11 09:30:21'),
(103, 15801, 'SEDANI MAKARONI PIPA 1KG', 'SEDANI Makaroni Pipa adalah macaroni yang dibuat oleh Bogasari dengan harga yang lebih ekonomis. Terbuat dari semolina gandum dengan aneka bentuk macaroni. Cocok untuk menemani saat santai Anda bersama keluarga atau kerabat.', 1, 1, 7, 1, NULL, 12349, 14650, 13917.5, 'storage/app/image/fcE6eyH7IuWaX5l8arrLjEaH2U30mDbV3LoScxMJ.png', 'MAKARONI P SED 1KG', '2018-05-28 01:10:09', '2018-06-07 10:08:10'),
(104, 15802, 'SEDANI MAKARONI SPIRAL 1KG', 'Bentuknya spiral ya, biasanya untuk direbus, campuran sop n makaroni panggang. Kalau untuk digoreng tidak bisa mekar.', 1, 1, 7, 1, NULL, 12388, 14650, 13917.5, 'storage/app/image/RVGbNiR8wL0sXiGU7e4HZhthlMY97UvIgj86VRlx.png', 'MAKARONI S SED 1KG', '2018-05-28 01:10:39', '2018-06-07 10:08:31'),
(105, 15803, 'SEDANI MAKARONI KERANG 1KG', 'Sedani Makaroni Pilihan Berbentuk Kerang Netto 1 Kg dibuat dari gandum pilihan yang berkualitas sehingga membuat teksturnya tidak mudah hancur dengan rasa yang lezat dan dijamin Halal.', 1, 1, 7, 1, NULL, 12374, 14650, 13917.5, 'storage/app/image/bbQgBij2tBv7wDZeCfw9CUZqHSJVdAFjnmeYKUII.png', 'MAKARONI K SED 1KG', '2018-05-28 01:11:19', '2018-06-07 10:08:56'),
(106, 10701, 'TANAM JAGUNG BIHUN 70GR', 'Bihun jagung cap tanam jagung sangat cocok untuk anda penyuka makanan bihun dengan tekstur yang lembut dan menarik', 1, 1, 7, 2, NULL, 1230, 1900, 1805, 'storage/app/image/ckeqrstA7po7wm4W3frEp8h2tjl9sGcbYwzzmgMY.png', 'BIHUN TNM JG 70GR ', '2018-05-28 01:11:58', '2018-06-11 09:32:12'),
(107, 10702, 'TANAM JAGUNG BIHUN 160GR', 'Bihun jagung cap tanam jagung sangat cocok untuk anda penyuka makanan bihun dengan tekstur yang lembut dan menarik', 1, 1, 7, 2, NULL, 2571, 3700, 3515, 'storage/app/image/jxOm2ih3u16GbwXwHArumkcjltuv9eIXSV7i1lWX.png', 'BIHUN TNM JG 160GR', '2018-05-28 01:12:24', '2018-06-11 09:31:49'),
(108, 10703, 'TANAM JAGUNG BIHUN 320GR', 'Bihun jagung cap tanam jagung sangat cocok untuk anda penyuka makanan bihun dengan tekstur yang lembut dan menarik', 1, 1, 7, 2, NULL, 4405, 6300, 5985, 'storage/app/image/bfVPmqdKzpHpBPzKo6X9y9mhM5dsTP9FjrPmw0uc.png', 'BIHUN TNM JG 320GR', '2018-05-28 01:12:57', '2018-06-11 09:32:02'),
(109, 10706, 'SUBAMIE MIE KERING 180GR', 'Subamie Terbuat Dari Tepung Terigu, Tepung Tapioka Dan Pati Jagung. Yang Membuat Subamie Berbeda Adalah Ada Campuran Pati Jagung Di Dalamnya Sehingga Subamie Menjadi Lebih Kenyal Dari Mie Kering Lain Yang Beredar Di Pasaran. ', 1, 1, 7, 2, NULL, 3101, 4500, 4275, 'storage/app/image/DOy3DIZ4lt36Z1TgwutSEjxdh1VlPmgkFQwhuL32.png', 'MIE KRNG SB 180GR', '2018-05-28 01:13:26', '2018-06-11 10:06:36'),
(110, 10812, 'SEDANI SPAGHETTI 1KG', 'SEDANI Makaroni Pipa adalah macaroni yang dibuat oleh Bogasari dengan harga yang lebih ekonomis. Terbuat dari semolina gandum dengan aneka bentuk macaroni. Cocok untuk menemani saat santai Anda bersama keluarga atau kerabat.', 1, 1, 7, 1, NULL, 15863, 18900, 17955, 'storage/app/image/e6Tk6zPEX1lQSi1cO6aceIyzjInHchyk0bbyYiCB.png', 'SPAGHETTI SD 1KG  ', '2018-05-28 01:13:55', '2018-06-07 10:11:45'),
(111, 10814, 'LA FONTE MACARONI GOBBETI 225 GR', 'Pasta sehat untuk keluarga Indonesia, Kualitas La Fonte terjamin, harga ekonomis, mudah disajikan, tanpa bahan pewarna dan bahan pengawet, kandungan protein dan serat yang tinggi, tidak mudah hancur saat dipanaskan maupun dimasak.', 1, 1, 7, 1, NULL, 4979, 5900, 5605, 'storage/app/image/ZmSA5XehUIe21UYwm4HBwsGCIi5j4NQNENvJVE4e.png', 'PASTA MGO LF 255GR', '2018-05-28 01:14:20', '2018-06-11 09:40:06'),
(112, 10816, 'LA FONTE SPAGHETTI SAUS BOLOGNESE 117GR', 'LA FONTE Spaghetti Saus Bolognese merupakan spaghetti saus bolognese yang terbuat dari bahan gandum durum pilihan dengan kandungan protein tinggi, rendah lemak dan ekstra serat. Dilengkapi dengan bumbu dan bahan yang kaya cita rasa. Memiliki tekstur kenyal sehingga membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Cocok untuk menemani saat santai Anda bersama keluarga atau kerabat.', 1, 1, 7, 1, NULL, 4542, 5450, 5177.5, 'storage/app/image/6tEnE7TNbAw4IM3V1JHKog6Q5ijNL5e2bEjLGO41.png', 'SPGTI SB LF 117GR', '2018-05-28 01:14:46', '2018-06-07 10:12:44'),
(113, 10817, 'LA FONTE SPAGHETTI SAUS AYAM 117GR', 'LA FONTE Spaghetti Saus Ayam merupakan spaghetti saus ayam yang terbuat dari bahan gandum durum pilihan dengan kandungan protein tinggi, rendah lemak dan ekstra serat. Dilengkapi dengan bumbu dan bahan yang kaya cita rasa. Memiliki tekstur kenyal sehingga membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Cocok untuk menemani saat santai Anda bersama keluarga atau kerabat', 1, 1, 7, 1, NULL, 3953, 4750, 4512.5, 'storage/app/image/daJmqowmEcPyBwIlnAF9iQRly3Rx67Na93n6slnD.png', 'SPGTI SA LF 117GR', '2018-05-28 01:15:17', '2018-06-07 10:13:07'),
(114, 10818, 'LA FONTE PAZTO KEJU 70GR', 'La Fonte Pazto Keju merupakan pasta yang praktis dan mudah disajikan hanya dalam 4 menit dan sudah dilengkapi dengan bumbu yang kaya rasa. Terbuat dari semolina gandum pilihan dengan tekstur yang kenyal dan tidak mudah hancur. Hidangan pasta yang nikmat dan enak, bisa digunakan untuk berbagai campuran masakan. Menjadi bahan makanan praktis untuk santapan yang sehat. Terbuat dari gandum pilihan terbaik. Tinggi kandungan protein dan ekstra serat.', 1, 1, 7, 1, NULL, 3640, 4350, 4132.5, 'storage/app/image/JluFB2AgosJA8U2juSFMl4Lscrj8GmZeRJtotHl0.png', 'PAZTO KEJU LF 70GR', '2018-05-28 01:15:44', '2018-06-07 10:13:34'),
(115, 10819, 'LA FONTE SAUS PASTA BOLOGNESE 315GR', 'La Fonte Saus Pasta Bolognese adalah saus pasta yang dibuat dari tomat segar dengan paduan rempah-rempah pilihan, serta komposisi seimbang, sehingga menghasilkan rasa khas yang menyatu bersama pasta. Dilengkapi daging cincang untuk menambah nikmat sajian pasta Anda. Ideal dipadu padankan dengan semua jenis pasta.', 1, 1, 7, 1, NULL, 12824, 15250, 14487.5, 'storage/app/image/C2P3LbqmUiIfQyqnWE6wtXIw6O8mYX2idf03M1Y6.png', 'S PASTA B LF 315GR', '2018-05-28 01:16:45', '2018-06-07 10:14:17'),
(116, 10820, 'LA FONTE SAUS PASTA BARBEQUE 280GR', 'La Fonte Saus Pasta Berbeque merupakan saus pasta yang dihasilkan dari bahan dan rempah-rempah berkualitas tinggi, sehingga menghasilkan cita rasa yang berbeda. Saus ini dapat langsung dinikmati bersama spaghetti yang telah siap dimakan, sehingga dapat dinikmati di sela-sela aktivitas Anda. Saus pasta yang lezat ini akan menjadi paket kenikmatan yang sangat berharga bersama La Fonte Spaghetti apapun. Rasakan kelezatan La Fonte Saus Pasta dengan rasa barbeque dengan sepiring spaghetti setiap harinya', 1, 1, 7, 1, NULL, 14176, 16800, 15960, 'storage/app/image/YaQvwkRoIMlTdVLoKqSsnK2OCWOpC88OuWcHkrJd.png', 'S PASTA Q LF 280GR', '2018-05-28 01:17:11', '2018-06-07 10:14:38'),
(117, 13009, 'AYAM 2T MIE 200GR', 'Mie ayam 2T Bebas kolesterol karena proses pengeringan dilakukan tanpa proses penggorengan, juga bisa digunakan untuk menyajikan sup mie tasti atau mie goreng lezat', 1, 1, 7, 2, NULL, 3147, 5500, 5225, 'storage/app/image/xRQ0Hf8qOZDt9RggZuRrP1iCuefSvntevSoszrTg.png', 'AYAM 2T MIE 200GR', '2018-05-28 01:17:52', '2018-06-11 09:38:05'),
(118, 13010, 'AYAM 2T MIE LEBAR 200GR', 'Mie Ayam 2T Lebar Bebas kolesterol karena proses pengeringan dilakukan tanpa proses penggorengan, juga bisa digunakan untuk menyajikan sup mie tasti atau mie goreng lezat', 1, 1, 7, 2, NULL, 3144, 5500, 5225, 'storage/app/image/fEHG1Qufo8oUPlYXnKzLKsDkO83jLIHlzerU4DYD.png', 'AYM 2T MIE L 200GR', '2018-05-28 01:18:18', '2018-06-11 09:38:22'),
(119, 13011, 'AYAM 2T MIE LEBAR RCG 135GR', 'Bebas kolesterol karena proses pengeringan dilakukan tanpa proses penggorengan, juga bisa digunakan untuk menyajikan sup mie tasti atau mie goreng lezat', 1, 1, 7, 2, NULL, 2136, 4000, 3800, 'storage/app/image/oxsW0CyKLhfXtCmjQdbdDJNUaPJSAc3q3NlyQUoS.png', 'AYM 2T MI LR 135GR', '2018-05-28 01:18:46', '2018-06-11 09:38:36'),
(120, 13012, 'AYAM 2T MIE RCG 135GR', 'Bebas kolesterol karena proses pengeringan dilakukan tanpa proses penggorengan, juga bisa digunakan untuk menyajikan sup mie tasti atau mie goreng lezat', 1, 1, 7, 2, NULL, 2136, 4000, 3800, 'storage/app/image/l8gT1MR6y2jCiVzGTdaTtjWcB1EOlHRNz8tzl5rf.png', 'AYM 2T MIE R 135GR', '2018-05-28 01:19:24', '2018-06-11 09:38:52'),
(121, 13018, 'BIHUNKU INSTANT AYAM BAWANG 55GR', 'Bihun dengan rasa Ayam Bawang dengan kombinasi ayam serta rasa khas bawang.Makanan instan yang sehat dan bergizi. Dengan rasa yang sedap dan fresh,Pilihan tepat untuk bersantap di tengah kesibukan ataupun saat bersantai dengan kerabat dan rekanan', 1, 1, 7, 2, NULL, 1628, 2300, 2185, 'storage/app/image/flURBBI4xpKZPavJvbaFLujtdZvVQRFBi0DXhxne.png', 'BHN AYAM BWG 55GR ', '2018-05-28 01:20:10', '2018-06-11 09:36:12'),
(122, 13019, 'BIHUNKU INSTANT SOTO SPESIAL 55GR', 'Bihun dengan rasa Soto Spesial dengan perpaduan rasa gurih dan segarnya jeruk nipisMakanan instan yang sehat dan bergizi. Dengan rasa yang sedap dan fresh,Pilihan tepat untuk bersantap di tengah kesibukan ataupun saat bersantai dengan kerabat dan rekanan', 1, 1, 7, 2, NULL, 1628, 2300, 2185, 'storage/app/image/jUIq3EzZQlpGa4I67lQ1AVvdefuBwxOd9qqF4Pgs.png', 'BHN SOTO SPES 55GR', '2018-05-28 01:21:07', '2018-06-11 09:36:25'),
(123, 13020, 'BIHUNKU INSTANT GORENG SPESIAL 60GR', 'Bihun dengan rasa Goreng Spesial dengan rasa manis dicampur racikan bumbu spesial rahasia.Makanan instan yang sehat dan bergizi. Dengan rasa yang sedap dan fresh,Pilihan tepat untuk bersantap di tengah kesibukan ataupun saat bersantai dengan kerabat dan rekanan', 1, 1, 7, 2, NULL, 1877, 2650, 2517.5, 'storage/app/image/dMeNHCUgTKOo2Ot4Y0JvVGLiLTIHtnzPqVYIgs9Q.png', 'BHN GRG SPES 60GR ', '2018-05-28 01:21:54', '2018-06-11 09:37:11'),
(124, 13504, 'PROTEINA LX 250GR', NULL, 1, 1, 7, 2, NULL, 5551, 8000, 7600, 'storage/app/image/UkBND7QsiWFh6pxSB3FDomj8mWlyoALCFj2tkBpg.png', 'PROTEINA LX 250GR ', '2018-05-28 01:22:26', '2018-06-11 09:40:45'),
(125, 15804, 'LA FONTE SPAGHETTI:11 450GR', 'La Fonte spaghetti dibuat dengan tradisi khas Italia menggunakan gandum durum pilihan yang memiliki warna kuning asli biji gandum dan tekstur yang tidak mudah hancur. La Fonte pilihan keluarga dan ahli memasak', 1, 1, 7, 1, NULL, 10941, 12950, 12302.5, 'storage/app/image/ssijXEi8AxXq3KwWUpWtaEetv4WFMvLz3kdpnHzV.png', 'SPGTI:11 LF 450GR ', '2018-05-28 01:22:58', '2018-06-12 23:28:47'),
(126, 15805, 'LA FONTE SPAGHETTI:10 225GR', 'La Fonte spaghetti dibuat dengan tradisi khas Italia menggunakan gandum durum pilihan yang memiliki warna kuning asli biji gandum dan tekstur yang tidak mudah hancur. La Fonte pilihan keluarga dan ahli memasak', 1, 1, 7, 1, NULL, 5818, 7100, 6745, 'storage/app/image/CSzhxh3a3HLdCBAg9MgtAwxe1eJDFCUoG6ta8xy0.png', 'SPGTI:10 LF 225GR ', '2018-05-28 01:23:24', '2018-06-12 23:46:52'),
(127, 15806, 'LA FONTE FETTUCCINE 225GR', 'La Fonte Fettuccine merupakan pasta sehat yang terbuat dari gandum pilihan, memiliki kandungan protein yang tinggi namun rendah lemak dan ekstra serat. Testurnya yang kenyal membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Rasakan pasta lembut yang nikmat dan istimewa ini bersama keluarga, teman, dan orang terdekat Anda. Bahan dan kandungannya yang sehat dan bergizi, membuat La Fonte Fettuccine aman untuk dikonsumsi.', 1, 1, 7, 1, NULL, 5761, 6850, 6507.5, 'storage/app/image/WpFlFRB6fF3reV2e7JviJyFsQBd7QW86IYxjClBQ.png', 'FETTUCINE LF 225GR', '2018-05-28 01:23:55', '2018-06-07 10:17:16'),
(128, 15807, 'LA FONTE ELBOW MACARONI 225GR', 'La fonte elbow macaroni pasta yang praktis dan mudah disajikan hanya dalam 4 menit, sudah dilengkapi dengan bumbu yang kaya rasa dapat digunakan untuk berbagai campuran masakan, terbuat dari semolina gandum pilihan dengan tekstur yang kenyal dan tidak mudah hancur, menjadi bahan makanan praktis untuk santapan yang sehat, tinggi kandungan protein dan ekstra serat ', 1, 1, 7, 1, NULL, 4921, 5850, 5557.5, 'storage/app/image/pEU8iXImGVd6tUKyICSbynVyrxqFdjSgLbBhxa6b.png', 'MAC ELB LF 225GR  ', '2018-05-28 01:24:21', '2018-06-07 10:17:38'),
(129, 15808, 'LA FONTE FETTUCINE 450GR', 'La Fonte Fettuccine merupakan pasta sehat yang terbuat dari gandum durum pilihan, memiliki kandungan protein yang tinggi namun rendah lemak dan ekstra serat. Testurnya yang kenyal membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Rasakan pasta lembut yang nikmat dan istimewa ini bersama keluarga, teman, dan orang terdekat Anda. Bahan dan kandungannya yang sehat dan bergizi, membuat La Fonte Fettuccine aman untuk dikonsumsi.', 1, 1, 7, 1, NULL, 11579, 13750, 13062.5, 'storage/app/image/hwJCKYMUjV2r0V3LVfGP7G6uiQsPZdF3APmBI2TM.png', 'FETTUCINE LF 450GR', '2018-05-28 01:24:59', '2018-06-07 10:17:58'),
(130, 15809, 'LA FONTE SPIRAL MACARONI 225GR', 'Terbuat dari gandum pilihan terbaik La Fonte Spiral Macaroni sehat, lezat, dan praktis. La Fonte Spiral Macaroni sangat mudah disajikan dalam sekejab. Membuat hidangan pasta yang nikmat dan enak Bisa digunakan untuk berbagai campuran masakan Menjadi bahan makanan praktis untuk santapan sehat.', 1, 1, 7, 1, NULL, 5153, 6200, 5890, 'storage/app/image/4Be1rUin57kqTThyfDxyFgctQvKeCOYn1kUpRd4u.png', 'SPIRAL MC LF 225GR', '2018-05-28 01:25:19', '2018-06-07 10:18:25'),
(131, 15810, 'LA FONTE SPAGHETTI SAUS JAMUR 117GR', 'LA FONTE Spaghetti Saus Jamur merupakan spaghetti saus jamur yang terbuat dari bahan gandum durum pilihan dengan kandungan protein tinggi, rendah lemak dan ekstra serat. Dilengkapi dengan bumbu dan bahan yang kaya cita rasa. Memiliki tekstur kenyal sehingga membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Cocok untuk menemani saat santai anda bersama keluarga atau kerabat.', 1, 1, 7, 1, NULL, 3956, 4900, 4655, 'storage/app/image/FQdTHkyrDQSGEQpk22c79CqPGJMlkEdEFAMzr3Su.png', 'SPGTI SJ LF 117GR', '2018-05-28 01:25:45', '2018-06-07 10:18:48'),
(132, 16401, 'INDOMIE GORENG 85GR', 'Indomie goreng merupakan mie instan tanpa kuah, Setiap kemasan Mi Goreng berisi 2 bumbu sachet, yang terdiri dari bumbu dalam bentuk \"bubuk\" dan \"cair\". Sachet pertama terbagi menjadi 3 bagian yang terdiri dari: kecap manis, saus cabe dan minyak bumbu. Sachet kedua terbagi menjadi 2: bumbu dalam bentuk bubuk dan bawang goreng.', 1, 1, 7, 1, NULL, 2163, 2450, 2327.5, 'storage/app/image/VnESMAEwy7Ivf49aoNlkQdMvT4IHeonouyTAH6Vx.png', 'INDOMIE GRG 85GR  ', '2018-05-28 01:26:10', '2018-07-11 22:01:37'),
(133, 16402, 'INDOMIE AYAM BAWANG 69GR', 'Indomie kuah ayam bawang merupakan salah satu varian yang rasanya khusus diambil dari bumbu-bumbu makanan khas Indonesia. Perpaduan antara mi, kuah dan bumbu otentik makanan khas Indonesia menjadikan Indomie kuah makanan yang sangat spesial apalagi bila disajikan dikala cuaca dingin atau hujan.', 1, 1, 7, 1, NULL, 2056, 2300, 2185, 'storage/app/image/ryUsgfCtXxdy3ttXMqV0Jw2NPxMNxKenE33FGi9e.png', 'INDOMIE AYM B 69GR', '2018-05-28 01:26:33', '2018-07-11 22:05:40');
INSERT INTO `product` (`id`, `sku`, `product_name`, `description`, `store_id`, `tax_id`, `category_id`, `incentive_id`, `shelf`, `cost`, `price_for_customer`, `price_for_agen`, `img_url`, `alias`, `created_at`, `updated_at`) VALUES
(134, 16403, 'INDOMIE SOTO 85GR', 'Indomie kuah Soto merupakan salah satu varian yang rasanya khusus diambil dari bumbu-bumbu makanan khas Indonesia. Perpaduan antara mi, kuah dan bumbu otentik makanan khas Indonesia menjadikan Indomie kuah makanan yang sangat spesial apalagi bila disajikan dikala cuaca dingin atau hujan.', 1, 1, 7, 1, NULL, 2046, 2300, 2185, 'storage/app/image/AyjY5Tsy795lORtfaQLmV3tFgy4DSig0f39PJuix.png', 'INDOMIE SOTO 85GR ', '2018-05-28 01:26:55', '2018-07-11 22:04:47'),
(135, 16404, 'INDOMIE KARI AYAM 85GR', 'Indomie kuah kari merupakan salah satu varian yang rasanya khusus diambil dari bumbu-bumbu makanan khas Indonesia. Perpaduan antara mi, kuah dan bumbu otentik makanan khas Indonesia menjadikan Indomie kuah makanan yang sangat spesial apalagi bila disajikan dikala cuaca dingin atau hujan.', 1, 1, 7, 1, NULL, 2219, 2500, 2375, 'storage/app/image/3NFvDSOzG4PpfpiUmvy95hUdv49YLmT7wHchubN6.png', 'INDOMIE KARI 85GR ', '2018-05-28 01:27:29', '2018-07-11 22:04:36'),
(136, 16507, 'SARIWANGI TEH 25\'S BOX', 'Terbuat dari teh hitam yang diproses secara alami, dikeringkan tanpa menggunakan bahan pewarna atau pengawet, memberikan warna, rasa dan aroma the yang berkualitas tinggi kaya akan flavonoid yang dapat membantu kesehatan jantung ', 1, 1, 2, 1, NULL, 4969, 5600, 5320, 'storage/app/image/a4hAXG4bRZqAQLZFlcLsmEiRDK9k80Je7RFF8bL0.png', 'TEH SARIWANGI 25BX', '2018-05-28 01:28:01', '2018-06-11 09:34:46'),
(137, 16508, 'ABC KOPI SUSU 31GR', 'ABC Kopi Susu adalah perpaduan antara kopi mantap, gula, dan susu nikmat yang diproses secara modern. Kopi komplit dalam kemasan praktis yang langsung dapat dinikmati. Seduh dengan air panas dan nikmati hari anda bersama ABC Kopi Susu', 1, 1, 2, 1, NULL, 1063, 1250, 1187.5, 'storage/app/image/gbHDMpg3S9gJEvcYqZoNd2iXy0msuY7mP6FC9g4i.png', 'KOPI SUSU ABC 31GR', '2018-05-28 01:28:24', '2018-06-07 10:19:36'),
(138, 16513, 'KAPAL API SPC MIX 25GR', 'Kapal Api Special Mix Kopi adalah kopi special mix yang terbuat dari biji kopi pilihan dengan menggunakan teknologi canggih, sehinnga menghasilkan rasa & aroma kopi yang nikmat', 1, 1, 2, 1, NULL, 1005, 1200, 1140, 'storage/app/image/Uxi1XrNMDa4wpWSBUdoXgUz1jC8FwbQtIP0gwfYb.png', 'KOPI KA SP MX 25GR', '2018-05-28 01:28:45', '2018-06-11 09:34:24'),
(139, 16525, 'ENAAK SKM PUTIH 370GR', 'Susu Kental Manis Enaak  mengandung zat gizi makro (zat gizi penting: protein, karbohidrat dan lemak) dan zat gizi mikro (multi vitamin dan mineral) untuk melengkapi asupan gizi keluarga dan mendukung aktivitas keluarga sepanjang hari.', 1, 1, 2, 1, NULL, 7749, 8800, 8360, 'storage/app/image/RvBk0wf7IxWswSQmlAYiN6DtoKElnqKI3EOEqzcZ.png', 'SUSU P ENAAK 370GR', '2018-05-28 01:29:11', '2018-07-11 22:05:20'),
(140, 16504, 'WHITE COFEE LUWAK 20GR', 'LUWAK White Koffie merupakan white coffee yang terbuat dari kombinasi krimer non susu dan gula murni dengan kopi luwak pilihan, dihasilkan dari biji kopi terbaik. Luwak Coffee diolah melalui proses fermentasi, teknik perkebunan, dan teknik pemanggangan yang unik dengan teknologi paling modern sehingga menghasilkan cita rasa yang khas dan nikmat. Luwak White Koffie juga dihasilkan melalui proses pembekuan dalam suhu -40 derajat celcius yang dapat menghilangkan asam lambung dengan tetap mempertahankan kafein di dalamnya, sehingga aman untuk Anda yang menyukai kopi.', 1, 1, 2, 1, NULL, 990, 1250, 1187.5, 'storage/app/image/YM28LTnoCJFg0HdpUHWsOsABD70uj1JwIEWZmDZb.png', 'WHT COFFE LWK 20GR', '2018-05-28 01:29:44', '2018-06-11 09:32:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Bahan Pokok', '', '2018-05-24 21:55:33', '2018-05-24 21:55:33'),
(2, 'Minuman', '', '2018-05-24 21:55:40', '2018-05-24 21:55:40'),
(3, 'Bumbu Dapur', '', '2018-05-24 21:55:49', '2018-05-24 21:55:49'),
(4, 'Makanan Beku', '', '2018-05-24 21:56:01', '2018-05-24 21:56:01'),
(5, 'Kerupuk', '', '2018-05-24 21:56:09', '2018-05-24 21:56:09'),
(6, 'Makanan Kaleng', '', '2018-05-24 21:56:16', '2018-05-24 21:56:16'),
(7, 'Mie, Pasta & Bihun', '', '2018-05-24 21:56:21', '2018-05-24 21:56:21'),
(8, 'Makanan Pelengkap', '', '2018-05-24 21:56:26', '2018-05-24 21:56:26'),
(15, 'BERAS', '', '2018-05-24 22:00:11', '2018-05-24 22:00:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `progress_status`
--

CREATE TABLE `progress_status` (
  `id` int(11) UNSIGNED NOT NULL,
  `progress_name` varchar(150) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `progress_status`
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
-- Struktur dari tabel `promo`
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
-- Struktur dari tabel `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` int(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order_cancel`
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
-- Struktur dari tabel `purchase_order_detail`
--

CREATE TABLE `purchase_order_detail` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `agen_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` varchar(150) NOT NULL,
  `notes` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rating`
--

INSERT INTO `rating` (`id`, `order_id`, `agen_id`, `customer_id`, `rating`, `notes`, `created_at`, `updated_at`) VALUES
(5, 95, 64, 63, '4.0', 'Tes android', '2018-07-10 00:01:44', '2018-07-08 06:57:54'),
(6, 96, 1, 71, '5.0', 'Pelayanan sangat cepat', '2018-07-10 03:25:42', '2018-07-10 03:25:42'),
(7, 111, 1, 47, '5.0', 'testing', '2018-07-28 18:31:43', '2018-07-28 18:31:43'),
(8, 97, 64, 63, '5.0', 'test', '2018-07-28 19:51:24', '2018-07-28 19:51:24'),
(9, 157, 102, 120, '5.0', '', '2018-07-31 03:11:26', '2018-07-31 03:11:26'),
(10, 241, 102, 120, '5.0', '', '2018-08-01 03:20:10', '2018-08-01 03:20:10'),
(11, 247, 102, 120, '5.0', '', '2018-08-01 03:24:44', '2018-08-01 03:24:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `receipt`
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
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2017-11-20 06:46:35', '0000-00-00 00:00:00'),
(2, 'Customer', 'manager', '2017-11-20 06:46:51', '0000-00-00 00:00:00'),
(3, 'Supervisor', 'supervisor', '2017-11-20 06:47:23', '0000-00-00 00:00:00'),
(4, 'Kasir', 'kasir', '2017-11-20 06:47:32', '2017-11-20 06:47:42'),
(5, 'Agen', 'agen', '2017-11-20 06:48:00', '0000-00-00 00:00:00'),
(6, 'Member', 'member', '2017-11-20 06:48:00', '0000-00-00 00:00:00'),
(7, 'Manager', 'customer', '2017-11-20 06:48:00', '0000-00-00 00:00:00'),
(8, 'Stock Keeper', 'Stock Keeper', '2018-07-28 20:53:39', '0000-00-00 00:00:00'),
(9, 'Approver', 'Approver', '2018-07-28 20:53:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `page` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock`
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
-- Dumping data untuk tabel `stock`
--

INSERT INTO `stock` (`id`, `store_id`, `product_id`, `category_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, 6, NULL, 0, NULL, '2018-08-01 07:39:13', '2018-04-17 23:20:08'),
(4, 1, 8, NULL, 0, NULL, '2018-08-01 07:39:18', '2018-04-17 23:23:23'),
(5, 1, 9, NULL, 0, NULL, '2018-08-01 07:39:20', '2018-04-17 23:42:29'),
(6, 1, 10, NULL, 0, NULL, '2018-08-01 07:39:22', '2018-04-18 02:46:56'),
(7, 1, 11, NULL, 23, NULL, '2018-05-24 06:42:05', '2018-05-24 06:42:05'),
(8, 1, 12, NULL, 50, NULL, '2018-05-24 06:43:33', '2018-05-24 06:43:33'),
(9, 1, 13, NULL, 20, NULL, '2018-08-01 04:09:59', '2018-06-19 02:41:00'),
(10, 1, 14, NULL, 3, NULL, '2018-08-01 04:10:13', '2018-07-02 00:22:04'),
(11, 1, 15, NULL, 98, NULL, '2018-07-02 01:55:46', '2018-07-02 01:55:46'),
(12, 1, 16, NULL, -1, NULL, '2018-08-01 01:43:01', '2018-08-01 01:43:01'),
(13, 1, 17, NULL, 207, NULL, '2018-07-31 13:54:16', '2018-06-19 02:41:21'),
(14, 1, 18, NULL, 239, NULL, '2018-07-31 11:55:01', '2018-06-19 02:41:30'),
(15, 1, 19, NULL, 99, NULL, '2018-07-31 11:55:20', '2018-06-19 02:41:33'),
(16, 1, 20, NULL, 93, NULL, '2018-07-31 11:59:48', '2018-07-02 00:18:57'),
(17, 1, 21, NULL, 293, NULL, '2018-07-31 13:37:54', '2018-06-19 02:41:38'),
(18, 1, 22, NULL, 100, NULL, '2018-06-19 09:41:44', '2018-06-19 02:41:44'),
(19, 1, 23, NULL, 64, NULL, '2018-08-02 07:40:35', '2018-05-27 22:58:17'),
(20, 1, 23, NULL, 0, NULL, '2018-08-01 07:39:32', '2018-07-27 06:19:16'),
(21, 1, 24, NULL, 102, NULL, '2018-08-01 22:40:26', '2018-08-01 22:40:26'),
(22, 1, 25, NULL, 240, NULL, '2018-07-31 14:27:21', '2018-05-27 23:02:02'),
(23, 1, 26, NULL, 99, NULL, '2018-08-02 03:56:21', '2018-08-02 03:56:21'),
(24, 1, 27, NULL, 68, NULL, '2018-07-31 14:29:40', '2018-07-02 00:21:29'),
(25, 1, 28, NULL, 0, NULL, '2018-08-01 07:39:37', '2018-05-27 23:05:17'),
(26, 1, 29, NULL, 0, NULL, '2018-08-01 07:39:38', '2018-05-27 23:06:04'),
(27, 1, 30, NULL, 0, NULL, '2018-08-01 07:39:40', '2018-05-27 23:06:50'),
(28, 1, 31, NULL, 366, NULL, '2018-07-31 10:04:32', '2018-05-27 23:08:18'),
(29, 1, 32, NULL, 89, NULL, '2018-07-31 10:13:02', '2018-07-31 03:13:02'),
(30, 1, 33, NULL, 0, NULL, '2018-08-01 07:39:43', '2018-05-27 23:11:25'),
(31, 1, 34, NULL, 0, NULL, '2018-08-01 07:39:44', '2018-05-27 23:12:20'),
(32, 1, 35, NULL, 78, NULL, '2018-07-31 11:41:30', '2018-05-27 23:12:58'),
(33, 1, 36, NULL, 59, NULL, '2018-07-31 11:41:46', '2018-05-27 23:13:41'),
(34, 1, 37, NULL, 294, NULL, '2018-07-31 11:43:59', '2018-05-27 23:14:37'),
(35, 1, 38, NULL, 97, NULL, '2018-07-01 23:15:31', '2018-07-01 23:15:31'),
(36, 1, 39, NULL, 259, NULL, '2018-08-02 01:28:39', '2018-08-02 01:28:39'),
(37, 1, 40, NULL, 99, NULL, '2018-07-31 16:59:42', '2018-05-27 23:16:49'),
(38, 1, 41, NULL, 186, NULL, '2018-07-31 16:59:59', '2018-05-27 23:17:20'),
(39, 1, 42, NULL, 49, NULL, '2018-07-31 17:02:50', '2018-05-27 23:17:48'),
(40, 1, 43, NULL, 2052, NULL, '2018-07-31 09:56:41', '2018-05-27 23:18:39'),
(41, 1, 44, NULL, 72, NULL, '2018-07-31 09:58:47', '2018-07-31 02:35:19'),
(42, 1, 45, NULL, 114, NULL, '2018-07-31 09:59:17', '2018-05-27 23:20:34'),
(43, 1, 46, NULL, 846, NULL, '2018-07-31 10:03:26', '2018-05-27 23:22:15'),
(44, 1, 47, NULL, 0, NULL, '2018-08-01 07:39:49', '2018-05-27 23:23:53'),
(45, 1, 48, NULL, 0, NULL, '2018-08-01 07:39:50', '2018-05-27 23:24:45'),
(46, 1, 49, NULL, 350, NULL, '2018-07-31 11:35:44', '2018-07-02 00:37:41'),
(47, 1, 50, NULL, 280, NULL, '2018-07-31 11:36:09', '2018-07-02 00:37:41'),
(48, 1, 51, NULL, 280, NULL, '2018-07-31 11:36:29', '2018-05-27 23:26:42'),
(49, 1, 52, NULL, 29, NULL, '2018-07-31 11:36:54', '2018-07-02 00:37:41'),
(50, 1, 53, NULL, 30, NULL, '2018-07-31 11:38:21', '2018-05-27 23:28:06'),
(51, 1, 54, NULL, 10, NULL, '2018-07-31 11:38:37', '2018-05-27 23:28:42'),
(52, 1, 55, NULL, 22, NULL, '2018-07-31 14:59:29', '2018-05-27 23:29:15'),
(53, 1, 56, NULL, 834, NULL, '2018-07-31 14:59:58', '2018-07-01 23:36:30'),
(54, 1, 57, NULL, 100, NULL, '2018-06-19 09:43:10', '2018-05-27 23:30:16'),
(55, 1, 58, NULL, 159, NULL, '2018-07-31 16:56:05', '2018-05-27 23:30:47'),
(58, 1, 61, NULL, 30, NULL, '2018-07-31 17:06:23', '2018-05-27 23:32:29'),
(59, 1, 62, NULL, 0, NULL, '2018-08-01 07:39:55', '2018-05-27 23:33:06'),
(60, 1, 63, NULL, 21, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(61, 1, 64, NULL, 6, NULL, '2018-07-31 17:13:39', '2018-05-27 23:34:15'),
(62, 1, 65, NULL, 1152, NULL, '2018-07-31 17:21:11', '2018-05-27 23:34:46'),
(63, 1, 66, NULL, 0, NULL, '2018-08-01 07:39:57', '2018-05-27 23:35:18'),
(64, 1, 67, NULL, 0, NULL, '2018-08-01 07:39:59', '2018-05-27 23:35:50'),
(65, 1, 68, NULL, 0, NULL, '2018-08-01 07:40:01', '2018-05-27 23:36:26'),
(66, 1, 69, NULL, 48, NULL, '2018-08-01 03:57:52', '2018-05-27 23:36:57'),
(67, 1, 70, NULL, 77, NULL, '2018-08-01 03:58:24', '2018-05-27 23:37:27'),
(68, 1, 71, NULL, 0, NULL, '2018-08-01 07:40:03', '2018-05-27 23:38:04'),
(69, 1, 72, NULL, 48, NULL, '2018-08-01 07:37:24', '2018-05-27 23:38:33'),
(70, 1, 73, NULL, 36, NULL, '2018-08-01 07:37:54', '2018-05-27 23:39:06'),
(71, 1, 74, NULL, 8, NULL, '2018-08-01 07:38:15', '2018-05-27 23:39:42'),
(72, 1, 75, NULL, 22, NULL, '2018-07-31 17:05:55', '2018-05-27 23:40:10'),
(73, 1, 76, NULL, 99, NULL, '2018-07-02 00:22:04', '2018-07-02 00:22:04'),
(74, 1, 77, NULL, 5, NULL, '2018-08-01 04:10:59', '2018-05-28 00:46:06'),
(75, 1, 78, NULL, 2, NULL, '2018-08-01 04:11:18', '2018-05-28 00:46:43'),
(76, 1, 79, NULL, 2, NULL, '2018-08-01 02:26:55', '2018-08-01 02:26:55'),
(77, 1, 80, NULL, 11, NULL, '2018-08-01 02:26:55', '2018-08-01 02:26:55'),
(78, 1, 81, NULL, 8, NULL, '2018-08-01 04:12:34', '2018-05-28 00:48:12'),
(79, 1, 82, NULL, 6, NULL, '2018-08-01 04:12:58', '2018-05-28 00:49:35'),
(80, 1, 83, NULL, 2, NULL, '2018-08-01 04:16:50', '2018-05-28 00:50:47'),
(81, 1, 84, NULL, 15, NULL, '2018-08-01 04:17:04', '2018-07-02 00:21:29'),
(82, 1, 85, NULL, 99, NULL, '2018-07-02 00:22:04', '2018-07-02 00:22:04'),
(83, 1, 86, NULL, 2, NULL, '2018-08-01 04:17:25', '2018-05-28 00:57:14'),
(84, 1, 87, NULL, 77, NULL, '2018-07-31 10:25:01', '2018-05-28 00:58:26'),
(85, 1, 88, NULL, 15, NULL, '2018-07-31 11:39:12', '2018-05-28 00:59:41'),
(86, 1, 89, NULL, 15, NULL, '2018-07-31 11:39:38', '2018-05-28 01:00:18'),
(87, 1, 90, NULL, 11, NULL, '2018-07-31 11:40:07', '2018-05-28 01:00:59'),
(88, 1, 91, NULL, 8, NULL, '2018-07-31 11:40:22', '2018-05-28 01:02:15'),
(89, 1, 92, NULL, 10, NULL, '2018-07-31 11:40:46', '2018-05-28 01:02:42'),
(90, 1, 93, NULL, 10, NULL, '2018-07-31 11:41:02', '2018-07-01 22:29:20'),
(91, 1, 94, NULL, 134, NULL, '2018-08-01 21:00:53', '2018-08-01 21:00:53'),
(92, 1, 95, NULL, 0, NULL, '2018-08-01 07:40:07', '2018-05-28 01:04:00'),
(93, 1, 96, NULL, 245, NULL, '2018-07-31 14:33:24', '2018-05-28 01:04:58'),
(94, 1, 97, NULL, 820, NULL, '2018-07-31 11:13:04', '2018-05-28 01:06:03'),
(95, 1, 98, NULL, 262, NULL, '2018-07-31 11:14:09', '2018-05-28 01:06:35'),
(96, 1, 99, NULL, 386, NULL, '2018-07-31 11:14:59', '2018-05-28 01:07:06'),
(97, 1, 100, NULL, 280, NULL, '2018-07-31 11:24:44', '2018-05-28 01:07:44'),
(98, 1, 101, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(99, 1, 102, NULL, 0, NULL, '2018-08-01 07:40:10', '2018-05-28 01:08:44'),
(100, 1, 103, NULL, 66, NULL, '2018-07-31 15:03:47', '2018-05-28 01:10:09'),
(101, 1, 104, NULL, 88, NULL, '2018-07-31 15:17:13', '2018-05-28 01:10:39'),
(102, 1, 105, NULL, 55, NULL, '2018-07-31 15:54:47', '2018-05-28 01:11:19'),
(103, 1, 106, NULL, 0, NULL, '2018-08-01 07:40:13', '2018-05-28 01:11:58'),
(104, 1, 107, NULL, 458, NULL, '2018-07-31 10:33:50', '2018-05-28 01:12:24'),
(105, 1, 108, NULL, 155, NULL, '2018-07-31 10:54:36', '2018-05-28 01:12:57'),
(106, 1, 109, NULL, 57, NULL, '2018-07-31 11:01:57', '2018-05-28 01:13:26'),
(107, 1, 110, NULL, 56, NULL, '2018-07-31 11:02:23', '2018-05-28 01:13:55'),
(108, 1, 111, NULL, 79, NULL, '2018-07-31 11:08:39', '2018-05-28 01:14:20'),
(109, 1, 112, NULL, 18, NULL, '2018-07-31 11:05:00', '2018-05-28 01:14:46'),
(110, 1, 113, NULL, 11, NULL, '2018-07-31 11:05:20', '2018-05-28 01:15:17'),
(111, 1, 114, NULL, 40, NULL, '2018-07-31 11:09:34', '2018-05-28 01:15:44'),
(112, 1, 115, NULL, 82, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(113, 1, 116, NULL, 53, NULL, '2018-07-31 11:10:17', '2018-05-28 01:17:11'),
(114, 1, 117, NULL, 0, NULL, '2018-08-01 07:40:21', '2018-07-01 22:56:13'),
(115, 1, 118, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(116, 1, 119, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(117, 1, 120, NULL, 0, NULL, '2018-08-01 07:40:48', '2018-05-28 01:19:24'),
(118, 1, 121, NULL, 0, NULL, '2018-08-01 07:40:50', '2018-05-28 01:20:10'),
(119, 1, 122, NULL, 0, NULL, '2018-08-01 07:40:52', '2018-05-28 01:21:07'),
(120, 1, 123, NULL, 0, NULL, '2018-08-01 07:40:54', '2018-05-28 01:21:54'),
(121, 1, 124, NULL, 59, NULL, '2018-07-31 11:29:01', '2018-05-28 01:22:26'),
(122, 1, 125, NULL, 32, NULL, '2018-07-31 15:56:02', '2018-05-28 01:22:58'),
(123, 1, 126, NULL, 78, NULL, '2018-07-31 15:57:54', '2018-05-28 01:23:24'),
(124, 1, 127, NULL, 70, NULL, '2018-07-31 16:53:46', '2018-05-28 01:23:55'),
(125, 1, 128, NULL, 77, NULL, '2018-07-31 16:54:14', '2018-05-28 01:24:21'),
(126, 1, 129, NULL, 19, NULL, '2018-07-31 16:54:38', '2018-05-28 01:24:59'),
(127, 1, 130, NULL, 79, NULL, '2018-07-31 16:55:27', '2018-05-28 01:25:19'),
(128, 1, 131, NULL, 0, NULL, '2018-08-01 07:40:59', '2018-05-28 01:25:45'),
(129, 1, 132, NULL, 260, NULL, '2018-08-01 03:15:46', '2018-08-01 03:15:46'),
(130, 1, 133, NULL, 100, NULL, '2018-06-19 09:46:00', '2018-05-28 01:26:33'),
(131, 1, 134, NULL, 58, NULL, '2018-08-02 08:08:21', '2018-05-28 01:26:55'),
(132, 1, 135, NULL, 213, NULL, '2018-07-31 17:04:49', '2018-05-28 01:27:29'),
(133, 1, 136, NULL, 97, NULL, '2018-08-01 01:43:01', '2018-08-01 01:43:01'),
(134, 1, 137, NULL, 130, NULL, '2018-07-31 17:20:39', '2018-05-28 01:28:24'),
(135, 1, 138, NULL, 96, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(136, 1, 139, NULL, 0, NULL, '2018-08-01 07:41:01', '2018-05-28 01:29:11'),
(137, 1, 140, NULL, 610, NULL, '2018-07-31 17:12:50', '2018-05-28 01:29:44'),
(138, 2, 6, NULL, 0, NULL, '2018-08-01 07:39:13', '2018-04-17 23:20:08'),
(139, 2, 8, NULL, 0, NULL, '2018-08-01 07:39:18', '2018-04-17 23:23:23'),
(140, 2, 9, NULL, 0, NULL, '2018-08-01 07:39:20', '2018-04-17 23:42:29'),
(141, 2, 10, NULL, 0, NULL, '2018-08-01 07:39:22', '2018-04-18 02:46:56'),
(142, 2, 11, NULL, 23, NULL, '2018-05-24 06:42:05', '2018-05-24 06:42:05'),
(143, 2, 12, NULL, 50, NULL, '2018-05-24 06:43:33', '2018-05-24 06:43:33'),
(144, 2, 13, NULL, 20, NULL, '2018-08-01 04:09:59', '2018-06-19 02:41:00'),
(145, 2, 14, NULL, 3, NULL, '2018-08-01 04:10:13', '2018-07-02 00:22:04'),
(146, 2, 15, NULL, 98, NULL, '2018-07-02 01:55:46', '2018-07-02 01:55:46'),
(147, 2, 16, NULL, -1, NULL, '2018-08-01 01:43:01', '2018-08-01 01:43:01'),
(148, 2, 17, NULL, 207, NULL, '2018-07-31 13:54:16', '2018-06-19 02:41:21'),
(149, 2, 18, NULL, 239, NULL, '2018-07-31 11:55:01', '2018-06-19 02:41:30'),
(150, 2, 19, NULL, 99, NULL, '2018-07-31 11:55:20', '2018-06-19 02:41:33'),
(151, 2, 20, NULL, 93, NULL, '2018-07-31 11:59:48', '2018-07-02 00:18:57'),
(152, 2, 21, NULL, 293, NULL, '2018-07-31 13:37:54', '2018-06-19 02:41:38'),
(153, 2, 22, NULL, 100, NULL, '2018-06-19 09:41:44', '2018-06-19 02:41:44'),
(154, 2, 23, NULL, 64, NULL, '2018-08-02 07:40:35', '2018-05-27 22:58:17'),
(155, 2, 23, NULL, 0, NULL, '2018-08-01 07:39:32', '2018-07-27 06:19:16'),
(156, 2, 24, NULL, 102, NULL, '2018-08-01 22:40:26', '2018-08-01 22:40:26'),
(157, 2, 25, NULL, 240, NULL, '2018-07-31 14:27:21', '2018-05-27 23:02:02'),
(158, 2, 26, NULL, 100, NULL, '2018-06-19 09:42:00', '2018-05-27 23:02:43'),
(159, 2, 27, NULL, 68, NULL, '2018-07-31 14:29:40', '2018-07-02 00:21:29'),
(160, 2, 28, NULL, 0, NULL, '2018-08-01 07:39:37', '2018-05-27 23:05:17'),
(161, 2, 29, NULL, 0, NULL, '2018-08-01 07:39:38', '2018-05-27 23:06:04'),
(162, 2, 30, NULL, 0, NULL, '2018-08-01 07:39:40', '2018-05-27 23:06:50'),
(163, 2, 31, NULL, 366, NULL, '2018-07-31 10:04:32', '2018-05-27 23:08:18'),
(164, 2, 32, NULL, 89, NULL, '2018-07-31 10:13:02', '2018-07-31 03:13:02'),
(165, 2, 33, NULL, 0, NULL, '2018-08-01 07:39:43', '2018-05-27 23:11:25'),
(166, 2, 34, NULL, 0, NULL, '2018-08-01 07:39:44', '2018-05-27 23:12:20'),
(167, 2, 35, NULL, 78, NULL, '2018-07-31 11:41:30', '2018-05-27 23:12:58'),
(168, 2, 36, NULL, 59, NULL, '2018-07-31 11:41:46', '2018-05-27 23:13:41'),
(169, 2, 37, NULL, 294, NULL, '2018-07-31 11:43:59', '2018-05-27 23:14:37'),
(170, 2, 38, NULL, 97, NULL, '2018-07-01 23:15:31', '2018-07-01 23:15:31'),
(171, 2, 39, NULL, 263, NULL, '2018-07-31 11:44:37', '2018-05-27 23:16:17'),
(172, 2, 40, NULL, 99, NULL, '2018-07-31 16:59:42', '2018-05-27 23:16:49'),
(173, 2, 41, NULL, 186, NULL, '2018-07-31 16:59:59', '2018-05-27 23:17:20'),
(174, 2, 42, NULL, 49, NULL, '2018-07-31 17:02:50', '2018-05-27 23:17:48'),
(175, 2, 43, NULL, 2052, NULL, '2018-07-31 09:56:41', '2018-05-27 23:18:39'),
(176, 2, 44, NULL, 72, NULL, '2018-07-31 09:58:47', '2018-07-31 02:35:19'),
(177, 2, 45, NULL, 114, NULL, '2018-07-31 09:59:17', '2018-05-27 23:20:34'),
(178, 2, 46, NULL, 846, NULL, '2018-07-31 10:03:26', '2018-05-27 23:22:15'),
(179, 2, 47, NULL, 0, NULL, '2018-08-01 07:39:49', '2018-05-27 23:23:53'),
(180, 2, 48, NULL, 0, NULL, '2018-08-01 07:39:50', '2018-05-27 23:24:45'),
(181, 2, 49, NULL, 350, NULL, '2018-07-31 11:35:44', '2018-07-02 00:37:41'),
(182, 2, 50, NULL, 280, NULL, '2018-07-31 11:36:09', '2018-07-02 00:37:41'),
(183, 2, 51, NULL, 280, NULL, '2018-07-31 11:36:29', '2018-05-27 23:26:42'),
(184, 2, 52, NULL, 29, NULL, '2018-07-31 11:36:54', '2018-07-02 00:37:41'),
(185, 2, 53, NULL, 30, NULL, '2018-07-31 11:38:21', '2018-05-27 23:28:06'),
(186, 2, 54, NULL, 10, NULL, '2018-07-31 11:38:37', '2018-05-27 23:28:42'),
(187, 2, 55, NULL, 22, NULL, '2018-07-31 14:59:29', '2018-05-27 23:29:15'),
(188, 2, 56, NULL, 834, NULL, '2018-07-31 14:59:58', '2018-07-01 23:36:30'),
(189, 2, 57, NULL, 100, NULL, '2018-06-19 09:43:10', '2018-05-27 23:30:16'),
(190, 2, 58, NULL, 159, NULL, '2018-07-31 16:56:05', '2018-05-27 23:30:47'),
(191, 2, 61, NULL, 30, NULL, '2018-07-31 17:06:23', '2018-05-27 23:32:29'),
(192, 2, 62, NULL, 0, NULL, '2018-08-01 07:39:55', '2018-05-27 23:33:06'),
(193, 2, 63, NULL, 21, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(194, 2, 64, NULL, 6, NULL, '2018-07-31 17:13:39', '2018-05-27 23:34:15'),
(195, 2, 65, NULL, 1152, NULL, '2018-07-31 17:21:11', '2018-05-27 23:34:46'),
(196, 2, 66, NULL, 0, NULL, '2018-08-01 07:39:57', '2018-05-27 23:35:18'),
(197, 2, 67, NULL, 0, NULL, '2018-08-01 07:39:59', '2018-05-27 23:35:50'),
(198, 2, 68, NULL, 0, NULL, '2018-08-01 07:40:01', '2018-05-27 23:36:26'),
(199, 2, 69, NULL, 48, NULL, '2018-08-01 03:57:52', '2018-05-27 23:36:57'),
(200, 2, 70, NULL, 77, NULL, '2018-08-01 03:58:24', '2018-05-27 23:37:27'),
(201, 2, 71, NULL, 0, NULL, '2018-08-01 07:40:03', '2018-05-27 23:38:04'),
(202, 2, 72, NULL, 48, NULL, '2018-08-01 07:37:24', '2018-05-27 23:38:33'),
(203, 2, 73, NULL, 36, NULL, '2018-08-01 07:37:54', '2018-05-27 23:39:06'),
(204, 2, 74, NULL, 8, NULL, '2018-08-01 07:38:15', '2018-05-27 23:39:42'),
(205, 2, 75, NULL, 22, NULL, '2018-07-31 17:05:55', '2018-05-27 23:40:10'),
(206, 2, 76, NULL, 99, NULL, '2018-07-02 00:22:04', '2018-07-02 00:22:04'),
(207, 2, 77, NULL, 5, NULL, '2018-08-01 04:10:59', '2018-05-28 00:46:06'),
(208, 2, 78, NULL, 2, NULL, '2018-08-01 04:11:18', '2018-05-28 00:46:43'),
(209, 2, 79, NULL, 2, NULL, '2018-08-01 02:26:55', '2018-08-01 02:26:55'),
(210, 2, 80, NULL, 11, NULL, '2018-08-01 02:26:55', '2018-08-01 02:26:55'),
(211, 2, 81, NULL, 8, NULL, '2018-08-01 04:12:34', '2018-05-28 00:48:12'),
(212, 2, 82, NULL, 6, NULL, '2018-08-01 04:12:58', '2018-05-28 00:49:35'),
(213, 2, 83, NULL, 2, NULL, '2018-08-01 04:16:50', '2018-05-28 00:50:47'),
(214, 2, 84, NULL, 15, NULL, '2018-08-01 04:17:04', '2018-07-02 00:21:29'),
(215, 2, 85, NULL, 99, NULL, '2018-07-02 00:22:04', '2018-07-02 00:22:04'),
(216, 2, 86, NULL, 2, NULL, '2018-08-01 04:17:25', '2018-05-28 00:57:14'),
(217, 2, 87, NULL, 77, NULL, '2018-07-31 10:25:01', '2018-05-28 00:58:26'),
(218, 2, 88, NULL, 15, NULL, '2018-07-31 11:39:12', '2018-05-28 00:59:41'),
(219, 2, 89, NULL, 15, NULL, '2018-07-31 11:39:38', '2018-05-28 01:00:18'),
(220, 2, 90, NULL, 11, NULL, '2018-07-31 11:40:07', '2018-05-28 01:00:59'),
(221, 2, 91, NULL, 8, NULL, '2018-07-31 11:40:22', '2018-05-28 01:02:15'),
(222, 2, 92, NULL, 10, NULL, '2018-07-31 11:40:46', '2018-05-28 01:02:42'),
(223, 2, 93, NULL, 10, NULL, '2018-07-31 11:41:02', '2018-07-01 22:29:20'),
(224, 2, 94, NULL, 134, NULL, '2018-08-01 21:00:53', '2018-08-01 21:00:53'),
(225, 2, 95, NULL, 0, NULL, '2018-08-01 07:40:07', '2018-05-28 01:04:00'),
(226, 2, 96, NULL, 245, NULL, '2018-07-31 14:33:24', '2018-05-28 01:04:58'),
(227, 2, 97, NULL, 820, NULL, '2018-07-31 11:13:04', '2018-05-28 01:06:03'),
(228, 2, 98, NULL, 262, NULL, '2018-07-31 11:14:09', '2018-05-28 01:06:35'),
(229, 2, 99, NULL, 386, NULL, '2018-07-31 11:14:59', '2018-05-28 01:07:06'),
(230, 2, 100, NULL, 280, NULL, '2018-07-31 11:24:44', '2018-05-28 01:07:44'),
(231, 2, 101, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(232, 2, 102, NULL, 0, NULL, '2018-08-01 07:40:10', '2018-05-28 01:08:44'),
(233, 2, 103, NULL, 66, NULL, '2018-07-31 15:03:47', '2018-05-28 01:10:09'),
(234, 2, 104, NULL, 88, NULL, '2018-07-31 15:17:13', '2018-05-28 01:10:39'),
(235, 2, 105, NULL, 55, NULL, '2018-07-31 15:54:47', '2018-05-28 01:11:19'),
(236, 2, 106, NULL, 0, NULL, '2018-08-01 07:40:13', '2018-05-28 01:11:58'),
(237, 2, 107, NULL, 458, NULL, '2018-07-31 10:33:50', '2018-05-28 01:12:24'),
(238, 2, 108, NULL, 155, NULL, '2018-07-31 10:54:36', '2018-05-28 01:12:57'),
(239, 2, 109, NULL, 57, NULL, '2018-07-31 11:01:57', '2018-05-28 01:13:26'),
(240, 2, 110, NULL, 56, NULL, '2018-07-31 11:02:23', '2018-05-28 01:13:55'),
(241, 2, 111, NULL, 79, NULL, '2018-07-31 11:08:39', '2018-05-28 01:14:20'),
(242, 2, 112, NULL, 18, NULL, '2018-07-31 11:05:00', '2018-05-28 01:14:46'),
(243, 2, 113, NULL, 11, NULL, '2018-07-31 11:05:20', '2018-05-28 01:15:17'),
(244, 2, 114, NULL, 40, NULL, '2018-07-31 11:09:34', '2018-05-28 01:15:44'),
(245, 2, 115, NULL, 82, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(246, 2, 116, NULL, 53, NULL, '2018-07-31 11:10:17', '2018-05-28 01:17:11'),
(247, 2, 117, NULL, 0, NULL, '2018-08-01 07:40:21', '2018-07-01 22:56:13'),
(248, 2, 118, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(249, 2, 119, NULL, 99, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(250, 2, 120, NULL, 0, NULL, '2018-08-01 07:40:48', '2018-05-28 01:19:24'),
(251, 2, 121, NULL, 0, NULL, '2018-08-01 07:40:50', '2018-05-28 01:20:10'),
(252, 2, 122, NULL, 0, NULL, '2018-08-01 07:40:52', '2018-05-28 01:21:07'),
(253, 2, 123, NULL, 0, NULL, '2018-08-01 07:40:54', '2018-05-28 01:21:54'),
(254, 2, 124, NULL, 59, NULL, '2018-07-31 11:29:01', '2018-05-28 01:22:26'),
(255, 2, 125, NULL, 32, NULL, '2018-07-31 15:56:02', '2018-05-28 01:22:58'),
(256, 2, 126, NULL, 78, NULL, '2018-07-31 15:57:54', '2018-05-28 01:23:24'),
(257, 2, 127, NULL, 70, NULL, '2018-07-31 16:53:46', '2018-05-28 01:23:55'),
(258, 2, 128, NULL, 77, NULL, '2018-07-31 16:54:14', '2018-05-28 01:24:21'),
(259, 2, 129, NULL, 19, NULL, '2018-07-31 16:54:38', '2018-05-28 01:24:59'),
(260, 2, 130, NULL, 79, NULL, '2018-07-31 16:55:27', '2018-05-28 01:25:19'),
(261, 2, 131, NULL, 0, NULL, '2018-08-01 07:40:59', '2018-05-28 01:25:45'),
(262, 2, 132, NULL, 260, NULL, '2018-08-01 03:15:46', '2018-08-01 03:15:46'),
(263, 2, 133, NULL, 100, NULL, '2018-06-19 09:46:00', '2018-05-28 01:26:33'),
(264, 2, 134, NULL, 58, NULL, '2018-08-02 08:08:21', '2018-05-28 01:26:55'),
(265, 2, 135, NULL, 213, NULL, '2018-07-31 17:04:49', '2018-05-28 01:27:29'),
(266, 2, 136, NULL, 97, NULL, '2018-08-01 01:43:01', '2018-08-01 01:43:01'),
(267, 2, 137, NULL, 130, NULL, '2018-07-31 17:20:39', '2018-05-28 01:28:24'),
(268, 2, 138, NULL, 96, NULL, '2018-08-01 03:23:04', '2018-08-01 03:23:04'),
(269, 2, 139, NULL, 0, NULL, '2018-08-01 07:41:01', '2018-05-28 01:29:11'),
(270, 2, 140, NULL, 610, NULL, '2018-07-31 17:12:50', '2018-05-28 01:29:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_adjustment`
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
-- Struktur dari tabel `stock_history`
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

--
-- Dumping data untuk tabel `stock_history`
--

INSERT INTO `stock_history` (`id`, `product_id`, `store_id`, `reason`, `quantity`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 55, 1, 'Terjual', 1, '2018-06-12 01:14:09', '1', '2018-06-12 01:14:09', '1'),
(2, 16, 1, 'Terjual', 2, '2018-06-12 01:14:09', '1', '2018-06-12 01:14:09', '1'),
(3, 14, 1, 'Terjual', 1, '2018-06-12 01:14:09', '1', '2018-06-12 01:14:09', '1'),
(4, 93, 1, 'Terjual', 4, '2018-07-01 22:29:20', '1', '2018-07-01 22:29:20', '1'),
(5, 38, 1, 'Terjual', 0, '2018-07-01 22:43:21', '1', '2018-07-01 22:43:21', '1'),
(6, 24, 1, 'Terjual', 1, '2018-07-01 22:43:22', '1', '2018-07-01 22:43:22', '1'),
(7, 23, 1, 'Terjual', 0, '2018-07-01 22:43:22', '1', '2018-07-01 22:43:22', '1'),
(8, 63, 1, 'Terjual', 1, '2018-07-01 22:43:22', '1', '2018-07-01 22:43:22', '1'),
(9, 24, 1, 'Terjual', 1, '2018-07-01 22:54:23', '1', '2018-07-01 22:54:23', '1'),
(10, 24, 1, 'Terjual', 1, '2018-07-01 22:55:35', '1', '2018-07-01 22:55:35', '1'),
(11, 117, 1, 'Terjual', 2, '2018-07-01 22:56:13', '1', '2018-07-01 22:56:13', '1'),
(12, 38, 1, 'Terjual', 2, '2018-07-01 23:13:11', '1', '2018-07-01 23:13:11', '1'),
(13, 38, 1, 'Terjual', 1, '2018-07-01 23:15:31', '1', '2018-07-01 23:15:31', '1'),
(14, 55, 1, 'Terjual', 0, '2018-07-01 23:36:29', '1', '2018-07-01 23:36:29', '1'),
(15, 16, 1, 'Terjual', 0, '2018-07-01 23:36:29', '1', '2018-07-01 23:36:29', '1'),
(16, 14, 1, 'Terjual', 0, '2018-07-01 23:36:30', '1', '2018-07-01 23:36:30', '1'),
(17, 13, 1, 'Terjual', 0, '2018-07-01 23:36:30', '1', '2018-07-01 23:36:30', '1'),
(18, 56, 1, 'Terjual', 1, '2018-07-01 23:36:30', '1', '2018-07-01 23:36:30', '1'),
(19, 49, 1, 'Terjual', 2, '2018-07-01 23:36:30', '1', '2018-07-01 23:36:30', '1'),
(20, 20, 1, 'Terjual', 1, '2018-07-02 00:18:57', '1', '2018-07-02 00:18:57', '1'),
(21, 15, 1, 'Terjual', 1, '2018-07-02 00:18:57', '1', '2018-07-02 00:18:57', '1'),
(22, 27, 1, 'Terjual', 1, '2018-07-02 00:21:29', '1', '2018-07-02 00:21:29', '1'),
(23, 136, 1, 'Terjual', 1, '2018-07-02 00:21:29', '1', '2018-07-02 00:21:29', '1'),
(24, 84, 1, 'Terjual', 1, '2018-07-02 00:21:29', '1', '2018-07-02 00:21:29', '1'),
(25, 14, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(26, 24, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(27, 138, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(28, 52, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(29, 76, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(30, 85, 1, 'Terjual', 1, '2018-07-02 00:22:04', '1', '2018-07-02 00:22:04', '1'),
(31, 24, 1, 'Terjual', 2, '2018-07-02 00:22:17', '1', '2018-07-02 00:22:17', '1'),
(32, 23, 1, 'Terjual', 1, '2018-07-02 00:22:17', '1', '2018-07-02 00:22:17', '1'),
(33, 24, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(34, 23, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(35, 138, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(36, 136, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(37, 118, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(38, 119, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(39, 132, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(40, 101, 1, 'Terjual', 1, '2018-07-02 00:22:31', '1', '2018-07-02 00:22:31', '1'),
(41, 49, 1, 'Terjual', 5, '2018-07-02 00:37:41', '1', '2018-07-02 00:37:41', '1'),
(42, 52, 1, 'Terjual', 3, '2018-07-02 00:37:41', '1', '2018-07-02 00:37:41', '1'),
(43, 50, 1, 'Terjual', 2, '2018-07-02 00:37:41', '1', '2018-07-02 00:37:41', '1'),
(44, 15, 1, 'Terjual', 1, '2018-07-02 01:55:46', '1', '2018-07-02 01:55:46', '1'),
(45, 24, 1, 'Terjual', 1, '2018-07-06 03:51:56', '1', '2018-07-06 03:51:56', '1'),
(46, 24, 1, 'Terjual', 1, '2018-07-06 03:53:53', '1', '2018-07-06 03:53:53', '1'),
(47, 24, 1, 'Terjual', 1, '2018-07-06 03:57:01', '1', '2018-07-06 03:57:01', '1'),
(48, 24, 1, 'Terjual', 1, '2018-07-10 03:15:10', '1', '2018-07-10 03:15:10', '1'),
(49, 24, 1, 'Terjual', 2, '2018-07-10 23:14:41', '1', '2018-07-10 23:14:41', '1'),
(50, 20, 1, 'Terjual', 1, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(51, 24, 1, 'Terjual', 1, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(52, 56, 1, 'Terjual', 5, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(53, 55, 1, 'Terjual', 4, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(54, 102, 1, 'Terjual', 1, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(55, 100, 1, 'Terjual', 1, '2018-07-16 21:25:54', '1', '2018-07-16 21:25:54', '1'),
(56, 22, 1, 'Terjual', 1, '2018-07-16 21:51:32', '1', '2018-07-16 21:51:32', '1'),
(57, 24, 1, 'Terjual', 1, '2018-07-16 22:24:43', '1', '2018-07-16 22:24:43', '1'),
(58, 24, 1, 'Terjual', 1, '2018-07-16 23:07:17', '1', '2018-07-16 23:07:17', '1'),
(59, 81, 1, 'Terjual', 1, '2018-07-25 02:55:22', '1', '2018-07-25 02:55:22', '1'),
(60, 24, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(61, 21, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(62, 139, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(63, 106, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(64, 130, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(65, 38, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(66, 31, 1, 'Terjual', 1, '2018-07-25 02:55:47', '1', '2018-07-25 02:55:47', '1'),
(67, 83, 1, 'Terjual', 1, '2018-07-25 02:56:18', '1', '2018-07-25 02:56:18', '1'),
(68, 82, 1, 'Terjual', 1, '2018-07-25 02:56:18', '1', '2018-07-25 02:56:18', '1'),
(69, 24, 1, 'Terjual', 1, '2018-07-25 02:56:29', '1', '2018-07-25 02:56:29', '1'),
(70, 25, 1, 'Terjual', 1, '2018-07-25 02:56:29', '1', '2018-07-25 02:56:29', '1'),
(71, 20, 1, 'Terjual', 1, '2018-07-25 02:56:29', '1', '2018-07-25 02:56:29', '1'),
(72, 24, 1, 'Terjual', 1, '2018-07-25 02:56:34', '1', '2018-07-25 02:56:34', '1'),
(73, 25, 1, 'Terjual', 1, '2018-07-25 02:56:34', '1', '2018-07-25 02:56:34', '1'),
(74, 20, 1, 'Terjual', 1, '2018-07-25 02:56:34', '1', '2018-07-25 02:56:34', '1'),
(75, 52, 1, 'Terjual', 1, '2018-07-25 02:56:44', '1', '2018-07-25 02:56:44', '1'),
(76, 51, 1, 'Terjual', 1, '2018-07-25 02:56:45', '1', '2018-07-25 02:56:45', '1'),
(77, 53, 1, 'Terjual', 1, '2018-07-25 02:56:45', '1', '2018-07-25 02:56:45', '1'),
(78, 63, 1, 'Terjual', 1, '2018-07-25 02:56:45', '1', '2018-07-25 02:56:45', '1'),
(79, 71, 1, 'Terjual', 1, '2018-07-25 02:56:45', '1', '2018-07-25 02:56:45', '1'),
(80, 69, 1, 'Terjual', 1, '2018-07-25 02:56:45', '1', '2018-07-25 02:56:45', '1'),
(81, 24, 1, 'Terjual', 1, '2018-07-25 02:57:18', '1', '2018-07-25 02:57:18', '1'),
(82, 24, 1, 'Terjual', 1, '2018-07-25 02:58:00', '1', '2018-07-25 02:58:00', '1'),
(83, 24, 1, 'Terjual', 1, '2018-07-25 03:14:15', '1', '2018-07-25 03:14:15', '1'),
(84, 49, 1, 'Terjual', 1, '2018-07-26 02:20:03', '1', '2018-07-26 02:20:03', '1'),
(85, 55, 1, 'Terjual', 1, '2018-07-26 02:20:03', '1', '2018-07-26 02:20:03', '1'),
(86, 49, 1, 'Terjual', 1, '2018-07-26 02:20:13', '1', '2018-07-26 02:20:13', '1'),
(87, 55, 1, 'Terjual', 1, '2018-07-26 02:20:13', '1', '2018-07-26 02:20:13', '1'),
(88, 49, 1, 'Terjual', 1, '2018-07-26 02:20:14', '1', '2018-07-26 02:20:14', '1'),
(89, 55, 1, 'Terjual', 1, '2018-07-26 02:20:14', '1', '2018-07-26 02:20:14', '1'),
(90, 49, 1, 'Terjual', 1, '2018-07-26 02:20:17', '1', '2018-07-26 02:20:17', '1'),
(91, 55, 1, 'Terjual', 1, '2018-07-26 02:20:17', '1', '2018-07-26 02:20:17', '1'),
(92, 49, 1, 'Terjual', 1, '2018-07-26 02:20:45', '1', '2018-07-26 02:20:45', '1'),
(93, 55, 1, 'Terjual', 1, '2018-07-26 02:20:45', '1', '2018-07-26 02:20:45', '1'),
(94, 49, 1, 'Terjual', 1, '2018-07-26 02:20:46', '1', '2018-07-26 02:20:46', '1'),
(95, 55, 1, 'Terjual', 1, '2018-07-26 02:20:46', '1', '2018-07-26 02:20:46', '1'),
(96, 49, 1, 'Terjual', 1, '2018-07-26 02:32:51', '1', '2018-07-26 02:32:51', '1'),
(97, 55, 1, 'Terjual', 1, '2018-07-26 02:32:51', '1', '2018-07-26 02:32:51', '1'),
(98, 49, 1, 'Terjual', 1, '2018-07-26 02:35:46', '1', '2018-07-26 02:35:46', '1'),
(99, 55, 1, 'Terjual', 1, '2018-07-26 02:35:46', '1', '2018-07-26 02:35:46', '1'),
(100, 49, 1, 'Terjual', 1, '2018-07-26 02:39:27', '1', '2018-07-26 02:39:27', '1'),
(101, 55, 1, 'Terjual', 1, '2018-07-26 02:39:27', '1', '2018-07-26 02:39:27', '1'),
(102, 49, 1, 'Terjual', 1, '2018-07-26 02:39:31', '1', '2018-07-26 02:39:31', '1'),
(103, 55, 1, 'Terjual', 1, '2018-07-26 02:39:31', '1', '2018-07-26 02:39:31', '1'),
(104, 139, 1, 'Terjual', 1, '2018-07-26 02:41:53', '1', '2018-07-26 02:41:53', '1'),
(105, 24, 1, 'Terjual', 1, '2018-07-28 22:02:28', '1', '2018-07-28 22:02:28', '1'),
(106, 19, 1, 'Terjual', 1, '2018-07-28 22:02:28', '1', '2018-07-28 22:02:28', '1'),
(107, 136, 1, 'Terjual', 1, '2018-07-28 22:45:07', '1', '2018-07-28 22:45:07', '1'),
(108, 24, 1, 'Terjual', 3, '2018-07-29 00:33:17', '1', '2018-07-29 00:33:17', '1'),
(109, 19, 1, 'Terjual', 2, '2018-07-29 00:33:17', '1', '2018-07-29 00:33:17', '1'),
(110, 20, 1, 'Terjual', 2, '2018-07-29 00:33:17', '1', '2018-07-29 00:33:17', '1'),
(111, 23, 1, 'Terjual', 1, '2018-07-29 00:33:18', '1', '2018-07-29 00:33:18', '1'),
(112, 27, 1, 'Terjual', 1, '2018-07-29 00:33:18', '1', '2018-07-29 00:33:18', '1'),
(113, 56, 1, 'Terjual', 2, '2018-07-29 06:17:13', '1', '2018-07-29 06:17:13', '1'),
(114, 55, 1, 'Terjual', 1, '2018-07-29 06:17:13', '1', '2018-07-29 06:17:13', '1'),
(115, 56, 1, 'Terjual', 2, '2018-07-29 06:17:51', '1', '2018-07-29 06:17:51', '1'),
(116, 55, 1, 'Terjual', 1, '2018-07-29 06:17:51', '1', '2018-07-29 06:17:51', '1'),
(117, 137, 1, 'Terjual', 1, '2018-07-29 14:10:01', '1', '2018-07-29 14:10:01', '1'),
(118, 55, 1, 'Terjual', 1, '2018-07-29 14:10:01', '1', '2018-07-29 14:10:01', '1'),
(119, 137, 1, 'Terjual', 2, '2018-07-29 14:10:31', '1', '2018-07-29 14:10:31', '1'),
(120, 55, 1, 'Terjual', 1, '2018-07-29 14:10:31', '1', '2018-07-29 14:10:31', '1'),
(121, 137, 1, 'Terjual', 1, '2018-07-29 07:16:38', '1', '2018-07-29 07:16:38', '1'),
(122, 55, 1, 'Terjual', 1, '2018-07-29 07:16:38', '1', '2018-07-29 07:16:38', '1'),
(123, 56, 1, 'Terjual', 1, '2018-07-29 07:34:51', '1', '2018-07-29 07:34:51', '1'),
(124, 55, 1, 'Terjual', 1, '2018-07-29 07:34:51', '1', '2018-07-29 07:34:51', '1'),
(125, 56, 1, 'Terjual', 2, '2018-07-29 07:36:38', '1', '2018-07-29 07:36:38', '1'),
(126, 55, 1, 'Terjual', 1, '2018-07-29 07:36:38', '1', '2018-07-29 07:36:38', '1'),
(127, 56, 1, 'Terjual', 2, '2018-07-29 07:39:15', '1', '2018-07-29 07:39:15', '1'),
(128, 55, 1, 'Terjual', 1, '2018-07-29 07:39:15', '1', '2018-07-29 07:39:15', '1'),
(129, 55, 1, 'Terjual', 1, '2018-07-29 07:59:37', '1', '2018-07-29 07:59:37', '1'),
(130, 56, 1, 'Terjual', 1, '2018-07-29 07:59:37', '1', '2018-07-29 07:59:37', '1'),
(131, 55, 1, 'Terjual', 2, '2018-07-29 08:00:25', '1', '2018-07-29 08:00:25', '1'),
(132, 82, 1, 'Terjual', 1, '2018-07-29 08:00:25', '1', '2018-07-29 08:00:25', '1'),
(133, 55, 1, 'Terjual', 2, '2018-07-29 08:04:14', '1', '2018-07-29 08:04:14', '1'),
(134, 82, 1, 'Terjual', 1, '2018-07-29 08:04:14', '1', '2018-07-29 08:04:14', '1'),
(135, 56, 1, 'Terjual', 2, '2018-07-29 08:04:19', '1', '2018-07-29 08:04:19', '1'),
(136, 55, 1, 'Terjual', 1, '2018-07-29 08:04:19', '1', '2018-07-29 08:04:19', '1'),
(137, 56, 1, 'Terjual', 2, '2018-07-29 08:05:53', '1', '2018-07-29 08:05:53', '1'),
(138, 55, 1, 'Terjual', 1, '2018-07-29 08:05:53', '1', '2018-07-29 08:05:53', '1'),
(139, 56, 1, 'Terjual', 2, '2018-07-29 08:10:19', '1', '2018-07-29 08:10:19', '1'),
(140, 83, 1, 'Terjual', 1, '2018-07-29 08:10:19', '1', '2018-07-29 08:10:19', '1'),
(141, 56, 1, 'Terjual', 1, '2018-07-29 08:13:07', '1', '2018-07-29 08:13:07', '1'),
(142, 83, 1, 'Terjual', 1, '2018-07-29 08:13:07', '1', '2018-07-29 08:13:07', '1'),
(143, 56, 1, 'Terjual', 2, '2018-07-29 08:16:34', '1', '2018-07-29 08:16:34', '1'),
(144, 55, 1, 'Terjual', 1, '2018-07-29 08:16:34', '1', '2018-07-29 08:16:34', '1'),
(145, 83, 1, 'Terjual', 2, '2018-07-29 08:19:24', '1', '2018-07-29 08:19:24', '1'),
(146, 56, 1, 'Terjual', 1, '2018-07-29 08:19:24', '1', '2018-07-29 08:19:24', '1'),
(147, 83, 1, 'Terjual', 2, '2018-07-29 08:21:32', '1', '2018-07-29 08:21:32', '1'),
(148, 56, 1, 'Terjual', 1, '2018-07-29 08:21:32', '1', '2018-07-29 08:21:32', '1'),
(149, 82, 1, 'Terjual', 1, '2018-07-29 08:44:20', '1', '2018-07-29 08:44:20', '1'),
(150, 55, 1, 'Terjual', 1, '2018-07-29 08:44:20', '1', '2018-07-29 08:44:20', '1'),
(151, 56, 1, 'Terjual', 1, '2018-07-29 08:44:20', '1', '2018-07-29 08:44:20', '1'),
(152, 82, 1, 'Terjual', 1, '2018-07-29 08:52:31', '1', '2018-07-29 08:52:31', '1'),
(153, 55, 1, 'Terjual', 1, '2018-07-29 08:52:31', '1', '2018-07-29 08:52:31', '1'),
(154, 56, 1, 'Terjual', 1, '2018-07-29 08:52:31', '1', '2018-07-29 08:52:31', '1'),
(155, 14, 1, 'Terjual', 0, '2018-07-29 20:45:20', '1', '2018-07-29 20:45:20', '1'),
(156, 13, 1, 'Terjual', 1, '2018-07-29 20:45:20', '1', '2018-07-29 20:45:20', '1'),
(157, 55, 1, 'Terjual', 1, '2018-07-30 00:12:57', '1', '2018-07-30 00:12:57', '1'),
(158, 83, 1, 'Terjual', 1, '2018-07-30 00:12:57', '1', '2018-07-30 00:12:57', '1'),
(159, 132, 1, 'Terjual', 0, '2018-07-30 00:12:57', '1', '2018-07-30 00:12:57', '1'),
(160, 82, 1, 'Terjual', 1, '2018-07-30 00:16:21', '1', '2018-07-30 00:16:21', '1'),
(161, 55, 1, 'Terjual', 1, '2018-07-30 00:16:21', '1', '2018-07-30 00:16:21', '1'),
(162, 52, 1, 'Terjual', 1, '2018-07-30 00:16:21', '1', '2018-07-30 00:16:21', '1'),
(163, 83, 1, 'Terjual', 0, '2018-07-30 01:02:40', '1', '2018-07-30 01:02:40', '1'),
(164, 56, 1, 'Terjual', 1, '2018-07-30 01:02:40', '1', '2018-07-30 01:02:40', '1'),
(165, 55, 1, 'Terjual', 1, '2018-07-30 01:02:41', '1', '2018-07-30 01:02:41', '1'),
(166, 84, 1, 'Terjual', 1, '2018-07-30 01:04:59', '33', '2018-07-30 01:04:59', '33'),
(167, 49, 1, 'Terjual', 1, '2018-07-30 01:04:59', '33', '2018-07-30 01:04:59', '33'),
(168, 37, 1, 'Terjual', 1, '2018-07-30 01:04:59', '33', '2018-07-30 01:04:59', '33'),
(169, 16, 1, 'Terjual', 1, '2018-07-30 05:59:32', '33', '2018-07-30 05:59:32', '33'),
(170, 21, 1, 'Terjual', 1, '2018-07-30 05:59:32', '33', '2018-07-30 05:59:32', '33'),
(171, 132, 1, 'Terjual', 10, '2018-07-30 05:59:32', '33', '2018-07-30 05:59:32', '33'),
(172, 55, 1, 'Terjual', 1, '2018-07-30 21:02:20', '33', '2018-07-30 21:02:20', '33'),
(173, 134, 1, 'Terjual', 5, '2018-07-30 21:19:48', '33', '2018-07-30 21:19:48', '33'),
(174, 108, 1, 'Terjual', 1, '2018-07-30 21:19:48', '33', '2018-07-30 21:19:48', '33'),
(175, 24, 1, 'Terjual', 1, '2018-07-30 21:32:12', '33', '2018-07-30 21:32:12', '33'),
(176, 16, 1, 'Terjual', 1, '2018-07-30 21:32:12', '33', '2018-07-30 21:32:12', '33'),
(177, 13, 1, 'Terjual', 1, '2018-07-31 00:46:25', '33', '2018-07-31 00:46:25', '33'),
(178, 134, 1, 'Terjual', 3, '2018-07-31 02:29:54', '33', '2018-07-31 02:29:54', '33'),
(179, 132, 1, 'Terjual', 2, '2018-07-31 02:29:54', '33', '2018-07-31 02:29:54', '33'),
(180, 19, 1, 'Terjual', 1, '2018-07-31 19:26:07', '33', '2018-07-31 19:26:07', '33'),
(181, 82, 1, 'Terjual', 1, '2018-07-31 19:40:09', '33', '2018-07-31 19:40:09', '33'),
(182, 40, 1, 'Terjual', 1, '2018-07-31 19:50:07', '33', '2018-07-31 19:50:07', '33'),
(183, 63, 1, 'Terjual', 1, '2018-07-31 19:53:14', '33', '2018-07-31 19:53:14', '33'),
(184, 58, 1, 'Terjual', 1, '2018-07-31 19:53:14', '33', '2018-07-31 19:53:14', '33'),
(185, 18, 1, 'Terjual', 1, '2018-08-01 01:25:57', '33', '2018-08-01 01:25:57', '33'),
(186, 132, 1, 'Terjual', 2, '2018-08-01 01:25:57', '33', '2018-08-01 01:25:57', '33'),
(187, 16, 1, 'Terjual', 2, '2018-08-01 01:25:57', '33', '2018-08-01 01:25:57', '33'),
(188, 16, 1, 'Terjual', 1, '2018-08-01 01:43:01', '33', '2018-08-01 01:43:01', '33'),
(189, 136, 1, 'Terjual', 1, '2018-08-01 01:43:01', '33', '2018-08-01 01:43:01', '33'),
(190, 80, 1, 'Terjual', 1, '2018-08-01 02:26:55', '33', '2018-08-01 02:26:55', '33'),
(191, 79, 1, 'Terjual', 1, '2018-08-01 02:26:55', '33', '2018-08-01 02:26:55', '33'),
(192, 132, 1, 'Terjual', 5, '2018-08-01 03:15:46', '1', '2018-08-01 03:15:46', '1'),
(193, 115, 1, 'Terjual', 1, '2018-08-01 03:23:04', '1', '2018-08-01 03:23:04', '1'),
(194, 63, 1, 'Terjual', 3, '2018-08-01 03:23:04', '1', '2018-08-01 03:23:04', '1'),
(195, 138, 1, 'Terjual', 2, '2018-08-01 03:23:04', '1', '2018-08-01 03:23:04', '1'),
(196, 94, 1, 'Terjual', 2, '2018-08-01 21:00:53', '33', '2018-08-01 21:00:53', '33'),
(197, 24, 1, 'Terjual', 1, '2018-08-01 22:40:26', '33', '2018-08-01 22:40:26', '33'),
(198, 39, 1, 'Terjual', 4, '2018-08-02 01:28:39', '33', '2018-08-02 01:28:39', '33'),
(199, 26, 1, 'Terjual', 1, '2018-08-02 03:56:21', '33', '2018-08-02 03:56:21', '33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `phone` int(14) NOT NULL,
  `address` varchar(150) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `long` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`id`, `store_name`, `phone`, `address`, `lat`, `long`, `created_at`, `updated_at`) VALUES
(1, 'GrosirOne Serang', 7920468, 'Jalan Raya Cibagus No.19, Rawu 42111, Kaligandu, Serang Sub-District, Serang City, Banten 42111', '-6.108882', '106.171492', '2018-07-27 01:33:38', '0000-00-00 00:00:00'),
(2, 'GrosirOne Cikupamas', 59403198, 'Jl. Talaga Mas III No. 5, Kawasan Industri Cikupamas I, Cikupa, Talaga, Cikupa, Tangerang, Banten 15710', '-6.216193', '106.501018', '2018-07-30 22:17:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax_name` varchar(20) NOT NULL,
  `tax_value` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tax`
--

INSERT INTO `tax` (`id`, `tax_name`, `tax_value`, `created_at`, `updated_at`) VALUES
(1, 'PPN', 10, '2018-04-18 06:22:34', '2018-04-18 06:22:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_order`
--

CREATE TABLE `transfer_order` (
  `id` int(11) NOT NULL,
  `store_id_from` int(11) NOT NULL,
  `store_id_to` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_order_cancel`
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
-- Struktur dari tabel `transfer_order_detail`
--

CREATE TABLE `transfer_order_detail` (
  `id` int(11) NOT NULL,
  `transfer_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT '',
  `api_token` varchar(255) NOT NULL,
  `status` varchar(150) DEFAULT 'active',
  `remember_token` varchar(255) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `store_id`, `phone`, `password`, `api_token`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 5, 1, '081234567', '$2y$10$L4geBB23QIwgAzwMnb9pLOuLGk15KCuZuvfGd6DVzhkg8XBElhSBa', 'R2AIpZfzNDlXsrHZAKxlu1EmqKA6Pmeijasm933CZnOruNwXR5VMExVHYPyQ', 'active', '', '2017-12-06 09:43:12', '2018-07-11 00:26:00'),
(33, 5, 1, '085384543785', '$2y$10$GYojji5pa7m9EChRptSAGO0OM8yFCmZ1OkycDo/Ogfz9.RKxXreEy', 'OmIqqBTbcOrwF80i3PSPBBfxAg0aHDjqQTV96pXGJSsbxBPP2DlfyH9DHFIR', 'active', '', '2017-12-28 09:26:31', '2017-12-28 09:22:58'),
(35, 5, 1, NULL, '$2y$10$gmspt2tl8RoBlECHaJ.0DuBOgK5oehNbQdaDmW2rtzIra4xWBPN0G', 'key-5acb0d6e9c7d8', 'active', '', '2018-04-09 06:51:26', '2018-04-09 06:51:26'),
(38, 5, 1, '085718135543', '$2y$10$mF8rs6tz6fPUk6rzlihNKupvAGJCA5Ce./pQ9xO8mx93Qzfprho76', '5b03d5f064c35', 'active', '', '2018-05-22 08:33:52', '2018-07-31 07:32:42'),
(41, 5, 1, '021822828', '$2y$10$.i1rh6ZURBQA0LL4Oj.oDOqy0UPQQORqTbbN9rdwDx.Yyw35rsdn2', '5b066bacb0658', 'active', '', '2018-05-24 07:37:16', '2018-05-24 07:37:16'),
(42, 5, 1, '021822828', '$2y$10$I0Yl6QVJlCfBuXD2KyXolebtx2Yo7uOiRnuLluvXBdehXgv0L81Ty', '5b0679717a19e', 'active', '', '2018-05-24 08:36:01', '2018-05-24 08:36:01'),
(47, 2, 1, '087654321', '$2y$10$OhXoeyfepmaPYustER5JiewMSCnu3QMVkg4QHVYJzphPkzJ1G3/km', '5b162a50b007b', 'active', '', '2018-06-05 06:14:40', '2018-07-30 21:47:02'),
(49, 5, 1, '081289256242', '$2y$10$/CgxLgpTirp0YjoDmkvA7.Fqozn70/4V7Eo6X4AKW2CKWwKtmdZPi', '5b31738876a70', 'active', '', '2018-06-25 22:58:16', '2018-06-25 22:58:16'),
(50, 5, 1, '789456123', '$2y$10$c6E.RbgRuppUOcdN.bxGj.V6oNlJfL/pYlppLXcwl.Y9.FBFGFmVu', '5b3173e55dc00', 'active', '', '2018-06-25 22:59:49', '2018-06-25 22:59:49'),
(51, 5, 1, '9999', '$2y$10$xVCCRmPLRfWEpZGNEfKid.VngrGGMy3DqeU2hcaqlfzFWsMQ5k7zC', '5b317aa833838', 'active', '', '2018-06-25 23:28:40', '2018-06-25 23:28:40'),
(52, 5, 1, '4567', '$2y$10$bkoEZUxo9WiaxtE32lcvEejXTAhSdRiHwn/VbasZVFlaMHBUgwGty', '5b317e5fe5bc8', 'active', '', '2018-06-25 23:44:31', '2018-06-25 23:44:31'),
(53, 5, 1, '0812892562421', '$2y$10$2dW9vH6BNhJfWS4v1LObmeIVtuQhg.DvA8nKjXwMlKZ/UQbh33p6i', '5b317e9cc7f38', 'active', '', '2018-06-25 23:45:32', '2018-06-25 23:45:32'),
(54, 9, 1, '8888', '$2y$10$L6o553xg/8ZWNDuuJJS6UemC3HuqloJICTXpAHY.BZM20DKOmU2X2', '5b317f9e7cc18', 'active', '', '2018-06-25 23:49:50', '2018-06-25 23:49:50'),
(55, 1, 1, '121', '$2y$10$eQrWHais45GWKrouZp5.duPVHaJj1oCpnhc6/WVL8Jf2y6e0tcPAC', '5b318ef66c660', 'active', '', '2018-06-26 00:55:18', '2018-06-26 00:55:18'),
(56, 5, 1, '0811553355', '$2y$10$oVQ6.PqaEvcVy4GCCfwMHucbSKOhBa5i8Q8hTi62pSaqjKzVsKs22', '5b31d01214050', 'active', '', '2018-06-26 05:33:06', '2018-06-26 05:33:06'),
(57, 5, 1, '087877191980', '$2y$10$sUd8c1tUXxT6VrG10RjamutpFuU36M4G0uSj5Mq0gMPAqag/YVzSK', '5b34164497db0', 'active', '', '2018-06-27 22:57:08', '2018-06-27 22:57:08'),
(58, 2, 1, '7676', '$2y$10$h40ds289X4J6qldmsqlSCOl.1fKn0QzZeeyIm5FLrTUTRIg7jgiyW', '5b38bebfd2348', 'active', '', '2018-07-01 11:45:03', '2018-07-01 11:45:03'),
(59, 2, 1, '5489', '$2y$10$c0Ufj7jaiOHfSqYJexzTVOLYVYC741jwYlgyChu/EX2ifCv9cnvUa', '5b38bf5e19258', 'active', '', '2018-07-01 11:47:42', '2018-07-01 11:47:42'),
(60, 2, 1, '08999310048', '$2y$10$Usq1MDHET9iH5bNjp/Vpw.94UZUoUnmiMZSQ9RdRGGhu4freylEX2', '5b38c07081268', 'active', '', '2018-07-01 11:52:16', '2018-07-30 01:16:30'),
(61, 2, 1, '08223334444', '$2y$10$bd8b2qnVuirLJlvJ3/dYi.VDZoPSrL.6NWzUl8M8zO4uEwh6n.Ypa', '5b38c13ee05d8', 'active', '', '2018-07-01 11:55:42', '2018-07-01 11:55:42'),
(62, 2, 1, '08112323231', '$2y$10$APXePbxDNIQHud76HNdKLOwD0EStg7vORMj9bm9T1lmO7edZvUBTG', '5b3945af96640', 'active', '', '2018-07-01 21:20:47', '2018-07-01 21:20:47'),
(63, 2, 1, '089688397844', '$2y$10$8S0NQz89z/CEJSEh4lsuVu9CbvhajOJd5PY6duPFhixGycBHnxOuC', '5b396a03b3718', 'active', '', '2018-07-01 23:55:47', '2018-07-11 22:42:38'),
(64, 5, 1, '087889838557', '$2y$10$Zfaidt9WsBP0KVzddp7XAuDTo/FBkU88JXV.3SgrAZY5W9RwD2waK', '5b396a896ed70', 'active', '', '2018-07-01 23:58:01', '2018-07-11 22:23:11'),
(65, 2, 1, '08789838557', '$2y$10$Y/2bKUwezX1uzrWhLWSkgOcZKW8Cv/vuxCo.z1SAiSNMb8XYxWYw2', '5b396b5300fa0', 'active', '', '2018-07-02 00:01:23', '2018-07-02 00:01:23'),
(66, 2, 1, '0817714108', '$2y$10$mnfD/6/1osiO/L2Z3EG0jun9Ven9hOs194M78j90eEJyeRSi.znY2', '5b396bfce4070', 'active', '', '2018-07-02 00:04:12', '2018-07-02 00:04:12'),
(67, 2, 1, '08557892488', '$2y$10$OZ7w/VH4b81huckppa5q.u2HSf0rgaso7MW78YkSs2rYwp08/B.mG', '5b396cb61c138', 'active', '', '2018-07-02 00:07:18', '2018-07-02 00:07:18'),
(69, 2, 1, '08118161618', '$2y$10$pL3GVePERfkHkcdUp7PvOeUqNJS5Fh37Bcn/5WaEjyQe.94rggENe', '5b3a3e513f3b8', 'active', '', '2018-07-02 15:01:37', '2018-08-01 00:37:39'),
(70, 5, 1, '08111633898', '$2y$10$kfMo2OE85gvv4H1.pbzWjOHdS9mWEPgjL0ipIcVC3MMJR7I9YgWJK', '5b3a4338789b0', 'active', '', '2018-07-02 15:22:32', '2018-07-02 15:24:15'),
(71, 2, 1, '08111708772', '$2y$10$GHTvXsMVG0FQNzyYHweyLOp.9TcSUJgDjTDPyEPvRD9hMI5uXIPDi', '5b44231856ea0', 'active', '', '2018-07-10 03:08:08', '2018-07-10 03:08:08'),
(72, 2, 1, '0899123456', '$2y$10$Qw7XOtdcQoYeFLedIv1yg.b8kWg2w0bWK6kSgWenYWYJYfIbuBcRu', '5b469919a7f80', 'active', '', '2018-07-11 23:56:09', '2018-07-29 22:11:10'),
(73, 2, 1, '081296726355', '$2y$10$xdmJV7cd886GjS6ZJDFwd.ofRyDn/Ion.mKcYwADCV89fyiHE.LwK', '5b46e4c89eb10', 'active', '', '2018-07-12 05:19:04', '2018-07-12 05:19:04'),
(74, 2, 1, '081319109844', '$2y$10$YS.hTN0bH6Kpos/eP3wzR.yLtXQzv5hSYxI9e4Mi1LJaY.P5ieHL.', '5b4d0b4ec7b50', 'active', '', '2018-07-16 21:17:02', '2018-07-16 21:17:02'),
(75, 5, 1, '+6285240161977', '$2y$10$Y9Gox2LaqG/Kt9L8NTEVLelxUB0JeFZw7mo2w5CIMNqnAbotX6g/S', '5b4d2852c8af0', 'active', '', '2018-07-16 23:20:50', '2018-07-16 23:20:50'),
(76, 2, 1, '081381111246', '$2y$10$sv/k5e7rHIYGcQfG/zuusOb5aUWHDpyyIuFu.olrlU0RQ.z08AUGq', '5b4d499aa1dd8', 'active', '', '2018-07-17 01:42:50', '2018-07-17 01:42:50'),
(77, 2, 1, '081388831300', '$2y$10$emb9fOP7H8gTqmpBFAB2yerSw1Fk5aX1AU7HaM0NyCR9rUUrJfN2y', '5b4d4e43660d0', 'active', '', '2018-07-17 02:02:43', '2018-07-17 02:02:43'),
(78, 5, 1, '081514197827', '$2y$10$zAvLQiGwVQCeFVYALRq4quoL8SEOj98nDnokoRhtkQ0s7cZuKd272', '5b4e34d0de698', 'active', '', '2018-07-17 18:26:24', '2018-07-17 18:26:24'),
(81, 5, 1, '081315996271', '$2y$10$y2/iJ/1LKZHfyQm2sNp.E.YbNNH3DL9PlRnBhVm7j8LKjf5khoqCO', '5b57bd75ce0e0', 'active', '', '2018-07-24 23:59:49', '2018-07-24 23:59:49'),
(82, 2, 1, '081314077127', '$2y$10$3hEflLN0zni54PQX87SLY.A84ysWchnMvFaRw9OtSkBmYPBGt5wtu', '5b57ce0e73f78', 'active', '', '2018-07-25 01:10:38', '2018-07-25 01:10:38'),
(83, 2, 1, '08127071302', '$2y$10$rVZIdiVMsXUa5EHymSnjWeIvxNEjbn5dCDPvmfaMM7Du3yJwiJtrW', '5b57e478a7f80', 'active', '', '2018-07-25 02:46:16', '2018-07-25 02:46:16'),
(84, 5, 1, '082127329809', '$2y$10$TUPpVLf518feiYLAJjvxleVaEb2FbbF0KZ8dEmgcHFyFaLtPtXKzC', '5b5a780128870', 'active', '', '2018-07-27 01:40:17', '2018-07-26 18:41:09'),
(85, 2, 1, '081382868978', '$2y$10$vw2mjRezEMstfHOI97ldZetB815jMF1lFANomCHQ7dWLyZZl.silO', '5b5a79b1589f8', 'active', '', '2018-07-27 01:47:29', '2018-07-27 01:47:29'),
(86, 5, 1, '088888', '$2y$10$MlvbRvgKCZWePwMtjfdKEO8t1/.K7dvc1JnX7TY1bSPBGfGrsi9Sq', '5b5a94937f710', 'active', '', '2018-07-27 03:42:11', '2018-07-29 22:10:23'),
(87, 5, 1, '0895399966013', '$2y$10$4.iazouL/qlFiX6KkyC7ju20kYxlLc8zrO6.6g1zL4pnJLqCxWxUu', '5b5ae3acae128', 'active', '', '2018-07-27 09:19:40', '2018-07-28 14:25:43'),
(88, 5, 1, '081315402765', '$2y$10$8h2X.oav2hHcZ1CCaqHF3uPyPaRyqOAFgjrML0sYRdSAcqmQo4tsW', '5b5b4e6acaa30', 'active', '', '2018-07-27 16:55:06', '2018-07-28 14:25:50'),
(89, 5, 1, '085714230464', '$2y$10$JmCbk8qjKS6lNYbYm5BNWe/fl8fxFQNgYlIUoX/QGs41TsywN4Kaq', '5b5bd096e7ef0', 'active', '', '2018-07-28 02:10:30', '2018-07-28 14:26:00'),
(92, 5, 1, '085946058325', '$2y$10$GxqjvTiMxGJ.4HAZ.Kw7ReLawvpmIgOj99Xio9JSIwcVMCTzmlYhW', '5b5ca1a9d4288', 'active', '', '2018-07-28 17:02:33', '2018-07-28 14:26:09'),
(93, 5, 1, '087763543766', '$2y$10$Iu3wKYjnUT.f.LboZKAGhOcOnXIVS6Tm319sbPg1M0sVajSfKFG7C', '5b5ca34301770', 'active', '', '2018-07-28 17:09:23', '2018-07-28 17:09:23'),
(94, 5, 1, '085214071980', '$2y$10$sHlBrbrnh/IsbYTXqRiPa.JqiPKiUU/Nlax5SH6C5Ch1XwD9nxf9i', '5b5cd20b69398', 'active', '', '2018-07-28 20:28:59', '2018-07-28 14:26:15'),
(95, 5, 1, '0812456789', '$2y$10$Dwugh.QjwpQ3s/G8AhqRjeIWBVh5J23tCuq4D8c5ITJJizmKjFpzq', '5b5cda509d3a0', 'inactive', '', '2018-07-28 21:04:16', '2018-07-28 21:04:16'),
(96, 5, 1, '083877077261', '$2y$10$ubDq2KSnUvdE.kIIGjOrVukiUO/qaFbZrpnBs1Vvhw9PDGhU4t1ZS', '5b5cdb2b1c138', 'active', '', '2018-07-28 21:07:55', '2018-07-28 14:26:26'),
(97, 5, 1, '081266888503', '$2y$10$L4geBB23QIwgAzwMnb9pLOuLGk15KCuZuvfGd6DVzhkg8XBElhSBa', '5b5cdb636ab08', 'active', '', '2018-07-28 21:08:51', '2018-07-28 21:26:44'),
(98, 5, 1, '087871504905', '$2y$10$KlUjDlit0JilSWNoRatc5eGG9XK.xZfZNCnJzsk22We6qoYmmD56O', '5b5cdbb1f0f78', 'active', '', '2018-07-28 21:10:09', '2018-07-28 14:26:38'),
(99, 5, 1, '081585836098', '$2y$10$yVR07.GZgjVEy5c.C4DyDOPKVvqe6DbYZKK9oEd5UB1.Vi1J3njte', '5b5cdbe91bd50', 'active', '', '2018-07-28 21:11:05', '2018-07-28 14:26:46'),
(100, 5, 1, '082113453414', '$2y$10$EG6bJ22mNUxQWuTVQGlodutiGktxS48ZD.1uIhlqghE1B2Y5sQ6Lu', '5b5cdbf5157c0', 'active', '', '2018-07-28 21:11:17', '2018-07-28 22:16:45'),
(101, 5, 1, '083813281568', '$2y$10$ixm2fSzGPoZHzKl4o2oVt.nBDvb26J7Qs4jvyf.nU0wkfwodJIz42', '5b5cdc433a980', 'active', '', '2018-07-28 21:12:35', '2018-07-28 22:18:05'),
(102, 5, 1, '087888098965', '$2y$10$cC4CUw2Sqh2b3iDe/lJrCuV.3UDfcRROBsFaJ6HukiJELBN3ot81m', '5b5cdc92b8d08', 'active', '', '2018-07-28 21:13:54', '2018-07-28 14:27:01'),
(103, 5, 1, '0895331369640', '$2y$10$3gW6.ZU.fF7SxPEnqMw0cu8DFDo4uPHI5wvtyQ/mMZx0saAJ7y07C', '5b5cddc4d1790', 'active', '', '2018-07-28 21:19:00', '2018-07-28 14:27:06'),
(105, 5, 1, '081384055893', '$2y$10$v.6aX6tEszVn.d.qnQcJ.e751IwPu/QQkzynGz.Efr/yCtzkLsJ1a', '5b5cde6003a98', 'active', '', '2018-07-28 21:21:36', '2018-07-28 14:27:19'),
(106, 5, 1, '085887793282', '$2y$10$LdqaDMm37tspjahqsNVKSuOjilcKo5y293xmVZ4Iz0XPRpfNPCshG', '5b5cdea8a7f80', 'active', '', '2018-07-28 21:22:48', '2018-07-28 14:27:23'),
(107, 5, 1, '083127129400', '$2y$10$uptVOsPA1rbTDGe93E2geOp2UODqMtDPa.Y6AY0JCydVTtysBzFYu', '5b5cdf6936330', 'active', '', '2018-07-28 21:26:01', '2018-07-28 14:27:32'),
(108, 5, 1, '083813852673', '$2y$10$hsl9TtgqAxZDv4DYvVf7IutsJydRpDxAJ/HK5p1cyiBBl1gye9MHK', '5b5ce05371098', 'active', '', '2018-07-28 21:29:55', '2018-07-28 14:31:48'),
(109, 5, 1, '089531369640', '$2y$10$6Oo.R/ts7o9Z68OXAZNA5eTNCU8Yb9ogW7hKwoQe7Wx/.JZc/SpLW', '5b5ce05d7d000', 'active', '', '2018-07-28 21:30:05', '2018-07-28 14:31:54'),
(110, 5, 1, '083811356165', '$2y$10$L4geBB23QIwgAzwMnb9pLOuLGk15KCuZuvfGd6DVzhkg8XBElhSBa', '5b5ce110f32a0', 'active', '', '2018-07-28 21:33:05', '2018-07-28 14:49:15'),
(111, 5, 1, '085280100145', '$2y$10$JrrNzbmv.MGFWsnR3wyHUu7n7ZzEdyPoJqdFfHEpFnRz62XJtmRK2', '5b5ce20989f08', 'active', '', '2018-07-28 21:37:13', '2018-07-28 14:49:23'),
(112, 5, 1, '089602877205', '$2y$10$bHQ4MX7q.JfRNPljMw7amO.hlQSwea3keQXzdHWxwUvQBvHaFPwAC', '5b5ce38461698', 'active', '', '2018-07-28 21:43:32', '2018-07-28 14:49:31'),
(113, 5, 1, '08569972337', '$2y$10$HDiI4GMbffgt8pOLUW069O5rtwC3J795SVLJrnajyhMajANWG7BGi', '5b5ce410f3a70', 'active', '', '2018-07-28 21:45:53', '2018-07-28 22:29:38'),
(114, 2, 1, '082249757628', '$2y$10$9m3klhXBoNrmi.rNYj4VcuGtVZBv4xQEc9cy5Hgl5L6tmHesuH2Z6', '5b5ce4a22c6f0', 'active', '', '2018-07-28 21:48:18', '2018-07-28 21:48:18'),
(115, 5, 1, '085771429550', '$2y$10$G9pdNBzsplSw/5VP4cMhzOT/w4hI.zo5YZnjzo34AObduc3lIpcya', '5b5ce5d4b2f48', 'active', '', '2018-07-28 21:53:24', '2018-07-28 14:53:48'),
(116, 5, 1, '085718027837', '$2y$10$Av37n4qgKdKitJVGHvukFumXa1pfHhl9lXCf6eVfAUmeKYfhZuZgi', '5b5ceb4d72038', 'active', '', '2018-07-28 22:16:45', '2018-07-28 15:19:26'),
(117, 5, 1, '087654321', '$2y$10$g7b490JHiM0S2G3hs1qBmeFTbxOPoBPAJNnlwYj8OYCNks0.xvLH2', '5b5ceb86c8320', 'active', '', '2018-07-28 22:17:42', '2018-07-28 22:17:42'),
(118, 5, 1, '085640334039', '$2y$10$p.7iOQ0mJ2./tPTwOGqSdOEP6qs1/Xs3p9hPOKOStgp0R.4dF2Rv2', '5b5cebfe8aac0', 'active', '', '2018-07-28 22:19:42', '2018-07-28 22:19:42'),
(119, 2, 1, '087808957570', '$2y$10$nJmRIkz3kL.wRPAZrjgWOuiIXqmmdjC3PkM/HygcGLQEHSQFRt6SK', '5b5cec9779568', 'active', '', '2018-07-28 22:22:15', '2018-07-28 22:22:15'),
(120, 2, 1, '081220211201', '$2y$10$cJMte8bHIpTN4.RvtSbOWue17VTFGENA1QUrDO3i11PnOGGCPimf.', '5b5ced14ca648', 'active', '', '2018-07-28 22:24:20', '2018-07-28 22:24:20'),
(121, 2, 1, '085216928065', '$2y$10$2VZ4WM2s2jE2bHVS2Fl7pOGrQZ5ccwUDZl51tZp0h/q7royKBELLy', '5b5ced5702328', 'active', '', '2018-07-28 22:25:27', '2018-07-28 22:25:27'),
(122, 2, 1, '081234657', '$2y$10$TwY03ZTSvsC.cdddNg7QZePiqGJ/4YbPbYo9gUvP0U9GJjWzd65CK', '5b5cedbe1ccf0', 'active', '', '2018-07-28 22:27:10', '2018-07-28 22:27:10'),
(123, 5, 1, '085945175200', '$2y$10$oSC4gu.FK9la43ZKkLAKr.iL625QGu2tb7eNEFJ6As/MpjIhVncGy', '5b5cef45aa690', 'active', '', '2018-07-28 22:33:41', '2018-07-28 15:35:22'),
(124, 2, 1, '08989030153', '$2y$10$oSC4gu.FK9la43ZKkLAKr.iL625QGu2tb7eNEFJ6As/MpjIhVncGy', '5b5cf01ee53f8', 'active', '', '2018-07-28 22:37:18', '2018-07-28 22:46:33'),
(125, 5, 1, '085959703316', '$2y$10$8rQJsbNQysECz9dXuI91beoZLk1P78RzdelX/pCyqkL86OCWr9lvS', '5b5cf3680a028', 'active', '', '2018-07-28 22:51:20', '2018-07-28 15:51:42'),
(126, 2, 1, '0895619384179', '$2y$10$BgFaD3wkIKPZEuSWpzmurOvElp7qVO/SSY8Wms3Rf7oh7NfFjMYfi', '5b5cf4638f8e0', 'active', '', '2018-07-28 22:55:31', '2018-07-28 22:55:31'),
(127, 5, 1, '081212783246', '$2y$10$KqjhyReatFLCXIl.ePVoLuot96.joPuSrVYRZfgKuTKSO8FtPBloS', '5b5cf499182b8', 'active', '', '2018-07-28 22:56:25', '2018-07-31 20:28:36'),
(129, 5, 1, '055813712962', '$2y$10$k16HrD49iStvj1pnNrBFc.5Usv3P2U2XFYLGhEqPPjGpJIsar12le', '5b5e42289b078', 'active', '', '2018-07-29 22:39:36', '2018-07-29 16:28:38'),
(130, 5, 1, '081383661612', '$2y$10$pv1wB2xaB5UQFy/leWbnkOy.3p0hNG0BWFqzrCe4O0ay5GxJumS3y', '5b5e4d4ea25a8', 'active', '', '2018-07-29 23:27:10', '2018-07-29 16:28:42'),
(131, 5, 1, '089617603792', '$2y$10$ZgdXIK.d4dysV8YycJihpebfW0jpkXAuKnSF59AVHlwUleLs9Qlsi', '5b5e665411d28', 'active', '', '2018-07-30 01:13:56', '2018-07-30 01:19:45'),
(132, 2, 1, '+6281212783246', '$2y$10$f/svW1T6RI3t9qoPggarwOMutyd7saD8HUnUYVI55gKL5R.laDv0S', '5b5e67afc3500', 'active', '', '2018-07-30 01:19:43', '2018-07-30 01:22:55'),
(133, 5, 1, '+6284809240566', '$2y$10$dKmFwb3unmKQ5jmyWkO5XuQPlQ6sRS4G34u8PnFLsj5D4nn4iHSK2', '5b5e6b86a6fe0', 'active', '', '2018-07-30 01:36:06', '2018-07-31 13:54:50'),
(134, 5, 1, '089656576655', '$2y$10$pQwAxIMz/k9LgGuso2ouo.l2bWhSsqEw.EANnUhmlgC3Tc4YylNdy', '5b5e88b368fb0', 'active', '', '2018-07-30 03:40:35', '2018-07-31 13:54:55'),
(135, 2, 1, '081319979308', '$2y$10$dC4LN5uwEsGo/w86Ic9Mb.ds3JFU6Y1G77Do2xAAQTRONvzfW/3SC', '5b5ea84b32898', 'active', '', '2018-07-30 05:55:23', '2018-07-30 05:55:23'),
(136, 5, 1, '087871666378', '$2y$10$9udTQWoBr/TG1PUbpewHSu/K2XB9vVoVI5ww6RE70bhnxf/JVVk5C', '5b5eaaebb7d68', 'active', '', '2018-07-30 06:06:35', '2018-07-31 13:55:00'),
(137, 2, 1, '081809031862', '$2y$10$1kOMoR4FzfsW9bLv0ocXo.XOKZvQYrAlpzxFy8mk8iC2SSrHq/6RK', '5b5ead22e1578', 'active', '', '2018-07-30 06:16:02', '2018-07-30 06:16:02'),
(138, 2, 1, '087720568537', '$2y$10$zeHkjVX59nJZhB2DVj91XO1uh0ZD7oK8WJVCk7c63GIvYi3mS/1cq', '5b5f4a3d979c8', 'active', '', '2018-07-30 17:26:21', '2018-07-30 17:26:21'),
(139, 5, 2, '08111087855', '$2y$10$SHCGfqip2.9N0KilrSic1e7mbcjKmX8v96XbLWQ3NxK3ULYzoPxcq', '5b5f970d2e630', 'active', '', '2018-07-30 22:54:05', '2018-07-31 13:55:06'),
(140, 2, 1, '087808941676', '$2y$10$FN5vBS09mH/AroROa9J5ne6V1jPHIb5u9LtLNzgSchoF8wvCWa4UO', '5b5fb15a36718', 'active', '', '2018-07-31 00:46:18', '2018-07-31 00:46:18'),
(141, 2, 1, '089688339949', '$2y$10$Ilww3bndXlJyujWyBHuUhONzvAFXy8wqoPT4zTx0n9AjDaLb7uWS.', '5b5fb59dbbfd0', 'active', '', '2018-07-31 01:04:29', '2018-07-31 01:04:29'),
(142, 2, 1, '08170052314', '$2y$10$SaZQYGSmzvaYPR9N7VkZGOLyfm/itC.zrgg7KsKBs.oC2iFysNLb.', '5b5fba7deb988', 'active', '', '2018-07-31 01:25:17', '2018-07-31 01:25:17'),
(143, 5, 1, '082272844228', '$2y$10$/ylXEafNlrbwgu.7l5WZ9e/1muA3Q4TPyoNc7DFYnEQJjSgVWU1Gu', '5b60ceca04650', 'active', '', '2018-07-31 21:04:10', '2018-07-31 18:06:16'),
(144, 2, 1, '089625882740', '$2y$10$ezaiYULoXkEMol5FdxsKfOOeUDpHzYk2HG/3r3UpvalWhZUWqfYq6', '5b60e76b007d0', 'active', '', '2018-07-31 22:49:15', '2018-07-31 22:49:15'),
(145, 2, 1, '085771426550', '$2y$10$TjnNEQ4nV/wW4RbafkZMouVKmcjuNhtZhCAyh4X1SJvxXmza8ENaS', '5b6101d855348', 'active', '', '2018-08-01 00:42:00', '2018-08-01 00:42:00'),
(146, 2, 1, '085210739245', '$2y$10$B20vGfsMDu0pbfCAsO08VOVHmXY4c93FrFZpJgik401Ile36UaKp2', '5b610c696be90', 'active', '', '2018-08-01 01:27:05', '2018-08-01 01:27:05'),
(147, 2, 1, '085959666840', '$2y$10$8A2TkwTdRspxiEjX..0gBOEnjMWc5uywt.TDvBFSuMePwlckE8M2S', '5b610ea013498', 'active', '', '2018-08-01 01:36:32', '2018-08-01 01:36:32'),
(148, 2, 1, '085939534512', '$2y$10$2Yfc8I2kXevTArvjZ2VYHu8Sc8u21Ejorkx5ZcTVYVO7NK3czEKaq', '5b614624a5c58', 'active', '', '2018-08-01 05:33:24', '2018-08-01 05:33:24'),
(149, 2, 1, '0812113118787', '$2y$10$lK.M72YkupVdUb2Pn1u8Xe8w5.COYENUiGOS1yMx6FwAhkHWGJQE2', '5b615563a50a0', 'active', '', '2018-08-01 06:38:27', '2018-08-01 06:38:27'),
(150, 2, 1, '081284724525', '$2y$10$V15psWfV.Wwks6VvLIXv6evBqU47vAb1czSY7iPhdAqSLG12nc52O', '5b6184106d600', 'active', '', '2018-08-01 09:57:36', '2018-08-01 09:57:36'),
(151, 5, 1, '081382589050', '$2y$10$HKNJQ1fi5RQ2i8BudL2at.c4UiH3SyjcpUI6xRIAA.0k6UCwMnGNW', '5b62029a806b0', 'active', '', '2018-08-01 18:57:30', '2018-08-01 21:23:20'),
(152, 5, NULL, '081382589050', '$2y$10$.neIUToG5feVlZlZZlyOquI3ii59H4IUNdnJGIvMmjlCDlxc4fyRC', '5b6202e565ce8', 'active', '', '2018-08-01 18:58:45', '2018-08-01 18:58:45'),
(153, 5, 1, '087771051399', '$2y$10$467/0N7/QHN9ostrkOx/e.MSb5MILxDXAuOsXXtLupScDIntUY5RS', '5b621925762a0', 'active', '', '2018-08-01 20:33:41', '2018-08-01 13:58:12'),
(154, 2, 1, '087886951124', '$2y$10$L9RH619dPLLne48TlEG9UO23LX8O6EkFsHvJtuoLShUZwInNDlRlS', '5b621eb709858', 'active', '', '2018-08-01 20:57:27', '2018-08-01 20:57:27'),
(155, 5, 1, '08777105139', '$2y$10$IUnkkqNL.8dDZxZHiD/0zuS.k4TWGxQA9fh3C81vX93/Jgy.iTESq', '5b621f2780a98', 'active', '', '2018-08-01 20:59:19', '2018-08-01 17:58:01'),
(156, 2, 1, '085211876530', '$2y$10$Jm8nbMWOP64OKGrIfGxhDObre/oMODYiJAawwOuyJtRz3DE0.Msua', '5b624d6a1ccf0', 'active', '', '2018-08-02 00:16:42', '2018-08-02 00:16:42'),
(157, 2, 2, '087771979717', '$2y$10$lKMSR4we2l91t99iUkPfUeJqNrm8gqHLrPV4bpCUBKQNZHnvTMyTu', '5b625f33f26e8', 'active', '', '2018-08-02 01:32:36', '2018-08-02 01:32:36'),
(158, 2, 2, '081281532222', '$2y$10$c4TrbqmZbtiWmugc78zNX.q85hKwQGM2umMgy1GFJGGW63gm2Ceou', '5b626007ddae0', 'active', '', '2018-08-02 01:36:07', '2018-08-02 01:36:07'),
(159, 2, 1, '08176807051', '$2y$10$P4bEW92pojfdjwrUILGKl.2dlsOlTxU.zhowp2gYrfqXAlT7QGEYS', '5b627f17a48d0', 'active', '', '2018-08-02 03:48:39', '2018-08-02 03:48:39'),
(160, 2, 1, '089648278845', '$2y$10$5bACANpBUxovLSr26IA4SuptgQ2uzlxPaloVD9KbrriPQ2vEs1A3W', '5b628d206aef0', 'active', '', '2018-08-02 04:48:32', '2018-08-02 04:48:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
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
-- Dumping data untuk tabel `voucher`
--

INSERT INTO `voucher` (`id`, `voucher_code`, `discount_rate`, `for`, `product_category`, `valid_from`, `valid_until`, `quota`, `description`, `created_at`, `updated_at`) VALUES
(1, 'BRDIS10', 10, 'Customer', 1, '2017-11-13', '2030-11-23', 5, 'Discount 20%', '2017-11-15 12:14:22', '2018-01-08 08:19:39'),
(2, 'BRDIS01', 10, 'Reseller', 1, '2017-11-13', '2017-11-30', 5, 'Discount 10%', '2017-11-15 09:51:16', '2018-01-08 07:17:53'),
(3, 'BRDIS02', 5, 'Customer', 1, '2017-11-13', '2017-11-27', 1, 'Discount 5%', '2017-11-15 09:51:20', '2018-01-08 07:17:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher_use`
--

CREATE TABLE `voucher_use` (
  `id` int(11) UNSIGNED NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `voucher_use`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `wanee_history`
--

CREATE TABLE `wanee_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(20) NOT NULL,
  `saldo_akhir` int(20) NOT NULL,
  `reason` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wanee_history`
--

INSERT INTO `wanee_history` (`id`, `user_id`, `amount`, `saldo_akhir`, `reason`, `created_at`, `updated_at`) VALUES
(12, 64, 25000, 525000, 'Penarikan Wanee', '2018-07-08 00:05:12', '2018-07-08 00:05:12'),
(13, 64, 25000, 500000, 'Penarikan Wanee', '2018-07-09 17:14:45', '2018-07-09 17:14:45'),
(14, 1, 1832, 34114, 'Komisi Agen', '2018-07-10 23:24:34', '2018-07-10 03:18:08'),
(15, 64, 3663, 450263, 'Komisi Agen', '2018-07-10 23:24:43', '2018-07-10 23:20:22'),
(16, 1, 8743, 876593, 'Komisi Agen', '2018-07-16 21:46:37', '2018-07-16 21:37:58'),
(17, 1, 1022, 857715, 'Komisi Agen', '2018-07-16 21:52:51', '2018-07-16 21:52:51'),
(21, 1, 1832, 833343, 'Komisi Agen', '2018-07-16 22:58:46', '2018-07-16 22:58:46'),
(22, 1, 1832, 803475, 'Komisi Agen', '2018-07-16 23:12:00', '2018-07-16 23:12:00'),
(23, 1, 1832, 805307, 'Komisi Agen', '2018-07-16 23:12:06', '2018-07-16 23:12:06'),
(24, 64, 3209, 362872, 'Komisi Agen', '2018-07-25 02:56:01', '2018-07-25 02:56:01'),
(25, 64, 3454, 366326, 'Komisi Agen', '2018-07-25 02:56:05', '2018-07-25 02:56:05'),
(26, 64, 5476, 35452, 'Komisi Agen', '2018-07-25 02:57:38', '2018-07-25 02:57:38'),
(27, 64, 4212, 39664, 'Komisi Agen', '2018-07-25 02:57:41', '2018-07-25 02:57:41'),
(28, 64, 4212, 43876, 'Komisi Agen', '2018-07-25 02:57:44', '2018-07-25 02:57:44'),
(29, 64, 1832, 45708, 'Komisi Agen', '2018-07-25 02:57:53', '2018-07-25 02:57:53'),
(30, 64, 1832, 15840, 'Komisi Agen', '2018-07-25 02:58:24', '2018-07-25 02:58:24'),
(31, 1, 1832, 775439, 'Komisi Agen', '2018-07-25 03:17:20', '2018-07-25 03:17:20'),
(32, 1, 1494, 604934, 'Komisi Agen', '2018-07-26 02:41:28', '2018-07-26 02:41:28'),
(33, 1, 20000, 711134, 'Topup Wanee', '2018-07-27 02:16:45', '2018-07-27 02:16:45'),
(34, 1, 20000, 731134, 'Topup Wanee', '2018-07-27 02:16:50', '2018-07-27 02:16:50'),
(35, 1, 20000, 751134, 'Topup Wanee', '2018-07-27 02:16:58', '2018-07-27 02:16:58'),
(36, 1, 20000, 771134, 'Topup Wanee', '2018-07-27 02:16:58', '2018-07-27 02:16:58'),
(37, 1, 20000, 791134, 'Topup Wanee', '2018-07-27 02:17:06', '2018-07-27 02:17:06'),
(38, 1, 20000, 811134, 'Topup Wanee', '2018-07-27 02:17:08', '2018-07-27 02:17:08'),
(39, 1, 10000, 781134, 'Penarikan Wanee', '2018-07-26 20:44:25', '2018-07-26 20:44:25'),
(40, 64, 2761, 957511, 'Komisi Agen', '2018-07-28 22:03:59', '2018-07-28 22:03:59'),
(41, 1, 10000, 791134, 'Topup Wanee', '2018-07-28 22:43:07', '2018-07-28 22:43:07'),
(42, 1, 1000, 782134, 'Topup Wanee', '2018-07-28 22:44:27', '2018-07-28 22:44:27'),
(43, 102, 549, 949, 'Komisi Agen', '2018-07-28 22:45:24', '2018-07-28 22:45:24'),
(44, 1, 25000, 831134, 'Topup Wanee', '2018-07-29 00:09:01', '2018-07-29 00:09:01'),
(45, 1, 25000, 856134, 'Topup Wanee', '2018-07-29 00:09:01', '2018-07-29 00:09:01'),
(46, 1, 25000, 881134, 'Topup Wanee', '2018-07-29 00:09:02', '2018-07-29 00:09:02'),
(47, 1, 25000, 906134, 'Topup Wanee', '2018-07-29 00:09:02', '2018-07-29 00:09:02'),
(48, 33, 20000, -59400, 'Topup Wanee', '2018-08-01 02:35:40', '2018-08-01 02:35:40'),
(49, 102, 0, 3699, 'Komisi Agen', '2018-08-01 03:19:37', '2018-08-01 03:19:37'),
(50, 33, 50000, -29400, 'Topup Wanee', '2018-08-01 03:21:34', '2018-08-01 03:21:34'),
(51, 102, 1923, 5272, 'Komisi Agen', '2018-08-01 03:24:14', '2018-08-01 03:24:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `agen_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `saldo_awal` int(20) NOT NULL,
  `status` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `withdraw`
--

INSERT INTO `withdraw` (`id`, `agen_id`, `amount`, `saldo_awal`, `status`, `created_at`, `updated_at`) VALUES
(10, 64, 1300, 550000, 'done', '2018-07-08 22:41:28', '2018-07-07 23:43:28'),
(11, 64, 25000, 550000, 'done', '2018-07-10 00:14:45', '2018-07-09 17:14:45'),
(13, 64, 10000, 525000, 'process', '2018-07-10 00:13:42', '2018-07-10 00:13:42'),
(14, 1, 10000, 34114, 'done', '2018-07-27 03:44:25', '2018-07-26 20:44:25'),
(15, 1, 20000, 791134, 'process', '2018-07-27 03:44:02', '2018-07-27 03:44:02'),
(16, 64, 100000, 957511, 'process', '2018-07-28 22:14:45', '2018-07-28 22:14:45'),
(17, 1, 50000, 881134, 'process', '2018-08-01 11:20:47', '2018-08-01 11:20:47');

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
-- Indexes for table `cash`
--
ALTER TABLE `cash`
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
-- Indexes for table `rating`
--
ALTER TABLE `rating`
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
-- Indexes for table `slider`
--
ALTER TABLE `slider`
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
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
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
-- Indexes for table `wanee_history`
--
ALTER TABLE `wanee_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `barcode`
--
ALTER TABLE `barcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;
--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;
--
-- AUTO_INCREMENT for table `cash`
--
ALTER TABLE `cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
--
-- AUTO_INCREMENT for table `incentive_category`
--
ALTER TABLE `incentive_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `order_billing_detail`
--
ALTER TABLE `order_billing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;
--
-- AUTO_INCREMENT for table `order_cancel`
--
ALTER TABLE `order_cancel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `voucher_use`
--
ALTER TABLE `voucher_use`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wanee_history`
--
ALTER TABLE `wanee_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
