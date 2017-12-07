CREATE TABLE [chess].[Game]
(
	[ID] int identity(1,1) not null,
	[BegTime] DATETIME2(0) NOT NULL, 
    [SelfPlay] BIT NOT NULL, 
    [EndTime] DATETIME2(0) NULL, 
    [TotalMoves] INT NULL, 
	GameStatus varchar(64)
    constraint PK_Game primary key clustered (ID) NULL, 
    [WebID] UNIQUEIDENTIFIER NULL
)

GO

CREATE INDEX [IX_Game_EndTime] ON [chess].[Game] ([EndTime])
GO
CREATE INDEX [IX_Game_WebID] ON [chess].[Game] ([WebID])
GO
