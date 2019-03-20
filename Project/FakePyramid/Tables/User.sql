CREATE TABLE [FP].[User]
(
	  [UserID] varchar(15) NOT NULL
	, [PayeeID] varchar(15) NOT NULL
	, [UserName] varchar(30) NULL
	, [TransactionCount] INT NOT NULL DEFAULT 0
	, [ImageUrl] varchar(max) NULL
	, [ButtonText] VARCHAR(100) NULL, 
    CONSTRAINT [PK_User] PRIMARY KEY ([UserID])
	, CONSTRAINT [FK_User_User] FOREIGN KEY ([PayeeID]) REFERENCES FP.[User]([UserID])
)

GO

CREATE INDEX [IX_User_UserName] ON [FP].[User] ([UserName])
GO

CREATE INDEX [IX_User_PayeeID] ON [FP].[User] ([PayeeID])
GO

