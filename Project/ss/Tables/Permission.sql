CREATE TABLE [ss].[Permission]
(
	[PermissionID] int NOT NULL,
	[Description] varchar(100) NOT NULL,
	constraint PK_Permission primary key(PermissionID)
)

GO

CREATE UNIQUE INDEX [UIX_Permission_Description] ON [ss].[Permission] ([Description])
