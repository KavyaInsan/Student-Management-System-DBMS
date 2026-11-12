
-- =====================================================
-- STUDENT MANAGEMENT SYSTEM USING MYSQL
-- =====================================================


-- SECTION 1: DATABASE CREATION

CREATE DATABASE StudentManagement;

USE StudentManagement;


-- SECTION 2: CREATE COURSES TABLE

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL UNIQUE
);


-- SECTION 3: INSERT COURSE RECORDS

INSERT INTO Courses VALUES
(101, 'BCA Data Science'),
(102, 'BCA'),
(103, 'BBA');


-- SECTION 4: DISPLAY COURSE RECORDS

SELECT * FROM Courses;


-- SECTION 5: CREATE STUDENTS TABLE

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 16),
    course_id INT,
    marks DECIMAL(5,2) DEFAULT 0,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);


-- SECTION 6: CHECK STUDENTS TABLE STRUCTURE

DESCRIBE Students;


-- SECTION 7: INSERT STUDENT RECORDS

INSERT INTO Students VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 19, 101, 85),
(2, 'Priya Verma', 'priya@gmail.com', 18, 102, 92),
(3, 'Rahul Singh', 'rahul@gmail.com', 20, 101, 76),
(4, 'Simran Kaur', 'simran@gmail.com', 19, 103, 88),
(5, 'Aditya Kumar', 'aditya@gmail.com', 18, 102, 81);


-- SECTION 8: DISPLAY ALL STUDENT RECORDS

SELECT * FROM Students;


-- SECTION 9: SEARCH STUDENT BY ID

SELECT * FROM Students
WHERE student_id = 2;


-- SECTION 10: UPDATE STUDENT MARKS

UPDATE Students
SET marks = 95
WHERE student_id = 2;

-- Verify updated marks

SELECT student_id, student_name, marks
FROM Students
WHERE student_id = 2;


-- SECTION 11: FILTER AND SORT STUDENTS

SELECT student_name, marks
FROM Students
WHERE marks > 80
ORDER BY marks DESC;


-- SECTION 12: CALCULATE AVERAGE MARKS

SELECT AVG(marks) AS average_marks
FROM Students;


-- SECTION 13: INNER JOIN

SELECT Students.student_name,
       Courses.course_name,
       Students.marks
FROM Students
INNER JOIN Courses
ON Students.course_id = Courses.course_id;


-- SECTION 14: LEFT JOIN AND GROUP BY

SELECT Courses.course_name,
       COUNT(Students.student_id) AS total_students
FROM Courses
LEFT JOIN Students
ON Courses.course_id = Students.course_id
GROUP BY Courses.course_name;


-- SECTION 15: DELETE STUDENT RECORD

DELETE FROM Students
WHERE student_id = 5;


-- SECTION 16: DISPLAY FINAL STUDENT RECORDS

SELECT * FROM Students;

-- Display selected final columns

SELECT student_id, student_name, age, course_id, marks
FROM Students;


-- SECTION 17: VERIFY COURSE RECORDS

SELECT * FROM Courses;


-- =====================================================
-- SECTION 18: CONSTRAINT TESTING
-- Execute EACH test separately.
-- These tests intentionally produce errors.
-- =====================================================


-- TEST A: DUPLICATE STUDENT ID
-- Expected: Duplicate primary key error

INSERT INTO Students VALUES
(1, 'Test User', 'test1@gmail.com', 20, 101, 70);


-- TEST B: MISSING REQUIRED STUDENT NAME
-- Expected: NOT NULL constraint error

INSERT INTO Students VALUES
(6, NULL, 'test2@gmail.com', 20, 101, 70);


-- TEST C: AGE BELOW 16
-- Expected: CHECK constraint error

INSERT INTO Students VALUES
(6, 'Test User', 'test3@gmail.com', 14, 101, 70);


-- TEST D: UNKNOWN COURSE ID
-- Expected: FOREIGN KEY constraint error

INSERT INTO Students VALUES
(6, 'Test User', 'test4@gmail.com', 20, 999, 70);


-- TEST E: DUPLICATE EMAIL
-- Expected: UNIQUE constraint error

INSERT INTO Students VALUES
(6, 'Test User', 'aarav@gmail.com', 20, 101, 70);


-- TEST F: DEFAULT VALUE FOR MARKS
-- Marks are not specified, so the default value 0 is applied.

INSERT INTO Students
(student_id, student_name, email, age, course_id)
VALUES
(6, 'Default Test', 'default@gmail.com', 19, 103);

-- Verify default marks

SELECT student_id, student_name, marks
FROM Students
WHERE student_id = 6;

-- Delete temporary testing record

DELETE FROM Students
WHERE student_id = 6;


-- =====================================================
-- END OF STUDENT MANAGEMENT SYSTEM SQL PROJECT
-- =====================================================
