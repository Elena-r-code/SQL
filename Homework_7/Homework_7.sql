EXEC dbo.CreateGradeDetail @GradeId = 22222, @AchievementTypeID = 1230,@AchievementPointsId = 721,@AchievementMaxPoints = 1200,@AchievementDate = '1998-06-16'
GO

CREATE OR ALTER  PROCEDURE dbo.CreateGradeDetail (@GradeId int, @AchievementTypeID int, @AchievementPointsId int,@AchievementMaxPoints int, @AchievementDate date)
AS
BEGIN

DECLARE @ParticipationRate decimal(5,5)
DECLARE @GradePoints decimal(5,5)

SELECT @ParticipationRate = ParticipationRate
FROM [dbo].[AchievementType]
WHERE ID = @AchievementTypeID

BEGIN TRY

INSERT INTO [dbo].[GradeDetails] (GradeId, AchievementTypeID, AchievementPoints, AchievementMaxPoints,AchievementDate)
VALUES (@GradeId,@AchievementTypeID,@AchievementPointsId,@AchievementMaxPoints,@AchievementDate)

END TRY
BEGIN CATCH  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  

SET @GradePoints  = 
(
	SELECT SUM(AchievementPoints/AchievementMaxPoints*A.ParticipationRate)
	FROM [dbo].[GradeDetails] GD 
	INNER JOIN [dbo].[AchievementType] A ON A.ID = GD.AchievementTypeID
	WHERE GD.GradeID = @GradeId 
)

UPDATE G SET Grade = @GradePoints
FROM [dbo].[Grade] G
WHERE ID = @GradeId

SELECT A.Name, SUM(GD.AchievementPoints) AS POINTS, SUM(GD.AchievementPoints/GD.AchievementMaxPoints*A.ParticipationRate) AS TOTALPOINTS
FROM [dbo].[GradeDetails] GD
INNER JOIN [dbo].[AchievementType] A ON A.ID = GD.AchievementTypeID
WHERE GD.GradeID = @GradeId
GROUP BY A.Name

END
GO