CREATE TABLE [ou].[User]
(
	[UserID] varchar(20) NOT NULL,
	[InvitedID] varchar(20) NOT NULL,
	[SponsorID] varchar(20) NOT NULL,
    [UserEmail] VARCHAR(100) NOT NULL, 
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(),
	constraint PK_User primary key clustered (UserID)
)


GO


CREATE INDEX [IX_User_SponsorID] ON [ou].[User] ([SponsorID] asc)
GO

CREATE INDEX [IX_User_InvitedID] ON [ou].[User] ([InvitedID] asc)
GO
