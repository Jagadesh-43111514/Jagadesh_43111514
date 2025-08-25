-- 1. Create database
CREATE DATABASE university_db;
USE university_db;

-- 2. Create tables

-- Students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    department VARCHAR(50)
);

-- Enrollments table (many-to-many relationship, cascades added)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Professors table (linked to courses, cascades added)
CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Insert sample data (Indian names)

INSERT INTO students (first_name, last_name, email) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com'),
('Priya', 'Patel', 'priya.patel@example.com'),
('Rohan', 'Reddy', 'rohan.reddy@example.com'),
('Neha', 'Verma', 'neha.verma@example.com');

INSERT INTO courses (course_name, department) VALUES
('Database Systems', 'Computer Science'),
('Data Communication Networks', 'Electronics'),
('Calculus', 'Mathematics'),
('Indian History', 'Humanities');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-08-01'),
(2, 3, '2025-08-02'),
(3, 2, '2025-08-03'),
(4, 4, '2025-08-04');

INSERT INTO professors (first_name, last_name, course_id) VALUES
('Dr. Anil', 'Kumar', 1),
('Dr. Meena', 'Joshi', 2),
('Dr. Rajesh', 'Iyer', 3),
('Dr. Kavita', 'Menon', 4);

-- 4. Create a view to show students with their courses and professors
CREATE VIEW student_course_info AS
SELECT 
    s.student_id AS "StudentID",
    s.first_name AS "StudentFirstName",
    s.last_name AS "StudentLastName",
    c.course_name AS "CourseName",
    p.first_name AS "ProfessorFirstName",
    p.last_name AS "ProfessorLastName"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN professors p ON c.course_id = p.course_id;

-- 5. Example SELECT using LIKE and alias
SELECT 
    s.first_name AS "Student",
    c.course_name AS "Course"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name LIKE '%Data%';

-- 6. Print every table in order

-- Print Students
SELECT * FROM students;

-- Print Courses
SELECT * FROM courses;

-- Print Professors
SELECT * FROM professors;

-- Print Enrollments
SELECT * FROM enrollments;

-- Print View (combined info)
SELECT * FROM student_course_info;