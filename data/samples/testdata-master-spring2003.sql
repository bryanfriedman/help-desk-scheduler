USE hds;

-- Spring 2003 covers the last two weeks of Spring quarter (5/25 - 6/6)
INSERT INTO schedules (schedule_id, schedule_name,
                       start_date, end_date, default_rules)
               VALUES (NULL, 'Spring 2003', '2003-05-25', '2003-06-06', 'T');

SELECT @SID := LAST_INSERT_ID();

-- Insert Students

INSERT INTO users VALUES ('jcowgill', 'Joel Cowgill', 'Joel', NULL, NULL, 
                          now(), 2, 'jcowgill@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('jcowgill', 'L');

INSERT INTO users VALUES ('bgladwel', 'Brett Gladwell', 'Bret', NULL, NULL, 
                          now(), 3, 'bgladwel@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('bgladwel', 'L');

INSERT INTO users VALUES ('jmcknigh', 'Jeff McKnight', 'Jeff', NULL, NULL, 
                          now(), 4, 'jmcknigh@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('jmcknigh', 'L');

INSERT INTO users VALUES ('sweston', 'Steve Weston', 'Stev', NULL, NULL, 
                          now(), 5, 'sweston@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('sweston', 'L');

INSERT INTO users VALUES ('ahipp', 'Adam Hipp', 'Adam', NULL, NULL, 
                          now(), 6, 'ahipp@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('ahipp', 'S');

INSERT INTO users VALUES ('kboutter', 'Kieshawna Boutte-Reese', 'Kies', NULL, NULL, 
                          now(), 7, 'kboutter@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('kboutter', 'S');

INSERT INTO users VALUES ('bcheung', 'Brandon Cheung', 'Bran', NULL, NULL, 
                          now(), 8, 'bcheung@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('bcheung', 'S');

INSERT INTO users VALUES ('bbenson', 'Bridget Benson', 'Brid', NULL, NULL, 
                          now(), 9, 'bbenson@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('bbenson', 'S');

INSERT INTO users VALUES ('dpersek', 'Dustin Persek', 'Dust', NULL, NULL, 
                          now(), 10, 'dpersek@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('dpersek', 'S');

INSERT INTO users VALUES ('amcohen', 'Mandy Cohen', 'Mand', NULL, NULL, 
                          now(), 11, 'amcohen@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('amcohen', 'S');

INSERT INTO users VALUES ('atongtry', 'Annie Tong Try', 'Anni', NULL, NULL, 
                          now(), 12, 'atongtry@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('atongtry', 'S');

INSERT INTO users VALUES ('dhannig', 'Daniel Hannig', 'Dan', NULL, NULL, 
                          now(), 13, 'dhannig@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('dhannig', 'S');

INSERT INTO users VALUES ('mguggemo', 'Matt Guggemos', 'Matt', NULL, NULL, 
                          now(), 14, 'mguggemo@example.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('mguggemo', 'S');

INSERT INTO users VALUES ('kng', 'Kim Ng', 'Kim', NULL, NULL, 
                          now(), 15, 'kng@example.com', 
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('kng', 'S');

-- Insert Master Schedule Entries

-- Monday
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bbenson', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bcheung', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bgladwel', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'dhannig', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'jmcknigh', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bbenson', '12:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bcheung', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'sweston', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'bfriedma', '15:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'jmcknigh', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'kboutter', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bbenson', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bcheung', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bgladwel', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'dhannig', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'jmcknigh', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bbenson', '12:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bcheung', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'sweston', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'bfriedma', '15:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'jmcknigh', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'kboutter', '17:00', '19:00');


-- Tuesday
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'sweston', '8:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'bgladwel', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'jcowgill', '9:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'mguggemo', '10:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'dhannig', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'atongtry', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'kng', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'bgladwel', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'kboutter', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'bbenson', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'bcheung', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'kboutter', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'sweston', '8:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'bgladwel', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'jcowgill', '9:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'mguggemo', '10:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'dhannig', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'atongtry', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'kng', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'bgladwel', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'kboutter', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'bbenson', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'bcheung', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'kboutter', '17:00', '19:00');


-- Wednesday
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'amcohen', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'jmcknigh', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'atongtry', '8:00', '9:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'bgladwel', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'ahipp', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'jmcknigh', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'dhannig', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'ahipp', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'amcohen', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'jmcknigh', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'kboutter', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'amcohen', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'jmcknigh', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'atongtry', '8:00', '9:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'bgladwel', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'ahipp', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'jmcknigh', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'dhannig', '11:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'ahipp', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'amcohen', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'jmcknigh', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'kboutter', '17:00', '19:00');


-- Thursday
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'bgladwel', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'sweston', '8:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'jcowgill', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'kng', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'bgladwel', '11:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'atongtry', '9:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'kboutter', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'ahipp', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'atongtry', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'dhannig', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'bbenson', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'bgladwel', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'sweston', '8:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'jcowgill', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'kng', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'bgladwel', '11:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'atongtry', '9:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'kboutter', '13:00', '15:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'ahipp', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'atongtry', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'dhannig', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'bbenson', '17:00', '19:00');


-- Friday
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'jcowgill', '8:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'bcheung', '8:00', '11:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'amcohen', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'kboutter', '11:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'bbenson', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'bcheung', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'amcohen', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'kboutter', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'jcowgill', '8:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'bcheung', '8:00', '11:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'amcohen', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'bfriedma', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'dpersek', '10:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'kboutter', '11:00', '13:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'bbenson', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'bcheung', '14:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'amcohen', '15:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'atongtry', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'kboutter', '17:00', '19:00');

