CREATE TABLE [chess].[Move]
(
	MoveID INT NOT NULL identity(1,1),
	GameID INT not null,
	Board char(64) not null,
    constraint PK_Move primary key clustered (MoveID)
)
GO

CREATE INDEX [IX_Move_GameID] ON [chess].[Move] (GameID) include(MoveID, Board)
GO
