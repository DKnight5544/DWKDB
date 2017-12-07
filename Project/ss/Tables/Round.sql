CREATE TABLE [ss].[Round]
(
	[RoundID] INT NOT NULL Identity(1,1),
	[ContestID] INT NOT NULL,
	[RoundTypeID] INT NOT NULL,
	[ScoringMethodID] INT NOT NULL,
	[CallbackCount] INT NOT NULL DEFAULT(0),
	[YesCount]  INT NOT NULL DEFAULT(0),
	[MaybeCount]  INT NOT NULL DEFAULT(0),
	[JudgingSessionID] INT NULL, 
    [OldRoundID] INT NULL, 
    CONSTRAINT [FK_Round_RoundType] FOREIGN KEY (RoundTypeID) REFERENCES ss.[RoundType]([RoundTypeID]), 
    CONSTRAINT [FK_Round_ScoringMethod] FOREIGN KEY (ScoringMethodID) REFERENCES ss.[ScoringMethod]([ScoringMethodID]), 
    CONSTRAINT [FK_Round_JudgingSession] FOREIGN KEY ([JudgingSessionID]) REFERENCES ss.[JudgingSession]([JudgingSessionID]),
    CONSTRAINT [FK_Round_ContestID] FOREIGN KEY ([ContestID]) REFERENCES ss.[Contest]([ContestID]),
	constraint PK_Round primary key (RoundID)

)
