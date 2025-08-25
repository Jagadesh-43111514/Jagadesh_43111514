-- 1. Create the database
CREATE DATABASE ORG123;

-- 2. Show available databases
SHOW DATABASES;

-- 3. Use the new database
USE ORG123;

-- 4. Create the Worker table
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,  -- No need for (15), as INT does not support display width anymore
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- 5. Insert data into the Worker table
-- Important Fixes:
-- - Remove WORKER_ID values because it's AUTO_INCREMENT
-- - Use standard datetime format: 'YYYY-MM-DD HH:MM:SS'

INSERT INTO Worker 
	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
	('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
	('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
	('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
	('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
	('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
	('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
	('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
	('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');


select * from Worker