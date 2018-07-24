CREATE TABLE [gift].[Giver]
(
	[GiverID] CHAR(36) NOT NULL,
	[InviterID] CHAR(36) NOT NULL,
	[ShareCode] CHAR(5) NOT NULL,
	[Message] VARCHAR(MAX) NULL,
	[SponsorID] CHAR(36) NULL
	constraint PK_Giver primary key (GiverID) 
)


GO

CREATE UNIQUE INDEX [UIX_Giver_ShareCode] ON [gift].[Giver] (ShareCode);
GO

CREATE INDEX [IX_Giver_InviterID] ON [gift].[Giver] (InviterID);
GO

CREATE INDEX [IX_Giver_SponsorID] ON [gift].[Giver] (SponsorID);
GO