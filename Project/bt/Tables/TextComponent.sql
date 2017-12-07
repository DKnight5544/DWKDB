CREATE TABLE [bt].[TextComponent]
(
	[TextCompId] BIGINT NOT NULL IDENTITY(1,1),
    [EditGuid] UNIQUEIDENTIFIER NOT NULL, 
    [ReadGuid] UNIQUEIDENTIFIER NOT NULL, 
    [TimeCreated] DATETIME2 NOT NULL DEFAULT getdate(), 
    [IsPaid] BIT NOT NULL DEFAULT 0, 
    [Style] VARCHAR(MAX), 
	[Value] VARCHAR(MAX),
	[URL] VARCHAR(MAX), 
    [GoogleFontName] VARCHAR(30) NULL
	CONSTRAINT PK_TextComponent PRIMARY KEY CLUSTERED (TextCompId) 
)
GO

CREATE UNIQUE INDEX [UIX_TextComponent_EditGuid] ON [bt].[TextComponent] ([EditGuid])
GO

CREATE UNIQUE INDEX [UIX_TextComponent_ReadGuid] ON [bt].[TextComponent] ([ReadGuid])
GO

