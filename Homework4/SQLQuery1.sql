USE SEDCHome;
GO

-- Create the stored procedure
CREATE PROCEDURE CreateGrade
    @StudentID INT,
    @TeacherID INT,
    @CourseID INT,
    @Grade INT,
    @CreatedDate DATE
AS
BEGIN
    -- Insert the new grade header info
    INSERT INTO dbo.Grade (StudentID, TeacherID, CourseID, Grade, CreatedDate)
    VALUES (@StudentID, @TeacherID, @CourseID, @Grade, @CreatedDate);
    
    -- Return the total number of grades for the student
    SELECT COUNT(*) AS TotalGrades
    FROM dbo.Grade
    WHERE StudentID = @StudentID;

    -- Return the maximum grade for the student and teacher
    SELECT MAX(Grade) AS MaxGrade
    FROM dbo.Grade
    WHERE StudentID = @StudentID AND TeacherID = @TeacherID;
END
GO




-- Create the stored procedure
CREATE PROCEDURE CreateGradeDetail
    @GradeID INT,
    @AchievementTypeID INT,
    @Points INT,
    @MaxPoints INT,
    @Date DATE
AS
BEGIN
    -- Insert the new grade detail record
    INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @Points, @MaxPoints, @Date);

    -- Assuming ParticipationRate is a constant for this example, you can adjust this as needed
    DECLARE @ParticipationRate FLOAT;
    SET @ParticipationRate = 1.0; -- Example value, adjust as necessary

    -- Calculate the sum of GradePoints for the specific grade
    SELECT 
        SUM(CAST(@Points AS FLOAT) / @MaxPoints * @ParticipationRate) AS GradePoints
    FROM dbo.GradeDetails
    WHERE GradeID = @GradeID;
END
GO

