-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: mueeny
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

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
-- Table structure for table `action_events`
--

DROP TABLE IF EXISTS `action_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_id` bigint unsigned NOT NULL,
  `target_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned DEFAULT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `changes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  KEY `action_events_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_events`
--

LOCK TABLES `action_events` WRITE;
/*!40000 ALTER TABLE `action_events` DISABLE KEYS */;
INSERT INTO `action_events` VALUES (1,'96dc3f84-f85a-4f1b-8c30-b25019982744',1,'Create','App\\Models\\CategoryNova',1,'App\\Models\\CategoryNova',1,'App\\Models\\CategoryNova',1,'','finished','','2022-07-25 00:30:26','2022-07-25 00:30:26',NULL,'{\"name_en\":\"Test\",\"name_ar\":\"Testtt\",\"active\":\"1\",\"partner\":\"0\",\"position\":\"1\",\"parent_id\":null,\"updated_at\":\"2022-07-25T05:30:26.000000Z\",\"created_at\":\"2022-07-25T05:30:26.000000Z\",\"id\":1}'),(2,'96dc43ea-d311-4daf-88a4-42173398d6c0',1,'Create','App\\Models\\SupportTicketNova',1,'App\\Models\\SupportTicketNova',1,'App\\Models\\SupportTicketNova',1,'','finished','','2022-07-25 00:42:44','2022-07-25 00:42:44',NULL,'{\"name\":\"asd\",\"message\":\"qwe\",\"status\":\"0\",\"support_reason_id\":4,\"user_id\":306,\"updated_at\":\"2022-07-25T05:42:44.000000Z\",\"created_at\":\"2022-07-25T05:42:44.000000Z\",\"id\":1}'),(3,'96dc4cd4-f39f-4896-bf08-496ba54e396d',1,'Update','App\\Models\\WelcomeScreenNova',4,'App\\Models\\WelcomeScreenNova',4,'App\\Models\\WelcomeScreenNova',4,'','finished','','2022-07-25 01:07:39','2022-07-25 01:07:39','{\"image\":\"1647951610174968.jpg\",\"active\":0}','{\"image\":\"uploads\\/welcome_screens\\/J7RzSqiVCfjt1ueVQh2NSoGjSGgTouzccBtSZ0W5.png\",\"active\":1}');
/*!40000 ALTER TABLE `action_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(10,8) NOT NULL,
  `lng` double(10,8) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (167,1,'3399 Ali Al Mufidi, Ar Rayyan, Riyadh 14211 8219, Saudi Arabia',24.71465683,46.77560043,190,'2022-04-14 11:11:21','2022-04-14 11:11:21'),(168,1,'حي, 7456 Hasan Ibn Mashari Ibn Saud, Al Mutamarat, Riyadh 12711 3487, Saudi Arabia',24.66950417,46.68317413,191,'2022-04-14 11:13:03','2022-04-14 11:13:03'),(169,1,'4546 Abi Abdullah Ash Shihab, Ash Sharafiyah, Riyadh 12724 7423, Saudi Arabia',24.66216278,46.66814423,196,'2022-04-17 14:31:20','2022-04-17 14:31:20'),(170,1,'3373 Ali Al Mufidi, Ar Rayyan, Riyadh 14211 8131, Saudi Arabia',24.71409035,46.77516556,197,'2022-04-17 14:37:41','2022-04-17 14:37:41'),(171,1,'3996 ابو المعالي الكتبي، حي عكاظ، Riyadh 14726 7091, Saudi Arabia',24.51124954,46.68476105,198,'2022-04-17 17:06:23','2022-04-17 17:06:23'),(172,1,'2391 Abd Al Khalek Al Sanbati, حي المصيف، Riyadh 12467 7379, Saudi Arabia',24.76590919,46.67217636,199,'2022-04-19 16:11:56','2022-04-19 16:11:56'),(173,1,'حي, 7848 Al Ruwaishid, Ulaishah, Riyadh 12746 2570, Saudi Arabia',24.62962914,46.68067932,200,'2022-04-20 12:54:41','2022-04-20 12:54:41'),(175,1,'JH9H+JRF, Hijratlaban, Riyadh 14911, Saudi Arabia',24.61953735,46.58087158,202,'2022-04-21 05:19:07','2022-04-21 05:19:07'),(176,1,'3399 Ali Al Mufidi, Ar Rayyan, Riyadh 14211 8219, Saudi Arabia',24.71467209,46.77560043,203,'2022-04-21 05:22:34','2022-04-21 05:22:34'),(177,1,'8105 Khalid Al Hakim, حي الربوة، Riyadh 12813 3714, Saudi Arabia',24.69735718,46.74016190,213,'2022-04-24 07:24:17','2022-04-24 07:24:17'),(178,1,'Unnamed Road, Hijratlaban, Riyadh 12946, Saudi Arabia',24.62274170,46.58743286,214,'2022-04-24 07:28:58','2022-04-24 07:28:58'),(179,2,'6635 الحكم المستنصر بالله، Al Khaleej, Riyadh 13223 4219, Saudi Arabia',24.76234800,46.79796600,214,'2022-04-24 07:36:15','2022-04-24 07:36:15'),(180,1,'6836, Riyadh 13783 2457, Saudi Arabia',24.60181618,46.54460144,215,'2022-04-25 08:07:50','2022-04-25 08:07:50'),(181,1,'6744 منديل بن داود، Al Maazer, Riyadh 12714 2244, Saudi Arabia',24.66342163,46.67069626,216,'2022-04-25 08:10:43','2022-04-25 08:10:43'),(182,2,'19211, Saudi Arabia',23.88590000,45.07920000,216,'2022-04-25 08:20:49','2022-04-25 08:20:49'),(183,1,'4559 البرق، Ash Sharafiyah, Riyadh 12724 7467, Saudi Arabia',24.66245079,46.66871262,217,'2022-04-26 09:14:04','2022-04-26 09:14:04'),(184,1,'3399 Ali Al Mufidi, Ar Rayyan, Riyadh 14211 8219, Saudi Arabia',24.71469347,46.77564517,218,'2022-04-26 09:17:07','2022-04-26 09:17:07'),(185,2,'3406 علي المفيدي، حي الريان، Riyadh 14211 8207, Saudi Arabia',24.71465905,46.77562639,218,'2022-04-26 09:22:59','2022-04-26 09:22:59'),(186,2,'3377 Wadi Ar Rimmah, Ar Rayyan, Riyadh 14211 8205, Saudi Arabia',24.71461520,46.77547719,218,'2022-04-26 10:11:03','2022-04-26 10:11:03'),(187,1,'3377 Wadi Ar Rimmah, Ar Rayyan, Riyadh 14211 8205, Saudi Arabia',24.71462403,46.77549362,219,'2022-04-26 10:16:08','2022-04-26 10:16:08'),(188,1,'6743 Al Foursan, Al Hada, Riyadh 12726 3179, Saudi Arabia',24.65577888,46.65505219,220,'2022-04-26 10:17:54','2022-04-26 10:17:54'),(189,2,'19211, Saudi Arabia',23.88590000,45.07920000,220,'2022-04-26 10:19:37','2022-04-26 10:19:37'),(190,2,'3377 Wadi Ar Rimmah, Ar Rayyan, Riyadh 14211 8205, Saudi Arabia',24.71461063,46.77546714,219,'2022-04-26 10:23:49','2022-04-26 10:23:49'),(191,1,'7793 رقم 59، حي العزيزية، الرياض 14515 3024، السعودية',24.57770538,46.75660324,221,'2022-04-29 11:14:15','2022-04-29 11:14:15'),(192,2,'19211, Saudi Arabia',23.88590000,45.07920000,217,'2022-05-01 09:11:14','2022-05-01 09:11:14'),(193,2,'19211, Saudi Arabia',23.88590000,45.07920000,217,'2022-05-01 09:13:46','2022-05-01 09:13:46'),(194,1,'19211، السعودية',23.88590050,45.07920074,222,'2022-05-04 04:33:56','2022-05-04 04:33:56'),(195,1,'25393، السعودية',21.89681816,39.57113647,223,'2022-05-06 15:57:42','2022-05-06 15:57:42'),(196,1,'6932، الرياض 13783 2744، السعودية',24.60342216,46.54789352,224,'2022-05-08 15:48:55','2022-05-08 15:48:55'),(197,2,'19211، السعودية',23.88590000,45.07920000,224,'2022-05-08 16:08:04','2022-05-08 16:08:04'),(198,2,'29245، السعودية',22.32204200,42.24726000,224,'2022-05-08 16:18:58','2022-05-08 16:18:58'),(199,1,'8456 جلوة، حي ظهرة لبن، Riyadh 13782 2614, Saudi Arabia',24.63987732,46.55012512,232,'2022-05-09 17:17:52','2022-05-09 17:17:52'),(200,1,'2483 جبة، حي ظهرة لبن، Riyadh 13782 8389, Saudi Arabia',24.63914299,46.54865646,233,'2022-05-09 17:20:56','2022-05-09 17:20:56'),(201,2,'19211, Saudi Arabia',23.88590000,45.07920000,235,'2022-05-12 05:28:15','2022-05-12 05:28:15'),(202,2,'19211, Saudi Arabia',23.88590000,45.07920000,236,'2022-05-12 05:39:05','2022-05-12 05:39:05'),(203,1,'8002, 4390, Al Hada, Riyadh 12921, Saudi Arabia',24.65028572,46.64381790,239,'2022-05-14 10:42:15','2022-05-14 10:42:15'),(204,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,217,'2022-05-14 14:48:09','2022-05-14 14:48:09'),(205,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,240,'2022-05-14 14:54:15','2022-05-14 14:54:15'),(206,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,240,'2022-05-14 14:59:54','2022-05-14 14:59:54'),(207,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,240,'2022-05-14 15:01:35','2022-05-14 15:01:35'),(208,1,'cairo, egypt',30.03333300,31.23333400,241,'2022-05-14 16:13:42','2022-05-14 16:13:42'),(209,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,243,'2022-05-15 07:56:52','2022-05-15 07:56:52'),(210,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,215,'2022-05-17 03:14:17','2022-05-17 03:14:17'),(211,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,213,'2022-05-17 03:28:48','2022-05-17 03:28:48'),(212,2,'18973, Saudi Arabia',23.12914700,43.58729600,244,'2022-05-17 04:48:58','2022-05-17 04:48:58'),(214,1,'حي, 8066 Al Jamouh Al Ansari, 4274, Umm Al Hamam Al Sharqi, Riyadh 12325, Saudi Arabia',24.69302400,46.65218700,250,'2022-05-18 19:26:44','2022-05-18 19:26:44'),(215,1,'7305 التخصصي، 3494, Al Olaya, Riyadh 12333, Saudi Arabia',24.69958305,46.66856384,251,'2022-05-18 19:30:05','2022-05-18 19:30:05'),(216,1,'7352 Abi Jafar Al Qurtubi, 2304, Almasiaf, Riyadh 12467, Saudi Arabia',24.76565170,46.67127609,252,'2022-05-19 03:11:24','2022-05-19 03:11:24'),(217,1,'4114 Ibn Sina, 7648, Al Muruj, Riyadh 12284, Saudi Arabia',24.76047897,46.67156982,255,'2022-05-19 04:38:40','2022-05-19 04:38:40'),(218,1,'7765 Al Jamilah, 4133, Al Muruj, Riyadh 12284, Saudi Arabia',24.76196289,46.67157745,256,'2022-05-19 04:49:51','2022-05-19 04:49:51'),(219,1,'7765 Al Jamilah, 4133, Al Muruj, Riyadh 12284, Saudi Arabia',24.76186562,46.67148972,257,'2022-05-19 04:54:45','2022-05-19 04:54:45'),(220,1,'7886 King Abdul Aziz Rd, 4110، حي المروج، Riyadh 12284, Saudi Arabia',24.76262856,46.67144775,260,'2022-05-19 06:13:56','2022-05-19 06:13:56'),(221,1,'7742 Al Jamilah, 4103, Al Muruj, Riyadh 12284, Saudi Arabia',24.76157761,46.67150497,261,'2022-05-19 06:18:55','2022-05-19 06:18:55'),(222,1,'3276 Wadi Ar Rimmah, 8226, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71463585,46.77420807,262,'2022-05-23 03:52:35','2022-05-23 03:52:35'),(223,1,'8217 Asfan, 2967، حي الريان، Riyadh 14211, Saudi Arabia',24.71455193,46.77161407,263,'2022-05-23 04:00:03','2022-05-23 04:00:03'),(224,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,263,'2022-05-23 05:10:28','2022-05-23 05:10:28'),(225,1,'2613 Yathreb, 8129, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71442986,46.76787567,264,'2022-05-23 10:34:00','2022-05-23 10:34:00'),(226,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,264,'2022-05-23 10:36:06','2022-05-23 10:36:06'),(227,1,'3399 Ali Al Mufidi, 8219, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71468163,46.77563095,265,'2022-05-23 11:02:40','2022-05-23 11:02:40'),(228,2,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140500,46.67437000,265,'2022-05-23 11:05:25','2022-05-23 11:05:25'),(229,1,'2382 الورد، 8185, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71435356,46.76550293,266,'2022-05-24 17:19:04','2022-05-24 17:19:04'),(230,1,'3399 Ali Al Mufidi, 8219, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71468163,46.77563095,267,'2022-05-24 17:21:42','2022-05-24 17:21:42'),(231,1,'2382 الورد، 8185, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71437073,46.76592636,268,'2022-05-25 04:19:04','2022-05-25 04:19:04'),(232,1,'2613 Yathreb, 8129, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71443748,46.76795197,269,'2022-05-26 04:53:30','2022-05-26 04:53:30'),(233,1,'2249, 8135, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71431351,46.76412964,271,'2022-05-26 11:38:02','2022-05-26 11:38:02'),(234,1,'19211, Saudi Arabia',23.88590050,45.07920074,273,'2022-05-27 12:00:33','2022-05-27 12:00:33'),(235,1,'Riyadh 14952, Saudi Arabia',24.49626732,46.44821548,274,'2022-05-27 14:30:49','2022-05-27 14:30:49'),(236,1,'2833 As Sunbula, 6823, Ar Rawabi, Riyadh 14215, Saudi Arabia',24.68703842,46.78171539,275,'2022-05-28 10:14:47','2022-05-28 10:14:47'),(237,1,'4019 King Abdullah Rd, 8522, Al Raed, Riyadh 12354, Saudi Arabia',24.71676636,46.64304352,276,'2022-05-30 14:40:47','2022-05-30 14:40:47'),(238,1,'615 33222، السعودية',26.08069801,49.82208633,278,'2022-05-31 09:59:17','2022-05-31 09:59:17'),(239,1,'3276 Wadi Ar Rimmah, 8226, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71489966,46.77456424,279,'2022-05-31 12:40:28','2022-05-31 12:40:28'),(240,1,'8194 Prince Majed Bin Abdulaziz Rd, 3489، حي الريان، Riyadh 14211, Saudi Arabia',24.71425459,46.77642569,280,'2022-05-31 12:43:41','2022-05-31 12:43:41'),(241,1,'3276 Wadi Ar Rimmah, 8226, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71490331,46.77458704,281,'2022-05-31 14:10:50','2022-05-31 14:10:50'),(242,1,'حي, 8066 Al Jamouh Al Ansari, 4274, Umm Al Hamam Al Sharqi, Riyadh 12325, Saudi Arabia',24.69302400,46.65218700,282,'2022-05-31 16:43:12','2022-05-31 16:43:12'),(243,1,'8192 Uyun Al Manahil, 3058, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71458244,46.77241516,283,'2022-05-31 17:38:31','2022-05-31 17:38:31'),(244,1,'الرياض 13799، السعودية',24.58099747,46.39707565,284,'2022-06-01 14:43:57','2022-06-01 14:43:57'),(245,1,'3308 Wadi Ar Rimmah, 8249, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71490758,46.77458234,285,'2022-06-01 14:55:29','2022-06-01 14:55:29'),(246,1,'7780 مالك بن عباده الهمذانى، 3939، ام خالد، المدينة المنورة 42373، السعودية',24.42485237,39.54549789,286,'2022-06-03 06:06:59','2022-06-03 06:06:59'),(247,1,'3339 Ali Al Mufidi, 8177, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71465683,46.77490616,287,'2022-06-03 07:51:15','2022-06-03 07:51:15'),(248,1,'2399 الورد، 8123, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71437263,46.76609421,288,'2022-06-03 08:10:36','2022-06-03 08:10:36'),(249,1,'3308 Wadi Ar Rimmah, 8249, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71489570,46.77456658,289,'2022-06-03 09:00:11','2022-06-03 09:00:11'),(250,1,'RISC8226، 8226 الثقبة، 3393، حي السويدي الغربي، الرياض 12991، السعودية',24.58062172,46.61883926,290,'2022-06-05 19:29:16','2022-06-05 19:29:16'),(251,1,'6929 Al Dimashqi, 4412, Ar Rahmaniyyah, Riyadh 12341, Saudi Arabia',24.71302688,46.67067926,291,'2022-06-06 08:05:48','2022-06-06 08:05:48'),(253,1,'حي, 8066 Al Jamouh Al Ansari, 4274, Umm Al Hamam Al Sharqi, Riyadh 12325, Saudi Arabia',24.69302400,46.65218700,293,'2022-06-06 19:32:42','2022-06-06 19:32:42'),(254,1,'3308 Wadi Ar Rimmah, 8249, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71488961,46.77456088,294,'2022-06-06 19:33:20','2022-06-06 19:33:20'),(255,1,'حي, 2446 Al Alamein, 8259, King Abdullah Dt., Riyadh 12451, Saudi Arabia',24.75114822,46.72636032,295,'2022-06-07 06:31:59','2022-06-07 06:31:59'),(256,1,'حي, 2446 العلمين، 8259، الملك عبدالله، الرياض 12451، السعودية',24.75157166,46.72639465,296,'2022-06-07 07:33:56','2022-06-07 07:33:56'),(257,1,'6533 طريق الملك عبدالعزيز، 2655، حي المصيف، الرياض 12465، السعودية',24.75830473,46.67472906,297,'2022-06-07 10:58:01','2022-06-07 10:58:01'),(258,1,'QP2G+G94، الملك عبدالله، الرياض 12451، السعودية',24.75122770,46.72660802,298,'2022-06-07 14:04:07','2022-06-07 14:04:07'),(259,1,'RBFB4650، 4650 ابن جامع القفصي، 6169، حي الشرفية، الرياض 12725، السعودية',24.65075188,46.66902401,299,'2022-06-07 18:18:08','2022-06-07 18:18:08'),(260,1,'4469 Abi Al Hasan Ar Rashidi, 6861, Al Muruj, Riyadh 12282, Saudi Arabia',24.75359154,46.67473984,300,'2022-06-08 06:36:26','2022-06-08 06:36:26'),(261,1,'7122 Muhammad Al Yamami, 3926, Al Ghadir, Riyadh 13311, Saudi Arabia',24.77110100,46.65826416,301,'2022-06-08 13:55:59','2022-06-08 13:55:59'),(262,1,'4141, 6671, Al Jazirah, Riyadh 14252, Saudi Arabia',24.67275601,46.79871015,302,'2022-06-08 15:21:48','2022-06-08 15:21:48'),(263,1,'RCWA6355، 6355 ابي الذكر، 3542، حي الوزارات، Riyadh 12626, Saudi Arabia',24.66777795,46.71467889,303,'2022-06-08 19:26:22','2022-06-08 19:26:22'),(264,1,'6498 فهد بن خرينق، 4053, Al Sanabel, Jeddah 22434, Saudi Arabia',21.39375511,39.27323129,304,'2022-06-09 15:59:38','2022-06-09 15:59:38'),(265,1,'حي, 3507 زهير بن العلاء العبسي، 7201، العارض، الرياض 13335، السعودية',24.86186028,46.63241196,305,'2022-06-09 16:49:10','2022-06-09 16:49:10'),(266,1,'2239 طريق العروبة، 9597، العليا، الرياض 12214، السعودية',24.71140480,46.67436981,306,'2022-06-09 19:12:29','2022-06-09 19:12:29'),(267,1,'RUAA2989، 2989 حمد التميمي، 8124، حي الرمال، الرياض 13438، السعودية',24.93000603,46.81937790,307,'2022-06-10 10:11:04','2022-06-10 10:11:04'),(268,1,'7538 المغيرة بن شعبة، الملك فهد، الرياض 12273 3104،، الملك فهد، الرياض 12273، السعودية',24.74295847,46.66946758,308,'2022-06-10 15:42:46','2022-06-10 15:42:46'),(269,1,'2776, 7011, Alyasmin, Riyadh 13326, Saudi Arabia',24.82802195,46.64306559,309,'2022-06-10 18:04:49','2022-06-10 18:04:49'),(270,1,'حي, 7866 Al Cheikh Muhammad Ibn Ibrahim, 3245, Al Wusaita, Riyadh 12652, Saudi Arabia',24.62144003,46.71828747,310,'2022-06-11 00:50:15','2022-06-11 00:50:15'),(271,1,'4493 الياقوت، 7293، الملك عبدالله، الرياض 12422، السعودية',24.71654701,46.75683975,311,'2022-06-11 07:41:25','2022-06-11 07:41:25'),(272,1,'5006 خالد بن جنادة، 6393، الملز، الرياض 12627، السعودية',24.66814387,46.72931436,312,'2022-06-11 08:12:57','2022-06-11 08:12:57'),(273,1,'2972 فضيله السيد مصطفي عاصم، 6998, Al Aarid, Riyadh 13335, Saudi Arabia',24.86007881,46.62754822,313,'2022-06-11 10:40:09','2022-06-11 10:40:09'),(274,1,'7106 طريق المذنب - عنيزة - المطار، 5669، حي الشعيب، عنيزة 56229، السعودية',26.11873986,43.88068065,314,'2022-06-11 13:00:51','2022-06-11 13:00:51'),(275,1,'33310, Saudi Arabia',26.20429993,49.71239853,315,'2022-06-11 13:13:16','2022-06-11 13:13:16'),(276,1,'RFJA9004، 9004 محمد بن أبي الفرج، 4206، حي القادسية، الرياض 13236، السعودية',24.81388855,46.83085632,316,'2022-06-12 02:15:48','2022-06-12 02:15:48'),(277,1,'2800 Al Qarin, 7215, Dhahrat Al Badi\'ah, Riyadh 12982, Saudi Arabia',24.59137726,46.63234329,317,'2022-06-12 16:57:18','2022-06-12 16:57:18'),(278,1,'محطة كهرباء حي قرطبة، 3454 طريق الأمير محمد بن سلمان بن عبدالعزيز، 6441، قرطبة، الرياض 13248، السعودية',24.82028770,46.73981094,318,'2022-06-13 03:57:14','2022-06-13 03:57:14'),(279,1,'3594 طريق الامام مالك، 8412، بدر، الرياض 14724، السعودية',24.55047798,46.70449829,319,'2022-06-13 12:32:39','2022-06-13 12:32:39'),(280,1,'2239 Al Urubah Rd, 9597, Al Olaya, Riyadh 12214, Saudi Arabia',24.71140480,46.67436981,320,'2022-06-14 07:43:38','2022-06-14 07:43:38'),(281,1,'حي, 7848 Al Ruwaishid, 2570, Ulaishah, Riyadh 12746, Saudi Arabia',24.62955093,46.68069458,321,'2022-06-14 17:01:58','2022-06-14 17:01:58'),(282,1,'2494, 7492, Ar Rusayfah, Makkah 24232, Saudi Arabia',21.40818246,39.78431381,322,'2022-06-15 09:17:30','2022-06-15 09:17:30'),(283,1,'3406 علي المفيدي، 8207، حي الريان، Riyadh 14211, Saudi Arabia',24.71466446,46.77568054,323,'2022-06-15 14:25:09','2022-06-15 14:25:09'),(284,1,'3400 Al Thoumamah Rd, 6301, Al Munsiyah, Riyadh 13422, Saudi Arabia',24.84916115,46.76418304,324,'2022-06-15 18:37:43','2022-06-15 18:37:43'),(285,1,'8478 سلمان الفارسي، 4034، النهضة، الرياض 13221، السعودية',24.76237527,46.81008272,325,'2022-06-16 07:11:31','2022-06-16 07:11:31'),(286,2,'8478 سلمان الفارسي، 4034، النهضة، الرياض 13221، السعودية',24.76235792,46.81006193,325,'2022-06-16 07:24:56','2022-06-16 07:24:56'),(287,1,'2366 الورد، 8170, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71433067,46.76533127,326,'2022-06-16 14:36:47','2022-06-16 14:36:47'),(288,1,'8725، 3978، المدينة الصناعية الجديدة، الرياض 14334، السعودية',24.55332947,46.89711761,327,'2022-06-17 08:13:31','2022-06-17 08:13:31'),(289,1,'2914 فؤاد شاكر، 7133، حي النزهة، جدة 23532، السعودية',21.62417984,39.16094208,328,'2022-06-18 12:32:48','2022-06-18 12:32:48'),(290,1,'حي, 3885 Mansur Ibn Al Mutamir, 7813, Al Mansourah, Riyadh 12692, Saudi Arabia',24.61511612,46.75604248,329,'2022-06-18 18:43:50','2022-06-18 18:43:50'),(291,1,'حي, 8066 Al Jamouh Al Ansari, 4274, Umm Al Hamam Al Sharqi, Riyadh 12325, Saudi Arabia',24.69302400,46.65218700,330,'2022-06-18 19:45:48','2022-06-18 19:45:48'),(292,1,'حي, 8066 Al Jamouh Al Ansari, 4274, Umm Al Hamam Al Sharqi, Riyadh 12325, Saudi Arabia',24.69302400,46.65218700,331,'2022-06-18 19:46:53','2022-06-18 19:46:53'),(293,1,'PMMX+Q53, Rafha St, Salahuddin, Riyadh 12435, Saudi Arabia',24.73438570,46.69795331,332,'2022-06-19 05:13:48','2022-06-19 05:13:48'),(294,1,'2962 Al Toulmousani, 6546، حي السلامة، Jeddah 23436, Saudi Arabia',21.57951736,39.15254974,333,'2022-06-20 16:12:22','2022-06-20 16:12:22'),(295,1,'7288 Ali Ibn Abi Al Qasim, 2994, Az Zahrah, Riyadh 12986, Saudi Arabia',24.57284164,46.64036179,334,'2022-06-21 17:24:31','2022-06-21 17:24:31'),(296,1,'Alasmarat، The Martyr Corridor, Al Hay Al Asher, Nasr City, Cairo Governorate 4413531, Egypt',30.00589511,31.34699218,335,'2022-06-21 21:03:06','2022-06-21 21:03:06'),(297,1,'2547 الورد، 8182, Ar Rayyan, Riyadh 14211, Saudi Arabia',24.71437073,46.76657104,336,'2022-06-22 14:47:17','2022-06-22 14:47:17'),(298,1,'2239 طريق العروبة، 9597، العليا، الرياض 12214، السعودية',24.71140480,46.67436981,337,'2022-06-25 17:25:30','2022-06-25 17:25:30'),(299,1,'7292 Muhammad Al Yamami, 3843, Al Ghadir, Riyadh 13311, Saudi Arabia',24.77260208,46.65730667,338,'2022-06-25 18:17:13','2022-06-25 18:17:13'),(300,1,'3681 طريق الامير سعد بن عبدالرحمن الاول الفرعي،, الجزيرة، 7988, الرياض 14251، السعودية',24.68511881,46.79396197,339,'2022-06-26 09:41:37','2022-06-26 09:41:37'),(301,1,'Shahad Building, Al Imam Saud Ibn Abdul Aziz Branch Rd, Al Muruj, Riyadh 12281, Saudi Arabia',24.74823380,46.66280365,340,'2022-06-27 04:05:56','2022-06-27 04:05:56'),(302,1,'6209 طريق الملك عبدالعزيز، 2849، حي المرسلات، الرياض 12461، السعودية',24.73842621,46.68479538,341,'2022-06-28 15:49:35','2022-06-28 15:49:35'),(303,1,'4464, 8931, Makkah 24227, Saudi Arabia',21.48367119,39.78517151,342,'2022-06-30 12:09:18','2022-06-30 12:09:18'),(304,1,'33333، السعودية',26.06400490,49.48767090,343,'2022-07-02 16:19:50','2022-07-02 16:19:50'),(305,1,'3638 ابي المعالي النيسابوري، 6423، الخليج، الرياض 13224، السعودية',24.77109909,46.81152344,344,'2022-07-05 18:23:47','2022-07-05 18:23:47'),(306,1,'QAPA8138، 8138 شارع محمد إبراهيم السبيعي، 3212، حي الشفاء، Unayzah 56465, Saudi Arabia',26.08186852,43.99972279,345,'2022-07-08 12:59:35','2022-07-08 12:59:35'),(307,1,'2635 الكسائي، 7808، الزهرة، الرياض 12984، السعودية',24.57760239,46.63677216,346,'2022-07-10 01:24:09','2022-07-10 01:24:09'),(308,1,'7786 Sharhabil Ibn Hasanah, 2742, Al Manar, Riyadh 14221, Saudi Arabia',24.72869873,46.79088974,347,'2022-07-12 07:31:46','2022-07-12 07:31:46'),(309,1,'6871 السفراء، 4124, Ar Rawdah, Riyadh 13213, Saudi Arabia',24.73488426,46.76983643,348,'2022-07-12 07:33:48','2022-07-12 07:33:48'),(310,1,'80M, الدمام 33313، السعودية',26.25196075,49.61911392,349,'2022-07-16 15:01:00','2022-07-16 15:01:00'),(311,1,'7325 King Abdul Aziz Branch Rd, 2279, Almasiaf, Riyadh 12467, Saudi Arabia',24.76552200,46.67122650,350,'2022-07-19 06:09:50','2022-07-19 06:09:50'),(312,1,'7325 King Abdul Aziz Branch Rd, 2279, Almasiaf, Riyadh 12467, Saudi Arabia',24.76547813,46.67121887,351,'2022-07-19 16:31:27','2022-07-19 16:31:27'),(313,1,'JFBB2614، 2614 عبد الملك القرشي، 7329، حي بريمان، جدة 23644، السعودية',21.64896774,39.23077011,352,'2022-07-20 20:24:54','2022-07-20 20:24:54'),(314,1,'RQRA2185, 2185 Khurais Rd, 8203، حي الريان، Riyadh 14211, Saudi Arabia',24.71423149,46.76244354,353,'2022-07-22 06:05:49','2022-07-22 06:05:49'),(315,1,'RQRA2285, 2285 Al Moudaf, 8161، حي الريان، Riyadh 14211, Saudi Arabia',24.71430016,46.76454926,354,'2022-07-23 11:45:30','2022-07-23 11:45:30'),(316,1,'RQRA3406، 3406 علي المفيدي، 8207، حي الريان، Riyadh 14211, Saudi Arabia',24.71457652,46.77564684,355,'2022-07-23 14:05:52','2022-07-23 14:05:52');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `group_id` int unsigned NOT NULL,
  `image` text NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_store` tinyint NOT NULL DEFAULT '0',
  `block` tinyint NOT NULL DEFAULT '0',
  `total_mueeny_money_back` decimal(8,2) NOT NULL DEFAULT '0.00',
  `language_id` bigint unsigned DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `is_agency` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_phone_unique` (`phone`),
  KEY `admins_group_id_foreign` (`group_id`),
  KEY `admins_language_id_foreign` (`language_id`),
  CONSTRAINT `admins_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin','admin@admin.com','01127259515',1,0,20,'default.png','$2y$10$N3FBqHrmeQ43FUUvCZAKnua/wvwqzR.waoVv9hmZOJKyZkl7yvBdu','yENkoR0ugHTGV9hKkBwLBUVV4VvJGFX80T7W8j80YKwxVdqjX2rBUaaTdzCB','2020-11-25 02:08:50','2021-03-13 15:56:11',0,0,0.00,NULL,NULL,NULL),(52,'agencytest','agency@admin.com','0567558897',1,1,29,'default.png','$2y$10$/LvlQ8J6Ehij3T69K/0O7eZxaH9k1CaXGAtvghgdT0i3gSect6RXi',NULL,'2022-06-14 21:28:40','2022-06-14 21:28:40',0,0,0.00,NULL,'966',NULL),(53,'Callcenter','Callcenter@c.com','0115675687',1,1,30,'default.png','$2y$10$ZaEXtfrwsqhINoiL33miN.OYtzLsNcQyczIy7gpHFczQLhoKqTXU.',NULL,'2022-06-18 22:32:06','2022-06-18 22:32:06',0,0,0.00,NULL,'966',NULL),(54,'entry admin','entry@test.com','0544688888',1,1,31,'default.png','$2y$10$y.LASaQVZGJtU.KRalyLV.E2FpIlWQff2Y7VYkqLDf2UOTK6sz13G',NULL,'2022-06-25 22:09:22','2022-06-25 22:09:22',0,0,0.00,NULL,'966',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_banners`
--

DROP TABLE IF EXISTS `advertisement_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertisement_banners_sort_order_unique` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_banners`
--

LOCK TABLES `advertisement_banners` WRITE;
/*!40000 ALTER TABLE `advertisement_banners` DISABLE KEYS */;
INSERT INTO `advertisement_banners` VALUES (12,'Welome to Mueeny','https://mueeny.com/','1646224051482379.png',1,1,'2022-03-02 14:27:33','2022-03-02 14:27:33',107),(13,'Welome to Mueeny','https://mueeny.com/','1646224115758292.png',1,2,'2022-03-02 14:28:37','2022-03-02 14:28:37',113),(14,'Welome to Mueeny','https://mueeny.com/','1646224136893489.png',1,3,'2022-03-02 14:28:58','2022-03-02 14:28:58',114),(15,'Welome to Mueeny','https://mueeny.com/','1646224160283169.png',1,4,'2022-03-02 14:29:22','2022-03-02 14:29:22',112),(16,'Welome to Mueeny','https://mueeny.com/','1646224190496305.png',1,5,'2022-03-02 14:29:52','2022-03-02 14:29:52',115),(17,'Welome to Mueeny','https://mueeny.com/','164622421185189.png',1,6,'2022-03-02 14:30:13','2022-03-02 14:30:13',116),(18,'Welome to Mueeny','https://mueeny.com/','1646224244586011.png',1,7,'2022-03-02 14:30:47','2022-03-02 14:30:47',111),(19,'Welome to Mueeny','https://mueeny.com/','164622426443086.png',1,8,'2022-03-02 14:31:08','2022-03-02 14:31:08',117),(20,'Add 1','https://mueeny.com','1650552255201076.png',1,9,'2022-04-21 16:44:17','2022-04-21 16:44:17',126);
/*!40000 ALTER TABLE `advertisement_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_cancellation`
--

DROP TABLE IF EXISTS `advertisement_cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement_cancellation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cancellation_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement_id` bigint unsigned NOT NULL,
  `cancellation_reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_cancellation_advertisement_id_foreign` (`advertisement_id`),
  KEY `advertisement_cancellation_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  CONSTRAINT `advertisement_cancellation_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`),
  CONSTRAINT `advertisement_cancellation_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_cancellation`
--

LOCK TABLES `advertisement_cancellation` WRITE;
/*!40000 ALTER TABLE `advertisement_cancellation` DISABLE KEYS */;
INSERT INTO `advertisement_cancellation` VALUES (13,'my wish',1,456,6,'2022-05-01 05:42:14','2022-05-01 05:42:14',39),(14,'ok',1,452,5,'2022-05-01 12:59:39','2022-05-01 12:59:39',39),(23,'ok',1,453,11,'2022-05-02 12:34:11','2022-05-02 00:34:11',39),(24,'okok',1,450,11,'2022-05-02 12:35:20','2022-05-02 00:35:20',39),(25,'okok',1,449,11,'2022-05-02 12:38:08','2022-05-02 00:38:08',39),(26,'The admin has cancled the order',1,457,12,'2022-05-07 04:49:00','2022-05-07 16:49:00',1),(27,'The admin has cancled the order second time',1,457,10,'2022-05-07 04:52:00','2022-05-07 16:52:00',1),(28,'The admin has cancled the order second time',1,458,10,'2022-05-07 04:53:24','2022-05-07 16:53:24',1),(29,'The admin has cancled the order third time',1,459,10,'2022-05-07 04:55:15','2022-05-07 16:55:15',1),(30,'The admin has cancled the order fourth time',1,459,10,'2022-05-07 04:55:35','2022-05-07 16:55:35',1),(31,'The admin has cancled the order fourth time',1,459,10,'2022-05-07 04:55:45','2022-05-07 16:55:45',1),(32,'The admin has cancled the order fourth time',1,460,10,'2022-05-07 04:56:39','2022-05-07 16:56:39',1),(33,'The admin has cancled the order first time',1,442,16,'2022-05-07 05:13:47','2022-05-07 17:13:47',1),(34,'The admin has cancled the order first time',1,441,17,'2022-05-07 05:17:17','2022-05-07 17:17:17',1),(35,'The admin has cancled the order second time',1,440,17,'2022-05-07 05:17:54','2022-05-07 17:17:54',1),(36,'android by admin 1',1,461,17,'2022-05-07 06:22:41','2022-05-07 18:22:41',1),(37,'android by admin 2',1,462,17,'2022-05-07 06:24:18','2022-05-07 18:24:18',1),(38,'android by admin 2',1,462,17,'2022-05-07 06:24:29','2022-05-07 18:24:29',1),(39,'android by admin 2',1,462,17,'2022-05-07 06:24:52','2022-05-07 18:24:52',1),(40,'android by admin 2',1,462,17,'2022-05-07 06:25:15','2022-05-07 18:25:15',1),(41,'android by admin 2',1,462,17,'2022-05-07 06:25:23','2022-05-07 18:25:23',1),(42,'android by admin 2',1,462,17,'2022-05-07 06:25:39','2022-05-07 18:25:39',1),(43,'android by admin 2',1,462,17,'2022-05-07 06:25:54','2022-05-07 18:25:54',1),(44,'cancel by admin 1',1,476,5,'2022-05-09 08:20:53','2022-05-09 08:20:53',1),(45,'cancel by admin 2',1,477,8,'2022-05-09 08:22:37','2022-05-09 08:22:37',1),(46,'cancel by admin 3',1,478,8,'2022-05-09 08:24:08','2022-05-09 08:24:08',1),(47,'cancel by admin 4',1,479,8,'2022-05-09 08:25:23','2022-05-09 08:25:23',1),(48,'admin',1,486,5,'2022-05-09 10:43:49','2022-05-09 10:43:49',1),(49,'admin2',1,487,6,'2022-05-09 11:27:33','2022-05-09 11:27:33',1),(50,'by admin',1,485,9,'2022-05-09 11:30:32','2022-05-09 11:30:32',1),(51,'admin notify',1,488,17,'2022-05-09 11:53:52','2022-05-09 11:53:52',1),(52,'ok',1,490,6,'2022-05-09 12:03:40','2022-05-09 12:03:40',39),(53,'admin notify2',1,489,12,'2022-05-09 12:06:33','2022-05-09 12:06:33',1),(54,'aa',1,491,15,'2022-05-09 12:13:13','2022-05-09 12:13:13',1),(55,'c',1,493,15,'2022-05-09 12:26:58','2022-05-09 12:26:58',1),(56,'ddsds',1,528,6,'2022-05-14 10:36:48','2022-05-14 22:36:48',39),(57,'kkkkk',1,428,8,'2022-05-14 10:40:30','2022-05-14 22:40:30',39),(58,'1111',1,538,6,'2022-05-17 09:52:34','2022-05-17 09:52:34',39);
/*!40000 ALTER TABLE `advertisement_cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `videos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `lat` double(10,8) DEFAULT NULL,
  `lng` double(10,8) DEFAULT NULL,
  `date` date NOT NULL,
  `has_specific_time` tinyint(1) NOT NULL,
  `budget` decimal(8,2) NOT NULL,
  `offer_notification` tinyint(1) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `commission` decimal(8,2) NOT NULL,
  `payment_method` int DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `is_settled` tinyint(1) NOT NULL DEFAULT '0',
  `currency_id` bigint unsigned NOT NULL,
  `availability_time_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `main_category_id` bigint unsigned NOT NULL,
  `sub_category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_provider_id` bigint unsigned DEFAULT NULL,
  `proof_work_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `finished_by` bigint unsigned NOT NULL,
  `finished_at` datetime NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chatId` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_thread` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rrn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `advertisements_currency_id_foreign` (`currency_id`),
  KEY `advertisements_availability_time_id_foreign` (`availability_time_id`),
  KEY `advertisements_user_id_foreign` (`user_id`),
  KEY `advertisements_main_category_id_foreign` (`main_category_id`),
  KEY `advertisements_sub_category_id_foreign` (`sub_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
INSERT INTO `advertisements` VALUES (610,'المصيف طريق الملك عبدالعزيز','استئجار سيارة لمدة أسبوع فقط  الموقع طريق الملك عبدالعزيز حي المصيف','','',2,NULL,NULL,'2022-06-11',0,350.00,1,0,5.00,NULL,0,0,3,NULL,297,113,206,'2022-06-11 10:49:19','2022-06-11 10:49:19',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(613,'مدرس خصوصي رياضيات','مدرس خصوصي  رياضيات صف خامس وسادس عاجل جدا','','',1,24.73651700,46.74645000,'2022-06-14',0,50.00,1,0,5.00,NULL,0,0,3,NULL,295,111,135,'2022-06-12 21:45:08','2022-06-12 21:45:08',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(614,'مدرس رياضيات خصوصي','مدرس رياضيات خصوصي للمرحة الثاني متوسط','','',1,24.71140500,46.67437000,'2022-06-15',0,80.00,1,0,5.00,NULL,0,0,3,NULL,317,111,135,'2022-06-15 00:56:19','2022-06-15 00:56:19',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(615,'Carpet Glue Cleaner','I had carpet before, which has glue under it. Now I have removed the carpet but the glue is still on floor and looks bad.','','',1,24.62955000,46.68069500,'2022-06-18',0,100.00,1,0,5.00,NULL,0,0,3,NULL,321,117,201,'2022-06-15 07:03:29','2022-06-15 07:03:29',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(616,'I need someone to help me writing my resume','I need someone to help me writing my resume','','',1,24.71140500,46.67437000,'2022-06-16',0,50.00,1,1,5.00,6,0,0,3,NULL,326,113,206,'2022-06-16 19:37:57','2022-06-16 19:39:40',NULL,NULL,0,'2022-06-16 06:52:22',NULL,NULL,NULL,'0'),(617,'تصاميم الاوتوكاد والديكور','عمل رسومات للديكور والاثاث المستخدم فيه بالمقاسات','','',2,NULL,NULL,'2022-07-31',0,50.00,1,0,5.00,NULL,0,0,3,NULL,327,128,167,'2022-06-17 13:16:56','2022-06-17 13:16:56',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(618,'مطلوب استاذ في علم المحاسبة','شرح مادة المحاسبة لطالب جامعي','','',1,21.62281000,39.16097300,'0000-00-00',0,50.00,1,0,5.00,NULL,0,0,3,NULL,328,111,192,'2022-06-18 17:38:44','2022-06-18 17:38:44',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0'),(619,'math course','High school math for third year','','',1,24.71140500,46.67437000,'2022-07-02',0,80.00,1,0,18.00,NULL,0,0,3,NULL,317,111,135,'2022-07-02 20:39:14','2022-07-02 20:39:14',NULL,NULL,0,'0000-00-00 00:00:00',NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability_time_novas`
--

DROP TABLE IF EXISTS `availability_time_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability_time_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_time_novas`
--

LOCK TABLES `availability_time_novas` WRITE;
/*!40000 ALTER TABLE `availability_time_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `availability_time_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability_time_translations`
--

DROP TABLE IF EXISTS `availability_time_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability_time_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `availability_time_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `availability_time_translations_availability_time_id_foreign` (`availability_time_id`),
  CONSTRAINT `availability_time_translations_availability_time_id_foreign` FOREIGN KEY (`availability_time_id`) REFERENCES `availability_times` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_time_translations`
--

LOCK TABLES `availability_time_translations` WRITE;
/*!40000 ALTER TABLE `availability_time_translations` DISABLE KEYS */;
INSERT INTO `availability_time_translations` VALUES (15,'en','Morning before 10 am',5,'2022-03-02 13:22:35','2022-03-02 13:22:35'),(16,'ar','قبل العاشرة صباحا',5,'2022-03-02 13:22:35','2022-03-02 13:22:35'),(17,'en','Midday 10am - 2pm',6,'2022-03-02 13:23:34','2022-03-02 13:23:34'),(18,'ar','منتصف اليوم 10ص - 2م',6,'2022-03-02 13:23:34','2022-03-02 13:23:34'),(19,'en','Afternoon 2 pm – 6pm',7,'2022-03-02 13:24:20','2022-03-02 13:24:20'),(20,'ar','مساءا من 2م - 6م',7,'2022-03-02 13:24:20','2022-03-02 13:24:20'),(21,'en','Evening after 6pm',8,'2022-03-02 13:25:05','2022-03-02 13:25:05'),(22,'ar','ما بعد ال6 مساءا',8,'2022-03-02 13:25:05','2022-03-02 13:25:05');
/*!40000 ALTER TABLE `availability_time_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability_times`
--

DROP TABLE IF EXISTS `availability_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability_times` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_times`
--

LOCK TABLES `availability_times` WRITE;
/*!40000 ALTER TABLE `availability_times` DISABLE KEYS */;
INSERT INTO `availability_times` VALUES (5,1,1,'2022-03-02 13:22:35','2022-03-02 13:22:35'),(6,1,2,'2022-03-02 13:23:34','2022-03-02 13:23:34'),(7,1,3,'2022-03-02 13:24:20','2022-03-02 13:24:20'),(8,1,4,'2022-03-02 13:25:05','2022-03-02 13:25:05');
/*!40000 ALTER TABLE `availability_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `beneficiary_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_accounts_iban_unique` (`iban`),
  UNIQUE KEY `bank_accounts_account_number_unique` (`account_number`),
  KEY `bank_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES (178,'bank','testing provider','SA126642358753','21665433553',272,'2022-05-27 10:29:44','2022-05-27 10:29:44'),(179,'gsjsnnsjej','bsjejjdjd','sa938dje82jeji29wj','64646464',270,'2022-05-31 03:18:14','2022-05-31 03:18:14'),(188,'Al Rajhi bank','ABDULRAHMAN Ateeq UR Rahman','SA208000060608016012591','606000010006086012591',303,'2022-06-10 03:17:04','2022-06-10 03:17:04'),(189,'الراجحي','محمد يوسف','SA43 8000 0388 6080 1601 2116','388000010006086012116',299,'2022-06-10 10:20:13','2022-06-10 10:20:13'),(190,'bank','livetest','SA23534565455','2224532553',323,'2022-06-15 19:29:48','2022-06-15 19:29:48'),(191,'alinma','sharjeel zubair','123456789','2525252525',321,'2022-06-15 20:52:34','2022-06-15 20:52:34'),(192,'الراجحي','شركة كوادر للاستشارات الهندسية','SA7280000648608010445441','648608010445441',325,'2022-06-16 12:24:56','2022-06-16 12:24:56'),(193,'bankc','b','sa1235646773','526553324',326,'2022-06-16 19:42:59','2022-06-16 19:42:59'),(194,'الاهلي','Mohammed Almarshud','SA56 1000 0021 1000 0024 0600','5292157371444656',317,'2022-06-18 16:55:16','2022-06-18 16:55:16'),(195,'bank','user','sa123345335','2244663342',336,'2022-06-22 19:49:37','2022-06-22 19:49:37'),(196,'bank','android provider','sa12356521','1224566354',348,'2022-07-12 12:36:00','2022-07-12 12:36:00'),(197,'bank','user','sa12344563','45565755',354,'2022-07-23 16:56:12','2022-07-23 16:56:12');
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_reason_novas`
--

DROP TABLE IF EXISTS `cancellation_reason_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellation_reason_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `type` int NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_reason_novas`
--

LOCK TABLES `cancellation_reason_novas` WRITE;
/*!40000 ALTER TABLE `cancellation_reason_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancellation_reason_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_reason_translations`
--

DROP TABLE IF EXISTS `cancellation_reason_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellation_reason_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancellation_reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cancellation_reason_translations_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  CONSTRAINT `cancellation_reason_translations_cancellation_reason_id_foreign` FOREIGN KEY (`cancellation_reason_id`) REFERENCES `cancellation_reasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_reason_translations`
--

LOCK TABLES `cancellation_reason_translations` WRITE;
/*!40000 ALTER TABLE `cancellation_reason_translations` DISABLE KEYS */;
INSERT INTO `cancellation_reason_translations` VALUES (9,'en','The service provider is not responding',5,'2022-03-02 13:26:44','2022-03-02 13:26:44'),(10,'ar','مزود الخدمة لا يرد',5,'2022-03-02 13:26:44','2022-03-02 13:26:44'),(11,'en','I no longer want to complete the service',6,'2022-03-02 13:27:12','2022-03-02 13:27:12'),(12,'ar','لم أعد أرغب بإكمال الخدمة',6,'2022-03-02 13:27:12','2022-03-02 13:27:12'),(13,'en','Unacceptable quality of service',7,'2022-03-02 13:27:45','2022-03-02 13:27:45'),(14,'ar','جودة الخدمة غير مقبولة',7,'2022-03-02 13:27:45','2022-03-02 13:27:45'),(15,'en','I do not want to pay extra charges for the service',8,'2022-03-02 13:28:11','2022-03-02 13:28:11'),(16,'ar','لا أريد دفع مبالغ إضافية للخدمة',8,'2022-03-02 13:28:11','2022-03-02 13:28:11'),(17,'en','Conflict of schedule between you and the service provider',9,'2022-03-02 13:28:44','2022-03-02 13:28:44'),(18,'ar','تعارض في الجدول الزمني بيني وبين مزود الخدمة',9,'2022-03-02 13:28:44','2022-03-02 13:28:44'),(19,'en','The service provider did not show up at the service location',10,'2022-03-02 13:29:08','2022-03-02 13:29:08'),(20,'ar','مزود الخدمة لم يحضر لموقع تنفيذ الخدمة',10,'2022-03-02 13:29:08','2022-03-02 13:29:08'),(21,'en','Other',11,'2022-03-02 13:29:32','2022-03-02 13:29:32'),(22,'ar','أخرى',11,'2022-03-02 13:29:32','2022-03-02 13:29:32'),(23,'en','The client is not responding',12,'2022-03-02 13:30:02','2022-03-02 13:30:02'),(24,'ar','العميل لا يرد',12,'2022-03-02 13:30:02','2022-03-02 13:30:02'),(25,'en','I no longer want to complete the service',13,'2022-03-02 13:30:25','2022-03-02 13:30:25'),(26,'ar','لم أعد أرغب بإكمال الخدمة',13,'2022-03-02 13:30:25','2022-03-02 13:30:25'),(27,'en','The client changed the scope of the service',14,'2022-03-02 13:30:46','2022-03-02 13:30:46'),(28,'ar','تغيير العميل لنطاق ومجريات الخدمة',14,'2022-03-02 13:30:46','2022-03-02 13:30:46'),(29,'en','The client rejected to pay extra charges for the service.',15,'2022-03-02 13:31:07','2022-03-02 13:31:07'),(30,'ar','رفض العميل لدفع المبالغ الإضافية للخدمة',15,'2022-03-02 13:31:07','2022-03-02 13:31:07'),(31,'en','Conflict of schedule between you and the client',16,'2022-03-02 13:31:37','2022-03-02 13:31:37'),(32,'ar','تعارض في الجدول الزمني بينك وبين العميل',16,'2022-03-02 13:31:37','2022-03-02 13:31:37'),(33,'en','Other',17,'2022-03-02 13:31:58','2022-03-02 13:31:58'),(34,'ar','أخرى',17,'2022-03-02 13:31:58','2022-03-02 13:31:58');
/*!40000 ALTER TABLE `cancellation_reason_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_reasons`
--

DROP TABLE IF EXISTS `cancellation_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellation_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_reasons`
--

LOCK TABLES `cancellation_reasons` WRITE;
/*!40000 ALTER TABLE `cancellation_reasons` DISABLE KEYS */;
INSERT INTO `cancellation_reasons` VALUES (5,1,1,1,'2022-03-02 13:26:44','2022-03-02 13:26:44'),(6,1,1,2,'2022-03-02 13:27:12','2022-03-02 13:27:12'),(7,1,1,3,'2022-03-02 13:27:45','2022-03-02 13:27:45'),(8,1,1,4,'2022-03-02 13:28:11','2022-03-02 13:28:11'),(9,1,1,5,'2022-03-02 13:28:44','2022-03-02 13:28:44'),(10,1,1,6,'2022-03-02 13:29:08','2022-03-02 13:29:08'),(11,1,1,7,'2022-03-02 13:29:32','2022-03-02 13:29:32'),(12,2,1,1,'2022-03-02 13:30:02','2022-03-02 13:30:02'),(13,2,1,2,'2022-03-02 13:30:25','2022-03-02 13:30:25'),(14,2,1,3,'2022-03-02 13:30:46','2022-03-02 13:30:46'),(15,2,1,4,'2022-03-02 13:31:07','2022-03-02 13:31:07'),(16,2,1,5,'2022-03-02 13:31:37','2022-03-02 13:31:37'),(17,2,1,6,'2022-03-02 13:31:58','2022-03-02 13:31:58');
/*!40000 ALTER TABLE `cancellation_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int NOT NULL,
  `parent_id` bigint NOT NULL,
  `parents_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `partner` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (80,1,1,'1638194430815063.png',1,0,'','2021-11-29 16:00:30','2022-01-05 14:04:03',1),(81,1,1,'1638194446677714.png',1,80,'80','2021-11-29 16:00:46','2022-01-05 14:04:45',1),(82,1,1,'163819454118140.png',1,81,'80,81','2021-11-29 16:02:21','2021-11-29 16:02:21',0),(83,1,1,'1638194702807746.png',1,0,'','2021-11-29 16:05:02','2021-11-29 16:05:02',0),(84,1,1,'1638194770434182.png',1,83,'83','2021-11-29 16:06:10','2021-11-29 16:06:10',0),(85,1,2,'1638197483464956.png',1,0,'','2021-11-29 16:51:23','2021-11-29 16:51:23',0),(86,1,1,'1638197515816636.png',1,85,'85','2021-11-29 16:51:55','2021-11-29 16:51:55',0),(87,1,3,'1638197543575714.png',1,86,'85,86','2021-11-29 16:52:24','2021-11-29 16:52:24',0),(89,1,2,'163834852666611.png',1,80,'80','2021-12-01 10:48:46','2022-01-05 14:04:52',1),(90,1,1,'1638485282154663.png',1,0,'','2021-12-03 00:48:02','2021-12-03 00:48:02',0),(91,1,1,'1638485320341491.png',1,90,'90','2021-12-03 00:48:40','2021-12-03 00:48:40',0),(92,1,2,'1638485350358669.png',1,90,'90','2021-12-03 00:49:10','2021-12-03 00:49:10',0),(93,1,1,'1638485385324247.png',1,91,'90,91','2021-12-03 00:49:45','2021-12-03 00:49:45',0),(94,1,2,'163848541936340.png',1,91,'90,91','2021-12-03 00:50:19','2021-12-03 00:50:19',0),(96,1,3,'1638485486333149.png',1,0,'','2021-12-03 00:51:26','2021-12-03 00:51:26',0),(97,1,1,'1638699191618264.png',1,0,'','2021-12-05 12:13:11','2021-12-05 12:13:11',1),(98,1,1,'1641141344674439.png',1,0,'','2022-01-02 11:25:28','2022-01-02 18:35:44',0),(99,1,1,'1641141384988472.png',1,0,'','2022-01-02 18:36:24','2022-01-02 18:36:24',1),(102,1,3,'1642602551374460.png',1,0,'','2022-01-19 16:29:11','2022-01-19 16:29:11',0),(103,1,1,'1644218153415800.png',1,0,'','2022-02-07 09:15:53','2022-02-07 09:15:53',1),(104,1,1,'1644321932356478.jpeg',1,0,'','2022-02-08 14:05:32','2022-02-08 14:05:32',0),(105,1,1,'1644322278267154.jpg',1,104,'104','2022-02-08 14:11:18','2022-02-08 14:11:18',0),(106,1,6,'1645361741740920.png',1,0,'','2022-02-20 14:55:41','2022-02-20 14:55:41',0),(107,0,1,'1645444498653239.png',1,0,'','2022-02-21 13:54:58','2022-05-19 13:40:16',0),(108,1,1,'1645444530661165.png',1,107,'107','2022-02-21 13:55:30','2022-02-21 13:55:30',0),(111,1,1,'1646759365793387.jpg',1,0,'','2022-03-01 17:10:31','2022-03-08 19:09:25',0),(112,1,2,'1646759529385259.jpg',1,0,'','2022-03-01 18:33:48','2022-03-14 16:02:11',0),(113,1,6,'1646759232687524.jpg',1,0,'','2022-03-01 18:43:22','2022-03-14 16:03:48',0),(114,1,7,'1646154931894779.jpg',1,0,'','2022-03-01 19:15:32','2022-03-14 16:04:09',0),(115,1,9,'1646157446483152.jpg',1,0,'','2022-03-01 19:57:26','2022-03-14 16:05:18',0),(116,1,11,'1646158061448120.jpg',1,0,'','2022-03-01 20:05:57','2022-03-14 16:05:54',0),(117,1,12,'1646160307513876.jpg',1,0,'','2022-03-01 20:45:07','2022-03-14 16:06:17',0),(125,1,3,'1646759723569026.jpg',1,0,'','2022-03-05 09:16:29','2022-03-14 16:02:32',0),(126,1,4,'1647272291554153.jpg',1,0,'','2022-03-05 09:37:22','2022-03-14 17:38:11',0),(127,1,5,'1646466734190456.jpg',1,0,'','2022-03-05 09:52:14','2022-03-14 16:03:32',0),(128,1,8,'1646467368703796.jpg',1,0,'','2022-03-05 10:02:48','2022-03-14 16:04:26',0),(129,1,10,'1646468731886169.jpg',1,0,'','2022-03-05 10:25:31','2022-03-14 16:05:39',0),(131,0,1,'1646724130197373.png',1,0,'','2022-03-08 09:22:10','2022-05-19 13:41:18',1),(132,1,1,'1646724197346667.png',1,131,'131','2022-03-08 09:23:17','2022-03-08 09:23:17',1),(135,1,1,'1647269445238184.jpg',1,111,'111','2022-03-14 16:50:45','2022-03-14 16:50:45',0),(136,1,2,'1647269652458472.jpg',1,111,'111','2022-03-14 16:54:12','2022-03-14 16:54:12',0),(137,1,3,'1647269750960489.jpg',1,111,'111','2022-03-14 16:55:50','2022-03-14 16:55:50',0),(138,1,4,'1647270554356521.jpg',1,111,'111','2022-03-14 17:09:14','2022-03-14 17:09:14',0),(139,1,1,'1647270647458716.jpg',1,112,'112','2022-03-14 17:10:47','2022-03-14 17:10:47',0),(140,1,2,'1647270851734009.jpg',1,112,'112','2022-03-14 17:14:12','2022-03-14 17:14:12',0),(141,1,1,'164727097292491.jpg',1,125,'125','2022-03-14 17:16:12','2022-03-14 17:16:12',0),(142,1,2,'1647271218875342.jpg',1,125,'125','2022-03-14 17:20:18','2022-03-14 17:20:18',0),(143,1,3,'1647271318667038.jpg',1,125,'125','2022-03-14 17:21:58','2022-03-14 17:21:58',0),(144,1,4,'1647271934675788.jpg',1,125,'125','2022-03-14 17:32:14','2022-03-14 17:32:14',0),(145,1,1,'1647272428950898.jpg',1,126,'126','2022-03-14 17:40:28','2022-03-14 17:40:28',0),(146,1,2,'1647272522365263.jpg',1,126,'126','2022-03-14 17:42:02','2022-03-14 17:42:02',0),(147,1,1,'1647273231642250.jpg',1,127,'127','2022-03-14 17:53:51','2022-03-14 17:53:51',0),(148,1,2,'1647273300320381.jpg',1,127,'127','2022-03-14 17:55:00','2022-03-14 17:55:00',0),(149,1,3,'1647273391537343.jpg',1,127,'127','2022-03-14 17:56:31','2022-03-14 17:56:31',0),(151,1,1,'1647273756439446.jpg',1,113,'113','2022-03-14 18:02:36','2022-03-16 11:53:36',0),(152,1,3,'1647501587978457.jpg',1,113,'113','2022-03-14 18:05:50','2022-03-17 15:30:30',0),(153,1,4,'164750233168357.jpg',1,113,'113','2022-03-14 18:07:47','2022-03-17 15:30:47',0),(156,1,2,'1647502817753462.jpg',1,113,'113','2022-03-14 18:28:09','2022-03-17 15:30:15',0),(157,0,11,'1647275685369490.jpg',1,113,'113','2022-03-14 18:34:45','2022-06-17 19:56:04',0),(158,0,13,'1647275855365970.jpg',1,113,'113','2022-03-14 18:37:35','2022-06-17 19:56:39',0),(159,0,14,'1647275957300236.jpg',1,113,'113','2022-03-14 18:39:17','2022-06-17 19:59:46',0),(161,1,1,'1647277196999260.jpg',1,114,'114','2022-03-14 18:59:56','2022-03-14 18:59:56',0),(162,1,2,'164727728728775.jpg',1,114,'114','2022-03-14 19:01:27','2022-03-14 19:01:27',0),(163,1,3,'1647277377491789.jpg',1,114,'114','2022-03-14 19:02:57','2022-03-14 19:02:57',0),(164,1,4,'1647277477424759.jpg',1,114,'114','2022-03-14 19:04:37','2022-03-14 19:04:37',0),(166,1,1,'1647277913249148.jpg',1,128,'128','2022-03-14 19:11:53','2022-03-14 19:11:53',0),(167,1,2,'1647277996301502.jpg',1,128,'128','2022-03-14 19:13:16','2022-03-14 19:13:16',0),(169,1,1,'1647279468682226.jpg',1,129,'129','2022-03-14 19:37:48','2022-03-14 19:37:48',0),(170,1,2,'1647279581259090.jpg',1,129,'129','2022-03-14 19:39:41','2022-03-14 19:39:41',0),(171,1,3,'1647279702787187.jpg',1,129,'129','2022-03-14 19:41:42','2022-03-14 19:41:42',0),(172,1,1,'1647279915134071.jpg',1,116,'116','2022-03-14 19:45:15','2022-03-14 19:45:15',0),(173,1,2,'1647280198912315.jpg',1,116,'116','2022-03-14 19:49:58','2022-03-14 19:49:58',0),(174,1,3,'1647330931914833.jpg',1,116,'116','2022-03-15 09:55:31','2022-03-15 09:55:31',0),(175,1,4,'1647351036354301.jpg',1,116,'116','2022-03-15 15:30:36','2022-03-15 15:30:36',0),(176,1,5,'1647351157939546.jpg',1,116,'116','2022-03-15 15:32:37','2022-03-15 15:32:37',0),(177,1,6,'1647351405642750.jpg',1,116,'116','2022-03-15 15:36:45','2022-03-15 15:36:45',0),(178,1,7,'1647352292646476.jpg',1,116,'116','2022-03-15 15:51:32','2022-03-15 15:51:32',0),(179,1,8,'1647352352783684.jpg',1,116,'116','2022-03-15 15:52:32','2022-03-15 15:52:32',0),(180,1,9,'1647354206230287.jpg',1,116,'116','2022-03-15 16:21:26','2022-03-15 16:23:26',0),(181,1,10,'1647354283116739.jpg',1,116,'116','2022-03-15 16:24:43','2022-03-15 16:24:43',0),(182,1,11,'1647354543373140.jpg',1,116,'116','2022-03-15 16:29:03','2022-03-15 16:29:03',0),(183,1,12,'1647354955608558.jpg',1,116,'116','2022-03-15 16:35:55','2022-03-15 16:35:55',0),(184,1,13,'1647355237227385.jpg',1,116,'116','2022-03-15 16:40:37','2022-03-15 16:40:37',0),(185,1,14,'1647355378212115.jpg',1,116,'116','2022-03-15 16:42:58','2022-03-15 16:42:58',0),(186,1,15,'16473556384701.jpg',1,116,'116','2022-03-15 16:47:18','2022-03-15 16:47:18',0),(187,1,16,'1647355893503504.jpg',1,116,'116','2022-03-15 16:51:33','2022-03-15 16:51:33',0),(188,1,17,'1647356336799513.jpg',1,116,'116','2022-03-15 16:57:01','2022-03-15 16:58:56',0),(189,1,18,'1647356419305230.jpg',1,116,'116','2022-03-15 17:00:19','2022-03-15 17:00:19',0),(190,1,19,'1647361209762981.jpg',1,116,'116','2022-03-15 18:20:09','2022-03-15 18:20:09',0),(191,1,10,'1647437385527865.jpg',1,113,'113','2022-03-16 15:29:45','2022-03-17 16:08:53',0),(192,1,5,'1647438165525026.jpg',1,111,'111','2022-03-16 15:42:45','2022-03-16 15:42:45',0),(193,1,1,'1647438573591242.jpg',1,117,'117','2022-03-16 15:49:33','2022-03-16 15:49:33',0),(194,1,2,'1647438777848569.jpg',1,117,'117','2022-03-16 15:52:57','2022-03-16 15:52:57',0),(195,1,3,'1647439143462836.jpg',1,117,'117','2022-03-16 15:59:03','2022-03-16 15:59:03',0),(196,1,4,'1647439866752763.jpg',1,117,'117','2022-03-16 16:11:06','2022-03-16 16:11:06',0),(197,0,12,'1647443385874815.jpg',1,113,'113','2022-03-16 17:09:45','2022-06-17 19:56:29',0),(198,1,5,'1647446493236848.jpg',1,117,'117','2022-03-16 18:01:33','2022-03-16 18:01:33',0),(199,0,6,'1647447827653850.jpg',1,117,'117','2022-03-16 18:23:47','2022-06-17 20:19:22',0),(200,1,7,'1647448397357523.jpg',1,117,'117','2022-03-16 18:33:17','2022-03-16 18:33:17',0),(201,1,8,'1647448534542224.jpg',1,117,'117','2022-03-16 18:35:34','2022-03-16 18:35:34',0),(202,1,6,'1647451379452543.jpg',1,111,'111','2022-03-16 19:22:59','2022-03-16 19:22:59',0),(203,1,20,'164745429334510.jpg',1,116,'116','2022-03-16 20:11:33','2022-03-16 20:11:33',0),(204,1,1,'164750418471581.jpg',1,115,'115','2022-03-17 10:03:04','2022-03-17 10:03:04',0),(205,1,2,'1647504822367677.jpg',1,115,'115','2022-03-17 10:13:42','2022-03-17 10:13:42',0),(206,1,5,'1647523946278819.jpg',1,113,'113','2022-03-17 15:32:26','2022-03-17 15:32:26',0),(207,0,6,'1647524180977930.jpg',1,113,'113','2022-03-17 15:36:20','2022-05-14 17:22:49',0),(208,1,7,'1647524680865906.jpg',1,113,'113','2022-03-17 15:44:40','2022-03-17 15:44:40',0),(209,1,8,'1647525610525148.jpg',1,113,'113','2022-03-17 16:00:10','2022-03-17 16:00:10',0),(210,1,9,'164752609393949.jpg',1,113,'113','2022-03-17 16:08:13','2022-03-17 16:08:13',0),(211,1,4,'1655483476125615.png',1,112,'112','2022-06-17 19:31:16','2022-06-17 19:31:16',0),(212,1,3,'165548371996748.png',1,112,'112','2022-06-17 19:35:19','2022-06-17 19:35:19',0),(213,1,5,'165548393533633.png',1,125,'125','2022-06-17 19:38:55','2022-06-17 19:38:55',0),(214,1,16,'1655485168771647.png',1,113,'113','2022-06-17 19:59:28','2022-06-17 19:59:28',0),(215,1,4,'1655486012290714.png',1,129,'129','2022-06-17 20:13:32','2022-06-17 20:13:32',0),(216,1,6,'1655634584583901.png',1,125,'125','2022-06-19 13:29:44','2022-06-19 13:29:44',0),(217,1,8,'165563505486625.jpg',1,0,'','2022-06-19 13:37:34','2022-06-19 13:37:34',0),(218,1,1,'1655635337158035.png',1,217,'217','2022-06-19 13:42:17','2022-06-19 13:42:17',0),(219,1,3,'1655635445740090.png',1,217,'217','2022-06-19 13:44:05','2022-06-19 13:44:05',0),(220,1,2,'1655635580706330.png',1,217,'217','2022-06-19 13:46:20','2022-06-19 13:46:20',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_novas`
--

DROP TABLE IF EXISTS `category_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `partner` tinyint NOT NULL,
  `position` bigint NOT NULL,
  `level` int NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_novas_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_novas`
--

LOCK TABLES `category_novas` WRITE;
/*!40000 ALTER TABLE `category_novas` DISABLE KEYS */;
INSERT INTO `category_novas` VALUES (1,'Test','Testtt',NULL,1,0,1,0,NULL,'2022-07-25 00:30:26','2022-07-25 00:30:26');
/*!40000 ALTER TABLE `category_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_translations_category_id_foreign` (`category_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (251,'en','Logo design',108,'2022-02-21 13:55:30','2022-02-21 13:55:30'),(252,'ar','تصميم لوجو',108,'2022-02-21 13:55:30','2022-02-21 13:55:30'),(367,'en','partner sub',132,'2022-03-08 09:23:17','2022-03-08 09:23:17'),(368,'ar','شريك فرعي',132,'2022-03-08 09:23:17','2022-03-08 09:23:17'),(373,'en','Education and Training',111,'2022-03-08 19:09:25','2022-03-08 19:09:25'),(374,'ar','التعليم والتدريب',111,'2022-03-08 19:09:25','2022-03-08 19:09:25'),(385,'en','Beauty and Sewing',112,'2022-03-14 16:02:11','2022-03-14 16:02:11'),(386,'ar','التجميل والخياطة',112,'2022-03-14 16:02:11','2022-03-14 16:02:11'),(387,'en','Transportation and Logistics',125,'2022-03-14 16:02:32','2022-03-14 16:02:32'),(388,'ar','النقل والخدمات اللوجستية',125,'2022-03-14 16:02:32','2022-03-14 16:02:32'),(391,'en','Advertising and Marketing',127,'2022-03-14 16:03:32','2022-03-14 16:03:32'),(392,'ar','الدعاية والتسويق',127,'2022-03-14 16:03:32','2022-03-14 16:03:32'),(393,'en','Vehicles and Equipment',113,'2022-03-14 16:03:48','2022-03-14 16:03:48'),(394,'ar','المركبات والمعدات',113,'2022-03-14 16:03:48','2022-03-14 16:03:48'),(403,'en','Technical, Vocational and Craft Works',116,'2022-03-14 16:05:54','2022-03-14 16:05:54'),(404,'ar','الأعمال الفنية والمهنية والحرفية',116,'2022-03-14 16:05:54','2022-03-14 16:05:54'),(411,'en','Vehicles Driving Training',137,'2022-03-14 16:55:50','2022-03-14 16:55:50'),(412,'ar','تدريب قيادة المركبات',137,'2022-03-14 16:55:50','2022-03-14 16:55:50'),(413,'en','Craftsman Training',138,'2022-03-14 17:09:14','2022-03-14 17:09:14'),(414,'ar','تدريب الحرفيين',138,'2022-03-14 17:09:14','2022-03-14 17:09:14'),(415,'en','Beauty',139,'2022-03-14 17:10:47','2022-03-14 17:10:47'),(416,'ar','جمال',139,'2022-03-14 17:10:47','2022-03-14 17:10:47'),(417,'en','Sewing and Embroidery',140,'2022-03-14 17:14:12','2022-03-14 17:14:12'),(418,'ar','الخياطة والتطريز',140,'2022-03-14 17:14:12','2022-03-14 17:14:12'),(419,'en','Passengers Transportation Services',141,'2022-03-14 17:16:12','2022-03-14 17:16:12'),(420,'ar','خدمات نقل الركاب',141,'2022-03-14 17:16:12','2022-03-14 17:16:12'),(421,'en','Light Transportation and Delivery Services',142,'2022-03-14 17:20:18','2022-03-14 17:20:18'),(422,'ar','خدمات النقل الخفيف والتوصيل',142,'2022-03-14 17:20:18','2022-03-14 17:20:18'),(425,'en','Logistics and E-Commerce Services',144,'2022-03-14 17:32:14','2022-03-14 17:32:14'),(426,'ar','الخدمات اللوجستية والتجارة الإلكترونية',144,'2022-03-14 17:32:14','2022-03-14 17:32:14'),(427,'en','Administrative and Financial Works',126,'2022-03-14 17:38:11','2022-03-14 17:38:11'),(428,'ar','الأعمال الإدارية والمالية',126,'2022-03-14 17:38:11','2022-03-14 17:38:11'),(429,'en','Administrative Business',145,'2022-03-14 17:40:28','2022-03-14 17:40:28'),(430,'ar','الأعمال الإدارية',145,'2022-03-14 17:40:28','2022-03-14 17:40:28'),(431,'en','Financial Business',146,'2022-03-14 17:42:02','2022-03-14 17:42:02'),(432,'ar','الأعمال المالية',146,'2022-03-14 17:42:02','2022-03-14 17:42:02'),(437,'en','Photography',149,'2022-03-14 17:56:31','2022-03-14 17:56:31'),(438,'ar','التصوير',149,'2022-03-14 17:56:31','2022-03-14 17:56:31'),(469,'en','Engineering and Technical Consultations',163,'2022-03-14 19:02:57','2022-03-14 19:02:57'),(470,'ar','الاستشارات الهندسية والفنية',163,'2022-03-14 19:02:57','2022-03-14 19:02:57'),(471,'en','Management Consultations and Recruitment',164,'2022-03-14 19:04:37','2022-03-14 19:04:37'),(472,'ar','الاستشارات الإدارية والتوظيف',164,'2022-03-14 19:04:37','2022-03-14 19:04:37'),(481,'en','Wedding Services',169,'2022-03-14 19:37:48','2022-03-14 19:37:48'),(482,'ar','خدمات الزفاف',169,'2022-03-14 19:37:48','2022-03-14 19:37:48'),(489,'en','Flooring',173,'2022-03-14 19:49:58','2022-03-14 19:49:58'),(490,'ar','الأرضيات',173,'2022-03-14 19:49:58','2022-03-14 19:49:58'),(491,'en','Pest and Insect Control',174,'2022-03-15 09:55:31','2022-03-15 09:55:31'),(492,'ar','مكافحة الآفات والحشرات',174,'2022-03-15 09:55:31','2022-03-15 09:55:31'),(497,'en','Construction and Building',176,'2022-03-15 15:32:58','2022-03-15 15:32:58'),(498,'ar','التشييد والبناء',176,'2022-03-15 15:32:58','2022-03-15 15:32:58'),(501,'en','Paints and Wallpaper',178,'2022-03-15 15:51:32','2022-03-15 15:51:32'),(502,'ar','الدهانات وورق الحائط',178,'2022-03-15 15:51:32','2022-03-15 15:51:32'),(507,'en','Electricity and Networking',180,'2022-03-15 16:23:26','2022-03-15 16:23:26'),(508,'ar','الكهرباء والشبكات',180,'2022-03-15 16:23:26','2022-03-15 16:23:26'),(509,'en','Cleaning Services',181,'2022-03-15 16:24:43','2022-03-15 16:24:43'),(510,'ar','خدمات التنظيف',181,'2022-03-15 16:24:43','2022-03-15 16:24:43'),(511,'en','Cooling Air Conditioning and Heating',182,'2022-03-15 16:29:03','2022-03-15 16:29:03'),(512,'ar','التبريد والتكييف والتدفئة',182,'2022-03-15 16:29:03','2022-03-15 16:29:03'),(513,'en','Blacksmith and Metal Artifacts',183,'2022-03-15 16:35:55','2022-03-15 16:35:55'),(514,'ar','الحدادة والمشغولات المعدنية',183,'2022-03-15 16:35:55','2022-03-15 16:35:55'),(515,'en','Electronics and Electrical Appliances Maintenance',184,'2022-03-15 16:40:37','2022-03-15 16:40:37'),(516,'ar','صيانة الأجهزة الإلكترونية والكهربائية',184,'2022-03-15 16:40:37','2022-03-15 16:40:37'),(527,'en','General Maintenance',189,'2022-03-15 17:00:19','2022-03-15 17:00:19'),(528,'ar','صيانة عامة',189,'2022-03-15 17:00:19','2022-03-15 17:00:19'),(529,'en','Assembly and Installation',190,'2022-03-15 18:20:09','2022-03-15 18:20:09'),(530,'ar','التجميع والتركيب',190,'2022-03-15 18:20:09','2022-03-15 18:20:09'),(531,'en','General Education',135,'2022-03-16 11:41:05','2022-03-16 11:41:05'),(532,'ar','التعليم العام',135,'2022-03-16 11:41:05','2022-03-16 11:41:05'),(533,'en','Sport Coaching',136,'2022-03-16 11:42:00','2022-03-16 11:42:00'),(534,'ar','التدريب الرياضي',136,'2022-03-16 11:42:00','2022-03-16 11:42:00'),(535,'en','Advertisement',147,'2022-03-16 11:50:21','2022-03-16 11:50:21'),(536,'ar','الدعاية',147,'2022-03-16 11:50:21','2022-03-16 11:50:21'),(537,'en','Marketing',148,'2022-03-16 11:50:39','2022-03-16 11:50:39'),(538,'ar','التسويق',148,'2022-03-16 11:50:39','2022-03-16 11:50:39'),(539,'en','Car Maintenance',151,'2022-03-16 11:53:36','2022-03-16 11:53:36'),(540,'ar','صيانة مركبات',151,'2022-03-16 11:53:36','2022-03-16 11:53:36'),(559,'en','Consultations',114,'2022-03-16 12:05:49','2022-03-16 12:05:49'),(560,'ar','الاستشارات',114,'2022-03-16 12:05:49','2022-03-16 12:05:49'),(563,'en','Educational and Training Consultations',162,'2022-03-16 12:06:52','2022-03-16 12:06:52'),(564,'ar','استشارات التعليم والتدريب',162,'2022-03-16 12:06:52','2022-03-16 12:06:52'),(565,'en','Legal Consultations',161,'2022-03-16 12:08:01','2022-03-16 12:08:01'),(566,'ar','الاستشارات القانونية',161,'2022-03-16 12:08:01','2022-03-16 12:08:01'),(569,'en','Maintenance of computers and smart devices',166,'2022-03-16 12:10:54','2022-03-16 12:10:54'),(570,'ar','صيانة الكمبيوتر والأجهزة الذكية',166,'2022-03-16 12:10:54','2022-03-16 12:10:54'),(571,'en','Programming and Development',167,'2022-03-16 12:11:51','2022-03-16 12:11:51'),(572,'ar','برمجة والتطوير',167,'2022-03-16 12:11:51','2022-03-16 12:11:51'),(573,'en','Computer and Information Technology',128,'2022-03-16 12:12:33','2022-03-16 12:12:33'),(574,'ar','الكمبيوتر وتقنية المعلومات',128,'2022-03-16 12:12:33','2022-03-16 12:12:33'),(575,'en','Catering and Cooking',115,'2022-03-16 12:16:43','2022-03-16 12:16:43'),(576,'ar','الطبخ والتقديم',115,'2022-03-16 12:16:43','2022-03-16 12:16:43'),(577,'en','Events, Hospitality and Entertainment',129,'2022-03-16 12:18:59','2022-03-16 12:18:59'),(578,'ar','المناسبات والضيافة والترفيه',129,'2022-03-16 12:18:59','2022-03-16 12:18:59'),(579,'en','Doors, Windows, and Locks',185,'2022-03-16 12:23:49','2022-03-16 12:23:49'),(580,'ar','الأبواب والنوافذ والأقفال',185,'2022-03-16 12:23:49','2022-03-16 12:23:49'),(581,'en','Decoration',187,'2022-03-16 12:24:59','2022-03-16 12:24:59'),(582,'ar','الديكور',187,'2022-03-16 12:24:59','2022-03-16 12:24:59'),(583,'en','Sound Systems, TV, and Satellite Channels',186,'2022-03-16 12:25:08','2022-03-16 12:25:08'),(584,'ar','أنظمة الصوت والتلفزيون والقنوات الفضائية',186,'2022-03-16 12:25:08','2022-03-16 12:25:08'),(585,'en','Demolition, Waste Removal, and Items Transportation',188,'2022-03-16 12:26:33','2022-03-16 12:26:33'),(586,'ar','الهدم ، وإزالة النفايات ، ونقل الأغراض',188,'2022-03-16 12:26:33','2022-03-16 12:26:33'),(587,'en','Domestic and Home Workers',117,'2022-03-16 12:28:04','2022-03-16 12:28:04'),(588,'ar','العمالة المنزلية',117,'2022-03-16 12:28:04','2022-03-16 12:28:04'),(593,'en','University Education',192,'2022-03-16 15:42:45','2022-03-16 15:42:45'),(594,'ar','تعليم جامعي',192,'2022-03-16 15:42:45','2022-03-16 15:42:45'),(595,'en','Private Driver',193,'2022-03-16 15:49:33','2022-03-16 15:49:33'),(596,'ar','سائق خاص',193,'2022-03-16 15:49:33','2022-03-16 15:49:33'),(597,'en','Housekeeper',194,'2022-03-16 15:52:57','2022-03-16 15:52:57'),(598,'ar','مدبرة المنزل',194,'2022-03-16 15:52:57','2022-03-16 15:52:57'),(601,'en','Home Guard and Security',196,'2022-03-16 16:11:06','2022-03-16 16:11:06'),(602,'ar','حراسة وأمن المنزل',196,'2022-03-16 16:11:06','2022-03-16 16:11:06'),(605,'en','Home Chef',198,'2022-03-16 18:01:33','2022-03-16 18:01:33'),(606,'ar','رئيس الطهاة',198,'2022-03-16 18:01:33','2022-03-16 18:01:33'),(611,'en','Other',201,'2022-03-16 18:35:34','2022-03-16 18:35:34'),(612,'ar','آخرون',201,'2022-03-16 18:35:34','2022-03-16 18:35:34'),(613,'en','Vocational Training',202,'2022-03-16 19:22:59','2022-03-16 19:22:59'),(614,'ar','تدريب مهني',202,'2022-03-16 19:22:59','2022-03-16 19:22:59'),(619,'en','Insulators',203,'2022-03-16 20:11:33','2022-03-16 20:11:33'),(620,'ar','عوازل',203,'2022-03-16 20:11:33','2022-03-16 20:11:33'),(625,'en','Electrical Devices',172,'2022-03-16 20:27:21','2022-03-16 20:27:21'),(626,'ar','أجهزة كهربائية',172,'2022-03-16 20:27:21','2022-03-16 20:27:21'),(629,'en','Landscaping and gardening',175,'2022-03-16 20:29:14','2022-03-16 20:29:14'),(630,'ar','تنسيق الحدائق والساحات',175,'2022-03-16 20:29:14','2022-03-16 20:29:14'),(631,'en','Carpentry, Installations and Maintenance',177,'2022-03-16 20:29:50','2022-03-16 20:29:50'),(632,'ar','النجارة والتركيب والصيانة',177,'2022-03-16 20:29:50','2022-03-16 20:29:50'),(633,'en','Plumbing and Sanitary',179,'2022-03-16 20:31:22','2022-03-16 20:31:22'),(634,'ar','السباكة والتمديدات الصحية',179,'2022-03-16 20:31:22','2022-03-16 20:31:22'),(635,'en','Photography Services',171,'2022-03-16 20:37:05','2022-03-16 20:37:05'),(636,'ar','خدمات التصوير',171,'2022-03-16 20:37:05','2022-03-16 20:37:05'),(637,'en','Events, Occasions and Entertainment Services',170,'2022-03-16 20:38:17','2022-03-16 20:38:17'),(638,'ar','المناسبات والفعاليات والترفيه',170,'2022-03-16 20:38:17','2022-03-16 20:38:17'),(641,'en','Servant',195,'2022-03-16 20:40:46','2022-03-16 20:40:46'),(642,'ar','عاملة',195,'2022-03-16 20:40:46','2022-03-16 20:40:46'),(649,'en','Cooking',204,'2022-03-17 10:03:04','2022-03-17 10:03:04'),(650,'ar','طبخ',204,'2022-03-17 10:03:04','2022-03-17 10:03:04'),(651,'en','Catering',205,'2022-03-17 10:13:42','2022-03-17 10:13:42'),(652,'ar','تقديم الطعام',205,'2022-03-17 10:13:42','2022-03-17 10:13:42'),(653,'en','Motorcycles Maintenance',156,'2022-03-17 15:30:15','2022-03-17 15:30:15'),(654,'ar','صيانة الدراجات النارية',156,'2022-03-17 15:30:15','2022-03-17 15:30:15'),(655,'en','Equipment Maintenance',152,'2022-03-17 15:30:30','2022-03-17 15:30:30'),(656,'ar','صيانة معدات',152,'2022-03-17 15:30:30','2022-03-17 15:30:30'),(657,'en','Tools Maintenance',153,'2022-03-17 15:30:47','2022-03-17 15:30:47'),(658,'ar','صيانة أدوات',153,'2022-03-17 15:30:47','2022-03-17 15:30:47'),(665,'en','Equipment Renting',209,'2022-03-17 16:00:10','2022-03-17 16:00:10'),(666,'ar','تأجير المعدات',209,'2022-03-17 16:00:10','2022-03-17 16:00:10'),(669,'en','Tow Truck',191,'2022-03-17 16:08:53','2022-03-17 16:08:53'),(670,'ar','السطحات',191,'2022-03-17 16:08:53','2022-03-17 16:08:53'),(683,'en','Cars',207,'2022-05-14 17:22:49','2022-05-14 17:22:49'),(684,'ar','سيارات',207,'2022-05-14 17:22:49','2022-05-14 17:22:49'),(697,'en','Pet Care',211,'2022-06-17 19:31:16','2022-06-17 19:31:16'),(698,'ar','رعاية الحيوانات الأليفة',211,'2022-06-17 19:31:16','2022-06-17 19:31:16'),(699,'en','Massage and Physical Therapy',212,'2022-06-17 19:35:19','2022-06-17 19:35:19'),(700,'ar','التدليك والعلاج الطبيعي',212,'2022-06-17 19:35:19','2022-06-17 19:35:19'),(703,'en','Storage Services',213,'2022-06-17 19:40:29','2022-06-17 19:40:29'),(704,'ar','خدمات التخزين',213,'2022-06-17 19:40:29','2022-06-17 19:40:29'),(705,'en','Car Renting',206,'2022-06-17 19:48:31','2022-06-17 19:48:31'),(706,'ar','إيجار السيارات',206,'2022-06-17 19:48:31','2022-06-17 19:48:31'),(709,'en','Heavy Transportation and Pickup  Services',143,'2022-06-17 19:54:27','2022-06-17 19:54:27'),(710,'ar','خدمات النقل الثقيل',143,'2022-06-17 19:54:27','2022-06-17 19:54:27'),(711,'en','Small Truck and Transportation',157,'2022-06-17 19:56:04','2022-06-17 19:56:04'),(712,'ar','الشاحنات الصغيرة والنقل',157,'2022-06-17 19:56:04','2022-06-17 19:56:04'),(713,'en','Pickup and Transportation',197,'2022-06-17 19:56:29','2022-06-17 19:56:29'),(714,'ar','بيك اب والمواصلات',197,'2022-06-17 19:56:29','2022-06-17 19:56:29'),(715,'en','Trucks and Transportation',158,'2022-06-17 19:56:39','2022-06-17 19:56:39'),(716,'ar','الشاحنات والنقل',158,'2022-06-17 19:56:39','2022-06-17 19:56:39'),(717,'en','Car Wash',214,'2022-06-17 19:59:28','2022-06-17 19:59:28'),(718,'ar','غسيل السيارات',214,'2022-06-17 19:59:28','2022-06-17 19:59:28'),(719,'en','Cars and Transportation',159,'2022-06-17 19:59:46','2022-06-17 19:59:46'),(720,'ar','السيارات والنقل',159,'2022-06-17 19:59:46','2022-06-17 19:59:46'),(723,'en','Touring Services',215,'2022-06-17 20:13:32','2022-06-17 20:13:32'),(724,'ar','خدمات السياحية',215,'2022-06-17 20:13:32','2022-06-17 20:13:32'),(725,'en','Babysitter and Nanny',200,'2022-06-17 20:19:03','2022-06-17 20:19:03'),(726,'ar','جليسة اطفال ومربية',200,'2022-06-17 20:19:03','2022-06-17 20:19:03'),(727,'en','Nanny',199,'2022-06-17 20:19:22','2022-06-17 20:19:22'),(728,'ar','مربية',199,'2022-06-17 20:19:22','2022-06-17 20:19:22'),(729,'en','Motorcycles Renting',208,'2022-06-19 13:26:56','2022-06-19 13:26:56'),(730,'ar','إيجار الدراجات النارية',208,'2022-06-19 13:26:56','2022-06-19 13:26:56'),(731,'en','Tools Renting',210,'2022-06-19 13:27:08','2022-06-19 13:27:08'),(732,'ar','تأجير الأدوات',210,'2022-06-19 13:27:08','2022-06-19 13:27:08'),(733,'en','Drivers',216,'2022-06-19 13:29:44','2022-06-19 13:29:44'),(734,'ar','السائقين',216,'2022-06-19 13:29:44','2022-06-19 13:29:44'),(735,'en','Medical Consultations',217,'2022-06-19 13:37:34','2022-06-19 13:37:34'),(736,'ar','الاستشارات الطبية',217,'2022-06-19 13:37:34','2022-06-19 13:37:34'),(737,'en','Human Medicine Consultations',218,'2022-06-19 13:42:17','2022-06-19 13:42:17'),(738,'ar','الاستشارات الطبية البشرية',218,'2022-06-19 13:42:17','2022-06-19 13:42:17'),(739,'en','Veterinary Medicine Consultations',219,'2022-06-19 13:44:05','2022-06-19 13:44:05'),(740,'ar','الاستشارات الطبية البيطرية',219,'2022-06-19 13:44:05','2022-06-19 13:44:05'),(741,'en','Medical Test',220,'2022-06-19 13:46:20','2022-06-19 13:46:20'),(742,'ar','التحاليل والاختبارات الطبية',220,'2022-06-19 13:46:20','2022-06-19 13:46:20');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `earning_year` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certifications_user_id_foreign` (`user_id`),
  CONSTRAINT `certifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_debit_cards`
--

DROP TABLE IF EXISTS `credit_debit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_debit_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_month` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_year` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_debit_cards_card_no_unique` (`card_no`),
  KEY `credit_debit_cards_user_id_foreign` (`user_id`),
  CONSTRAINT `credit_debit_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_debit_cards`
--

LOCK TABLES `credit_debit_cards` WRITE;
/*!40000 ALTER TABLE `credit_debit_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_debit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (3,1,1,1,1.00,'2021-07-18 21:16:42','2021-12-29 19:44:04'),(4,1,2,0,0.24,'2021-07-18 21:17:12','2021-07-18 21:18:17'),(5,1,3,0,3.75,'2021-11-24 01:56:00','2021-11-24 13:46:28');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_novas`
--

DROP TABLE IF EXISTS `currency_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `is_default` tinyint NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_novas`
--

LOCK TABLES `currency_novas` WRITE;
/*!40000 ALTER TABLE `currency_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_translations`
--

DROP TABLE IF EXISTS `currency_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_translations_currency_id_foreign` (`currency_id`),
  CONSTRAINT `currency_translations_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_translations`
--

LOCK TABLES `currency_translations` WRITE;
/*!40000 ALTER TABLE `currency_translations` DISABLE KEYS */;
INSERT INTO `currency_translations` VALUES (11,'en','EGP',4,'2021-07-18 21:18:17','2021-07-18 21:18:17'),(12,'ar','الجنية المصري',4,'2021-07-18 21:18:17','2021-07-18 21:18:17'),(19,'en','SAR',3,'2021-12-29 19:44:04','2021-12-29 19:44:04'),(20,'ar','ريال',3,'2021-12-29 19:44:04','2021-12-29 19:44:04'),(21,'en','USD',5,'2022-03-14 11:03:04','2022-03-14 11:03:04'),(22,'ar','دولار أمريكي',5,'2022-03-14 11:03:04','2022-03-14 11:03:04');
/*!40000 ALTER TABLE `currency_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` tinyint(1) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `lang` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_user_id_foreign` (`user_id`),
  CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (606,'88181F20-8219-4BD9-BA8E-DFC132B07CC0','',2,272,'en','2022-05-27 10:28:40','2022-05-27 10:36:56'),(607,'88181F20-8219-4BD9-BA8E-DFC132B07CC0','',2,270,'en','2022-05-27 10:34:03','2022-05-27 12:01:39'),(608,'A72C965C-DB71-434E-BB21-9DD26F8C1855','',2,270,'en','2022-05-27 11:51:45','2022-05-29 00:49:30'),(619,'237959B8-9A5A-4003-A79D-736D87B15A43','',2,272,'en','2022-05-29 20:43:00','2022-05-29 20:44:17'),(665,'4DC4250B-AB36-49B8-9A5D-6D61037131F3','c9CnDDbEdkfynUkrOHxCUQ:APA91bHl_Ka8uUDP0uWwc8MTQmknOpTe9V5RA8WyDv9T1zWHiL2yOwK4alYfNn1vkM6lSnrdTrxEAxL0_7tO9JQ8O8waRfNi6qHdq9dG27GybJFBQizSFFDi0YS9gK41J40ZWYcA-ya_',2,290,'en','2022-06-06 00:29:16','2022-06-06 00:29:16'),(666,'b9d5cef3-830f-3420-8e40-d331ac355fa0','fxD23DevR8i0IUEynrkpmI:APA91bF8237ddFNoSnUe0jM6rUoHt1Zr0DThenGbk27FS9IMoDmBDu1HqX0Q7_NKuZZKqYWWiT27JQaIcaJpGSEyKoc-5ep5dj1oWwo6HY9crf_b1jJrzcDeZ-XuMykf8Akg6carD7eL',1,291,'en','2022-06-06 13:05:48','2022-06-06 13:05:48'),(668,'9EF7D6D3-6874-41F4-BF10-3312A3B2687C','f9gcEW7kukabq45TfdQPK_:APA91bGx7aWWiY4F3te0IrxQQQ2ypWwkekB5cSDc4cztjxppFvGavpRiK44ntsCoBG7Gp9WzZejgA0WIWF0K5HODhc78R-GSCUlziS5Sb_vdjzgJUpkl43WcJa3l2k4ZQhtpo0klfSap',2,293,'en','2022-06-07 00:32:42','2022-06-07 00:32:42'),(669,'e4ab82ed-0ce0-36e8-a94f-1abccf23643b','',1,294,'en','2022-06-07 00:33:20','2022-06-07 00:40:10'),(670,'65E76250-451E-419B-9E8F-5C26035DA2C8','cTtql3mnukDTtI0hogn9Fe:APA91bHJc7MlVlYalW2EZvIqG_3_x9HAPOku97YgxtQelUfUu4EHh5YS-0UyVyA3jKidAYHdbrBXs0pGW5LdYctCr8vVVQmZDIctso9AW-XAdfcmGx5fep54Y8rlA3u_WyH1tHaBrdOJ',2,295,'en','2022-06-07 11:31:59','2022-06-07 11:31:59'),(671,'955E3A31-FC3C-4630-9F88-0E2893677463','er9_XA4VqUvnnGNZ1FY7Gk:APA91bGT4WiGA-TWz7HOLsu9Ys5G_LB2tOoV8UadiMsb8tIw8OOOy_GyzDdbNYDQbpCWpA2Z68i-qFC5mjZzjtmPm4zeDkmms5dw2CwTftuxNuHEZ1wBf5i42qAWR0upNAEwY6QFlh2g',2,296,'en','2022-06-07 12:33:56','2022-06-07 12:33:56'),(672,'5caad288-48ac-3b20-b0b3-df04e1c01de4','ei2kU5uAR929DRWWhJQrva:APA91bGFYADaJM-JLZ3OtwesdiERTqaLi9C-RU4EcYDEvw2pkMLTakim7uw9cUq_6TbdUHnLSrf5a7M2LJh9OruCj0P--TO5yRkBRXPQ6F5Um1vjdjQiINCcnCeYp3Zfli_kwUgvBh4U',1,297,'ar','2022-06-07 15:58:01','2022-06-07 15:58:01'),(673,'78401035-a02f-353c-ad07-8c1fb9840f30','dExgYTOCTyGrRRKwbMuubj:APA91bH-quZKU0ki2hdcgv-rfPUSIUBJTphwWvoAz49QH_Abie6xxM1CmNPoGmobPqSGzjdy-p-X6dBnG6jFniASqwfX9sXq2iwCowYxTR-9ZfOEGiDXyw6jTMr_KWwGEnIxHimlfLcB',1,298,'ar','2022-06-07 19:04:07','2022-06-07 19:04:07'),(674,'0c085a36-30d7-3473-886c-e946cbddffd9','dIcrhP3pS62r4sCUw5_2gI:APA91bGfLWbGCtDxVbfdUqYdT4GiRLjHWxr-csu3WJU8cx0tqEq4pHjh4SKFQQOvjw-ChMJ6RbingQgOFO3vHp8TtukHj86hRBmIgpSRZfK4cOpZZrWEgobBgMZMFIq0WS5xTfvMRrrf',1,299,'ar','2022-06-07 23:18:08','2022-06-07 23:18:08'),(675,'AAA3D7F0-797B-418B-992F-218063C9EC86','',2,300,'en','2022-06-08 11:36:26','2022-06-08 11:38:52'),(676,'91A4FAD0-0A97-4D9E-8E1B-6FF20B2D6E72','d1P6M13APUIosg_S3B4Gog:APA91bE0CENy3PA7rHcBT_Uo9-LFvEZvU26Awu-hUasAa-2hltv6RRsXogVZV6_mgzEdbus6CvtF-4Qhk9ErYoFQAVrXyE7TLnCYFwcDLXedVxEqXTHLPnBvjbNuriSue7xOs7DoPZWK',2,301,'en','2022-06-08 18:55:59','2022-06-08 18:55:59'),(677,'ed0fa71e-33b5-393e-964d-ea774b8da3b9','cLTw70SDSyuUlGsukNMKTS:APA91bGAJQV8rtIremurfEVB_gPMWQLpjYH-SccEofnFjhL0JmBfkSNGZvlhav3mZpAJPGAjFUUIR7TqQt1C-dvVyAdZZPxlpscaVBTh6sivGufULSFPm582toiHBfgrH0lyydowdsb0',1,302,'en','2022-06-08 20:21:48','2022-06-08 20:21:48'),(678,'c1c7ec94-1ead-3eb9-9206-8f5ca8e53dee','eLib19t5Tmak2axm2d1TUU:APA91bHHa-PjR23Q0BsHhh5HV6-lT85Tje9afnjtvv3JjZkk0yYSi72r3eITFpEcAOmrlHqO-SQ-cV2aSz3tU5L0twyKEHNft5z65pgDfUUPDm0nTyPDo686Wc3mJioDPaLBUNtJK-Un',1,303,'en','2022-06-09 00:26:22','2022-06-09 00:26:22'),(679,'59d5b7e9-87e8-3fab-b6a0-088ac7221375','fEq9KaEkR1GQz4M0Xo7wGc:APA91bG1Zz8gmobQGI7_MB2Ur69MPibP0t1-hdzIGJnXAlouI40s-72xTREYJPv7sO7UbuD_6P9i5HcTp-e17WeJRDWgA4vIb9LfPV0cygOvwmowb1rKcrcXrZKFhSQJPbOOPB6P7VxK',1,304,'en','2022-06-09 20:59:38','2022-06-09 20:59:38'),(680,'0687C1BD-5E6F-4D93-A327-3EBEDD89E5E0','clM0VCWaFkhuo5WXcB7FBA:APA91bFYeL8hGv_qjqWQJHyGqEu6ZTn8OQD7toJiByhWIPUYL0e8q5kehSvFoRa42zW4c8OgATHT-JZFBz4dk6jom10EGiTTT_pZAzFM7_LiCA8yvPP1ehTRPWcqBXOCfrb-sl8meBBx',2,305,'en','2022-06-09 21:49:10','2022-06-09 21:49:10'),(681,'F1AD9D05-D8AB-44AC-AC9A-78FC2BFB845F','fY6A6SP1600qlZtzUO-F9h:APA91bGchV0z8sInHkhpI6wKbzj-djhG2oBiEBPmi3_jba1fiNI_Tn-XzXnnyt6W7-CH3gP9phAnlfHq3rCYzMKw2eX2FFsM8PNv7gyRhEhZTHWQHkCwj4f79ZFEzJqy4NriYjU_nIaY',2,306,'en','2022-06-10 00:12:29','2022-06-10 00:12:29'),(682,'BC766279-0B05-4D50-B459-6C71EFD5807A','fSpPFBENBUxatzQcwShdVu:APA91bGmirw0SpGpCj9o13r5_QGepdJRC9ndFWHy_8SWhUV1rXhmNo9aD0qNk7deiyTFlZ0hk7wJMICrR7KnMOBOPYYO9TbSjz14X9wOWx2yCb9kwxSNFXMfYXi2mMTdr4wIU_kElYru',2,307,'en','2022-06-10 15:11:04','2022-06-10 15:11:04'),(683,'ce3c6625-8f62-3496-8f8e-b5b679fa2f8a','cgSndgeTQNeiI1kAca4j8S:APA91bGmVLFZzju8PYOCA8JjVBOXgcA3Duj6XD0AGCOnw6XYMQGHza0zl_p_3hLDZhBUYOD3lvkCS52t0iZiN-8PCXRsPmebEcxuUxMdPCrmgV-ErX76wNPkyC3dUFdh7NNsvQTkDbuF',1,308,'ar','2022-06-10 20:42:46','2022-06-10 20:42:46'),(684,'3c3c59e4-26a4-3ef6-be32-a67ee3960a64','fVlYQgSmS9WFUzeFs7WGma:APA91bEIHJB7Jvdvq11aH98Do0Qp0zOYhM9RXHHpRSmbSD_wRFY_MEkEs8TnCHxKSkKhon8DW0f6zafZHEBh2Psz0Y47vfFg9Rz20S7DqskLVjil7JoDOL4hCZ9gn-TFd4gyIarStM6f',1,309,'en','2022-06-10 23:04:49','2022-06-10 23:04:49'),(685,'f3578373-b408-333b-a31e-9793a1127f23','fBBdG-XzQEOHPi_UTdMVwr:APA91bGKbW-sFacKo6eB9yINFwbXWtpSdG0tWx2oGtU65JNqDOux9qUxcL77l8mHnSVplxFWAu99SDI5jD7oEQGUVwCsaiz5GFtLikzCzfjtCOkcIXxfRmHI9kmI_JFah-Sg5LEPlupB',1,310,'en','2022-06-11 05:50:15','2022-06-11 05:52:50'),(686,'C881A596-E09F-4035-B07C-6438337B5FF0','fn3n6FxacE4Dten92shCHn:APA91bHPEXbuLVB58avopGvm_BwBeCDkvit39wh9sv44Z-lGKjY1e9b24Qi-LpxVnsEUXJHIRbmFYfYr1ei8279mPUp8RE9Z5Gls6vjni5gXG3UjkYirWSe3xU95M49TeLpn4yEvzTXz',2,311,'en','2022-06-11 12:41:25','2022-06-11 12:41:25'),(687,'804c8f25-e8cc-38f2-9068-34203dcd338d','cJvfP5agTHi6eOVYxi3Rxf:APA91bEPn2RGy-iJZy_tG1d4VgMfBOrGdTUs5QHeXOaIEJe9V-85pFuT62NyJCDeft0trKbF8uVcz-hW1Lc8_BMk4mZ3uTwK_xPyvDobTTxbku_DjyGmU_IKfyBmpIa9jMoDazp6PI20',1,312,'ar','2022-06-11 13:12:57','2022-06-11 13:12:57'),(688,'3FA9EF0E-0E20-47B6-A894-14785E7006D5','cNTqTfkYG01KnKcqWk-9bN:APA91bFPGKA6v7qqurzvm8nyqSQ4DHrkiZ3XIDszzPz2Kp-0BtE9PmibjURxAF4S1Q6ZRTD9CnN67HQF4eXvrJjCk9tCMIqmm2I6IJYDBfpr4rM8HFrhO9q9PfymDCDH9pAfyaOn8ojg',2,313,'en','2022-06-11 15:40:09','2022-06-11 15:40:09'),(689,'cf649eb0-dd3b-339b-8be8-2e1809580a56','eOltWvM9Rx-2XibqzS7mW2:APA91bG3tSmKx57bAehqxBXF_ed-e5ptk16Nn9O4wl_Ms7hZt88oH658-UV1sYd8boOvUgMrZ04R6G68HiCPQU8lzuONRwGa3l0a1TfmJocW9gpUEwhrP-WXNWasQ-IjvtMc6oWLUY4w',1,314,'ar','2022-06-11 18:00:51','2022-06-11 18:00:51'),(690,'5F4CDEF3-B1D0-4ACA-9EB9-3096EC1BDEFA','capMAZCxLUvilnw7VbY29s:APA91bH5PsC2WJmNMIjzvfzwVEvNWCk0d5KrH3rM16fbtFgSzPmiNQREZlvbt7nwEynVlx_0DWzUHPfOAtq-3rNvFrIB2kjWEqUz6nN-IAHHslVcAPK7QnC9AhcTz6txh9qwou5plZPI',2,315,'en','2022-06-11 18:13:16','2022-06-11 18:13:16'),(691,'C35C4260-F233-491D-BE2A-DCF2F209DB8F','fhxLoTNbfUcMpuIiICR9nG:APA91bGOJwbw69bnvXxZcyoWnKwt4vBIVqiPAYgAzxKtawKL_vSCW_K7RLJFuDhkn5hHV9mM6jlqjihBkHvli7PmJoB91Olzs8LXXDEY2NuKbPs2eOoBcPlzsrPx58wn9_gHbpMEEA4G',2,316,'en','2022-06-12 07:15:48','2022-06-12 07:15:48'),(692,'660D6A78-209F-484D-9F1F-1916C7E26EDF','dCYi6lgImUFXgJDasJvZYw:APA91bGuzCAcmXP1lLTPlDJcG0_kJKUdOHvhiMDkZ7I1UsAZRrpzlHxgnVXaC7e7TPHoszyqlinrby2a1kIdXpz9SDjz_qGsfJ8ZXUyELsqPOoghnYMORMIpYVqG0YR5AG60CvLpxE7i',2,291,'en','2022-06-12 21:29:32','2022-06-12 21:29:32'),(693,'E017875F-A4D1-45C4-92BD-3300A966A294','cdCGYX4oR0gUug9sY2Kp1d:APA91bGrmT-bwBuW8UC24wEHnuQv1wRRMJ_-MnRN1G8FZw2ePGSNSthKdWI-KCFgN58sb8OXTpiUXiWt35Qoobrlcg4Qc1YqhHWBU7SP3KFVNtT_njNodslJeKYbXIWio-pnMiO68lZK',2,317,'en','2022-06-12 21:57:18','2022-06-12 21:57:18'),(694,'3A793D02-95A7-4F71-A2A8-0D97811A899C','c-8Y5bshu0I5rYKmkZQc4Y:APA91bGdqs0hemy04GNZxrOruMr9stjA9p34BR1YOiVhTm5yg3B1C2xq5PnCw3bHSk9v_2ohcnThYuEAf3QHTMQJG0Z9quJckhXRxulbHHzFRVAb4CeopEcHf9qw9d2k24whY4zWiF6s',2,318,'en','2022-06-13 08:57:14','2022-06-13 08:57:14'),(695,'6F2F2418-A91C-4D88-9C17-8D3ED770C63A','eA4o60r3tU87tyQxFPZzS9:APA91bEeKQA_6ubXB8MDhHFj9YeZ9rceF1CfXkFuzU1FO4Iwz-sf6n_dvWJFVvS-MRlOdcN7CfZGA1ox4zSFAnV6Nn4XVL26MvHdy99bWtRE3CMdWX0Lpr1_sA7Xd1oCeueKKyJr8xFq',2,319,'en','2022-06-13 17:32:39','2022-06-13 17:32:39'),(696,'0E90836A-8C83-4A1A-923B-2FD53267A658','fjJin8v6kULEibVHx3quxC:APA91bGgvaJj1WRHiL0OT6w59xeuHSxTHIsPBOOAOWjupOm1mKbjnZ2-lOJBgZFLNAXLcNQraLCUyVzEAFr90bsMQEv2NhpZCxrXGmbFoez8MtqwO4lU_qQ2Q5kjxGJpz632slDEBs_A',2,320,'en','2022-06-14 12:43:38','2022-06-14 12:43:38'),(697,'52FDFADD-F3C7-4D43-914E-B7986873C337','cga79VCmzU6OvAlpcwCfyy:APA91bFfsEr26GKI6YHyqAMkn45IrwF2LlnL41vREnKB8rH7Mo3Lqj8t4Qv7PX-oLn3KUs-ZIW1CYGUYwIiXA_h-hHUax9-jI2YEjfGP8nn2F1raqgC1SjLCSjnfw7hS0JG2edm4rAey',2,321,'en','2022-06-14 22:01:58','2022-06-14 22:01:58'),(698,'7529d14c-451c-3ed1-b540-a9b0f66fe2f1','c68ChVENRlyqll9pM8y_eB:APA91bFfwo6KMUpWXNx6Ev7DfluEg0qYr8wShyEZ-S0W4sG0-DOAXGG3RRzg5T1VrGqQRLYS5tX7jVhl-pD8R-6DKCiCIDsQGbUKRd3f59B7I-YUAthAy5O_7Jz-cixEUASWSsDIafZP',1,322,'en','2022-06-15 14:17:30','2022-06-15 14:17:30'),(699,'F16E0340-F28A-4D92-964B-2F362570DA1C','eCC2IOkN2kg2uVo-39MrVX:APA91bGw55cSk8q7R__gnpcl2N-OErlxAtMpqqwJHOl42uzowphm9rjSfRmtS5kzjkdJJrx_a-6dJ64Qobcv8j8BOew1S-9bB2HpHgl7bWZqNJnLU14cWActrMxWnLolKEpqip-DlOx2',2,323,'en','2022-06-15 19:25:09','2022-06-16 19:49:19'),(700,'7B4089BF-B549-4B8F-8167-08A3B4B5C53C','fz0nCSiwgUihpLkf5z-4oH:APA91bHY10bsQGMfK09qlDW6sz65YZdEjT2ox-1znfcdZ-ttN4haB4Gkr2w_zxDI0do4s3i1r4W75vhiICpm4pK_Ff7zV9bhcvfgSeGS15mAVWsN0hs3olfF2cePwNvfvO6eZkB4irxQ',2,324,'en','2022-06-15 23:37:43','2022-06-15 23:37:43'),(701,'8f7b5f30-e927-331d-8e94-bed42ea117d2','dkrv1ukhT4utx2gL5xEjJ-:APA91bFWzkymAKi_lkco8xnFSUPktWfiD9oTor0bKTGAPEmErEQPCHeQztmVm6mJQtmFvu6Y5yGTmA8vTGYAw6UV3tR0M3-UE1bdDKGrlvLf7iUjBl_TwKVSr9HODxzTvfEliwzs9znH',1,325,'ar','2022-06-16 12:11:31','2022-06-16 12:11:31'),(702,'F16E0340-F28A-4D92-964B-2F362570DA1C','',2,326,'en','2022-06-16 19:36:47','2022-06-16 19:49:02'),(703,'CFFD6F79-CC10-4FE5-AA6D-78634ADCCAD1','eN73lM3Gok8ml0eLYSnhj1:APA91bFkQ_3rmr_FMU__kCMBelKNQdzxnok7ohEION5VAbldvA9tK5WIWHdcyh77ibjz8fRBHBwgpSyBrXJXqXFTPrSVAyeVQBlwTZJrFW-ouJK5s9kaEzG4aBeDgI83FXJgsZfAAvLo',2,327,'en','2022-06-17 13:13:31','2022-06-17 13:13:31'),(704,'F61A32F5-73C3-425E-8E2F-D3390257403D','cuGd9G6fi0BhvfpbDq8jca:APA91bHdzU2uHwangdXk2rHMXyy2mJI1PtmcxGmU1qp5GAU0tvNw1AKF4Z1qTTfLxxek-UIvnFSfc4OPjCaBZUrLXWnpHocVRnR8NKyS5f4uRWWu-_I46_1dFFJHRFMKKEjdnGOGnMBP',2,328,'en','2022-06-18 17:32:48','2022-06-18 17:32:48'),(705,'E191A131-E228-48B0-B063-1B6E7E850D0B','flOBKtJmx0EwuPe5krUikG:APA91bHPEKEjuN0vrEwI74Ju38J8kIq3jhv1dYoO7QlGwHUxtas5QvJ-EWSOov_DWzazxB0ovlhtAiPMwgXq0sU9aFq2VJJVlxfwk20gmtq53xB8hRcLSUCJmmKWeQtplDr9egmDhyit',2,329,'en','2022-06-18 23:43:50','2022-06-18 23:43:50'),(706,'9EF7D6D3-6874-41F4-BF10-3312A3B2687C','f9gcEW7kukabq45TfdQPK_:APA91bGx7aWWiY4F3te0IrxQQQ2ypWwkekB5cSDc4cztjxppFvGavpRiK44ntsCoBG7Gp9WzZejgA0WIWF0K5HODhc78R-GSCUlziS5Sb_vdjzgJUpkl43WcJa3l2k4ZQhtpo0klfSap',2,330,'en','2022-06-19 00:45:48','2022-06-19 00:45:48'),(707,'9EF7D6D3-6874-41F4-BF10-3312A3B2687C','f9gcEW7kukabq45TfdQPK_:APA91bGx7aWWiY4F3te0IrxQQQ2ypWwkekB5cSDc4cztjxppFvGavpRiK44ntsCoBG7Gp9WzZejgA0WIWF0K5HODhc78R-GSCUlziS5Sb_vdjzgJUpkl43WcJa3l2k4ZQhtpo0klfSap',2,331,'en','2022-06-19 00:46:53','2022-06-19 00:46:53'),(708,'12345678','1',1,331,'en','2022-06-19 00:48:19','2022-06-19 00:48:19'),(709,'6e16022c-32eb-3188-8e12-6631725ac58c','eQmBtpU3T--OZctl7EqWuJ:APA91bGBYqKQBU1cs0Tlf02y6HNn_P-B_kpfHgRbzp9yPOipKDmykfwPlsscvPfcJvv8cC3IMOS84Y2HEMZLT77MFxAPJaS0dyukTVPjAxz6l7bGLlApIBv5cqv6zaDpt8DEXB0uNjmP',1,332,'en','2022-06-19 10:13:48','2022-06-19 10:13:48'),(710,'F1EC6E58-12C9-4DFF-9D46-90B8292B0D8C','dv2SXg31YU1KiYb3BB5kQl:APA91bFxqrcQYYrSr8x1z58668r29Pkb_z93lmSvrMxm-ozPScIkjyEX7taZUT84ULJpLrLpF8nSQzCMkBTej2Tyn2qVO-cgDefh1Aa3eSVwraZ-ap4AcPIxjmu1LJkhYUj49ngZSmNR',2,321,'en','2022-06-20 16:55:16','2022-06-20 16:55:16'),(711,'3A7C666B-28D8-4B7C-86A8-CF10AE7FB16B','cjbb4CGPHUcimdfYix6DFY:APA91bEyRMVFVb0Io6mOH7hw6jHB_moxa0c9ckxiYSXMBp8cynTU3yncE7omw18uQk8uf-s0LWhXu3aSaURf4O5pes_bQcxXQ1s05rVJleT9xmXsyBhY4pPGMF35xNOkcl4C3__c-0sd',2,333,'en','2022-06-20 21:12:22','2022-06-20 21:12:22'),(712,'F8B527AF-6A2E-4DB9-A713-05F94A1CAF0B','dIivvZIODkuzu0Pq1VHHMC:APA91bEfcktK8Sy_j21K6HnisKqFWSOAKXLf5uYqPsmfhHINS2PaqDmqqVsEeEyw_FoJe7VoMMVj4SukTBhmfC3TIFTSfCE_SDS4CFCbFBs3KLloaNEZGmfPb9W5L2TUVzxLHqliG_9f',2,334,'en','2022-06-21 22:24:31','2022-06-21 22:24:31'),(713,'3c711edf-8753-3ee0-92d0-1baf47daccd4','eRpbfCjfSK62VU4FqJv4zy:APA91bH344-CfTFQVjDIis0Ao2G7ZJQLupbkIBiG0xw5Erqb1TXH9fWKizqv1juaZjFbOOhiDevdJ-JyVykxZjVk7KcnTLYL_vg4m5QX6fkXNuHNFT0tqZ811IoaAIcpSmXbJgUV6EXQ',1,335,'en','2022-06-22 02:03:06','2022-06-22 02:03:06'),(714,'91CBB0FB-406A-4961-8DC7-CD75F07DB215','eCC2IOkN2kg2uVo-39MrVX:APA91bGw55cSk8q7R__gnpcl2N-OErlxAtMpqqwJHOl42uzowphm9rjSfRmtS5kzjkdJJrx_a-6dJ64Qobcv8j8BOew1S-9bB2HpHgl7bWZqNJnLU14cWActrMxWnLolKEpqip-DlOx2',2,336,'en','2022-06-22 19:47:17','2022-06-22 19:47:17'),(715,'35DB775A-46D8-423E-AC8E-3ADC4FFD28C9','ezr1wmNtoEWUrQgG2n7CHX:APA91bF1rTMteODWe7KeA0fyC9w8z7tVM_GSQf7N4LEGjnus3kgGy6TOCN7Df_0ZswA6O4qGb5Fp4ehC2sfckGQ_l5p5G2xhwJL55LRROe8PyPITzrGGB0U6fZShg7jg0tbi7t7CAQP5',2,337,'en','2022-06-25 22:25:30','2022-06-25 22:25:30'),(716,'A3DB613D-FC82-4E8F-B6CE-7E4E50CFA2A0','eKVXHN94IUTulRUAIGaUjV:APA91bG1AeDbAr1V1pTpwfWir-WX1mM84faewUBUODpNR8Jp00-i3_g4KLYhKEDaDTCC5D50w62IgU6VPGYNRUMeYedAm6GML2SJArlzexBYb3F34kRhFs3z1WBKNNzCvdNKCY7w5g0o',2,338,'en','2022-06-25 23:17:13','2022-06-25 23:17:13'),(717,'40c7d460-ddc8-38c2-a353-882304d2092c','feS_AgLmQlKYl0rkUHJw_E:APA91bFEA-tViaGA7ubmDVHQkWHOqlbtHzzql9Ox1Qenl6f7X-N0u9Z8ONL9b45STY_y1qWHdUDJ7l9i1gYGfUMyFpx222WeghE4MGzKuIWZy71syroX2BxI9AUrjrMw9cEoRRGMWtLR',1,339,'ar','2022-06-26 14:41:37','2022-06-26 14:41:37'),(718,'6E436499-779B-4A41-BDF0-3BE2E915871A','eoulM3VPG0UEvmUf_yaPmF:APA91bHm0usu5-2a3vZAa8Y1S25orZ9mAJMybPfAmpO8Kt8JZOrHnPHDYH8kCF0-057BBMHt08k8P1hBuLiL-vZ8TSssMMTXWV8kf3T-OexV3HrlZR4OTlyeJVHgljuqs4rEsO2gdJNb',2,340,'en','2022-06-27 09:05:56','2022-06-27 09:05:56'),(719,'A783A833-1AEF-4139-BB9E-0CC63DA66454','eP6qjEWsB0yIjA_gBKgycl:APA91bFUOxbW4JYdXhjXzAYQzvwWexo8X2MBsGNE3zVekY6a82xxWbCy-qJmquSVE4SmQjmiUvMfTqRdjdXUSwoQHjpT6ZOrK01cQPlqv1Z385gk68L_8y1zZOouJzpXx6PqsM0pNcA4',2,341,'en','2022-06-28 20:49:35','2022-06-28 20:49:35'),(720,'821C6047-D448-4167-9C68-D8F857BC4AB1','fq5lTiw9TEzRo5LjTxvAwE:APA91bECJy2SHvXvCX-QSRxZcKzpOtiNRDTmbYbrm4a4_PSbGH_egjCsSPl648MKWxrcJVZSN_VQd_oYYALh2sgLDE-6cRqBVRkhzB4wX75M8q09AmjSbWu1j8dAzCRcME3kd2VSFzNU',2,342,'en','2022-06-30 17:09:18','2022-06-30 17:09:18'),(721,'8BA2D71E-0459-4B6C-8D09-1B27344CBCEB','cZhToGNUm0FXlMTDCWlVsF:APA91bGu2JXUu_C2GmDrepzb1JM4R5opxjT3qHkaOFQiNhv1k30c2CeX5r0k5Hy6YkcdB-J_LpeRzkaKULKYlzwA_Nk1KvzhIVD5zPMyiI8oxJmHFM-SaXoSDLJfPqxtB0nvYJ0cgkhE',2,343,'en','2022-07-02 21:19:50','2022-07-02 21:19:50'),(722,'4686A547-C718-4D9E-B6C5-9AC63522BF52','',2,344,'en','2022-07-05 23:23:47','2022-07-05 23:24:41'),(723,'aaee2ac2-d72c-3cb1-9d4e-63d88ea6b4e1','dOfEG1SOS5avOI8fW2dpCS:APA91bHefgIBQBrifV5RQdxx8Nk0qTTAvpUlXvqZNJT9FKbqrR8Mlopo_yXtKsqtlwjWtCaO39wkR8RCiIpJbXpZr8BwIhVK2FxwLyyyDF-JMR_GwJi1eWRXtAMqS-X0p9eC-dDdHbUl',1,345,'en','2022-07-08 17:59:35','2022-07-23 01:26:06'),(724,'0D029F4B-3993-415E-B378-F7984629E1E4','fX8gCiUjL06HuGY7lNakuO:APA91bF5pTaSP67HwzLkqYwZhazR0g8hS0OV0zkJae2wWPvOsprfka6ewjelr8NvbW43VzEMyyCzSVZ0R1iNnTCmwV1vdw7YcFbIzdUZ9volOGXsIwkWwwWzgZNyVaK6s8YIFiO25aTm',2,346,'en','2022-07-10 06:24:09','2022-07-10 06:24:09'),(725,'CD4B4822-96F4-4253-B48A-F09FE8AAEBD8','',2,347,'en','2022-07-12 12:31:46','2022-07-12 12:32:07'),(726,'CD4B4822-96F4-4253-B48A-F09FE8AAEBD8','fRa6oERI_ErqmUlofZUft0:APA91bFUqZ-EXIQAxzWRTxSxp89vOUHMyoIddz_yfiVFlEKBG9w9CIw86IbbI7KovWp881xECyX7Ct-h6Qw_VP01y8--FD7sgpr9wFb0qswBLi-uIAyUcyPjwMpA9k9xpRkZ1ZueZtXE',2,348,'en','2022-07-12 12:33:48','2022-07-12 12:33:48'),(727,'7546F095-3449-4DDD-A5F8-E9E488375A45','fQFZ1pp_9UlwiwhDKW--R5:APA91bFbNVQHIaUVOj3R0kVRoU5qo_SB12W_6WXG1p3IrmCvU1bOPQKnu_3ZgBq2rj96rY4AMQQpm1MB4aUrCFEqrhhaJ_MTZjlHd6sldyrSadaDzDOgK7SKCFord1y_BTrcObSiUhoG',2,349,'en','2022-07-16 20:01:00','2022-07-16 20:01:00'),(728,'F6C8D23C-AFCA-471C-BF50-A307C1B15740','fR8iG_hJ5kmTq_AX4BYPy0:APA91bG_quTcLGgnRm81ojz1jtef59uV2gPv5tD02InMkbRA2ZTEZusOreHZBRrBTQmfDRWqeVZe8pBDAI0wutKv6hI-0QHcVRDnztRvD7_ed2EQGcVvZmNPGz2aJR0JKjjjMQvWutkt',2,350,'en','2022-07-19 11:09:50','2022-07-19 11:09:50'),(729,'38EDA540-0A19-4552-B0FA-A5BB3AA50639','dQpj1eLnpEY_nuIyYBdJ50:APA91bFPCm0YB1UaYJHnsxc18vaTtcpDoc0CHQPHqFyjR7ZqO7KLKxv9BTAHsQebzBjIKBZ_Kd-qNxH4lPVLQKQUB4xClmAICKvAnALoMnMCGhVGWzjgh9VY-dc_EeRqK82bTGT5Zpff',2,351,'en','2022-07-19 21:31:27','2022-07-19 21:31:27'),(730,'C37545DA-4260-415E-A360-219907A91BF9','fhNYABJdqEhvjK3fRHLo6z:APA91bHbXDD_lpmZmb9RdiWpmk723amumL7w_wQzczOkDkWgdAz-0-0CvMPoWOjrCSNwR5jQyUooMThFXLsOu9PBDdWTORM7JMrKz2s-RgZoW4U3v1yH-VP2vxlLQVCqiUe11wDaLleU',2,352,'en','2022-07-21 01:24:54','2022-07-21 01:24:54'),(731,'DDC893B2-C6C8-469A-8834-A222098576E5','',2,353,'en','2022-07-22 11:05:49','2022-07-22 14:33:47'),(732,'12345678','1',1,347,'en','2022-07-22 14:21:56','2022-07-22 14:21:56'),(733,'660D6A78-209F-484D-9F1F-1916C7E26EDF','',2,347,'en','2022-07-22 14:31:48','2022-07-23 10:48:39'),(734,'DDC893B2-C6C8-469A-8834-A222098576E5','',2,347,'en','2022-07-22 14:34:28','2022-07-22 14:34:34'),(735,'DDC893B2-C6C8-469A-8834-A222098576E5','d-1fl0OhW0t3swODXNbfr4:APA91bFIQkG5VM_6qHO9LFBCP4MwnE_Sgor7aNcKbNqaxnf-eUFSggVsWnVDClSmWMUogspNq2C6pmEAX3JgH4sEjfNIyCM75MvL2jr5Bz9Ukw2nm9HryUv0Sr2hK3XuR3D5P9h4r4Or',2,348,'en','2022-07-22 14:34:54','2022-07-22 14:34:54'),(736,'59f020fb-d1a1-38ce-b008-01350561c2b4','cVJoW9iUSVO4cowt5HzxXg:APA91bF5TwFghcYllUAEAjpCCHTw6e8udgADm7sv8o1WBMr-DZm-KUWc7b3cskurWq7sj81iW6DdrFbZgIkL_hr6-2pvN-R3_HobiqETWt3t9wBko0MHFrWvbYvGocLy0WvQj-xK8xhM',1,347,'en','2022-07-22 15:19:28','2022-07-22 15:19:28'),(737,'660D6A78-209F-484D-9F1F-1916C7E26EDF','',2,348,'en','2022-07-23 10:49:00','2022-07-23 14:07:54'),(738,'3244A85C-7626-4C4F-AA1E-E64628845568','c6DliHQ6UE3SqVTMsvaiXP:APA91bHUZ98gRppQijgS4go24fWo506oJbeEGc2NjLmb-BrBzr9UUkSo8VVAKON7eCBnLZJ4ItzvQUUqAjL-t-iunQl1-IpzcGPRYZVpsP0hq6WGMygOH7IdIYZadiCAvzdCsF7LGaNm',2,354,'en','2022-07-23 16:45:30','2022-07-23 16:56:54'),(739,'2CFFF218-1E69-4850-8BBE-BEDF975B2768','fcZx-n585kvfqEpuF5ul5X:APA91bFDDTNJWVhxSUxKwiq1CgCesDr6m2DAPgGRkDOXM2MZggxjnzlnsrv9OA_G8N5KRI2rQsc2kGIKwaS5HnWbuE_9IJ9t58O0eliMgnNy6My9qz-4RC-IlYkpqC6Kw8e6K-XWWksQ',2,354,'en','2022-07-23 17:51:57','2022-07-23 17:51:57'),(740,'e4ab82ed-0ce0-36e8-a94f-1abccf23643b','fv0HczUZQjSfiuKaO9v71_:APA91bFgPvQSj2Mn9-HVY7QH4rTEva7BRniMFc7RBIBeViYb3__XJn66pdImpw460rBg8Jd5MRAm44af7clbEXB0gzubRKJQddFl_5R7HlWTdRbwDgBaK4CGx3tfg2mhpEco29aRh6N4',1,355,'en','2022-07-23 19:05:52','2022-07-23 19:05:52');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efficiency_level_novas`
--

DROP TABLE IF EXISTS `efficiency_level_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efficiency_level_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efficiency_level_novas`
--

LOCK TABLES `efficiency_level_novas` WRITE;
/*!40000 ALTER TABLE `efficiency_level_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `efficiency_level_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efficiency_level_translations`
--

DROP TABLE IF EXISTS `efficiency_level_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efficiency_level_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `efficiency_level_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `efficiency_level_translations_efficiency_level_id_foreign` (`efficiency_level_id`),
  CONSTRAINT `efficiency_level_translations_efficiency_level_id_foreign` FOREIGN KEY (`efficiency_level_id`) REFERENCES `efficiency_levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efficiency_level_translations`
--

LOCK TABLES `efficiency_level_translations` WRITE;
/*!40000 ALTER TABLE `efficiency_level_translations` DISABLE KEYS */;
INSERT INTO `efficiency_level_translations` VALUES (25,'en','Beginner',11,'2022-06-18 18:39:24','2022-06-18 18:39:24'),(26,'ar','مبتدئ',11,'2022-06-18 18:39:24','2022-06-18 18:39:24'),(27,'en','Intermediate',12,'2022-06-18 18:39:49','2022-06-18 18:39:49'),(28,'ar','متوسط',12,'2022-06-18 18:39:49','2022-06-18 18:39:49'),(29,'en','Professional',13,'2022-06-18 18:40:06','2022-06-18 18:40:06'),(30,'ar','محترف',13,'2022-06-18 18:40:06','2022-06-18 18:40:06');
/*!40000 ALTER TABLE `efficiency_level_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efficiency_levels`
--

DROP TABLE IF EXISTS `efficiency_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efficiency_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efficiency_levels`
--

LOCK TABLES `efficiency_levels` WRITE;
/*!40000 ALTER TABLE `efficiency_levels` DISABLE KEYS */;
INSERT INTO `efficiency_levels` VALUES (8,1,1,'2022-03-02 13:17:05','2022-03-02 13:17:05'),(9,1,2,'2022-03-02 13:17:22','2022-03-02 13:17:22'),(10,1,3,'2022-03-02 13:17:40','2022-03-02 13:17:40'),(11,1,1,'2022-04-19 22:15:37','2022-04-19 22:15:37'),(12,1,2,'2022-06-18 18:39:49','2022-06-18 18:39:49'),(13,1,3,'2022-06-18 18:40:06','2022-06-18 18:40:06');
/*!40000 ALTER TABLE `efficiency_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generated_points`
--

DROP TABLE IF EXISTS `generated_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generated_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `generated_points` int NOT NULL,
  `duration_return` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_admin_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `generated_points_store_admin_id_foreign` (`store_admin_id`),
  CONSTRAINT `generated_points_store_admin_id_foreign` FOREIGN KEY (`store_admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_points`
--

LOCK TABLES `generated_points` WRITE;
/*!40000 ALTER TABLE `generated_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `generated_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `permissions` text,
  `active` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_restricted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (20,'Super admin','{\"groups\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"admins\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"welcome_screens\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"categories\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"locations\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"languages\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"efficiency_levels\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"transportations\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"availability_times\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"currencies\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"cancellation_reasons\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"users\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"contact_messages\":{\"open\":\"1\",\"show\":\"1\",\"delete\":\"1\"},\"settings\":{\"open\":\"1\"},\"advertisement_banners\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"store_managers\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"orders_management\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"service_providers\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"memberships\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"partner_offers\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"payment_methods\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"report_reasons\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"payment_management\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"operation_records\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"generated_points\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"approve\":\"1\"},\"payout\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\",\"pay\":\"1\",\"received\":\"1\"},\"support_reasons\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"support_tickets\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"notifications\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"}}',1,1,1,'2022-01-31 09:09:23','2022-01-31 09:09:23',0),(29,'Agency','{\"users\":{\"open\":\"1\",\"edit\":\"1\"},\"service_providers\":{\"open\":\"1\",\"edit\":\"1\"},\"agency_service_providers\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"},\"agency\":{\"open\":\"1\"}}',1,1,1,'2022-06-14 21:27:41','2022-06-14 21:32:44',0),(30,'Call center','{\"users\":{\"open\":\"1\"},\"orders_management\":{\"open\":\"1\"},\"service_providers\":{\"open\":\"1\"},\"support_tickets\":{\"open\":\"1\",\"edit\":\"1\"}}',1,1,1,'2022-06-18 21:33:20','2022-06-21 05:03:32',0),(31,'data entry','{\"categories\":{\"open\":\"1\",\"add\":\"1\",\"edit\":\"1\",\"delete\":\"1\"}}',1,1,1,'2022-06-25 22:08:16','2022-06-25 22:08:16',0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_novas`
--

DROP TABLE IF EXISTS `language_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_novas`
--

LOCK TABLES `language_novas` WRITE;
/*!40000 ALTER TABLE `language_novas` DISABLE KEYS */;
INSERT INTO `language_novas` VALUES (1,'Urdu','أردو',1,1,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(2,'Arabic','العربية',1,2,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(3,'English','الانجليزية',1,3,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(4,'French','الفرنسية',1,4,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(5,'Spanish','الاسبانية',1,5,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(6,'Philippines','فليبيني',1,6,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(7,'Bengali','بنغالي',1,7,'2022-07-25 01:12:21','2022-07-25 01:12:21'),(8,'Hindi','هندي',1,8,'2022-07-25 01:12:21','2022-07-25 01:12:21');
/*!40000 ALTER TABLE `language_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_translations`
--

DROP TABLE IF EXISTS `language_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `language_translations_language_id_foreign` (`language_id`),
  CONSTRAINT `language_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_translations`
--

LOCK TABLES `language_translations` WRITE;
/*!40000 ALTER TABLE `language_translations` DISABLE KEYS */;
INSERT INTO `language_translations` VALUES (7,'en','Urdu',3,'2021-11-28 16:53:54','2021-11-28 16:53:54'),(8,'ar','أوردو',3,'2021-11-28 16:53:54','2021-11-28 16:53:54'),(9,'en','Arabic',1,'2022-03-02 13:06:24','2022-03-02 13:06:24'),(10,'ar','العربية',1,'2022-03-02 13:06:24','2022-03-02 13:06:24'),(11,'en','English',2,'2022-03-02 13:06:34','2022-03-02 13:06:34'),(12,'ar','الانجليزية',2,'2022-03-02 13:06:34','2022-03-02 13:06:34'),(15,'en','French',4,'2022-03-02 13:07:29','2022-03-02 13:07:29'),(16,'ar','الفرنسية',4,'2022-03-02 13:07:29','2022-03-02 13:07:29'),(17,'en','Spanish',5,'2022-03-02 13:07:48','2022-03-02 13:07:48'),(18,'ar','الاسبانية',5,'2022-03-02 13:07:48','2022-03-02 13:07:48'),(19,'en','Philippines',6,'2022-06-18 21:44:52','2022-06-18 21:44:52'),(20,'ar','فليبيني',6,'2022-06-18 21:44:52','2022-06-18 21:44:52'),(21,'en','Bengali',7,'2022-06-18 21:45:32','2022-06-18 21:45:32'),(22,'ar','بنغالي',7,'2022-06-18 21:45:32','2022-06-18 21:45:32'),(23,'en','Hindi',8,'2022-06-18 21:46:45','2022-06-18 21:46:45'),(24,'ar','هندي',8,'2022-06-18 21:46:45','2022-06-18 21:46:45');
/*!40000 ALTER TABLE `language_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,1,1,'2021-07-18 16:31:33','2021-07-18 16:31:33'),(2,1,2,'2021-07-18 16:32:46','2021-07-18 16:32:46'),(3,1,3,'2021-11-28 16:53:26','2021-11-28 16:53:26'),(4,1,4,'2022-03-02 13:06:54','2022-03-02 13:06:54'),(5,1,5,'2022-03-02 13:07:48','2022-03-02 13:07:48'),(6,1,6,'2022-06-18 21:44:52','2022-06-18 21:44:52'),(7,1,7,'2022-06-18 21:45:32','2022-06-18 21:45:32'),(8,1,8,'2022-06-18 21:46:45','2022-06-18 21:46:45');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_services`
--

DROP TABLE IF EXISTS `list_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `level_qualification` enum('beginner','intermediate','professional') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'beginner',
  `availability_time` enum('morning','midday','afternoon','evening') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'afternoon',
  `category_id` bigint unsigned NOT NULL,
  `sub_category_id` bigint unsigned NOT NULL,
  `sub_sub_category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_services_user_id_foreign` (`user_id`),
  CONSTRAINT `list_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_services`
--

LOCK TABLES `list_services` WRITE;
/*!40000 ALTER TABLE `list_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_novas`
--

DROP TABLE IF EXISTS `location_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `level` int NOT NULL,
  `dial_code` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_novas_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_novas`
--

LOCK TABLES `location_novas` WRITE;
/*!40000 ALTER TABLE `location_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_translations`
--

DROP TABLE IF EXISTS `location_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_translations_location_id_foreign` (`location_id`),
  CONSTRAINT `location_translations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_translations`
--

LOCK TABLES `location_translations` WRITE;
/*!40000 ALTER TABLE `location_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `level` int NOT NULL,
  `dial_code` int DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint NOT NULL,
  `parents_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_notifications`
--

DROP TABLE IF EXISTS `manual_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manual_notifications_admin_id_foreign` (`admin_id`),
  CONSTRAINT `manual_notifications_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_notifications`
--

LOCK TABLES `manual_notifications` WRITE;
/*!40000 ALTER TABLE `manual_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_novas`
--

DROP TABLE IF EXISTS `membership_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  `points` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_type` enum('admins','stores') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admins',
  `commission_percentage` decimal(8,2) NOT NULL,
  `default` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_novas`
--

LOCK TABLES `membership_novas` WRITE;
/*!40000 ALTER TABLE `membership_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_translations`
--

DROP TABLE IF EXISTS `membership_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `membership_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `membership_translations_membership_id_foreign` (`membership_id`),
  CONSTRAINT `membership_translations_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_translations`
--

LOCK TABLES `membership_translations` WRITE;
/*!40000 ALTER TABLE `membership_translations` DISABLE KEYS */;
INSERT INTO `membership_translations` VALUES (29,'en','store1',9,'2022-02-07 00:24:40','2022-02-07 00:24:40'),(30,'ar','store1',9,'2022-02-07 00:24:40','2022-02-07 00:24:40'),(61,'en','test',2,'2022-04-21 10:34:33','2022-04-21 10:34:33'),(62,'ar','تيست',2,'2022-04-21 10:34:33','2022-04-21 10:34:33'),(81,'en','defualt test',13,'2022-04-25 13:04:53','2022-04-25 13:04:53'),(82,'ar','defualt test',13,'2022-04-25 13:04:53','2022-04-25 13:04:53'),(83,'en','membership',10,'2022-04-25 13:05:14','2022-04-25 13:05:14'),(84,'ar','عضوية',10,'2022-04-25 13:05:14','2022-04-25 13:05:14'),(87,'en','other',11,'2022-05-12 14:55:42','2022-05-12 14:55:42'),(88,'ar','other',11,'2022-05-12 14:55:42','2022-05-12 14:55:42'),(99,'en','Defualt for individuals',12,'2022-06-18 21:50:25','2022-06-18 21:50:25'),(100,'ar','الأساسية للأفراد',12,'2022-06-18 21:50:25','2022-06-18 21:50:25'),(109,'en','Companies offer',15,'2022-06-18 21:54:53','2022-06-18 21:54:53'),(110,'ar','عروض الشركات',15,'2022-06-18 21:54:53','2022-06-18 21:54:53'),(111,'en','Companies',16,'2022-06-18 21:55:35','2022-06-18 21:55:35'),(112,'ar','الشركات',16,'2022-06-18 21:55:35','2022-06-18 21:55:35');
/*!40000 ALTER TABLE `membership_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `points` int DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `membership_type` enum('admins','stores') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admins',
  `commission_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (12,500,5.00,'1650795984245689.png',1,'2022-04-24 12:26:25','2022-06-18 21:50:25','admins',18.00,1),(15,1,1.00,'1655578493201278.png',1,'2022-06-18 21:54:53','2022-06-18 21:54:53','admins',0.00,0),(16,1,1.00,'1655578535689308.png',1,'2022-06-18 21:55:35','2022-06-18 21:55:35','admins',10.00,0);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2017_10_21_082745_create_groups_table',1),(2,'2017_10_21_083527_create_admins_table',1),(6,'2014_10_12_100000_create_password_resets_table',1),(146,'2021_03_13_163522_create_categorie_table',6),(147,'2021_03_13_163528_create_category_translations_table',6),(148,'2021_03_13_163546_create_locations_table',6),(149,'2021_03_13_163607_create_location_translations_table',6),(152,'2021_03_13_202821_create_settings_table',8),(153,'2021_03_13_202855_create_settings_translations_table',8),(154,'2021_03_13_202929_create_contact_messages_table',8),(185,'2021_03_21_154107_create_welcome_screens_table',13),(186,'2021_03_21_154132_create_welcome_screen_translations_table',13),(190,'2021_07_18_175957_create_languages_table',14),(191,'2021_07_18_180024_create_language_translations_table',14),(192,'2021_07_18_183718_create_efficiency_levels_table',15),(193,'2021_07_18_183743_create_efficiency_level_translations_table',15),(194,'2021_07_18_183806_create_transportations_table',15),(195,'2021_07_18_183836_create_transportation_translations_table',15),(196,'2021_07_18_183910_create_availability_times_table',15),(197,'2021_07_18_183958_create_availability_time_translations_table',15),(198,'2021_07_18_184021_create_currencies_table',15),(199,'2021_07_18_184049_create_currency_translations_table',15),(204,'2021_07_22_125702_create_users_table',16),(205,'2021_07_22_125703_create_devices_table',16),(206,'2021_07_22_125705_create_social_users_table',16),(253,'2021_07_22_125802_create_service_provider_details_table',17),(254,'2021_07_22_130729_create_addresses_table',17),(255,'2021_07_22_130858_create_bank_accounts_table',17),(256,'2021_07_22_131220_create_credit_debit_cards_table',17),(257,'2021_07_22_131304_create_user_category_table',17),(258,'2021_07_23_185814_create_services_table',17),(259,'2021_07_23_185913_create_service_availability_time_table',17),(260,'2021_07_23_185937_create_user_language_table',17),(261,'2021_07_23_190005_create_certifications_table',17),(262,'2021_07_23_190024_create_practical_experiences_table',17),(263,'2021_07_23_190054_create_user_transportation_table',17),(272,'2021_08_01_095939_create_advertisements_table',18),(273,'2021_08_01_101707_create_requirements_table',18),(274,'2021_08_03_205030_create_cancellation_reasons_table',18),(275,'2021_08_03_205050_create_cancellation_reason_translations_table',18),(276,'2021_08_03_205815_create_offers_table',18),(277,'2021_08_05_105924_create_rates_table',19),(278,'2021_08_31_102510_create_advertisement_cancellation_table',20),(279,'2021_11_23_122805_create_advertisement_banners_table',20),(280,'2021_11_28_012559_add_column_service_providers',21),(281,'2021_11_28_120354_create_service_provider_languages_table',21),(282,'2021_11_28_120417_create_list_services_table',21),(283,'2021_11_28_143853_add_column_advertisements',21),(284,'2021_12_04_071040_add_balance_service_provider',22),(285,'2021_12_04_123356_add_column_partner',22),(286,'2021_12_04_130431_add_column_restricted',22),(287,'2021_12_05_123423_create_memberships_table',23),(288,'2021_12_05_155814_create_table_membership_translations',23),(316,'2021_12_06_213441_create_partner_offers_table',24),(317,'2021_12_06_213536_create_partner_offer_translations_table',24),(318,'2021_12_12_211949_add_column_membership_type',24),(319,'2021_12_14_113825_add_column_is_sort_in_users',24),(320,'2021_12_14_205344_create_payment_methods_table',24),(321,'2021_12_14_210739_create_payment_method_translations_table',24),(322,'2021_12_15_152016_create_table_user_advertisement',24),(323,'2021_12_15_183438_create_report_reasons_table',24),(324,'2021_12_15_183448_create_report_reason_translations_table',24),(325,'2021_12_16_180301_create_order_reports_table',24),(326,'2021_12_16_202719_add_column_proof_work_images',24),(327,'2021_12_28_210931_add_column_commission_percentage_in_memberships_table',24),(328,'2021_12_30_074236_add_column_membership_id_to_users_table',24),(329,'2021_12_30_134623_add_column_default_to_memberships_table',24),(330,'2022_01_05_001505_insert_store_managers_group_in_groups_table',24),(331,'2022_01_05_101445_add_block_field_to_users_table',24),(332,'2022_01_05_134029_create_store_managers_details_table',24),(333,'2022_01_05_164303_create_generated_points_table',24),(334,'2022_01_05_174123_add_column_total_mueeny_money_back',24),(335,'2022_01_05_223438_add_column_membership_id_to_talbe_store_managers_details',24),(336,'2022_01_06_075543_change-columns-to-be-nullable-at-table-store-managers',24),(337,'2022_01_06_082852_add_nullable_columns_to_table_store_managers',24),(338,'2022_01_06_092839_create_transactions_table',24),(339,'2022_01_06_132311_add_store_user_id_in_table_generated_points',24),(340,'2022_01_06_162948_create_store_transactions_table',24),(341,'2022_01_08_192344_add_language_admins',24),(342,'2022_01_12_013713_add_balance_column_to_users_table',25),(343,'2022_01_17_115300_create_support_reasons_table',26),(344,'2022_01_17_115635_create_support_tickets_table',26),(345,'2022_01_17_122101_create_support_reason_translations_table',26),(346,'2022_01_18_112517_create_notifications_table',27),(347,'2022_01_27_112745_add_columns_advertisement',28),(348,'2022_01_29_055933_add_column_image',29),(349,'2022_01_29_225301_add_columns_table_requirements',30),(350,'2022_01_29_235501_add_column_category_id',31),(351,'2022_02_06_182700_add_store_id_column_to_admins_table',32),(352,'2022_02_06_184044_drop_user_id_column_from_store_managers_details_table',32),(353,'2022_02_06_184703_add_admin_id_column_to_store_managers_details_table',32),(354,'2022_02_06_232341_add_block_column_to_admins_table',32),(355,'2022_02_07_162658_add_country_code_column_to_admins_table',32),(356,'2022_02_07_173624_add_country_code_column_to_users_table',32),(357,'2022_02_08_213523_remove_column_price_requirement',32),(358,'2022_02_08_214256_add_column_price_requirement',32),(359,'2022_02_08_222929_add_column_store_id',32),(360,'2022_02_08_223559_remove_column_admin',32),(361,'2022_03_17_140101_firebase_id',33),(362,'2022_03_23_130723_create_manual_notifications_table',34),(363,'2022_05_01_012344_alter_ads_cacellation_table_to_add_who_cancelled_it',35),(364,'2022_05_10_222124_add_nationality_in_service_providers_details',36),(365,'2022_05_14_205923_make_email_optional',37),(366,'2022_05_16_195925_add_agency_column_in_service_provider',38),(367,'2022_05_18_204157_alter_provider_table_mark_nationality_nulable',39),(368,'2022_05_20_061403_alter_service_provider_add_is_submitted_to_admin',40),(369,'2022_05_31_135407_alter_s_p_table_add_rejected_by',41),(370,'2022_06_05_133133_add_invoice_number_in_ads',42),(371,'2022_06_07_144742_add_chatid_and_invoice_number_in_ads',42),(372,'2022_06_09_064147_alter_ad_table',43),(373,'2022_06_15_233343_add_is_agency',43),(374,'2022_07_13_222434_add_rrn_in_ads',44),(375,'2018_01_01_000000_create_action_events_table',45),(376,'2019_05_10_000000_add_fields_to_action_events_table',45),(377,'2019_12_14_000001_create_personal_access_tokens_table',45),(378,'2022_07_14_044152_create_language_novas_table',45),(379,'2022_07_14_044203_create_location_novas_table',45),(380,'2022_07_14_044239_create_support_reason_novas_table',45),(381,'2022_07_14_044305_create_support_ticket_novas_table',45),(382,'2022_07_14_044321_create_welcome_screen_novas_table',45),(383,'2022_07_14_044341_create_availability_time_novas_table',45),(384,'2022_07_14_044354_create_cancellation_reason_novas_table',45),(385,'2022_07_14_044407_create_currency_novas_table',45),(386,'2022_07_14_045048_create_efficiency_level_novas_table',45),(387,'2022_07_14_045100_create_membership_novas_table',45),(388,'2022_07_14_045109_create_partner_offer_novas_table',45),(389,'2022_07_14_045128_create_payment_method_novas_table',45),(390,'2022_07_14_045339_create_report_reason_novas_table',45),(391,'2022_07_14_045351_create_transportation_novas_table',45),(392,'2022_07_15_064247_create_category_novas_table',45),(393,'2022_07_15_065552_create_partner_offer_image_novas_table',45),(394,'2022_07_18_172458_create_store_manager_detail_novas_table',45),(395,'2022_07_20_055301_alter_table_remove_indexes',45),(396,'2022_07_21_050046_alter_table_remove_users_indexes',45),(397,'2022_07_21_052503_create_service_provider_detail_documents_table',45);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\Admin',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `duration` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `status_proof_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancellation_reason_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_provider_id` bigint unsigned NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `cancellation_reason_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offers_service_provider_id_foreign` (`service_provider_id`),
  KEY `offers_advertisement_id_foreign` (`advertisement_id`),
  KEY `offers_currency_id_foreign` (`currency_id`),
  KEY `offers_cancellation_reason_id_foreign` (`cancellation_reason_id`),
  CONSTRAINT `offers_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`),
  CONSTRAINT `offers_service_provider_id_foreign` FOREIGN KEY (`service_provider_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'I can help you with that',50.00,1,1,'','',323,616,3,NULL,'2022-06-16 19:38:50','2022-06-16 19:39:40'),(2,'تدريس منهج دراسي للمحاسبة',60.00,5,0,'','',317,618,3,NULL,'2022-06-21 04:42:04','2022-06-21 04:42:04');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_reports`
--

DROP TABLE IF EXISTS `order_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `report_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `report_reason_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_reports_report_reason_id_foreign` (`report_reason_id`),
  KEY `order_reports_user_id_foreign` (`user_id`),
  KEY `order_reports_advertisement_id_foreign` (`advertisement_id`),
  CONSTRAINT `order_reports_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_reports_report_reason_id_foreign` FOREIGN KEY (`report_reason_id`) REFERENCES `report_reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_reports`
--

LOCK TABLES `order_reports` WRITE;
/*!40000 ALTER TABLE `order_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_offer_image_novas`
--

DROP TABLE IF EXISTS `partner_offer_image_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_offer_image_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `partner_offer_id` bigint unsigned NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_offer_image_novas_partner_offer_id_index` (`partner_offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_offer_image_novas`
--

LOCK TABLES `partner_offer_image_novas` WRITE;
/*!40000 ALTER TABLE `partner_offer_image_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_offer_image_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_offer_novas`
--

DROP TABLE IF EXISTS `partner_offer_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_offer_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_offer_novas`
--

LOCK TABLES `partner_offer_novas` WRITE;
/*!40000 ALTER TABLE `partner_offer_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_offer_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_offer_translations`
--

DROP TABLE IF EXISTS `partner_offer_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_offer_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_offer_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_offer_translations_partner_offer_id_foreign` (`partner_offer_id`),
  CONSTRAINT `partner_offer_translations_partner_offer_id_foreign` FOREIGN KEY (`partner_offer_id`) REFERENCES `partner_offers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_offer_translations`
--

LOCK TABLES `partner_offer_translations` WRITE;
/*!40000 ALTER TABLE `partner_offer_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_offer_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_offers`
--

DROP TABLE IF EXISTS `partner_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_offers`
--

LOCK TABLES `partner_offers` WRITE;
/*!40000 ALTER TABLE `partner_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('Szubair01@gmail.com','$2y$10$hUY4Q4y029y0siZwc3Awjukqzd57rxOVZP0u.azoAJZIHKqmpiYzO','2022-05-25 12:56:28');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_novas`
--

DROP TABLE IF EXISTS `payment_method_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `type` enum('online','offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_novas`
--

LOCK TABLES `payment_method_novas` WRITE;
/*!40000 ALTER TABLE `payment_method_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_translations`
--

DROP TABLE IF EXISTS `payment_method_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_method_translations_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payment_method_translations_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_translations`
--

LOCK TABLES `payment_method_translations` WRITE;
/*!40000 ALTER TABLE `payment_method_translations` DISABLE KEYS */;
INSERT INTO `payment_method_translations` VALUES (15,'en','Credit Card',5,'2022-03-02 13:34:38','2022-03-02 13:34:38'),(16,'ar','بطاقة الائتمان',5,'2022-03-02 13:34:38','2022-03-02 13:34:38'),(17,'en','Cash',6,'2022-03-02 13:34:49','2022-03-02 13:34:49'),(18,'ar','كاش',6,'2022-03-02 13:34:49','2022-03-02 13:34:49'),(31,'en','STC Pay',7,'2022-04-17 22:42:00','2022-04-17 22:42:00'),(32,'ar','STC Pay',7,'2022-04-17 22:42:00','2022-04-17 22:42:00'),(33,'en','Apple Pay',8,'2022-04-17 22:42:16','2022-04-17 22:42:16'),(34,'ar','Apple Pay',8,'2022-04-17 22:42:16','2022-04-17 22:42:16');
/*!40000 ALTER TABLE `payment_method_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('online','offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (5,'online',0,'2022-02-21 17:55:16','2022-02-21 17:55:16'),(6,'offline',0,'2022-02-26 13:50:43','2022-02-26 13:50:43'),(7,'online',0,'2022-04-17 21:39:10','2022-04-17 22:41:37'),(8,'online',0,'2022-04-17 21:40:36','2022-04-17 22:42:16');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'list admins','web','2022-07-01 01:54:35','2022-07-01 02:02:27'),(2,'create admins','web','2022-07-01 02:10:58','2022-07-01 02:10:58'),(3,'view admins','web','2022-07-01 02:11:03','2022-07-01 02:11:03'),(4,'update admins','web','2022-07-01 02:11:12','2022-07-01 02:11:12'),(5,'delete admins','web','2022-07-01 02:11:18','2022-07-01 02:11:18'),(6,'restore admins','web','2022-07-01 02:11:25','2022-07-01 02:11:25'),(7,'forceDelete admins','web','2022-07-01 02:11:32','2022-07-01 02:11:32'),(331,'list category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(332,'view category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(333,'update category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(334,'create category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(335,'delete category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(336,'forceDelete category-novas','web','2022-07-16 01:19:26','2022-07-16 01:19:26'),(337,'list support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(338,'view support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(339,'update support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(340,'create support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(341,'delete support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(342,'forceDelete support-reason-novas','web','2022-07-16 02:23:00','2022-07-16 02:23:00'),(343,'list users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(344,'view users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(345,'update users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(346,'create users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(347,'delete users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(348,'forceDelete users','web','2022-07-16 09:27:29','2022-07-16 09:27:29'),(349,'list support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(350,'view support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(351,'update support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(352,'create support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(353,'delete support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(354,'forceDelete support-ticket-novas','web','2022-07-16 09:28:57','2022-07-16 09:28:57'),(355,'list location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(356,'view location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(357,'update location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(358,'create location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(359,'delete location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(360,'forceDelete location-novas','web','2022-07-16 10:55:50','2022-07-16 10:55:50'),(361,'list welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(362,'view welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(363,'update welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(364,'create welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(365,'delete welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(366,'forceDelete welcome-screen-novas','web','2022-07-16 11:05:36','2022-07-16 11:05:36'),(367,'list language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(368,'view language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(369,'update language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(370,'create language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(371,'delete language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(372,'forceDelete language-novas','web','2022-07-16 11:15:04','2022-07-16 11:15:04'),(373,'list report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(374,'view report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(375,'update report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(376,'create report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(377,'delete report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(378,'forceDelete report-reason-novas','web','2022-07-16 11:32:58','2022-07-16 11:32:58'),(379,'list efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(380,'view efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(381,'update efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(382,'create efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(383,'delete efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(384,'forceDelete efficiency-level-novas','web','2022-07-16 11:44:01','2022-07-16 11:44:01'),(385,'list transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(386,'view transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(387,'update transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(388,'create transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(389,'delete transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(390,'forceDelete transportation-novas','web','2022-07-16 11:45:22','2022-07-16 11:45:22'),(391,'list availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(392,'view availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(393,'update availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(394,'create availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(395,'delete availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(396,'forceDelete availability-time-novas','web','2022-07-16 11:46:44','2022-07-16 11:46:44'),(397,'list currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(398,'view currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(399,'update currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(400,'create currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(401,'delete currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(402,'forceDelete currency-novas','web','2022-07-16 12:41:01','2022-07-16 12:41:01'),(403,'list cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(404,'view cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(405,'update cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(406,'create cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(407,'delete cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(408,'forceDelete cancellation-reason-novas','web','2022-07-16 12:49:01','2022-07-16 12:49:01'),(409,'list membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(410,'view membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(411,'update membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(412,'create membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(413,'delete membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(414,'forceDelete membership-novas','web','2022-07-17 01:11:46','2022-07-17 01:11:46'),(415,'list advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(416,'view advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(417,'update advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(418,'create advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(419,'delete advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(420,'forceDelete advertisement-banners','web','2022-07-18 09:14:30','2022-07-18 09:14:30'),(421,'list store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(422,'view store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(423,'update store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(424,'create store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(425,'delete store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(426,'forceDelete store-managers','web','2022-07-18 10:59:18','2022-07-18 10:59:18'),(427,'list store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(428,'view store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(429,'update store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(430,'create store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(431,'delete store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(432,'forceDelete store-manager-detail-novas','web','2022-07-18 12:32:56','2022-07-18 12:32:56'),(433,'list generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(434,'view generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(435,'update generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(436,'create generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(437,'delete generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(438,'forceDelete generate-points','web','2022-07-18 12:52:55','2022-07-18 12:52:55'),(439,'list offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(440,'view offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(441,'update offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(442,'create offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(443,'delete offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(444,'forceDelete offers','web','2022-07-20 10:06:26','2022-07-20 10:06:26'),(445,'list advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(446,'view advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(447,'update advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(448,'create advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(449,'delete advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(450,'forceDelete advertisements','web','2022-07-20 10:06:35','2022-07-20 10:06:35'),(451,'list service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:47:30'),(452,'view service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:46:21'),(453,'update service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:46:21'),(454,'create service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:46:21'),(455,'delete service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:46:21'),(456,'forceDelete service-provider-details','web','2022-07-20 12:46:21','2022-07-20 12:46:21'),(457,'list manual-notifications','web','2022-07-20 12:49:34','2022-07-20 12:49:34'),(458,'view manual-notifications','web','2022-07-20 12:49:35','2022-07-20 12:49:35'),(459,'update manual-notifications','web','2022-07-20 12:49:35','2022-07-20 12:49:35'),(460,'create manual-notifications','web','2022-07-20 12:49:35','2022-07-20 12:49:35'),(461,'delete manual-notifications','web','2022-07-20 12:49:35','2022-07-20 12:49:35'),(462,'forceDelete manual-notifications','web','2022-07-20 12:49:35','2022-07-20 12:49:35'),(481,'list bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(482,'view bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(483,'update bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(484,'create bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(485,'delete bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(486,'forceDelete bank-accounts','web','2022-07-20 13:38:24','2022-07-20 13:38:24'),(487,'list partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(488,'view partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(489,'update partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(490,'create partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(491,'delete partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(492,'forceDelete partner-offer-image-novas','web','2022-07-23 06:08:44','2022-07-23 06:08:44'),(493,'list partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(494,'view partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(495,'update partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(496,'create partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(497,'delete partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(498,'forceDelete partner-offer-novas','web','2022-07-23 06:09:12','2022-07-23 06:09:12'),(499,'list payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(500,'view payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(501,'update payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(502,'create payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(503,'delete payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(504,'forceDelete payment-method-novas','web','2022-07-23 06:10:49','2022-07-23 06:10:49'),(505,'list service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(506,'view service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(507,'update service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(508,'create service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(509,'delete service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(510,'forceDelete service-provider-detail-documents','web','2022-07-23 06:11:36','2022-07-23 06:11:36'),(511,'list settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59'),(512,'view settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59'),(513,'update settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59'),(514,'create settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59'),(515,'delete settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59'),(516,'forceDelete settings','web','2022-07-23 06:11:59','2022-07-23 06:11:59');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practical_experiences`
--

DROP TABLE IF EXISTS `practical_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practical_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `efficiency_level_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `practical_experiences_efficiency_level_id_foreign` (`efficiency_level_id`),
  KEY `practical_experiences_user_id_foreign` (`user_id`),
  CONSTRAINT `practical_experiences_efficiency_level_id_foreign` FOREIGN KEY (`efficiency_level_id`) REFERENCES `efficiency_levels` (`id`),
  CONSTRAINT `practical_experiences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practical_experiences`
--

LOCK TABLES `practical_experiences` WRITE;
/*!40000 ALTER TABLE `practical_experiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `practical_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `score` double NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rater_id` bigint unsigned NOT NULL,
  `rated_id` bigint unsigned NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rates_rater_id_foreign` (`rater_id`),
  KEY `rates_rated_id_foreign` (`rated_id`),
  KEY `rates_advertisement_id_foreign` (`advertisement_id`),
  CONSTRAINT `rates_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`),
  CONSTRAINT `rates_rated_id_foreign` FOREIGN KEY (`rated_id`) REFERENCES `users` (`id`),
  CONSTRAINT `rates_rater_id_foreign` FOREIGN KEY (`rater_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_reason_novas`
--

DROP TABLE IF EXISTS `report_reason_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_reason_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_reason_novas`
--

LOCK TABLES `report_reason_novas` WRITE;
/*!40000 ALTER TABLE `report_reason_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_reason_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_reason_translations`
--

DROP TABLE IF EXISTS `report_reason_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_reason_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_reason_translations_report_reason_id_foreign` (`report_reason_id`),
  CONSTRAINT `report_reason_translations_report_reason_id_foreign` FOREIGN KEY (`report_reason_id`) REFERENCES `report_reasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_reason_translations`
--

LOCK TABLES `report_reason_translations` WRITE;
/*!40000 ALTER TABLE `report_reason_translations` DISABLE KEYS */;
INSERT INTO `report_reason_translations` VALUES (3,'en','The order is illegal',2,'2022-03-02 13:10:07','2022-03-02 13:10:07'),(4,'ar','لا يتوافق محتوى الطلب مع الأنظمة والقوانين',2,'2022-03-02 13:10:07','2022-03-02 13:10:07'),(5,'en','The posted order is random',3,'2022-03-02 13:10:56','2022-03-02 13:10:56'),(6,'ar','محتوى الطلب عشوائي/ وهمي',3,'2022-03-02 13:10:56','2022-03-02 13:10:56'),(7,'en','The order is unsafe to execute',4,'2022-03-02 13:12:27','2022-03-02 13:12:27'),(8,'ar','تنفيذ الطلب يعد غير آمن',4,'2022-03-02 13:12:27','2022-03-02 13:12:27'),(9,'en','The order is an advertisement',5,'2022-03-02 13:12:52','2022-03-02 13:12:52'),(10,'ar','محتوى الطلب يتضمن إعلانا',5,'2022-03-02 13:12:52','2022-03-02 13:12:52'),(11,'en','Other',6,'2022-03-02 13:13:08','2022-03-02 13:13:08'),(12,'ar','أخرى',6,'2022-03-02 13:13:08','2022-03-02 13:13:08');
/*!40000 ALTER TABLE `report_reason_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_reasons`
--

DROP TABLE IF EXISTS `report_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_reasons`
--

LOCK TABLES `report_reasons` WRITE;
/*!40000 ALTER TABLE `report_reasons` DISABLE KEYS */;
INSERT INTO `report_reasons` VALUES (2,0,'2022-03-02 13:10:07','2022-03-02 13:10:07'),(3,0,'2022-03-02 13:10:56','2022-03-02 13:10:56'),(4,0,'2022-03-02 13:12:27','2022-03-02 13:12:27'),(5,0,'2022-03-02 13:12:52','2022-03-02 13:12:52'),(6,0,'2022-03-02 13:13:08','2022-03-02 13:13:08');
/*!40000 ALTER TABLE `report_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `added_by` bigint unsigned DEFAULT NULL,
  `price` decimal(48,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `requirements_advertisement_id_foreign` (`advertisement_id`),
  CONSTRAINT `requirements_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,'دفتر',614,'2022-06-15 00:56:19','2022-06-15 00:56:19',1,317,0.00),(2,'scrapping tool',615,'2022-06-15 07:03:29','2022-06-15 07:03:29',1,321,0.00),(3,'glue removal material',615,'2022-06-15 07:03:29','2022-06-15 07:03:29',1,321,0.00),(4,'note book',619,'2022-07-02 20:39:14','2022-07-02 20:39:14',1,317,0.00);
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(331,1),(332,1),(333,1),(334,1),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,1),(346,1),(347,1),(348,1),(349,1),(350,1),(351,1),(352,1),(353,1),(354,1),(355,1),(356,1),(357,1),(358,1),(359,1),(360,1),(361,1),(362,1),(363,1),(364,1),(365,1),(366,1),(367,1),(368,1),(369,1),(370,1),(371,1),(372,1),(373,1),(374,1),(375,1),(376,1),(377,1),(378,1),(379,1),(380,1),(381,1),(382,1),(383,1),(384,1),(385,1),(386,1),(387,1),(388,1),(389,1),(390,1),(391,1),(392,1),(393,1),(394,1),(395,1),(396,1),(397,1),(398,1),(399,1),(400,1),(401,1),(402,1),(403,1),(404,1),(405,1),(406,1),(407,1),(408,1),(409,1),(410,1),(411,1),(412,1),(413,1),(414,1),(415,1),(416,1),(417,1),(418,1),(419,1),(420,1),(421,1),(422,1),(423,1),(424,1),(425,1),(426,1),(427,1),(428,1),(429,1),(430,1),(431,1),(432,1),(433,1),(434,1),(435,1),(436,1),(437,1),(438,1),(439,1),(440,1),(441,1),(442,1),(443,1),(444,1),(445,1),(446,1),(447,1),(448,1),(449,1),(450,1),(451,1),(452,1),(453,1),(454,1),(455,1),(456,1),(457,1),(458,1),(459,1),(460,1),(461,1),(462,1),(481,1),(482,1),(483,1),(484,1),(485,1),(486,1),(487,1),(488,1),(489,1),(490,1),(491,1),(492,1),(493,1),(494,1),(495,1),(496,1),(497,1),(498,1),(499,1),(500,1),(501,1),(502,1),(503,1),(504,1),(505,1),(506,1),(507,1),(508,1),(509,1),(510,1),(511,1),(512,1),(513,1),(514,1),(515,1),(516,1),(331,2),(332,2),(333,2),(334,2),(335,2),(336,2),(337,2),(338,2),(339,2),(340,2),(341,2),(342,2),(343,2),(344,2),(345,2),(346,2),(347,2),(348,2),(349,2),(350,2),(351,2),(352,2),(353,2),(354,2),(355,2),(356,2),(357,2),(358,2),(359,2),(360,2),(361,2),(362,2),(363,2),(364,2),(365,2),(366,2),(367,2),(368,2),(369,2),(370,2),(371,2),(372,2),(373,2),(374,2),(375,2),(376,2),(377,2),(378,2),(379,2),(380,2),(381,2),(382,2),(383,2),(384,2),(385,2),(386,2),(387,2),(388,2),(389,2),(390,2),(391,2),(392,2),(393,2),(394,2),(395,2),(396,2),(397,2),(398,2),(399,2),(400,2),(401,2),(402,2),(403,2),(404,2),(405,2),(406,2),(407,2),(408,2),(409,2),(410,2),(411,2),(412,2),(413,2),(414,2),(415,2),(416,2),(417,2),(418,2),(419,2),(420,2),(421,2),(422,2),(423,2),(424,2),(425,2),(426,2),(427,2),(428,2),(429,2),(430,2),(431,2),(432,2),(433,2),(434,2),(435,2),(436,2),(437,2),(438,2),(439,2),(440,2),(441,2),(442,2),(443,2),(444,2),(445,2),(446,2),(447,2),(448,2),(449,2),(450,2),(451,2),(452,2),(453,2),(454,2),(455,2),(456,2),(457,2),(458,2),(459,2),(460,2),(461,2),(462,2),(481,2),(482,2),(483,2),(484,2),(485,2),(486,2),(487,2),(488,2),(489,2),(490,2),(491,2),(492,2),(493,2),(494,2),(495,2),(496,2),(497,2),(498,2),(499,2),(500,2),(501,2),(502,2),(503,2),(504,2),(505,2),(506,2),(507,2),(508,2),(509,2),(510,2),(511,2),(512,2),(513,2),(514,2),(515,2),(516,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','web','2022-07-01 01:52:34','2022-07-01 01:52:34'),(2,'Admin','web','2022-07-01 01:52:41','2022-07-01 01:52:41');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_availability_time`
--

DROP TABLE IF EXISTS `service_availability_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_availability_time` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `availability_time_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_availability_time_service_id_foreign` (`service_id`),
  KEY `service_availability_time_availability_time_id_foreign` (`availability_time_id`),
  CONSTRAINT `service_availability_time_availability_time_id_foreign` FOREIGN KEY (`availability_time_id`) REFERENCES `availability_times` (`id`),
  CONSTRAINT `service_availability_time_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_availability_time`
--

LOCK TABLES `service_availability_time` WRITE;
/*!40000 ALTER TABLE `service_availability_time` DISABLE KEYS */;
INSERT INTO `service_availability_time` VALUES (8,3,5,'2022-04-19 22:15:53','2022-04-19 22:15:53'),(9,6,5,'2022-04-30 12:52:48','2022-04-30 12:52:48'),(10,7,5,'2022-05-09 23:11:50','2022-05-09 23:11:50'),(11,7,6,'2022-05-09 23:11:50','2022-05-09 23:11:50'),(12,7,7,'2022-05-09 23:11:50','2022-05-09 23:11:50'),(13,7,8,'2022-05-09 23:11:50','2022-05-09 23:11:50'),(16,2,6,'2022-06-21 04:38:55','2022-06-21 04:38:55'),(17,2,8,'2022-06-21 04:38:55','2022-06-21 04:38:55');
/*!40000 ALTER TABLE `service_availability_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_detail_documents`
--

DROP TABLE IF EXISTS `service_provider_detail_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider_detail_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `detail_id` bigint unsigned NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_provider_detail_documents_detail_id_index` (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_detail_documents`
--

LOCK TABLES `service_provider_detail_documents` WRITE;
/*!40000 ALTER TABLE `service_provider_detail_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_provider_detail_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_details`
--

DROP TABLE IF EXISTS `service_provider_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial_record` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_record_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_documents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancelled_offers_count` int NOT NULL DEFAULT '0',
  `allowed_to_offer` int NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `block` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_proof` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `nationality` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_id` bigint unsigned DEFAULT NULL,
  `is_submitted` tinyint DEFAULT '1',
  `operated_by` bigint unsigned DEFAULT NULL,
  `operation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sp_details_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `sp_details_mobile_unique` (`mobile`) USING BTREE,
  KEY `sp_details_user_id_foreign` (`user_id`) USING BTREE,
  KEY `service_provider_details_agency_id_foreign` (`agency_id`),
  KEY `service_provider_details_operated_by_foreign` (`operated_by`),
  CONSTRAINT `service_provider_details_agency_id_foreign` FOREIGN KEY (`agency_id`) REFERENCES `admins` (`id`),
  CONSTRAINT `service_provider_details_operated_by_foreign` FOREIGN KEY (`operated_by`) REFERENCES `admins` (`id`),
  CONSTRAINT `sp_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_details`
--

LOCK TABLES `service_provider_details` WRITE;
/*!40000 ALTER TABLE `service_provider_details` DISABLE KEYS */;
INSERT INTO `service_provider_details` VALUES (233,1,0,'Abdulrahman Ateeq','16548202244787.jpg','165482022450885.jpg','qasmiakailani@gmail.com','966530462055','','','',0,1,303,'2022-06-10 03:17:04','2022-06-25 21:34:29',0,NULL,NULL,0.00,'PK',NULL,0,NULL,NULL),(234,1,0,'mohammed yousif','1654845613475777.jpg','1654845613290661.jpg','msomeet123@gmail.com','966568139785','','','',0,1,299,'2022-06-10 10:20:13','2022-06-10 10:20:13',0,NULL,NULL,0.00,'SD',NULL,0,NULL,NULL),(235,1,1,'livetest','1655310588538464.png','1655310588920845.png','livetest@t.com','966544681119','','','',0,1,323,'2022-06-15 19:29:48','2022-06-16 19:30:39',0,'3406 علي المفيدي، 8207، حي الريان، Riyadh 14211, Saudi Arabia',NULL,0.00,'SA',NULL,1,1,'1'),(237,2,0,'شركة كوادر للاستشارات الهندسية','1655371496965670.jpg','','mo_h@kawadereng.com','966532242043','7021603464','1655371496767080.jpg','[\"1655371496256850.jpg\"]',0,1,325,'2022-06-16 12:24:56','2022-06-16 12:24:56',0,'8478 سلمان الفارسي، 4034، النهضة، الرياض 13221، السعودية',NULL,0.00,NULL,NULL,1,NULL,NULL),(239,1,0,'livec','1655397778286757.png','1655397778723242.png','livetestc@c.com','966544684578','','','',0,1,326,'2022-06-16 19:42:59','2022-06-25 22:54:21',0,'2366 الورد، 8170, Ar Rayyan, Riyadh 14211, Saudi Arabia',NULL,0.00,'AZ',NULL,0,1,'0'),(240,1,1,'m','1655560516586844.png','1655560516651964.png','iliixi.77@gmail.com','966537800200','','','',0,1,317,'2022-06-18 16:55:16','2022-06-18 17:28:13',0,'2800 Al Qarin, 7215, Dhahrat Al Badi\'ah, Riyadh 12982, Saudi Arabia',NULL,0.00,'SA',NULL,1,1,'1'),(241,1,1,'providertest','165591657683394.png','1655916576512105.png','providertest@t.com','966544682222','','','',0,1,336,'2022-06-22 19:49:37','2022-06-22 19:49:56',0,'2547 الورد، 8182, Ar Rayyan, Riyadh 14211, Saudi Arabia',NULL,0.00,'SA',NULL,1,1,'1'),(242,1,1,'Android Provider','1657618560373580.png','1657618560549143.png','andprovidertest@test.com','966556645637','','','',0,1,348,'2022-07-12 12:36:00','2022-07-13 12:38:49',0,'6871 السفراء، 4124, Ar Rawdah, Riyadh 13213, Saudi Arabia',NULL,0.00,'SA',NULL,1,1,'1'),(244,1,1,'prodtestp','1658584572245161.png','1658584572739671.png','prodtestp@p.com','966544681279','','','',0,1,354,'2022-07-23 16:56:12','2022-07-23 16:56:36',0,'RQRA2285, 2285 Al Moudaf, 8161، حي الريان، Riyadh 14211, Saudi Arabia',NULL,0.00,'SA',NULL,1,1,'1');
/*!40000 ALTER TABLE `service_provider_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider_languages`
--

DROP TABLE IF EXISTS `service_provider_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_qualification` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_provider_languages_user_id_foreign` (`user_id`),
  CONSTRAINT `service_provider_languages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider_languages`
--

LOCK TABLES `service_provider_languages` WRITE;
/*!40000 ALTER TABLE `service_provider_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_provider_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_remotely` tinyint(1) NOT NULL DEFAULT '0',
  `has_availability_times` tinyint(1) NOT NULL DEFAULT '0',
  `main_category_id` bigint unsigned NOT NULL,
  `sub_category_id` bigint unsigned NOT NULL,
  `efficiency_level_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_main_category_id_foreign` (`main_category_id`),
  KEY `services_sub_category_id_foreign` (`sub_category_id`),
  KEY `services_efficiency_level_id_foreign` (`efficiency_level_id`),
  KEY `services_user_id_foreign` (`user_id`),
  CONSTRAINT `services_efficiency_level_id_foreign` FOREIGN KEY (`efficiency_level_id`) REFERENCES `efficiency_levels` (`id`),
  CONSTRAINT `services_main_category_id_foreign` FOREIGN KEY (`main_category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `services_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (2,'مدري خصوصي لمواد المحاسبة الجامعية',0,1,111,192,13,317,'2022-06-21 04:38:55','2022-06-21 04:38:55');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (9,'email','mohammed.salah.mohammed.96@gmail.com','2021-03-13 18:41:44','2021-03-13 18:41:44'),(10,'phone','01127259515','2021-03-13 18:41:44','2021-03-13 18:41:44'),(11,'allowed_free_posts','10','2021-03-13 18:41:44','2021-04-29 11:54:03'),(12,'social_media','{\"facebook\":\"fb\",\"twitter\":\"tw\"}','2021-03-13 18:41:44','2021-03-13 18:41:44');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_translations`
--

DROP TABLE IF EXISTS `settings_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_us` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_translations`
--

LOCK TABLES `settings_translations` WRITE;
/*!40000 ALTER TABLE `settings_translations` DISABLE KEYS */;
INSERT INTO `settings_translations` VALUES (1,'en','about us','rty','2021-03-13 18:41:44','2021-04-26 09:39:48'),(2,'ar','عن التطبيق','yrt','2021-03-13 18:41:44','2021-04-26 09:39:48'),(3,'tr','about us','yrt','2021-03-13 18:41:44','2021-04-26 09:39:48'),(4,'ud','about us','ytr','2021-03-13 18:41:44','2021-04-26 09:39:48');
/*!40000 ALTER TABLE `settings_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_users`
--

DROP TABLE IF EXISTS `social_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_users_user_id_foreign` (`user_id`),
  CONSTRAINT `social_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_users`
--

LOCK TABLES `social_users` WRITE;
/*!40000 ALTER TABLE `social_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_manager_detail_novas`
--

DROP TABLE IF EXISTS `store_manager_detail_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_manager_detail_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doj` date NOT NULL,
  `country_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `region_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `membership_id` int DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_manager_detail_novas`
--

LOCK TABLES `store_manager_detail_novas` WRITE;
/*!40000 ALTER TABLE `store_manager_detail_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_manager_detail_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_managers_details`
--

DROP TABLE IF EXISTS `store_managers_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_managers_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `doj` date DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `regoin_id` bigint unsigned DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `membership_id` bigint unsigned DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_managers_details_admin_id_foreign` (`admin_id`),
  KEY `store_managers_details_membership_id_foreign` (`membership_id`),
  KEY `store_managers_details_category_id_foreign` (`category_id`),
  KEY `store_managers_details_regoin_id_foreign` (`regoin_id`),
  KEY `store_managers_details_city_id_foreign` (`city_id`),
  KEY `store_managers_details_country_id_foreign` (`country_id`),
  CONSTRAINT `store_managers_details_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  CONSTRAINT `store_managers_details_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `store_managers_details_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `store_managers_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `store_managers_details_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`),
  CONSTRAINT `store_managers_details_regoin_id_foreign` FOREIGN KEY (`regoin_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_managers_details`
--

LOCK TABLES `store_managers_details` WRITE;
/*!40000 ALTER TABLE `store_managers_details` DISABLE KEYS */;
INSERT INTO `store_managers_details` VALUES (4,'test11','test111','default.png','2022-03-24',1,7,8,132,9,36,'2022-03-24 15:35:09','2022-03-24 15:35:09','1648128909290619.png');
/*!40000 ALTER TABLE `store_managers_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_transactions`
--

DROP TABLE IF EXISTS `store_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_user_id` bigint unsigned NOT NULL,
  `store_admin_id` bigint unsigned NOT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `bill_no` int NOT NULL,
  `amount_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `store_commission` decimal(2,2) NOT NULL DEFAULT '0.00',
  `money_back_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_transactions_client_user_id_foreign` (`client_user_id`),
  KEY `store_transactions_store_admin_id_foreign` (`store_admin_id`),
  CONSTRAINT `store_transactions_client_user_id_foreign` FOREIGN KEY (`client_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `store_transactions_store_admin_id_foreign` FOREIGN KEY (`store_admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_transactions`
--

LOCK TABLES `store_transactions` WRITE;
/*!40000 ALTER TABLE `store_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_reason_novas`
--

DROP TABLE IF EXISTS `support_reason_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_reason_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_reason_novas`
--

LOCK TABLES `support_reason_novas` WRITE;
/*!40000 ALTER TABLE `support_reason_novas` DISABLE KEYS */;
INSERT INTO `support_reason_novas` VALUES (1,'Suggestion','اقتراح',1,'2022-07-25 00:41:16','2022-07-25 00:41:16'),(2,'Complaint','شكوى',1,'2022-07-25 00:41:16','2022-07-25 00:41:16'),(3,'Inquiry','استفسار',1,'2022-07-25 00:41:16','2022-07-25 00:41:16'),(4,'Cancel order','إلغاء الطلب',1,'2022-07-25 00:41:16','2022-07-25 00:41:16');
/*!40000 ALTER TABLE `support_reason_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_reason_translations`
--

DROP TABLE IF EXISTS `support_reason_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_reason_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_reason_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_reason_translations_support_reason_id_foreign` (`support_reason_id`),
  CONSTRAINT `support_reason_translations_support_reason_id_foreign` FOREIGN KEY (`support_reason_id`) REFERENCES `support_reasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_reason_translations`
--

LOCK TABLES `support_reason_translations` WRITE;
/*!40000 ALTER TABLE `support_reason_translations` DISABLE KEYS */;
INSERT INTO `support_reason_translations` VALUES (5,'en','Suggestion',3,'2022-03-02 13:02:34','2022-03-02 13:02:34'),(6,'ar','اقتراح',3,'2022-03-02 13:02:34','2022-03-02 13:02:34'),(7,'en','Complaint',4,'2022-03-02 13:03:16','2022-03-02 13:03:16'),(8,'ar','شكوى',4,'2022-03-02 13:03:16','2022-03-02 13:03:16'),(9,'en','Inquiry',5,'2022-03-02 13:04:38','2022-03-02 13:04:38'),(10,'ar','استفسار',5,'2022-03-02 13:04:38','2022-03-02 13:04:38'),(39,'en','Cancel order',11,'2022-06-18 21:43:47','2022-06-18 21:43:47'),(40,'ar','إلغاء الطلب',11,'2022-06-18 21:43:47','2022-06-18 21:43:47');
/*!40000 ALTER TABLE `support_reason_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_reasons`
--

DROP TABLE IF EXISTS `support_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_reasons`
--

LOCK TABLES `support_reasons` WRITE;
/*!40000 ALTER TABLE `support_reasons` DISABLE KEYS */;
INSERT INTO `support_reasons` VALUES (3,0,'2022-03-02 13:02:34','2022-03-02 13:02:34'),(4,0,'2022-03-02 13:03:16','2022-03-02 13:03:16'),(5,0,'2022-03-02 13:04:38','2022-03-02 13:04:38'),(11,0,'2022-06-18 21:43:47','2022-06-18 21:43:47');
/*!40000 ALTER TABLE `support_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket_novas`
--

DROP TABLE IF EXISTS `support_ticket_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `support_reason_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_ticket_novas_support_reason_id_index` (`support_reason_id`),
  KEY `support_ticket_novas_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_novas`
--

LOCK TABLES `support_ticket_novas` WRITE;
/*!40000 ALTER TABLE `support_ticket_novas` DISABLE KEYS */;
INSERT INTO `support_ticket_novas` VALUES (1,'asd','qwe',0,4,306,'2022-07-25 00:42:44','2022-07-25 00:42:44');
/*!40000 ALTER TABLE `support_ticket_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `support_reason_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_tickets_support_reason_id_foreign` (`support_reason_id`),
  KEY `support_tickets_user_id_foreign` (`user_id`),
  CONSTRAINT `support_tickets_support_reason_id_foreign` FOREIGN KEY (`support_reason_id`) REFERENCES `support_reasons` (`id`),
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
INSERT INTO `support_tickets` VALUES (25,'عدم اتقان العمل','العمل لم ينفذ بالشكل الصحيح',0,4,317,'2022-07-02 20:19:42','2022-07-02 20:19:42');
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `result` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_advertisement_id_foreign` (`advertisement_id`),
  CONSTRAINT `transactions_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (87,'2210417118841187069',203.00,'Successful','2210417118841187069',416,'2022-04-14 16:18:50','2022-04-14 16:18:50'),(88,'2210723147118452402',1.00,'Successful','2210723147118452402',419,'2022-04-17 22:51:48','2022-04-17 22:51:48'),(89,'2210923164281807650',2.00,'Successful','2210923164281807650',426,'2022-04-19 22:32:19','2022-04-19 22:32:19'),(90,'2211111177197920996',3.00,'Successful','2211111177197920996',429,'2022-04-21 10:25:00','2022-04-21 10:25:00'),(91,'2211111177258863058',40.00,'Successful','2211111177258863058',430,'2022-04-21 10:35:09','2022-04-21 10:35:09'),(92,'2211500207999905844',200.00,'Successful','2211500207999905844',433,'2022-04-24 23:58:35','2022-04-24 23:58:35'),(93,'2211504209097886302',1.00,'Successful','nil',423,'2022-04-25 03:01:31','2022-04-25 03:01:31'),(94,'2211504209255737980',1.00,'Successful','nil',422,'2022-04-25 03:31:54','2022-04-25 03:31:54'),(95,'2211505209566852235',1.00,'Successful','2211505209566852235',420,'2022-04-25 04:19:49','2022-04-25 04:19:49'),(96,'2211515213068336438',50.00,'Successful','2211515213068336438',435,'2022-04-25 14:03:23','2022-04-25 14:03:23'),(97,'2211523222716341258',1.00,'Successful','nil',421,'2022-04-25 22:37:32','2022-04-25 22:37:32'),(98,'2211600222923772367',1.00,'Successful','2211600222923772367',443,'2022-04-25 23:11:06','2022-04-25 23:11:06'),(99,'2211600222974841847',1.00,'Successful','2211600222974841847',442,'2022-04-25 23:20:59','2022-04-25 23:20:59'),(100,'2211601216970985308',1.00,'Successful','2211601216970985308',439,'2022-04-26 00:53:52','2022-04-26 00:53:52'),(104,'2211603224039570675',1.00,'Successful','nil',438,'2022-04-26 02:16:38','2022-04-26 02:16:38'),(105,'2211603224052829535',1.00,'Successful','nil',440,'2022-04-26 02:18:50','2022-04-26 02:18:50'),(106,'2211614221348907896',1.00,'Successful','2211614221348907896',436,'2022-04-26 13:03:29','2022-04-26 13:03:29'),(107,'2212822334701536994',5.00,'Successful','2212822334701536994',464,'2022-05-08 21:43:01','2022-05-08 21:43:01'),(108,'2212823334839848944',1.00,'Successful','2212823334839848944',468,'2022-05-08 22:21:51','2022-05-08 22:21:51'),(109,'2212913340201901319',1.00,'Successful','2212913340201901319',494,'2022-05-09 13:17:05','2022-05-09 13:17:05'),(110,'2213001344231479099',1.00,'Successful','nil',499,'2022-05-10 00:08:37','2022-05-10 00:08:37'),(111,'2213001344433629485',1.00,'Successful','nil',501,'2022-05-10 00:42:18','2022-05-10 00:42:18'),(112,'2213203362259685536',1.00,'Successful','2213203362259685536',502,'2022-05-12 02:13:32','2022-05-12 02:13:32'),(113,'2213203362316355864',1.00,'Successful','nil',503,'2022-05-12 02:22:46','2022-05-12 02:22:46'),(114,'2213203362384697969',1.00,'Successful','nil',504,'2022-05-12 02:34:09','2022-05-12 02:34:09'),(115,'2213203362401068320',1.00,'Successful','nil',500,'2022-05-12 02:36:52','2022-05-12 02:36:52'),(116,'2213203362455769913',1.00,'Successful','nil',505,'2022-05-12 02:46:00','2022-05-12 02:46:00'),(117,'2213203362536751506',1.00,'Successful','nil',506,'2022-05-12 02:59:30','2022-05-12 02:59:30'),(118,'2213204362592369355',1.00,'Successful','2213204362592369355',507,'2022-05-12 03:09:05','2022-05-12 03:09:05'),(119,'2213213365866489115',1.00,'Successful','2213213365866489115',509,'2022-05-12 13:09:23','2022-05-12 13:09:23'),(120,'2213216360324018075',1.00,'Successful','2213216360324018075',498,'2022-05-12 15:06:32','2022-05-12 15:06:32'),(121,'2213323378377773306',1.00,'Successful','nil',513,'2022-05-13 22:59:40','2022-05-13 22:59:40'),(122,'2213401378962953458',1.00,'Successful','nil',514,'2022-05-14 00:37:12','2022-05-14 00:37:12'),(123,'2213414383641219886',1.00,'Successful','nil',517,'2022-05-14 13:36:54','2022-05-14 13:36:54'),(124,'2213415383893309500',1.00,'Successful','2213415383893309500',521,'2022-05-14 14:25:12','2022-05-14 14:25:12'),(125,'2213415384032395184',1.00,'Successful','2213415384032395184',522,'2022-05-14 14:44:21','2022-05-14 14:44:21'),(126,'2213416384326659733',1.00,'Successful','nil',523,'2022-05-14 15:31:08','2022-05-14 15:31:08'),(127,'2213418385081802146',1.00,'Successful','nil',524,'2022-05-14 17:37:00','2022-05-14 17:37:00'),(128,'2213422386339382122',50.00,'Successful','2213422386339382122',528,'2022-05-14 21:08:16','2022-05-14 21:08:16'),(129,'2213701405009558352',1.00,'Successful','2213701405009558352',536,'2022-05-17 00:58:33','2022-05-17 00:58:33'),(130,'2213720411717629075',1.00,'Successful','2213720411717629075',542,'2022-05-17 19:36:32','2022-05-17 19:36:32');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_novas`
--

DROP TABLE IF EXISTS `transportation_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_novas`
--

LOCK TABLES `transportation_novas` WRITE;
/*!40000 ALTER TABLE `transportation_novas` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_translations`
--

DROP TABLE IF EXISTS `transportation_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportation_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transportation_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_translations_transportation_id_foreign` (`transportation_id`),
  CONSTRAINT `transportation_translations_transportation_id_foreign` FOREIGN KEY (`transportation_id`) REFERENCES `transportations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_translations`
--

LOCK TABLES `transportation_translations` WRITE;
/*!40000 ALTER TABLE `transportation_translations` DISABLE KEYS */;
INSERT INTO `transportation_translations` VALUES (7,'en','Car',4,'2022-03-02 13:18:33','2022-03-02 13:18:33'),(8,'ar','سيارة',4,'2022-03-02 13:18:33','2022-03-02 13:18:33'),(11,'en','Truck',6,'2022-03-02 13:19:16','2022-03-02 13:19:16'),(12,'ar','شاحنة',6,'2022-03-02 13:19:16','2022-03-02 13:19:16'),(13,'en','Heavy equipment',7,'2022-03-02 13:19:39','2022-03-02 13:19:39'),(14,'ar','معدات ثقيلة',7,'2022-03-02 13:19:39','2022-03-02 13:19:39'),(17,'en','Motorcycle',8,'2022-03-02 13:20:24','2022-03-02 13:20:24'),(18,'ar','دراجة نارية',8,'2022-03-02 13:20:24','2022-03-02 13:20:24'),(19,'en','Bicycle',5,'2022-03-02 13:20:35','2022-03-02 13:20:35'),(20,'ar','دراجة هوائية',5,'2022-03-02 13:20:35','2022-03-02 13:20:35'),(21,'en','By feet',9,'2022-03-02 13:21:10','2022-03-02 13:21:10'),(22,'ar','مشيا على الأقدام',9,'2022-03-02 13:21:10','2022-03-02 13:21:10'),(23,'en','Online',10,'2022-03-02 13:21:24','2022-03-02 13:21:24'),(24,'ar','عن بعد',10,'2022-03-02 13:21:24','2022-03-02 13:21:24');
/*!40000 ALTER TABLE `transportation_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportations`
--

DROP TABLE IF EXISTS `transportations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportations`
--

LOCK TABLES `transportations` WRITE;
/*!40000 ALTER TABLE `transportations` DISABLE KEYS */;
INSERT INTO `transportations` VALUES (4,1,1,'2022-03-02 13:18:33','2022-03-02 13:18:33'),(5,1,2,'2022-03-02 13:19:00','2022-03-02 13:19:00'),(6,1,3,'2022-03-02 13:19:16','2022-03-02 13:19:16'),(7,1,4,'2022-03-02 13:19:39','2022-03-02 13:19:39'),(8,1,5,'2022-03-02 13:20:09','2022-03-02 13:20:09'),(9,1,6,'2022-03-02 13:21:10','2022-03-02 13:21:10'),(10,1,7,'2022-03-02 13:21:24','2022-03-02 13:21:24');
/*!40000 ALTER TABLE `transportations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_advertisement`
--

DROP TABLE IF EXISTS `user_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_advertisement` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `advertisement_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_advertisement_user_id_foreign` (`user_id`),
  KEY `user_advertisement_advertisement_id_foreign` (`advertisement_id`),
  CONSTRAINT `user_advertisement_advertisement_id_foreign` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_advertisement_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_advertisement`
--

LOCK TABLES `user_advertisement` WRITE;
/*!40000 ALTER TABLE `user_advertisement` DISABLE KEYS */;
INSERT INTO `user_advertisement` VALUES (72,270,593),(76,347,618);
/*!40000 ALTER TABLE `user_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_category`
--

DROP TABLE IF EXISTS `user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_category_category_id_foreign` (`category_id`),
  KEY `user_category_user_id_foreign` (`user_id`),
  CONSTRAINT `user_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `user_category_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_category`
--

LOCK TABLES `user_category` WRITE;
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
INSERT INTO `user_category` VALUES (1,114,325,'2022-06-16 12:24:56','2022-06-16 12:24:56'),(2,163,325,'2022-06-16 12:24:56','2022-06-16 12:24:56');
/*!40000 ALTER TABLE `user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_language`
--

DROP TABLE IF EXISTS `user_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_language` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language_id` bigint unsigned NOT NULL,
  `efficiency_level_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_language_language_id_foreign` (`language_id`),
  KEY `user_language_efficiency_level_id_foreign` (`efficiency_level_id`),
  KEY `user_language_user_id_foreign` (`user_id`),
  CONSTRAINT `user_language_efficiency_level_id_foreign` FOREIGN KEY (`efficiency_level_id`) REFERENCES `efficiency_levels` (`id`),
  CONSTRAINT `user_language_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `user_language_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_language`
--

LOCK TABLES `user_language` WRITE;
/*!40000 ALTER TABLE `user_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transportation`
--

DROP TABLE IF EXISTS `user_transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_transportation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transportation_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_transportation_transportation_id_foreign` (`transportation_id`),
  KEY `user_transportation_user_id_foreign` (`user_id`),
  CONSTRAINT `user_transportation_transportation_id_foreign` FOREIGN KEY (`transportation_id`) REFERENCES `transportations` (`id`),
  CONSTRAINT `user_transportation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transportation`
--

LOCK TABLES `user_transportation` WRITE;
/*!40000 ALTER TABLE `user_transportation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `is_service_provider` tinyint(1) NOT NULL DEFAULT '0',
  `orders_offers_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `messages_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `appointments_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `language_id` bigint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `cancelled_orders_count` int NOT NULL DEFAULT '0',
  `allowed_to_post` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_store` tinyint NOT NULL DEFAULT '0',
  `membership_id` bigint unsigned NOT NULL DEFAULT '2',
  `block` tinyint NOT NULL DEFAULT '0',
  `total_mueeny_money_back` decimal(8,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_language_id_foreign` (`language_id`),
  KEY `users_membership_id_foreign` (`membership_id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (270,'Testing user','testingemail@mail.com','966223453467','$2y$10$AaBy/tL6O0AL1dvs3UPcAOBgb6V.4y09sl6eqgpMfwM4HA9xxWpTC','default.png','',NULL,1,1,1,1,1,2,1,0,1,'2022-05-26 10:40:11','2022-05-31 22:07:19',0,12,0,0.00,0.00,'966','ivphHuGNssWffwXJzV8dEzd2UKB2'),(272,'Testing provider','testingemailprovider@mail.com','5006565651','$2y$10$GZE9v4sveqeHd50.N.MN9uI77Jk64d6ZT9KS01F8DefhwPPkJkR9S','default.png','',NULL,2,1,1,1,1,2,1,0,1,'2022-05-27 10:26:27','2022-06-15 19:28:25',0,12,0,0.00,0.00,'966','dE0YIsQzRNVG00KqAYmlfZVCvm92'),(290,'manar jameel assiry','manarassiry@gmail.com','966591844206','$2y$10$kTIhXiyFYff1em2CmmZJnuwdfejpEA3w7VATztHFoD9H/pGImzYyy','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-06 00:29:16','2022-06-06 00:29:20',0,12,0,0.00,0.00,NULL,'vcJrVrqmuyL75ghV1RKUZqhUs3M2'),(291,'Zohaib','zik@zik.com','966500409598','$2y$10$Voon9BoOBmbEgk449UmLKObfBmMUKVSOQDy90fVvYqkLpvIa1qJR2','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-06 13:05:48','2022-06-12 21:30:04',0,12,0,0.00,0.00,NULL,'HHnDhxu9UgOnLmsog29ZtDibyn83'),(293,'zohiab kambr',NULL,'966500409599','$2y$10$.o45eaVsZHcoKBd45mVCUeQ0lw2S0TuV/QA0xo1DdZPdw6hV7fud2','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-07 00:32:42','2022-06-07 00:32:42',0,12,0,0.00,0.00,NULL,NULL),(294,'usernewnowtest','usernewnowtest@test.com','966554153646','$2y$10$HvNGkDZTa1pZzvcL8XK3duANSpAwISDn0WNGhg/ZYJCGAMMm0UG36','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-07 00:33:20','2022-06-07 00:33:20',0,12,0,0.00,0.00,NULL,NULL),(295,'Raed alsalhi','r.alsalhi@hotmail.com','966502202033','$2y$10$zBPip84/pCsff94zHYbxYe3BuCSF9o7wojsaWVErp9fW.9SRzoOuq','default.png','',NULL,1,0,1,1,1,1,1,0,1,'2022-06-07 11:31:59','2022-07-10 12:40:14',0,12,0,0.00,0.00,'966','m1sgG7QJE5eOdLXJO4dOMiPLdAK2'),(296,'Mohamed','mohamedemam14020@gmail.com','966558293861','$2y$10$Ujd8BWCUg3E9D7SaGUONPuTzlQ6jxwqt9LByolsZEH8R6EImIufvq','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-07 12:33:56','2022-06-07 12:33:59',0,12,0,0.00,0.00,NULL,'wHnPyfQBBRhrKNgoVijetccPB8i2'),(297,'نصرالدين ابراهيم نصرالدين محمد احمد','ibrahemnasralden@gmail.com','966543491558','$2y$10$7pyqqvflCtcHhKm5K2io6OMzZ1Zh/C3p.LJN1QNNzE8hM7o0.x2AC','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-07 15:58:01','2022-06-07 15:58:01',0,12,0,0.00,0.00,NULL,NULL),(298,'محمد مرشد',NULL,'9660530069279','$2y$10$eZOo40NVqgMV1s9.CiDIq.xvHweGIj/4Lx6tHoafVbj/u5vSJRlxi','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-07 19:04:07','2022-06-07 19:04:07',0,12,0,0.00,0.00,NULL,NULL),(299,'mohammed yousif','msomeet123@gmail.com','966568139785','$2y$10$yOyAaYelhoROwJKQugq2ROYrjILXdP4Gdx4eMSFEBOnUqMZAnnHoC','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-07 23:18:08','2022-06-07 23:18:08',0,12,0,0.00,0.00,NULL,NULL),(300,'aborana','aborana8683@gmaim.com','966547124520','$2y$10$frw5maypSonuZ5KAGUM72u26/ldd.fCjhedrKg974o9dPEq7X6U/y','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-08 11:36:26','2022-06-08 11:36:30',0,12,0,0.00,0.00,NULL,'BGKjH4F39qh0qxskFihW1uis5Zn2'),(301,'Arabah Tarabzouni','a.tarabzouni123@me.com','966590806666','$2y$10$iCLp5Kyih0gJRZLXLeOjhOdwmqOoDb44z3xM8hrRyaMr/pdS7lgwi','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-08 18:55:59','2022-06-08 18:56:01',0,12,0,0.00,0.00,NULL,'iW3vYV5cgQMQnE7cAozqxdRvKR02'),(302,'mohd','cavalier491@gmAil.com','966563205156','$2y$10$ByHbdRr2qcbYqVnJiFz5dOTHSLl5yxDt26JwXo50muRnWCO9CUpty','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-08 20:21:48','2022-06-08 20:21:48',0,12,0,0.00,0.00,NULL,NULL),(303,'Abdulrahman Ateeq','qasmiakailani@gmail.com','966530462055','$2y$10$/s/3PSyoQyuAuduHflNCU.XLoGiEpHrMvFR51pacc/pLKifhsz2Me','default.png','','2022-06-25',NULL,0,1,1,1,1,1,0,1,'2022-06-09 00:26:22','2022-06-25 21:34:29',0,12,0,0.00,0.00,NULL,NULL),(304,'Fahad','ff2003ff@hotmail.com','966542166571','$2y$10$7DAqrd2oCKizgHxRiYF1jePZVSYumJjp84gKv/2.iroSv9SnWDflC','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-09 20:59:38','2022-06-09 20:59:38',0,12,0,0.00,0.00,NULL,NULL),(305,'مالك ماجد الرفاعي','malikalrifaei@gmail.com','966551949982','$2y$10$Dm5Wn3PelKLqVzMcnjpEC.uav.SjYEXiyvzbQwG3P5hnxZaiO5lri','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-09 21:49:10','2022-06-09 21:49:12',0,12,0,0.00,0.00,NULL,'O8fIhSZFc6hTyjlAQSOIqpqIwYE3'),(306,'ADEL ALMUTAIRI','adel_bin_eifan@hotmail.com','966563350500','$2y$10$aGIroPHsOrXHi/ECdeQ7FOxdzbmZwULZ9JOXjuIwy8mqBbF5wn9qu','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-10 00:12:29','2022-06-10 00:12:33',0,12,0,0.00,0.00,NULL,'fkkHHK7EzibU4ZrJOQ9uVmrCquw1'),(307,'حصه','hessa.dakheel@gmail.com','966507873386','$2y$10$gfSGO4DkH4whCXSEasGYTOPTc0o5wVbOgEbCqDOHZTgXc09e5WfFW','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-10 15:11:04','2022-06-10 15:11:07',0,12,0,0.00,0.00,NULL,'EPO4ohL7xSeGjuaDkRqe5jBy6Ui1'),(308,'Mohammed','mdhommod123@gmail.com','966557233630','$2y$10$89ZBcY1LlREfAWRzRKT4.eZHExUUeKyllmi38EVZmcDSDSHpYMfje','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-10 20:42:46','2022-06-10 20:42:46',0,12,0,0.00,0.00,NULL,NULL),(309,'Abdulmajeed','aamt2@hotmail.com','966553331693','$2y$10$ele/TvHFYfQU3MW.2AIWO.GtIeZdQKBlOwhbIhgKTjemqb/IFfCga','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-10 23:04:49','2022-06-10 23:04:49',0,12,0,0.00,0.00,NULL,NULL),(310,'Ammar','ammar23_eng@yahoo.com','966541102077','$2y$10$jdFqMkUs/XczT7AQ836zRe505e3IwWEiJAiSdJJ//dtRF4PK4bdTS','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-11 05:50:15','2022-06-11 05:50:15',0,12,0,0.00,0.00,NULL,NULL),(311,'abeer','abeer99f@hotmail.com','966500220017','$2y$10$cGtKAf0zGZz/DGBxtLHXDONAy1RaX6jIyZG9kx.rdbZytV7SxsD6G','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-11 12:41:25','2022-06-11 12:41:28',0,12,0,0.00,0.00,NULL,'ydM4dNT6zYNyc0cckIob0YhlRh43'),(312,'abdelmohsen','abdelmohsen@ezz-adv.com','966597164599','$2y$10$1Xq7LZg7GU8XsMW1p5XcYOXE/vOWxR0d/fQusJcbE64Hx1aJAYqZG','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-11 13:12:57','2022-06-11 13:12:57',0,12,0,0.00,0.00,NULL,NULL),(313,'Mosa','mosa1422@hotmail.com','966503426441','$2y$10$FsTRmSXUfJd6YYLGrHN.YuQ9ygTj6EMyF/5mqvJm0yaT2g.MVf7nu','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-11 15:40:09','2022-06-11 15:40:12',0,12,0,0.00,0.00,NULL,'tyO0FHvWqtOhRIU9NLaoQ4r26oP2'),(314,'Abdalgadir Ahmad','habiballa331992@gmail.com','966577689181','$2y$10$yTLRB6pDbX68vXATleZm7OUwh4pLzx2a3ti6Px1ZzTBlqvDtaGNhK','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-11 18:00:51','2022-06-11 18:00:51',0,12,0,0.00,0.00,NULL,NULL),(315,'محمد','m990m187@gmail.com','966563728118','$2y$10$MMIM6HJIIYfmY71jKFphT.eLZW1IHDTDwIaEwz4x1vANqxqQbzwCq','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-11 18:13:16','2022-06-11 18:13:19',0,12,0,0.00,0.00,NULL,'FK7xurO0pTZMzTbDNKRDBgMRDpa2'),(316,'ghad','Aljori27@hotmail.com','966544647255','$2y$10$f6109JC3M8.GkP8CEEAo/OMaQY.2A9sGErRPjV9R9edgfcMv7emuG','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-12 07:15:48','2022-06-12 07:15:52',0,12,0,0.00,0.00,NULL,'FhiaZVmK9MPpio9ieVilTG1oOno2'),(317,'m','iliixi.77@gmail.com','966537800200','$2y$10$J9eGW8Oj8kGkyR1P2BGgBOJBxhMSdxynlaZaYZEAe5qK0etr/NLNq','default.png','',NULL,NULL,1,1,1,1,1,1,0,1,'2022-06-12 21:57:18','2022-06-18 17:28:13',0,12,0,0.00,0.00,NULL,'lgk4kCwCPGRkuhT92uU5EkDX3qM2'),(318,'فاطمه','Fa.to0ote11@gmail.com','966554461161','$2y$10$VpvgzqSanUxjkje3cDsq8OCun0L5Z0EywPG5oQfXJc6pnQvVIvm1y','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-13 08:57:14','2022-06-13 08:57:17',0,12,0,0.00,0.00,NULL,'x4bcAgu8wLecskfK2UKEozNPRy02'),(319,'منيره','mnayr121212@gmail.com','966533618534','$2y$10$Xbt4soL6SFtEyf3cZeQa3ePhCHlHn.Lhfe1v0dXP4Z1bvRd.BpBBO','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-13 17:32:39','2022-06-13 17:32:43',0,12,0,0.00,0.00,NULL,'cMBIAUF4YGe9xjUn3Jc2K3fTC5p2'),(320,'hyam','Hyama4@hotmail.com','966559344652','$2y$10$xybpCymXAQ8W856YLKYxhuHYIJc2LWYx4HKmZjEZYMw4hpN7uoLDi','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-14 12:43:38','2022-06-14 12:43:41',0,12,0,0.00,0.00,NULL,'NS3z33kg3SazyggIefneY01OR8H3'),(321,'zubair sharjeel','szubair01@gmail.com','966500473844','$2y$10$eSMIpBYs/Ub762bvX6MrX.bixZzMsqLT31WuCkadfJgdPvzksCJ9q','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-14 22:01:58','2022-06-14 22:08:34',0,12,0,0.00,0.00,NULL,'jK6SXkbDYMVP2RcAkVLB9B17OBz1'),(322,'Sara Ahm','lujainashoor@hotmail.com','966505586969','$2y$10$OvZXPadb.ubnfoFlxoxLVOVQmKbuLdyVOhp6UH3X3qIHApWRhpZlK','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-15 14:17:30','2022-06-15 14:17:30',0,12,0,0.00,0.00,NULL,NULL),(323,'livetest','livetest@t.com','0544477777','$2y$10$TjwODJwIWotZ0dDSTJ67JOenPllx2fn.ajXNZYAoruHcChWzApC8a','default.png','',NULL,2,1,1,1,1,2,1,0,1,'2022-06-15 19:25:09','2022-06-16 19:48:21',0,12,0,0.00,50.00,'966','sYbjzhwJRlWcAqZOdGAYaC3X8hz1'),(324,'Mohammed','alduraibims@gmail.com','966549790909','$2y$10$kLE5WrBt98IEQ6m67vZ.MOIEmWkdIlRVvrhPGmeRnLxKsxHJfFYZW','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-15 23:37:43','2022-06-15 23:37:46',0,12,0,0.00,0.00,NULL,'5Nx1Xxh05xMllFU614oGT0q82Cv2'),(325,'شركة كوادر للاستشارات الهندسية','mo_h@kawadereng.com','966532242043','$2y$10$Q/TkH068aDpTv4vzGi6gleqS3UvWesclQsSgFzw.nSX4Ah7CT.pvO','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-16 12:11:31','2022-06-16 12:11:31',0,12,0,0.00,0.00,NULL,NULL),(326,'livec','livetestc@c.com','966544684578','$2y$10$US1PI.lV6EZChAGGkDaaAOQkqpHm9uMWjy8g8qSgC2xwSrtMRHQ.m','default.png','','2022-06-22',2,0,1,1,1,2,1,0,1,'2022-06-16 19:36:47','2022-06-22 19:32:22',0,12,0,0.00,0.00,'966','XBHNJppb4jd9jokOKoI15P61pv82'),(327,'ali','al_qattan84@hotmail.com','966555929230','$2y$10$FrqySfVlFvT3v.3JqN65P.cIuCi7IBefg2.RL0M6BdPxD9pN8cpz2','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-17 13:13:31','2022-06-17 13:13:34',0,12,0,0.00,0.00,NULL,'l9OfwQ988DdhKtX1UNqbglhE9le2'),(328,'Fahad','aljohani.fahad@gmail.com','966580510124','$2y$10$M47Mf1mDa.jJtZ5BC7hfXeiNsliyuMKf5m6oQHsz/1pFArt2ulTSG','default.png','',NULL,1,0,0,0,0,1,1,0,1,'2022-06-18 17:32:48','2022-06-21 13:17:57',0,12,0,0.00,0.00,NULL,'RfpV5VYa2RYER0rn9ejv946bcKz1'),(329,'abdullah','abdullah.alkethery@gmail.com','966565166659','$2y$10$VF0LrSihkipYzFqbDIJZs.tz3vY6VnnubQNMJaQuIj0L9aS7zDyBS','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-18 23:43:50','2022-06-18 23:43:53',0,12,0,0.00,0.00,NULL,'T8PFU51b8LW9biATmTZsv15YxX52'),(330,'zohiab kambr',NULL,'966500409590','$2y$10$h0Xay3VRbsLJ23LjBM7Lhe63riTuVxN/88AGf.PdHIayselImIw0e','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-19 00:45:48','2022-06-19 00:45:48',0,12,0,0.00,0.00,NULL,NULL),(331,'delete test account',NULL,'966500409591','$2y$10$R3Rj8SOj5NSNgZ90dUcWle7RHXC0VjgT3h9dahMhi/5mNJipaiw8W','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-19 00:46:53','2022-06-19 00:46:53',0,12,0,0.00,0.00,NULL,'testfirebaseid'),(332,'Naveed Ahmad','nahmed@psu.edu.sa','966558159071','$2y$10$1ru75gM9Zdx3N31LfzYuh.N/VZGSgKqYE7W90y28iHGZqUO0NSW5i','default.png','',NULL,NULL,0,1,1,1,3,1,0,1,'2022-06-19 10:13:48','2022-06-19 10:13:48',0,12,0,0.00,0.00,NULL,NULL),(333,'walaa','walaa.ash85@gmail.com','966566596295','$2y$10$wvMeViwOuDCzNQFGreT2z.ENwSAKOFrkHV6orvGF9yM7TSl6ZOjyy','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-20 21:12:22','2022-06-20 21:12:26',0,12,0,0.00,0.00,NULL,'jNAckH3Ctpg5Xo95ahdvwy3cD3K2'),(334,'Nasser Al-Jbreen','bony@mail.net.sa','966565574966','$2y$10$NP1ucA6iKjcaeiEgHmV8FOcsByJkxJh3UqmBoZ5gQY2bcZQHmpEka','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-06-21 22:24:31','2022-06-21 22:24:34',0,12,0,0.00,0.00,NULL,'liByllTF2fRfKVkKwlRRpteGKJv2'),(335,'Mohammed Ali','mohammed.alihaggag@gmail.com','201096426267','$2y$10$jYK1.rU919wtBW3kfV7tHuf6J3GjqXZ7k347axsusHl.rKn59q/2m','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-22 02:03:06','2022-06-22 02:03:06',0,12,0,0.00,0.00,NULL,NULL),(336,'providertest','providertest@t.com','966544682222','$2y$10$py0dE090Ryo.IB68upyIWOTmNc0WJSWjQNCp68PwZipt0J8h2LGXW','default.png','',NULL,2,1,1,1,1,1,1,0,1,'2022-06-22 19:47:17','2022-06-22 19:49:56',0,12,0,0.00,0.00,'966','XgH1XriiAibmfjuXegA4fuMKwUB3'),(337,'saliman','gxr4747@hotmil.com','966503939664','$2y$10$dhHMd/PgrLxQOdLj5DAkxOpWkE47PuysnhKpYF3QCgV3GhwtTxgmC','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-25 22:25:30','2022-06-25 22:25:33',0,12,0,0.00,0.00,NULL,'MUwoSs4vgtZtXMXyb9J90t3aYJH2'),(338,'Bader','badermobile2018@gmail.com','966551005916','$2y$10$NyV.Kc3qler9nZTEVs5eSuADPndkZQsvwnBk5xw8tg30U5NT/SnOu','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-25 23:17:13','2022-06-25 23:17:17',0,12,0,0.00,0.00,NULL,'tYXuV9TqXlWTmHxyL0t3bNVbDKS2'),(339,'عبدالعزيز','info@the-right-way-sa.com','966500897500','$2y$10$nSFef01CETXOT7/VP0Z/7e.ZWa.ao6rajhhL/sQySKy4rg0O4s6uu','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-26 14:41:37','2022-06-26 14:41:37',0,12,0,0.00,0.00,NULL,NULL),(340,'marwa waled','marwa@b-seenapp.com','966566628424','$2y$10$z/MrCl4cqiGvHM6M1OX.weHuOHCM1x341xuen99la7ojK.0JSIMnS','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-27 09:05:56','2022-06-27 09:06:00',0,12,0,0.00,0.00,NULL,'9i33lKia7KaT6hQq731gr1rgRdg2'),(341,'فخد','s1096985781@hotmail.com','966507451770','$2y$10$sK/4fWQaP1EYXLifQrpSPu/CVYO67GT61Ehvp52vnW./6zHV4djBe','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-28 20:49:35','2022-06-28 20:49:37',0,12,0,0.00,0.00,NULL,'nX0FyGLcirOpUxmKsR1CvVQMAXK2'),(342,'Feras Alsaedi','ferasalsaedi777@gmail.com','966540407321','$2y$10$vs2FnKIdpj6UrdTCEfPpbOhtnkiaRMQUGXX52PqT3yjQgEJoVbfE2','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-06-30 17:09:18','2022-06-30 17:09:21',0,12,0,0.00,0.00,NULL,'rCI0QM8RK4V52q5tAtY6gDPrE9O2'),(343,'غدي علي','gadi_ali123@icloud.com','966550648318','$2y$10$xu3WQ1pW.Rr5RIDfzlGsNe6WHr.nSRwVam.PxYHStC/DWDm0cuZSS','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-07-02 21:19:50','2022-07-02 21:19:53',0,12,0,0.00,0.00,NULL,'daD82WtwzlSJo6fSCe85eToz2zi2'),(344,'Abeer','abeerabeer121@hotmail.com','966500571774','$2y$10$F27y6YhaUf9hXN0EmdjHsebuOv28yu8xiSsG/cpsI7qBk2JN4kfmW','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-07-05 23:23:47','2022-07-05 23:23:51',0,12,0,0.00,0.00,NULL,'RDkbYyvR4iYKdfreG1QsnjSnCx72'),(345,'Dilawar','dilawarsheikh1@gmail.com','966594870092','$2y$10$26TleOo2IruzvmmZXHlYOuVPDbC5065afD0tIJNzBsbPZWxFFgCpS','default.png','',NULL,1,0,1,1,1,2,1,0,1,'2022-07-08 17:59:35','2022-07-23 01:25:27',0,12,0,0.00,0.00,'966',NULL),(346,'سمر','rssdd90@gmail.com','966557714124','$2y$10$QOPF44PSKL3sXuuu741JQexyIH.L32XBvdNCjmvO/y4AlI/5aWary','default.png','',NULL,2,0,1,1,1,1,1,0,1,'2022-07-10 06:24:09','2022-07-10 06:25:58',0,12,0,0.00,0.00,NULL,'4VulYez9Y9NyG5mIIRTJHzbeLk42'),(347,'Android client','andclienttest@test.com','966544488804','$2y$10$yshZeZDbCFGlGTeErdWcbuhVveoqy5eq.SfV6g1z1dlboUuDsSBbW','default.png','',NULL,2,0,1,1,1,2,1,0,1,'2022-07-12 12:31:46','2022-07-12 12:32:56',0,12,0,0.00,0.00,'966','IJAYkE8KRTapgHmLaaPjeXDGLZI2'),(348,'Android Provider','andprovidertest@test.com','966556645637','$2y$10$DIGszVKwZ.CSclCN2l4HHeXdS524MzGQd4z0OhJ69pku3tBNyIIAq','default.png','',NULL,2,1,1,1,1,2,1,0,1,'2022-07-12 12:33:48','2022-07-22 10:58:19',0,12,0,0.00,0.00,'966','tec6DTWQRBfZcWgukPAEVUIVUhA3'),(349,'هديل','hadeel_qar@hotmail.com','966566203939','$2y$10$hfMKgiHxEotNqFFIexsW6uxO.Q5Hp0rHGoCchyEepguo1bZDxUQ0K','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-07-16 20:01:00','2022-07-16 20:01:04',0,12,0,0.00,0.00,NULL,'lmQaN5bXLGRwrq8D44zapXSr36m2'),(350,'hani','hanyahmed55@gmail.com','966543307587','$2y$10$P0yGCIYe5Oq0/s3rBglDsuc01ZLNP5emlta2H52z1otbmTiizcGvC','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-07-19 11:09:50','2022-07-19 11:09:53',0,12,0,0.00,0.00,NULL,'6INLcq1MiqNeJumiWFYon7Grxej2'),(351,'Jabril Ahnish','jabrilahnish@gmail.com','966547969972','$2y$10$DzKyjvoCWaiecXEkfiwvx.Br9QqHeiWiZcCm6tLJGwRJAJhMvAvLm','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-07-19 21:31:27','2022-07-19 21:31:30',0,12,0,0.00,0.00,NULL,'q0DI2Rn7tzLbPNJPDIyBYkHs8m42'),(352,'muneer aljohani','muneerld304@gmail.com','966555663625','$2y$10$OvYfWppv0Xya/1cnGGgWDOt0OAjcUoy4awXd6s0vUzjaurM6RxeHO','default.png','',NULL,NULL,0,1,1,1,1,1,0,1,'2022-07-21 01:24:54','2022-07-21 01:24:57',0,12,0,0.00,0.00,NULL,'kHWy9j5DmyQhRHW8oA2gpxEBoTY2'),(353,'testlogin','testlogin@log.com','966544655579','$2y$10$mMb/SAenSfnlrHLxt7/6zeeD2EMUAOSZA4F2/.lUTY3C7pxF/zQv6','default.png','',NULL,2,0,1,1,1,2,1,0,1,'2022-07-22 11:05:49','2022-07-22 11:08:30',0,12,0,0.00,0.00,'966','yvfr2cwXHVYBO83Ath1mBxLwP6X2'),(354,'prodtestp','prodtestp@p.com','966544681279','$2y$10$faKtBTNNuu77s9jK3qwzoeWSHb0D8SsLxk7zzxGxEsPsUtco7JPTK','default.png','',NULL,2,1,1,1,1,2,1,0,1,'2022-07-23 16:45:30','2022-07-23 19:04:32',0,12,0,0.00,0.00,'966','C4fbeRsmaFOrTf3voW5vTDEfjn32'),(355,'prodtestc','prodtestc@c.com','966544687279','$2y$10$UD50qiVwm0BoCIBu7vlrzulLntQC/PliwJfHHXoAsais3h8oyiniy','default.png','',NULL,NULL,0,1,1,1,2,1,0,1,'2022-07-23 19:05:52','2022-07-23 19:05:52',0,12,0,0.00,0.00,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome_screen_novas`
--

DROP TABLE IF EXISTS `welcome_screen_novas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `welcome_screen_novas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome_screen_novas`
--

LOCK TABLES `welcome_screen_novas` WRITE;
/*!40000 ALTER TABLE `welcome_screen_novas` DISABLE KEYS */;
INSERT INTO `welcome_screen_novas` VALUES (1,'Assumenda non nemo a','Ratione provident p','Labore sit quia quid','Consequatur volupta','1647195240839390.jpg',1,1,'2022-07-25 01:06:14','2022-07-25 01:06:14'),(2,'One-stop services platform','منصة الخدمات المتكاملة','Mueeny connects clients with the service providers. Increase your profit and get your services done!','معینی هي منصة تربط العملاء بمزودي الخدمة. زد أرباحك وأنجز خدماتك في الوقت ذاته!','1647193373679582.jpg',1,3,'2022-07-25 01:06:14','2022-07-25 01:06:14'),(3,'Registration','التسجيل في معيني','1-  Verify your phone number\n2- Determine your location\n3- Complete the registration form\n4- Start your journey with Mueeny!','1- سيتم التحقق من رقم هاتفك\n2- تحديد موقعك\n3- إكمال استمارة التسجيل\n4- ابدأ رحلتك مع معيني!','1649067583669292.jpg',1,4,'2022-07-25 01:06:14','2022-07-25 01:06:14'),(4,'Get started!','لنبدأ!','Mueeny is the comprehensive platform for all your services.','معيني المنصة المتكاملة لخدماتك','uploads/welcome_screens/J7RzSqiVCfjt1ueVQh2NSoGjSGgTouzccBtSZ0W5.png',1,32,'2022-07-25 01:06:14','2022-07-25 01:07:39');
/*!40000 ALTER TABLE `welcome_screen_novas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome_screen_translations`
--

DROP TABLE IF EXISTS `welcome_screen_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `welcome_screen_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `locale` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `welcome_screen_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `welcome_screen_translations_welcome_screen_id_foreign` (`welcome_screen_id`),
  CONSTRAINT `welcome_screen_translations_welcome_screen_id_foreign` FOREIGN KEY (`welcome_screen_id`) REFERENCES `welcome_screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome_screen_translations`
--

LOCK TABLES `welcome_screen_translations` WRITE;
/*!40000 ALTER TABLE `welcome_screen_translations` DISABLE KEYS */;
INSERT INTO `welcome_screen_translations` VALUES (185,'en','Assumenda non nemo a','Labore sit quia quid',21,'2022-03-22 14:20:10','2022-03-22 14:20:10'),(186,'ar','Ratione provident p','Consequatur volupta',21,'2022-03-22 14:20:10','2022-03-22 14:20:10'),(187,'en','One-stop services platform','Mueeny connects clients with the service providers. Increase your profit and get your services done!',18,'2022-04-02 12:26:12','2022-04-02 12:26:12'),(188,'ar','منصة الخدمات المتكاملة','معینی هي منصة تربط العملاء بمزودي الخدمة. زد أرباحك وأنجز خدماتك في الوقت ذاته!',18,'2022-04-02 12:26:12','2022-04-02 12:26:12'),(195,'en','Registration','1-  Verify your phone number\r\n2- Determine your location\r\n3- Complete the registration form\r\n4- Start your journey with Mueeny!',19,'2022-04-03 11:21:13','2022-04-03 11:21:13'),(196,'ar','التسجيل في معيني','1- سيتم التحقق من رقم هاتفك\r\n2- تحديد موقعك\r\n3- إكمال استمارة التسجيل\r\n4- ابدأ رحلتك مع معيني!',19,'2022-04-03 11:21:13','2022-04-03 11:21:13'),(199,'en','Get started!','Mueeny is the comprehensive platform for all your services.',20,'2022-04-04 12:19:43','2022-04-04 12:19:43'),(200,'ar','لنبدأ!','معيني المنصة المتكاملة لخدماتك',20,'2022-04-04 12:19:43','2022-04-04 12:19:43');
/*!40000 ALTER TABLE `welcome_screen_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `welcome_screens`
--

DROP TABLE IF EXISTS `welcome_screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `welcome_screens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `position` bigint NOT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `welcome_screens`
--

LOCK TABLES `welcome_screens` WRITE;
/*!40000 ALTER TABLE `welcome_screens` DISABLE KEYS */;
INSERT INTO `welcome_screens` VALUES (18,1,1,'1647195240839390.jpg','2022-03-13 19:42:20','2022-03-15 07:50:38'),(19,1,3,'1647193373679582.jpg','2022-03-13 19:42:53','2022-03-14 10:09:35'),(20,1,4,'1649067583669292.png','2022-03-13 19:43:14','2022-04-04 12:19:43'),(21,0,32,'1647951610174968.png','2022-03-22 14:20:10','2022-03-22 14:20:10');
/*!40000 ALTER TABLE `welcome_screens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-25 19:02:40
