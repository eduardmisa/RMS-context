-- Dumping data for table rms_context_db.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-07-12 01:01:34.661193', 'superuser', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table rms_context_db.services: ~0 rows (approximately)
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-07-12 00:31:39.000000', 'superuser', '2020-07-12 00:31:44.000000', 'superuser', 'SVC-1', 'CORE', NULL, 'http://localhost:8001');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

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


-- Dumping data for table rms_context_db.clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `service_id`) VALUES
	(1, '2020-07-11 12:10:53.000000', 'superuser', '2020-07-11 12:10:54.000000', 'superuser', 'CLI-1', 'CORE Service', NULL, 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2050-07-27', 1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;