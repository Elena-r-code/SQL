--REQUIREMENTS PART 4

-- Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert

ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_Points
DEFAULT 100 FOR [AchievementMaxPoints]
GO

-- Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints

ALTER TABLE [dbo].[GradeDetails] WITH CHECK
ADD CONSTRAINT CHK_GradeDetails_Points
CHECK (AchievementPoints <= AchievementMaxPoints);
GO

-- Change AchievementType table to guarantee unique names across the Achievement types

ALTER TABLE [dbo].[AchievementType] WITH CHECK
ADD CONSTRAINT UC_AchievementType_Name UNIQUE (Name)
GO
