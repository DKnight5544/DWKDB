CREATE TABLE [Setting]
(
	[Key] varchar(20) not null
	,[Value] varchar(MAX) not null
	, constraint PK_Setting primary key clustered ([Key])
)
