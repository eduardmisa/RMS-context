-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for apidb
CREATE DATABASE IF NOT EXISTS `apidb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `apidb`;

-- Dumping structure for table apidb.applications
CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `base_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `base_url` (`base_url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table apidb.applications: ~2 rows (approximately)
DELETE FROM `applications`;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-04-10 16:25:25.736404', 'mainadmin', '2020-04-10 16:25:25.738404', 'mainadmin', 'APP-1', 'Inventory System', '', 'http://inventory.u4rdsystem.com'),
	(2, '2020-04-10 16:25:33.813318', 'mainadmin', '2020-04-10 16:25:33.814982', 'mainadmin', 'APP-2', 'Incident Report System', '', 'http://incident-report.u4rdsystem.com');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;

-- Dumping structure for table apidb.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `clid` varchar(255) NOT NULL,
  `clsc` varchar(255) NOT NULL,
  `valid_until` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `clid` (`clid`),
  UNIQUE KEY `clsc` (`clsc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table apidb.clients: ~0 rows (approximately)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`) VALUES
	(1, '2020-04-10 16:38:30.131336', 'mainadmin', '2020-04-10 16:38:30.133334', 'mainadmin', 'CLI-1', 'Inventory System API', '', 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2025-04-10 01:00:00.000000'),
	(2, '2020-04-10 16:39:14.737308', 'mainadmin', '2020-04-10 16:39:14.738378', 'mainadmin', 'CLI-2', 'Incident Report API', '', '6HOFMmL2FV5OuBHpZOPI5l165uq0MnCT', 'MXjFiQkBpJdEuOEZszXKuigUwUDFB36g', '2025-04-10 01:00:00.000000');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table apidb.clients_applications
CREATE TABLE IF NOT EXISTS `clients_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_applications_client_id_application_id_b0fbac28_uniq` (`client_id`,`application_id`),
  KEY `clients_applications_application_id_31aa1e49_fk_applications_id` (`application_id`),
  CONSTRAINT `clients_applications_application_id_31aa1e49_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `clients_applications_client_id_d6bdc36d_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table apidb.clients_applications: ~0 rows (approximately)
DELETE FROM `clients_applications`;
/*!40000 ALTER TABLE `clients_applications` DISABLE KEYS */;
INSERT INTO `clients_applications` (`id`, `client_id`, `application_id`) VALUES
	(1, 1, 1),
	(2, 2, 2);
/*!40000 ALTER TABLE `clients_applications` ENABLE KEYS */;

-- Dumping structure for table apidb.endpoints
CREATE TABLE IF NOT EXISTS `endpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `method` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `endpoints_method_url_86480b4a_uniq` (`method`,`url`),
  KEY `endpoints_module_id_0ed7e432_fk_modules_id` (`module_id`),
  CONSTRAINT `endpoints_module_id_0ed7e432_fk_modules_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table apidb.endpoints: ~20 rows (approximately)
DELETE FROM `endpoints`;
/*!40000 ALTER TABLE `endpoints` DISABLE KEYS */;
INSERT INTO `endpoints` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `permission`, `module_id`) VALUES
	(1, '2020-04-10 16:27:31.464104', 'mainadmin', '2020-04-10 16:27:31.465096', 'mainadmin', 'EDP-1', 'GET', '/api/v1/Stocks/', 'Can List Stocks', 1),
	(2, '2020-04-10 16:27:40.670034', 'mainadmin', '2020-04-10 16:27:40.672037', 'mainadmin', 'EDP-2', 'GET', '/api/v1/Stocks/[0-9]+/', 'Can View Stocks', 1),
	(3, '2020-04-10 16:27:52.698556', 'mainadmin', '2020-04-10 16:27:52.700550', 'mainadmin', 'EDP-3', 'POST', '/api/v1/Stocks/', 'Can Create Stocks', 1),
	(4, '2020-04-10 16:27:58.688797', 'mainadmin', '2020-04-10 16:28:52.377687', 'mainadmin', 'EDP-4', 'PUT', '/api/v1/Stocks/[0-9]+/', 'Can Update Stocks', 1),
	(5, '2020-04-10 16:28:04.753652', 'mainadmin', '2020-04-10 16:29:02.767623', 'mainadmin', 'EDP-5', 'DELETE', '/api/v1/Stocks/[0-9]+/', 'Can Delete Stocks', 1),
	(6, '2020-04-10 16:29:48.356581', 'mainadmin', '2020-04-10 16:29:48.357580', 'mainadmin', 'EDP-6', 'GET', '/api/v1/Suppliers/', 'Can List Suppliers', 2),
	(7, '2020-04-10 16:29:56.083450', 'mainadmin', '2020-04-10 16:29:56.085448', 'mainadmin', 'EDP-7', 'GET', '/api/v1/Suppliers/[0-9]+/', 'Can View Suppliers', 2),
	(8, '2020-04-10 16:30:09.478081', 'mainadmin', '2020-04-10 16:30:09.479076', 'mainadmin', 'EDP-8', 'POST', '/api/v1/Suppliers/', 'Can Create Suppliers', 2),
	(9, '2020-04-10 16:30:16.264751', 'mainadmin', '2020-04-10 16:30:16.266160', 'mainadmin', 'EDP-9', 'PUT', '/api/v1/Suppliers/[0-9]+/', 'Can Update Suppliers', 2),
	(10, '2020-04-10 16:30:20.990014', 'mainadmin', '2020-04-10 16:30:20.992079', 'mainadmin', 'EDP-10', 'DELETE', '/api/v1/Suppliers/[0-9]+/', 'Can Delete Suppliers', 2),
	(11, '2020-04-10 16:31:00.528165', 'mainadmin', '2020-04-10 16:31:00.529162', 'mainadmin', 'EDP-11', 'GET', '/api/v1/Clients/', 'Can List Clients', 3),
	(12, '2020-04-10 16:31:10.644080', 'mainadmin', '2020-04-10 16:31:10.646082', 'mainadmin', 'EDP-12', 'GET', '/api/v1/Clients/[0-9]+/', 'Can View Clients', 3),
	(13, '2020-04-10 16:31:20.773796', 'mainadmin', '2020-04-10 16:31:20.775794', 'mainadmin', 'EDP-13', 'POST', '/api/v1/Clients/', 'Can Create Clients', 3),
	(14, '2020-04-10 16:31:29.402846', 'mainadmin', '2020-04-10 16:31:29.403842', 'mainadmin', 'EDP-14', 'PUT', '/api/v1/Clients/[0-9]+/', 'Can Update Clients', 3),
	(15, '2020-04-10 16:31:44.821019', 'mainadmin', '2020-04-10 16:31:44.821971', 'mainadmin', 'EDP-15', 'DELETE', '/api/v1/Clients/[0-9]+/', 'Can Delete Clients', 3),
	(16, '2020-04-10 16:32:07.108173', 'mainadmin', '2020-04-10 16:32:20.564174', 'mainadmin', 'EDP-16', 'GET', '/api/v1/Incidents/', 'Can List Incidents', 4),
	(17, '2020-04-10 16:33:03.223761', 'mainadmin', '2020-04-10 16:33:03.225730', 'mainadmin', 'EDP-17', 'GET', '/api/v1/Incidents/[0-9]+/', 'Can View Incidents', 4),
	(18, '2020-04-10 16:33:17.753569', 'mainadmin', '2020-04-10 16:33:17.754570', 'mainadmin', 'EDP-18', 'POST', '/api/v1/Incidents/', 'Can Create Incidents', 4),
	(19, '2020-04-10 16:33:24.438086', 'mainadmin', '2020-04-10 16:33:24.440084', 'mainadmin', 'EDP-19', 'PUT', '/api/v1/Incidents/[0-9]+/', 'Can Update Incidents', 4),
	(20, '2020-04-10 16:33:38.691303', 'mainadmin', '2020-04-10 16:33:38.692299', 'mainadmin', 'EDP-20', 'DELETE', '/api/v1/Incidents/[0-9]+/', 'Can Delete Incidents', 4);
/*!40000 ALTER TABLE `endpoints` ENABLE KEYS */;

-- Dumping structure for table apidb.modules
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `modules_name_application_id_0de2b710_uniq` (`name`,`application_id`),
  KEY `modules_application_id_f285bf5b_fk_applications_id` (`application_id`),
  CONSTRAINT `modules_application_id_f285bf5b_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table apidb.modules: ~4 rows (approximately)
DELETE FROM `modules`;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `application_id`) VALUES
	(1, '2020-04-10 16:25:52.497091', 'mainadmin', '2020-04-10 16:25:52.498066', 'mainadmin', 'MOD-1', 'Stocks', '', 1),
	(2, '2020-04-10 16:25:56.735146', 'mainadmin', '2020-04-10 16:25:56.736143', 'mainadmin', 'MOD-2', 'Suppliers', '', 1),
	(3, '2020-04-10 16:26:02.895538', 'mainadmin', '2020-04-10 16:26:02.896534', 'mainadmin', 'MOD-3', 'Clients', '', 1),
	(4, '2020-04-10 16:26:29.920808', 'mainadmin', '2020-04-10 16:26:29.922669', 'mainadmin', 'MOD-4', 'Incidents', '', 2);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
