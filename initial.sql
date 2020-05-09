-- Dumping data for table apidb.applications: ~1 rows (approximately)
DELETE FROM `applications`;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-04-10 16:25:25.736404', 'superuser', '2020-04-10 16:25:25.738404', 'superuser', 'APP-1', 'Resource Management System', '', 'http://localhost:8001');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;


-- Dumping data for table apidb.clients: ~1 rows (approximately)
DELETE FROM `clients`;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `application_id`) VALUES
	(1, '2020-04-10 16:38:30.131336', 'superuser', '2020-04-10 16:38:30.133334', 'superuser', 'CLI-1', 'RMS API', '', 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2025-04-10', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;


-- Dumping data for table apidb.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-04-05 08:54:39.000000', 'system', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
