CREATE TABLE [email].[EmailAddresses]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Database] VARCHAR(30) NOT NULL, 
    [Table] VARCHAR(30) NOT NULL, 
    [Address] VARCHAR(100) NOT NULL, 
    [ZipCode] VARCHAR(15) NULL, 
    [EmailSent] BIT NOT NULL DEFAULT 0
)

GO

CREATE UNIQUE INDEX [UIX_EmailAddresses_UniqueKey] ON [email].[EmailAddresses] ([Database], [Table], [Address])
