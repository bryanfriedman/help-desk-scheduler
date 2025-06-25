USE hds;

GRANT ALL PRIVILEGES ON hds.* TO 'helpdesk'@'%' WITH GRANT OPTION;

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(40) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `default_rules` enum('T','F') NOT NULL,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `schedule_name` (`schedule_name`)
);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(8) NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `nickname` varchar(4) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` date NOT NULL DEFAULT (CURRENT_DATE),
  `priority` int DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `passwd` char(32) NOT NULL,
  `active` enum('T','F') NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `priority` (`priority`)
);

INSERT INTO users (username, fullname, nickname, priority, email, passwd, active) VALUES ('admin', 'Administrator', NULL, NULL, 'admin@admin.com', MD5('password'), 'T');

DROP TABLE IF EXISTS `avail`;
CREATE TABLE `avail` (
  `avail_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `username` varchar(8) NOT NULL,
  `day_of_week` enum('M','T','W','R','F') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`avail_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `username` (`username`),
  CONSTRAINT `avail_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`),
  CONSTRAINT `avail_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

DROP TABLE IF EXISTS `default_rules`;
CREATE TABLE `default_rules` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_min` int NOT NULL,
  `total_max` int NOT NULL,
  `student` int NOT NULL,
  `lead` int NOT NULL,
  PRIMARY KEY (`rule_id`)
);

INSERT INTO `default_rules` VALUES 
(1,'08:00:00','17:00:00',2,4,3,1),
(2,'17:00:00','19:00:00',1,2,1,1);

DROP TABLE IF EXISTS `desired`;
CREATE TABLE `desired` (
  `schedule_id` int NOT NULL,
  `username` varchar(8) NOT NULL,
  `min_hours` int NOT NULL,
  `max_hours` int NOT NULL,
  PRIMARY KEY (`schedule_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `desired_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`),
  CONSTRAINT `desired_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `holiday_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `holiday_date` date NOT NULL,
  PRIMARY KEY (`holiday_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`)
);

DROP TABLE IF EXISTS `master`;
CREATE TABLE `master` (
  `day_of_week` enum('M','T','W','R','F') NOT NULL,
  `week_num` int NOT NULL,
  `schedule_id` int NOT NULL,
  `username` varchar(8) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`day_of_week`,`week_num`,`schedule_id`,`username`,`start_time`),
  KEY `schedule_id` (`schedule_id`),
  KEY `username` (`username`),
  CONSTRAINT `master_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`),
  CONSTRAINT `master_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

DROP TABLE IF EXISTS `prefer`;
CREATE TABLE `prefer` (
  `prefer_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `username` varchar(8) NOT NULL,
  `day_of_week` enum('M','T','W','R','F') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`prefer_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `username` (`username`),
  CONSTRAINT `prefer_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`),
  CONSTRAINT `prefer_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(8) NOT NULL,
  `role` enum('A','L','S') NOT NULL,
  PRIMARY KEY (`username`,`role`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
);

INSERT INTO `roles` VALUES ('admin','A');

DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `rule_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_min` int NOT NULL,
  `total_max` int NOT NULL,
  `student` int NOT NULL,
  `lead` int NOT NULL,
  PRIMARY KEY (`rule_id`),
  CONSTRAINT `rules_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`)
);