--Requirement part 1


--Calculate the count of all grades in the system

SELECT COUNT (Grade) AS CountOfAllGrades
FROM [dbo].[Grade]
GO

--Calculate the count of all grades per Teacher in the system

SELECT TeacherID, SUM (Grade) AS GradesPerTeacher
FROM [dbo].[Grade]
GROUP BY TeacherID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT TeacherID, COUNT(Grade) as Total
FROM [dbo].[Grade]
WHERE ID < 100
GROUP BY TeacherID
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system


SELECT StudentID, MAX(Grade) as Maximal, AVG(Grade) as Average
FROM [dbo].[Grade]
GROUP BY StudentID
GO