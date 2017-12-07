CREATE TABLE [cl].[User]
(
	[UserID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PayPalEmail] VARCHAR(100) NOT NULL, 
    [InvitedByID] INT NOT NULL, 
    [CreatedDate] DATE NOT NULL DEFAULT getdate(), 
    [IsActivated] BIT NOT NULL DEFAULT 0 
)

GO

CREATE UNIQUE INDEX [UIX_User_PayPalEmail] ON [cl].[User] (PayPalEmail)
GO
CREATE INDEX [IX_User_InvitedBy] ON [cl].[User] (InvitedByID)
GO
