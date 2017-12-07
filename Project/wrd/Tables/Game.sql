CREATE TABLE [wrd].[Game]
(
	[GameID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Letters] CHAR(144) NOT NULL 
)

GO



CREATE UNIQUE INDEX [UIX_Game_Letters] ON [wrd].[Game] (Letters)
