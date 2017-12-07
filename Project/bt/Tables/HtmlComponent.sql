CREATE TABLE [bt].[HtmlComponent]
(
	[HtmlCompId] BIGINT NOT NULL IDENTITY(1,1),
    [EditGuid] UNIQUEIDENTIFIER NOT NULL, 
    [ReadGuid] UNIQUEIDENTIFIER NOT NULL, 
    [TimeCreated] DATETIME2 NOT NULL DEFAULT getdate(), 
    [IsPaid] BIT NOT NULL DEFAULT 0, 
	[HTML] VARCHAR(MAX)
	CONSTRAINT [PK_HtmlComponent] PRIMARY KEY CLUSTERED (HtmlCompId)
)


GO

CREATE UNIQUE INDEX [UIX_HtmlComponent_EditGuid] ON [bt].[HtmlComponent] ([EditGuid])
GO

CREATE UNIQUE INDEX [UIX_HtmlComponent_ReadGuid] ON [bt].[HtmlComponent] ([ReadGuid])
GO

