CREATE TABLE [GBZ].[Bot]
(
	 [Id] int identity(1,1)
	,[URL] varchar(1000) not null
	,[PaymentInfo] varchar(1000) NOT null, 
    [BotName] VARCHAR(20) NOT NULL, 
    CONSTRAINT [PK_API] PRIMARY KEY ([Id])
)

GO

CREATE UNIQUE INDEX [IX_API_URL] ON [GBZ].[Bot] ([URL])
