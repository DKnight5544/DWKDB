CREATE TABLE [FP].[User]
(
	  [UserID] VARCHAR(30) NOT NULL
	, [ParentID] VARCHAR(30) NOT NULL
	, [PayeeID] VARCHAR(30) NOT NULL
	, [L1] int not null default 0
	, [L2] int not null default 0
	, [L3] int not null default 0
	, [L4] int not null default 0
	, [L5] int not null default 0 
    , [JoinDateTime] DATETIME NOT NULL default(getdate())
	, CONSTRAINT [PK_User] PRIMARY KEY ([UserID])
	, CONSTRAINT FK_User_ParentID_UserID FOREIGN KEY (ParentID) REFERENCES FP.[User](UserID)
	, CONSTRAINT FK_User_PayeeID_UserID FOREIGN KEY (PayeeID) REFERENCES FP.[User](UserID)
)

GO



CREATE INDEX [IX_User_JoinDateTime] ON [FP].[User] ([JoinDateTime])
GO
