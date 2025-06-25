###########################
# Help Desk Scheduler v0.1
# Database Creation
# mySQL Script
# Bryan Friedman
# 5/5/2003
###########################

# Create Database
DROP DATABASE hds;
CREATE DATABASE hds;
USE hds;

GRANT all privileges ON hds.* TO 'helpdesk'@'%' WITH GRANT OPTION;

# Drop Tables
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS rules;
DROP TABLE IF EXISTS schedules;
DROP TABLE IF EXISTS holidays;
DROP TABLE IF EXISTS avail;
DROP TABLE IF EXISTS prefer;
DROP TABLE IF EXISTS desired;
DROP TABLE IF EXISTS cover;
DROP TABLE IF EXISTS master;

# Create Tables
CREATE TABLE users (
   username    VARCHAR(8)  NOT NULL,
   fullname    VARCHAR(40) NOT NULL,
   nickname    VARCHAR(4),
   modified    TIMESTAMP   NOT NULL,
   created     TIMESTAMP   NOT NULL,
   start_date  DATE        NOT NULL,
   priority    INT         UNIQUE,
   email       VARCHAR(40) NOT NULL UNIQUE,
   passwd      CHAR(32)    NOT NULL, # must be 6-8 chars, 16-bit encryption
   active      ENUM('T','F') NOT NULL,
   PRIMARY KEY (username)
);

CREATE TABLE roles (
   username    VARCHAR(8)  NOT NULL,
   role        ENUM('A','L','S') NOT NULL,
   PRIMARY KEY (username, role),
   FOREIGN KEY (username) REFERENCES users(username)
);

# This isnt working for some reason:
# SET GLOBAL explicit_defaults_for_timestamp = OFF;

# Database Users
INSERT INTO users VALUES ('admin', 'Administrator', NULL, now(), now(),
                          now(), NULL, 'admin@admin.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('admin', 'A');

CREATE TABLE schedules (
   schedule_id    INT         NOT NULL AUTO_INCREMENT,
   schedule_name  VARCHAR(40) NOT NULL UNIQUE,
   start_date     DATE        NOT NULL,
   end_date       DATE        NOT NULL,
   default_rules  ENUM('T','F') NOT NULL,
   PRIMARY KEY (schedule_id)
);

CREATE TABLE rules (
   rule_id     INT         NOT NULL AUTO_INCREMENT,
   schedule_id INT         NOT NULL,
   start_time  TIME        NOT NULL,
   end_time    TIME        NOT NULL,
   total_min   INT         NOT NULL,
   total_max   INT         NOT NULL,
   student     INT         NOT NULL, # student to
   lead        INT         NOT NULL, # lead ratio
   PRIMARY KEY (rule_id),
   FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)
);

CREATE TABLE default_rules (
   rule_id     INT         NOT NULL AUTO_INCREMENT,
   start_time  TIME        NOT NULL,
   end_time    TIME        NOT NULL,
   total_min   INT         NOT NULL,
   total_max   INT         NOT NULL,
   student     INT         NOT NULL, # student to
   lead        INT         NOT NULL, # lead ratio
   PRIMARY KEY (rule_id)
);

# The Default Rules (for now)

INSERT INTO default_rules 
   VALUES (NULL, '08:00', '17:00', 2, 4, 3, 1);

INSERT INTO default_rules 
   VALUES (NULL, '17:00', '19:00', 1, 2, 1, 1);

CREATE TABLE holidays (
   holiday_id     INT         NOT NULL AUTO_INCREMENT,
   schedule_id    INT         NOT NULL,
   holiday_date   DATE        NOT NULL,
   PRIMARY KEY (holiday_id),
   FOREIGN KEY (schedule_id) REFERENCES schedules
);

-- Times when user is NOT available
CREATE TABLE avail (
   avail_id       INT         NOT NULL AUTO_INCREMENT,
   schedule_id    INT         NOT NULL,
   username       VARCHAR(8)  NOT NULL,
   day_of_week    ENUM('M','T','W','R','F') NOT NULL,
   start_time     TIME        NOT NULL,
   end_time       TIME        NOT NULL,
   name           VARCHAR(20),   -- Class Name
   PRIMARY KEY (avail_id),
   FOREIGN KEY (schedule_id) REFERENCES schedules,
   FOREIGN KEY (username) REFERENCES users
);

CREATE TABLE prefer (
   prefer_id      INT         NOT NULL AUTO_INCREMENT,
   schedule_id    INT         NOT NULL,
   username       VARCHAR(8)  NOT NULL,
   day_of_week    ENUM('M','T','W','R','F') NOT NULL,
   start_time     TIME        NOT NULL,
   end_time       TIME        NOT NULL,
   PRIMARY KEY (prefer_id),
   FOREIGN KEY (schedule_id) REFERENCES schedules,
   FOREIGN KEY (username) REFERENCES users
);

CREATE TABLE desired (
   schedule_id    INT         NOT NULL,
   username       VARCHAR(8)  NOT NULL,
   min_hours      INT         NOT NULL,
   max_hours      INT         NOT NULL,
   PRIMARY KEY (schedule_id, username),
   FOREIGN KEY (schedule_id) REFERENCES schedules,
   FOREIGN KEY (username) REFERENCES users
);

CREATE TABLE master (
   day_of_week    ENUM('M','T','W','R','F') NOT NULL,
   week_num       INT         NOT NULL,
   schedule_id    INT         NOT NULL,
   username       VARCHAR(8)  NOT NULL,
   start_time     TIME        NOT NULL,
   end_time       TIME        NOT NULL,
   PRIMARY KEY (day_of_week, week_num, schedule_id, username, start_time),
   FOREIGN KEY (schedule_id) REFERENCES schedules,
   FOREIGN KEY (username) REFERENCES users
);