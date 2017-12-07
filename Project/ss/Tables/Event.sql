CREATE TABLE [ss].[Event]
(
	[EventID] INT NOT NULL  Identity(1,1), 
    [EventName] VARCHAR(50) NOT NULL,
	[StartDate] DATE NOT NULL, 
    [DefaultChiefJudgeID] INT NOT NULL, 
    [OldEventNum] INT NULL, 
    [Frozen] BIT NULL DEFAULT 0, 
    Constraint PK_Event Primary Key (EventID), 
    CONSTRAINT [FK_Event_Judge] FOREIGN KEY ([DefaultChiefJudgeID]) REFERENCES ss.[Judge]([JudgeID]),
)
GO

CREATE UNIQUE INDEX [UIX_Event_EventName] ON [ss].[Event] (EventName)
GO