-- Clear tables
DELETE FROM schedules WHERE schedule_name = 'Test Schedule';
DELETE FROM users;
DELETE FROM roles;
DELETE FROM master;

-- Re-Insert Administrator
INSERT INTO users VALUES ('admin', 'Administrator', NULL, NULL, 
                          now(), NULL, 'admin@admin.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('admin', 'A');

-- Insert Test User 1
INSERT INTO users VALUES ('test1', 'Test User 1', NULL, NULL, 
                          now(), 1, 'test1@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test1', 'S');

-- Insert Test User 2
INSERT INTO users VALUES ('test2', 'Test User 2', NULL, NULL, 
                          now(), 2, 'test2@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test2', 'S');

-- Insert Test User 3
INSERT INTO users VALUES ('test3', 'Test User 3', NULL, NULL, 
                          now(), 3, 'test3@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test3', 'S');

-- Insert Test User 4
INSERT INTO users VALUES ('test4', 'Test User 4', NULL, NULL, 
                          now(), 4, 'test4@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test4', 'S');

-- Insert Test User 5
INSERT INTO users VALUES ('test5', 'Test User 5', NULL, NULL, 
                          now(), 5, 'test5@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test5', 'S');

-- Insert Test User 6
INSERT INTO users VALUES ('test6', 'Test User 6', NULL, NULL, 
                          now(), 6, 'test6@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test6', 'S');

-- Insert Test User 7
INSERT INTO users VALUES ('test7', 'Test User 7', NULL, NULL, 
                          now(), 7, 'test7@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test7', 'S');

-- Insert Test User 8
INSERT INTO users VALUES ('test8', 'Test User 8', NULL, NULL, 
                          now(), 8, 'test8@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test8', 'S');

-- Insert Test User 9
INSERT INTO users VALUES ('test9', 'Test User 9', NULL, NULL, 
                          now(), 9, 'test9@test.com',
                          MD5('password'), 'T');
INSERT INTO roles VALUES ('test9', 'S');


-- Test Schedule covers the month of June (6/2 - 6/27)
INSERT INTO schedules (schedule_id, schedule_name,
                       start_date, end_date, default_rules)
               VALUES (NULL, 'Test Schedule', '2003-06-02', '2003-06-27', 'T');

SELECT @SID := LAST_INSERT_ID();

-- Insert Master Schedule Entries

# Test User 1, MWF 9-2, TR 10-2
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 3, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 4, @SID, 'test1', '9:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test1', '10:00', '14:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test1', '10:00', '14:00');


# Test User 2, MWF 8-5
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 3, @SID, 'test2', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 4, @SID, 'test2', '8:00', '17:00');


# Test User 3, TR 8-12
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test3', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test3', '8:00', '12:00');


# Test User 4, TR 8-5
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test4', '8:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test4', '8:00', '17:00');


# Test User 5, MW 8-12, MWF 5-7
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test5', '8:00', '12:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 3, @SID, 'test5', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 4, @SID, 'test5', '17:00', '19:00');


# Test User 6, MW 4-5
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test6', '16:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test6', '16:00', '17:00');


# Test User 7, TR 8-10 & 5-7, F 12-5
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test7', '8:00', '10:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test7', '17:00', '19:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'test7', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'test7', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 3, @SID, 'test7', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 4, @SID, 'test7', '12:00', '17:00');


# Test User 8, MW 12-4, TR 12-5, F 10-4
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test8', '12:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test8', '12:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 1, @SID, 'test8', '10:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 2, @SID, 'test8', '10:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 3, @SID, 'test8', '10:00', '16:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('F', 4, @SID, 'test8', '10:00', '16:00');


# Test User 9, MTWR 2-5
INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 1, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 2, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 3, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('M', 4, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 1, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 2, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 3, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('T', 4, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 1, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 2, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 3, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('W', 4, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 1, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 2, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 3, @SID, 'test9', '14:00', '17:00');

INSERT INTO master (day_of_week, week_num, schedule_id, 
                    username, start_time, end_time)
            VALUES ('R', 4, @SID, 'test9', '14:00', '17:00');


