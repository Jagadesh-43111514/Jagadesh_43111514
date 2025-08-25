-- 1. Create the university database
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- 2. Create tables
CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- 3. Insert initial data
INSERT INTO Student (StudentID, FirstName, LastName, Email) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(2, 'Bob', 'Smith', 'bob.smith@example.com'),
(3, 'Carol', 'Williams', 'carol.williams@example.com');

INSERT INTO Course (CourseID, CourseName) VALUES
(101, 'Mathematics'),
(102, 'Physics'),
(103, 'Literature');

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103);

-- 4. Remove the Email column from Student table
ALTER TABLE Student DROP COLUMN Email;

-- 5. Add PhoneNumber column to Student table
ALTER TABLE Student ADD PhoneNumber VARCHAR(20);

-- 6. Update students with phone numbers
UPDATE Student SET PhoneNumber = '555-1234' WHERE StudentID = 1;
UPDATE Student SET PhoneNumber = '555-5678' WHERE StudentID = 2;
UPDATE Student SET PhoneNumber = '555-9012' WHERE StudentID = 3;

-- 7. Display the final Student table
SELECT * FROM Student;

-- 8. Truncate the tables (clean slate)
TRUNCATE TABLE Enrollment;
TRUNCATE TABLE Course;
TRUNCATE TABLE Student;
