CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    EnrolledDate DATE,
    Gender NVARCHAR(10),
    NationalIDNumber NVARCHAR(50),
    StudentCardNumber NVARCHAR(50)
);

CREATE TABLE Teachers (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    AcademicRank NVARCHAR(50),
    HireDate DATE
);

SELECT * FROM Teachers;

CREATE TABLE Grades (
    ID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    TeacherID INT,
    Grade NVARCHAR(5),
    Comment NVARCHAR(255),
    CreatedDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses(ID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);

CREATE TABLE Courses (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Credit INT,
    AcademicYear NVARCHAR(50),
    Semester NVARCHAR(50)
);

CREATE TABLE AchievementTypes (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    ParticipationRate DECIMAL(5,2)
);

CREATE TABLE GradeDetails (
    ID INT PRIMARY KEY IDENTITY(1,1),
    GradeID INT,
    AchievementTypeID INT,
    AchievementPoints DECIMAL(5,2),
    AchievementMaxPoints DECIMAL(5,2),
    AchievementDate DATE,
    FOREIGN KEY (GradeID) REFERENCES Grades(ID),
    FOREIGN KEY (AchievementTypeID) REFERENCES AchievementTypes(ID)
);