CREATE TABLE [ss].[Judge]
(
	[JudgeID] INT NOT NULL Identity(1,1), 
    [JudgeName] VARCHAR(100) NOT NULL,
	[OldJudgeNum] INT NULL, 
    CONSTRAINT PK_Judge PRIMARY KEY (JudgeID)
)

GO

CREATE UNIQUE INDEX [UIX_Judge_Name] ON [ss].[Judge] (JudgeName)
GO
