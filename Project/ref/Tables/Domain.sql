CREATE TABLE [ref].[Domain]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY
	,DomainName varchar(30) NOT NULL 
)

GO

CREATE UNIQUE INDEX [UIX_Domain_DomainName] ON [ref].[Domain] ([DomainName])
