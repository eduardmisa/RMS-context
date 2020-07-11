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
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `clid` (`clid`),
  UNIQUE KEY `clsc` (`clsc`),
  KEY `clients_service_id_61eae8d8_fk_services_id` (`service_id`),
  CONSTRAINT `clients_service_id_61eae8d8_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.clients: ~1 rows (approximately)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `service_id`) VALUES
	(1, '2020-07-11 12:10:53.000000', 'superuser', '2020-07-11 12:10:54.000000', 'superuser', 'CLI-1', 'CORE Service', NULL, 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2050-07-27', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.clients_services
DROP TABLE IF EXISTS `clients_services`;
CREATE TABLE IF NOT EXISTS `clients_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_services_client_id_service_id_92817d2d_uniq` (`client_id`,`service_id`),
  KEY `clients_services_service_id_aa02fb48_fk_services_id` (`service_id`),
  CONSTRAINT `clients_services_client_id_00d7449c_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `clients_services_service_id_aa02fb48_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.clients_services: ~0 rows (approximately)
DELETE FROM `clients_services`;
/*!40000 ALTER TABLE `clients_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_services` ENABLE KEYS */;

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
	(1, 'entities', '0001_initial', '2020-07-12 00:30:00.856548');
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
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `groups_name_service_id_b4ce4787_uniq` (`name`,`service_id`),
  KEY `groups_service_id_2628093f_fk_services_id` (`service_id`),
  CONSTRAINT `groups_service_id_2628093f_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.groups: ~0 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.groups_modules
DROP TABLE IF EXISTS `groups_modules`;
CREATE TABLE IF NOT EXISTS `groups_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_modules_group_id_module_id_267199cf_uniq` (`group_id`,`module_id`),
  KEY `groups_modules_module_id_870087ef_fk_modules_id` (`module_id`),
  CONSTRAINT `groups_modules_group_id_89421f9b_fk_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_modules_module_id_870087ef_fk_modules_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.groups_modules: ~0 rows (approximately)
DELETE FROM `groups_modules`;
/*!40000 ALTER TABLE `groups_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_modules` ENABLE KEYS */;

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
  `route_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `modules_name_parent_id_service_id_88f00cae_uniq` (`name`,`parent_id`,`service_id`),
  KEY `modules_parent_id_c1d497fb_fk_modules_id` (`parent_id`),
  KEY `modules_route_id_27aee103_fk_service_routes_id` (`route_id`),
  KEY `modules_service_id_33220c05_fk_services_id` (`service_id`),
  CONSTRAINT `modules_parent_id_c1d497fb_fk_modules_id` FOREIGN KEY (`parent_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `modules_route_id_27aee103_fk_service_routes_id` FOREIGN KEY (`route_id`) REFERENCES `service_routes` (`id`),
  CONSTRAINT `modules_service_id_33220c05_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.modules: ~1 rows (approximately)
DELETE FROM `modules`;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `icon`, `parent_id`, `route_id`, `service_id`) VALUES
	(1, '2020-07-12 00:40:57.981747', 'superuser', '2020-07-12 00:40:57.983287', 'superuser', 'MOD-1', 'Services', NULL, NULL, NULL, NULL, 1),
	(2, '2020-07-12 00:46:51.845728', 'superuser', '2020-07-12 00:46:51.847814', 'superuser', 'MOD-2', 'Service List', NULL, NULL, 1, 1, 1),
	(3, '2020-07-12 00:47:22.151514', 'superuser', '2020-07-12 00:47:22.153535', 'superuser', 'MOD-3', 'Service Create', NULL, NULL, 1, 23, 1),
	(4, '2020-07-12 00:48:15.905941', 'superuser', '2020-07-12 00:48:15.907430', 'superuser', 'MOD-4', 'Service Routes', NULL, NULL, NULL, NULL, 1),
	(5, '2020-07-12 00:48:30.696785', 'superuser', '2020-07-12 00:52:55.312935', 'superuser', 'MOD-5', 'Service Route List', NULL, NULL, 4, 1, 1),
	(6, '2020-07-12 00:48:41.623093', 'superuser', '2020-07-12 00:53:14.803947', 'superuser', 'MOD-6', 'Service Route Create', NULL, NULL, 4, 3, 1),
	(7, '2020-07-12 00:49:20.882865', 'superuser', '2020-07-12 00:49:20.884661', 'superuser', 'MOD-7', 'Permissions', NULL, NULL, NULL, NULL, 1),
	(8, '2020-07-12 00:49:28.857227', 'superuser', '2020-07-12 00:53:25.916826', 'superuser', 'MOD-8', 'Permission List', NULL, NULL, 7, 6, 1),
	(9, '2020-07-12 00:49:37.054114', 'superuser', '2020-07-12 00:53:35.482360', 'superuser', 'MOD-9', 'Permission Create', NULL, NULL, 7, 8, 1),
	(10, '2020-07-12 00:49:48.777394', 'superuser', '2020-07-12 00:49:48.779039', 'superuser', 'MOD-10', 'Modules', NULL, NULL, NULL, NULL, 1),
	(11, '2020-07-12 00:50:09.279580', 'superuser', '2020-07-12 00:53:44.742842', 'superuser', 'MOD-11', 'Module List', NULL, NULL, 10, 11, 1),
	(12, '2020-07-12 00:50:22.868597', 'superuser', '2020-07-12 00:53:52.318836', 'superuser', 'MOD-12', 'Module Create', NULL, NULL, 10, 13, 1),
	(13, '2020-07-12 00:50:32.756957', 'superuser', '2020-07-12 00:50:32.758022', 'superuser', 'MOD-13', 'Groups', NULL, NULL, NULL, NULL, 1),
	(14, '2020-07-12 00:50:41.071833', 'superuser', '2020-07-12 00:54:04.065214', 'superuser', 'MOD-14', 'Group List', NULL, NULL, 13, 16, 1),
	(15, '2020-07-12 00:50:49.769231', 'superuser', '2020-07-12 00:54:10.716140', 'superuser', 'MOD-15', 'Group Create', NULL, NULL, 13, 18, 1),
	(16, '2020-07-12 00:51:01.435280', 'superuser', '2020-07-12 00:51:01.437278', 'superuser', 'MOD-16', 'Users', NULL, NULL, NULL, NULL, 1),
	(17, '2020-07-12 00:51:09.495185', 'superuser', '2020-07-12 00:54:18.253522', 'superuser', 'MOD-17', 'User List', NULL, NULL, 16, 21, 1),
	(18, '2020-07-12 00:51:19.393260', 'superuser', '2020-07-12 00:54:26.287903', 'superuser', 'MOD-18', 'User Create', NULL, NULL, 16, 23, 1),
	(19, '2020-07-12 00:51:27.763802', 'superuser', '2020-07-12 00:51:27.765771', 'superuser', 'MOD-19', 'Clients', NULL, NULL, NULL, NULL, 1),
	(20, '2020-07-12 00:51:36.669526', 'superuser', '2020-07-12 00:54:33.929991', 'superuser', 'MOD-20', 'Client List', NULL, NULL, 19, 26, 1),
	(21, '2020-07-12 00:51:44.924806', 'superuser', '2020-07-12 00:54:38.810384', 'superuser', 'MOD-21', 'Client Create', NULL, NULL, 19, 28, 1);
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
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `permissions_service_id_03f6896e_fk_services_id` (`service_id`),
  CONSTRAINT `permissions_service_id_03f6896e_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.permissions_service_routes
DROP TABLE IF EXISTS `permissions_service_routes`;
CREATE TABLE IF NOT EXISTS `permissions_service_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `serviceroute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_service_rout_permission_id_servicerou_dc547adc_uniq` (`permission_id`,`serviceroute_id`),
  KEY `permissions_service__serviceroute_id_c9c8ea8c_fk_service_r` (`serviceroute_id`),
  CONSTRAINT `permissions_service__permission_id_a3a7d95e_fk_permissio` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permissions_service__serviceroute_id_c9c8ea8c_fk_service_r` FOREIGN KEY (`serviceroute_id`) REFERENCES `service_routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions_service_routes: ~0 rows (approximately)
DELETE FROM `permissions_service_routes`;
/*!40000 ALTER TABLE `permissions_service_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_service_routes` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
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

-- Dumping data for table rms_context_db.services: ~1 rows (approximately)
DELETE FROM `services`;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-07-12 00:31:39.000000', 'superuser', '2020-07-12 00:31:44.000000', 'superuser', 'SVC-1', 'CORE', NULL, 'http://localhost:8001');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.service_routes
DROP TABLE IF EXISTS `service_routes`;
CREATE TABLE IF NOT EXISTS `service_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `method` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `service_routes_service_id_method_url_62c42de3_uniq` (`service_id`,`method`,`url`),
  CONSTRAINT `service_routes_service_id_715a97f2_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.service_routes: ~30 rows (approximately)
DELETE FROM `service_routes`;
/*!40000 ALTER TABLE `service_routes` DISABLE KEYS */;
INSERT INTO `service_routes` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `service_id`) VALUES
	(1, '2020-07-12 00:34:02.271012', 'superuser', '2020-07-12 00:34:22.819621', 'superuser', 'SVR-1', 'ROUTE', '/service-routes', 1),
	(2, '2020-07-12 00:34:36.581274', 'superuser', '2020-07-12 00:34:36.582270', 'superuser', 'SVR-2', 'ROUTE', '/service-routes/:id', 1),
	(3, '2020-07-12 00:34:48.075898', 'superuser', '2020-07-12 00:34:48.078524', 'superuser', 'SVR-3', 'ROUTE', '/service-routes/create', 1),
	(4, '2020-07-12 00:35:02.424813', 'superuser', '2020-07-12 00:35:02.426667', 'superuser', 'SVR-4', 'ROUTE', '/service-routes/:id/update', 1),
	(5, '2020-07-12 00:35:13.830551', 'superuser', '2020-07-12 00:35:13.831570', 'superuser', 'SVR-5', 'ROUTE', '/service-routes/:id/delete', 1),
	(6, '2020-07-12 00:35:25.578352', 'superuser', '2020-07-12 00:35:25.580347', 'superuser', 'SVR-6', 'ROUTE', '/permissions', 1),
	(7, '2020-07-12 00:35:34.242692', 'superuser', '2020-07-12 00:35:34.244687', 'superuser', 'SVR-7', 'ROUTE', '/permissions/:id', 1),
	(8, '2020-07-12 00:35:43.753774', 'superuser', '2020-07-12 00:35:43.754771', 'superuser', 'SVR-8', 'ROUTE', '/permissions/create', 1),
	(9, '2020-07-12 00:35:51.735438', 'superuser', '2020-07-12 00:35:51.737652', 'superuser', 'SVR-9', 'ROUTE', '/permissions/:id/update', 1),
	(10, '2020-07-12 00:36:00.712944', 'superuser', '2020-07-12 00:36:00.713941', 'superuser', 'SVR-10', 'ROUTE', '/permissions/:id/delete', 1),
	(11, '2020-07-12 00:36:11.260946', 'superuser', '2020-07-12 00:36:11.263122', 'superuser', 'SVR-11', 'ROUTE', '/modules', 1),
	(12, '2020-07-12 00:36:19.017379', 'superuser', '2020-07-12 00:36:19.019351', 'superuser', 'SVR-12', 'ROUTE', '/modules/:id', 1),
	(13, '2020-07-12 00:36:27.640960', 'superuser', '2020-07-12 00:36:27.642701', 'superuser', 'SVR-13', 'ROUTE', '/modules/create', 1),
	(14, '2020-07-12 00:36:35.597004', 'superuser', '2020-07-12 00:36:35.598995', 'superuser', 'SVR-14', 'ROUTE', '/modules/:id/update', 1),
	(15, '2020-07-12 00:36:43.541360', 'superuser', '2020-07-12 00:36:43.543193', 'superuser', 'SVR-15', 'ROUTE', '/modules/:id/delete', 1),
	(16, '2020-07-12 00:36:50.925430', 'superuser', '2020-07-12 00:36:50.927465', 'superuser', 'SVR-16', 'ROUTE', '/groups', 1),
	(17, '2020-07-12 00:36:57.831436', 'superuser', '2020-07-12 00:36:57.833408', 'superuser', 'SVR-17', 'ROUTE', '/groups/:id', 1),
	(18, '2020-07-12 00:37:06.133279', 'superuser', '2020-07-12 00:37:06.134276', 'superuser', 'SVR-18', 'ROUTE', '/groups/create', 1),
	(19, '2020-07-12 00:37:13.739271', 'superuser', '2020-07-12 00:37:13.740889', 'superuser', 'SVR-19', 'ROUTE', '/groups/:id/update', 1),
	(20, '2020-07-12 00:37:22.023161', 'superuser', '2020-07-12 00:37:22.025063', 'superuser', 'SVR-20', 'ROUTE', '/groups/:id/delete', 1),
	(21, '2020-07-12 00:37:30.393167', 'superuser', '2020-07-12 00:37:30.394551', 'superuser', 'SVR-21', 'ROUTE', '/users', 1),
	(22, '2020-07-12 00:37:39.354440', 'superuser', '2020-07-12 00:37:39.356435', 'superuser', 'SVR-22', 'ROUTE', '/users/:id', 1),
	(23, '2020-07-12 00:37:46.839292', 'superuser', '2020-07-12 00:37:46.841287', 'superuser', 'SVR-23', 'ROUTE', '/users/create', 1),
	(24, '2020-07-12 00:37:55.192801', 'superuser', '2020-07-12 00:37:55.194291', 'superuser', 'SVR-24', 'ROUTE', '/users/:id/update', 1),
	(25, '2020-07-12 00:38:03.587737', 'superuser', '2020-07-12 00:38:03.589680', 'superuser', 'SVR-25', 'ROUTE', '/users/:id/delete', 1),
	(26, '2020-07-12 00:38:10.453405', 'superuser', '2020-07-12 00:38:10.455297', 'superuser', 'SVR-26', 'ROUTE', '/clients', 1),
	(27, '2020-07-12 00:38:19.483227', 'superuser', '2020-07-12 00:38:19.485054', 'superuser', 'SVR-27', 'ROUTE', '/clients/:id', 1),
	(28, '2020-07-12 00:38:26.599002', 'superuser', '2020-07-12 00:38:26.599996', 'superuser', 'SVR-28', 'ROUTE', '/clients/create', 1),
	(29, '2020-07-12 00:38:33.209837', 'superuser', '2020-07-12 00:38:33.211756', 'superuser', 'SVR-29', 'ROUTE', '/clients/:id/update', 1),
	(30, '2020-07-12 00:38:40.194881', 'superuser', '2020-07-12 00:38:40.195876', 'superuser', 'SVR-30', 'ROUTE', '/clients/:id/delete', 1);
/*!40000 ALTER TABLE `service_routes` ENABLE KEYS */;

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

-- Dumping data for table rms_context_db.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-07-12 00:07:08.526762', 'superuser', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
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
  `client_id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_sessions_user_id_service_id_client_id_83bf6609_uniq` (`user_id`,`service_id`,`client_id`),
  KEY `user_sessions_client_id_593cbca3_fk_clients_id` (`client_id`),
  KEY `user_sessions_service_id_4542cd05_fk_services_id` (`service_id`),
  CONSTRAINT `user_sessions_client_id_593cbca3_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `user_sessions_service_id_4542cd05_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `user_sessions_user_id_43ce9642_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.user_sessions: ~1 rows (approximately)
DELETE FROM `user_sessions`;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `token`, `expires`, `client_id`, `service_id`, `user_id`) VALUES
	(1, '2020-07-11 12:13:56.856851', '', '2020-07-12 00:54:39.592075', '', 'Of4xFN4igNaDiwrIEJt23MxGb2s6Jq4G', '2020-07-12 01:54:39.592075', 1, 1, 1);
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
