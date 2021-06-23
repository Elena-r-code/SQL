--Requirement 1

--Assign value ‘Antonio’ to the FirstName variable && Find all Students  having FirstName  same as the variable

DECLARE
    @FirstName nvarchar(100)
SET @FirstName = 'Antonio'


SELECT FirstName
FROM Student
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth AND Fill the  table variable with all Female  students

DECLARE @FemaleTable TABLE 
(StudentID int not null, FirstName nvarchar(100) null, DateOfBirth date);


INSERT INTO @FemaleTable (StudentID, FirstName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'


SELECT *
FROM @FemaleTable
GO

--Declare temp table that will contain LastName and EnrolledDate columns && Fill the temp table with all Male students having First Name starting with ‘A’ && 
--Retrieve  the students  from the  table which last name  is with 7 characters

DROP TABLE IF EXISTS #MaleFirstNameA;

CREATE TABLE #MaleFirstNameA
(StudentID int not null, LastName nvarchar(100) null, EnrolledDate date);
GO

INSERT INTO #MaleFirstNameA (StudentID, LastName, EnrolledDate)
SELECT ID, LastName, EnrolledDate
FROM Student
WHERE Gender = 'M' AND  FirstName LIKE 'A%' AND LEN(LastName) = 7
GO


SELECT * FROM #MaleFirstNameA
GO

--Find all teachers whose FirstName length is less than 5 and && the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5 AND SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3)
GO