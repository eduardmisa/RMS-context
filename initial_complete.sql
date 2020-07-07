-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for rms_context_db
DROP DATABASE IF EXISTS `rms_context_db`;
CREATE DATABASE IF NOT EXISTS `rms_context_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rms_context_db`;

-- Dumping structure for table rms_context_db.applications
DROP TABLE IF EXISTS `applications`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.applications: ~0 rows (approximately)
DELETE FROM `applications`;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-04-10 16:25:25.736404', 'superuser', '2020-04-10 16:25:25.738404', 'superuser', 'APP-1', 'Resource Management System', '', 'http://localhost:8001');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.clients
DROP TABLE IF EXISTS `clients`;
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
  `valid_until` date NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `clid` (`clid`),
  UNIQUE KEY `clsc` (`clsc`),
  KEY `clients_application_id_f9ce4e58_fk_applications_id` (`application_id`),
  CONSTRAINT `clients_application_id_f9ce4e58_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.clients: ~0 rows (approximately)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `application_id`) VALUES
	(1, '2020-04-10 16:38:30.131336', 'superuser', '2020-04-10 16:38:30.133334', 'superuser', 'CLI-1', 'RMS API', '', 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2025-04-10', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.clients_applications
DROP TABLE IF EXISTS `clients_applications`;
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

-- Dumping data for table rms_context_db.clients_applications: ~0 rows (approximately)
DELETE FROM `clients_applications`;
/*!40000 ALTER TABLE `clients_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_applications` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.django_migrations
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.django_migrations: ~1 rows (approximately)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'entities', '0001_initial', '2020-07-07 10:02:42.912980');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.entity_logs
DROP TABLE IF EXISTS `entity_logs`;
CREATE TABLE IF NOT EXISTS `entity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `action` varchar(50) NOT NULL,
  `entity` varchar(50) NOT NULL,
  `row_id` int(11) NOT NULL,
  `fromValue` longtext DEFAULT NULL,
  `toValue` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.entity_logs: ~0 rows (approximately)
DELETE FROM `entity_logs`;
/*!40000 ALTER TABLE `entity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_logs` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `has_all_access` tinyint(1) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `groups_name_application_id_f6129205_uniq` (`name`,`application_id`),
  KEY `groups_application_id_5e31609a_fk_applications_id` (`application_id`),
  CONSTRAINT `groups_application_id_5e31609a_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.groups: ~0 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.groups_permissions
DROP TABLE IF EXISTS `groups_permissions`;
CREATE TABLE IF NOT EXISTS `groups_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_permissions_group_id_permission_id_26124091_uniq` (`group_id`,`permission_id`),
  KEY `groups_permissions_permission_id_36f619fe_fk_permissions_id` (`permission_id`),
  CONSTRAINT `groups_permissions_group_id_a03c8909_fk_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_permissions_permission_id_36f619fe_fk_permissions_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.groups_permissions: ~0 rows (approximately)
DELETE FROM `groups_permissions`;
/*!40000 ALTER TABLE `groups_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_permissions` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.modules
DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `route_front_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `route_front_id` (`route_front_id`),
  UNIQUE KEY `modules_name_route_front_id_c0cf6b90_uniq` (`name`,`route_front_id`),
  KEY `modules_parent_id_c1d497fb_fk_modules_id` (`parent_id`),
  CONSTRAINT `modules_parent_id_c1d497fb_fk_modules_id` FOREIGN KEY (`parent_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `modules_route_front_id_c3b363f8_fk_routes_front_id` FOREIGN KEY (`route_front_id`) REFERENCES `routes_front` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.modules: ~0 rows (approximately)
DELETE FROM `modules`;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `icon`, `parent_id`, `route_front_id`) VALUES
	(1, '2020-05-09 20:54:54.104679', 'superuser', '2020-05-09 20:55:20.330046', 'superuser', 'MOD-1', 'Applications', '', 'mdi-cloud-braces', NULL, NULL),
	(2, '2020-05-09 20:55:46.040617', 'superuser', '2020-05-09 20:57:09.389115', 'superuser', 'MOD-2', 'List', '', '', 1, 1),
	(3, '2020-05-09 20:56:04.282883', 'superuser', '2020-05-09 20:57:15.143684', 'superuser', 'MOD-3', 'Create', '', '', 1, 3),
	(4, '2020-05-09 21:00:03.835554', 'superuser', '2020-05-09 21:00:03.838528', 'superuser', 'MOD-4', 'Frontend Routes', '', 'mdi-routes', NULL, NULL),
	(5, '2020-05-09 21:00:26.628792', 'superuser', '2020-05-09 21:00:26.630791', 'superuser', 'MOD-5', 'List', '', '', 4, 6),
	(6, '2020-05-09 21:00:35.629820', 'superuser', '2020-05-09 21:00:35.630865', 'superuser', 'MOD-6', 'Create', '', '', 4, 8),
	(7, '2020-05-09 21:00:51.052073', 'superuser', '2020-05-09 21:00:51.054049', 'superuser', 'MOD-7', 'Backend Routes', '', 'mdi-routes', NULL, NULL),
	(8, '2020-05-09 21:01:31.237889', 'superuser', '2020-05-09 21:01:31.238934', 'superuser', 'MOD-8', 'List', '', '', 7, 11),
	(9, '2020-05-09 21:01:40.987956', 'superuser', '2020-05-09 21:01:40.988955', 'superuser', 'MOD-9', 'Create', '', '', 7, 13),
	(10, '2020-05-09 21:02:02.945763', 'superuser', '2020-05-09 21:02:02.946830', 'superuser', 'MOD-10', 'Permissions', '', 'mdi-security-network', NULL, NULL),
	(11, '2020-05-09 21:02:17.135049', 'superuser', '2020-05-09 21:02:17.137023', 'superuser', 'MOD-11', 'List', '', '', 10, 16),
	(12, '2020-05-09 21:02:31.614010', 'superuser', '2020-05-09 21:02:31.615059', 'superuser', 'MOD-12', 'Create', '', '', 10, 18),
	(13, '2020-05-09 21:02:43.359088', 'superuser', '2020-05-09 21:02:43.361085', 'superuser', 'MOD-13', 'Modules', '', 'mdi-view-module', NULL, NULL),
	(14, '2020-05-09 21:02:53.695939', 'superuser', '2020-05-09 21:02:53.696937', 'superuser', 'MOD-14', 'List', '', '', 13, 21),
	(15, '2020-05-09 21:03:01.886106', 'superuser', '2020-05-09 21:03:01.888100', 'superuser', 'MOD-15', 'Create', '', '', 13, 23),
	(16, '2020-05-09 21:03:21.490018', 'superuser', '2020-05-09 21:03:21.492033', 'superuser', 'MOD-16', 'Groups', '', 'mdi-account-network', NULL, NULL),
	(17, '2020-05-09 21:03:30.232890', 'superuser', '2020-05-09 21:03:30.233887', 'superuser', 'MOD-17', 'List', '', '', 16, 26),
	(18, '2020-05-09 21:03:43.239589', 'superuser', '2020-05-09 21:03:43.241588', 'superuser', 'MOD-18', 'Create', '', '', 16, 28),
	(19, '2020-05-09 21:03:55.119301', 'superuser', '2020-05-09 21:03:55.120371', 'superuser', 'MOD-19', 'Users', '', 'mdi-account-multiple', NULL, NULL),
	(20, '2020-05-09 21:04:09.911001', 'superuser', '2020-05-09 21:04:09.911998', 'superuser', 'MOD-20', 'List', '', '', 19, 31),
	(21, '2020-05-09 21:04:15.519071', 'superuser', '2020-05-09 21:04:15.520040', 'superuser', 'MOD-21', 'Create', '', '', 19, 33),
	(22, '2020-05-09 21:04:24.913512', 'superuser', '2020-05-09 21:04:24.915579', 'superuser', 'MOD-22', 'Clients', '', 'mdi-application', NULL, NULL),
	(23, '2020-05-09 21:04:34.013458', 'superuser', '2020-05-09 21:04:34.014460', 'superuser', 'MOD-23', 'List', '', '', 22, 36),
	(24, '2020-05-09 21:04:41.352696', 'superuser', '2020-05-09 21:04:41.353674', 'superuser', 'MOD-24', 'Create', '', '', 22, 38);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`) VALUES
	(1, '2020-05-09 20:53:01.271585', 'superuser', '2020-05-09 20:53:01.273581', 'superuser', 'PRM-1', 'Can List Applications', ''),
	(2, '2020-05-09 20:53:10.558888', 'superuser', '2020-05-09 20:53:10.559886', 'superuser', 'PRM-2', 'Can View Application', ''),
	(3, '2020-05-09 20:53:17.874009', 'superuser', '2020-05-09 20:53:17.876008', 'superuser', 'PRM-3', 'Can Add Application', ''),
	(4, '2020-05-09 20:53:37.306508', 'superuser', '2020-05-09 20:53:37.307482', 'superuser', 'PRM-4', 'Can Edit Application', ''),
	(5, '2020-05-09 20:53:55.549010', 'superuser', '2020-05-09 20:53:55.550980', 'superuser', 'PRM-5', 'Can Delete Application', ''),
	(6, '2020-05-10 13:53:04.515071', 'superuser', '2020-05-10 13:53:04.519070', 'superuser', 'PRM-6', 'Can List Frontend Routes', NULL),
	(7, '2020-05-10 13:53:29.160034', 'superuser', '2020-05-10 13:53:29.161006', 'superuser', 'PRM-7', 'Can View Frontend Route', NULL),
	(8, '2020-05-10 13:54:13.721442', 'superuser', '2020-05-10 13:54:13.722440', 'superuser', 'PRM-8', 'Can Add Frontend Route', NULL),
	(9, '2020-05-10 13:55:29.003994', 'superuser', '2020-05-10 13:55:29.005993', 'superuser', 'PRM-9', 'Can Edit Frontend Route', NULL),
	(10, '2020-05-10 13:55:57.361644', 'superuser', '2020-05-10 13:55:57.362617', 'superuser', 'PRM-10', 'Can Delete Frontend Route', NULL),
	(11, '2020-05-10 14:00:20.893657', 'superuser', '2020-05-10 14:00:20.896661', 'superuser', 'PRM-11', 'Can List Backend Routes', NULL),
	(12, '2020-05-10 14:01:04.446031', 'superuser', '2020-05-10 14:01:04.447004', 'superuser', 'PRM-12', 'Can View Backend Route', NULL),
	(13, '2020-05-10 14:01:53.445823', 'superuser', '2020-05-10 14:01:53.446890', 'superuser', 'PRM-13', 'Can Add Backend Route', NULL),
	(14, '2020-05-10 14:02:27.779319', 'superuser', '2020-05-10 14:02:27.781317', 'superuser', 'PRM-14', 'Can Edit Backend Route', NULL),
	(15, '2020-05-10 14:02:47.813696', 'superuser', '2020-05-10 14:02:47.814695', 'superuser', 'PRM-15', 'Can Delete Backend Route', NULL),
	(16, '2020-05-10 14:05:41.805402', 'superuser', '2020-05-10 14:05:41.807403', 'superuser', 'PRM-16', 'Can List Permissions', NULL),
	(17, '2020-05-10 14:06:08.298824', 'superuser', '2020-05-10 14:06:08.300797', 'superuser', 'PRM-17', 'Can View Permission', NULL),
	(18, '2020-05-10 14:06:27.308169', 'superuser', '2020-05-10 14:06:27.310169', 'superuser', 'PRM-18', 'Can Add Permissions', NULL),
	(19, '2020-05-10 14:07:15.145515', 'superuser', '2020-05-10 14:07:15.147516', 'superuser', 'PRM-19', 'Can Edit Permissions', NULL),
	(20, '2020-05-10 14:07:32.254437', 'superuser', '2020-05-10 14:07:32.256472', 'superuser', 'PRM-20', 'Can Delete Permissions', NULL),
	(21, '2020-05-10 14:08:24.771436', 'superuser', '2020-05-10 14:08:24.772436', 'superuser', 'PRM-21', 'Can List Modules', NULL),
	(22, '2020-05-10 14:08:42.284463', 'superuser', '2020-05-10 14:08:42.286460', 'superuser', 'PRM-22', 'Can View Module', NULL),
	(23, '2020-05-10 14:09:21.656858', 'superuser', '2020-05-10 14:09:21.658855', 'superuser', 'PRM-23', 'Can Add Module', NULL),
	(24, '2020-05-10 14:09:43.428297', 'superuser', '2020-05-10 14:09:43.430296', 'superuser', 'PRM-24', 'Can Edit Module', NULL),
	(25, '2020-05-10 14:10:03.025241', 'superuser', '2020-05-10 14:10:03.026235', 'superuser', 'PRM-25', 'Can Delete Module', NULL),
	(26, '2020-05-10 14:10:58.544642', 'superuser', '2020-05-10 14:10:58.546642', 'superuser', 'PRM-26', 'Can List Groups', NULL),
	(27, '2020-05-10 14:11:16.807605', 'superuser', '2020-05-10 14:11:16.809600', 'superuser', 'PRM-27', 'Can View Group', NULL),
	(28, '2020-05-10 14:11:32.622546', 'superuser', '2020-05-10 14:11:32.624565', 'superuser', 'PRM-28', 'Can Add Group', NULL),
	(29, '2020-05-10 14:11:54.750911', 'superuser', '2020-05-10 14:11:54.751981', 'superuser', 'PRM-29', 'Can Edit Group', NULL),
	(30, '2020-05-10 14:12:14.895716', 'superuser', '2020-05-10 14:12:14.896693', 'superuser', 'PRM-30', 'Can Delete Group', NULL),
	(31, '2020-05-10 14:12:47.321589', 'superuser', '2020-05-10 14:12:47.323590', 'superuser', 'PRM-31', 'Can List Users', NULL),
	(32, '2020-05-10 14:13:03.844185', 'superuser', '2020-05-10 14:13:03.846179', 'superuser', 'PRM-32', 'Can View User', NULL),
	(33, '2020-05-10 14:13:18.108884', 'superuser', '2020-05-10 14:13:18.110887', 'superuser', 'PRM-33', 'Can Add User', NULL),
	(34, '2020-05-10 14:13:35.921543', 'superuser', '2020-05-10 14:13:35.923588', 'superuser', 'PRM-34', 'Can Edit User', NULL),
	(35, '2020-05-10 14:13:52.012924', 'superuser', '2020-05-10 14:13:52.013919', 'superuser', 'PRM-35', 'Can Delete User', NULL),
	(36, '2020-05-10 14:14:13.859256', 'superuser', '2020-05-10 14:14:13.860251', 'superuser', 'PRM-36', 'Can List Clients', NULL),
	(37, '2020-05-10 14:14:31.713666', 'superuser', '2020-05-10 14:14:31.714666', 'superuser', 'PRM-37', 'Can View Client', NULL),
	(38, '2020-05-10 14:14:46.399376', 'superuser', '2020-05-10 14:14:46.400373', 'superuser', 'PRM-38', 'Can Add Client', NULL),
	(39, '2020-05-10 14:15:08.983947', 'superuser', '2020-05-10 14:15:08.985974', 'superuser', 'PRM-39', 'Can Edit Client', NULL),
	(40, '2020-05-10 14:15:34.200389', 'superuser', '2020-05-10 14:15:34.202392', 'superuser', 'PRM-40', 'Can Delete Client', NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.permissions_route_back
DROP TABLE IF EXISTS `permissions_route_back`;
CREATE TABLE IF NOT EXISTS `permissions_route_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `routesback_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_route_back_permission_id_routesback_id_316820ca_uniq` (`permission_id`,`routesback_id`),
  KEY `permissions_route_back_routesback_id_1d92f7f7_fk_routes_back_id` (`routesback_id`),
  CONSTRAINT `permissions_route_back_permission_id_d23580ad_fk_permissions_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permissions_route_back_routesback_id_1d92f7f7_fk_routes_back_id` FOREIGN KEY (`routesback_id`) REFERENCES `routes_back` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions_route_back: ~0 rows (approximately)
DELETE FROM `permissions_route_back`;
/*!40000 ALTER TABLE `permissions_route_back` DISABLE KEYS */;
INSERT INTO `permissions_route_back` (`id`, `permission_id`, `routesback_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 2),
	(5, 4, 4),
	(6, 5, 5),
	(15, 6, 6),
	(16, 7, 7),
	(17, 8, 8),
	(19, 9, 7),
	(18, 9, 9),
	(21, 10, 7),
	(20, 10, 10),
	(22, 11, 11),
	(23, 12, 12),
	(24, 13, 13),
	(25, 14, 12),
	(26, 14, 14),
	(27, 15, 12),
	(28, 15, 15),
	(29, 16, 16),
	(30, 17, 17),
	(31, 18, 18),
	(32, 19, 17),
	(33, 19, 19),
	(34, 20, 17),
	(35, 20, 20),
	(36, 21, 21),
	(37, 22, 22),
	(38, 23, 23),
	(40, 24, 22),
	(39, 24, 24),
	(42, 25, 22),
	(41, 25, 25),
	(43, 26, 26),
	(44, 27, 27),
	(45, 28, 28),
	(46, 29, 27),
	(47, 29, 29),
	(48, 30, 27),
	(49, 30, 30),
	(50, 31, 31),
	(51, 32, 32),
	(52, 33, 33),
	(53, 34, 32),
	(54, 34, 34),
	(55, 35, 32),
	(56, 35, 35),
	(57, 36, 36),
	(58, 37, 37),
	(59, 38, 38),
	(60, 39, 37),
	(61, 39, 39),
	(63, 40, 37),
	(62, 40, 40);
/*!40000 ALTER TABLE `permissions_route_back` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.permissions_route_front
DROP TABLE IF EXISTS `permissions_route_front`;
CREATE TABLE IF NOT EXISTS `permissions_route_front` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `routesfront_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_route_front_permission_id_routesfron_dd31762b_uniq` (`permission_id`,`routesfront_id`),
  KEY `permissions_route_fr_routesfront_id_e66755b7_fk_routes_fr` (`routesfront_id`),
  CONSTRAINT `permissions_route_fr_routesfront_id_e66755b7_fk_routes_fr` FOREIGN KEY (`routesfront_id`) REFERENCES `routes_front` (`id`),
  CONSTRAINT `permissions_route_front_permission_id_732247b1_fk_permissions_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions_route_front: ~0 rows (approximately)
DELETE FROM `permissions_route_front`;
/*!40000 ALTER TABLE `permissions_route_front` DISABLE KEYS */;
INSERT INTO `permissions_route_front` (`id`, `permission_id`, `routesfront_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5),
	(14, 6, 6),
	(15, 7, 7),
	(16, 8, 8),
	(17, 9, 9),
	(18, 10, 10),
	(19, 11, 11),
	(20, 12, 12),
	(21, 13, 13),
	(22, 14, 14),
	(23, 15, 15),
	(24, 16, 16),
	(25, 17, 17),
	(26, 18, 18),
	(27, 19, 19),
	(28, 20, 20),
	(29, 21, 21),
	(30, 22, 22),
	(31, 23, 23),
	(32, 24, 24),
	(33, 25, 25),
	(34, 26, 26),
	(35, 27, 27),
	(36, 28, 28),
	(37, 29, 29),
	(38, 30, 30),
	(39, 31, 31),
	(40, 32, 32),
	(41, 33, 33),
	(42, 34, 34),
	(43, 35, 35),
	(44, 36, 36),
	(45, 37, 37),
	(46, 38, 38),
	(47, 39, 39),
	(48, 40, 40);
/*!40000 ALTER TABLE `permissions_route_front` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.routes_back
DROP TABLE IF EXISTS `routes_back`;
CREATE TABLE IF NOT EXISTS `routes_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `method` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `routes_back_method_url_def2b003_uniq` (`method`,`url`),
  KEY `routes_back_application_id_84803744_fk_applications_id` (`application_id`),
  CONSTRAINT `routes_back_application_id_84803744_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.routes_back: ~0 rows (approximately)
DELETE FROM `routes_back`;
/*!40000 ALTER TABLE `routes_back` DISABLE KEYS */;
INSERT INTO `routes_back` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	(1, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-1', 'GET', '/api/v1/management/applications/', 1),
	(2, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-2', 'GET', '/api/v1/management/applications/[A-Za-zd-]+/', 1),
	(3, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-3', 'POST', '/api/v1/management/applications/', 1),
	(4, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-4', 'PUT', '/api/v1/management/applications/[A-Za-zd-]+/', 1),
	(5, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-5', 'DELETE', '/api/v1/management/applications/[A-Za-zd-]+/', 1),
	(6, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-6', 'GET', '/api/v1/management/routes-front/', 1),
	(7, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-7', 'GET', '/api/v1/management/routes-front/[A-Za-zd-]+/', 1),
	(8, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-8', 'POST', '/api/v1/management/routes-front/', 1),
	(9, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-9', 'PUT', '/api/v1/management/routes-front/[A-Za-zd-]+/', 1),
	(10, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-10', 'DELETE', '/api/v1/management/routes-front/[A-Za-zd-]+/', 1),
	(11, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-11', 'GET', '/api/v1/management/routes-back/', 1),
	(12, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-12', 'GET', '/api/v1/management/routes-back/[A-Za-zd-]+/', 1),
	(13, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-13', 'POST', '/api/v1/management/routes-back/', 1),
	(14, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-14', 'PUT', '/api/v1/management/routes-back/[A-Za-zd-]+/', 1),
	(15, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-15', 'DELETE', '/api/v1/management/routes-back/[A-Za-zd-]+/', 1),
	(16, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-16', 'GET', '/api/v1/management/permissions/', 1),
	(17, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-17', 'GET', '/api/v1/management/permissions/[A-Za-zd-]+/', 1),
	(18, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-18', 'POST', '/api/v1/management/permissions/', 1),
	(19, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-19', 'PUT', '/api/v1/management/permissions/[A-Za-zd-]+/', 1),
	(20, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-20', 'DELETE', '/api/v1/management/permissions/[A-Za-zd-]+/', 1),
	(21, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-21', 'GET', '/api/v1/management/modules/', 1),
	(22, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-22', 'GET', '/api/v1/management/modules/[A-Za-zd-]+/', 1),
	(23, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-23', 'POST', '/api/v1/management/modules/', 1),
	(24, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-24', 'PUT', '/api/v1/management/modules/[A-Za-zd-]+/', 1),
	(25, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-25', 'DELETE', '/api/v1/management/modules/[A-Za-zd-]+/', 1),
	(26, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-26', 'GET', '/api/v1/management/groups/', 1),
	(27, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-27', 'GET', '/api/v1/management/groups/[A-Za-zd-]+/', 1),
	(28, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-28', 'POST', '/api/v1/management/groups/', 1),
	(29, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-29', 'PUT', '/api/v1/management/groups/[A-Za-zd-]+/', 1),
	(30, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-30', 'DELETE', '/api/v1/management/groups/[A-Za-zd-]+/', 1),
	(31, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-31', 'GET', '/api/v1/management/users/', 1),
	(32, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-32', 'GET', '/api/v1/management/users/[A-Za-zd-]+/', 1),
	(33, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-33', 'POST', '/api/v1/management/users/', 1),
	(34, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-34', 'PUT', '/api/v1/management/users/[A-Za-zd-]+/', 1),
	(35, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-35', 'DELETE', '/api/v1/management/users/[A-Za-zd-]+/', 1),
	(36, '2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-36', 'GET', '/api/v1/management/clients/', 1),
	(37, '2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-37', 'GET', '/api/v1/management/clients/[A-Za-zd-]+/', 1),
	(38, '2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-38', 'POST', '/api/v1/management/clients/', 1),
	(39, '2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-39', 'PUT', '/api/v1/management/clients/[A-Za-zd-]+/', 1),
	(40, '2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-40', 'DELETE', '/api/v1/management/clients/[A-Za-zd-]+/', 1);
/*!40000 ALTER TABLE `routes_back` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.routes_front
DROP TABLE IF EXISTS `routes_front`;
CREATE TABLE IF NOT EXISTS `routes_front` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `routes_front_url_application_id_2a4226b7_uniq` (`url`,`application_id`),
  KEY `routes_front_application_id_6fe9661d_fk_applications_id` (`application_id`),
  CONSTRAINT `routes_front_application_id_6fe9661d_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.routes_front: ~0 rows (approximately)
DELETE FROM `routes_front`;
/*!40000 ALTER TABLE `routes_front` DISABLE KEYS */;
INSERT INTO `routes_front` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	(1, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-1', '/applications', 1),
	(2, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-2', '/applications/:id', 1),
	(3, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-3', '/applications/create', 1),
	(4, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-4', '/applications/:id/update', 1),
	(5, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-5', '/applications/:id/delete', 1),
	(6, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-6', '/frontend-routes', 1),
	(7, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-7', '/frontend-routes/:id', 1),
	(8, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-8', '/frontend-routes/create', 1),
	(9, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-9', '/frontend-routes/:id/update', 1),
	(10, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-10', '/frontend-routes/:id/delete', 1),
	(11, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-11', '/backend-routes', 1),
	(12, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-12', '/backend-routes/:id', 1),
	(13, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-13', '/backend-routes/create', 1),
	(14, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-14', '/backend-routes/:id/update', 1),
	(15, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-15', '/backend-routes/:id/delete', 1),
	(16, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-31', '/permissions', 1),
	(17, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-32', '/permissions/:id', 1),
	(18, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-33', '/permissions/create', 1),
	(19, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-34', '/permissions/:id/update', 1),
	(20, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-35', '/permissions/:id/delete', 1),
	(21, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-26', '/modules', 1),
	(22, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-27', '/modules/:id', 1),
	(23, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-28', '/modules/create', 1),
	(24, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-29', '/modules/:id/update', 1),
	(25, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-30', '/modules/:id/delete', 1),
	(26, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-21', '/groups', 1),
	(27, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-22', '/groups/:id', 1),
	(28, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-23', '/groups/create', 1),
	(29, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-24', '/groups/:id/update', 1),
	(30, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-25', '/groups/:id/delete', 1),
	(31, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-36', '/users', 1),
	(32, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-37', '/users/:id', 1),
	(33, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-38', '/users/create', 1),
	(34, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-39', '/users/:id/update', 1),
	(35, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-40', '/users/:id/delete', 1),
	(36, '2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-16', '/clients', 1),
	(37, '2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-17', '/clients/:id', 1),
	(38, '2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-18', '/clients/create', 1),
	(39, '2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-19', '/clients/:id/update', 1),
	(40, '2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-20', '/clients/:id/delete', 1);
/*!40000 ALTER TABLE `routes_front` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_salt` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`),
  UNIQUE KEY `password_salt` (`password_salt`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-04-05 08:54:39.000000', 'system', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.users_groups
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_groups_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.users_groups: ~0 rows (approximately)
DELETE FROM `users_groups`;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.user_sessions
DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE IF NOT EXISTS `user_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_sessions_user_id_application_id_client_id_b30bcb1c_uniq` (`user_id`,`application_id`,`client_id`),
  KEY `user_sessions_application_id_53667350_fk_applications_id` (`application_id`),
  KEY `user_sessions_client_id_593cbca3_fk_clients_id` (`client_id`),
  CONSTRAINT `user_sessions_application_id_53667350_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`),
  CONSTRAINT `user_sessions_client_id_593cbca3_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `user_sessions_user_id_43ce9642_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.user_sessions: ~0 rows (approximately)
DELETE FROM `user_sessions`;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
