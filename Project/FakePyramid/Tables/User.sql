CREATE TABLE [FP].[User]
(
	  TransID varchar(20) not null
	, [UserName] varchar(30) null
	, [ParentName] varchar(30) NOT NULL
	, [PayeeName] varchar(30) NOT NULL
	,[JoinDateTime] DATETIME NOT NULL default(getdate())
	, CONSTRAINT [PK_User] PRIMARY KEY ([TransID])
)

GO

CREATE INDEX [IX_User_JoinDateTime] ON [FP].[User] ([JoinDateTime])
GO

CREATE UNIQUE INDEX [UIX_User_UserName] ON [FP].[User] ([UserName])
GO

CREATE INDEX [IX_User_ParentName] ON [FP].[User] ([ParentName])
GO

CREATE INDEX [IX_User_PayeeName] ON [FP].[User] ([ParentName])
GO
