CREATE TABLE [wrd].[Player]
(
	[PlayerID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [PlayerGuid] UNIQUEIDENTIFIER NOT NULL DEFAULT newid(),
    [Moniker] VARCHAR(20) NOT NULL, 
    [HasPaid] BIT NOT NULL DEFAULT 0, 
)

GO

CREATE UNIQUE INDEX [UIX_Player_PlayerGuid] ON [wrd].[Player] ([PlayerGuid])
GO
CREATE UNIQUE INDEX [UIX_Player_Moniker] ON [wrd].[Player] ([Moniker])
GO
