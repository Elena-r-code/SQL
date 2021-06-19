----Requirement part 3

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

drop view if exists vv_StudentGrades;
GO

CREATE VIEW vv_StudentGrades
AS
select StudentID,SUM(Grade) as firstView
from [dbo].[Grade] o
group by StudentID
GO


--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades
AS
select c.FirstName as Firstname , c.LastName as LastName, SUM(Grade) as GradeCount
from [dbo].[Grade] o
inner join [dbo].[Student] c on o.StudentID = c.Id
group by c.FirstName, c.LastName
GO

--List all rows from view ordered by biggest Grade Count


SELECT * from vv_StudentGrades
order by GradeCount DESC
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)

CREATE VIEW vv_StudentGradeDetails
AS 
select e.FirstName AS FirstName, e.LastName AS LastName, COUNT(d.ID) as secondView
from [dbo].[Grade] o
inner join [dbo].[Student] e on o.CourseID = e.ID
inner join [dbo].[Course] d on d.Name = o.Id

group by e.FirstName , e.LastName
GO