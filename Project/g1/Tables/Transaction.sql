CREATE TABLE [g1].[Transaction]
(
	[ID] BIGINT IDENTITY(1,1) NOT NULL,
	[Email] nvarchar(100) NOT NULL,
	[IPN] NVARCHAR(3000) NOT NULL,
	[Date] datetime2(0) NOT NULL DEFAULT(SYSDATETIME()),
	[Price] decimal(6,2) NOT NULL,
    [PayeeID] BIGINT NOT NULL,
    CONSTRAINT PK_Transaction PRIMARY KEY CLUSTERED (ID), 
)

GO

CREATE INDEX [IX_Transaction_EmailAddress] ON [g1].[Transaction] ([Email])
GO

CREATE INDEX [IX_Transaction_BuyID] ON [g1].[Transaction] ([PayeeID])
GO
