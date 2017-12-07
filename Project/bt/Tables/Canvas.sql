CREATE TABLE [bt].[Canvas]
(
	[CanvasId] BIGINT NOT NULL IDENTITY(1,1), 
    [EditGuid] UNIQUEIDENTIFIER NOT NULL, 
    [ReadGuid] UNIQUEIDENTIFIER NOT NULL, 
    [CanvasStyle] VARCHAR(MAX), 
    [TimeCreated] DATETIME2 NOT NULL DEFAULT getdate(), 
    [IsPaid] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Canvas] PRIMARY KEY ([CanvasId]) 
)

GO

CREATE UNIQUE INDEX [UIX_Canvas_EditGuid] ON [bt].[Canvas] ([EditGuid])
GO

CREATE UNIQUE INDEX [UIX_Canvas_ReadGuid] ON [bt].[Canvas] ([ReadGuid])
GO

