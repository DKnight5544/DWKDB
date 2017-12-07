CREATE TABLE [tmrz].[Timers]
(
	[TimerID] BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [TimerName] NVARCHAR(50) NOT NULL DEFAULT('Click Here to Rename Timer'), 
    [PageID] BIGINT NOT NULL, 
    [BegTime] DATETIME NULL , 
    [ElapsedSeconds] BIGINT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_Timers_Pages_PageID] FOREIGN KEY ([PageID]) REFERENCES [tmrz].[Pages]([PageID]) ON DELETE CASCADE
)

GO

CREATE INDEX [IX_Timers_PageID_ASC_TimerID_ASC] ON [tmrz].[Timers] (
	[PageID] ASC,
	[TimerID] ASC
)

GO

