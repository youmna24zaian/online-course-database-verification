
-- =====================================================
-- Project: Online Course Database
-- Exercise 3: SQL Queries and Database Operations
-- Description: Create and populate the Online_Course
-- database, then practice SQL queries using Students
-- and Enrollments tables.
-- =====================================================


-- =====================================================
-- Part 1: Database Setup
-- Create the Online_Course database and select it
-- for the following operations.
-- =====================================================

CREATE DATABASE Online_Course
GO

USE Online_Course
GO


-- =====================================================
-- Part 2: Create Tables
-- Create the Students table to store student information.
-- =====================================================

CREATE TABLE Students
(
    StudentID INT Primary Key,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Age INT,
    City VARCHAR(30),
    GPA DECIMAL(3,2)
);


-- Create the Enrollments table to store course enrollment
-- details and link each enrollment to a student.
-- The foreign key references Students(StudentID).

CREATE TABLE Enrollments
(
    EnrollmentID INT Primary Key,
    StudentID INT,
    CourseName VARCHAR(50) NOT NULL,
    Grade INT,
    Fee DECIMAL(8,2),
    Semester VARCHAR(20),
    CONSTRAINT student_id_fk FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID)
);


-- =====================================================
-- Part 3: Insert Sample Data
-- Insert sample student records into the Students table.
-- =====================================================

INSERT INTO Students
VALUES
(1, 'Ahmed', 'Ali', 20, 'Cairo', 3.40),
(2, 'Sara', 'Hassan', 22, 'Alexandria', 3.80),
(3, 'Omar', 'Khaled', 19, 'Cairo', 2.90),
(4, 'Mona', 'Samir', 23, 'Giza', 3.60),
(5, 'Youssef', 'Adel', 21, 'Cairo', 3.10),
(6, 'Nour', 'Mohamed', 24, 'Giza', 3.90),
(7, 'Karim', 'Mostafa', 20, 'Alexandria', 2.70),
(8, 'Laila', 'Tarek', 22, 'Cairo', 3.50),
(9, 'Hany', 'Wael', 25, 'Mansoura', 2.80),
(10, 'Reem', 'Ashraf', 21, 'Giza', 3.70);


-- Insert sample enrollment records.
-- Each record includes the student, course, grade,
-- fee, and semester.

INSERT INTO Enrollments
VALUES
(101, 1, 'Database', 85, 1200.00, 'Fall'),
(102, 2, 'Database', 95, 1200.00, 'Fall'),
(103, 3, 'Programming', 70, 1000.00, 'Fall'),
(104, 1, 'Programming', 90, 1000.00, 'Spring'),
(105, 4, 'AI', 88, 1500.00, 'Spring'),
(106, 5, 'Database', 78, 1200.00, 'Fall'),
(107, 6, 'AI', 97, 1500.00, 'Spring'),
(108, 7, 'Programming', 65, 1000.00, 'Fall'),
(109, 8, 'Database', 91, 1200.00, 'Spring'),
(110, 2, 'AI', 93, 1500.00, 'Spring'),
(111, 9, 'Database', 68, 1200.00, 'Fall'),
(112, 10, 'Programming', 89, 1000.00, 'Spring'),
(113, 5, 'AI', 82, 1500.00, 'Spring'),
(114, 8, 'Programming', 87, 1000.00, 'Fall'),
(115, 4, 'Database', 84, 1200.00, 'Fall');


-- =====================================================
-- Part 4: Basic Filtering and Selection
-- Retrieve students whose GPA is greater than 3.00.
-- =====================================================

SELECT FirstName, LastName, Age, GPA
FROM Students
WHERE GPA > 3.00;


-- Retrieve students who live in Cairo or Giza
-- and are older than 20.

SELECT *
FROM Students
WHERE (City = 'Cairo' OR City = 'Giza')
AND Age > 20;


-- Display unique city names in alphabetical order.

SELECT DISTINCT City
FROM Students
ORDER BY City;


-- Retrieve the three students with the highest GPAs.

SELECT TOP(3) *
FROM Students
ORDER BY GPA DESC;


-- =====================================================
-- Part 5: Aggregate Functions
-- Calculate the average, highest, and lowest GPA
-- across all students.
-- =====================================================

SELECT AVG(GPA) AS 'Average GPA',
MAX(GPA) AS 'Highest GPA',
MIN(GPA) AS 'Lowest GPA'
FROM Students;


-- Calculate the average grade for each course.

SELECT CourseName, AVG(Grade) AS Average
FROM Enrollments
GROUP BY CourseName;


-- Count enrollments for each course and display
-- only courses with more than three enrollments.

SELECT CourseName, COUNT(EnrollmentID) AS [Number of Enrollments]
FROM Enrollments
GROUP BY CourseName
HAVING COUNT(EnrollmentID) > 3;


-- =====================================================
-- Part 6: Subqueries
-- Retrieve students whose age is greater than
-- the average age of all students.
-- =====================================================

SELECT FirstName, LastName
FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students);


-- Retrieve students whose GPA is greater than
-- the average GPA of students living in Cairo.

SELECT FirstName, LastName
FROM Students
WHERE GPA > (SELECT AVG(GPA) FROM Students WHERE City = 'Cairo');


-- Retrieve students who have at least one enrollment
-- with a grade greater than the average grade
-- across all enrollment records.

SELECT FirstName, LastName, GPA
FROM Students
WHERE StudentID IN
(
    SELECT StudentID
    FROM Enrollments
    WHERE Grade > (
        SELECT AVG(Grade)
        FROM Enrollments
    )
);
