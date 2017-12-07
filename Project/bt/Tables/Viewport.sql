CREATE TABLE [bt].[Viewport]
(
	[ViewportId] BIGINT NOT NULL IDENTITY(1,1), 
    [CanvasId] BIGINT NOT NULL,
    [ViewportStyle] VARCHAR(MAX) NULL, 
    [FrameStyle] VARCHAR(MAX) NULL, 
    [FrameSource] VARCHAR(MAX) NULL, 
    CONSTRAINT [FK_Viewport_ToCanvas] FOREIGN KEY ([CanvasId]) REFERENCES bt.[Canvas](CanvasId), 
    CONSTRAINT [PK_Viewport] PRIMARY KEY ([ViewportId])
)
GO

CREATE UNIQUE INDEX [UIX_Viewport_CanvasId] ON [bt].[Viewport] ([CanvasId], ViewportId)
GO
