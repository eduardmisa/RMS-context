DELETE FROM `users`;
INSERT INTO `users` (`id`, `created`, `createdby`, `modified`, `modifiedby`, `code`, `username`, `password`, `password_salt`, `email`, `firstname`, `middlename`, `lastname`, `birthdate`, `is_active`,`is_superuser`) VALUES
	(1, '2020-04-05 08:54:35.000000', 'system', '2020-04-05 08:54:39.000000', 'system', 'USR-1', 'mainadmin', '$2y$12$y8wYqI.08nV1/FEP5MXAB.2fki2wcjin8ORBHS27XznyAQ6QvVu4q', 'NONE', 'eduardo@tirsolutions.com', 'Eduard', 'Arriba', 'Misa', '1995-07-27', 1, 1);
