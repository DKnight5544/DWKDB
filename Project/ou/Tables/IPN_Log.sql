CREATE TABLE [ou].[IPN_Log]
(
	[ID] INT NOT NULL IDENTITY(1,1) ,
	[Time] DATETIME NOT NULL  DEFAULT (getdate()), 
    [Value] NVARCHAR(1000) NOT NULL,
	constraint PK_IPN_Log primary key clustered (ID)
)

GO
