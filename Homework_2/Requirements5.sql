--REQUIREMENTS PART 5

-- Create Foreign key constraints from diagram or with script

ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_GradeDetails_Grade] FOREIGN KEY ([GradeID]) REFERENCES [dbo].[Grade]([Id]);
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Student] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Student]([Id]);
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Teacher] FOREIGN KEY ([TeacherId]) REFERENCES [dbo].[Teacher]([Id]);
ALTER TABLE [dbo].[Grade] ADD CONSTRAINT [FK_Grade_Cours] FOREIGN KEY ([CourseId]) REFERENCES [dbo].[Course]([Id]);
ALTER TABLE [dbo].[GradeDetails] ADD CONSTRAINT [FK_GradeDetails_Grade] FOREIGN KEY ([AchievementTypeID]) REFERENCES [dbo].[AchievementType]([Id]);