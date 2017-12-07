CREATE TABLE [wrd].[GamePlayer]
(
	[GamePlayerID] INT NOT NULL IDENTITY(1,1),
	[GameID] INT NOT NULL,
    [PlayerID] INT NOT NULL, 
	[GameTimeMilli] BIGINT NOT NULL,
    CONSTRAINT [PK_GamePlayer] PRIMARY KEY ([GamePlayerID]), 
    CONSTRAINT [FK_GamePlayer_Game] FOREIGN KEY ([GameID]) REFERENCES [wrd].[Game]([GameID]) ON DELETE CASCADE,
    CONSTRAINT [FK_GamePlayer_Player] FOREIGN KEY ([PlayerID]) REFERENCES [wrd].[Player]([PlayerID]) ON DELETE CASCADE
)

GO

CREATE INDEX [IX_GamePlayer_GameID_PlayerID] ON [wrd].[GamePlayer] ([GameID], [PlayerID])
GO
CREATE INDEX [IX_GamePlayer_PlayerID_GameID] ON [wrd].[GamePlayer] ([PlayerID], [GameID] desc)
GO
CREATE INDEX [IX_GamePlayer_GameID_GameTime] ON [wrd].[GamePlayer] ([GameID], [GameTimeMilli])
GO
