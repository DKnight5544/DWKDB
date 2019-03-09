CREATE TABLE [Farkle].[Game]
(
	[GameId] INT NOT NULL identity,
	[BotId] INT NOT NULL,
    [GameTime] DATETIME NOT NULL, 
	[MoveCount] int NULL,
	[Moves] varchar(max) NULL,
    CONSTRAINT [PK_Games] PRIMARY KEY (GameId), 
    CONSTRAINT [FK_Games_Bot] FOREIGN KEY ([BotId]) REFERENCES GBZ.Bot(Id)
)


GO

CREATE INDEX [IX_Game_MoveCountAndTime] ON [Farkle].[Game] (MoveCount, GameTime)
