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

-- Dumping data for table rms_context_db.clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `service_id`) VALUES
	(1, '2020-07-11 12:10:53.000000', 'superuser', '2020-07-11 12:10:54.000000', 'superuser', 'CLI-1', 'CORE Service', NULL, 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2050-07-27', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.clients_services
DROP TABLE IF EXISTS `clients_services`;
CREATE TABLE IF NOT EXISTS `clients_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_services_client_id_service_id_92817d2d_uniq` (`client_id`,`service_id`),
  KEY `clients_services_service_id_aa02fb48_fk_services_id` (`service_id`),
  CONSTRAINT `clients_services_client_id_00d7449c_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `clients_services_service_id_aa02fb48_fk_services_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.clients_services: ~0 rows (approximately)
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
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'entities', '0001_initial', '2020-07-12 12:00:35.434280');
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
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.groups_permissions
DROP TABLE IF EXISTS `groups_permissions`;
CREATE TABLE IF NOT EXISTS `groups_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_permissions_group_id_permission_id_26124091_uniq` (`group_id`,`permission_id`),
  KEY `groups_permissions_permission_id_36f619fe_fk_permissions_id` (`permission_id`),
  CONSTRAINT `groups_permissions_group_id_a03c8909_fk_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `groups_permissions_permission_id_36f619fe_fk_permissions_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.groups_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `groups_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_permissions` ENABLE KEYS */;

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
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.permissions_service_routes
DROP TABLE IF EXISTS `permissions_service_routes`;
CREATE TABLE IF NOT EXISTS `permissions_service_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `service_route_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_service_rout_permission_id_servicerou_dc547adc_uniq` (`permission_id`,`service_route_id`),
  KEY `permissions_service__service_route_id_c9c8ea8c_fk_service_r` (`service_route_id`),
  CONSTRAINT `permissions_service__permission_id_a3a7d95e_fk_permissio` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permissions_service__service_route_id_c9c8ea8c_fk_service_r` FOREIGN KEY (`service_route_id`) REFERENCES `service_routes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.permissions_service_routes: ~0 rows (approximately)
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

-- Dumping data for table rms_context_db.services: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.service_routes: ~52 rows (approximately)
/*!40000 ALTER TABLE `service_routes` DISABLE KEYS */;
INSERT INTO `service_routes` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `service_id`) VALUES
	(1, '2020-07-12 00:34:02.271012', 'superuser', '2020-07-12 00:34:22.819621', 'superuser', 'SVR-1', 'ROUTE', '/services', 1),
	(2, '2020-07-12 00:34:36.581274', 'superuser', '2020-07-12 00:34:36.582270', 'superuser', 'SVR-2', 'ROUTE', '/services/:id', 1),
	(3, '2020-07-12 00:34:48.075898', 'superuser', '2020-07-12 00:34:48.078524', 'superuser', 'SVR-3', 'ROUTE', '/services/create', 1),
	(4, '2020-07-12 00:35:02.424813', 'superuser', '2020-07-12 00:35:02.426667', 'superuser', 'SVR-4', 'ROUTE', '/services/:id/update', 1),
	(5, '2020-07-12 00:35:13.830551', 'superuser', '2020-07-12 00:35:13.831570', 'superuser', 'SVR-5', 'ROUTE', '/services/:id/delete', 1),
	(6, '2020-07-12 00:34:02.271012', 'superuser', '2020-07-12 00:34:22.819621', 'superuser', 'SVR-6', 'ROUTE', '/service-routes', 1),
	(7, '2020-07-12 00:34:36.581274', 'superuser', '2020-07-12 00:34:36.582270', 'superuser', 'SVR-7', 'ROUTE', '/service-routes/:id', 1),
	(8, '2020-07-12 00:34:48.075898', 'superuser', '2020-07-12 00:34:48.078524', 'superuser', 'SVR-8', 'ROUTE', '/service-routes/create', 1),
	(9, '2020-07-12 00:35:02.424813', 'superuser', '2020-07-12 00:35:02.426667', 'superuser', 'SVR-9', 'ROUTE', '/service-routes/:id/update', 1),
	(10, '2020-07-12 00:35:13.830551', 'superuser', '2020-07-12 00:35:13.831570', 'superuser', 'SVR-10', 'ROUTE', '/service-routes/:id/delete', 1),
	(11, '2020-07-12 00:35:25.578352', 'superuser', '2020-07-12 00:35:25.580347', 'superuser', 'SVR-11', 'ROUTE', '/permissions', 1),
	(12, '2020-07-12 00:35:34.242692', 'superuser', '2020-07-12 00:35:34.244687', 'superuser', 'SVR-12', 'ROUTE', '/permissions/:id', 1),
	(13, '2020-07-12 00:35:43.753774', 'superuser', '2020-07-12 00:35:43.754771', 'superuser', 'SVR-13', 'ROUTE', '/permissions/create', 1),
	(14, '2020-07-12 00:35:51.735438', 'superuser', '2020-07-12 00:35:51.737652', 'superuser', 'SVR-14', 'ROUTE', '/permissions/:id/update', 1),
	(15, '2020-07-12 00:36:00.712944', 'superuser', '2020-07-12 00:36:00.713941', 'superuser', 'SVR-15', 'ROUTE', '/permissions/:id/delete', 1),
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
	(30, '2020-07-12 00:38:40.194881', 'superuser', '2020-07-12 00:38:40.195876', 'superuser', 'SVR-30', 'ROUTE', '/clients/:id/delete', 1),
	(31, '2020-07-12 07:44:55.888717', 'superuser', '2020-07-12 07:44:55.890560', 'superuser', 'SVR-31', 'GET', '/api/v1/management/services/', 1),
	(32, '2020-07-12 07:45:26.084349', 'superuser', '2020-07-12 07:45:26.086248', 'superuser', 'SVR-32', 'GET', '/api/v1/management/services/SVC-[0-9]+/', 1),
	(33, '2020-07-12 07:45:35.086108', 'superuser', '2020-07-12 07:45:35.088183', 'superuser', 'SVR-33', 'POST', '/api/v1/management/services/', 1),
	(34, '2020-07-12 07:45:42.063352', 'superuser', '2020-07-12 07:45:42.065243', 'superuser', 'SVR-34', 'PUT', '/api/v1/management/services/SVC-[0-9]+/', 1),
	(35, '2020-07-12 07:45:48.521809', 'superuser', '2020-07-12 07:45:48.523808', 'superuser', 'SVR-35', 'DELETE', '/api/v1/management/services/SVC-[0-9]+/', 1),
	(36, '2020-07-12 07:46:24.545871', 'superuser', '2020-07-12 07:46:24.547777', 'superuser', 'SVR-36', 'GET', '/api/v1/management/service-routes/', 1),
	(37, '2020-07-12 07:46:33.528562', 'superuser', '2020-07-12 07:46:33.528562', 'superuser', 'SVR-37', 'GET', '/api/v1/management/service-routes/SVR-[0-9]+/', 1),
	(38, '2020-07-12 07:46:43.913632', 'superuser', '2020-07-12 07:46:43.915609', 'superuser', 'SVR-38', 'POST', '/api/v1/management/service-routes/', 1),
	(39, '2020-07-12 07:46:51.632122', 'superuser', '2020-07-12 07:46:51.633108', 'superuser', 'SVR-39', 'PUT', '/api/v1/management/service-routes/SVR-[0-9]+/', 1),
	(40, '2020-07-12 07:46:59.491332', 'superuser', '2020-07-12 07:46:59.493236', 'superuser', 'SVR-40', 'DELETE', '/api/v1/management/service-routes/SVR-[0-9]+/', 1),
	(41, '2020-07-12 07:47:24.947043', 'superuser', '2020-07-12 07:47:24.949062', 'superuser', 'SVR-41', 'GET', '/api/v1/management/permissions/', 1),
	(42, '2020-07-12 07:47:30.394433', 'superuser', '2020-07-12 07:47:30.396718', 'superuser', 'SVR-42', 'GET', '/api/v1/management/permissions/PRM-[0-9]+/', 1),
	(43, '2020-07-12 07:47:37.963016', 'superuser', '2020-07-12 07:47:37.965144', 'superuser', 'SVR-43', 'POST', '/api/v1/management/permissions/', 1),
	(44, '2020-07-12 07:47:43.737448', 'superuser', '2020-07-12 07:47:43.739486', 'superuser', 'SVR-44', 'PUT', '/api/v1/management/permissions/PRM-[0-9]+/', 1),
	(45, '2020-07-12 07:47:48.925477', 'superuser', '2020-07-12 07:47:48.927430', 'superuser', 'SVR-45', 'DELETE', '/api/v1/management/permissions/PRM-[0-9]+/', 1),
	(46, '2020-07-12 07:48:56.873051', 'superuser', '2020-07-12 07:48:56.875021', 'superuser', 'SVR-46', 'GET', '/api/v1/management/groups/', 1),
	(47, '2020-07-12 07:49:02.251189', 'superuser', '2020-07-12 07:49:02.253182', 'superuser', 'SVR-47', 'GET', '/api/v1/management/groups/GRP-[0-9]+/', 1),
	(48, '2020-07-12 07:49:10.621887', 'superuser', '2020-07-12 07:49:10.623858', 'superuser', 'SVR-48', 'POST', '/api/v1/management/groups/', 1),
	(49, '2020-07-12 07:49:16.712439', 'superuser', '2020-07-12 07:49:16.714359', 'superuser', 'SVR-49', 'PUT', '/api/v1/management/groups/GRP-[0-9]+/', 1),
	(50, '2020-07-12 07:49:23.385641', 'superuser', '2020-07-12 07:49:23.387535', 'superuser', 'SVR-50', 'DELETE', '/api/v1/management/groups/GRP-[0-9]+/', 1),
	(51, '2020-07-12 07:49:47.484658', 'superuser', '2020-07-12 07:49:47.486305', 'superuser', 'SVR-51', 'GET', '/api/v1/management/users/', 1),
	(52, '2020-07-12 07:49:53.104357', 'superuser', '2020-07-12 07:49:53.106326', 'superuser', 'SVR-52', 'GET', '/api/v1/management/users/USR-[0-9]+/', 1),
	(53, '2020-07-12 07:50:01.950118', 'superuser', '2020-07-12 07:50:01.952087', 'superuser', 'SVR-53', 'POST', '/api/v1/management/users/', 1),
	(54, '2020-07-12 07:50:07.804654', 'superuser', '2020-07-12 07:50:07.806649', 'superuser', 'SVR-54', 'PUT', '/api/v1/management/users/USR-[0-9]+/', 1),
	(55, '2020-07-12 07:50:15.923855', 'superuser', '2020-07-12 07:50:15.926125', 'superuser', 'SVR-55', 'DELETE', '/api/v1/management/users/USR-[0-9]+/', 1),
	(56, '2020-07-12 07:50:36.255211', 'superuser', '2020-07-12 07:50:36.257207', 'superuser', 'SVR-56', 'GET', '/api/v1/management/clients/', 1),
	(57, '2020-07-12 07:50:53.383538', 'superuser', '2020-07-12 07:50:53.383538', 'superuser', 'SVR-57', 'GET', '/api/v1/management/clients/CLI-[0-9]+/', 1),
	(58, '2020-07-12 07:51:03.223409', 'superuser', '2020-07-12 07:51:03.225325', 'superuser', 'SVR-58', 'POST', '/api/v1/management/clients/', 1),
	(59, '2020-07-12 07:51:08.978264', 'superuser', '2020-07-12 07:51:08.980004', 'superuser', 'SVR-59', 'PUT', '/api/v1/management/clients/CLI-[0-9]+/', 1),
	(60, '2020-07-12 07:51:15.265706', 'superuser', '2020-07-12 07:51:15.267653', 'superuser', 'SVR-60', 'DELETE', '/api/v1/management/clients/CLI-[0-9]+/', 1);
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

-- Dumping data for table rms_context_db.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-07-12 01:01:34.661193', 'superuser', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table rms_context_db.users_groups
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `createdby` varchar(255) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `modifiedby` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_groups_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.users_groups: ~0 rows (approximately)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rms_context_db.user_sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
