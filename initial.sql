# applications
# .......
INSERT INTO `applications` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-04-10 16:25:25.736404', 'superuser', '2020-04-10 16:25:25.738404', 'superuser', 'APP-1', 'Resource Management System', '', 'http://localhost:8001');

# clients
# .......
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `application_id`) VALUES
	(1, '2020-04-10 16:38:30.131336', 'superuser', '2020-04-10 16:38:30.133334', 'superuser', 'CLI-1', 'RMS API', '', 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2025-04-10', 1);

# users
# .......
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-04-05 08:54:39.000000', 'system', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);

# routes_front
# .......
INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-1', '/applications', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-2', '/applications/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-3', '/applications/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-4', '/applications/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-5', '/applications/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-6', '/frontend-routes', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-7', '/frontend-routes/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-8', '/frontend-routes/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-9', '/frontend-routes/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-10', '/frontend-routes/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-11', '/backend-routes', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-12', '/backend-routes/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-13', '/backend-routes/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-14', '/backend-routes/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-15', '/backend-routes/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-31', '/permissions', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-32', '/permissions/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-33', '/permissions/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-34', '/permissions/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-35', '/permissions/:id/delete', 1);
	
INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-26', '/modules', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-27', '/modules/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-28', '/modules/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-29', '/modules/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-30', '/modules/:id/delete', 1);
	
INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-21', '/groups', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-22', '/groups/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-23', '/groups/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-24', '/groups/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-25', '/groups/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-36', '/users', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-37', '/users/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-38', '/users/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-39', '/users/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-40', '/users/:id/delete', 1);
	
INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-16', '/clients', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-17', '/clients/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-18', '/clients/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-19', '/clients/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-20', '/clients/:id/delete', 1);
	
# routes_back
# .......
INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-1', 'GET', '/api/v1/management/applications/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-2', 'GET', '/api/v1/management/applications/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-3', 'POST', '/api/v1/management/applications/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-4', 'PUT', '/api/v1/management/applications/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-5', 'DELETE', '/api/v1/management/applications/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-6', 'GET', '/api/v1/management/routes-front/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-7', 'GET', '/api/v1/management/routes-front/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-8', 'POST', '/api/v1/management/routes-front/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-9', 'PUT', '/api/v1/management/routes-front/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-10', 'DELETE', '/api/v1/management/routes-front/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-11', 'GET', '/api/v1/management/routes-back/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-12', 'GET', '/api/v1/management/routes-back/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-13', 'POST', '/api/v1/management/routes-back/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-14', 'PUT', '/api/v1/management/routes-back/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-15', 'DELETE', '/api/v1/management/routes-back/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-16', 'GET', '/api/v1/management/permissions/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-17', 'GET', '/api/v1/management/permissions/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-18', 'POST', '/api/v1/management/permissions/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-19', 'PUT', '/api/v1/management/permissions/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-20', 'DELETE', '/api/v1/management/permissions/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-21', 'GET', '/api/v1/management/modules/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-22', 'GET', '/api/v1/management/modules/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-23', 'POST', '/api/v1/management/modules/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-24', 'PUT', '/api/v1/management/modules/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-25', 'DELETE', '/api/v1/management/modules/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-26', 'GET', '/api/v1/management/groups/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-27', 'GET', '/api/v1/management/groups/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-28', 'POST', '/api/v1/management/groups/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-29', 'PUT', '/api/v1/management/groups/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-30', 'DELETE', '/api/v1/management/groups/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-31', 'GET', '/api/v1/management/users/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-32', 'GET', '/api/v1/management/users/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-33', 'POST', '/api/v1/management/users/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-34', 'PUT', '/api/v1/management/users/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-35', 'DELETE', '/api/v1/management/users/[0-9]+/', 1);

INSERT INTO `routes_back` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `method`, `url`, `application_id`) VALUES
	('2020-05-09 20:36:49.616760', 'superuser', '2020-05-09 20:36:49.617820', 'superuser', 'RTB-36', 'GET', '/api/v1/management/clients/', 1),
	('2020-05-09 20:36:53.217305', 'superuser', '2020-05-09 20:36:53.218301', 'superuser', 'RTB-37', 'GET', '/api/v1/management/clients/[0-9]+/', 1),
	('2020-05-09 20:37:00.556386', 'superuser', '2020-05-09 20:37:00.558386', 'superuser', 'RTB-38', 'POST', '/api/v1/management/clients/', 1),
	('2020-05-09 20:37:06.088547', 'superuser', '2020-05-09 20:37:06.089550', 'superuser', 'RTB-39', 'PUT', '/api/v1/management/clients/[0-9]+/', 1),
	('2020-05-09 20:37:09.457264', 'superuser', '2020-05-09 20:37:09.458263', 'superuser', 'RTB-40', 'DELETE', '/api/v1/management/clients/[0-9]+/', 1);

# modules
# .......
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

# permissions
# .......
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