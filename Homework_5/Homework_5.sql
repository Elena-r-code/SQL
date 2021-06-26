DROP FUNCTION IF EXISTS dbo.fn_GradePerStudent;
GO

CREATE FUNCTION dbo.fn_GradePerStudent (@TeacherID int, @CourseID int)
RETURNS @Output TABLE (StudentFirstName nvarchar(100), StudentLastName nvarchar(100), Grade tinyint, CreatedDate datetime)
AS
BEGIN

INSERT INTO @Output
SELECT S.FirstName as StudentFirstName, S.LastName as StudentLastName, G.Grade as Grade, G.CreatedDate as CreatedDate
FROM [dbo].[Grade] as G
inner join [dbo].[Student] as S on S.ID= G.StudentID
inner join [dbo].[Course] as C on C.ID= g.CourseID
inner join [dbo].[GradeDetails] as GD on GD.GradeID= G.ID
inner join [dbo].[AchievementType] as A on A.ID= GD.AchievementTypeID
WHERE GD.AchievementPoints>50 AND A.Name ='Ispit'
AND G.CourseID=@CourseID AND G.TeacherID=@TeacherID
GROUP BY S.FirstName, S.LastName, G.Grade, G.CreatedDate


RETURN
END
GO

DECLARE @TeacherID int =1
DECLARE @CourseID int = 1

SELECT * FROM dbo.fn_GradePerStudent(@TeacherID, @CourseID)
GO

