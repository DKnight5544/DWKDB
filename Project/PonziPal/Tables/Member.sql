CREATE TABLE [pnz].[Member]
(
	 [MemberName] VARCHAR(100) NOT NULL
	,[Clicks] INT NOT NULL DEFAULT(0)
	,[MemberNumber] int not null identity(1,1)
	CONSTRAINT PK_Member PRIMARY KEY CLUSTERED (MemberName asc)
)


GO

CREATE UNIQUE INDEX [UIX_Member_MemberNumber] ON [pnz].[Member] (MemberNumber)
GO
