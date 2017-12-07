CREATE TABLE [tmrz].[Pages]
(
	 [PageID] BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY
    ,[PageGuid] UNIQUEIDENTIFIER NOT NULL 
    ,[ReadOnlyGuid] UNIQUEIDENTIFIER NOT NULL 
    ,[PageName] NVARCHAR(50) NOT NULL DEFAULT ('Click Here to Rename Page')
    ,[ExpirationTime] DATETIME NOT NULL DEFAULT (dateadd(day, 1,getdate()))
)

GO

CREATE UNIQUE INDEX [UIX_Pages_PageGuid] ON [tmrz].[Pages] ([PageGuid])

GO


CREATE INDEX [IX_Pages_ExpirationTime] ON [tmrz].[Pages] (ExpirationTime)
