CREATE TABLE [ss].[JudgingSession]
(
	[JudgingSessionID] INT NOT NULL,
	[EventID] INT NOT NULL,
	[Description] varchar(50) NOT NULL,
	constraint PK_JudgingSession primary key (JudgingSessionID), 
    CONSTRAINT [FK_JudgingSession_Event] FOREIGN KEY (EventID) REFERENCES ss.[Event]([EventID])
)
