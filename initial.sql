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
	(1, '2020-05-09 20:54:54.104679', 'superuser', '2020-05-09 20:55:20.330046', 'superuser', 'MOD-1', 'Applications', '', 'mdi-alert-circle-outline', NULL, NULL),
	(2, '2020-05-09 20:55:46.040617', 'superuser', '2020-05-09 20:57:09.389115', 'superuser', 'MOD-2', 'List', '', '', 1, 1),
	(3, '2020-05-09 20:56:04.282883', 'superuser', '2020-05-09 20:57:15.143684', 'superuser', 'MOD-3', 'Create', '', '', 1, 3),
	(4, '2020-05-09 21:00:03.835554', 'superuser', '2020-05-09 21:00:03.838528', 'superuser', 'MOD-4', 'Frontend Routes', '', 'mdi-alert-circle-outline', NULL, NULL),
	(5, '2020-05-09 21:00:26.628792', 'superuser', '2020-05-09 21:00:26.630791', 'superuser', 'MOD-5', 'List', '', '', 4, 6),
	(6, '2020-05-09 21:00:35.629820', 'superuser', '2020-05-09 21:00:35.630865', 'superuser', 'MOD-6', 'Create', '', '', 4, 8),
	(7, '2020-05-09 21:00:51.052073', 'superuser', '2020-05-09 21:00:51.054049', 'superuser', 'MOD-7', 'Backend Routes', '', 'mdi-alert-circle-outline', NULL, NULL),
	(8, '2020-05-09 21:01:31.237889', 'superuser', '2020-05-09 21:01:31.238934', 'superuser', 'MOD-8', 'List', '', '', 7, 11),
	(9, '2020-05-09 21:01:40.987956', 'superuser', '2020-05-09 21:01:40.988955', 'superuser', 'MOD-9', 'Create', '', '', 7, 13),
	(10, '2020-05-09 21:02:02.945763', 'superuser', '2020-05-09 21:02:02.946830', 'superuser', 'MOD-10', 'Permissions', '', 'mdi-alert-circle-outline', NULL, NULL),
	(11, '2020-05-09 21:02:17.135049', 'superuser', '2020-05-09 21:02:17.137023', 'superuser', 'MOD-11', 'List', '', '', 10, 16),
	(12, '2020-05-09 21:02:31.614010', 'superuser', '2020-05-09 21:02:31.615059', 'superuser', 'MOD-12', 'Create', '', '', 10, 18),
	(13, '2020-05-09 21:02:43.359088', 'superuser', '2020-05-09 21:02:43.361085', 'superuser', 'MOD-13', 'Modules', '', 'mdi-alert-circle-outline', NULL, NULL),
	(14, '2020-05-09 21:02:53.695939', 'superuser', '2020-05-09 21:02:53.696937', 'superuser', 'MOD-14', 'List', '', '', 13, 21),
	(15, '2020-05-09 21:03:01.886106', 'superuser', '2020-05-09 21:03:01.888100', 'superuser', 'MOD-15', 'Create', '', '', 13, 23),
	(16, '2020-05-09 21:03:21.490018', 'superuser', '2020-05-09 21:03:21.492033', 'superuser', 'MOD-16', 'Groups', '', 'mdi-alert-circle-outline', NULL, NULL),
	(17, '2020-05-09 21:03:30.232890', 'superuser', '2020-05-09 21:03:30.233887', 'superuser', 'MOD-17', 'List', '', '', 16, 26),
	(18, '2020-05-09 21:03:43.239589', 'superuser', '2020-05-09 21:03:43.241588', 'superuser', 'MOD-18', 'Create', '', '', 16, 28),
	(19, '2020-05-09 21:03:55.119301', 'superuser', '2020-05-09 21:03:55.120371', 'superuser', 'MOD-19', 'Users', '', 'mdi-alert-circle-outline', NULL, NULL),
	(20, '2020-05-09 21:04:09.911001', 'superuser', '2020-05-09 21:04:09.911998', 'superuser', 'MOD-20', 'List', '', '', 19, 31),
	(21, '2020-05-09 21:04:15.519071', 'superuser', '2020-05-09 21:04:15.520040', 'superuser', 'MOD-21', 'Create', '', '', 19, 33),
	(22, '2020-05-09 21:04:24.913512', 'superuser', '2020-05-09 21:04:24.915579', 'superuser', 'MOD-22', 'Clients', '', 'mdi-alert-circle-outline', NULL, NULL),
	(23, '2020-05-09 21:04:34.013458', 'superuser', '2020-05-09 21:04:34.014460', 'superuser', 'MOD-23', 'List', '', '', 22, 36),
	(24, '2020-05-09 21:04:41.352696', 'superuser', '2020-05-09 21:04:41.353674', 'superuser', 'MOD-24', 'Create', '', '', 22, 38);