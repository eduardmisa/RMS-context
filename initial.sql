-- Dumping data for table apidb.applications: ~1 rows (approximately)
DELETE FROM `applications`;
INSERT INTO `applications` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `base_url`) VALUES
	(1, '2020-04-10 16:25:25.736404', 'superuser', '2020-04-10 16:25:25.738404', 'superuser', 'APP-1', 'Resource Management System', '', 'http://localhost:8001');

DELETE FROM `clients`;
INSERT INTO `clients` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `name`, `description`, `clid`, `clsc`, `valid_until`, `application_id`) VALUES
	(1, '2020-04-10 16:38:30.131336', 'superuser', '2020-04-10 16:38:30.133334', 'superuser', 'CLI-1', 'RMS API', '', 'nHIAtBPnc2BqkKstUU1Y7SaeXzX079i6', 'UFDbl6o7FTMEJqMSVZBNqbCtV6ij3ymm', '2025-04-10', 1);

DELETE FROM `users`;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`, `is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-04-05 08:54:39.000000', 'system', 'USR-1', 'superuser', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);


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
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-16', '/clients', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-17', '/clients/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-18', '/clients/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-19', '/clients/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-20', '/clients/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-21', '/groups', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-22', '/groups/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-23', '/groups/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-24', '/groups/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-25', '/groups/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-26', '/modules', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-27', '/modules/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-28', '/modules/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-29', '/modules/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-30', '/modules/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-31', '/permissions', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-32', '/permissions/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-33', '/permissions/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-34', '/permissions/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-35', '/permissions/:id/delete', 1);

INSERT INTO `routes_front` (`created`, `createdby`, `modified`, `modifiedby`, `code`, `url`, `application_id`) VALUES
	('2020-05-09 15:10:18.306321', 'superuser', '2020-05-09 15:10:18.307319', 'superuser', 'RTF-36', '/users', 1),
	('2020-05-09 15:10:26.615623', 'superuser', '2020-05-09 15:10:26.617621', 'superuser', 'RTF-37', '/users/:id', 1),
	('2020-05-09 15:10:40.323763', 'superuser', '2020-05-09 15:10:40.325763', 'superuser', 'RTF-38', '/users/create', 1),
	('2020-05-09 15:11:17.525080', 'superuser', '2020-05-09 15:11:17.527080', 'superuser', 'RTF-39', '/users/:id/update', 1),
	('2020-05-09 15:11:20.461599', 'superuser', '2020-05-09 15:11:20.462666', 'superuser', 'RTF-40', '/users/:id/delete', 1);