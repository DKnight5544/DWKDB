CREATE TABLE [ss].[Contest]
(
	[ContestID] INT NOT NULL identity(1,1),
	[EventID] INT NOT NULL,
    [ContestName] VARCHAR(50) NOT NULL, 
	[CurrentRound] INT NOT NULL DEFAULT(1),
    [PlacementCount] INT NULL, 
	[Private] BIT NOT NULL DEFAULT 0, 
    [OldContestNum] INT NULL, 
    CONSTRAINT [PK_Contest] PRIMARY KEY (ContestID),
    CONSTRAINT [FK_Event] FOREIGN KEY ([EventID]) REFERENCES ss.[Event](EventID),
)
