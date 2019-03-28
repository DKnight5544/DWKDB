CREATE TABLE [User]
(
	  [UserID] varchar(15) NOT NULL
	, [PayeeID] varchar(15) NOT NULL
	, [UserName] varchar(30) NULL
	, [ClickCount] INT NOT NULL DEFAULT 0
	, [TransactionCount] INT NOT NULL DEFAULT 0
	,
    [LastClickDateTime] DATETIME NULL, 
    CONSTRAINT [PK_User] PRIMARY KEY ([UserID])
	, CONSTRAINT [FK_User_User] FOREIGN KEY ([PayeeID]) REFERENCES [User]([UserID])
)

GO

CREATE INDEX [IX_User_UserName] ON [User] ([UserName])
GO

CREATE INDEX [IX_User_PayeeID] ON [User] ([PayeeID])
GO

