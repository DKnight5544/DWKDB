CREATE TABLE [ss].[Partnership]
(
	[PartnershipID] INT NOT NULL identity(1,1),	
    [RoundID] INT NOT NULL, 
    [Heat] INT NULL, 
    [DanceOrder] INT NULL, 
    [PlacementOriginal] INT NULL, 
    [PlacementAdjusted] INT NULL, 
    [OldCoupleKey] INT NULL, 
    CONSTRAINT [PK_Partnership] PRIMARY KEY (PartnershipID), 
    CONSTRAINT [FK_Partnership_Round] FOREIGN KEY (RoundID) REFERENCES ss.Round(RoundID)
)
