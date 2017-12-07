CREATE TABLE [ss].[Dancer]
(
	DancerID INT NOT NULL Identity (1, 1),
	[FullName] varchar(100) NOT NULL,
	DisplayName varchar(100) NULL,
	WSDC INT NULL,
    [OldDancerNum] INT NULL, 
	CONSTRAINT [PK_DancerID] PRIMARY KEY(DancerID)
)

GO

CREATE UNIQUE INDEX [UIX_Dancer_WSDC] ON [ss].[Dancer] (WSDC) WHERE WSDC is not null
GO

CREATE INDEX [IX_Dancer_Name] ON [ss].[Dancer] (FullName) 
GO

