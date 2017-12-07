CREATE TABLE [ref].[Account]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FromEmail] VARCHAR(50) NOT NULL, 
    [ToEmail] VARCHAR(50) NOT NULL, 
    [ReferredByID] INT NOT NULL, 
    [PayPalEmail] VARCHAR(50) NULL, 
    [RefPayDate] DATETIME NULL, 
    [RefPayAmount] MONEY NULL, 
	[IsPaidFor] bit
    CONSTRAINT [FK_Account_Account_ReferredByID] FOREIGN KEY ([ReferredByID]) REFERENCES [ref].[Account]([ID]) NOT NULL DEFAULT 0
    ,
    [CreatedDate] DATETIME NOT NULL DEFAULT getdate(), 
    [WhoGotPaidID] INT NULL
)

GO

CREATE UNIQUE INDEX [UIX_Account_FromEmail] ON [ref].[Account] ([FromEmail])
GO

CREATE INDEX [IX_Account_ReferredByID] ON [ref].[Account] (ReferredByID)
GO

CREATE INDEX [IX_Account_CreatedDate] ON [ref].[Account] (CreatedDate)
GO

CREATE INDEX [IX_Account_WhoGotPaid] ON [ref].[Account] (WhoGotPaidID)
GO
