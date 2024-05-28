USE [SEDCHome];
GO
EXEC sp_help 'dbo.Student';
-- Declare scalar variable for storing FirstName values
DECLARE @FirstName NVARCHAR(50);

-- Assign the value 'Antonio' to the variable
SET @FirstName = 'Antonio';

-- Select students with the same first name as the variable
SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName;

-- Declare table variable that will contain StudentId, StudentName, and DateOfBirth
DECLARE @Students TABLE (
    StudentId INT,
    StudentName NVARCHAR(100),
    DateOfBirth DATE
);

-- Fill the table variable with all Female students
INSERT INTO @Students (StudentId, StudentName, DateOfBirth)
SELECT ID AS StudentId, CONCAT(FirstName, ' ', LastName) AS StudentName, DateOfBirth
FROM Student
WHERE Gender = 'Female';

SELECT COUNT(*) AS FemaleStudentCount
FROM Student
WHERE Gender = 'Female';

--Declare temp table that will contain LastName and EnrolledDate columns

CREATE TABLE #MaleStudents (
    LastName NVARCHAR(100),
    EnrolledDate DATE
);

--Fill the temp table with all Male students having First Name starting with ‘A’
INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'Male' AND FirstName LIKE 'A%';

--Retrieve the students from the table which last name is with 7 characters

SELECT *
FROM Student
WHERE LEN(LastName) = 7;

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 
AND LEFT(FirstName, 3) = LEFT(LastName, 3);