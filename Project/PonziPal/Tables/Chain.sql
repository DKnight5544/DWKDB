CREATE TABLE [pnz].[Chain]
(
	[ChainNumber] INT IDENTITY (1,1) NOT NULL
	constraint PK_Chain primary key clustered (ChainNumber asc), 
    [CreateTime] DATETIME NOT NULL
)
