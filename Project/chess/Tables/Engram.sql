CREATE TABLE [chess].[Engram]
(
	[Board] char(64) not null,
	[Good] INT NOT NULL DEFAULT 0,
	[Bad] INT NOT NULL DEFAULT 0, 
    Constraint PK_Engram Primary Key clustered (Board)
)
GO

