-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Agu 2018 pada 06.39
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 5.6.36

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
(1, 1, 1, 'sukses', 'Richard', 'address', '', '', 'storage/app/photo_agen/TlWgrQzqKR7rAYh4ntPTj8nDSMgf80dvGbA6c3y4.jpeg', 756792, '5.0', '2018-04-01 12:42:20', '2018-08-10 04:38:56'),
(2, 33, 1, 'kasir', 'Rohim', 'GrosirOne Serang', '', '', 'storage/app/photo_agen/ugpGecBL35WNDqurngqA4ZN8zqTbWvhNKyz91o1i.jpeg', 510341, '4.0', '2018-04-01 13:19:26', '2018-08-10 03:39:45'),
(3, 35, 0, '0', 'jokow', 'Jl jokow', '', '', '', 0, '0', '2018-04-09 06:51:26', '2018-04-09 06:51:26'),
(4, 41, 0, 'sukses', 'bobby', 'address', '', '', NULL, 0, '0', '2018-05-24 07:37:16', '2018-05-24 07:37:16'),
(6, 50, 1, 'Bintang Kejora', 'Kejer Aku', 'Jl. Mawar', '', '', 'storage/app/photo_agen/lLUGiMremCSWBKweh4WrEtWsyg2nSXBuj8Qy2OtV.jpeg', 0, '0', '2018-06-25 22:59:49', '2018-06-25 23:04:12'),
(7, 51, 1, 'FAJAR UTAMA', 'BOB', 'Jalan Raya', 'storage/app/photo_ktp/i80MtVdkLMijZBPWvyKQKNFH2fJY2PezKFhpmACu.png', 'storage/app/photo_kk/jWz4N5gTzSi42n5Pxj9upEZyCq21YDXzdhMOUPIM.png', NULL, 0, '0', '2018-06-25 23:28:40', '2018-06-25 23:47:37'),
(8, 52, 1, 'Nama usaha', 'Nama lengkap', 'Alamat lengkap', '', '', NULL, 0, '0', '2018-06-25 23:44:32', '2018-06-25 23:44:32'),
(11, 55, 0, 'sukses', 'Coba coba', 'address', 'storage/app/photo_ktp/9TXIaxa0htw8ysIVRze8xuMvraMUGqwQBf5CcfAw.jpeg', '', NULL, 0, '0.0', '2018-06-26 00:55:18', '2018-07-30 21:24:26'),
(12, 56, 1, 'OneVis', 'Garuda', 'Tangerang', 'storage/app/photo_ktp/A6VwSUTQJmSjusB6en3vMj4GcTjvjfPSy1skhXhK.jpeg', 'storage/app/photo_kk/dEICVbBJn590yLUVUVu8SZ0OOLeNlxvdbc4p7Mtb.jpeg', 'storage/app/photo_agen/4z0EomoJ3XHVhLnFkRBeGOvVxeD3nIQ0g3wBPqja.jpeg', 0, '0', '2018-06-26 05:33:06', '2018-06-26 05:33:08'),
(14, 64, 1, 'Budi Shop', 'Budiarto', 'GLC europe 2 no 1', '', '', 'storage/app/photo_agen/muZB1bIOD06DR7ZyMX5MyjnsybBXNKwseDB4PAVf.jpeg', 736761, '4.5', '2018-07-01 23:58:01', '2018-08-10 02:25:28'),
(15, 70, 1, 'Grosiran', 'Grosir Satu', 'Serang', '', '', NULL, 0, '0', '2018-07-02 15:22:32', '2018-07-02 15:22:32'),
(16, 75, 1, 'Alfitha', 'Hasanuddin Thawil', 'Jl. H. Rausin Rt. 002 Rw. 01 No. B1 Kel. Palmerah Jakarta barat', '', '', NULL, 0, '0', '2018-07-16 23:20:50', '2018-07-16 23:20:50'),
(17, 78, 1, 'Mar\'ie Belanja', 'Jaka Setia', 'Jalan kapuk raya rt 002 rw 03 nomor 61a, kapuk muara, penjaringan, jakarta utara', 'storage/app/photo_ktp/57yHHPGINC0AGIUdSvWEu8PNXy9IAfFOLi1a6Vs9.jpeg', '', 'storage/app/photo_agen/Ogv07OoYgUHmsGi0U4oo1nemNhSQiaynqwvLk6Ai.jpeg', 0, '0', '2018-07-17 18:26:24', '2018-07-17 18:26:26'),
(19, 81, 1, 'Angin ribut', 'Addin', 'Sutera niaga', 'storage/app/photo_ktp/GGapBzt33mjCr90VIhqVLxwdWHy4rM9sZlcaW50Y.jpeg', 'storage/app/photo_kk/Lw9YY8Fjfct0mjBcnUP9wOast3aPG52CI2ml0hdV.jpeg', 'storage/app/photo_agen/E8QwpZ9fanqVUJdo6lIYNNEsm9ZlM3krj3vAbEIi.jpeg', 0, '0', '2018-07-24 23:59:49', '2018-07-24 23:59:51'),
(20, 84, 1, 'Grosirone Serang', 'Grosir One Serang', 'Jl.  TB Suep Cigambus', 'storage/app/photo_ktp/srh8LlX5FCvtrZKAvGQX3IirO340VZKY16SD76yz.jpeg', 'storage/app/photo_kk/BU9CcVWx4cJj5t8OWBeG9QZBFBr8oGk6mW5wTDAY.jpeg', 'storage/app/photo_agen/T8qPxbN0OKsiO2TFOgCUQRlReoVn7TOBpQsJ02Kj.jpeg', 0, '0.0', '2018-07-27 01:40:17', '2018-08-10 03:54:27'),
(21, 86, 1, 'Tesrinf', 'Tesring', 'Jln coba', 'storage/app/photo_ktp/mrcQCazp0EHCneXbx50ccP8EYOxQXKagV0Zk9p7N.jpeg', 'storage/app/photo_kk/jKFYsoDNcJwRueeqP74CatMTveBIZIyQToc8a6oa.jpeg', 'storage/app/photo_agen/GikmTpRSyqG4SgnSmG5SqpgTxcRU0orkmxNZF1pv.jpeg', 0, '0.0', '2018-07-27 03:42:11', '2018-07-30 00:48:40'),
(22, 87, 1, 'Sembako', 'Yusuf Hidayat', 'Kasemen, kota serang', '', '', NULL, 0, '0', '2018-07-27 09:19:40', '2018-07-27 09:19:40'),
(23, 88, 1, 'Cemara', 'Hasbi', 'Kp.cicayur 1 Rt 01/ Rw04 desa pagedangan kecamatan pagedangn tangerang', '', '', NULL, 0, '0', '2018-07-27 16:55:06', '2018-07-27 16:55:06'),
(24, 89, 1, 'SEMOGA BERKAH', 'Rivai', 'Griya persada 1 blok A4 no 41', '', '', 'storage/app/photo_agen/SzbdPXiDCp5wUgzBcTa8KsxRsS4Bm9Uq1TZu5YPd.jpeg', 1000000, '0.0', '2018-07-28 02:10:31', '2018-08-10 02:44:26'),
(25, 92, 1, 'Toko Dua Putri', 'Hermanto', 'Kp. Dukuh Manggah Rt.012 Rw.003 Desa Legok Kec.Legok Kab.Tangerang Prov. Banten', 'storage/app/photo_ktp/IMyMNy08aUuZ2BB5xwnRaltRvfrmUj4LsWff7Ai8.jpeg', 'storage/app/photo_kk/sPIgabac22rRnFslroDkmrKvlGnaLJextV17Lwc0.jpeg', 'storage/app/photo_agen/5XREJAOw87pmSpBjsk52Tt5s3JyZ79MmEHHh8P6c.jpeg', 0, '0', '2018-07-28 17:02:33', '2018-07-28 17:02:35'),
(26, 94, 1, 'Cv.Bina Putra Mandiri', 'Syamsul Aripin', 'Kp. Pagedangan 02/01 Desa Cicalengka kecamatan Pagedangan', '', '', 'storage/app/photo_agen/Crzkz4w0J4Yzevb7W6DT4rLnxefyEnDHD2ooVkBq.jpeg', 0, '0.0', '2018-07-28 20:28:59', '2018-07-29 22:09:51'),
(27, 95, 1, 'Lancar Jaya', 'Bobby', 'Serang, banten', '', '', NULL, 0, '0', '2018-07-28 21:04:16', '2018-07-28 21:04:16'),
(28, 96, 1, 'NeOcoffee', 'Ahmad fauzan', 'Kp. Kawoyang tengah ds cemplang kec jawilan kab Serang', '', '', 'storage/app/photo_agen/tAPMcOR90palaEh0cElMkl0FbG58KKOeyPeDflf9.jpeg', 0, '0.0', '2018-07-28 21:07:55', '2018-07-28 22:31:43'),
(29, 97, 1, 'Benajir', 'Hidayatullah', 'Kp.kasunyatan', '', '', NULL, 0, '0.0', '2018-07-28 21:08:51', '2018-08-03 20:10:26'),
(30, 98, 1, 'Manggala', 'Ahmad Muhibi', 'Kp. Gaga Bengkanang RT. 001/002 Ds. Onyam Kec.Gunung Kaler Kab. Tangerang Prov. Banten', '', '', 'storage/app/photo_agen/7tAWi9bxUgxHsGlCLEfPpGAExzxzRs1RXhrQ8okd.jpeg', 500000, '0.0', '2018-07-28 21:10:10', '2018-08-02 05:48:31'),
(31, 99, 1, 'Toko dewi', 'Herman', 'Kebaharan dukuh serang', 'storage/app/photo_ktp/HLx6HY8YcXL69avzHdPH5vt51vHekZfydEozob73.jpeg', 'storage/app/photo_kk/oSpuYDwdUg6nqc0sGqqVMwJ74henH118WigwuxSW.jpeg', 'storage/app/photo_agen/nCq64MaqXQNotn8J3IGThc5P9C3rWd2y36g32ZqJ.jpeg', 0, '0.0', '2018-07-28 21:11:05', '2018-08-06 04:09:48'),
(32, 100, 1, 'DeOlshop', 'Dyah Putri Ayu Dinastyar', 'Jl. Jayadiningrat 1, Kramatwatu Serang', 'storage/app/photo_ktp/Bppa4PbzN9Mz1mHj8YVjvn5knwYefv6pd8oCjL3d.jpeg', 'storage/app/photo_kk/vJFr6v13ZbpKhLBwpvncru45w4k7oZAgaFXnhnTi.png', 'storage/app/photo_agen/AfdWhjIN0JlPE2660CSRpDs3fa9Pf7zU70C6w8tW.jpeg', 500000, '0.0', '2018-07-28 21:11:17', '2018-07-29 16:46:15'),
(33, 101, 1, 'El_Lael', 'Eka Jamalullael', 'Kp.klebet rt/rw 004/001 ds.gandaria kec.mekar baru kab.tangerang-banten', 'storage/app/photo_ktp/T0MG8IvEt52wqO7EFWJHRsAEfKn49KJ3bkLX7jpH.jpeg', 'storage/app/photo_kk/9AusDGbQCSJbUFxMGSFZUAqOiHdlF4A1m85AszR1.png', 'storage/app/photo_agen/msWrSyl2euAyYvfHC40qVrkrzL5APYRQcl7FHN7m.jpeg', 0, '0.0', '2018-07-28 21:12:35', '2018-07-28 22:17:11'),
(34, 102, 1, 'Afrin Grosir', 'Dimas Galih Arsandy Aryadi', 'Link. Muncung, Sumur Pecung, Serang, Banten', '', '', 'storage/app/photo_agen/InJ4dcomjg7z4eGBT87h04f0FdwneRMhswH3XZ5B.jpeg', 492353, '5.0', '2018-07-28 21:13:54', '2018-08-10 03:45:51'),
(35, 103, 1, 'toko cahaya', 'Rani fitriani', 'kp.gedeg rt/rw 03/03 kel.kuranji kec.taktakan kota serang', 'storage/app/photo_ktp/iOFLKBgiJ9bv4n3pqMJpKt3xdhaKd6rG56dyR3Tv.jpeg', 'storage/app/photo_kk/GSm14AgsVOia0892LPkrbj3tbpPyxAgDSRCvkNVF.jpeg', 'storage/app/photo_agen/qmxM21EfzLwSbC3QaYsKkkPRu4tqUKLRSzNMyGHK.jpeg', 0, '0.0', '2018-07-28 21:19:00', '2018-07-31 20:28:19'),
(36, 104, 1, 'RANTAU', 'Hamid', 'Lingkungan sumur putat Rt.001 Rw.002 Kelurahan Cipocok Jaya, Kecamatan Cipocok Jaya, Kota Serang', '', '', NULL, 0, '0', '2018-07-28 21:20:51', '2018-07-28 21:20:51'),
(37, 105, 1, 'RIZKY PUTRA', 'Imam ghojali', 'Lontar baru rt 03 rw 04', '', '', 'storage/app/photo_agen/424LSPGRN0B5Algblcp7DLQ1BsfBHxkDrOLXj20g.jpeg', 500000, '0.0', '2018-07-28 21:21:36', '2018-07-28 22:18:44'),
(38, 106, 1, 'Bedug jaya', 'Ahmad fikri', 'Ciceri permai', 'storage/app/photo_ktp/kbIkTrbi1UuXrZNt55QWnSadcZ41M4jc0jeLWQQ0.jpeg', '', 'storage/app/photo_agen/WmgUUVVq49aSuNAIEIWlbBIgXUnMt5dnuU7Xa1E3.png', 500000, '0', '2018-07-28 21:22:48', '2018-07-28 21:23:38'),
(39, 107, 1, 'Bintang Songo', 'Muhammad Khalifatullah', 'Jl. Ciwaru, Kec. Cipocok Jaya Kota Serang', '', '', NULL, 0, '0', '2018-07-28 21:26:01', '2018-07-28 21:26:01'),
(40, 108, 1, 'Warung SB', 'Samsul bahri', 'Kp. Pancur melati Rt/01 RW/05 kel pancur kec Taktakan kota serang', 'storage/app/photo_ktp/eMJXZYEQqfwgKolk3rKSaKCyFGi39P7EuD1DDbVP.jpeg', '', 'storage/app/photo_agen/brka7Rr3XKJTRe32zd3BnypmAPqyzfZu7DEquYmd.jpeg', 500000, '0.0', '2018-07-28 21:29:55', '2018-08-06 07:19:39'),
(41, 109, 1, 'twin store', 'Rani fitriani', 'kp. gedeg  kel. kuranji rt/rw 03/03 kec.taktakan kota serang', 'storage/app/photo_ktp/CSw8K2dh4gCegYVOKkQJ56Xwb95RibYusHatliDv.jpeg', 'storage/app/photo_kk/bITFW9PP6qtFBAOjnOdaUrDBDzcKOczoioGZgHMg.jpeg', 'storage/app/photo_agen/fRjPtyH6qhPIIyKZQGqq3eUumZ30Gl9Ir8T75czG.jpeg', 0, '0', '2018-07-28 21:30:05', '2018-07-28 21:30:06'),
(42, 110, 1, 'HASAFA SHOP', 'hasna Salsabila Hanifah Khairunnisa Gunawan', 'perum. talaga bestari blok B5 no 33 Wanakerta Sindang jaya Tangerang', 'storage/app/photo_ktp/GM8BYUwjLq49WSOqCdjwFI0fS0DCuDKljGFkZ8NE.jpeg', '', 'storage/app/photo_agen/WVrNKq1jLSrZFSziJ96VQtkmZmutweh7fcmTJ4lm.jpeg', 0, '0', '2018-07-28 21:33:05', '2018-07-28 21:33:22'),
(43, 111, 1, '2M', 'Rahmat', 'Kp sawah RT 05 RW 02 desa vitamin kecamatan jiput', '', '', NULL, 0, '0.0', '2018-07-28 21:37:13', '2018-07-28 21:58:33'),
(44, 112, 1, 'rakyatgrosir', 'didinhazdudin', 'serang', '', '', 'storage/app/photo_agen/xYpvhQalYYyvAni4021wDiDhWsgrrLQbhYCwzltu.jpeg', 0, '0', '2018-07-28 21:43:32', '2018-07-28 21:43:34'),
(45, 113, 1, 'Kong M', 'Aep Saepudin', 'Jln jembatan besi 5 rt 007/004 no 17', 'storage/app/photo_ktp/C6TpIpyYtkb5J67zApRe2chgIPoimwTM7Qbs25q9.jpeg', '', 'storage/app/photo_agen/CWGl7IvgxAPVfZT3mqeVoqNt3U8g2BXY55AGyy0a.jpeg', 0, '0', '2018-07-28 21:45:53', '2018-07-28 21:45:57'),
(46, 115, 1, 'toko bella', 'nabella indah fratiwi', 'taman mutiara indah blok c8 no 21', 'storage/app/photo_ktp/Q7OxUdU2HjAsxxCK1aSPMJ2iQA6WExjfvN0fV33j.jpeg', 'storage/app/photo_kk/pB8Ty1zmX3p8cWR0qpIFJODUlk45P1nFIMdvWOeu.jpeg', 'storage/app/photo_agen/bgUlEt2U21zJKxHs9WHHMCBcJnatMF9HgTl0xnZS.jpeg', 500000, '0.0', '2018-07-28 21:53:24', '2018-08-01 01:41:28'),
(47, 116, 1, 'Keluarga Madhani', 'Marica Aldila', 'Taman Nirwana blok D.16 Kel.Pengasinan Kec. Rawalumbu', 'storage/app/photo_ktp/qbTHxJSBAYM1IemoepDO9nxHpZm0uZXYUz1KQNKs.jpeg', 'storage/app/photo_kk/FyTZOiOZe8HzN2D2xbFzYo9npxTmZO9QCEaK7bx6.jpeg', 'storage/app/photo_agen/2vVfSzDK2QbRSpCoNgwZf8K091l0ITNl8ulai7Lk.jpeg', 0, '0', '2018-07-28 22:16:45', '2018-07-28 22:16:47'),
(48, 123, 1, 'Ashlin Fundation', 'Asep Solihin', 'Kp. Bojong Rt 001/009 Kel. Sayar Kec. Taktakan Kota Serang', 'storage/app/photo_ktp/cO76NnYAiMib4CO5EZUyLvnIBCCjpMryM6Nec50A.jpeg', '', 'storage/app/photo_agen/YMdx22a9ietZ7c9GfAqZvrCePjV4Fa5ETDGhWHdn.jpeg', 0, '0', '2018-07-28 22:33:41', '2018-07-28 22:33:47'),
(49, 125, 1, 'Wong dewek', 'Nawahi', 'Kebaharan duku', 'storage/app/photo_ktp/LBHoeA3BgH66yMVTwsPoYsXIBySiBeKULwQUtLMF.jpeg', 'storage/app/photo_kk/VQzl7vOhHrlbbkqc54us926x6WaK97YkLhSU6gMm.jpeg', 'storage/app/photo_agen/3bqwGp8FztV9Atkh3UnLXx1towTgyKiWcjKft3gI.jpeg', 500000, '0.0', '2018-07-28 22:51:20', '2018-08-09 07:09:22'),
(50, 127, 1, 'Gilba Family', 'Muhyidin Arif', 'Bumi Agung Permai A7/18, RT/RW 007/011, Unyur, Serang', 'storage/app/photo_ktp/ZZvVkV2fIaLDrvGB9JxzNhj5HMjB3g9EVEGSvhrp.jpeg', 'storage/app/photo_kk/baRxRz15Gn7NgudbDvT6tG4QZiBPltBfr9LjewxC.jpeg', 'storage/app/photo_agen/18T6dWizCRgznLTtObHmWOPAmhVsfHOBFEp80mjS.jpeg', 0, '0.0', '2018-07-28 22:56:25', '2018-07-28 22:57:12'),
(52, 129, 1, 'Grosironesiti', 'Siti fatimah', 'Kp ciwaluran', '', '', 'storage/app/photo_agen/8iRuW5UtjDZ7OGFxD0SBVV3URYdkloOFMN1VPLfQ.jpeg', 0, '0', '2018-07-29 22:39:36', '2018-07-29 22:39:38'),
(53, 130, 1, 'Grosirone', 'Nandar', 'Kalibata', '', '', NULL, 0, '0.0', '2018-07-29 23:27:10', '2018-07-29 23:29:10'),
(54, 131, 1, 'Ranu shop', 'Ranu Mahesti', 'Link. Kelebut Rt 002 rw 005 kel. Banjar Agung Kec. Cipocok Jaya Kota Serang', 'storage/app/photo_ktp/ZS9koAcrshaUOi74ALBtNMokHvrooKW7vGmnwsDQ.jpeg', 'storage/app/photo_kk/N7yYlxowEcwV5HNjKZwadPawhSsAH5IYmDrmIeSN.jpeg', 'storage/app/photo_agen/nfsBKIOrrG6bTNHchQgwqDHtYYktBp23BTk4LPS0.jpeg', 0, '0.0', '2018-07-30 01:13:56', '2018-08-06 04:03:19'),
(55, 133, 1, 'Gilba Store', 'Muhyidin Arif', 'Bumi Agung Permai Blok A7/18 Kota Serang', 'storage/app/photo_ktp/JjFO5kuEMVFuAW0FSiAqHJyA6ypkIkgMR2t8Tp6h.jpeg', 'storage/app/photo_kk/t6HGPuvtEgCbvnf80vWnYHuoB4DEB8NgtDjeCfIT.png', 'storage/app/photo_agen/38C4M91zWykVMwAGLNvWuZtGMjBojaTORVaixqi8.jpeg', 0, '0', '2018-07-30 01:36:06', '2018-07-30 01:36:08'),
(56, 134, 1, 'Agen grosir One', 'Ridho Kuswanto', 'Lingk. Kaliwadas Rt 04 Rw 06 Kel lopang kec serang', '', '', 'storage/app/photo_agen/kpcGOCrLZIBJhywvVW8EClfqZNU518lUrYufJTzF.jpeg', 0, '0.0', '2018-07-30 03:40:35', '2018-08-08 09:43:55'),
(57, 136, 1, 'Rantau shop', 'Hamid', 'Hamid', 'storage/app/photo_ktp/tifUZnHSHBj1jnzn2FSmfatDFUClPMZL500cZudN.jpeg', 'storage/app/photo_kk/6FeKUXuCNGLHn829QewbgkwwWyYcfZgkmLNT79Jv.jpeg', 'storage/app/photo_agen/zfwm7IMfKCVj15IaIXLMMi08xNdWv0A1hdpV2lqP.jpeg', 0, '0.0', '2018-07-30 06:06:35', '2018-08-02 00:06:41'),
(58, 139, 1, 'TSM Cikupa', 'Jhonny Satria Sinukaban', 'Jl. Cikupamas III No 5 Cikupamas Tangerang', 'storage/app/photo_ktp/uf8dg6D5o9gEoFiL5gO86eZq4G24QycBM1wo8QjY.jpeg', '', 'storage/app/photo_agen/ogWl1ee2fzySpVEaRaNLOwdj5GYIrTiGLXhNiNGd.jpeg', 0, '0.0', '2018-07-30 22:54:05', '2018-08-10 02:49:36'),
(59, 143, 1, 'MARTA PUTRA GROUP', 'MUSRIADI FAHMI MARTA', 'BIREUEN,  ACEH', 'storage/app/photo_ktp/yIxxreg4XD54vRtfAsLFJFVS7in2bflyGpLAcT1S.jpeg', 'storage/app/photo_kk/HvHCav2N4ARqzWwVZm7MZHwsXYAmRreDFyKwC0js.jpeg', 'storage/app/photo_agen/AlPPrMM0Zq4l4nTQIiwfZszLplM60oG7MB3xGpQr.jpeg', 0, '0', '2018-07-31 21:04:10', '2018-07-31 21:04:15'),
(60, 151, 1, 'Pt triputera', 'Hendy', 'Pagar alam', '', '', 'storage/app/photo_agen/rrdHYJcQpcgN0ds8ArHYFIrlfT1KUnIObKxrSTKT.jpeg', 0, '0.0', '2018-08-01 18:57:30', '2018-08-09 19:29:14'),
(61, 153, 1, 'GROSIR ONE', 'SHOF RIJAL', 'KP. JAMBLANG 01/02 KEL. SAWAH LUHUR KEC.KASEMEN KOTA SERANG', 'storage/app/photo_ktp/8vIIMwlyBjNwupeFZpLkCWec1VCePVt9aJUgWRJa.jpeg', 'storage/app/photo_kk/DOamBdUqE4SNKeXwWhkMKBWakRKOgiKUAGEqQ7Nk.jpeg', 'storage/app/photo_agen/0p1iy4xTuiR6AkaKu7jZh1Q3oLKZnGI9T4PBxmfd.png', 0, '0.0', '2018-08-01 20:33:41', '2018-08-02 01:31:32'),
(62, 155, 1, 'BERKAH JAYA', 'SHOF RIJAL', 'KP. JAMBLANG 01/02 KEL. SAWAH LUHUR KEC. KASEMEN KOTA SERANG', 'storage/app/photo_ktp/AVbBLLHuMZfXFj7Vbm2itAT5jOZBXz9dyEzJsy7g.jpeg', 'storage/app/photo_kk/XxsHIQb3MUQEnZpG5r3vlxT5clwrwkog5gwQQFZh.jpeg', 'storage/app/photo_agen/8Hsj3ArYklhbff8DlJUyM7XniH0mf11VfIXVdRpr.png', 0, '0', '2018-08-01 20:59:19', '2018-08-01 20:59:20'),
(63, 162, 1, 'UD LINA', 'Hermansyah', 'Kp selon rt 004/001 desa sukamulya kecamatan sukamulya kabupaten tangerang', '', '', NULL, 0, '0', '2018-08-03 18:10:21', '2018-08-03 18:10:21'),
(64, 166, 1, 'Langitan jaya', 'Akhmad badowi', 'Perum rajrg asri b4/4 rajeg0o', '', '', NULL, 1000000, '0.0', '2018-08-03 20:41:44', '2018-08-09 02:43:43'),
(65, 167, 1, 'Toko guntur maju', 'Guntur muhamad', 'Kp cadas ds rancagong', '', '', NULL, 754764, '5.0', '2018-08-03 20:43:01', '2018-08-10 04:24:24'),
(66, 168, 1, 'Tk kibuyut tonjong', 'Ahmad ma\'ruf', 'Kp gerobogan rt 03 rw 03 Sukamulya kab tangerang', '', '', NULL, 1000000, '0.0', '2018-08-03 20:44:10', '2018-08-09 21:54:16'),
(67, 169, 1, 'Toko lancar jaya', 'ABDUL ROHMAT', 'Kp nangka desa sindang jaya', '', '', NULL, 1000000, '0', '2018-08-03 20:44:25', '2018-08-03 20:44:25'),
(68, 170, 1, 'Lutfi cerah', 'Lutfi purba fitrianto', 'Bumi indah, kuta jaya tangerang.', '', '', NULL, 0, '0', '2018-08-03 20:45:37', '2018-08-03 20:45:37'),
(69, 172, 1, 'Dwi Ria', 'Ngadiran', 'Kp Baru Rt 03 / Rw 04 Karawaci TAngeran', '', '', NULL, 0, '0.0', '2018-08-03 20:46:03', '2018-08-09 22:31:43'),
(70, 173, 1, 'Maju lancar', 'Pahruri', 'Perum mustika blok f1/50 rt 01/09', '', '', NULL, 0, '0.0', '2018-08-03 20:46:19', '2018-08-09 06:58:28'),
(71, 174, 1, 'Toko Diara Jaya Sembako', 'Rahmat Mulya', 'Kp. Blok Kelapa Gang Langgar No. 192. RT 002/002', '', '', NULL, 0, '0.0', '2018-08-03 20:46:31', '2018-08-10 04:32:53'),
(72, 175, 1, 'Toko Eza & Andra', 'Andriyanto', 'Kunciran jaya RT 01 RW 01 Kunciran jaya, Pinang', '', '', NULL, 1000000, '0.0', '2018-08-03 20:46:39', '2018-08-10 00:44:26'),
(73, 176, 1, 'Yathy barokah', 'Sukriyati', 'Jln raya cilegon km3. RT 01 Rw 11', '', '', NULL, 0, '0.0', '2018-08-03 20:46:48', '2018-08-06 03:52:16'),
(74, 177, 1, 'Farih Jaya', 'Ila nurlaila', 'Link Baru Rt. 03 Rw. 4', '', '', NULL, 0, '0.0', '2018-08-03 20:46:58', '2018-08-08 08:33:19'),
(76, 179, 1, 'Novl\'s Store', 'Chyntya Novliana', 'Tigaraksa', '', '', NULL, 0, '0.0', '2018-08-03 20:47:02', '2018-08-06 04:26:15'),
(77, 180, 1, 'Dita mandiri', 'sahroji', 'kp pala desa patrasana', '', '', NULL, 1000000, '0.0', '2018-08-03 20:47:03', '2018-08-06 03:40:14'),
(78, 181, 1, 'Desta store', 'Herman Hermawan', 'Jalan raya labuan km 05 kecamatan kaduhejo kp citayeum RT. 01/01', '', '', NULL, 0, '0.0', '2018-08-03 20:47:10', '2018-08-08 00:08:16'),
(79, 182, 1, 'Toko Jaya Makmur', 'Desi Susilawati', 'Tangerang', '', '', NULL, 0, '0.0', '2018-08-03 20:47:36', '2018-08-06 20:58:40'),
(80, 183, 1, 'NigiStore', 'Tugiran', 'Legok permai blok E1/L16', '', '', NULL, 0, '0', '2018-08-03 20:47:47', '2018-08-03 20:47:47'),
(81, 184, 1, 'Toko Hizam', 'Achmad Sopian', 'Jl. Raya Serang Km.20.5 Kp. Pasir Rangdu Rt. 07 Rw.02 No.35 Desa Cibadak Kec. Cikupa Kab. Tangerang', '', '', NULL, 0, '0.0', '2018-08-03 20:47:55', '2018-08-06 19:05:59'),
(82, 185, 1, 'Toko dhiana berkah', 'Siti nur dianah', 'Kp bitung cisereh', '', '', NULL, 0, '0.0', '2018-08-03 20:48:18', '2018-08-08 04:45:20'),
(83, 188, 1, 'Say', 'Sayudin', 'Bebejong kasemen', '', '', NULL, 0, '0.0', '2018-08-03 20:49:23', '2018-08-05 04:23:56'),
(84, 193, 1, 'Subur makmur', 'Endang bronto wati', 'Perum taman elang blok O no 26', '', '', NULL, 0, '0', '2018-08-03 20:50:40', '2018-08-03 20:50:40'),
(85, 194, 1, 'Sumber Makmur', 'Sihtiyono', 'Kp cibadak tegal ds.sukanegara', '', '', NULL, 0, '0.0', '2018-08-03 20:50:44', '2018-08-09 03:04:03'),
(86, 196, 1, 'TOKO  CENDANA', 'Hasbi', 'Kp.cicayur 1 RT01 RW 03 Desa pagedangan kecamatan pagedangan', '', '', 'storage/app/photo_agen/KBzY7yWpGbimH6qqUdQfN61ReuGBSYaXCYLABGOg.jpeg', 1000000, '0.0', '2018-08-03 20:51:56', '2018-08-10 02:50:22'),
(87, 197, 1, 'Jeans', 'Jenih lesmana', 'Jenih', '', '', NULL, 0, '0', '2018-08-03 20:52:42', '2018-08-03 20:52:42'),
(88, 198, 1, 'Abdul', 'Arip sugandi', 'Kp pasir kiang', '', '', 'storage/app/photo_agen/bMVmIDGbkGl30kFMd5QPS7Gk5kOiudYY3FOeXzFj.jpeg', 1000000, '0.0', '2018-08-03 20:52:48', '2018-08-10 02:54:38'),
(89, 199, 1, 'Toko Farih Jaya', 'Ila nurlaila', 'Link. Baru', '', '', NULL, 0, '0', '2018-08-03 20:52:56', '2018-08-03 20:52:56'),
(90, 201, 1, 'Toko riko', 'Lia komalasari', 'Kp.pisangan lebak rt/rw 001/001,desa sarakan,kecamatan sepatan', '', '', NULL, 0, '0.0', '2018-08-03 20:54:40', '2018-08-08 04:55:07'),
(91, 202, 1, 'Toko aira', 'Faridatus sholihah', 'Perum daru permai rt25 rw05', '', '', NULL, 0, '0', '2018-08-03 20:55:05', '2018-08-03 20:55:05'),
(92, 204, 1, 'Toko Nizam', 'Yulita', 'Yulita', '', '', NULL, 1000000, '0.0', '2018-08-03 20:56:21', '2018-08-10 03:03:44'),
(93, 205, 1, 'Toko Mama', 'Endang Brontowati', 'Taman Elang blok O no 26', '', '', NULL, 0, '0.0', '2018-08-03 20:58:17', '2018-08-08 07:26:06'),
(94, 206, 1, 'toko ikan màs', 'juned', 'kp megu ds karang harja', '', '', NULL, 1000000, '0.0', '2018-08-03 20:59:28', '2018-08-10 04:05:57'),
(95, 207, 1, 'Toko d35.', 'Sunaryo', 'Bumi.indah kuta jaya tang', '', '', NULL, 1000000, '0.0', '2018-08-03 21:00:21', '2018-08-09 20:39:15'),
(96, 208, 1, 'Toko lancar', 'Abdul Rohmat', 'Kp nangka desa sindang jaya', '', '', 'storage/app/photo_agen/6DziRxQftcTRbuUEFULmu4Su3Ftagh6PiZhDJiSq.jpeg', 1000000, '0.0', '2018-08-03 21:03:03', '2018-08-10 03:03:04'),
(98, 211, 1, 'ABADI PUTRA', 'sayuti', 'telaga kocak', '', '', NULL, 1000000, '0.0', '2018-08-03 21:08:26', '2018-08-09 15:39:50'),
(100, 213, 1, 'Malika toko', 'Ropik', 'Kp cibadak', '', '', NULL, 932100, '0.0', '2018-08-03 21:17:37', '2018-08-10 03:48:30'),
(101, 214, 1, 'Toko lina', 'Hermansyah', 'Kp selon', '', '', 'storage/app/photo_agen/bVSDQ5DQL6c2wka7uXL1X9QNU3ZTcPXdvDINGD91.jpeg', 268171, '0.0', '2018-08-03 21:18:06', '2018-08-10 04:35:34'),
(102, 216, 1, 'Magelang Gemilang', 'Priyo santoso', 'Dsn. Tampirwetan II 006/003,tampirwetan, candimulyo, magelang', '', '', NULL, 1000000, '0.0', '2018-08-03 22:53:11', '2018-08-08 09:03:48'),
(103, 220, 1, 'Toko fadilah', 'Ahmad Juhdi', 'Kp kroncong rt 01/05 kroncong jati uwung', '', '', NULL, 0, '0', '2018-08-04 09:45:06', '2018-08-04 09:45:06'),
(104, 225, 1, 'Adinda distribusi', 'Andy widianto', 'Cicayur1', '', '', NULL, 0, '0', '2018-08-05 06:36:25', '2018-08-05 06:36:25'),
(105, 226, 1, 'Cakeer', 'Subandono', 'Tampir wetan Candimulyo Magelang', '', '', NULL, 0, '0', '2018-08-06 00:26:59', '2018-08-06 00:26:59'),
(106, 229, 1, 'Deden', 'Deden satria', 'Cikoneng jatiuwung', 'storage/app/photo_ktp/jgSn25d0AZcq1SGzFbFJHLRsJHdBzqvYidZUoYzs.jpeg', 'storage/app/photo_kk/PeTdxq9ggmNagpBSegK0AL0c38iqrsPryHIOFQjf.jpeg', 'storage/app/photo_agen/5snZzTOsEARnFABeZ364kyqmHnyLG8txx9dpKGIQ.jpeg', 0, '0.0', '2018-08-06 18:57:35', '2018-08-10 04:38:19'),
(107, 230, 1, 'Toko rizky', 'Daeng macenning', 'Jln kemuning3 rt8 rw4 no8 utan kayu utara, matraman. Jaktim', 'storage/app/photo_ktp/BYjF1wgBG8oLjmFQLGh0ap83XufB4KBadeoIWIXm.jpeg', 'storage/app/photo_kk/BDWoO4TiyRjpp8cpSELwZ3vMJC7yuKmKcFLadkB2.jpeg', 'storage/app/photo_agen/huVpt95OZBZaAhEgKTERQUcWzwzJFMblOwk0zSr2.jpeg', 0, '0', '2018-08-06 21:18:13', '2018-08-06 21:18:15'),
(108, 233, 1, 'Wahyu nuget', 'Tri wahyu adi', 'Perum puri permai 3 blok d8 no 15', 'storage/app/photo_ktp/xc3prYGhKvZpJK2XsRrbk0Wmjy2Eovs1Iv84fxzX.jpeg', 'storage/app/photo_kk/RQlgList2HqdClcB7KvBWuG7vCUEvDd89MoKKjUP.jpeg', 'storage/app/photo_agen/m9KlceprSeRShDxBzh6KlyydWUYbIh16tIWhzynq.jpeg', 766852, '0.0', '2018-08-07 05:09:21', '2018-08-10 03:45:49'),
(109, 234, 1, 'Tk bagus', 'Bagus prio utomo', 'Cikupa', 'storage/app/photo_ktp/d8f2nDrofMf9RpPnrgYxtrYnnXvktIrJM1q7Lg6T.jpeg', 'storage/app/photo_kk/JQdy6FkXZnOYV3iznHqddn8LY6jV3dCg6m3ZKhYB.jpeg', 'storage/app/photo_agen/Efl6JXYpJf9r5WG5oUkoBccb4uU8ELPthnlLoL7C.jpeg', 951322, '0.0', '2018-08-07 05:09:40', '2018-08-10 00:00:32'),
(110, 236, 1, 'Bersahabat', 'Ahmad Rifqi Riva\'i', 'Kp. Rego Pasar RT/RW : 014/003 Ds. Padasuka Kec. Petir Kab. Serang', 'storage/app/photo_ktp/UD5VDliPhbOzDON1sN8WMH3fcqTXendt1qVHdrzz.jpeg', 'storage/app/photo_kk/sMcQI2yLZULqFBSEugEhWU2iRDAQ5AvHCEcZS1Lo.jpeg', 'storage/app/photo_agen/uDE9WHgThAH6zP1C7PYKHTc6luFk2c7dDSdB61ho.jpeg', 0, '0.0', '2018-08-07 23:54:29', '2018-08-10 03:58:15'),
(111, 241, 1, 'Toko doa ibu', 'Sugiarta pujiantara', 'Kp.sukamanah rt/rw 001/002 ds.sajira kec.sajira kab.lebak prov.banten', 'storage/app/photo_ktp/IghzdVVoy8FHx2R1CTjqCCHGDtIv0ypWOgGeNn6F.jpeg', 'storage/app/photo_kk/9oAeHVQHY4ThrOKOszS3897if4TSS7H65qtMQmWn.jpeg', 'storage/app/photo_agen/IkGRXBZZHpFyYmWQUlSpNA1X34MSzBqg1aV1A6PS.jpeg', 0, '0.0', '2018-08-08 04:57:26', '2018-08-10 03:30:20'),
(112, 244, 1, 'Adhi', 'Adhi satrio wibowo', 'Tampirwetan2 07/04 tampirwetan candimulyo magelang', 'storage/app/photo_ktp/vWEnuN0Eq7HZWszjM9aW3HaJwVRq5jwf2UM002JS.jpeg', 'storage/app/photo_kk/pfJ0bZYCVGS9ZlSzH3OgmYo66xISObYVHj5zharL.jpeg', 'storage/app/photo_agen/KWjAJ6VgiP7wnXcA7Xww9mkKZpLc1T5ZETifaJwa.jpeg', 1000000, '0.0', '2018-08-08 06:04:07', '2018-08-10 04:33:42'),
(113, 245, 1, 'M€M€¥', 'YANTO', 'kp.sukadiri Rt/Rw 003/002 Desa pagedangan Udik kecamatan.Kronjo .tangerang', 'storage/app/photo_ktp/A5gmF7bI8xOZ53NUr2BexoMlfjh10QqUzRdIB6kG.jpeg', 'storage/app/photo_kk/7BccyYzSntMZM4UG5yCDK2TL5lUdkQHVuFznKle4.jpeg', 'storage/app/photo_agen/1oRV8CrnvrVrpDGNyEgUg0B5S1tB3gClIe9qw2VA.jpeg', 0, '0', '2018-08-08 07:49:27', '2018-08-08 07:49:37'),
(114, 252, 1, 'Toko Manohara', 'Rohman', 'Bojong cikupa', 'storage/app/photo_ktp/zNMH2aeiclUlJIVxa5UM4qWWaop1n19gt5ipmLO4.jpeg', 'storage/app/photo_kk/3DRAw3uaEhpKZggIT0Ulv1yZIKHVMw2X1OrKuNxa.jpeg', 'storage/app/photo_agen/Mujgq6XlAr1sxdBHgpZwKKibQbj73CL60sXcluHL.jpeg', 1000000, '0.0', '2018-08-08 18:20:42', '2018-08-10 04:20:48'),
(115, 255, 1, 'Toko Qu', 'Ade Suryadi', 'Cisereh tigaraksa', 'storage/app/photo_ktp/wyczF2XNa7cThR44sYNmv7TlHLl0vjOTf7D7CIUX.jpeg', 'storage/app/photo_kk/rvU2FDn6AMaB1KXhru9KQj4AcEGnPU1yzplXm9tg.jpeg', 'storage/app/photo_agen/AUDbhZ5AYsp75p4zvQIy1bnKVyag8Z2exCF2wLHf.jpeg', 1000000, '0.0', '2018-08-08 18:49:12', '2018-08-09 18:17:48'),
(116, 258, 1, 'Yen Yen', 'Firman karo karo', 'Cikupa', 'storage/app/photo_ktp/GmErU2ZS8ROZzUYGgxmfVEYJC3zjhAsU2b3oWIs8.jpeg', 'storage/app/photo_kk/Rphkg5yZhGrWnp5e8oPJiOigSKB4MJS0YsLAnh03.jpeg', 'storage/app/photo_agen/1BGLZmFmANH4wSHUrOrKmRj6YvhaC7qB5PfAB0Kg.png', 1000000, '0.0', '2018-08-08 20:18:16', '2018-08-09 22:24:55'),
(117, 260, 1, 'Asri', 'Sahlabi', 'Lingkungan Pabuaran', 'storage/app/photo_ktp/QSLkLSeIeF2xN944EdOcVKMpj8brgRF1DFTvmjj4.jpeg', 'storage/app/photo_kk/rPap3qs99zY7Ndyj9qatL8d9jwrPBJfMZj2VFjU8.jpeg', 'storage/app/photo_agen/qAi0955nI2y32LMcYtnT9BSrWsXJ5Qo85FjJm5yg.jpeg', 0, '0', '2018-08-08 21:20:00', '2018-08-08 21:20:01'),
(118, 262, 1, 'AHMED CHOLIL STORE', 'HOLILUDIN', 'KP. KILASAH IV RT/RW 004/001 KEL/DESA KILASAH KECAMATAN KASEMEN KOTA SERANG PROVINSI BANTEN', 'storage/app/photo_ktp/XGe2ZtwKipt21VJWJZ9NEqu2qSs40bMIRZWCF1bD.jpeg', 'storage/app/photo_kk/gP990Dog4zFYv0feTDwe0HxzdKvq2zxpRlXZzjvI.jpeg', 'storage/app/photo_agen/ehwh1I9N9VZAD3MWQwZIZ3PNOPciBLXU4I7DvU5U.jpeg', 0, '0.0', '2018-08-08 22:41:54', '2018-08-09 19:11:30'),
(119, 266, 1, 'Eni', 'Eni', 'Serang', 'storage/app/photo_ktp/yMSphMRWRm2R6bY5trKVjORDtaAQxEh4ILjhI5V7.jpeg', 'storage/app/photo_kk/46bIUrmoLbXiHJbrqEB0vJISChoqi1nkxhEyUap9.jpeg', 'storage/app/photo_agen/p1FLvdeSvdbeKVfGffR9RZ0CpieZr72R5Qt8lFRA.jpeg', 0, '0', '2018-08-09 01:06:07', '2018-08-09 01:06:09'),
(120, 267, 1, 'Dini', 'Dini', 'Serang', 'storage/app/photo_ktp/x8DRcPg2EkEVY7QbBlV7v8Q1iXFzh71OK6U8uMiK.jpeg', 'storage/app/photo_kk/fFjseantjKpWtJ28GbfQPz6saWhJrX3vb1ousjvZ.jpeg', 'storage/app/photo_agen/dwKTsnhVplsOpmDnRzRf0Ip1urA9BzkCLlwxYYq7.jpeg', 0, '0', '2018-08-09 01:15:09', '2018-08-09 01:15:14'),
(121, 278, 1, 'SEMESTA', 'Ibnu wibowo', 'Perum permata blok A00/10', '', '', 'storage/app/photo_agen/e6MKj1D4x3kJkQMWF4Ax13plAe3iGufLmEix8Yxy.jpeg', 0, '0', '2018-08-09 09:45:47', '2018-08-09 09:45:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner_promo`
--

CREATE TABLE `banner_promo` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(180) NOT NULL,
  `description` longtext NOT NULL,
  `period` varchar(60) NOT NULL,
  `terms` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner_promo`
--

INSERT INTO `banner_promo` (`id`, `name`, `photo`, `description`, `period`, `terms`, `created_at`, `updated_at`) VALUES
(1, 'Gratis Tropical 500ml', 'storage/app/promo/promotropical500ml.png', 'Dapatkan Minyak Goreng Tropical 500ml secara gratis, cukup dengan belanja minimal Rp. 50.000 produk apa saja melalui applikasi GrosirOne.', 'Selama persediaan masih ada', 'Rp. 50.000', '2018-08-09 23:16:52', '0000-00-00 00:00:00'),
(2, 'Gratis Tropical 500ml & Forvita 200gr', 'storage/app/promo/promotropical&forvita.png', 'Dapatkan Minyak Goreng Tropical 500ml dan Forvita 200gr secara gratis, cukup dengan belanja minimal Rp. 100.000 produk apa saja melalui applikasi GrosirOne.', 'Selama persediaan masih ada', 'Rp. 100.000', '2018-08-09 23:17:23', '0000-00-00 00:00:00');

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
(88, 69, NULL, 0, NULL, 0, 0, '2018-08-09 08:00:15', '2018-08-09 09:09:47'),
(94, 82, NULL, 193350, NULL, 0, 193350, '2018-07-25 03:33:52', '2018-07-30 22:50:42'),
(97, 60, NULL, 26700, NULL, 0, 26700, '2018-08-04 06:11:25', '2018-08-04 06:11:25'),
(101, 85, NULL, 80100, NULL, 0, 80100, '2018-07-27 01:49:09', '2018-07-27 01:49:29'),
(123, 114, NULL, 0, NULL, 0, 0, '2018-07-28 21:48:56', '2018-07-28 21:48:56'),
(127, 124, NULL, 0, NULL, 0, 0, '2018-08-03 19:18:33', '2018-08-03 19:19:01'),
(133, 126, NULL, 0, NULL, 0, 0, '2018-07-28 23:40:47', '2018-07-28 23:40:47'),
(190, 83, NULL, 0, NULL, 0, 0, '2018-07-29 21:06:22', '2018-07-29 21:06:22'),
(198, 137, NULL, 26700, NULL, 0, 26700, '2018-07-30 06:21:11', '2018-07-30 06:21:11'),
(199, 138, NULL, 0, NULL, 0, 0, '2018-07-30 17:26:55', '2018-07-30 17:26:55'),
(205, 140, NULL, 124500, NULL, 0, 124500, '2018-08-01 02:06:38', '2018-08-01 02:06:47'),
(206, 141, NULL, 0, NULL, 0, 0, '2018-07-31 01:05:08', '2018-07-31 01:05:08'),
(207, 142, NULL, 247000, NULL, 0, 247000, '2018-07-31 01:31:17', '2018-07-31 01:31:17'),
(214, 144, NULL, 0, NULL, 0, 0, '2018-07-31 22:49:43', '2018-07-31 22:49:43'),
(217, 146, NULL, 0, NULL, 0, 0, '2018-08-01 01:27:21', '2018-08-01 01:27:21'),
(218, 147, NULL, 0, NULL, 0, 0, '2018-08-01 01:36:51', '2018-08-01 01:36:51'),
(222, 148, NULL, 0, NULL, 0, 0, '2018-08-01 05:33:39', '2018-08-01 05:33:39'),
(223, 150, NULL, 0, NULL, 0, 0, '2018-08-01 09:58:06', '2018-08-01 09:58:06'),
(224, 154, NULL, 0, NULL, 0, 0, '2018-08-01 20:58:25', '2018-08-01 20:58:25'),
(227, 156, NULL, 0, NULL, 0, 0, '2018-08-02 00:16:54', '2018-08-02 00:16:54'),
(230, 158, NULL, 0, NULL, 0, 0, '2018-08-02 01:38:14', '2018-08-02 01:38:14'),
(231, 159, NULL, 0, NULL, 0, 0, '2018-08-02 03:48:53', '2018-08-02 03:48:53'),
(233, 69, NULL, 0, NULL, 0, 0, '2018-08-02 22:27:40', '2018-08-02 22:27:40'),
(237, 165, NULL, 0, NULL, 0, 0, '2018-08-03 20:38:09', '2018-08-03 20:38:09'),
(240, 215, NULL, 0, NULL, 0, 0, '2018-08-03 22:47:46', '2018-08-03 22:47:46'),
(241, 218, NULL, 0, NULL, 0, 0, '2018-08-04 05:47:58', '2018-08-04 05:47:58'),
(242, 219, NULL, 0, NULL, 0, 0, '2018-08-04 09:07:37', '2018-08-04 09:07:37'),
(243, 221, NULL, 0, NULL, 0, 0, '2018-08-05 01:24:07', '2018-08-05 01:24:15'),
(244, 222, NULL, 0, NULL, 0, 0, '2018-08-04 22:34:59', '2018-08-04 22:34:59'),
(245, 223, NULL, 0, NULL, 0, 0, '2018-08-04 23:49:12', '2018-08-04 23:49:12'),
(251, 227, NULL, 0, NULL, 0, 0, '2018-08-06 05:43:40', '2018-08-06 05:43:40'),
(252, 228, NULL, 0, NULL, 0, 0, '2018-08-06 05:49:07', '2018-08-06 05:49:07'),
(260, 72, NULL, 27000, NULL, 0, 27000, '2018-08-09 00:55:49', '2018-08-09 00:55:49'),
(261, 232, NULL, 0, NULL, 0, 0, '2018-08-07 03:03:47', '2018-08-07 03:03:47'),
(262, 235, NULL, 247000, NULL, 0, 247000, '2018-08-09 06:08:25', '2018-08-09 06:08:25'),
(263, 237, NULL, 0, NULL, 0, 0, '2018-08-08 00:11:03', '2018-08-08 00:11:03'),
(264, 238, NULL, 0, NULL, 0, 0, '2018-08-08 00:14:17', '2018-08-08 00:14:17'),
(267, 239, NULL, 0, NULL, 0, 0, '2018-08-08 03:35:39', '2018-08-08 03:35:39'),
(268, 240, NULL, 26700, NULL, 0, 26700, '2018-08-08 21:30:32', '2018-08-08 21:30:32'),
(269, 242, NULL, 1014600, NULL, 0, 1014600, '2018-08-09 17:55:35', '2018-08-09 17:56:12'),
(270, 243, NULL, 159550, NULL, 0, 159550, '2018-08-08 06:00:47', '2018-08-09 07:09:38'),
(272, 248, NULL, 0, NULL, 0, 0, '2018-08-08 09:32:27', '2018-08-08 09:32:27'),
(275, 251, NULL, 0, NULL, 0, 0, '2018-08-08 18:11:13', '2018-08-08 18:11:13'),
(276, 253, NULL, 0, NULL, 0, 0, '2018-08-08 18:24:08', '2018-08-08 18:24:08'),
(278, 256, NULL, 0, NULL, 0, 0, '2018-08-08 18:57:28', '2018-08-08 18:57:28'),
(281, 259, NULL, 0, NULL, 0, 0, '2018-08-08 20:27:27', '2018-08-08 20:27:27'),
(282, 261, NULL, 0, NULL, 0, 0, '2018-08-08 21:58:22', '2018-08-08 21:58:22'),
(283, 47, NULL, 0, NULL, 0, 0, '2018-08-09 00:05:01', '2018-08-09 00:05:01'),
(284, 264, NULL, 0, NULL, 0, 0, '2018-08-09 23:43:26', '2018-08-09 23:43:26'),
(285, 1, NULL, 496000, NULL, 0, 496000, '2018-08-09 00:17:12', '2018-08-09 23:40:47'),
(286, 265, NULL, 0, NULL, 0, 0, '2018-08-09 01:00:44', '2018-08-09 01:00:44'),
(290, 157, NULL, 0, NULL, 0, 0, '2018-08-09 03:19:12', '2018-08-09 03:19:12'),
(291, 270, NULL, 0, NULL, 0, 0, '2018-08-09 23:43:17', '2018-08-09 23:46:01'),
(292, 272, NULL, 0, NULL, 0, 0, '2018-08-09 04:01:27', '2018-08-09 04:01:27'),
(293, 273, NULL, 0, NULL, 0, 0, '2018-08-09 04:55:15', '2018-08-09 04:55:15'),
(294, 231, NULL, 0, NULL, 0, 0, '2018-08-09 07:17:06', '2018-08-09 07:17:06'),
(295, 161, NULL, 0, NULL, 0, 0, '2018-08-10 02:41:55', '2018-08-10 02:42:19'),
(297, 279, NULL, 0, NULL, 0, 0, '2018-08-09 19:07:04', '2018-08-09 19:07:04'),
(298, 280, NULL, 39450, NULL, 0, 39450, '2018-08-09 21:24:26', '2018-08-09 21:24:59'),
(299, 282, NULL, 26700, NULL, 0, 26700, '2018-08-10 03:17:50', '2018-08-10 03:17:50'),
(301, 283, NULL, 17500, NULL, 0, 17500, '2018-08-09 21:51:27', '2018-08-09 21:51:27'),
(303, 281, NULL, 0, NULL, 0, 0, '2018-08-09 23:23:52', '2018-08-09 23:23:52'),
(304, 264, NULL, 12400, NULL, 0, 12400, '2018-08-09 23:24:38', '2018-08-09 23:24:38'),
(305, 135, NULL, 0, NULL, 0, 0, '2018-08-09 23:41:32', '2018-08-09 23:41:32'),
(306, 257, NULL, 0, NULL, 0, 0, '2018-08-09 23:50:32', '2018-08-09 23:50:32'),
(307, 120, NULL, 0, NULL, 0, 0, '2018-08-10 00:10:19', '2018-08-10 00:10:19'),
(308, 164, NULL, 0, NULL, 0, 0, '2018-08-10 01:09:08', '2018-08-10 01:09:08'),
(309, 284, NULL, 7250, NULL, 0, 7250, '2018-08-10 01:23:41', '2018-08-10 01:23:41'),
(310, 247, NULL, 0, NULL, 0, 0, '2018-08-10 01:50:05', '2018-08-10 01:50:05'),
(311, 33, NULL, 0, NULL, 0, 0, '2018-08-10 02:29:49', '2018-08-10 02:29:49'),
(312, 250, NULL, 0, NULL, 0, 0, '2018-08-10 02:49:43', '2018-08-10 02:49:43'),
(313, 286, NULL, 0, NULL, 0, 0, '2018-08-10 03:28:31', '2018-08-10 03:28:31'),
(314, 254, NULL, 0, NULL, 0, 0, '2018-08-10 04:15:43', '2018-08-10 04:15:43');

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
(178, 94, 13, 1, '2018-07-25 03:33:52', '2018-07-25 03:33:52'),
(179, 94, 57, 1, '2018-07-25 22:00:50', '2018-07-25 22:00:50'),
(180, 94, 24, 3, '2018-07-26 22:36:27', '2018-07-30 22:50:42'),
(186, 101, 24, 3, '2018-07-27 01:49:09', '2018-07-27 01:49:29'),
(193, 94, 137, 1, '2018-07-27 03:57:02', '2018-07-27 03:57:02'),
(215, 88, 24, -6, '2018-07-28 14:53:02', '2018-08-09 08:00:11'),
(364, 94, 54, 1, '2018-07-30 00:28:25', '2018-07-30 00:28:25'),
(365, 94, 48, 1, '2018-07-30 00:28:49', '2018-07-30 00:28:49'),
(384, 198, 24, 1, '2018-07-30 06:21:11', '2018-07-30 06:21:11'),
(400, 207, 15, 1, '2018-07-31 01:31:17', '2018-07-31 01:31:17'),
(410, 88, 18, -1, '2018-08-01 01:23:16', '2018-08-01 01:23:16'),
(416, 205, 78, 3, '2018-08-01 02:06:38', '2018-08-01 02:06:47'),
(433, 88, 49, -1, '2018-08-02 19:33:08', '2018-08-02 19:33:08'),
(459, 97, 24, 1, '2018-08-04 06:11:25', '2018-08-04 06:11:25'),
(496, 270, 85, 1, '2018-08-08 06:00:47', '2018-08-08 06:00:47'),
(502, 268, 24, 1, '2018-08-08 21:30:31', '2018-08-08 21:30:31'),
(503, 260, 20, 1, '2018-08-09 00:55:49', '2018-08-09 00:55:49'),
(509, 262, 15, 1, '2018-08-09 06:08:25', '2018-08-09 06:08:25'),
(510, 270, 24, 2, '2018-08-09 07:07:27', '2018-08-09 07:07:36'),
(511, 270, 83, 2, '2018-08-09 07:07:53', '2018-08-09 07:08:16'),
(512, 270, 16, 3, '2018-08-09 07:09:25', '2018-08-09 07:09:38'),
(518, 269, 24, 38, '2018-08-09 17:55:35', '2018-08-09 17:56:11'),
(522, 298, 24, 1, '2018-08-09 21:24:26', '2018-08-09 21:24:26'),
(523, 298, 82, 1, '2018-08-09 21:24:59', '2018-08-09 21:24:59'),
(526, 301, 100, 1, '2018-08-09 21:51:27', '2018-08-09 21:51:27'),
(537, 284, 16, -80, '2018-08-09 23:17:49', '2018-08-09 23:43:26'),
(538, 304, 16, 1, '2018-08-09 23:24:38', '2018-08-09 23:24:38'),
(542, 285, 16, 40, '2018-08-09 23:40:47', '2018-08-09 23:40:47'),
(551, 309, 38, 1, '2018-08-10 01:23:41', '2018-08-10 01:23:41'),
(561, 299, 24, 1, '2018-08-10 03:17:50', '2018-08-10 03:17:50');

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
(105, 33, 503700, 79450, 0, 583150, '2018-08-02 03:57:01', '2018-08-02 03:57:01'),
(106, 33, 503700, 0, 0, 503700, '2018-08-03 22:10:43', '2018-08-03 22:10:43'),
(107, 33, 503700, 61250, 0, 564950, '2018-08-03 22:18:05', '2018-08-03 22:18:05'),
(108, 1, 503700, 0, 0, 503700, '2018-08-06 18:18:25', '2018-08-06 18:18:25'),
(109, 1, 503700, 0, 0, 503700, '2018-08-06 20:30:00', '2018-08-06 20:30:00'),
(110, 33, 503700, 36250, 0, 539950, '2018-08-07 03:57:24', '2018-08-07 03:57:24'),
(111, 33, 503700, 62750, 0, 566450, '2018-08-08 03:51:09', '2018-08-08 03:51:09'),
(112, 1, 0, 0, 0, 0, '2018-08-08 05:54:51', '2018-08-08 05:54:51'),
(113, 1, 0, 0, 0, 0, '2018-08-08 05:54:52', '2018-08-08 05:54:52'),
(114, 33, 503700, 0, 0, 0, '2018-08-08 18:12:31', '2018-08-08 18:12:31'),
(115, 33, 503700, 0, 0, 0, '2018-08-08 18:12:31', '2018-08-08 18:12:31'),
(116, 33, 503700, 75050, 20000, 598750, '2018-08-09 03:55:27', '2018-08-09 03:55:27'),
(117, 47, 100000, 0, 0, 0, '2018-08-08 23:58:28', '2018-08-08 23:58:28'),
(118, 1, 1, 0, 0, 0, '2018-08-09 00:14:45', '2018-08-09 00:14:45'),
(119, 33, 503700, 64000, 0, 567700, '2018-08-10 04:01:58', '2018-08-10 04:01:58');

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
(165, 241, 102, 120, 'Tunggu ya soree', '2018-07-31 22:27:03', '2018-07-31 22:27:03'),
(166, 255, 47, 1, 'Tes', '2018-08-06 01:33:56', '2018-08-06 01:33:56'),
(167, 255, 47, 1, 'Bales dong', '2018-08-06 01:36:10', '2018-08-06 01:36:10'),
(168, 255, 1, 47, 'Iya ni dibales', '2018-08-06 01:41:51', '2018-08-06 01:41:51'),
(169, 255, 47, 1, 'Kok lama?', '2018-08-06 01:43:38', '2018-08-06 01:43:38'),
(170, 255, 47, 1, 'Saya gajadi beli ni', '2018-08-06 01:43:45', '2018-08-06 01:43:45'),
(171, 255, 47, 1, 'Pak', '2018-08-06 01:44:05', '2018-08-06 01:44:05'),
(172, 255, 47, 1, 'Halooo', '2018-08-06 01:44:14', '2018-08-06 01:44:14'),
(173, 255, 47, 1, 'Balas pak', '2018-08-06 01:44:25', '2018-08-06 01:44:25'),
(174, 255, 47, 1, 'Pak', '2018-08-06 01:44:37', '2018-08-06 01:44:37'),
(175, 255, 47, 1, 'Balas pak', '2018-08-06 01:44:48', '2018-08-06 01:44:48'),
(176, 255, 47, 1, 'Tes 123', '2018-08-06 01:44:53', '2018-08-06 01:44:53'),
(177, 255, 1, 47, 'Apa si pak', '2018-08-06 01:54:16', '2018-08-06 01:54:16'),
(178, 255, 47, 1, 'Pak', '2018-08-06 03:43:14', '2018-08-06 03:43:14'),
(179, 255, 47, 1, 'Halo pak', '2018-08-06 03:43:34', '2018-08-06 03:43:34'),
(180, 279, 164, 139, 'Pak agus mesen tuh', '2018-08-09 02:58:48', '2018-08-09 02:58:48'),
(181, 279, 164, 139, 'Pak', '2018-08-09 02:58:58', '2018-08-09 02:58:58'),
(182, 280, 139, 157, 'Sedang proses ya..... Gan....', '2018-08-09 03:23:31', '2018-08-09 03:23:31'),
(183, 280, 157, 139, 'Siap gan, posisi ane di cikupa ya gan..', '2018-08-09 03:24:40', '2018-08-09 03:24:40'),
(184, 280, 139, 157, 'Oke gan..... 1x24jam kita kirim ya....', '2018-08-09 03:27:16', '2018-08-09 03:27:16'),
(185, 280, 157, 139, 'Maaf ni gan, mo nanya aja..<br />\nKlo disini minumannya ada kopi, teh dll<br />\nKalo bir ada gak gan?', '2018-08-09 03:27:32', '2018-08-09 03:27:32'),
(186, 281, 139, 161, 'Oke..... Gan...... Di proses ya....', '2018-08-09 17:45:39', '2018-08-09 17:45:39'),
(187, 279, 164, 167, 'Bang kpn d kirimny', '2018-08-09 17:58:28', '2018-08-09 17:58:28'),
(188, 280, 167, 157, 'Klu bir g da pak da jg rajawali', '2018-08-09 18:31:03', '2018-08-09 18:31:03'),
(189, 285, 102, 135, 'Ping', '2018-08-09 23:41:47', '2018-08-09 23:41:47'),
(190, 285, 102, 135, 'Wkwkwkwkwk', '2018-08-09 23:42:14', '2018-08-09 23:42:14'),
(191, 285, 135, 102, 'GPL wk', '2018-08-09 23:44:04', '2018-08-09 23:44:04');

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
(50, 102, 247, 1722, 240, 39, 1923, '2018-08-01 03:24:14', '2018-08-01 03:24:14'),
(51, 1, 254, 6675, 2670, 187, 9158, '2018-08-03 21:37:08', '2018-08-03 21:37:08'),
(52, 33, 275, 480, 480, 19, 941, '2018-08-09 01:40:12', '2018-08-09 01:40:12'),
(53, 214, 282, 14095, 5638, 395, 19338, '2018-08-09 21:17:30', '2018-08-09 21:17:30'),
(54, 234, 284, 875, 1750, 52, 2572, '2018-08-09 23:27:17', '2018-08-09 23:27:17'),
(55, 33, 286, 0, 0, 0, 0, '2018-08-09 23:52:42', '2018-08-09 23:52:42'),
(56, 102, 285, 2512, 4962, 150, 7326, '2018-08-10 00:50:06', '2018-08-10 00:50:06'),
(57, 102, 288, 3758, 1503, 105, 5155, '2018-08-10 00:50:13', '2018-08-10 00:50:13'),
(58, 167, 279, 0, 0, 0, 0, '2018-08-10 01:00:21', '2018-08-10 01:00:21'),
(59, 167, 280, 300, 300, 12, 588, '2018-08-10 01:00:28', '2018-08-10 01:00:28'),
(60, 167, 289, 5340, 2136, 150, 7326, '2018-08-10 01:11:50', '2018-08-10 01:11:50'),
(61, 214, 283, 6300, 2520, 176, 8644, '2018-08-10 01:29:28', '2018-08-10 01:29:28'),
(62, 214, 291, 14100, 8440, 451, 22089, '2018-08-10 02:43:36', '2018-08-10 02:43:36'),
(63, 233, 292, 9260, 5079, 287, 14052, '2018-08-10 03:09:14', '2018-08-10 03:09:14');

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
(35, 47, 1, 0, 'suryanto', 'storage/app/photo_customer/DmtcBbR8TAWHNSvwpia7GJIWZtPPc9EvCRhiD6ji.png', 'pria', 'jl pelanggan setia', '-6.108829', '106.173477', '2018-06-05 06:14:40', '2018-07-02 03:54:12'),
(39, 61, 1, 0, 'Soni', 'storage/app/photo_customer/xvvqTzummt0ycQMTxAAN3JWBexw5WdgOVfXvGy6H.jpeg', 'Pria', 'Jl pluit raya', '-6.116298333333333', '106.76221333333334', '2018-07-01 11:55:42', '2018-07-01 11:56:40'),
(40, 62, 14, 0, 'Grosiran', 'storage/app/photo_customer/DjMlqzmAhCCILUGqqtzN933SJjT37Ouixkn4Y7fQ.jpeg', 'Pria', 'Gading serpong', '-6.2416645', '106.640847', '2018-07-01 21:20:47', '2018-07-01 21:21:50'),
(41, 63, 14, 0, 'Nandar', NULL, 'Pria', 'Serang', '-6.2431123', '106.6298351', '2018-07-01 23:55:47', '2018-07-16 00:03:28'),
(42, 65, 14, 0, 'Budiarto', NULL, 'Pria', 'GLC europe 2 no 1', '-6.2431175', '106.6298388', '2018-07-02 00:01:23', '2018-07-02 00:01:23'),
(43, 66, 1, 0, 'Addin', 'storage/app/photo_customer/jxunbwqhHBEe1wmBmb7WCPSFwLHl0Jpg0dwhXbR4.jpeg', 'Pria', 'Jalan masjid mujahidin ruko redio serpong', '-6.2430648', '106.6297901', '2018-07-02 00:04:12', '2018-07-02 00:04:59'),
(44, 67, 14, 0, 'Fadzri', NULL, 'Pria', 'Serang', '-6.2408283', '106.6480133', '2018-07-02 00:07:18', '2018-07-02 00:07:18'),
(45, 68, 14, 0, 'Muhamad Nizar', NULL, 'Pria', 'ruko rodeo C21', '-6.2431165', '106.6297901', '2018-07-02 00:30:52', '2018-07-02 00:30:52'),
(46, 69, 14, 0, 'Erben', 'storage/app/photo_customer/Eezz1bIpQB3tlhvSTu6YsIvzWFvLNyRWrhlEUZbQ.jpeg', 'Pria', 'Serpong', '-6.2410648', '106.6744288', '2018-07-02 15:01:37', '2018-08-02 07:51:42'),
(47, 71, 1, 0, 'Poltak', NULL, 'Pria', 'North land', '-6.240758', '106.648081', '2018-07-10 03:08:08', '2018-07-10 03:08:08'),
(48, 72, 1, 0, 'Ray Jack', 'storage/app/photo_customer/AR3P21pWnhdlKRwnEIFuSueFZMKlEtsikkOm1mEJ.jpeg', 'Pria', 'Jl. Cempaka raya no. 18', '-6.2407574', '106.6480811', '2018-07-11 23:56:09', '2018-08-07 01:53:32'),
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
(60, 120, 34, 0, 'Vinka', 'storage/app/photo_customer/8NTZIC6NJwCus0T4lc562uzqWweBHx6PbwalNlEf.', 'Wanita', 'Muncung', '-6.1089664', '106.171635', '2018-07-28 22:24:20', '2018-08-07 02:59:34'),
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
(81, 157, 58, 0, 'Yosh Bejo', NULL, 'Pria', 'Cikupa', '-6.2164568', '106.5011289', '2018-08-02 01:32:36', '2018-08-09 03:30:01'),
(82, 158, 58, 0, 'Jhonny Satria', NULL, 'Pria', 'Jl. Cikupamas III No 5 Cikupamas Tangerang', '-6.2164559', '106.5011313', '2018-08-02 01:36:07', '2018-08-02 01:36:07'),
(83, 159, 34, 0, 'Ratna N L S', NULL, 'Wanita', 'sumur pecung', '-6.1198989', '106.1677156', '2018-08-02 03:48:39', '2018-08-02 03:48:39'),
(84, 160, 49, 0, 'Irna corina', NULL, 'Wanita', 'Kebaharan dukuh', '-6.0925831', '106.1549693', '2018-08-02 04:48:32', '2018-08-02 04:48:32'),
(85, 161, 213, 0, 'Ropik', NULL, 'Pria', 'Desa bojong cikupa', '-6.2167736', '106.52305419999993', '2018-08-03 06:02:25', '2018-08-03 06:02:25'),
(86, 164, 65, 0, 'Guntur', NULL, 'Pria', 'Kp cadas ds rancagong', '-6.2164205', '106.5009377', '2018-08-03 20:36:20', '2018-08-06 10:50:29'),
(87, 165, 208, 0, 'ABDUL ROHMAT', NULL, 'Pria', 'Kp nangka desa sindang jaya', '-6.2163744', '106.5009206', '2018-08-03 20:37:25', '2018-08-08 22:39:54'),
(88, 215, 58, 0, 'Apit eko nugroho', NULL, 'Pria', 'Kp ciapus', '-6.2059982', '106.51978699999995', '2018-08-03 22:47:20', '2018-08-03 22:47:20'),
(89, 218, 81, 0, 'Irma Damayanti', NULL, 'Wanita', 'Jl. Raya Serang Km 20.5 Kp Pasir Rangdu Rt.028 Rw.002 Desa Cibadak Kecamatan Cikupa', '-6.20787', '106.4864186', '2018-08-04 05:47:41', '2018-08-04 05:47:41'),
(90, 219, 86, 0, 'Siti nihaya', 'storage/app/photo_customer/zATKlWGQRYoJWKXbLbFt5Il9vHxJ6ve7eDZu21Jq.jpeg', 'Wanita', 'Kp.cicayur 1 Pagedangan', '-6.2059982', '106.51978699999995', '2018-08-04 09:07:19', '2018-08-08 08:18:43'),
(91, 221, 86, 0, 'Isnawati', NULL, 'Wanita', 'Kp.cicayur 1 rt01 rw04  Des. Pagedangan\nKecamatan Pagedangan Tangerang', '-6.2059982', '106.51978699999995', '2018-08-05 01:21:50', '2018-08-05 01:21:50'),
(92, 222, 86, 0, 'Halwani', NULL, 'Pria', 'Kp.cicayur 1 rt01rw03 desa pagedangan\nKecamatan pagedangan', '-6.2059982', '106.51978699999995', '2018-08-04 22:32:14', '2018-08-04 22:32:14'),
(93, 223, 86, 0, 'Siska', NULL, 'Wanita', 'Kp. Cicayur 1Rt01 Rw04 pagedangan', '-6.2059982', '106.51978699999995', '2018-08-04 23:48:37', '2018-08-04 23:48:37'),
(94, 227, 34, 0, 'Nendar', NULL, 'Pria', 'Sumur pecung', '-6.1207165', '106.1652614', '2018-08-06 05:43:20', '2018-08-06 05:43:20'),
(95, 228, 34, 0, 'Hendri', NULL, 'Pria', 'Sumur pecung', '-6.1209679', '106.1658699', '2018-08-06 05:48:37', '2018-08-06 05:48:37'),
(96, 231, 34, 0, 'Syarif hidayat', NULL, 'Pria', 'Sumur pecung', '-6.1229207', '106.1663641', '2018-08-07 02:46:33', '2018-08-07 02:46:33'),
(97, 232, 34, 0, 'Rifaldi', NULL, 'Pria', 'Sempu', '-6.1214976', '106.1661693', '2018-08-07 02:55:21', '2018-08-07 02:55:21'),
(98, 235, 88, 0, 'Nuraini', NULL, 'Wanita', 'Cikupa', '-6.2300125', '106.5140328', '2018-08-07 05:33:39', '2018-08-07 05:33:39'),
(99, 237, 110, 0, 'Ahmad Rifqi Riva\'i', NULL, 'Pria', 'Kp. Rego Pasar RT/RW : 014/003 Ds. Padasuka Kec. Petir', '-6.110366099999999', '106.16397489999997', '2018-08-08 00:10:26', '2018-08-08 00:10:26'),
(100, 238, 34, 0, 'Astani', NULL, 'Pria', 'Sumur pecung', '-6.1229207', '106.1663641', '2018-08-08 00:13:37', '2018-08-08 00:13:37'),
(101, 239, 14, 0, 'Eni', NULL, 'Wanita', 'Serang', '-6.110366099999999', '106.16397489999997', '2018-08-08 03:34:45', '2018-08-08 03:34:45'),
(102, 240, 14, 0, 'Suhaeni', NULL, 'Wanita', 'Kecamatan serang', '-6.110366099999999', '106.16397489999997', '2018-08-08 03:51:30', '2018-08-08 03:51:30'),
(103, 242, 66, 0, 'Khaerul ahmad', NULL, 'Pria', 'Kp gerobogan Rt 03/03', '-6.2094602', '106.4967275', '2018-08-08 05:28:55', '2018-08-08 05:28:55'),
(104, 243, 97, 0, 'Saropah', NULL, 'Wanita', 'Kp cadas ds legok', '-6.2812832', '106.5876773', '2018-08-08 05:54:40', '2018-08-08 05:56:17'),
(105, 247, 89, 0, 'Afan kurniawan', NULL, 'Pria', 'Grya persada 1 blok A 4 NO 41', '-6.171509', '106.545506', '2018-08-08 09:28:10', '2018-08-08 09:28:10'),
(106, 248, 24, 0, 'Sulastri', NULL, 'Wanita', 'Grya persada1 blok A4 no 41', '-6.1698377', '106.5468062', '2018-08-08 09:32:05', '2018-08-08 09:32:05'),
(107, 249, 108, 0, 'Catur', NULL, 'Pria', 'Cibadak', '-6.261887499999999', '106.48374509999996', '2018-08-08 17:32:02', '2018-08-08 17:32:02'),
(108, 250, 101, 0, 'Mirnawati', NULL, 'Wanita', 'Tigaraksa', '-6.1786143', '106.44967680000002', '2018-08-08 17:37:16', '2018-08-08 17:37:16'),
(109, 251, 106, 0, 'Fufah', NULL, 'Wanita', 'Cikoneng', '-6.209868340835677', '106.4981108949662', '2018-08-08 18:10:33', '2018-08-08 18:28:48'),
(110, 253, 111, 0, 'Nuryani', NULL, 'Wanita', 'Kp bojong kec.cikupa tangerang-banten', '-6.2167736', '106.52305419999993', '2018-08-08 18:23:33', '2018-08-08 18:23:33'),
(111, 254, 114, 0, 'Kulsumawati', NULL, 'Wanita', 'Bojong cikupa', '-6.2167736', '106.52305419999993', '2018-08-08 18:26:39', '2018-08-08 18:26:39'),
(112, 256, 115, 0, 'Sriyanti', NULL, 'Wanita', 'Cisereh tigaraksa', '-6.261887499999999', '106.48374509999996', '2018-08-08 18:57:11', '2018-08-08 18:57:11'),
(113, 257, 2, 0, 'Subandono S.H', NULL, 'Pria', 'Jl. Ciputat Indah blok A/13', '-6.1089502', '106.1715839', '2018-08-08 20:02:04', '2018-08-08 20:02:04'),
(114, 259, 116, 0, 'Karo christian', 'storage/app/photo_customer/maJDMA3YGxnnyzKxEfTvy7SScAZRAMUJTuo8argh.', 'Pria', 'Cikupamas Tangerang', '-6.2164349', '106.5011142', '2018-08-08 20:27:07', '2018-08-08 20:36:35'),
(115, 261, 98, 0, 'Asri Wahyuni', NULL, 'Wanita', 'Talaga kocak cikupa', '-6.2167736', '106.52305419999993', '2018-08-08 21:57:53', '2018-08-08 21:57:53'),
(116, 264, 2, 0, 'Yuliyana', NULL, 'Pria', 'Link.  Ciputat indah', '-6.1089648', '106.1715874', '2018-08-08 23:25:24', '2018-08-10 02:12:59'),
(117, 265, 2, 0, 'Adah cosmetic', NULL, 'Wanita', 'Jln cigabus rau', '-6.1081292', '106.1726009', '2018-08-09 01:00:24', '2018-08-09 01:00:24'),
(120, 270, 1, 0, 'Joude', 'storage/app/photo_customer/zMAvpo42PvBjT47D1MQTV2rRgpKGgpJ1kTPclmYW.jpeg', 'Pria', 'Cikupa', '-6.2971525', '106.5701927', '2018-08-09 03:36:19', '2018-08-10 00:31:37'),
(127, 279, 34, 0, 'Sumiati', NULL, 'Wanita', 'Ciracas', '-6.1229176', '106.15566569999999', '2018-08-09 19:06:32', '2018-08-09 19:06:32'),
(129, 281, 109, 0, 'Tri sugiarti', NULL, 'Wanita', 'Kp talaga rt 03 rw 03 cikupa tangerang', '-6.1692966', '106.5364171', '2018-08-09 19:30:25', '2018-08-09 19:30:25'),
(130, 282, 96, 0, 'Diana oktavia', NULL, 'Wanita', 'Kp nangka ds sindang jaya', '-6.1766101', '106.49948889999996', '2018-08-09 20:06:15', '2018-08-09 22:22:43'),
(131, 283, 96, 0, 'Siti mulyanah', NULL, 'Wanita', 'Kp talaga rt 05/02', '-6.2059982', '106.51978699999995', '2018-08-09 21:45:00', '2018-08-09 21:50:34'),
(132, 284, 2, 0, 'Arnila', 'storage/app/photo_customer/eooP0ARYs8SBXfjWaqh9lJtbUtWJR0lOoVW8RxXo.', 'Wanita', 'Jalan Madani III, Taman Banten Lestari blok D3E no.34 Rt.04/21 kelurahan Unyur kecamatan Kota Serang', '-6.0962315', '106.1715104', '2018-08-10 01:18:55', '2018-08-10 01:26:11'),
(133, 285, 34, 0, 'Sisil', NULL, 'Wanita', 'Jl. Agusju RT/RW 008/010 No. 88 Serang - Banten', '-6.1210588', '106.1645262', '2018-08-10 01:35:37', '2018-08-10 01:35:37'),
(134, 286, 96, 0, 'Aji mardani', NULL, 'Pria', 'Kp cibadak tegal ds sukanegara', '-6.2167736', '106.52305419999993', '2018-08-10 03:27:26', '2018-08-10 03:27:26');

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
(52, 47, 2, 'f2C3lOnOtk4:APA91bFvcFN95bLOJzHrfCTnnWl36Unni49hVDH3Ce0eZgIKJYiaowzdU0YHWDLMXzJNi_gbr037UUI9QJ0IaxS3iY7oT4SaPOpfRb9ePHsNZFmywGYV5zO35eWgIaicD6Bg8Dv3DSxrKf6SkXVt_la69PwIUFpP-A', 'Android', '18dfb1919530cb99', '2018-07-20 00:42:28', '2018-07-20 00:42:28'),
(54, 64, 5, 'fU4KTOU5Ce8:APA91bFAmgHDpkQ6sZWmM0pguMwEuBPsHJCpireXmNNqDSGSb0mbu54ZqReJc9bk3qfZh3YmCXJoocV_o52wSiRdrUW8qpyZqvxOm30s4t4aFqtllccUSIAJlVU1iOZswHHkbRNJQ-mzk6Q20zh2cKrx9QE8MB7Jtg', 'Android', '7482f2d34ccdaae5', '2018-07-22 08:38:24', '2018-07-22 08:38:24'),
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
(129, 72, 2, 'cZVYemNGcdc:APA91bHCXiqlWvgHi3bTcr-M_LBv3PO65nF5j8kI1aPzl5EBoUqmH6M3eIu8uxZE6t166XRJzHXL0qEFXOoB0tPXOLWmE-dnXxcEZZyy92mGXBT4ob0Qb11q15yYFxeHIjv5vnlk2jxUKxouHc7uADarXCDQklwTqA', 'Android', '8c74342f80b0da7d', '2018-08-01 04:44:48', '2018-08-01 04:44:48'),
(130, 148, 2, 'eDC7-OrJzCU:APA91bGdP1M-FPA-wsITP26iQ9sLAlh2FPAXYCsZOVuSH6hl6KtmLm61K8tqBzlqMcQXgXujcNYtozZUWTQHKdcigfGcb0dEc20_n1jPGWPJdUy4vdF3LEUr1yVVDlckhCXaXuA1DKalzdbpvidhsQ_gEfcCZgr_Qg', 'Android', '44c86900ce7d0d23', '2018-08-01 05:33:39', '2018-08-01 05:33:39'),
(131, 150, 2, 'fTdw-gemnFg:APA91bEH-B9E32E-NESG77cAQFHQIi9ErA9ZgJCF0q4k1CdcXH7x3fpLYKUUHc2m1WSvvI0KD5l_PBgU6B9Z2gGIgdYwfp8bx8MA8Ml7MVxHyZK4UclDp-bRhcH4rhT8NO_HxxIDo6Vj1x896_vHGKLYD8M-Vej5Ig', 'Android', '0a95277267912e83', '2018-08-01 09:58:06', '2018-08-01 09:58:06'),
(133, 154, 2, 'cWJah9FvqV0:APA91bE4RJ95XGj8Rdc_0BGKLwBEX0oR2eiy4bu_MzFZQF270_oUx4JTvFh0iGXcy14n3C2zMFZ1Ztg1jyfvjScldyju4ewbW991ds-vDllE7Zvre-LHMIy7gV1N8vAktzUmq_w5rzch3CqjHbLelOJ_wqC36-B2HA', 'Android', 'd5c06f98399a499a', '2018-08-01 20:58:25', '2018-08-01 20:58:25'),
(135, 60, 2, 'feJ3ArZrHM4:APA91bG-Xy96BM0QeSFHmMQLgvXG4b0iND5I4NAPv3DS5kmyFvotfJIHEQar8bFh0rcwK-jjC8n4xBAbVDseouLNplDf5GewR_dMkl9q735hB_KJil1lFq71Cyaeu18MSPjCKLjoF7RGKD4qnK1HpC7TB3b2ftoAkg', 'Android', 'aa24d4751e30c5b6', '2018-08-01 21:33:09', '2018-08-01 21:33:09'),
(138, 136, 5, 'fpTq_AKk00g:APA91bEeRGKPQpMa8jDRzyZrmEahM8EhDUsAryX1c11LcshRvJXVx_TVEtMc_-hrTkYyauC8JPaq3jDLQDDsSU23dBcwU4csOAbYT0PGLPwxSXKkjAU_2WcNhjOeQb9WJYHmkzeMAIi7eCkBEVw4IDJp5yXe61hcYQ', 'Android', 'ca5cdbcc84ab92c6', '2018-08-02 00:06:05', '2018-08-02 00:06:05'),
(140, 156, 2, 'dVNjNPJcWA0:APA91bHIJSaCUmpsF8gfVP-WK22xfspj6IyqM8egZHZSJgtFSwN9fcQZwTyeo2YWLv_I796AbjV_rWXnPXT0kkdh0QI_mTxP0KH9GV0X9oNeqBBofLtu_I164fEn5GcZazaQAnjd9h8X3LbD4WlncHFQSPfu1HtGCw', 'Android', '35b0ecba13d6b532', '2018-08-02 00:16:55', '2018-08-02 00:16:55'),
(144, 157, 2, 'feMIefPQIgw:APA91bHo_foD11Ebd9XoDV1p1L0NMFgn5j_rgMYnnp9FL6VZVCxHvwvhvKUd7tpJMb3GDrxsAWmMH3Sym4WFYNtu2cPr7IermAJo1diE2emzgKa6rw4FwuF9K8z-f1IJARb0k0g-XC2End1LUbEcc8OJiywE3wrZEQ', 'Android', '531d94005a4ea842', '2018-08-02 01:33:04', '2018-08-02 01:33:04'),
(145, 158, 2, 'eCiuva8GjXc:APA91bGgg4GszGGkom7kVJCz2cQ2wEQjxJ29ed3Z-GE39EGzR_VjW9ihQFE5g3oseHY610Aw3wjECusnQPoA7ISFKUU6i4quSBN9w-YkZaIkAJ1Enrs-wi1Ce7aqbw6HdmarEID5uBYXxTbJ0mzigg--YMnq6M-fBQ', 'Android', 'd429bb789e180524', '2018-08-02 01:38:14', '2018-08-02 01:38:14'),
(146, 159, 2, 'dVN5UPiAXhg:APA91bGc-WPmPmQW4050cIVKgipFlC8nJMfvxfPXMyjE0wClYP36MWtiHKdkNZnGVtsfCPF3OitQ8YUoi0MTcS92EAt2j53_4uUoqSlPQo2YqE-htup5np_LY539CoqvjnUR0LvXu9oKGxv7bPVeF0vNAmQ2DR80Fw', 'Android', '6076a1585e6c45ca', '2018-08-02 03:48:52', '2018-08-02 03:48:52'),
(152, 1, 5, 'c48OPmwysXY:APA91bEwyZqXA2q1TZxcs1kjEEYsgn4BNjTJXzwRGftRkA83Q-Z9IozE7WdgHDnF-yZt7gmlzVn_WsREUX7gG7ZEHNML9PD6TUlaEUgoreOwcVEyuOhaQEWlJ-ywJtI_4bW4W_AhU4OZGxlN70dH_0jgNw7r0Va4dQ', 'Android', 'a188090ab01aeff', '2018-08-03 02:51:32', '2018-08-03 02:51:32'),
(154, 161, 2, 'dhsnHsdNUNg:APA91bEIePno9ohqMlZyMn8Dlx-mLWbyPuVIkrF6ISBgbKm1j_uzM5JltiU6zN9WqJOIf2RFRjhZ_F89jBoJer_MDqoGBJkBwD5I_foFywCAr_tjAC_FPh2wg-dgbfS7_HlIhGU7DSpT3mx7c1jstBbNKCz1BisrGA', 'Android', '20c56c1c033a64d7', '2018-08-03 06:03:26', '2018-08-03 06:03:26'),
(155, 164, 2, 'fx-5EJVUbmg:APA91bEo1JUBfcA0e8zT2TjiroQSGm3ZN3JZ-lSefjuvaqh7N-hX1r1dibkjKm8YN6ZKDwtmqNG1LEZJHEu-UCvP4k5ItSl12_fsFFDHcv2fmSvkUi0mJ0a9s6CWkP8QriMhWh087MIKcg7XOaijTUPvoELc6RIB7g', 'Android', '3f5f8f08bac31639', '2018-08-03 20:36:46', '2018-08-03 20:36:46'),
(156, 165, 2, 'c2ROrnSkFuU:APA91bGjMd9dWC3AHdpt5Q-xucYhD9F4neFDLvig0llqig2pbrCEU7hqabUlIOUt-rCJAr8nl-Gg1_WVwJlffuTGlfmtIC9nDJvDshvsQXhcddr-7dNoltgQOStT-NRKRKgeSxwRJGzsCB_6_xaVGazJ5NvioOiWJA', 'Android', 'ddd4c2d94cff5afd', '2018-08-03 20:38:09', '2018-08-03 20:38:09'),
(157, 89, 5, 'cvxJcDU-k0g:APA91bEzhCqVpcnUjlcGMOAuJ9QedYi4hQI-6cqcxR3geJHl2jZEOIHkJjTIYg_8JK6o4kor-Z-1X8fLpllFNfeEcuq0Ya-G4TXkaPqt_pPfrsXiZUNH0hC-Ws7Tps9egqhW0GnxKiHEDeIkGW2KMz6L5kQG0Uz8nw', 'Android', 'a5e0698c27fc8e38', '2018-08-03 20:39:09', '2018-08-03 20:39:09'),
(158, 182, 5, 'dFE5JSnMeFI:APA91bEMH_RvFwXEU2LbZP84x0SmpG8U6iEQZBmEDvGei-D0_nvcnbYl8ecpHOJ058bSDeCLL0L6-8DiIAgWaeESrZZygP9TThdEaYFB9U6ZPhn-luFrluOfsoiHZdX81G61Kn_pQhbCRO2PuqQtlY5sLWCCHjJDsQ', 'Android', 'ebb9acc26fed269f', '2018-08-03 20:49:44', '2018-08-03 20:49:44'),
(159, 166, 5, 'cirBhSRUPjU:APA91bFFMdiwBXBt1RWZbJ9BgWmNsNh96Y_hZGgwogyl1nOT6E3PSPSIy0WTUsSnEqeW3UgBPrhRa-8C7fn2VlZpG20OmKxJN-FYHBC9VH4zX8_yzou3nKsNdAXogkVPNNBKEpxLHnzCm8ZgHz3_2rnhU6nveDvXaA', 'Android', '57b2b61662eaa7fd', '2018-08-03 20:52:08', '2018-08-03 20:52:08'),
(160, 172, 5, 'esV3i7uIDn8:APA91bEKn_tGLg1sGh2EUXl40sSHCV4Jjw9BGjzvhEWksyEwdNA9yQnvNNSRWgNgSHCMRl3A8e4Jx3tdzxr0m9XeG-1b3vPs1eNJP23RhI3FzXF3BZGxW3VBYauBAhBDYMta1V9HHQeFc5wkS4zJys4igEBf3-pNAQ', 'Android', 'e45f7470a6b6a733', '2018-08-03 20:54:57', '2018-08-03 20:54:57'),
(161, 174, 5, 'd70MTbB11DQ:APA91bHRU-yUi0oVykqLRE69mtom56YrISAJ4zlLCqfayylJc0XVfmmUy1opVFXbwkYx21-f-8Z-92HlONIt7ue4mIvv1lRZak9qpqLZFJggBf7qea_a6rzDZN0eUzhkD8zvrfta_TgyDxLYMSWrbrFQWS2-N9VdoA', 'Android', '76f34129c45cf78f', '2018-08-03 20:56:13', '2018-08-03 20:56:13'),
(162, 184, 5, 'e08zzYxtOcs:APA91bE6GLmqkLjdYuuQP8ppSMv1-ocLG1j0Fu_gnN34-aBQ953It9RdQunqTKnKd4CowKGBC6Ak9M7hlVe8I_H5ujwAU3K_feEHbHmhfLPNkcGIcPbZvgNXY20YCx3iqqJ-ciz7Mv_M9XujbKLucbQZnr98gTebaA', 'Android', '5f493a6784fca6de', '2018-08-03 20:56:14', '2018-08-03 20:56:14'),
(163, 185, 5, 'cx6PAv1n_Z4:APA91bHOIpbYBVdyENeiike_OICVplU0cxNu7-kdaxLlwAj0eGJDK5KUCkgoUoUGU9X2cuI3Wk_AF19wPOJnKkpD9NDjqgkqXqqlS2mjbT-Bo_hvPDdY5hwwc81_0H1xZXAqnL8quHILVZ_2AL3rGHuHYn8Yw4JQOQ', 'Android', '76d51a22b897e371', '2018-08-03 20:57:30', '2018-08-03 20:57:30'),
(164, 181, 5, 'eikapfTKmgY:APA91bHlDgoOhkmbfSd__J-uuMpTo-MF-9MgbXK6fAGeP1j6VzLHPi3hoIF2WOd-pJriQzxLOo45s5m26wSImSHD4BnKgzMO3fAzJvD3FJXX3MWzVVISnp2p0Ia3qEKAGVoDJ3O7mNgek52eWsW4na2TjwpI04MWAQ', 'Android', '4ec217070e6d4590', '2018-08-03 20:58:53', '2018-08-03 20:58:53'),
(165, 173, 5, 'e61KOYHf6p4:APA91bFYRjmNVKa_fqEqWEboaaI_tx0Zvxr8ELBaHZHGxoTQFDhBrv7c3S3NatU9hBD2xTQkSfNE1nH-uysCRjqWhRoGTOJD3NFJgGY-Ba1N--Sxey76Ithy9_VRIx8X38HOoUiawuKzupGINwLJJ1SAwyvQWOZZ_Q', 'Android', '20ff4265d95b94ed', '2018-08-03 20:59:02', '2018-08-03 20:59:02'),
(167, 177, 5, 'eKVSeaS2z1M:APA91bHon0QI4mOD9Xrk5j5BKHCJp_rLPFvA1mRufITM8BQHk6BmHOlxk0-OWvbgiCkvCmfA7mqiPtII8_0AgC8miJWTxwzOJqA1NXTXjcKXSvxi6B_zz9Djc76UMTPBMv3xgbC8ZkAeBxHXYPJCtvGTq1vZn_BYvg', 'Android', 'e2c3fc1507b0ef8e', '2018-08-03 21:00:18', '2018-08-03 21:00:18'),
(168, 179, 5, 'cbXejxEHK2U:APA91bEjDbwMyt58fEKTKYJjEOtq9PIFwlNOgIXenUSH9pGTmPpAIt-xB49JB3ft-RcSve6mG6Pftzz5GaXUGQ6PbrhC9tF8hrq9icnIyWsWLJJwMlhgYWC_oaC7GdVfz6Lz_uSxMNCzjnCKuwxnWqfWaKsQGMEtQA', 'Android', 'e5c83bc59979018a', '2018-08-03 21:00:22', '2018-08-03 21:00:22'),
(169, 176, 5, 'cP2_1M6uQz0:APA91bETiH6kxiBwAcJzFpU7foqDkFyTHmsD--e6QfjpIIQcxQNGPwvJ2HDogfq1QSdiQ3BAT73u7qWfer7GmpXOs3W-ebJd8dYAWyXjzP7Bf4NV9B-h3Hf-B2gKybkz_ccqgfCTvYZ6owL1gZvAougmwmmLWq4Y4Q', 'Android', '1e624ec37ac36c15', '2018-08-03 21:00:24', '2018-08-03 21:00:24'),
(170, 175, 5, 'eYPRa6FULIg:APA91bHoEH2Vj9fZD5xO-fJhiq4eKMs1SaTVEXG_llKC4HcB0lW0E4SNf4SOlFiF_6aFRkqeChle1fDZPw0FSItIL7FBvmcMnnA_NIVCZ1fLVo7kV6BtySPWJ_WXsTjrbiVARabYR0os4AxhbSJSYTQXu3IdXVqtDg', 'Android', 'd9b4c15245cb624e', '2018-08-03 21:01:29', '2018-08-03 21:01:29'),
(171, 207, 5, 'cPlVZHjlqjo:APA91bEqgrtxRQVvVVVUPjTYUdCPQHzch5Ux_2NBaSInAVnmmOO8YWByE657pJWslTJuZ4Y4XtJXr_jhN8oaavEq2_SkjHmYTKqWt81cWoSR-sESJhPstsJgoHMovaYXD1FE1UV9th7MANLnQi4m8x8tK4GTCnbh7w', 'Android', 'ed8d49f6eed1e03c', '2018-08-03 21:02:11', '2018-08-03 21:02:11'),
(173, 201, 5, 'emc-eQUXi-8:APA91bFVAoK356Te2CsrhtPBmOEuT3eZxQ-5KNlyw843gMD1Nw8ATdwKIjnS5iNOd4tlr4OKC68J3WvWBJ652Gt7CMZhSO3NNXYlL5kscGPoWPmcX-gth9C5OeXEYNHooS30skphB1jL622RoifnFPwQh6YSMCfRcA', 'Android', '715b2116fbf6b6c0', '2018-08-03 21:04:02', '2018-08-03 21:04:02'),
(174, 204, 5, 'd9yUXECIWAc:APA91bF0Ck59Imj8KSVkhiskrV8EAcZy7SPtA5PdSob_2DfX_HmXy51eIp7-K-ye_tyybQ_h3YsS1xCBhEElAxdDcvQREAefBp-TpV1tA9M8NVbJt8odWdG0Iyf_aZi3zuPxi7oE2XWp_v6BEJJ4Av1ZFIo1wZafVg', 'Android', '2e3efb6b59940fa8', '2018-08-03 21:05:16', '2018-08-03 21:05:16'),
(175, 205, 5, 'cfbOXXFWOOE:APA91bHSZM-VfiAfe7o1MMJKseUTDO0Kjm4YQMgyrzdO10ZyhDGnWsRPPf1waMiHTZ-40KRVJV7VRsstvlVGiEdjUgxQV2qlm7-eXoTlwC0_0fUohN3g1RSO7wv4cz-4OjP5Y_Ier0JVpwWVtfQ1QBznY-AneKtZcA', 'Android', '906514a5649274b3', '2018-08-03 21:05:21', '2018-08-03 21:05:21'),
(177, 208, 5, 'eewptZJd6dQ:APA91bEn7DEipQHZJ6paVIJs0XDnNyr4VMZRwPfhuh7JovkeTwD5k1-9FcByIHjxg51vM12FVsvoO4dCL6ch6niBEcjT4iiwIqIvaVKKaSEJTktsp9oS3DnVsEnspY536fIUGbsFetRLRVXWPHx9jIN4Gooa7IsY6g', 'Android', 'ddd4c2d94cff5afd', '2018-08-03 21:06:06', '2018-08-03 21:06:06'),
(178, 188, 5, 'edzqlSoxyXI:APA91bGr3liidECUXwo1O1QizNfLXBu5GtZ9VZEd3dBT510RxGpC2DLVsV5YracKmlbgNSqTL9F3Yiawz-Khbg8_uABdpkFu_wo59fTnSxMLc0jKqyhsQhQ8BaFCFmkZDY_ipL0VmXMZn05ESP_6nkkVGD3TZ5C6JA', 'Android', 'c972e6b005c38f62', '2018-08-03 21:07:02', '2018-08-03 21:07:02'),
(179, 194, 5, 'e3othoTLKk8:APA91bGirDq6NcscXUpUM8RV69Xf2-agMtoIcjWMtwzCifwaeGeVQxCw8CtLR1BLSMJkGVo8iDk6J7UTvx7V1GL0PH6mXfcHF6MQcshFH_z0OCwy7Zwna8n6k3IH8AR0RUbdMJ0WXNFQSjRrHjxyDhqPk1UymU7Jhw', 'Android', '28e2ca4577affa30', '2018-08-03 21:10:29', '2018-08-03 21:10:29'),
(180, 1, 5, 'd7OFQttB7Cc:APA91bHtJdfo13wyXLlPYPLRk6N5FR1sESrZh-PUM52KdnTCTHGYikRlw55p5yjs2yTQv9JCCoB2ieM3SQRvPFhvEKXJiQJlB0eIonEMLW6fFTbLzs0FUpamTQIHa34stXgJxgHHDOedZX6RbjhVcZLrTvHDz5WgCQ', 'Android', 'e9f514591774e2e', '2018-08-03 21:12:55', '2018-08-03 21:12:55'),
(186, 180, 5, 'f1POvbrv50I:APA91bFj5BD3ApKw4clqUALcXlP6OcShfdpRd1ROFi6MX6YG_QQa_GZfsy28dTxkedOTuA4qOKqmxa-TPcTyaDfIKg-XZr17bnbeoDg1JPTGMkMejCqKSVJ23EHXD9x4tF4hbf8r0Ln1oHSxyR77nt6mKHiZr57hug', 'Android', '1afbb3362a9fad04', '2018-08-03 21:25:47', '2018-08-03 21:25:47'),
(189, 139, 5, 'dz1TTdZB8XQ:APA91bFbud-uYsUldFCmwBr82ITmRbeYsNfU-2fjVBZggfpxZRnfLxHVv3fhyZyRv4Xq1JZ9DzIP5Qln0KkPptSLNl6-uljJ96VeC2xDdZZVpGEmcOasahB80swB0PYFXC8VGbWfQGJOsLMCp4KXBuFeEV0MfxhImw', 'Android', 'd429bb789e180524', '2018-08-03 21:52:53', '2018-08-03 21:52:53'),
(190, 215, 2, 'cjta_BKYQ4U:APA91bGWCOTc-IpXoKpXWwCYGCa2yHfqITLkxpHFLswpYVczQf0g97IFO5TtpsaMPMkNrOwKbU6r3SAumHsJ8nTuOXHIPiw4n7JYtw9r2cbrIKo7-RJ3TrpfEWlHNDgn_RNiPJ0wSXU_BuJXl1OBHf1CGM-XnegHsg', 'Android', 'a49584d8dac73e29', '2018-08-03 22:47:46', '2018-08-03 22:47:46'),
(191, 1, 5, 'fmi61e5kth4:APA91bGaGEu3VS6O-noA2qLzXunFad2jJ98zkXLORgWsOAi4zz0HmQa0MNvakV-PgShpxI9JWkAF-za9MN6hM2m9ZB5EPSfGNC3JCT4q47VD8pVC4ObL9LnVc86u1mEruCXWoos85p94bXm3HofOhhzTyWu-xzHUoA', 'iOS', '74FFE3A9-6038-435A-9169-7053F0EBDA17', '2018-08-04 05:15:42', '2018-08-04 05:15:42'),
(192, 218, 2, 'copKuLb4hJk:APA91bHyCMIdx83Yg3in6EsK3-pfNo30N85IE5yDWfw87tlIka9TyEZlFJEJ9AvcPJClWN13kY74rep-CQIBCOUw1MPQU2fiIjmqG2Y1SqiK1wYLCRv-YgPZpeyNzb4D91RYuAaDwRWf-9h_1mgeKXtpbStuhP_7WA', 'Android', '24414d16cd3b464e', '2018-08-04 05:47:58', '2018-08-04 05:47:58'),
(193, 60, 2, 'e0N9wgbZ42w:APA91bFqgZ9Ovv5zLQ41sxkDwvBLdssrNLFYRdCk1M19kcsgMbiQgVPQ7ewu0TsmJY5Nx76W5bexgBf91U7QDxobwdADtX6lhd7HzW-q1h8KN23K8gzDHaqPPy-haUS0MxNTvyfTyw8t7i-p2Ci4XBgk0bSbGpJu8w', 'iOS', '74FFE3A9-6038-435A-9169-7053F0EBDA17', '2018-08-04 06:10:58', '2018-08-04 06:10:58'),
(194, 219, 2, 'cPFLg0yjczw:APA91bGjsYGKXn87p8QnBgo22TnpR7H4q4VUI_TGV8hEnTbGrloP-Pmmw3Obpm0DdWvpkNVqAQjMJ1prf2GMwedBXLVe8jL2JVEEhxqN42_my5T2L01sT_BwV0py1zt_9iWfbzKa1lc8au2M6LaKAtw2ub-zci_0Zw', 'Android', '3da13f1d897db508', '2018-08-04 09:07:37', '2018-08-04 09:07:37'),
(196, 221, 2, 'dL7i7hx96vI:APA91bH5F4MsZPzSvYdZtGln7fxKqLD5oaH78EJMp8w1jOTLtp3AYZdqpcvFdRW9z7eMC46-l-nZXZIPbpqNT4bfC7UWBANMPrhC7LvKx1JgCNbSfh84VR_bXYpj6sbDRwyWl96gj4Ta0JT9sNrhji1VuHlHhm4pOA', 'Android', 'e288fe837f1c5322', '2018-08-05 01:22:21', '2018-08-05 01:22:21'),
(197, 196, 5, 'f0Izlgwnxy4:APA91bFpCEmtP3s2FX9xpU4cC26Hf4Ye4vsZ3CSuh25i9tGwMRTtCaxMyeRRfDghckGxa_udohFzXAHsDvz6SJ7zDuZDB2jUTIUgo72al68-oesmsGfLWa0QDpxxF7l8aFhFyuUeiIHCZaqzp8KoqzUVM2mLXq7mtA', 'Android', '3da13f1d897db508', '2018-08-04 22:23:44', '2018-08-04 22:23:44'),
(198, 222, 2, 'djds3c_h6gw:APA91bHCo2V-JutPzlTNbv6J5XcnPkojtVNOpd73l5Cdi7jepmURc50xcwLF-29KRUBMRpx-DvJ0YsM3Lmo_g_Y8zZriEymYvszd35_196CnhC3LOKk6NOw81J86xMnGGPDSoL1kopn2ouCV2TQglOx5QZ_8ErT86w', 'Android', '7b15ee45bc5d52a8', '2018-08-04 22:34:59', '2018-08-04 22:34:59'),
(199, 223, 2, 'ezxJhxYhAmc:APA91bF5xqjTMqEnvmFLiPJ6Aq-ECRDhAgdJs8TM9ownCQCyIrk5SLfbrywj-pk-MOHD-vk4GRE78Jv2GT4rNiHXydvNBOPO0FcfTVmzqwwWRCQb7Q6ZWHyO001H4xarRNQlY2lJ87eJEbkJTAJFgoWuLhkCNz3qtg', 'Android', '91afc2991fd3d66', '2018-08-04 23:49:12', '2018-08-04 23:49:12'),
(200, 209, 5, 'dskWJU-85J8:APA91bFEotWOGTs4MWMhJ57Ljk3WaWq1-3C5FIDuFGTrIRXnPP9lWnptHz3hW9VYnZ2Crev1z11kPkaQ3HRCC1qTjpsVnplGhNhj6nOkUb449NvLezoaYCEShqGSgMNoaZrVga9_KmLE34eGoJ-33_NCppVaYo91BQ', 'Android', 'faff7f6c5d8c94c', '2018-08-05 04:52:57', '2018-08-05 04:52:57'),
(203, 47, 2, 'dso8F8XoxzY:APA91bHJLZN-CQNX79FAvpAm6xNCrqbcCrnx32UEc0hZOqkrMOlBSOhDkGtQV1dZqP6Ak3xSQR8XS-gyUq3ug2_tvSCygmP3V2Fn0EW0zYCFLdPEErN12KM7Xg4bVgsanfsduwXQ3Cfe2J2GTdyUcUifMIVC3_Xjug', 'Android', 'aa24d4751e30c5b6', '2018-08-06 03:27:21', '2018-08-06 03:27:21'),
(205, 227, 2, 'c2FOxnR9CBQ:APA91bE9xX-2ImpdjlBIwGO5doyH9ZqlUi5rZhlchpCBGgqBqzSoImiQbfsOmI9W0D2Dj467P3DNfPhRDZ5CPthvNpchrlBhxgMGvDi4tip10p83jfPfToPkRLM6Eooec86bdptJIbAlaE8S6PCigh2sOeM03H-UDw', 'Android', 'e1a5bb7e961ef50', '2018-08-06 05:43:40', '2018-08-06 05:43:40'),
(206, 228, 2, 'cq1IulsoSNw:APA91bGg1RnXfhelXp2IlrSNwkzQWGDVg-CJEa9BwLuoKFMRGGk4h2GBQu6itJ5kVSr8RBOzuXW2ZGyLKFd9WtDs58FELDZnN3Z7lhRD2K2qJ4UaRs0lu-4NiQUlbVfdm1OEK2ogHvtJ1SPSe6CGRbYdwHFBdSjHKg', 'Android', '4935570f938c4c82', '2018-08-06 05:49:07', '2018-08-06 05:49:07'),
(207, 1, 5, 'ewWBsaNzDtM:APA91bFxbsuSW27ewiLAYBeMaheAbl4-ZsNyiGiXj4N4MYjVhWeU-2PHCLQIOp7mDMbJMBtaLeH5x07-Y6QnfdCcdHXBt4cuoTuLr_-I0XmHaEi-bDaEd98V12OfJpGRM2DtxGOUTPCbJqHb5zcHwR6z6wfSChOKYg', 'Android', 'decf424ac92992c6', '2018-08-06 06:06:47', '2018-08-06 06:06:47'),
(209, 164, 2, 'ctnNmWf_ypI:APA91bHCePnfd7AmmK0Qp-165z3D6OqrECo74Rs5nwl84vyAno45kFZWqdqVHvojpliqR5A6RJJtCC_XjwFB1Si2yTi16Y4P4h8LlsKRPbYga96mJmJtkzJNd8rKzTQwiFDehdVLIkHItdt16ILVV2PjdgCzrQBgDg', 'Android', 'faff7f6c5d8c94c', '2018-08-06 07:02:28', '2018-08-06 07:02:28'),
(210, 151, 5, 'eA61bPfM138:APA91bFkrczRk6zidmNL8qRAz5nQ8vAfq1cwzS6WEX0ojApN2e7Okj4RZuImLnOFNuOf3cDryRZ8gx8z8TgnIbSRQ_CPOR9aDwElhjtydff38pG7L4cGDv0vsKcCk1myYvStBDL83t6Qd8FPKau6uXChklhSk209Vw', 'Android', 'c338d87dd9ce16b7', '2018-08-06 07:03:59', '2018-08-06 07:03:59'),
(212, 168, 5, 'enFFo8fQt9E:APA91bE9GFGgREz5dK_vVo2h6q4Csk431TzoEnFA3mBv5e85P3lXV2qCg0Svj6Crv_88q2eKLlzCM_6rK6guJq6NtPoiVbWrVQAjm_aCrif9aiJNnZjI-FsdE4b1igkrVsL6esoBxBrnoV2AQ6bIJ2D9jfNbqvXNPA', 'Android', 'f0b49b6a6811afe0', '2018-08-06 18:39:21', '2018-08-06 18:39:21'),
(214, 232, 2, 'fqLZp_mM0Kk:APA91bGBgXCeu0slWxgkvH3EFwGkgmr7LVYejhVHnwv2Md8LYYyEL-dRL0AmYwZ-JNRSx3y2LDV18K3axDi5XROS4Ta3uAJRmvMLtZMSC0TLW5PP4DijP7Sf1Wx3w_aYU5OU73gl3kdiXQ7KMPNNRrxz_7-Nghe3BA', 'Android', '28734780bea2b9dd', '2018-08-07 03:03:47', '2018-08-07 03:03:47'),
(215, 1, 5, 'fiaU5BniS_g:APA91bGeMiWED7Z9bPviBts2cAchyhog77un6dTvyGkC_KM0r_UuHN-nyNpw4AwXXnyduNWnzCodZFod6ovrV_EPR6DqAAm5kXy6frkJtgoAWxCwJ57vmcmOU-eqVApQGwWpIIS_7gy02qBSWduoljIU--V5ABdSIQ', 'Android', 'd77af0e7424c45e1', '2018-08-07 04:30:19', '2018-08-07 04:30:19'),
(216, 235, 2, 'f50_7cBjYfI:APA91bHR2WDExk7_oZDK0up9gctwHBlfiY2hWRH8QvWZDLj7tduVqGkzIsq9V5LKcfDg97VlJVSURtwSf4WNkLF1kmcrxRPH-6Cqn_aLiteAVKn5gohEgMWOUml4P5ZPa1xlxtEBkSL44eNlWppcyXN8jV9yHsJ1OA', 'Android', '1d178f42c8d019d2', '2018-08-07 05:34:33', '2018-08-07 05:34:33'),
(217, 33, 5, 'dxEtsDAwz08:APA91bE7VHEuTXfsiVA7M2MLG0-pliNfqxpy5qdNcZzCw1Zy9VuUXdI-lAmjfp7-RNDiVPmjm4old-kfeafJOMYA6AufKcwPqgqnY3qjL5zipPMdvKeT9KEz_q3dmj6-7HoTtedhzhpUjaynK6INFupSL7M9yB6vnw', 'Android', '122dae8267c44a82', '2018-08-07 20:22:18', '2018-08-07 20:22:18'),
(218, 238, 2, 'ffWryYpDPc0:APA91bGK8JdQZxHEzkWY7ikeuhqgwPuH69jtdiA3OLErt4ADVtHHWP21hvEUi4L0O3letW28NLJyXl0GWrkIp3icrPJteIsw-MaSXLJ4I2_9vpoCvPuucrFKvlGuFCUpRuyDXmWBcf_yDNagr_70mGLEQJp1kVZf6A', 'Android', '7428666b9b808d73', '2018-08-08 00:14:17', '2018-08-08 00:14:17'),
(219, 216, 5, 'duhaEih8txY:APA91bFkW1NrwnTYSumSEuX6Lv_sR43HfAbj2--4HYDZU18XXS0MoArxXT152yziD3it32_iAHZFegt4n3b9Wi5py8mR1yR6nR-Epanf8dRIzCEvbnnFEo7WFmxX1FBViN9wepahmv07Fb5iEk2yAJRKsVLQ6q8HcQ', 'Android', '7725efe61fc494b6', '2018-08-08 03:26:04', '2018-08-08 03:26:04'),
(220, 239, 2, 'e7eoc-n1lGA:APA91bEvpL-R5E1MHTBzdfaAXGDryuzYRLgTU5G9n1emgoYIQad_57VmZRUMZWGpNSXQVcEoIp5FstSLcpXZAuzRgYZBcVPQbNk2msrUkGkc3iZUFV1EXNO7sL6XEA44W5KLAn0z1OyUKDXhS5DD8owMGyWXVe3vvQ', 'Android', 'a188090ab01aeff', '2018-08-08 03:35:39', '2018-08-08 03:35:39'),
(222, 72, 2, 'ez8h-Kradlc:APA91bHRhs48Vc5q-3m-INVLBHLuSkorDYW_mDc4-VhFIKvGsTWqZY6xGHXPMNNnf1ppNhJ-TbcjoQI-HNz6kqX3IMeEYEsOTHUwYIOGI8-lXTsV4mSJe6nVHYWlyXLCSb0CC8qJv27PcHH30YYmEgbE-JEQIUnnFA', 'Android', '3d18f5df9df9d862', '2018-08-08 04:21:15', '2018-08-08 04:21:15'),
(223, 1, 5, 'cml7CfKDy_4:APA91bHvlfDS_LghJNiF3VRqB4BzyaWQzU51nMLCFBKYbV7AFmfEzBmUoVxhqz7siz_vBq3zKOlp4Xmc1wKFB83cSHwPSz3uSw49vHK4pOX8l2hyyw1C17CR-Wo6_pe8mPu6qgCg4tv1xAtf8zqFu2CZJUnjCw0d5g', 'Android', '4250d63f722da399', '2018-08-08 04:22:17', '2018-08-08 04:22:17'),
(224, 1, 5, 'ePCE-Gslyys:APA91bHiR9uM8iAuaIdH_rcmYmKHarGL_7wSRxexBEGHJGLPbxMRTyqwgURfD-AzSUZRlfRdHtpjhgJzUSSgPrumZ8hdYIoPgPsDxNsjtPxsbFekKgkCZQCF5b7_2jTohRYbvXcggPn_Ah8EDkn8S1PHztqNqhu3bQ', 'Android', '2b84f2463c05f2c2', '2018-08-08 04:23:34', '2018-08-08 04:23:34'),
(225, 240, 2, 'cdI-KQd86wI:APA91bHNeXl6tThu78-vrhNtdCgCyhW--66B7tDXRz8R2iv3H-goQ7oWnSMexripsKIrV1TPLYN60OOn-gtXvxirT3XlAZ-mqkdH2bDl9sYP54UOMaPYa8n4x7EU9jC7TDLhNc8tCGID687AtFWb-VXVL_4Wp9Qocg', 'Android', 'a188090ab01aeff', '2018-08-08 04:28:43', '2018-08-08 04:28:43'),
(226, 1, 5, 'f2Y8A3QbScs:APA91bEW307X611e6ZvZWHPGdqFNVhSG9LV2BpIpWdPgUyb2mnk-RgrBR5NsyCbDDmyxt75ukVNoEI26reSU1i-FI8eesGxLNjNRitllUZNSM9gNaPWNfhU89DPGYuhvqDDIvkIjflQWWgtdTyNSlfSUkO_gAyiCtA', 'Android', '4250d63f722da399', '2018-08-08 04:43:16', '2018-08-08 04:43:16'),
(229, 242, 2, 'fUM3IVCBkqQ:APA91bFAn1Wog1ACwRfoeCJEtWvw8TX3kX6NBr16Cf2rteH67xdUi5J8MijjW4PJwyuns66dJWASsSSu8gFy9Z9xiS17ys-MDPaci7LvgcTPkg3p5PNrFLdvBQcZTNUR6GLRNyeawGpI-qadsFwHsNiKB2bBve9jzg', 'Android', 'f0b49b6a6811afe0', '2018-08-08 05:53:21', '2018-08-08 05:53:21'),
(231, 134, 5, 'erdkPBVWb48:APA91bE4tWKLNHmrGmiJDN0eupvjURoTK1LfVfld5xNXYvbZVsae8b5kG2JXUKS_SWZkn3s_6vLrZnBwQoydZQyqc4gEevKxPHSBqAtgoapv9MFrIciutbyk6a1dV02xO9x-F3Q_mmebLMLi2ZamkVpDkYa6MOs3nA', 'Android', '2567f6bf490c187e', '2018-08-08 06:12:42', '2018-08-08 06:12:42'),
(232, 234, 5, 'fKm8SIoOhKw:APA91bG7F0N5KXAQrhIowyLmTB6RwmAl5IjZdmgX500K_rhwhQ-y3_Wqqb4_NviFHGSBOna_RNCX2ET5Uh0aCGSIpRuxk_TAy9GhretythmGQkzqSGbYi7iYil_2uwRD6XNmDBAGcCRmR15UohUiGVcsaXvxDlJrYg', 'Android', 'd9814f1c0cda26b7', '2018-08-08 06:45:44', '2018-08-08 06:45:44'),
(233, 233, 5, 'c8lTwh126ps:APA91bHgPjYYmAQP-CUhb1FuociUiCndRFwgXdd2ylgiifcDsrsJ9QLuc6HhBF4u5OK2SdcxWv0nch9w82DOrtXdGwg5TGO2qZFgyStZcIVjP-g7MTWZbxApAmoaAH0nc8Q2RyNn1t3nG8H7Gp0-N2dIegFEueLvKg', 'Android', '184c7c0daf32a6fd', '2018-08-08 08:10:16', '2018-08-08 08:10:16'),
(234, 247, 2, 'fU-N1mnMkX8:APA91bFcZKEqUjeZImy2Ixed2fBRCWC_SHeryRQ1WONazkNzlnCzr8ANThRzKxfkS7FPO1L3vb3fqO09qr4HACACj2fkHlgxWIABC0guQ-G5HKAqzyeP6ONbyehEddvnI25_gv7RDUjp9O0JfvQqIZCUg2WYnnJIUw', 'Android', 'a5e0698c27fc8e38', '2018-08-08 09:28:43', '2018-08-08 09:28:43'),
(235, 248, 2, 'dfDtbzhF2VY:APA91bH3OwYl6Z7Mi94sVkQunkceFtIhjE3yxKRmprp_eBVksYto0FTpCiNrGmP295RyFKcZGVlaOnKYM806ioePPfBnWzpIB3emgjXPd9O5QZoCowG7YkA1CtvDYfFfD481j_w5qq24a6IbnyS-Ye4G6KBgrp4cYw', 'Android', '660db0635ce5ddbb', '2018-08-08 09:32:27', '2018-08-08 09:32:27'),
(236, 1, 5, 'dKCxTHKr5iw:APA91bGDEJdxMj6YDm__D204DvyzeUPxrPxKqe82HGrnppbACXumDAB9yejlSJPt0Q4nwXtYNO_n2bcx39VS7Gg9VlsTOazqVV6phH_NxPY-fRHzgvUXwVfm_VythvvcGtZhUTFWKInmptQSNs57ZWIm_wmZT_gWNg', 'Android', '8c74342f80b0da7d', '2018-08-08 10:21:13', '2018-08-08 10:21:13'),
(237, 214, 5, 'eGyyBAgljDI:APA91bF5rsocfwZDfnCaNT-dSKCsOzETJ0gRpqjltM0r6KWApFFBAokUHsurSKMimYeJAV5qi6LiTKq4Bat9Nh8_dG9R23yNqLrqyYD7Orh0nP95Wa5wmHlDvVTe18ZUePWtyFtRVmbfxYDekg6WdxsGaACrmaNM9w', 'Android', '28d85a7a57f7dd', '2018-08-08 17:03:40', '2018-08-08 17:03:40'),
(238, 249, 2, 'fZN0z7Dt7iY:APA91bG2Zs9O_QNQUmuDNQ8lnC-EYdt_zRLlTPHUGwaXfZ2Pe14gpOAS4vqKElsDvx2-nTUzXkAJhFq8H-WZEeCzGghi3v5pn97-cwtb-23147FRJtwEd1NQ1pNY8puLRbY6trXm7HWTfsZSz_cC68xDSlGtU9r25A', 'Android', '184c7c0daf32a6fd', '2018-08-08 17:32:29', '2018-08-08 17:32:29'),
(239, 250, 2, 'e_WdcqAn9EQ:APA91bHceacb5wzC5cO5G0v_9C0umwR55sUbhnHsILxK6GsDbZOj6wC5kP89SNi5EfoqS64zKuU5ADXGrFrxTv1jMgxdvFZcQIMwZGa6D6-stJgAm20gIDjIxYi1BlXcWezuxo4kU7sMRIveanmohtbyG5Jz4cWUDA', 'Android', '28d85a7a57f7dd', '2018-08-08 17:37:46', '2018-08-08 17:37:46'),
(240, 158, 2, 'd2gdE0zZbcI:APA91bHxnEYIe1bsocmQp9mFw3LGtiu2aMYv2Ra14CMvmJ1dz2_maoR7-jJa0TE2357VSORIqxGwJ37rAipe6plzuS4p3oKvbOVffeeXdiVRRIrdiQFAHkw9hOg4aPTq2bNtY1pa8lWMerhPaJqmF6FmMmbn_MMj8Q', 'Android', '8100a86b87fcdc68', '2018-08-08 17:39:17', '2018-08-08 17:39:17'),
(241, 229, 5, 'eSw1J1tdcYg:APA91bGl6z3HE1FSuGJsCm3bz9aWxpVaWmFwhnAlWgQ5DcFjs8DpFxrGyC3QjMILKKo4Px_8hIMEsVOuMXl3RLinnKExZMbMDUeR0IeWh3AABQborw0H50ARqFPIPNcggQP4H6zCOeK37VfJy7QBAfRwQppY09pwmg', 'Android', 'b87d49eecd69f828', '2018-08-08 18:04:37', '2018-08-08 18:04:37'),
(242, 251, 2, 'eWX5WPBv-ps:APA91bEYLMQhm7b_TCdpvx39K-1YiCfNABRw_vIjqOOIXetnu3urX_qFCCUJLF3kamc-q61i7ZG4KbnRQdLkrZuCltcF6kGL6X80jDQd2XmfeHG6aYWSg-8U4psmnEiaRFKFooTUWGKM9I6abyUvk6K-PIrb_DkbXQ', 'Android', 'b87d49eecd69f828', '2018-08-08 18:11:13', '2018-08-08 18:11:13'),
(245, 253, 2, 'eQ4qQ3vRD_4:APA91bHuiL0vx8edVBUdmOpfhWBhYuzUuqIRb9SU433kngc2-V_G8pISaOD7jjw1B1GWtBrjV8vMAPz-vWdwLucIJFGNlBpy0C7gQxWEH4bNlZlWQgAIqkajZRFmQnM3wPq73IWVUnXuzqW77hW-lXT7-cOn4Uzdtw', 'Android', '2ce9466c4ae848d4', '2018-08-08 18:24:08', '2018-08-08 18:24:08'),
(246, 254, 2, 'fkPgsCuT_c4:APA91bHiL8FZpL1gQIU0QpaPTC1WE_JkPp7jRkQtVO_qxknaJaA7207p2-A_v8tQvC-69u2_6WsJ5-dCWKpxUdHN-kGJAowsTNcIYp59VFU9EYJ46x_u9XqGEbjqh8vuq_UhuVXZr-6zhDvcas-cV8_AHkyvT3fEKw', 'Android', '261c6cbb8f44b514', '2018-08-08 18:26:55', '2018-08-08 18:26:55'),
(249, 255, 5, 'f-RMI_mbOqo:APA91bHgENiSWHzTRPglS97Jas38dn8hpEEdLqhwvxbKMw6X0rId8eUwumJ8xk4662Px6aPB8DLP0864vWP6A1glQHLS_At3ajiBM3-lUYKoN7y6tTg_2YZkupIecs9Vd7qnJdqMKeRJh13iXOw8Q_i5QnR1lu8Imw', 'Android', '21bf410621d3dbcc', '2018-08-08 18:50:53', '2018-08-08 18:50:53'),
(250, 256, 2, 'd9A7qTaXMhw:APA91bG67KmvK5O9VXv0APmr1F36_2EbgxTTJmV4pzTifZxPw6wenCjmprVX6-5bUA2QXFsvJPkGp1f7TkNR2punO_2TIw7-hDdS0YOdPt-3JYCFxrqZN4zGqP4rIBjYCs0rUcMwv4D68Stary0hdX5JH5NcqMDCcQ', 'Android', '21bf410621d3dbcc', '2018-08-08 18:57:28', '2018-08-08 18:57:28'),
(251, 257, 2, 'dZKJmtr_GAA:APA91bFfBRMIo_sJpgrrZCX3f6892V3SRqEjuyYbHugdRLXzYcQfUaOc6iZaauRTVkrOdaRKL8nF8g8yWHE-VPsCbkjJW2MSesyfdcSj2mkKH6yI3t5qru-w2M8IAdhJJr3tcKta97ipepHJsLyXyS-y-EMlOfPVdw', 'Android', '122dae8267c44a82', '2018-08-08 20:02:43', '2018-08-08 20:02:43'),
(253, 259, 2, 'cWWowhIPF1g:APA91bHrgJvmQ6JM3fJwA29ffT6f6klp66ZdypEMPJc_ssFMjUU1JdHl6KrOtW2OtYDB-QRUWYtz6dCBQhn04taqJMN2nF266vpm6alk65oHsCq2nz1HPUHFUjxOYwrTeQAMhHhvYXAuOcy-9NHfPskn7xxingjeJg', 'Android', 'f657550518b3adc1', '2018-08-08 20:27:27', '2018-08-08 20:27:27'),
(254, 258, 5, 'e8QYmLxvzBk:APA91bF9F0Ffqy5jR-67z5j2UrgrKDmg5PiCFhTIPuGfQu13umWMfj5aSL0viYvpG2XUcG3vzH45M4jamXjJ-oO6pl55L7jhg53C4pIqMGwRBmTj7VXArCCyxK4Cgi1yEOb6riZ6brwP8d2PtpSpRB4wU069NeGw2w', 'Android', 'f657550518b3adc1', '2018-08-08 21:15:17', '2018-08-08 21:15:17'),
(255, 198, 5, 'fyIUQECaoDM:APA91bHu7OZ7wCoKUiY7DfvkcauO4g6nNP55H9ccTNRnR3iekpRlaz6ODiq1uKX6v6uT1LbUhefkcWt-z4I4R4KeLEMBC8XtgPgRq8ulM51f9QperH6LgV0KOcpbqhpqBxHVBsJezaa1rRZxNIH3iz0NPd2LaltAZA', 'Android', '8100a86b87fcdc68', '2018-08-08 21:50:58', '2018-08-08 21:50:58'),
(256, 211, 5, 'faD479smMHY:APA91bFZIwgWaAlduc50GdPWI65xTMJMxx4-hxJLd4nhHhnnptIhubKUVK95c0UXCo_17l8KrkbFj_iWpja6p9LN2hD4pDXuO1do89A7IF0AeGr-TkhUr4WjN8SBXDNn9kf-qC5oYzI1LjE8XBryTpHavkbb_2AqPg', 'Android', '3f784dbc9fb1fb5b', '2018-08-08 21:53:14', '2018-08-08 21:53:14'),
(257, 261, 2, 'dH_ViZjhtxI:APA91bGwMk5olf1hIVl5nKLwAZEYkA44RLOW69Ui5eXfhRIeyWUoo9jGaDxWuNARnXHxhOkvgfh0-8CCr_ysZy5HnDR9l-7KQsPF3iyEJUXymBo_kxiqoWxyVr_EcDuhQSTePOLQ9ZXAv-k6yBjcRfs2suipGQ56Gg', 'Android', '3f784dbc9fb1fb5b', '2018-08-08 21:58:22', '2018-08-08 21:58:22'),
(258, 262, 5, 'dWojSRgdh08:APA91bFB7WSrEMHZFLbAsN1wTxgQQ4bCvQUm4Hwajt-QvPzIvPBibrloTqhoQhDBsJIxGi7qv0Ik8K3lAZDEiggeA9s5vcJcneFJXUvqx6VWTiRFnA93L_wzwO76YILTc751kSRZxBaROTYlCUyQOQBtwMn5Jxog4g', 'Android', 'e2d9e731cd31cda2', '2018-08-08 23:13:27', '2018-08-08 23:13:27'),
(259, 264, 2, 'ef8V4grkodE:APA91bGwUu_urllayyZj2rBqqAWPXAZtcY1BQx0bI2sxBq1IjzKS8LNgrDbIzQqYWLVLSVWggygQEGQ3vYQgxb4A-H-XVcBuhWkDvBTNrOWmyYVi9WLjAGqB3mLq51UWLTDzkDF-OHS-uX_luaj5Y0kdeN0RJLo1FQ', 'Android', '30a4bd533aee5979', '2018-08-09 00:11:13', '2018-08-09 00:11:13'),
(260, 167, 5, 'ckeYlbcvFDA:APA91bFry-8Zfi2wbGQ8_kvWPxhwUYxKGskn3d0-rUwN4M_5TR5DqZ12rRe0ChOc2L32SfeHNiul2Q4m9VlWgoUw0IUJKCj9o1lHyIOFOG1TRgcquG_oE5TRUzvMYmWTHcsNw5c5sJVwdxrB5ncRkXRKnqx0xWVc0w', 'Android', '3f5f8f08bac31639', '2018-08-09 00:49:37', '2018-08-09 00:49:37'),
(262, 244, 5, 'cgBjhSpQhg0:APA91bGbm4LPv2vM9RdPCnGFuEEdH4ltiMVIIzdneukEHVUBOH3AQdW5vb74vQ4rZAUxPxcG7M-dDQq5WwfOkt0S716eBxyMuXyX4VD035w2IlS7W4WnoLUEN-ATYqB1SatstfjaRSe4HDXtin6Xqczg0pwWTBb3lQ', 'Android', '28658b63499bad1d', '2018-08-09 00:54:31', '2018-08-09 00:54:31'),
(263, 265, 2, 'f4g6Oh8VwrQ:APA91bETvQ86xzsvcKxVDOQ7T_Xj6V4qVBubD5WMLMoOlxsggR9WDZlWTIpTMsPObpMLt3rhF8XX48esgl9nqEe9B0S0PepOECtMu1B3zUfyVoI_LG44i9q4oEm9CywCeucTRVNpPo_6xYlG8PDVWsdI5c-qytH5Dw', 'Android', '11358cf7a3f53918', '2018-08-09 01:00:44', '2018-08-09 01:00:44'),
(264, 272, 2, 'dqKmfE02fVE:APA91bHEkth2TEWqF39C8RonCByiOZwm9OKwwjN88bzlNfBdKoWAyVmr9KvE0OJ3X9zE0cgBem-iUe6g8TMFPEpuzPVe8URMw1aRjmSFaDiqvW7VvTC7Nnx8WpIgRyHZGss5uQ0awqNMZdyaPmLygzhYBZ9QR52adQ', 'Android', '774c3313170cb120', '2018-08-09 04:01:27', '2018-08-09 04:01:27'),
(265, 254, 2, 'cgpETvrkR2E:APA91bEhkaPBum4-z6T2vGcNxJ1eJ5CHmGhk2blBXBNlmbunO8JXDvINnjMyAxPhgBXkBQwe4HrW-lgVyqyFr1RQiiZpoOytFMo5SwXe0nfZn7-C7Ms5Y_n7ozqrIysEeAtk0BhQErEQnqwTRyz9LCH1qekG6RRGxQ', 'Android', '4a055be76bd40ded', '2018-08-09 04:51:03', '2018-08-09 04:51:03'),
(266, 231, 2, 'fNyKOnGrZxM:APA91bHYh9ZgOuwWXgXu_lZNMRud3ua6iaeQ4PJA7OCmUgWFdtkFA_Bs-av7H_JKT1MT4LoI8Qy3G6lz0QmE0jjNgN4rc6BaJzKDQaNJWhiT8_dwGpueNS4DktrL5O5smLVZ4DqXbj5E0UyEESmW2Zt2ag-eKq6WlA', 'Android', '9c1578ab45c8d671', '2018-08-09 07:17:06', '2018-08-09 07:17:06'),
(267, 250, 2, 'eQivY3q1uUI:APA91bEZvoLLyGqYnKURrILLcJw7tyYlUfTCgXe0EJ8uW4tBj0Ow1xUrRDzF5hHI1RBEKBiAbtIFZCXbmOGlNZzFf8MfS_GlAc5kQZDI4T6NA9UYYahAt3vfQJMvwGIkoCOt3jjJp0B7IwPbfFyhd9K2LOx8pealrQ', 'Android', '2be54891611ea4cd', '2018-08-09 08:27:19', '2018-08-09 08:27:19'),
(268, 214, 5, 'cI5Kabs965g:APA91bHPKFIVRlIEM5gIAwaRNZHKRID9dE5AmPzfr_PEAIUNLZxGCipY8VSy_UuX4YclIjEYLwLlAXPfM7SjNpdE3q6-6euFKBy4SlhV9mojwC0a-0QxIeMqSMjNtIFApsnwLWR_edA6Ettd8IvmXKB1buOtQc2PCg', 'Android', '2be54891611ea4cd', '2018-08-09 08:55:26', '2018-08-09 08:55:26'),
(269, 252, 5, 'f01Jafg4awg:APA91bEr8q80IZ73oRavYLVWQsgH8Um8VYWpzPIm1l-gjxVpEIEFrGiEhkcNvAEUEPfSuyXo4a6TjTJ1xw_c38V_JFKgbbHxfGiQoA8j_Sw1XtxzBlalOdnmiddAls46Tegerg6OcvkKyPWqVZ2cUhPAL6jd2zla5A', 'Android', '261c6cbb8f44b514', '2018-08-09 17:35:11', '2018-08-09 17:35:11'),
(271, 206, 5, 'dzNnhXctYW0:APA91bHXW_jjsu918PRFvMKQmHdYthiqQ3C6_oaYYll0Ua0Fyb7_gdApdcIKpmNRSC5I_lerXE7pZKbQQYqOG_a5vni8oSfjN1vGU0t7qeqO9rhVwfIt0BKQhlyr_ka4jBjleQQvAPWjTkc9tojyd0P56I_Md3Jztw', 'Android', '57bc4ca1982b632b', '2018-08-09 17:52:52', '2018-08-09 17:52:52'),
(272, 279, 2, 'efe9MSlUNc8:APA91bFkDyqDbhhKBjIpO3uRdWH45ZvjHm2fcI2MKF5zX0HZSoTMKYPCEyQZ4vjREa95GH5aVORZsAdM6znYlJGs2xVinLUV_KsGeuXaErXk4HPDhCKDQYpbyFIZlFv7eAN9U8pBRZK468cdfj8OpNwdF33A-1gTkw', 'Android', 'a95b7b91f0d519c9', '2018-08-09 19:07:04', '2018-08-09 19:07:04'),
(273, 280, 2, 'eNzqTkD8zRk:APA91bGO3oCGuTU3m6pcWbsh3eNnyvIccEZUzYo3lMwfnxUrEk6Bg922U6-JUZAxqbAUEAcgA03RM7MM8xrd_fmo4_lqQmZE66g43xCTqbL81buBSQyfYCuMWa7eEEKnO5xVx6wr_t3_uHAqcxKkFc1PTmlQtKSg6Q', 'Android', '729a29b9ac9983e1', '2018-08-09 19:20:33', '2018-08-09 19:20:33'),
(274, 283, 2, 'ci5hJfpd29E:APA91bGJA87jTKAMpRF7LmXytxX1w0pVDBbG2MeeVm8tyuUcDELxS4ebDX7ktjN8kOkWS-DmC32ak6m4fLRZt1Ggdn0b-wVsmfksi_PplXnw2TUhRdey8TEmbeoRaeNjoeEkNokY6r_LiQwl7jXBu4aQnQV07rspyg', 'Android', '870d1844ec58bc95', '2018-08-09 21:45:28', '2018-08-09 21:45:28'),
(275, 281, 2, 'fu_QOyoQzJg:APA91bFaXjTZGvhrgxmVp5CCroHeEScHfXfCCa4jNqpcWcORxiO22571hR-oWOex6XnjpB8jkMq_JOSUKZdjRSxi7EXgEBqTCb2i1qE3Qz6AfiEEDc16a_QJ2HUv-DzEor7nCYmHBqgvx-1h2N4411D2Tq4zuB7LLw', 'Android', '4a58bf10fbfb8d8b', '2018-08-09 21:50:40', '2018-08-09 21:50:40'),
(277, 208, 5, 'eYy13S5aIbI:APA91bFvCkWgU6Ay7nfFkldy-GQDu8W7DwlXzBIHp5ZBx1q7qTDRR8hqhP5ULaoZW-aZaMCR82SuUxQNJ7nMN1gOQHAChanOLJY9u2zJjRndD9gceFvnslmJrpkUZ2kjA7DnODxDrbcxXnhqk0zQenSurGno45CGdQ', 'Android', 'ddd4c2d94cff5afd', '2018-08-09 22:57:08', '2018-08-09 22:57:08'),
(280, 1, 5, 'd0HzK8NOWaw:APA91bHFi3RhF4yHxBPdtZVmSWjEnVHOtviTn2K9rVZcxD9NxOj1f_2RRmkt2jOxtrefMXPPtS6G3i7iInr9tYCXWAdhMNfNiqstZUPr6n_zYC5748gi9qTpCi5wMmMSSHfreScX2eND8oAGwDY_Aq4dajnMlPibVA', 'Android', '2d41490ebcb69472', '2018-08-10 00:15:16', '2018-08-10 00:15:16'),
(281, 284, 2, 'eJMq1hJw5qo:APA91bH0ix7MCdRDnFSVISDFCxx7X65MQorew0x1u5XVQIDnPTdFRgPoGkLWUebFkfMinoYMGBsJj_0FPAJ9PwvXN68i3i3tRvXkl1K8kzWx1IxtKNEg-cK9xyH5mKnOTCUawX_svywF9kIUDIybhjlfrG3IN8w7gA', 'Android', '4e53d8c1cbacf727', '2018-08-10 01:19:15', '2018-08-10 01:19:15'),
(282, 213, 5, 'f4tE8103Hc8:APA91bHzg4wG67QLQAlw3x-xDV_aMI16SF0YdCXVoqf5EycGJd4d0TGjgablVDPzH-UCpkdhOxZCeEKKTagwObuZ0fYclKrOBk6CpX0oPOBPQBEFRQUaNIx6U8sLLiQxZ4xAgz-HoAt3t9CRCIMwbVNBZVf08sOY3g', 'Android', '20c56c1c033a64d7', '2018-08-10 02:36:52', '2018-08-10 02:36:52'),
(283, 286, 2, 'fusnZgOZAo8:APA91bGPiIi8jupHdIb2O-Vrmw0SLgQVdXhozOWTBHceDKDgPxu8hRPHhJ831FB3vbHu2eo1tcl0Oy38oYWbaLZaQPgV4bagvjH2n-BgzBCvX_-aPdRElU234keC6F67YpIaZHr8xAdx5j5NTlrMpZYjgHe8T5sGQA', 'Android', '846acd828977430d', '2018-08-10 03:28:31', '2018-08-10 03:28:31'),
(284, 241, 5, 'dcuuxnZ_Hy4:APA91bFhkzRj26NFkJl5WieYDeR11gksU4h4L7y52i5AfJOVorzO3_wOUJeKSgeal4uawszXpSgnv8djHeG1WpRgtEyGD7bO0z_bxQDSreSEQaKSm7a2QT637BVcR5vsL48Kt1e62tpYJx5OC0xeof6BMeJZlSNaRQ', 'Android', '2ce9466c4ae848d4', '2018-08-10 03:30:20', '2018-08-10 03:30:20');

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
(230, '201807303173', 33, 44400, 0, 0, 44400, 'sembako', 9, 'cash', NULL, '2018-07-30 05:59:29', '2018-08-03 22:18:05'),
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
(252, '20180802B313', 33, 15350, 0, 0, 15350, 'sembako', 9, 'cash', NULL, '2018-08-02 03:56:17', '2018-08-02 03:57:02'),
(253, '20180803AF91', 33, 16850, 0, 0, 16850, 'sembako', 9, 'cash', NULL, '2018-08-03 03:51:22', '2018-08-03 22:18:05'),
(255, '20180804C091', 47, 126000, 0, 0, 126000, 'sembako', 2, 'cash', 1, '2018-08-03 21:50:42', '2018-08-03 22:19:44'),
(256, '201808069D24', 1, 64000, 0, 0, 64000, 'sembako', 7, 'cash', NULL, '2018-08-05 20:10:07', '2018-08-05 20:10:11'),
(257, '201808060D3F', 1, 56350, 0, 0, 56350, 'sembako', 7, 'cash', NULL, '2018-08-05 22:20:56', '2018-08-05 22:21:01'),
(258, '201808068FA3', 1, 26150, 0, 0, 26150, 'sembako', 7, 'cash', NULL, '2018-08-05 22:24:01', '2018-08-05 22:24:05'),
(259, '20180806A684', 1, 13700, 0, 0, 13700, 'sembako', 7, 'cash', NULL, '2018-08-05 23:39:24', '2018-08-05 23:39:28'),
(260, '2018080655B0', 1, 23850, 0, 0, 23850, 'sembako', 7, 'cash', NULL, '2018-08-06 00:02:56', '2018-08-06 00:03:13'),
(261, '20180806CB9F', 1, 27700, 0, 0, 27700, 'sembako', 7, 'cash', NULL, '2018-08-06 03:15:46', '2018-08-06 03:16:08'),
(262, '2018080726E6', 1, 23850, 0, 0, 23850, 'sembako', 9, 'cash', NULL, '2018-08-06 19:25:03', '2018-08-06 20:28:12'),
(263, '20180807429D', 1, 12400, 0, 0, 12400, 'sembako', 9, 'cash', NULL, '2018-08-06 20:12:05', '2018-08-06 20:28:12'),
(264, '20180807B682', 33, 36250, 0, 0, 36250, 'sembako', 9, 'cash', NULL, '2018-08-06 20:31:26', '2018-08-07 03:57:25'),
(265, '201808071E44', 33, 7350, 0, 0, 7350, 'sembako', 1, 'cash', NULL, '2018-08-07 00:55:18', '2018-08-07 00:55:18'),
(269, '2018080868C0', 33, 20550, 0, 0, 20550, 'sembako', 9, 'cash', NULL, '2018-08-08 00:32:45', '2018-08-08 03:51:09'),
(270, '201808081078', 33, 42200, 0, 0, 42200, 'sembako', 9, 'cash', NULL, '2018-08-08 02:46:03', '2018-08-08 03:51:09'),
(271, '201808090824', 33, 15050, 0, 0, 15050, 'sembako', 9, 'cash', NULL, '2018-08-08 19:33:18', '2018-08-09 03:55:27'),
(272, '20180809A11F', 47, 0, 0, 0, 0, 'sembako', 1, 'cash', NULL, '2018-08-09 00:03:55', '2018-08-09 00:03:55'),
(273, '20180809898A', 1, 45000, 0, 0, 45000, 'sembako', 7, 'cash', NULL, '2018-08-09 00:15:13', '2018-08-09 00:15:15'),
(274, '201808096A36', 33, 10000, 0, NULL, 10000, 'Topup', 9, 'cash', NULL, '2018-08-09 01:12:37', '2018-08-09 03:55:27'),
(275, '201808098D34', 257, 9600, 0, 0, 14600, 'sembako', 7, 'cash', 33, '2018-08-09 01:17:42', '2018-08-09 01:40:11'),
(276, '201808095B9C', 33, 5000, 0, NULL, 5000, 'Topup', 9, 'cash', NULL, '2018-08-09 01:25:25', '2018-08-09 03:55:27'),
(277, '201808098AAE', 33, 60000, 0, 0, 60000, 'sembako', 9, 'cash', NULL, '2018-08-09 01:29:25', '2018-08-09 03:55:27'),
(278, '2018080960A4', 33, 5000, 0, NULL, 5000, 'Topup', 9, 'cash', NULL, '2018-08-09 01:31:17', '2018-08-09 03:55:27'),
(279, '20180809A281', 164, 85750, 0, 0, 85750, 'sembako', 7, 'cash', 167, '2018-08-09 02:50:28', '2018-08-10 01:00:21'),
(280, '201808098BF6', 157, 6000, 0, 0, 11000, 'sembako', 7, 'cash', 167, '2018-08-09 03:19:08', '2018-08-10 01:00:28'),
(281, '201808107184', 161, 67900, 0, 0, 67900, 'sembako', 6, 'cash', 213, '2018-08-09 17:33:33', '2018-08-09 18:12:21'),
(282, '20180810F326', 250, 373900, 0, 0, 373900, 'sembako', 7, 'cash', 214, '2018-08-09 18:04:24', '2018-08-09 21:17:30'),
(283, '2018081088DE', 250, 126000, 0, 0, 126000, 'sembako', 7, 'cash', 214, '2018-08-09 20:15:37', '2018-08-10 01:29:28'),
(284, '20180810BF30', 281, 51250, 0, 0, 51250, 'sembako', 7, 'cash', 234, '2018-08-09 23:23:34', '2018-08-09 23:27:17'),
(285, '20180810E5FE', 135, 50250, 0, 0, 50250, 'sembako', 7, 'cash', 102, '2018-08-09 23:41:07', '2018-08-10 00:50:06'),
(286, '201808104B5B', 257, 496000, 0, 0, 496000, 'sembako', 7, 'cash', 33, '2018-08-09 23:46:43', '2018-08-09 23:52:42'),
(287, '20180810B460', 247, 103050, 0, 0, 103050, 'sembako', 2, 'cash', 89, '2018-08-09 23:52:11', '2018-08-10 01:46:06'),
(288, '201808103A6F', 120, 75150, 0, 0, 75150, 'sembako', 7, 'cash', 102, '2018-08-10 00:08:19', '2018-08-10 00:50:13'),
(289, '20180810C3E5', 164, 156400, 0, 0, 156400, 'sembako', 7, 'cash', 167, '2018-08-10 01:09:04', '2018-08-10 01:11:50'),
(290, '20180810EAAE', 33, 64000, 0, 0, 64000, 'sembako', 9, 'cash', NULL, '2018-08-10 02:29:37', '2018-08-10 04:01:58'),
(292, '201808103CE8', 249, 247200, 0, 0, 247200, 'sembako', 7, 'cash', 233, '2018-08-10 03:06:39', '2018-08-10 03:09:13'),
(293, '2018081002E8', 254, 50250, 0, 0, 50250, 'sembako', 2, 'cash', 252, '2018-08-10 04:15:18', '2018-08-10 04:18:37');

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
(188, 252, '', '', '', '', '', '', '', '2018-08-02 03:56:17', '2018-08-02 03:56:17'),
(189, 253, '', '', '', '', '', '', '', '2018-08-03 03:51:22', '2018-08-03 03:51:22'),
(190, 254, 'suryanto', '087654321', '', '-6.219302', '106.4989366', 'jl pelanggan setia', NULL, '2018-08-03 21:19:47', '2018-08-03 21:19:47'),
(191, 255, 'suryanto', '087654321', '', '-6.2059982', '106.51978699999995', 'jl pelanggan setia', 'Anter malam', '2018-08-03 21:50:42', '2018-08-03 21:50:42'),
(192, 256, '', '', '', '', '', '', '', '2018-08-05 20:10:07', '2018-08-05 20:10:07'),
(193, 257, '', '', '', '', '', '', '', '2018-08-05 22:20:56', '2018-08-05 22:20:56'),
(194, 258, '', '', '', '', '', '', '', '2018-08-05 22:24:01', '2018-08-05 22:24:01'),
(195, 259, '', '', '', '', '', '', '', '2018-08-05 23:39:24', '2018-08-05 23:39:24'),
(196, 260, '', '', '', '', '', '', '', '2018-08-06 00:02:56', '2018-08-06 00:02:56'),
(197, 261, '', '', '', '', '', '', '', '2018-08-06 03:15:47', '2018-08-06 03:15:47'),
(198, 262, '', '', '', '', '', '', '', '2018-08-06 19:25:03', '2018-08-06 19:25:03'),
(199, 263, '', '', '', '', '', '', '', '2018-08-06 20:12:05', '2018-08-06 20:12:05'),
(200, 264, '', '', '', '', '', '', '', '2018-08-06 20:31:26', '2018-08-06 20:31:26'),
(201, 265, '', '', '', '', '', '', '', '2018-08-07 00:55:18', '2018-08-07 00:55:18'),
(202, 266, 'ric', '087654321', '', '-6.216193', '106.501018', 'jl bawang beneran', 'oi', '2018-08-07 02:45:48', '2018-08-07 02:45:48'),
(203, 267, 'Ray Jack', '0899123456', '', '-6.2971525', '106.5701927', 'Jl. Cempaka raya no. 18', NULL, '2018-08-07 02:46:31', '2018-08-07 02:46:31'),
(204, 268, 'Ray Jack', '0899123456', '', '-6.2971525', '106.5701927', 'Jl. Cempaka raya no. 18', NULL, '2018-08-07 02:48:58', '2018-08-07 02:48:58'),
(205, 269, '', '', '', '', '', '', '', '2018-08-08 00:32:45', '2018-08-08 00:32:45'),
(206, 270, '', '', '', '', '', '', '', '2018-08-08 02:46:03', '2018-08-08 02:46:03'),
(207, 271, '', '', '', '', '', '', '', '2018-08-08 19:33:18', '2018-08-08 19:33:18'),
(208, 272, '', '', '', '', '', '', '', '2018-08-09 00:03:55', '2018-08-09 00:03:55'),
(209, 273, '', '', '', '', '', '', '', '2018-08-09 00:15:13', '2018-08-09 00:15:13'),
(210, 275, 'Subandono S.H', '085669699284', '', '-6.1089502', '106.1715839', 'Jl. Ciputat Indah blok A/13', NULL, '2018-08-09 01:17:42', '2018-08-09 01:17:42'),
(211, 277, '', '', '', '', '', '', '', '2018-08-09 01:29:25', '2018-08-09 01:29:25'),
(212, 279, 'Guntur', '083813883800', '', '-6.2164205', '106.5009377', 'Kp cadas ds rancagong', NULL, '2018-08-09 02:50:28', '2018-08-09 02:50:28'),
(213, 280, 'Supri', '087771979717', '', '-6.2164568', '106.5011289', 'Cikupa', 'Pesanan perdana saya, nanti kalo service nya oke saya pesan lebih banyak..\nMakasih', '2018-08-09 03:19:08', '2018-08-09 03:19:08'),
(214, 281, 'Ropik', '081292570713', '', '-6.2163115', '106.5008984', 'Desa bojong cikupa', 'Pickup Jam 19:00 wib', '2018-08-09 17:33:33', '2018-08-09 17:33:33'),
(215, 282, 'Mirnawati', '083870045193', '', '-6.1786143', '106.44967680000002', 'Tigaraksa', 'Pickup jam 19:00 wib', '2018-08-09 18:04:24', '2018-08-09 18:04:24'),
(216, 283, 'Mirnawati', '083870045193', '', '-6.1786143', '106.44967680000002', 'Tigaraksa', NULL, '2018-08-09 20:15:37', '2018-08-09 20:15:37'),
(217, 284, 'Tri sugiarti', '085775841707', '', '-6.1692966', '106.5364171', 'Kp talaga rt 03 rw 03 cikupa tangerang', NULL, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(218, 285, 'Saiful amin', '081319979308', '', '-6.1204066', '106.1660494', 'Sumu pecung', NULL, '2018-08-09 23:41:07', '2018-08-09 23:41:07'),
(219, 286, 'Subandono S.H', '085669699284', '', '-6.1089502', '106.1715839', 'Jl. Ciputat Indah blok A/13', NULL, '2018-08-09 23:46:43', '2018-08-09 23:46:43'),
(220, 287, 'Afan kurniawan', '081383840480', '', '-6.171509', '106.545506', 'Grya persada 1 blok A 4 NO 41', NULL, '2018-08-09 23:52:11', '2018-08-09 23:52:11'),
(221, 288, 'Vinka', '081220211201', '', '-6.1089664', '106.171635', 'Muncung', NULL, '2018-08-10 00:08:19', '2018-08-10 00:08:19'),
(222, 289, 'Guntur', '083813883800', '', '-6.2164205', '106.5009377', 'Kp cadas ds rancagong', NULL, '2018-08-10 01:09:04', '2018-08-10 01:09:04'),
(223, 290, '', '', '', '', '', '', '', '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(224, 291, 'Mirnawati', '083870045193', '', '-6.1786143', '106.44967680000002', 'Tigaraksa', NULL, '2018-08-10 02:39:33', '2018-08-10 02:39:33'),
(225, 292, 'Catur', '081911167905', '', '-6.261887499999999', '106.48374509999996', 'Cibadak', NULL, '2018-08-10 03:06:39', '2018-08-10 03:06:39'),
(226, 293, 'Kulsumawati', '081311802920', '', '-6.2167736', '106.52305419999993', 'Bojong cikupa', NULL, '2018-08-10 04:15:18', '2018-08-10 04:15:18');

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
(389, 252, 26, 1, 1, 15350, 14582.5, '2018-08-02 03:56:17', '2018-08-02 03:56:17'),
(390, 253, 39, 8, 1, 6850, 6507.5, '2018-08-03 03:51:22', '2018-08-03 03:51:22'),
(391, 253, 96, 8, 1, 5000, 4750, '2018-08-03 03:51:22', '2018-08-03 03:51:22'),
(392, 253, 94, 8, 1, 5000, 4750, '2018-08-03 03:51:22', '2018-08-03 03:51:22'),
(393, 254, 21, 1, 1, 7500, 7125, '2018-08-03 21:19:47', '2018-08-03 21:19:47'),
(394, 254, 14, 1, 1, 126000, 119700, '2018-08-03 21:19:47', '2018-08-03 21:19:47'),
(395, 255, 14, 1, 1, 126000, 119700, '2018-08-03 21:50:42', '2018-08-03 21:50:42'),
(396, 256, 13, 1, 1, 64000, 60800, '2018-08-05 20:10:07', '2018-08-05 20:10:07'),
(397, 257, 37, 8, 3, 7950, 7552.5, '2018-08-05 22:20:56', '2018-08-05 22:20:56'),
(398, 257, 40, 8, 3, 6500, 6175, '2018-08-05 22:20:56', '2018-08-05 22:20:56'),
(399, 257, 87, 8, 1, 13000, 12350, '2018-08-05 22:20:56', '2018-08-05 22:20:56'),
(400, 258, 134, 7, 3, 2300, 2185, '2018-08-05 22:24:01', '2018-08-05 22:24:01'),
(401, 258, 16, 8, 1, 12400, 11780, '2018-08-05 22:24:01', '2018-08-05 22:24:01'),
(402, 258, 18, 1, 1, 6850, 6507.5, '2018-08-05 22:24:01', '2018-08-05 22:24:01'),
(403, 259, 39, 8, 2, 6850, 6507.5, '2018-08-05 23:39:24', '2018-08-05 23:39:24'),
(404, 260, 37, 8, 3, 7950, 7552.5, '2018-08-06 00:02:56', '2018-08-06 00:02:56'),
(405, 261, 40, 8, 2, 6500, 6175, '2018-08-06 03:15:47', '2018-08-06 03:15:47'),
(406, 261, 132, 7, 6, 2450, 2327.5, '2018-08-06 03:15:47', '2018-08-06 03:15:47'),
(407, 262, 37, 8, 3, 7950, 7552.5, '2018-08-06 19:25:03', '2018-08-06 19:25:03'),
(408, 263, 16, 8, 1, 12400, 11780, '2018-08-06 20:12:05', '2018-08-06 20:12:05'),
(409, 264, 37, 8, 3, 7950, 7552.5, '2018-08-06 20:31:26', '2018-08-06 20:31:26'),
(410, 264, 16, 8, 1, 12400, 11780, '2018-08-06 20:31:26', '2018-08-06 20:31:26'),
(411, 265, 132, 7, 3, 2450, 2327.5, '2018-08-07 00:55:18', '2018-08-07 00:55:18'),
(412, 266, 19, 1, -3, 13550, 12872.5, '2018-08-07 02:45:48', '2018-08-07 02:45:48'),
(413, 266, 22, 1, 1, 14900, 14155, '2018-08-07 02:45:48', '2018-08-07 02:45:48'),
(414, 266, 24, 1, 1, 26700, 25365, '2018-08-07 02:45:48', '2018-08-07 02:45:48'),
(415, 266, 20, 1, 1, 27000, 25650, '2018-08-07 02:45:48', '2018-08-07 02:45:48'),
(416, 267, 24, 1, 1, 26700, 25365, '2018-08-07 02:46:31', '2018-08-07 02:46:31'),
(417, 268, 20, 1, 1, 27000, 25650, '2018-08-07 02:48:58', '2018-08-07 02:48:58'),
(418, 269, 39, 8, 3, 6850, 6507.5, '2018-08-08 00:32:45', '2018-08-08 00:32:45'),
(419, 270, 55, 3, 1, 7200, 6840, '2018-08-08 02:46:03', '2018-08-08 02:46:03'),
(420, 270, 35, 8, 4, 8750, 8312.5, '2018-08-08 02:46:03', '2018-08-08 02:46:03'),
(421, 271, 41, 8, 1, 8200, 7790, '2018-08-08 19:33:18', '2018-08-08 19:33:18'),
(422, 271, 39, 8, 1, 6850, 6507.5, '2018-08-08 19:33:18', '2018-08-08 19:33:18'),
(423, 273, 53, 3, 1, 45000, 42750, '2018-08-09 00:15:13', '2018-08-09 00:15:13'),
(424, 275, 138, 2, 8, 1200, 1140, '2018-08-09 01:17:42', '2018-08-09 01:17:42'),
(425, 277, 21, 1, 8, 7500, 7125, '2018-08-09 01:29:25', '2018-08-09 01:29:25'),
(426, 279, 91, 8, 1, 85750, 81462.5, '2018-08-09 02:50:28', '2018-08-09 02:50:28'),
(427, 280, 138, 2, 5, 1200, 1140, '2018-08-09 03:19:08', '2018-08-09 03:19:08'),
(428, 281, 36, 8, 1, 4900, 4655, '2018-08-09 17:33:33', '2018-08-09 17:33:33'),
(429, 281, 108, 7, 10, 6300, 5985, '2018-08-09 17:33:33', '2018-08-09 17:33:33'),
(430, 282, 14, 1, 2, 126000, 119700, '2018-08-09 18:04:24', '2018-08-09 18:04:24'),
(431, 282, 27, 1, 1, 29900, 28405, '2018-08-09 18:04:24', '2018-08-09 18:04:24'),
(432, 282, 134, 7, 40, 2300, 2185, '2018-08-09 18:04:24', '2018-08-09 18:04:24'),
(433, 283, 14, 1, 1, 126000, 119700, '2018-08-09 20:15:37', '2018-08-09 20:15:37'),
(434, 284, 16, 8, 1, 12400, 11780, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(435, 284, 39, 8, 1, 6850, 6507.5, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(436, 284, 94, 8, 1, 5000, 4750, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(437, 284, 134, 7, 2, 2300, 2185, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(438, 284, 132, 7, 2, 2450, 2327.5, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(439, 284, 79, 4, 1, 17500, 16625, '2018-08-09 23:23:34', '2018-08-09 23:23:34'),
(440, 285, 83, 4, 2, 24500, 23275, '2018-08-09 23:41:07', '2018-08-09 23:41:07'),
(441, 285, 140, 2, 1, 1250, 1187.5, '2018-08-09 23:41:07', '2018-08-09 23:41:07'),
(442, 286, 16, 8, 40, 12400, 11780, '2018-08-09 23:46:43', '2018-08-09 23:46:43'),
(443, 287, 37, 8, 5, 7950, 7552.5, '2018-08-09 23:52:11', '2018-08-09 23:52:11'),
(444, 287, 132, 7, 5, 2450, 2327.5, '2018-08-09 23:52:11', '2018-08-09 23:52:11'),
(445, 287, 140, 2, 21, 1250, 1187.5, '2018-08-09 23:52:11', '2018-08-09 23:52:11'),
(446, 287, 16, 8, 2, 12400, 11780, '2018-08-09 23:52:11', '2018-08-09 23:52:11'),
(447, 288, 27, 1, 2, 29900, 28405, '2018-08-10 00:08:19', '2018-08-10 00:08:19'),
(448, 288, 26, 1, 1, 15350, 14582.5, '2018-08-10 00:08:19', '2018-08-10 00:08:19'),
(449, 289, 24, 1, 4, 26700, 25365, '2018-08-10 01:09:04', '2018-08-10 01:09:04'),
(450, 289, 16, 8, 4, 12400, 11780, '2018-08-10 01:09:04', '2018-08-10 01:09:04'),
(451, 290, 13, 1, 1, 64000, 60800, '2018-08-10 02:29:37', '2018-08-10 02:29:37'),
(454, 292, 24, 1, 6, 26700, 25365, '2018-08-10 03:06:39', '2018-08-10 03:06:39'),
(455, 292, 16, 8, 5, 12400, 11780, '2018-08-10 03:06:39', '2018-08-10 03:06:39'),
(456, 292, 56, 3, 10, 2500, 2375, '2018-08-10 03:06:39', '2018-08-10 03:06:39'),
(457, 293, 75, 3, 2, 2500, 2375, '2018-08-10 04:15:18', '2018-08-10 04:15:18'),
(458, 293, 108, 7, 1, 6300, 5985, '2018-08-10 04:15:18', '2018-08-10 04:15:18'),
(459, 293, 39, 8, 3, 6850, 6507.5, '2018-08-10 04:15:18', '2018-08-10 04:15:18'),
(460, 293, 67, 3, 12, 500, 475, '2018-08-10 04:15:18', '2018-08-10 04:15:18'),
(461, 293, 16, 8, 1, 12400, 11780, '2018-08-10 04:15:18', '2018-08-10 04:15:18');

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
(25, 14811, 'TROPICAL MINYAK GORENG 500ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 6276, 7700, 7315, 'storage/app/image/igW413vqX4p6ZNet5KAXFjTKc7xPZQpNNkAHPoDg.png', 'MINYAK GR TR 500ML', '2018-05-27 23:02:02', '2018-07-11 21:55:34'),
(26, 14812, 'TROPICAL MINYAK GORENG 1000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 12517, 15350, 14582.5, 'storage/app/image/EvjcaoUevxujHq325oZyAGZYusr5AixJsrGrvqvN.png', 'MINYAK GR TR 1K ML', '2018-05-27 23:02:43', '2018-07-11 21:55:17'),
(27, 14813, 'TROPICAL MINYAK GORENG 2000ML', 'Minyak goreng Tropical merupakan minyak goreng yang berkualitas yang disempurnakan dengan proses 2x penyaringan. Minyak tropical ini sudah terkenal dikalangan masyarakat. ', 1, 1, 1, 1, NULL, 24422, 29900, 28405, 'storage/app/image/l9wFAvWDHtlzPX4wGFh4k7INfW0LcjOtRQxP7SmQ.png', 'MINYAK GR TR 2K ML', '2018-05-27 23:04:33', '2018-07-11 21:55:59'),
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
(40, 16301, 'BOLA TEPUNG BERAS 500GR', 'Bola Tepung Beras berasal dari beras pilihan dengan kualitas terpercaya, cocok untuk sajian kue-kue tradisional, jajanan pasar, dan goreng-gorengan. Serta terjamin kualitas dan standar keamaannya. Bersertifikat halal dari MUI.', 1, 1, 8, 2, NULL, 4841, 6500, 6175, 'storage/app/image/vZ6NFzOoZvIXcbd6oJxOoIcHuIfUFPTnbi1kfliG.png', 'TEPUNG BS BL 500G', '2018-05-27 23:16:49', '2018-08-03 22:35:50'),
(41, 16302, 'BOLA TEPUNG KETAN 500GR', 'Bola Tepung Beras ketan berasal dari beras ketan pilihan dengan kualitas terpercaya diimpor dari thailand, cocok untuk sajian kue-kue tradisional, jajanan pasar, dan goreng-gorengan. Serta terjamin kualitas dan standar keamaannya. Bersertifikat halal dari MUI.', 1, 1, 8, 2, NULL, 6605, 8200, 7790, 'storage/app/image/JIp7jNW68CLprW1j8dqTxwbbSKVFNbrtzhiTYRGK.png', 'TEPUNG KN BL 500GR', '2018-05-27 23:17:20', '2018-07-31 19:26:03'),
(42, 16307, 'BOLA TEPUNG TAPIOKA 500GR', 'Tepung Tapioka cap Bola tepung yang terbuat dari singkong pilihan dengan kualitas paling bagus. Bersertifikat halal MUI.', 1, 1, 8, 2, NULL, 5055, 7000, 6650, 'storage/app/image/ktwF24hKHOoRBGXo7CbSqhiWNXphI1kizQGzCySc.png', 'TEPUNG TA BL 500GR', '2018-05-27 23:17:48', '2018-07-31 19:22:30'),
(43, 10101, 'LADA BUBUK MERICAMU 2GR', 'Lada adalah salah satu bumbu dapur dalam masakan yang memiliki rasa yang pedas, pahit, dan juga hangat. Lada dengan bentuk serbuk bisa langsung di gunakan tanpa harus menghaluskannya terlebih dahulu sehingga akan sangat memudahkan proses memasak', 1, 1, 3, 5, NULL, 232, 500, 475, 'storage/app/image/jve7VS2fJdOC1JNzsfprhUTSS5wXodE5T5MzEYnW.png', 'LADA BUBUK MER 2GR', '2018-05-27 23:18:39', '2018-06-11 10:12:32'),
(44, 101119, 'MERICAMU EKONOMIS 1KG', NULL, 1, 1, 3, 2, NULL, 50796, 80000, 76000, 'storage/app/image/todwIauoqcPzvm6ZcZUYb3vvFkwKZuKj68YWreco.png', 'MER EKONOMIS 11KG ', '2018-05-27 23:20:06', '2018-07-31 20:40:46'),
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
(68, 16512, 'MASAKO SAPI 11GR', 'Bumbu penyedap siap pakai Masako rasa sapi, dibuat dari ekstrak daging sapi segar, garam, gula, penguat rasa, bumbu rempah dan lemak sapi yang dapat meningkatkan kelezatan dan kesedapan aneka masakan anda.', 1, 1, 3, 1, NULL, 370, 500, 475, 'storage/app/image/T0h9ypD5AZ3yyrHaSOCFwvf0n6pfhWcuOOJbUftw.png', 'MASAKO SAPI 11GR', '2018-05-27 23:36:26', '2018-08-05 17:24:11'),
(69, 16514, 'INDOFOOD SAUS SAMBAL 140ML', 'Sambal Indofood Ekstra Pedas cocok sebagai pendamping segala jenis makanan, memberi kepedasan lebih yang juga dapat dikonsumsi dengan masakan apapun, seperti mie, gorengan atau nasi goreng', 1, 1, 3, 1, NULL, 5051, 6400, 6080, 'storage/app/image/QFgxIFtTQtAQsnRc60wrFGFwyYTjDBazImfwoT0j.png', 'SAMBAL IDF 140ML  ', '2018-05-27 23:36:57', '2018-06-07 09:48:03'),
(70, 16515, 'SAJIKU TP BAKWAN 90GR', 'Sajiku tepung bumbu bakwan dibuat dengan perpaduan tepat antara tepung dan rempah pilihan menghasilkan bakwan dengan tekstur yang crispy serta rasa dan aroma yang lezat dengan cara yang praktis', 1, 1, 3, 1, NULL, 2194, 2900, 2755, 'storage/app/image/wCaVnJike4bYqKemcsUKBaz4iaKHJIbWBFvOfQcH.png', 'TEPUNG SJ BWN 90GR', '2018-05-27 23:37:27', '2018-06-11 09:23:30'),
(71, 16516, 'BANGO KECAP 600ML', 'Bango kecap manis refill merupakan kecap manis dalam bentuk kemasan mengutamakan kemurnian, yang terbuat dari kedelai hitam berkualitas tinggi. Bango terbuat dari bahan - bahan terpilih yaitu : kacang kedelai hitam, gula kelapa, garam dan air tanpa adanya bahan pengawet atau bahan kimia tambahan.', 1, 1, 3, 1, NULL, 23469, 27300, 25935, 'storage/app/image/aPgqEKtknckMLgd39pChnVTIfInxUp9A9a3oq5Es.png', 'BANGO KCP 600ML', '2018-05-27 23:38:04', '2018-06-07 09:46:17'),
(72, 17101, 'PUTRA BANTEN SAUS SAMBAL 525GR', 'Putra banten saus sambal memiliki cita rasa yang pedas dan menjadi salah satu pelengkap untuk penyedap makanan, saus juga biasa dihidangkan untuk pelengkap cemilan. Selain menjadi pelengkap makanan dan cemilan, Saus juga bisa digunakan untuk bumbu masakan rumahan maupun di restaurant atau tempat makan lainnya agar lebih meningkatkan cita rasa yang lebih nikmat.', 1, 1, 3, 2, NULL, 1871, 2500, 2375, 'storage/app/image/trtEuVe0Z86vNj47UPC5Wrz3rdPQjmvmisU6Hb5F.png', 'SAMBAL PB 525GR   ', '2018-05-27 23:38:33', '2018-07-11 22:00:43'),
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
(97, 12901, 'MAYA SARDEN TOMAT KECIL 155GR', 'Maya sarden tomat kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6131, 7300, 6935, 'storage/app/image/mayatomatosauce.png', 'SARDEN TK MY 155GR', '2018-05-28 01:06:03', '2018-06-07 09:57:42'),
(98, 12902, 'MAYA SARDEN TOMAT BESAR 425GR', 'Maya sarden tomat kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 14368, 17500, 16625, 'storage/app/image/mayatomatosauce.png', 'SARDEN TB MY 425GR', '2018-05-28 01:06:35', '2018-06-07 09:58:22'),
(99, 12903, 'MAYA SARDEN CHILLI KECIL 155GR', 'Maya sarden chilli kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6131, 7300, 6935, 'storage/app/image/mayachilisauce.png', 'SARDEN CK MY 155GR', '2018-05-28 01:07:06', '2018-06-07 09:58:39'),
(100, 12904, 'MAYA SARDEN CHILLI BESAR 425GR', 'Maya sarden chilli kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan sangat praktis. Buka kaleng, hangatkan sebentar dan ikan mungil dengan sausnya siap disantap, kalau perlu dengan sedikit tambahan bawang merah dan bawang putih, jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 14314, 17500, 16625, 'storage/app/image/mayachilisauce.png', 'SARDEN CB MY 425GR', '2018-05-28 01:07:44', '2018-06-07 10:00:18'),
(101, 12908, 'MAYA MARCKEREL KECIL 155GR', 'Mackerel kalengan merupakan salah satu jenis makanan kalengan yang jadi andalan saat perlu makan dalam keadaan mendesak yang tidak memiliki banyak waktu untuk memasak, karena sangat praktis tinggal buka kaleng, hangatkan sebentar, dan ikan mungil dengan sausnya siap disantap. Kalau perlu dengan sedikit tambahan bawang merah dan bawang putih jadilah sajian istimewa.', 1, 1, 6, 1, NULL, 6370, 7850, 7457.5, 'storage/app/image/mayatomatosauce.png', 'MARCKERE K MY 155G', '2018-05-28 01:08:15', '2018-07-31 18:54:33'),
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
(115, 10819, 'LA FONTE SAUS PASTA BOLOGNESE 315GR', 'La Fonte Saus Pasta Bolognese adalah saus pasta yang dibuat dari tomat segar dengan paduan rempah-rempah pilihan, serta komposisi seimbang, sehingga menghasilkan rasa khas yang menyatu bersama pasta. Dilengkapi daging cincang untuk menambah nikmat sajian pasta Anda. Ideal dipadu padankan dengan semua jenis pasta.', 1, 1, 7, 1, NULL, 12824, 15250, 14487.5, 'storage/app/image/6tEnE7TNbAw4IM3V1JHKog6Q5ijNL5e2bEjLGO41.png', 'S PASTA B LF 315GR', '2018-05-28 01:16:45', '2018-06-07 10:14:17'),
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
(129, 15808, 'LA FONTE FETTUCINE 450GR', 'La Fonte Fettuccine merupakan pasta sehat yang terbuat dari gandum durum pilihan, memiliki kandungan protein yang tinggi namun rendah lemak dan ekstra serat. Testurnya yang kenyal membuatnya tidak mudah hancur saat dimasak atau dipanaskan. Rasakan pasta lembut yang nikmat dan istimewa ini bersama keluarga, teman, dan orang terdekat Anda. Bahan dan kandungannya yang sehat dan bergizi, membuat La Fonte Fettuccine aman untuk dikonsumsi.', 1, 1, 7, 1, NULL, 11579, 13750, 13062.5, 'storage/app/image/WpFlFRB6fF3reV2e7JviJyFsQBd7QW86IYxjClBQ.png', 'FETTUCINE LF 450GR', '2018-05-28 01:24:59', '2018-06-07 10:17:58'),
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
  `description` varchar(200) NOT NULL,
  `photo_url` varchar(200) NOT NULL,
  `slug` varchar(150) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `description`, `photo_url`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Bahan Pokok', 'Tersedia bahan pokok seperti beras, minyak goreng, dan lainnya untuk memenuhi kebutuhan rumah setiap hari, dengan harga yang menarik.', 'storage/app/category/categorypokok.png', '', '2018-05-24 21:55:33', '2018-05-24 21:55:33'),
(2, 'Minuman', 'Tersedia minuman seperti teh, kopi, dan minuman siap saji lainnya, untuk mendampingin aktivitas anda setiap hari dengan menarik.', 'storage/app/category/categoryminuman.png', '', '2018-05-24 21:55:40', '2018-05-24 21:55:40'),
(3, 'Bumbu Dapur', 'Tersedia berbagai bumbu dari Nusantara sebagai pelengkap cita rasa setiap masakan di rumah tangga, dengan harga yang menarik.', 'storage/app/category/categorydapur.png', '', '2018-05-24 21:55:49', '2018-05-24 21:55:49'),
(4, 'Makanan Beku', 'Tersedia berbagai pilihan makanan beku seperti Nugget, Chicken Wings, dan lain-lain sebagai pelengkap menu di meja makan anda, dengan harga yang menarik.', 'storage/app/category/categorybeku.png', '', '2018-05-24 21:56:01', '2018-05-24 21:56:01'),
(5, 'Paket GrosirOne', 'Kami sediakan beberapa paket dengan harga khusus untuk anda, sebagai wujud apresiasi GrosirOne terhadap anda.', 'storage/app/category/categorypaket.png', '', '2018-05-24 21:56:09', '2018-05-24 21:56:09'),
(6, 'Makanan Kaleng', 'Tersedia makanan kaleng seperti sarden dengan kemasan yang higienis, untuk melengkapi menu masakan di rumah tangga anda, dengan harga yang menarik.', 'storage/app/category/categorykaleng.png', '', '2018-05-24 21:56:16', '2018-05-24 21:56:16'),
(7, 'Mie, Pasta & Bihun', 'Tersedia berbagai pilihan mie, pasta, bihun, dan lain-lain untuk melengkapi masakan anda, dengan harga yang menarik.', 'storage/app/category/categorypasta.png', '', '2018-05-24 21:56:21', '2018-05-24 21:56:21'),
(8, 'Makanan Pelengkap', 'Tersedia makanan pelengkap seperti tepung, makaroni, margarine, dan lain-lain untuk melengkapi masakan anda, dengan harga yang menarik.', 'storage/app/category/categorypelengkap.png', '', '2018-05-24 21:56:26', '2018-05-24 21:56:26'),
(9, 'Grosir', 'Kami sediakan beberapa barang dengan harga grosir untuk anda, sebagai wujud apresiasi GrosirOne terhadap anda.', 'storage/app/category/categorygrosir.png', '', '2018-05-24 22:00:11', '2018-05-24 22:00:11');

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
(11, 247, 102, 120, '5.0', '', '2018-08-01 03:24:44', '2018-08-01 03:24:44'),
(12, 275, 33, 257, '5.0', '', '2018-08-09 01:44:10', '2018-08-09 01:44:10'),
(13, 286, 33, 257, '3.0', '', '2018-08-09 23:54:08', '2018-08-09 23:54:08'),
(14, 285, 102, 135, '5.0', 'Ok good', '2018-08-10 00:51:18', '2018-08-10 00:51:18'),
(15, 279, 167, 164, '5.0', '', '2018-08-10 01:26:49', '2018-08-10 01:26:49');

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
(2, NULL, 6, NULL, 0, NULL, '2018-08-01 07:39:13', '2018-04-17 23:20:08'),
(4, 1, 8, NULL, 0, NULL, '2018-08-01 07:39:18', '2018-04-17 23:23:23'),
(5, 1, 9, NULL, 0, NULL, '2018-08-01 07:39:20', '2018-04-17 23:42:29'),
(6, 1, 10, NULL, 0, NULL, '2018-08-01 07:39:22', '2018-04-18 02:46:56'),
(7, 1, 11, NULL, 23, NULL, '2018-05-24 06:42:05', '2018-05-24 06:42:05'),
(8, 2, 12, NULL, 50, NULL, '2018-05-24 06:43:33', '2018-05-24 06:43:33'),
(9, 1, 13, NULL, 19, NULL, '2018-08-10 02:29:40', '2018-08-10 02:29:40'),
(10, 1, 14, NULL, 3, NULL, '2018-08-01 04:10:13', '2018-07-02 00:22:04'),
(11, 1, 15, NULL, 0, NULL, '2018-08-10 03:29:35', '2018-07-02 01:55:46'),
(12, 1, 16, NULL, 188, NULL, '2018-08-06 20:31:35', '2018-08-06 20:31:35'),
(13, 1, 17, NULL, 207, NULL, '2018-07-31 13:54:16', '2018-06-19 02:41:21'),
(14, 1, 18, NULL, 239, NULL, '2018-07-31 11:55:01', '2018-06-19 02:41:30'),
(15, 1, 19, NULL, 99, NULL, '2018-07-31 11:55:20', '2018-06-19 02:41:33'),
(16, 1, 20, NULL, 93, NULL, '2018-07-31 11:59:48', '2018-07-02 00:18:57'),
(17, 1, 21, NULL, 285, NULL, '2018-08-09 01:29:28', '2018-08-09 01:29:28'),
(18, 1, 22, NULL, 100, NULL, '2018-06-19 09:41:44', '2018-06-19 02:41:44'),
(19, NULL, 23, NULL, 64, NULL, '2018-07-31 13:38:16', '2018-05-27 22:58:17'),
(20, 1, 23, NULL, 0, NULL, '2018-08-01 07:39:32', '2018-07-27 06:19:16'),
(21, 1, 24, NULL, 103, NULL, '2018-07-31 17:01:34', '2018-07-10 23:14:41'),
(22, 1, 25, NULL, 240, NULL, '2018-07-31 14:27:21', '2018-05-27 23:02:02'),
(23, 1, 26, NULL, 100, NULL, '2018-06-19 09:42:00', '2018-05-27 23:02:43'),
(24, 1, 27, NULL, 68, NULL, '2018-07-31 14:29:40', '2018-07-02 00:21:29'),
(25, 1, 28, NULL, 0, NULL, '2018-08-01 07:39:37', '2018-05-27 23:05:17'),
(26, 1, 29, NULL, 0, NULL, '2018-08-01 07:39:38', '2018-05-27 23:06:04'),
(27, 1, 30, NULL, 0, NULL, '2018-08-01 07:39:40', '2018-05-27 23:06:50'),
(28, 1, 31, NULL, 366, NULL, '2018-07-31 10:04:32', '2018-05-27 23:08:18'),
(29, 1, 32, NULL, 89, NULL, '2018-07-31 10:13:02', '2018-07-31 03:13:02'),
(30, 1, 33, NULL, 0, NULL, '2018-08-01 07:39:43', '2018-05-27 23:11:25'),
(31, 1, 34, NULL, 0, NULL, '2018-08-01 07:39:44', '2018-05-27 23:12:20'),
(32, 1, 35, NULL, 74, NULL, '2018-08-08 02:46:06', '2018-08-08 02:46:06'),
(33, 1, 36, NULL, 59, NULL, '2018-07-31 11:41:46', '2018-05-27 23:13:41'),
(34, 1, 37, NULL, 291, NULL, '2018-08-06 20:31:35', '2018-08-06 20:31:35'),
(35, 1, 38, NULL, 97, NULL, '2018-07-01 23:15:31', '2018-07-01 23:15:31'),
(36, 1, 39, NULL, 259, NULL, '2018-08-08 19:33:23', '2018-08-08 19:33:23'),
(37, 1, 40, NULL, 99, NULL, '2018-07-31 16:59:42', '2018-05-27 23:16:49'),
(38, 1, 41, NULL, 185, NULL, '2018-08-08 19:33:23', '2018-08-08 19:33:23'),
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
(52, 1, 55, NULL, 21, NULL, '2018-08-08 02:46:06', '2018-08-08 02:46:06'),
(53, 1, 56, NULL, 834, NULL, '2018-07-31 14:59:58', '2018-07-01 23:36:30'),
(54, 1, 57, NULL, 100, NULL, '2018-06-19 09:43:10', '2018-05-27 23:30:16'),
(55, 1, 58, NULL, 159, NULL, '2018-07-31 16:56:05', '2018-05-27 23:30:47'),
(58, 1, 61, NULL, 30, NULL, '2018-07-31 17:06:23', '2018-05-27 23:32:29'),
(59, 1, 62, NULL, 0, NULL, '2018-08-01 07:39:55', '2018-05-27 23:33:06'),
(60, 1, 63, NULL, 24, NULL, '2018-07-31 17:13:12', '2018-07-01 22:43:22'),
(61, 1, 64, NULL, 6, NULL, '2018-07-31 17:13:39', '2018-05-27 23:34:15'),
(62, 1, 65, NULL, 1152, NULL, '2018-07-31 17:21:11', '2018-05-27 23:34:46'),
(63, 1, 66, NULL, 1152, NULL, '2018-08-05 08:01:14', '2018-05-27 23:35:18'),
(64, 1, 67, NULL, 828, NULL, '2018-08-05 08:03:43', '2018-05-27 23:35:50'),
(65, 1, 68, NULL, 1656, NULL, '2018-08-05 08:04:21', '2018-05-27 23:36:26'),
(66, 1, 69, NULL, 48, NULL, '2018-08-01 03:57:52', '2018-05-27 23:36:57'),
(67, 1, 70, NULL, 77, NULL, '2018-08-01 03:58:24', '2018-05-27 23:37:27'),
(68, 1, 71, NULL, 40, NULL, '2018-08-05 08:05:02', '2018-05-27 23:38:04'),
(69, 1, 72, NULL, 48, NULL, '2018-08-01 07:37:24', '2018-05-27 23:38:33'),
(70, 1, 73, NULL, 36, NULL, '2018-08-01 07:37:54', '2018-05-27 23:39:06'),
(71, 1, 74, NULL, 8, NULL, '2018-08-01 07:38:15', '2018-05-27 23:39:42'),
(72, 1, 75, NULL, 22, NULL, '2018-07-31 17:05:55', '2018-05-27 23:40:10'),
(73, 1, 76, NULL, 99, NULL, '2018-07-02 00:22:04', '2018-07-02 00:22:04'),
(74, 1, 77, NULL, 5, NULL, '2018-08-01 04:10:59', '2018-05-28 00:46:06'),
(75, 1, 78, NULL, 2, NULL, '2018-08-01 04:11:18', '2018-05-28 00:46:43'),
(76, 1, 79, NULL, 0, NULL, '2018-08-10 03:30:03', '2018-05-28 00:47:11'),
(77, 1, 80, NULL, 12, NULL, '2018-08-01 04:12:00', '2018-05-28 00:47:47'),
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
(91, 1, 94, NULL, 136, NULL, '2018-07-31 14:33:05', '2018-05-28 01:03:31'),
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
(112, 1, 115, NULL, 83, NULL, '2018-07-31 11:09:58', '2018-05-28 01:16:45'),
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
(129, 1, 132, NULL, 265, NULL, '2018-07-31 17:04:19', '2018-07-02 00:22:31'),
(130, 1, 133, NULL, 100, NULL, '2018-06-19 09:46:00', '2018-05-28 01:26:33'),
(131, 1, 134, NULL, 58, NULL, '2018-07-31 17:04:34', '2018-05-28 01:26:55'),
(132, 1, 135, NULL, 213, NULL, '2018-07-31 17:04:49', '2018-05-28 01:27:29'),
(133, 1, 136, NULL, 98, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(134, 1, 137, NULL, 130, NULL, '2018-07-31 17:20:39', '2018-05-28 01:28:24'),
(135, 1, 138, NULL, 98, NULL, '2018-07-02 00:22:31', '2018-07-02 00:22:31'),
(136, 1, 139, NULL, 0, NULL, '2018-08-01 07:41:01', '2018-05-28 01:29:11'),
(137, 1, 140, NULL, 610, NULL, '2018-07-31 17:12:50', '2018-05-28 01:29:44');

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
(199, 26, 1, 'Terjual', 1, '2018-08-02 03:56:21', '33', '2018-08-02 03:56:21', '33'),
(200, 39, 1, 'Terjual', 1, '2018-08-03 03:51:25', '33', '2018-08-03 03:51:25', '33'),
(201, 96, 1, 'Terjual', 1, '2018-08-03 03:51:25', '33', '2018-08-03 03:51:25', '33'),
(202, 94, 1, 'Terjual', 1, '2018-08-03 03:51:25', '33', '2018-08-03 03:51:25', '33'),
(203, 21, 1, 'Terjual', 1, '2018-08-03 21:36:35', '1', '2018-08-03 21:36:35', '1'),
(204, 14, 1, 'Terjual', 1, '2018-08-03 21:36:35', '1', '2018-08-03 21:36:35', '1'),
(205, 13, 2, 'Terjual', 1, '2018-08-05 20:10:11', '1', '2018-08-05 20:10:11', '1'),
(206, 37, 1, 'Terjual', 3, '2018-08-06 20:31:35', '33', '2018-08-06 20:31:35', '33'),
(207, 16, 1, 'Terjual', 1, '2018-08-06 20:31:35', '33', '2018-08-06 20:31:35', '33'),
(208, 39, 1, 'Terjual', 3, '2018-08-08 00:32:50', '33', '2018-08-08 00:32:50', '33'),
(209, 55, 1, 'Terjual', 1, '2018-08-08 02:46:06', '33', '2018-08-08 02:46:06', '33'),
(210, 35, 1, 'Terjual', 4, '2018-08-08 02:46:06', '33', '2018-08-08 02:46:06', '33'),
(211, 41, 1, 'Terjual', 1, '2018-08-08 19:33:23', '33', '2018-08-08 19:33:23', '33'),
(212, 39, 1, 'Terjual', 1, '2018-08-08 19:33:23', '33', '2018-08-08 19:33:23', '33'),
(213, 21, 1, 'Terjual', 8, '2018-08-09 01:29:28', '33', '2018-08-09 01:29:28', '33'),
(214, 13, 1, 'Terjual', 1, '2018-08-10 02:29:40', '33', '2018-08-10 02:29:40', '33');

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
(1, 5, 2, '081234567', '$2y$10$3dnhCubig6e97ioNhr/hfeQVIHB/aTmAsdzQxXDbhSujJN9BG6c7u', 'R2AIpZfzNDlXsrHZAKxlu1EmqKA6Pmeijasm933CZnOruNwXR5VMExVHYPyQ', 'active', '', '2017-12-06 09:43:12', '2018-08-04 05:15:37'),
(33, 5, 1, '085384543785', '$2y$10$GYojji5pa7m9EChRptSAGO0OM8yFCmZ1OkycDo/Ogfz9.RKxXreEy', 'OmIqqBTbcOrwF80i3PSPBBfxAg0aHDjqQTV96pXGJSsbxBPP2DlfyH9DHFIR', 'active', '', '2017-12-28 09:26:31', '2017-12-28 09:22:58'),
(35, 4, 2, '081281532222', '$2y$10$3dnhCubig6e97ioNhr/hfeQVIHB/aTmAsdzQxXDbhSujJN9BG6c7u', 'key-5acb0d6e9c7d8', 'active', '', '2018-04-09 06:51:26', '2018-04-09 06:51:26'),
(38, 5, 1, '085718135543', '$2y$10$mF8rs6tz6fPUk6rzlihNKupvAGJCA5Ce./pQ9xO8mx93Qzfprho76', '5b03d5f064c35', 'active', '', '2018-05-22 08:33:52', '2018-07-31 07:32:42'),
(41, 5, 1, '021822828', '$2y$10$.i1rh6ZURBQA0LL4Oj.oDOqy0UPQQORqTbbN9rdwDx.Yyw35rsdn2', '5b066bacb0658', 'active', '', '2018-05-24 07:37:16', '2018-05-24 07:37:16'),
(42, 5, 1, '021822828', '$2y$10$I0Yl6QVJlCfBuXD2KyXolebtx2Yo7uOiRnuLluvXBdehXgv0L81Ty', '5b0679717a19e', 'active', '', '2018-05-24 08:36:01', '2018-05-24 08:36:01'),
(47, 2, 2, '087654321', '$2y$10$OhXoeyfepmaPYustER5JiewMSCnu3QMVkg4QHVYJzphPkzJ1G3/km', '5b162a50b007b', 'active', '', '2018-06-05 06:14:40', '2018-07-30 21:47:02'),
(50, 5, 1, '789456123', '$2y$10$c6E.RbgRuppUOcdN.bxGj.V6oNlJfL/pYlppLXcwl.Y9.FBFGFmVu', '5b3173e55dc00', 'active', '', '2018-06-25 22:59:49', '2018-06-25 22:59:49'),
(51, 5, 1, '9999', '$2y$10$xVCCRmPLRfWEpZGNEfKid.VngrGGMy3DqeU2hcaqlfzFWsMQ5k7zC', '5b317aa833838', 'active', '', '2018-06-25 23:28:40', '2018-06-25 23:28:40'),
(52, 9, 1, '8888', '$2y$10$bkoEZUxo9WiaxtE32lcvEejXTAhSdRiHwn/VbasZVFlaMHBUgwGty', '5b317e5fe5bc8', 'active', '', '2018-06-25 23:44:31', '2018-06-25 23:44:31'),
(55, 1, 1, '121', '$2y$10$eQrWHais45GWKrouZp5.duPVHaJj1oCpnhc6/WVL8Jf2y6e0tcPAC', '5b318ef66c660', 'active', '', '2018-06-26 00:55:18', '2018-06-26 00:55:18'),
(56, 5, 1, '0811553355', '$2y$10$oVQ6.PqaEvcVy4GCCfwMHucbSKOhBa5i8Q8hTi62pSaqjKzVsKs22', '5b31d01214050', 'active', '', '2018-06-26 05:33:06', '2018-06-26 05:33:06'),
(58, 2, 1, '7676', '$2y$10$h40ds289X4J6qldmsqlSCOl.1fKn0QzZeeyIm5FLrTUTRIg7jgiyW', '5b38bebfd2348', 'active', '', '2018-07-01 11:45:03', '2018-07-01 11:45:03'),
(59, 2, 1, '5489', '$2y$10$c0Ufj7jaiOHfSqYJexzTVOLYVYC741jwYlgyChu/EX2ifCv9cnvUa', '5b38bf5e19258', 'active', '', '2018-07-01 11:47:42', '2018-07-01 11:47:42'),
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
(72, 2, 2, '0899123456', '$2y$10$Qw7XOtdcQoYeFLedIv1yg.b8kWg2w0bWK6kSgWenYWYJYfIbuBcRu', '5b469919a7f80', 'active', '', '2018-07-11 23:56:09', '2018-07-29 22:11:10'),
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
(89, 5, 2, '085714230464', '$2y$10$GAZkXSDuyl6HJ7BfOad3M.wz1Zri42Bbv89L35/L/xrQT0AMay0Ia', '5b5bd096e7ef0', 'active', '', '2018-07-28 02:10:30', '2018-08-10 01:47:27'),
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
(120, 2, 1, '081220211201', '$2y$10$XGCmCSM.ETsRp5QCf/EooeJAF80IPKHgGa9sTmW5t3APvHO91kEN6', '5b5ced14ca648', 'active', '', '2018-07-28 22:24:20', '2018-08-09 21:05:39'),
(121, 2, 1, '085216928065', '$2y$10$2VZ4WM2s2jE2bHVS2Fl7pOGrQZ5ccwUDZl51tZp0h/q7royKBELLy', '5b5ced5702328', 'active', '', '2018-07-28 22:25:27', '2018-07-28 22:25:27'),
(122, 2, 1, '081234657', '$2y$10$TwY03ZTSvsC.cdddNg7QZePiqGJ/4YbPbYo9gUvP0U9GJjWzd65CK', '5b5cedbe1ccf0', 'active', '', '2018-07-28 22:27:10', '2018-07-28 22:27:10'),
(123, 5, 1, '085945175200', '$2y$10$IuUGmN.zIQ1HMhvYSzqKsugr5tz8CGILcnwDyBOpKRA057nQ8ddti', '5b5cef45aa690', 'active', '', '2018-07-28 22:33:41', '2018-08-09 04:59:41'),
(124, 2, 1, '08989030153', '$2y$10$oSC4gu.FK9la43ZKkLAKr.iL625QGu2tb7eNEFJ6As/MpjIhVncGy', '5b5cf01ee53f8', 'active', '', '2018-07-28 22:37:18', '2018-07-28 22:46:33'),
(125, 5, 1, '085959703316', '$2y$10$3e4qHxlDq1P8xTEuGj87Ue0yLjAh.RMviyA014rkH/MSB6Kh0tN0K', '5b5cf3680a028', 'active', '', '2018-07-28 22:51:20', '2018-08-09 05:05:01'),
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
(151, 5, 1, '081382589050', '$2y$10$PRwJ5nUcOdg5hb60O6Nlr.5Fb5Z6zy43vL4N9qhLsqCGPoqZx.2Cm', '5b62029a806b0', 'active', '', '2018-08-01 18:57:30', '2018-08-06 07:13:33'),
(152, 5, NULL, '081382589050', '$2y$10$.neIUToG5feVlZlZZlyOquI3ii59H4IUNdnJGIvMmjlCDlxc4fyRC', '5b6202e565ce8', 'active', '', '2018-08-01 18:58:45', '2018-08-01 18:58:45'),
(153, 5, 1, '087771051399', '$2y$10$467/0N7/QHN9ostrkOx/e.MSb5MILxDXAuOsXXtLupScDIntUY5RS', '5b621925762a0', 'active', '', '2018-08-01 20:33:41', '2018-08-01 13:58:12'),
(154, 2, 1, '087886951124', '$2y$10$L9RH619dPLLne48TlEG9UO23LX8O6EkFsHvJtuoLShUZwInNDlRlS', '5b621eb709858', 'active', '', '2018-08-01 20:57:27', '2018-08-01 20:57:27'),
(155, 5, 1, '08777105139', '$2y$10$IUnkkqNL.8dDZxZHiD/0zuS.k4TWGxQA9fh3C81vX93/Jgy.iTESq', '5b621f2780a98', 'active', '', '2018-08-01 20:59:19', '2018-08-01 17:58:01'),
(156, 2, 1, '085211876530', '$2y$10$Jm8nbMWOP64OKGrIfGxhDObre/oMODYiJAawwOuyJtRz3DE0.Msua', '5b624d6a1ccf0', 'active', '', '2018-08-02 00:16:42', '2018-08-02 00:16:42'),
(157, 2, 2, '087771979717', '$2y$10$lKMSR4we2l91t99iUkPfUeJqNrm8gqHLrPV4bpCUBKQNZHnvTMyTu', '5b625f33f26e8', 'active', '', '2018-08-02 01:32:36', '2018-08-02 01:32:36'),
(158, 2, 2, '081281532222', '$2y$10$c4TrbqmZbtiWmugc78zNX.q85hKwQGM2umMgy1GFJGGW63gm2Ceou', '5b626007ddae0', 'active', '', '2018-08-02 01:36:07', '2018-08-02 01:36:07'),
(159, 2, 1, '08176807051', '$2y$10$P4bEW92pojfdjwrUILGKl.2dlsOlTxU.zhowp2gYrfqXAlT7QGEYS', '5b627f17a48d0', 'active', '', '2018-08-02 03:48:39', '2018-08-02 03:48:39'),
(160, 2, 1, '089648278845', '$2y$10$5bACANpBUxovLSr26IA4SuptgQ2uzlxPaloVD9KbrriPQ2vEs1A3W', '5b628d206aef0', 'active', '', '2018-08-02 04:48:32', '2018-08-02 04:48:32'),
(161, 2, 2, '081292570713', '$2y$10$MJENbnqyCms.Tc9oR6Kk3.7fiL2H.aLFQr6krElAiL80kVIbC01dm', '5b63eff1b0ce8', 'active', '', '2018-08-03 06:02:25', '2018-08-03 06:02:25'),
(164, 2, 2, '083813883800', '$2y$10$3PqvqF66AZrnL78rb1/MIecZGGt2Z6cRsvXq7FZERrnTJ46dJ4LqW', '5b64bcc477ec0', 'active', '', '2018-08-03 20:36:20', '2018-08-03 20:36:20'),
(165, 2, 2, '0895360678910', '$2y$10$orTvwSl6tCXjYwZMDNv4v.B.HBTqXCpRIV9t2X2UQRwRm.DCl6FYG', '5b64bd053aa48', 'active', '', '2018-08-03 20:37:25', '2018-08-03 20:37:25'),
(166, 5, 2, '081325875996', '$2y$10$wFFZU.NN6EvPdaNcSOjRpufJZAT7T6NEMaVHrFu6kfW/P947v3RR6', '5b64be08a04d8', 'active', '', '2018-08-03 20:41:44', '2018-08-03 13:50:50'),
(167, 5, 2, '082246641853', '$2y$10$dHV7uZIHWOHdSXh3/gmICON2aM/XsmPPR.oVQ42adVkJUOtauZ7MC', '5b64be55c3d98', 'active', '', '2018-08-03 20:43:01', '2018-08-09 00:57:14'),
(168, 5, 2, '08551857848', '$2y$10$b9EW3/YdbeyidZONB6ZfSOAgnRk83mMJls2tn.FHAHN1UUm8b4fhG', '5b64be9aac8f0', 'active', '', '2018-08-03 20:44:10', '2018-08-03 13:51:03'),
(169, 5, 2, '+62895635066173', '$2y$10$scMBhtgb6Q9uwZyG2A4DFuwI3LDM0dZXitvlGNz2beW9idoFdlZ5a', '5b64bea9b4528', 'active', '', '2018-08-03 20:44:25', '2018-08-03 13:51:10'),
(170, 5, 2, '085231754310', '$2y$10$OdXbzWzb7CXW86SNg7MCu.gYYilpduphAYjvKMUuLf.GBRL.4vdL2', '5b64bef1c0df0', 'active', '', '2018-08-03 20:45:37', '2018-08-03 13:51:17'),
(172, 5, 2, '087775144366', '$2y$10$lBAuEXsCJsMXhs0tAfViWuJnkUe6px3q1pyugdTbJTohKjgBCSelm', '5b64bf0bd5548', 'active', '', '2018-08-03 20:46:03', '2018-08-03 13:50:06'),
(173, 5, 2, '081384847231', '$2y$10$u711D7WhzO2iwRcH1FtmiuqSkH2uJTfSHDSWc/Vv8JDZeXOesVxK2', '5b64bf1b59100', 'active', '', '2018-08-03 20:46:19', '2018-08-03 13:51:22'),
(174, 5, 2, '085775125430', '$2y$10$UQRoaIhgZJchEQF/8xHJ3.eE2Qv5bAxr8OnsEuL6.7WXaUrJUogDa', '5b64bf27c7060', 'active', '', '2018-08-03 20:46:31', '2018-08-03 21:43:13'),
(175, 5, 2, '082324773040', '$2y$10$U/WhP36zLF5957qSG6ck6evoYmCsL86ac2RKMHO/fN51ctInZS7QO', '5b64bf2f77628', 'active', '', '2018-08-03 20:46:39', '2018-08-09 07:48:09'),
(176, 5, 1, '081315706294', '$2y$10$XaBNyiV7jwpj1MY9bkBvFOK8PajM7QnSLrcbEjQsjKxd.eJpFCha6', '5b64bf3864640', 'active', '', '2018-08-03 20:46:48', '2018-08-03 13:51:41'),
(177, 5, 2, '081218177921', '$2y$10$CKhwHByRPT650Y7meHsjd.Rzkr/VTv.fm4t7nTdUKW5K7/0IQ9FFK', '5b64bf42b4848', 'active', '', '2018-08-03 20:46:58', '2018-08-03 13:51:47'),
(179, 5, 2, '085697524165', '$2y$10$IOhok2HPc4FjThOQC8r3A.5L8BBaOZpTNYSP.uIKi6OILjf6xk0z6', '5b64bf4653340', 'active', '', '2018-08-03 20:47:02', '2018-08-03 13:52:01'),
(180, 5, 2, '085213056251', '$2y$10$lyIxZWHIVKccHxZM4b1MFOsKdZWp6UGAV153T8vdNekyPK6eXKxk2', '5b64bf4782cf8', 'active', '', '2018-08-03 20:47:03', '2018-08-03 13:52:06'),
(181, 5, 1, '081295959630', '$2y$10$qhjFrjDb.zkiLYpLyeXG0OiFL.UxdwjACtzhp8q4V8llYh1iCp8wO', '5b64bf4e3a8b8', 'active', '', '2018-08-03 20:47:10', '2018-08-03 21:42:58'),
(182, 5, 2, '085697963813', '$2y$10$dj8oYuOEhJWUHWzNlTkmTOqk.Shbs3yE3ApuNiEeXpUhZ/WRJ/L22', '5b64bf68683f8', 'active', '', '2018-08-03 20:47:36', '2018-08-03 13:49:22'),
(183, 5, 2, '087774157826', '$2y$10$tydsiMfJvYwnJVjr2CdYRu9NPC1qMm3WU7HAsiHrEOrWEoRXYgZFG', '5b64bf737f008', 'active', '', '2018-08-03 20:47:47', '2018-08-03 13:52:17'),
(184, 5, 2, '082111174984', '$2y$10$ktrIjfzyVLb2qBJFQ2qfqujJqkXsX7.aGEAWcVFjPlAct/bFBZaVW', '5b64bf7b2f5d0', 'active', '', '2018-08-03 20:47:55', '2018-08-03 21:42:53'),
(185, 5, 2, '081210976667', '$2y$10$K1NUz8kErkYP19FkDlYJQeyuyoFDwyNgMJVQbfitO99JBntR4VdSe', '5b64bf92d3ea0', 'active', '', '2018-08-03 20:48:18', '2018-08-03 13:52:28'),
(186, 5, NULL, '081290377693', '$2y$10$YN5ehu/jzMHmQEPDyPUdiutvxeS0mcB69.Fv7JXWMpW5n03Bq5Yjq', '5b64bf9592888', 'active', '', '2018-08-03 20:48:21', '2018-08-03 20:48:21'),
(187, 5, NULL, '085213056251', '$2y$10$n9mAuZmmNm0PMOWo6vj1D.xpBVYrRBg1MDyXTCDEahuhIw2kWcySS', '5b64bfbe99a98', 'active', '', '2018-08-03 20:49:02', '2018-08-03 20:49:02'),
(188, 5, 1, '085921411047', '$2y$10$xcxAES7n.AR9Tb7cx.bwlOhryknC/O4MfXY1Q7IKE5ukmlijspQ3a', '5b64bfd32fda0', 'active', '', '2018-08-03 20:49:23', '2018-08-03 13:52:33'),
(189, 5, NULL, '081282818081', '$2y$10$AD2.hQc1v0/bU/LoQUFhReQ.0pE7xGaWsgPc9EYBCUrkCf4A2gaXS', '5b64bfd873eb0', 'active', '', '2018-08-03 20:49:28', '2018-08-03 20:49:28'),
(190, 5, NULL, '081287152159', '$2y$10$GQ0YTNjyT.xVUGpquFmc2.3uvLtF361H4tzNxtJX.ugYu1YDWMBDO', '5b64bfdb35908', 'active', '', '2018-08-03 20:49:31', '2018-08-03 20:49:31'),
(191, 5, NULL, '082114583058', '$2y$10$sPIDlx6t10Qmkn.pi4wvgu01c.bRo4PI0CD0x54VVVvSqiCmVxhBa', '5b64bfe405c30', 'active', '', '2018-08-03 20:49:40', '2018-08-03 20:49:40'),
(192, 5, NULL, '+62895635066173', '$2y$10$hDI7Sr4yU/xRPX0M9hfJCOhuN5kZEaIn92n4V4QSDwJHMjK5XPyG6', '5b64c00b60950', 'active', '', '2018-08-03 20:50:19', '2018-08-03 20:50:19'),
(193, 5, 2, '087808253790', '$2y$10$AWlQhRbqNYyVDHR5VW130.9Rfe.fVg2nlbGg02e10FA51hCpyVtvC', '5b64c020c7e70', 'active', '', '2018-08-03 20:50:40', '2018-08-03 13:52:53'),
(194, 5, 2, '083874437190', '$2y$10$ZRxt97LV4L0JgwFA.d3zNOghmgLUJEkEQyemZ8r./9NGzNpu8knXO', '5b64c02483270', 'active', '', '2018-08-03 20:50:44', '2018-08-03 13:53:00'),
(195, 5, NULL, '085944116', '$2y$10$9gfHk/BpJY27E9nKzb5I.u49Ntnxw4eEkYt/1gFjixA4uXD43TxTG', '5b64c039f1428', 'active', '', '2018-08-03 20:51:06', '2018-08-03 20:51:06'),
(196, 5, 2, '089694347571', '$2y$10$jFAN6MUlthMd1cN6Y6NJ8OYKslZa6GjYrrSKVrLROd9rPzR.PU7HG', '5b64c06c82e88', 'active', '', '2018-08-03 20:51:56', '2018-08-04 09:13:35'),
(197, 5, 2, '089643089849', '$2y$10$7QsjQ4eJk1gq6vAFGXsLau2e3sJ6U928KT9v3aqhZwMaXgcMIJDr2', '5b64c09a52788', 'active', '', '2018-08-03 20:52:42', '2018-08-03 13:53:12'),
(198, 5, 2, '089643124910', '$2y$10$q1D2Y3shLxSTLww4LaSrDeiGYoLMkp6QjZHXUDW27MZshqGQ8R6vq', '5b64c0a07f008', 'active', '', '2018-08-03 20:52:48', '2018-08-08 21:46:29'),
(199, 5, 2, '081807803435', '$2y$10$0UbxPQrkgCz1ROOE8Tdg2Oandh8lhfeRi1nMFb9iGUuP8Mzxn.Wxq', '5b64c0a849ae8', 'active', '', '2018-08-03 20:52:56', '2018-08-03 14:02:19'),
(200, 5, NULL, '0895359315084', '$2y$10$ArhcAIGxS5I5WoYTfOc2.u7lNA9l97DrJ.4R9G/iv6xLTK7VkcH4u', '5b64c0d600fa0', 'active', '', '2018-08-03 20:53:42', '2018-08-03 20:53:42'),
(201, 5, 2, '085966106487', '$2y$10$ZloBGGRClryGn5BZUcf0BeyDkYwrvYnUnaNCxOWqXmZbEIfd5YLOW', '5b64c1102e7c0', 'active', '', '2018-08-03 20:54:40', '2018-08-03 14:02:24'),
(202, 5, 2, '0895610434549', '$2y$10$L4geBB23QIwgAzwMnb9pLOuLGk15KCuZuvfGd6DVzhkg8XBElhSBa', '5b64c1296c1b0', 'active', '', '2018-08-03 20:55:05', '2018-08-03 14:02:30'),
(203, 5, NULL, '089643124910', '$2y$10$eDOUhtsErN/5iGC3X3AcHeh0O8l5qhtytMPonZgvyAkbuWbnks6RO', '5b64c1310c800', 'active', '', '2018-08-03 20:55:13', '2018-08-03 20:55:13'),
(204, 5, 2, '082111836055', '$2y$10$NjzRr0gaYhzFC7JmD72fY.qX1btHFxaGC76DOkHu/fbtJdvdKUDKC', '5b64c17550aa0', 'active', '', '2018-08-03 20:56:21', '2018-08-03 14:02:35'),
(205, 5, 2, '082261060171', '$2y$10$2Pa5uaCkKSWc9N3r.HseyO2D5oCJhWrn.q77Jzw7HVvvEGHksyrgi', '5b64c1e9410a0', 'active', '', '2018-08-03 20:58:17', '2018-08-03 14:02:39'),
(206, 5, 2, '085217763975', '$2y$10$.k7J3XVjunc.7LZzNZkeYekJRvDnGP78KZtk3thnGBbyTWPaui9gK', '5b64c230dec10', 'active', '', '2018-08-03 20:59:28', '2018-08-03 14:02:43'),
(207, 5, 2, '087871086937', '$2y$10$RovzOOo2qdF3wvpOsG3mB.Zyy7BLcBDiBvo/jy7uHV5D1ZHu4UTHO', '5b64c265291d0', 'active', '', '2018-08-03 21:00:21', '2018-08-03 14:01:35'),
(208, 5, 2, '0895635066173', '$2y$10$aM.xaRFUSlnlHJ0fpELR8eGSwPX004HdDl9tJMA6RHT9Qmq9S1lFC', '5b64c307c2308', 'active', '', '2018-08-03 21:03:03', '2018-08-09 22:55:54'),
(209, 5, 2, '6282246641853', '$2y$10$n.6N6b/NWoLk4nNlhb79O.1nyE2u6r.TN6ebl9MkpxnKPGQggXbaa', '5b64c377ab7c0', 'active', '', '2018-08-03 21:04:55', '2018-08-03 14:05:48'),
(210, 5, NULL, '6381290377693', '$2y$10$Aa6owzOKVu53Cu.bRGOmSOWGYSe9nJ8Khqr8NnJxFbktl/njO1X.i', '5b64c3ec05780', 'active', '', '2018-08-03 21:06:52', '2018-08-03 21:06:52'),
(211, 5, 2, '081219251267', '$2y$10$7Ws49AMksstVr1a9Zqyqt.XuFIL.ASpDilPe.RjEaXeaWZdUpRB1y', '5b64c44a47248', 'active', '', '2018-08-03 21:08:26', '2018-08-08 21:52:42'),
(212, 5, 2, '6281290377693', '$2y$10$Yh9XIjjNV3xmF4dtyU72jeNvhAd0WuIqIgJWioBrLuO.nv7VihNWy', '5b64c492e0b50', 'active', '', '2018-08-03 21:09:38', '2018-08-03 14:16:47'),
(213, 5, 2, '081776637584', '$2y$10$bd5vKAa15WbUXkihgnKWEO6p3nJZPSZ3rer3cyImrY9Qb4ItovJKG', '5b64c67146690', 'active', '', '2018-08-03 21:17:37', '2018-08-10 02:34:03'),
(214, 5, 2, '085888987052', '$2y$10$yOkck7nBSJol6JEsJwTGtewXQQAtTPNjnzKx8kQ.8VHnChVWUwuWe', '5b64c68e97b58', 'active', '', '2018-08-03 21:18:06', '2018-08-08 17:02:37'),
(215, 2, 2, '083812315474', '$2y$10$11fZHzpcrx6GQaAIIy/ZTuYaLdKkZ6NJSnb8fAMHj3g5q/Zg8Emw2', '5b64db7858228', 'active', '', '2018-08-03 22:47:20', '2018-08-03 22:47:20'),
(216, 5, 2, '085647119020', '$2y$10$jlGbIvdArylrNiPSe8HRvO8TaAUBBohslYiFCnWyKSZAWV3a6vgtW', '5b64dcd785d68', 'active', '', '2018-08-03 22:53:11', '2018-08-07 16:46:05'),
(217, 5, NULL, '085647119020', '$2y$10$jP0jzbKc1VAGf2WorW.eke89lALdkQ/9vCjPQnOQkFwKmW.eXBqUe', '5b64dd58d7f78', 'active', '', '2018-08-03 22:55:20', '2018-08-03 22:55:20'),
(218, 2, 2, '082297359558', '$2y$10$f5WbtiCWwB.Fu0OcBxQvZObsuM.ksC86TD1IqwNuQXRENFHm55Ji6', '5b653dfdaaf28', 'active', '', '2018-08-04 05:47:41', '2018-08-04 05:47:41'),
(219, 2, 2, '+62895359315084', '$2y$10$AijW2R26MhMceoKroGGAH.nNdSpuke.rhIl0i92kVVK38XI50QHHS', '5b656cc71f8b0', 'active', '', '2018-08-04 09:07:19', '2018-08-04 09:07:19'),
(220, 5, 2, '082211757551', '$2y$10$9SYoGC9piYBEolCnOQSEnepEOIa4O/My7ViobW0JB.fP/EEZbNnkS', '5b6575a26ddd0', 'active', '', '2018-08-04 09:45:06', '2018-08-07 16:46:12'),
(221, 2, 2, '089601203108', '$2y$10$NrelgZaYuw7jnzDQZck8GuzlagjNyiksOk9w3VRgkXQKiyUeT.sAa', '5b66512ed7eb0', 'active', '', '2018-08-05 01:21:50', '2018-08-05 01:21:50'),
(222, 2, 2, '082110469103', '$2y$10$uXa.GsBjxkmJn6jfLMKNbOQ4jfCb3Bz1aQtE24N4tU08eGTzYaxZi', '5b66296eeb348', 'active', '', '2018-08-04 22:32:14', '2018-08-04 22:32:14'),
(223, 2, 2, '085886588539', '$2y$10$twF5uA.FQ93f4grPJ9Uc6uCRvLr0w3ww8sxuDceg7BKag.lnpb9DK', '5b663b559fb78', 'active', '', '2018-08-04 23:48:37', '2018-08-04 23:48:37'),
(224, 5, NULL, '+62895359315084', '$2y$10$vPhxdnHsg/08QpKeYXYNs.9OBBSZgfPTwNLZAs350niJQzvTaXXsq', '5b663d63728d0', 'active', '', '2018-08-04 23:57:23', '2018-08-04 23:57:23'),
(225, 5, 1, '089516748484', '$2y$10$4Jaa9AgjwPMbrqGt7MrASutKWnz.qwE/HHh3.fgRiyoOVCBeHJOCK', '5b669ae91b3f0', 'active', '', '2018-08-05 06:36:25', '2018-08-07 16:46:18'),
(226, 5, 1, '085221241572', '$2y$10$Ck2UKNWz9iF44TJeTyCssuf.fv4K5QhW5yoGWxvAZP.yjnF862yJu', '5b6795d34af38', 'active', '', '2018-08-06 00:26:59', '2018-08-07 16:45:59'),
(227, 2, 1, '087786697865', '$2y$10$uFLHwYjXzWNfjOqgfO9BZuh5bu1gNxUfHhhdC5ZPGVefpjWLB483.', '5b67dff893760', 'active', '', '2018-08-06 05:43:20', '2018-08-06 05:43:20'),
(228, 2, 1, '089653598424', '$2y$10$F1kscwGoOKJrnVpSCGoAwe2QjGJXY7LpI2SfngMiTOhTjbFgK1ZOi', '5b67e13500c80', 'active', '', '2018-08-06 05:48:37', '2018-08-06 05:48:37'),
(229, 5, 2, '089683585804', '$2y$10$ThCWSRK50LROlAYQdtW0a.pbglnbrwMTAxJZRVCjtUQF1i49FHQcq', '5b689a1f95a88', 'active', '', '2018-08-06 18:57:35', '2018-08-06 13:29:08'),
(230, 5, 1, '085216535709', '$2y$10$.OclO61hUNUgcC4V01SUIeVrs/qLryeEuV7w.9/cFHXpzk0OEWfsm', '5b68bb1530890', 'active', '', '2018-08-06 21:18:13', '2018-08-07 16:46:23'),
(231, 2, 1, '089650999913', '$2y$10$M6ZqN0IMOdxcH5uxQ4PmxOPeuHP7me4a2F.68GClsP7UrFz0NzpHa', '5b690809883b0', 'active', '', '2018-08-07 02:46:33', '2018-08-07 02:46:33'),
(232, 2, 1, '085216198224', '$2y$10$D0b6B8dKCi2vsLBoIFCZFezUHXVA2lNoaJ2Lne9Unr0BUzyy8532S', '5b690a19d59f8', 'active', '', '2018-08-07 02:55:21', '2018-08-07 02:55:21'),
(233, 5, 2, '083891278390', '$2y$10$oMQtE4zfd40/MXgKZWGi9OQ00IVSeJ7NPicwSy733tC0IlT5qlNEa', '5b692981a8f20', 'active', '', '2018-08-07 05:09:21', '2018-08-09 02:19:37'),
(234, 5, 2, '081293551308', '$2y$10$sObuxqSzww1B64Gq5ufUB.nbg7J4vm6dFwdJvdTZrxsa09bJkE9DG', '5b692994032c8', 'active', '', '2018-08-07 05:09:40', '2018-08-08 06:54:55'),
(235, 2, 2, '0895338166669', '$2y$10$FKPwTEBVax3//TIbSRLg4exoBgjwk.H8FceUnY.EYHziYZq2tlofK', '5b692f331dc90', 'active', '', '2018-08-07 05:33:39', '2018-08-07 05:33:39'),
(236, 5, 1, '089604462054', '$2y$10$dJpWxqHy4sqtcEBKAHljfeGbB2jrKIMeAAt.AuNqvFAQ6ksohSBpK', '5b6a3135cd140', 'active', '', '2018-08-07 23:54:29', '2018-08-07 16:55:47'),
(237, 2, 1, '0896044620542', '$2y$10$H9QjuwllOddu3wM7syj.OOAeQGKz2BqZgXhtiEAV7TeZgVlnBheOW', '5b6a34f205208', 'active', '', '2018-08-08 00:10:26', '2018-08-08 00:10:26'),
(238, 2, 1, '081911097638', '$2y$10$n0eTKqgRgn01B03Dd2NS7OmLliFS.uXVWS3OzMFYzC5mtGKktmrGW', '5b6a35b191438', 'active', '', '2018-08-08 00:13:37', '2018-08-08 00:13:37'),
(239, 2, 1, '081314077129', '$2y$10$k/R8O.V4.dTXb4vx6sX3jOZfkbvZgmHl51aRBu1XaSmf53wDX97GS', '5b6a64d5a7940', 'active', '', '2018-08-08 03:34:45', '2018-08-08 03:34:45'),
(240, 2, 1, '081314077126', '$2y$10$mOMu69BaF2UYbnLK8dd5QuV4YuC1mjVjS.Sj24Y5JCSq5fqYQD8Sy', '5b6a68c20db88', 'active', '', '2018-08-08 03:51:30', '2018-08-08 03:51:30'),
(241, 5, 2, '085776182179', '$2y$10$WejgHhCNmi8GucMRx9OMw.z7WZCFFHdexjTEMaM0aR2oHVJQBJmaq', '5b6a783689670', 'active', '', '2018-08-08 04:57:26', '2018-08-08 18:29:22'),
(242, 2, 2, '081317446797', '$2y$10$uG5xydFPsvdyMV/4URXFPeEq5sjkl5QO7jKJBOGxHwGXyeI79qeYe', '5b6a7f977a9b8', 'active', '', '2018-08-08 05:28:55', '2018-08-08 05:28:55'),
(243, 2, 2, '083895728811', '$2y$10$ptubZ7Ukuw7MWGmd19YOiODRN/egQui88.mG1Xu/zq3Nl1JT38Mxi', '5b6a85a0d5548', 'active', '', '2018-08-08 05:54:40', '2018-08-08 05:56:57'),
(244, 5, 2, '081517012605', '$2y$10$6mvCWKk5yce07ioVq5e3DeZpMF8sv8ACgG0Lc6QBeQwVLyrVt.iEK', '5b6a87d75f8e8', 'active', '', '2018-08-08 06:04:07', '2018-08-09 00:53:52'),
(245, 5, NULL, '089528121176', '$2y$10$JEHr32tSCTZmN0/q9c3nQOgJpWIwjGkwldkTXuNV4yYM.6DV.0NvO', '5b6aa0877a1e8', 'inactive', '', '2018-08-08 07:49:27', '2018-08-08 07:49:27'),
(246, 5, NULL, '089528121176', '$2y$10$9eFoGgcwaYZvKheQelyQ2O45dtbn80ixVTwFpU.D7XiPhenMG1Eg.', '5b6aa0ed76368', 'active', '', '2018-08-08 07:51:09', '2018-08-08 07:51:09'),
(247, 2, 2, '081383840480', '$2y$10$5ObqIOySRMYCzHiV/iJqUe3OUiC48lNh.Fqro6P54Jj.4N5TLOyMy', '5b6ab7aaac058', 'active', '', '2018-08-08 09:28:10', '2018-08-08 09:28:10'),
(248, 2, 2, '085778771394', '$2y$10$4u86FAEvDwX0Stacqrgge.PExNAUfDftSuH8uihhUAm6AKavoNW.G', '5b6ab89572e48', 'active', '', '2018-08-08 09:32:05', '2018-08-08 09:32:05'),
(249, 2, 2, '081911167905', '$2y$10$1A7nQmGiOZT5vamG0pNggueyD/7tMNt0oBrYhPp0PaUutnFO2S0Ia', '5b6b2912222e0', 'active', '', '2018-08-08 17:32:02', '2018-08-08 17:32:02'),
(250, 2, 2, '083870045193', '$2y$10$8NFV3YJ7bgX5Z7RVXAk9YOhKZMShh/qeeeUUdZ55bcV/C1wIwhNJ.', '5b6b2a4c1e848', 'active', '', '2018-08-08 17:37:16', '2018-08-08 17:37:16'),
(251, 2, 2, '089653658997', '$2y$10$0GAWb4xzOesIE8s5.UIT4OdkuiYd77h06KkbJUwZsUpulSLSMwECO', '5b6b3218f26e8', 'active', '', '2018-08-08 18:10:33', '2018-08-08 18:10:33'),
(252, 5, 2, '081311268339', '$2y$10$eR5NFk1ym6Lqp5cVksL8COla7FUetMG8v.VBUdd2kGnhNJXQz58SW', '5b6b347ae1578', 'active', '', '2018-08-08 18:20:42', '2018-08-08 18:30:45'),
(253, 2, 2, '085717136233', '$2y$10$4db16WZXzOE.MLD2YsqIyeeoZSCKgFWy1x.u0gG4h8nqOrTtR4Jlq', '5b6b35252fda0', 'active', '', '2018-08-08 18:23:33', '2018-08-08 18:23:33'),
(254, 2, 2, '081311802920', '$2y$10$xbihQbySwvGBu8TtO8MQrOjkeR2fCA2GxOhxUqSH3Dl9tsNY/U1km', '5b6b35df8f8e0', 'active', '', '2018-08-08 18:26:39', '2018-08-08 18:26:39'),
(255, 5, 2, '081219791097', '$2y$10$oUgHrLHybkzMkUEqpfWcnO9LwgHKfKFMBgn.OkBPFOKU1/7ozStca', '5b6b3b28e9278', 'active', '', '2018-08-08 18:49:12', '2018-08-08 11:50:21'),
(256, 2, 2, '082364270684', '$2y$10$uEQEh8Q0tHE399bP/fczveaugpVwUlpGuJRlqItRQ8G65WHWWcGN6', '5b6b3d0734fa8', 'active', '', '2018-08-08 18:57:11', '2018-08-08 18:57:11'),
(257, 2, 1, '085669699284', '$2y$10$6WUZySSN/SRpIYQMNptFcuGCC58s7vKzYwrlkkLAe58HXkCJGT3lO', '5b6b4c3cdc758', 'active', '', '2018-08-08 20:02:04', '2018-08-08 20:02:04'),
(258, 5, 2, '08111101591', '$2y$10$WO7Xo/c54zGcD9M5fHG5pO/v5bs.QsORFpOBhk8NPfbCz05SNA8my', '5b6b50081e460', 'active', '', '2018-08-08 20:18:16', '2018-08-08 13:18:48'),
(259, 2, 2, '081283878730', '$2y$10$o130udzJT95247Udp8aexOmVPNeVxtGdqScjzg2hga/PtafYg.J5O', '5b6b521b0cb20', 'active', '', '2018-08-08 20:27:07', '2018-08-08 20:27:07'),
(260, 5, 1, '087874151777', '$2y$10$9M6FN/09jYCnU0WlzWDZwe9QrbBBrrEw2.m4GmEkGpYarEIqmchxu', '5b6b5e80343f0', 'active', '', '2018-08-08 21:20:00', '2018-08-08 15:08:26'),
(261, 2, 2, '081294373277', '$2y$10$YeC5NFWxVXSLHKtT0iFuLOkv1SWa.u/Zlw1uPY94N1pH0NOKzonbi', '5b6b67615f758', 'active', '', '2018-08-08 21:57:53', '2018-08-08 21:57:53'),
(262, 5, 1, '085319355475', '$2y$10$Dw1qKMW.lrqrmyqUbLiAk.7/8dF6C9itjXEKLrBFWxFqc43m6kife', '5b6b71b2877f8', 'active', '', '2018-08-08 22:41:54', '2018-08-08 16:05:55'),
(263, 5, NULL, '085319355475', '$2y$10$.fuvJikaRzV4QXgVH9FirOIhOzXnsaOACzgYOR09qDen1GtNyprEu', '5b6b71ec14e60', 'active', '', '2018-08-08 22:42:52', '2018-08-08 22:42:52'),
(264, 2, 1, '081297260824', '$2y$10$EDGEsTgGeybi1LT2.hQBtuxuTTLwhP3znIvH.i8ZBm09PhWWNSkyi', '5b6b7be4364c0', 'active', '', '2018-08-08 23:25:24', '2018-08-08 23:25:24'),
(265, 2, 1, '087888953722', '$2y$10$U9kR2OxZgPptBa/e9HLPIe8Ud59li9QeA8D8.J9adyiqi96zdqTuK', '5b6b9228df7c8', 'active', '', '2018-08-09 01:00:24', '2018-08-09 01:00:24'),
(266, 5, NULL, '081314077124', '$2y$10$2SDcQylQThIWbwTKycGCuudh1nIETF5TwsWJaHvBtMe9U/5WXv.em', '5b6b937f3c668', 'inactive', '', '2018-08-09 01:06:07', '2018-08-09 01:06:07'),
(267, 5, NULL, '081314077121', '$2y$10$9XQczBKpA5jsWyS49Fvf4.Jrojnrofruicmkzp6PJ8YMIw6mwFHHm', '5b6b959d2c0b0', 'inactive', '', '2018-08-09 01:15:09', '2018-08-09 01:15:09'),
(270, 2, 2, '08121957740', '$2y$10$J2mFyW0ar5t.FmyRH0TorOm5gfE8wSdo0UEMNMu7QDiG6oznU3MOW', '5b6bb6b31c6b0', 'active', '', '2018-08-09 03:36:19', '2018-08-10 00:31:37'),
(271, 2, NULL, '0895635318744', '$2y$10$0/2GgCxMuOQTsJUpB.pqtOs1qOJJa8dMOFt8UK3bi7nieEOhRMgBO', '5b6bb9c6bb990', 'active', '', '2018-08-09 03:49:26', '2018-08-09 03:49:26'),
(278, 5, 2, '082111099090', '$2y$10$FwQ/ZGbCQJDEER26sB5ZsOUEzwq5ghfxnjPUCfJ8KMk75DCBZjU/O', '5b6c0d4bafbb8', 'active', '', '2018-08-09 09:45:47', '2018-08-09 13:24:04'),
(279, 2, 1, '087871451176', '$2y$10$vTsDJ1dodC6bgdpbjO7pwerlVLsA5KZ6/34KqgyJNwCa5YftBMthK', '5b6c90b7f15b8', 'active', '', '2018-08-09 19:06:31', '2018-08-09 19:06:31'),
(281, 2, 2, '085775841707', '$2y$10$8MXMEGpsVeEpMvbCx8gKy.LZeJdnintG1EjrKHYIcBB47HFYMdBD2', '5b6c9651dea80', 'active', '', '2018-08-09 19:30:25', '2018-08-09 19:40:00'),
(282, 2, 2, '0895340817006', '$2y$10$R63GsydDv.02Y0oaCRuv9.Ho93SU9FxJKT8hFKsL5BjwHBiMnZ9eC', '5b6c9eb76fc48', 'active', '', '2018-08-09 20:06:15', '2018-08-09 20:06:15'),
(283, 2, 2, '087898677534', '$2y$10$e7K2TYNOlPLOjLUefA/9Meku2CKIbCugeiSqogj5EpFIF6P4nUnE6', '5b6cb5dc8d4f0', 'active', '', '2018-08-09 21:45:00', '2018-08-09 21:45:00'),
(284, 2, 1, '081807106050', '$2y$10$0NN9ZmOS1shFGQAiibvlCuy4kwfPcYPIZeQTZ49l5KGFHZzlLSkRy', '5b6ce7ff90ba0', 'active', '', '2018-08-10 01:18:55', '2018-08-10 01:18:55'),
(285, 2, 1, '0858-9368-6185', '$2y$10$xqbE0ibIxUlY1a20uITm..dne5msRhutxrFZtCvCJGClqmKbAedMe', '5b6cebe95fe60', 'active', '', '2018-08-10 01:35:37', '2018-08-10 01:36:38'),
(286, 2, 2, '081316497057', '$2y$10$8pWSY4s1yyKemcOVMkBoo.uqYdVt/8cqMkL/gvny8SYxmjIEIf34q', '5b6d061e5e6f0', 'active', '', '2018-08-10 03:27:26', '2018-08-10 03:27:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `verify_code`
--

CREATE TABLE `verify_code` (
  `id` int(11) NOT NULL,
  `otp` varchar(150) NOT NULL,
  `hash` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `verify_code`
--

INSERT INTO `verify_code` (`id`, `otp`, `hash`, `created_at`, `updated_at`) VALUES
(1, '18776', '$2y$10$Q7/3nXmAP7M5P2GCkzGcpumbTcizeVtDhmbyrErdmTYBcqdyXjtwq', '2018-08-09 05:26:16', '2018-08-09 05:26:16'),
(2, '36076', '$2y$10$N.ddz8wy59wkEDfpBtFbkOrK36Mg0Or2XCh0p6IAMYXRPZVfOUuP6', '2018-08-09 05:32:36', '2018-08-09 05:32:36'),
(3, '79158', '$2y$10$LAAiOkPE6q6vjkr8.zeOMuLIZFEntntZmnC6Zl4ADwHCh2cO6Mgva', '2018-08-09 05:33:22', '2018-08-09 05:33:22'),
(4, '83402', '$2y$10$0R9O1pHnIaV9HWGw.6VDrunYxIbqG9FJ/C/RyGksaWH5Y7tQH0wWy', '2018-08-09 06:59:31', '2018-08-09 06:59:31'),
(5, '99742', '$2y$10$30eVOXbjDw/wv4EFa0m3oO5.xdEF2s/WtIIssXkg6D2Bmgp5F0Kpy', '2018-08-09 10:10:18', '2018-08-09 10:10:18'),
(9, '68963', '$2y$10$5JfM4NqvH3y5vT6GAm/4UegM4tU2fJ0WZ1I3laU6C3cgk0dGEX.Oe', '2018-08-09 03:25:58', '2018-08-09 03:25:58'),
(10, '86566', '$2y$10$pBwzds1VMGvvvBtQ7fx9U.BYfzUEv.H2KuOkjFMlT9g0OHMHM.oPu', '2018-08-09 03:26:31', '2018-08-09 03:26:31'),
(11, '95899', '$2y$10$tyyV7h3vprcC/nKx5nlGx.j1m8JstmlR20Rg7jkwiQ/nNHVPUOlXq', '2018-08-09 03:36:20', '2018-08-09 03:36:20'),
(13, '27968', '$2y$10$96Vi8EYEscFYUL2D61GVPuOEUlQYydqc6n1MyepGYtGdx/DdA1eeu', '2018-08-09 03:42:33', '2018-08-09 03:42:33'),
(14, '70246', '$2y$10$HlfhRvmZxFF9sNxCkxj2feobaWOC7o28naWQKoHn/ketL9F4tbysi', '2018-08-09 03:43:35', '2018-08-09 03:43:35');

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
(51, 102, 1923, 5272, 'Komisi Agen', '2018-08-01 03:24:14', '2018-08-01 03:24:14'),
(52, 1, 9158, 756792, 'Komisi Agen', '2018-08-03 21:37:08', '2018-08-03 21:37:08'),
(53, 102, 500000, 505272, 'Plafon Kredit', '2018-08-06 01:25:29', '0000-00-00 00:00:00'),
(54, 102, 100000, 605272, 'Bonus Khusus Dari GrosirOne', '2018-08-06 01:25:29', '0000-00-00 00:00:00'),
(55, 105, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:30:15', '0000-00-00 00:00:00'),
(56, 106, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(57, 125, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(58, 98, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(59, 115, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(60, 108, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(61, 100, 500000, 500000, 'Plafon Kredit', '2018-08-06 01:35:13', '0000-00-00 00:00:00'),
(62, 33, 10000, 20000, 'Topup Wanee', '2018-08-09 01:12:37', '2018-08-09 01:12:37'),
(63, 33, 5000, 20000, 'Topup Wanee', '2018-08-09 01:25:25', '2018-08-09 01:25:25'),
(64, 33, 5000, 10400, 'Topup Wanee', '2018-08-09 01:31:17', '2018-08-09 01:31:17'),
(65, 33, 941, 6341, 'Komisi Agen', '2018-08-09 01:40:12', '2018-08-09 01:40:12'),
(66, 214, 19338, 645438, 'Komisi Agen', '2018-08-09 21:17:30', '2018-08-09 21:17:30'),
(67, 234, 2572, 951322, 'Komisi Agen', '2018-08-09 23:27:17', '2018-08-09 23:27:17'),
(68, 33, 0, 510341, 'Komisi Agen', '2018-08-09 23:52:42', '2018-08-09 23:52:42'),
(69, 102, 7326, 487198, 'Komisi Agen', '2018-08-10 00:50:06', '2018-08-10 00:50:06'),
(70, 102, 5155, 492353, 'Komisi Agen', '2018-08-10 00:50:13', '2018-08-10 00:50:13'),
(71, 167, 0, 903250, 'Komisi Agen', '2018-08-10 01:00:21', '2018-08-10 01:00:21'),
(72, 167, 588, 903838, 'Komisi Agen', '2018-08-10 01:00:28', '2018-08-10 01:00:28'),
(73, 167, 7326, 754764, 'Komisi Agen', '2018-08-10 01:11:50', '2018-08-10 01:11:50'),
(74, 214, 8644, 528082, 'Komisi Agen', '2018-08-10 01:29:28', '2018-08-10 01:29:28'),
(75, 214, 22089, 268171, 'Komisi Agen', '2018-08-10 02:43:36', '2018-08-10 02:43:36'),
(76, 233, 14052, 766852, 'Komisi Agen', '2018-08-10 03:09:14', '2018-08-10 03:09:14');

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
(17, 1, 50000, 881134, 'process', '2018-08-01 11:20:47', '2018-08-01 11:20:47'),
(18, 1, 100000, 881134, 'process', '2018-08-02 21:43:52', '2018-08-02 21:43:52'),
(19, 1, 100000, 756792, 'process', '2018-08-03 21:41:24', '2018-08-03 21:41:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `agen`
--
ALTER TABLE `agen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banner_promo`
--
ALTER TABLE `banner_promo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barcode`
--
ALTER TABLE `barcode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fcm`
--
ALTER TABLE `fcm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `incentive_category`
--
ALTER TABLE `incentive_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_billing_detail`
--
ALTER TABLE `order_billing_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_cancel`
--
ALTER TABLE `order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `progress_status`
--
ALTER TABLE `progress_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `purchase_order_cancel`
--
ALTER TABLE `purchase_order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfer_order_cancel`
--
ALTER TABLE `transfer_order_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfer_order_detail`
--
ALTER TABLE `transfer_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `verify_code`
--
ALTER TABLE `verify_code`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `voucher_use`
--
ALTER TABLE `voucher_use`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wanee_history`
--
ALTER TABLE `wanee_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `agen`
--
ALTER TABLE `agen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT untuk tabel `banner_promo`
--
ALTER TABLE `banner_promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barcode`
--
ALTER TABLE `barcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT untuk tabel `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=567;

--
-- AUTO_INCREMENT untuk tabel `cash`
--
ALTER TABLE `cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT untuk tabel `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT untuk tabel `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `family`
--
ALTER TABLE `family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT untuk tabel `incentive_category`
--
ALTER TABLE `incentive_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT untuk tabel `order_billing_detail`
--
ALTER TABLE `order_billing_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT untuk tabel `order_cancel`
--
ALTER TABLE `order_cancel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT untuk tabel `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `progress_status`
--
ALTER TABLE `progress_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchase_order_cancel`
--
ALTER TABLE `purchase_order_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock_adjustment`
--
ALTER TABLE `stock_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT untuk tabel `store`
--
ALTER TABLE `store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transfer_order_cancel`
--
ALTER TABLE `transfer_order_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transfer_order_detail`
--
ALTER TABLE `transfer_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT untuk tabel `verify_code`
--
ALTER TABLE `verify_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `voucher_use`
--
ALTER TABLE `voucher_use`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `wanee_history`
--
ALTER TABLE `wanee_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
