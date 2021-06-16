  
SELECT *
FROM Student
GO

SELECT *
FROM Grade
GO

SELECT *
FROM GradeDetails
GO

SELECT *
FROM Teacher
GO

SELECT *
FROM Course
GO

SELECT *
FROM AchievementType
GO

--REQUIREMENTS PART 1


--Find all Students with FirstName= Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirthgreater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > '1999-01-01'

--Find all Male students
SELECT *
FROM Student
WHERE Gender = 'M'

--Find all Students with LastNamestarting With ‘T’
SELECT *
FROM Student
WHERE LastName LIKE 'T%'

--Find all Students Enrolled in January/1998
SELECT *
FROM Student
WHERE EnrolledDate LIKE '1998-01-%'

--Find all Students with LastNamestarting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE LastName LIKE 'J%' AND EnrolledDate LIKE '1998-01-%'