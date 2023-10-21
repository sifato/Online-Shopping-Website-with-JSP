DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL auto_increment,
  `username` varchar(50) NOT NULL unique,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ;