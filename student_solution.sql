CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

-- StudentCourse Table
CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Department Records
INSERT INTO Department VALUES
(10, 'Computer Science'),
(20, 'Mathematics');

-- Insert Faculty Records
INSERT INTO Faculty VALUES
(101, 'Dr. Ravi', 10),
(102, 'Dr. Meena', 20);

-- Insert Course Records
INSERT INTO Course VALUES
(201, 'Database Systems', 101),
(202, 'Data Structures', 101),
(203, 'Mathematics', 102);

-- Insert Student Records
INSERT INTO Student VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');

-- Insert StudentCourse Records
INSERT INTO StudentCourse VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);

-- Display Normalized Data Using JOIN
SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Student s
JOIN StudentCourse sc ON s.StudentID = sc.StudentID
JOIN Course c ON sc.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
JOIN Department d ON f.DepartmentID = d.DepartmentID;
