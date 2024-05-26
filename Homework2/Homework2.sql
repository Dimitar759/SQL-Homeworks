Use [SEDCHome]
Go

Select * from Grade

--Calculate the count of all grades per Teacher in the system
SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID
ORDER BY TeacherID;

--Calculate the count of all grades per Teacher in the system for first 100
--Students (ID < 100)
SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID
ORDER BY TeacherID;

--Find the Maximal Grade, and the Average Grade per Student on all grades in
--the system

Select * from Student
Select * from Grade
Select * from GradeDetails

SELECT 
    StudentID,
    MAX(Grade) AS MaximalGrade,
    AVG(Grade) AS AverageGrade
FROM 
    Grade
GROUP BY 
    StudentID
ORDER BY 
    StudentID;

--	Calculate the count of all grades per Teacher in the system and filter only
--grade count greater then 200

Select * from Grade

SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID
HAVING COUNT(*) > 200
ORDER BY TeacherID;

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on
--all grades in the system. Filter only records where Maximal Grade is equal to
--Average Grade

SELECT
	
    StudentID,
    COUNT(*) AS GradeCount,
    MAX(Grade) AS MaximalGrade,
    AVG(Grade) AS AverageGrade
FROM 
    Grade
GROUP BY 
    StudentID
HAVING 
    MAX(Grade) = AVG(Grade);


--	List Student First Name and Last Name next to the other details from previous
--query
Select * from Grade
Select * from Student
SELECT
    S.FirstName,
    S.LastName,
    G.StudentID,
    G.GradeCount,
    G.MaximalGrade,
    G.AverageGrade
FROM
    (
        SELECT
            StudentID,
            COUNT(*) AS GradeCount,
            MAX(Grade) AS MaximalGrade,
            AVG(Grade) AS AverageGrade
        FROM
            Grade
        GROUP BY
            StudentID
        HAVING
            MAX(Grade) = AVG(Grade)
    ) AS G
JOIN
    Student AS S ON G.StudentID = S.ID;

--	Create new view (vv_StudentGrades) that will List all StudentIds and count of
--Grades per student

Select * from Grade

CREATE VIEW vv_StudentGrades AS
SELECT
    StudentID,
    COUNT(*) AS GradeCount
FROM
    Grade
GROUP BY
    StudentID;

--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades AS
SELECT
    S.FirstName,
    S.LastName,
    COUNT(*) AS GradeCount
FROM
    Grade G
JOIN
    Student S ON G.StudentID = S.ID
GROUP BY
    S.FirstName,
    S.LastName;


--List all rows from view ordered by biggest Grade Count

SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC;