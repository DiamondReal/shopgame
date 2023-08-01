-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table shop.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(255) NOT NULL,
  `coins` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `type` enum('blacklisted','normal','manager','') NOT NULL DEFAULT 'normal',
  `ip` varchar(800) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `cooldown` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shop.clients: ~0 rows (approximately)
INSERT INTO `clients` (`id`, `username`, `password`, `email`, `coins`, `paid`, `type`, `ip`, `level`, `cooldown`) VALUES
	(2, 'dreamx2', '$2y$10$ZFyHVIeefkLHR.wwtor4qOK/9sR9aVq9NsfYl1MMmMuZEQgDrZDFO', 'janegg64113900@gmail.com', 498000.00, 0.00, 'manager', '127.0.0.1', 1000000, '');

-- Dumping structure for table shop.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.items: ~0 rows (approximately)

-- Dumping structure for table shop.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.jobs: ~1 rows (approximately)
INSERT INTO `jobs` (`name`, `label`) VALUES
	('unemployed', 'Unemployed');

-- Dumping structure for table shop.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.job_grades: ~1 rows (approximately)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}');

-- Dumping structure for table shop.key_topup
CREATE TABLE IF NOT EXISTS `key_topup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keytext` varchar(255) NOT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `date` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.key_topup: ~0 rows (approximately)

-- Dumping structure for table shop.log_random
CREATE TABLE IF NOT EXISTS `log_random` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `date` text NOT NULL,
  `owner` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'mc',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.log_random: ~0 rows (approximately)

-- Dumping structure for table shop.log_topup
CREATE TABLE IF NOT EXISTS `log_topup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(255) NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `username` varchar(255) NOT NULL,
  `time` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table shop.log_topup: ~0 rows (approximately)

-- Dumping structure for table shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(1500) NOT NULL,
  `image` text NOT NULL,
  `description` mediumtext NOT NULL,
  `help` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pattern` enum('normaltext','code','eml:psw','usr:psw','usr:eml:psw') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shop.products: ~2 rows (approximately)
INSERT INTO `products` (`id`, `name`, `image`, `description`, `help`, `price`, `pattern`) VALUES
	(12, 'test12', 'https://cdn.discordapp.com/attachments/1083423328859070554/1131766197612986368/261700731_224176796517469_2244323463734613144_n.png', 'test1', 'test2', 1.00, 'code'),
	(13, '4242แหหก', 'https://cdn.discordapp.com/attachments/1129069338519941170/1131752431420723352/image.png', '965412', '687452', 1000.00, 'normaltext');

-- Dumping structure for table shop.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `truewallet` varchar(255) NOT NULL,
  `discord` varchar(255) NOT NULL,
  `page_id` varchar(255) NOT NULL,
  `theme_color` varchar(255) NOT NULL,
  `logged_in_greeting` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.settings: ~1 rows (approximately)
INSERT INTO `settings` (`id`, `title`, `description`, `image`, `keywords`, `truewallet`, `discord`, `page_id`, `theme_color`, `logged_in_greeting`) VALUES
	(1, 'Savage Stroe', 'ร้านขายไอดีเกม และเกมอื่นๆ<br>ที่ถูกกว่าราคาตลาดทั่วไป', 'https://cdn.discordapp.com/attachments/1083423328859070554/1131765247275958272/ALL_SERVICE.png', 'Savage Stroe', '0987654321', 'https://www.facebook.com', '', '#50cd89', 'ติดต่อสอบถามเกี่ยวกับสินค้า เติมเงิน หรือ รายงานระบบ');

-- Dumping structure for table shop.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` int(255) NOT NULL,
  `contents` mediumtext NOT NULL,
  `owner` varchar(32) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shop.stock: ~2 rows (approximately)
INSERT INTO `stock` (`id`, `type`, `contents`, `owner`, `date`) VALUES
	(1, 12, '1414', 'dreamx2', '2023-07-21 03:34:14'),
	(2, 13, 'https://www.facebook.com/pages/?category=top&ref=bookmarks', 'dreamx2', '2023-07-21 23:20:59');

-- Dumping structure for table shop.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table shop.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
