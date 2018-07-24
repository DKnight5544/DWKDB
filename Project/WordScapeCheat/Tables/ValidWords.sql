CREATE TABLE [WordScapeCheat].[ValidWords]
(
	[Word] VARCHAR(10) NOT NULL,
	[BaseWord] VARCHAR(10) NOT NULL,
    constraint PK_ValidWords primary key (BaseWord asc, Word asc)
)

GO
