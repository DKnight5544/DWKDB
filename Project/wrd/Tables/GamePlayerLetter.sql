CREATE TABLE [wrd].[GamePlayerLetter]
(
	[GamePlayerID] INT NOT NULL, 
    [Loc] CHAR(6) NOT NULL, 
    [Letter] CHAR NOT NULL, 
    PRIMARY KEY ([GamePlayerID], [Loc]), 
    CONSTRAINT [FK_GamePlayerLetter_GamePlayer] FOREIGN KEY (GamePlayerID) REFERENCES [wrd].[GamePlayer]([GamePlayerID]) ON DELETE CASCADE
)
