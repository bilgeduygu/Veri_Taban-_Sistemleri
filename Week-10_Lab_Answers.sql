-- Task 1: Create a database named "Week10_Lab" using MySQL commands.
CREATE DATABASE Week10_Lab;
USE Week10_Lab;

-- Task 2: Create a table named "Student". Create a primary key named 
-- "Student_ID" auto-incremented. Also, create "Surname" and "Average" with 
-- suitable data types as not null.
CREATE TABLE Student (
	Student_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Surname VARCHAR(30) NOT NULL,
    Average DOUBLE NOT NULL
);

-- Task 3: Create a table named "Lecture". Create related attributes and a 
-- foreign key from the "Student" table.
CREATE TABLE Lecture (
	Lecture_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Lecture_Name VARCHAR(30) NOT NULL,
    Student_ID INT UNSIGNED,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

-- Task 4: Add students to the "Student" table.
-- SURNAME  - AVERAGE
-- Luna     - 3.53
-- Morales  - 2.32
-- Fuentes  - 2.10
-- Martin   - 3.21
-- Logan    - 2.99
-- Serrano  - 2.78
-- Hess     - 2.94
-- Friedman - 2.45
-- Estes    - 3.12
-- Davila   - 3.91
INSERT INTO Student (Surname, Average) VALUES ('Luna', 3.53);
INSERT INTO Student (Surname, Average) VALUES ('Morales', 2.32);
INSERT INTO Student (Surname, Average) VALUES ('Fuentes', 2.10);
INSERT INTO Student (Surname, Average) VALUES ('Martin', 3.21);
INSERT INTO Student (Surname, Average) VALUES ('Logan', 2.99);
INSERT INTO Student (Surname, Average) VALUES ('Serrano', 2.78);
INSERT INTO Student (Surname, Average) VALUES ('Hess', 2.94);
INSERT INTO Student (Surname, Average) VALUES ('Friedman', 2.45);
INSERT INTO Student (Surname, Average) VALUES ('Estes', 3.12);
INSERT INTO Student (Surname, Average) VALUES ('Davila', 3.91);

-- Task 5: Calculate the standard deviation of all averages of students.
SELECT STDDEV(Average) FROM Student;

-- Task 6: Subtract 0.10 from all averages from the "Student" table.
SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET Average = Average - 0.10;

-- Task 7: Calculate the standard deviation of all averages of students again 
-- and observe the change.
SELECT STDDEV(Average) FROM Student;

-- Task 8: Add 0.20 from all averages who less than 2.50, from the "Student" 
-- table.
UPDATE Student SET Average = Average + 0.20 WHERE Average < 2.50;

-- Task 9: Delete "Morales" from the "Student" table.
DELETE FROM Student WHERE Surname = "Morales";

-- Task 10: Show all tables.
SHOW TABLES;

-- Task 11: Show all students from the "Student" table.
SELECT * FROM Student;

-- Task 12: Delete the least successful student.
SET @Minimum = (SELECT MIN(Average) FROM Student);
DELETE FROM Student WHERE Average = @Minimum;

-- Task 13: Drop the "Student" table.
DROP TABLE Lecture;
DROP TABLE Student;
-- or
ALTER TABLE Lecture DROP FOREIGN KEY lecture_ibfk_1;
DROP TABLE Student;

-- Task 14: Drop the database.
DROP DATABASE Week10_Lab;