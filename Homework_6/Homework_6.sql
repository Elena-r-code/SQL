--Homework requirement 1a/2

--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details) 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)



CREATE PROCEDURE dbo.CreateGrade (@StudentId int, @TeacherId int)
AS
BEGIN
	
	INSERT INTO [dbo].[Grade] (StudentId, TeacherId)
	VALUES (@StudentId, @TeacherId)

	
	select count(*) as TotalGrades
	FROM [dbo].[Grade] o
	where StudentID = @StudentId

	select MAX(Grade) as MaxGrade
	FROM [dbo].[Grade] o
	where StudentID = @StudentId
	and TeacherID = @TeacherId

END
GO

EXEC dbo.CreateGrade  @StudentId =5, @TeacherID=7 
select * 
from [dbo].[Grade]
order by 1 desc



--Homework requirement 1b/2

--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula
--AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE dbo.CreateGradeDetail (@Grade int, @AchievementTypeId int, @Points int,@MaxPoints int, @Date date)
AS
BEGIN

-- output
	SELECT sum(gd.AchievementPoints/gd.AchievementMaxPoints * p.ParticipationRate) as SumOfGradePoints
	FROM [dbo].[Grade] o
	INNER JOIN [dbo].[GradeDetails] gd on gd.GradeID = o.ID
	INNER JOIN [dbo].[AchievementType] p on p.ID = gd.AchievementTypeID
	WHERE o.Grade = @Grade
	
END
GO
	
EXEC dbo.CreateGradeDetail @Grade=7, @AchievementTypeId = 8, @Points = 50, @MaxPoints =100, @Date ='1999-02-02'

SELECT * FROM [dbo].[GradeDetails]
WHERE id = 4206



