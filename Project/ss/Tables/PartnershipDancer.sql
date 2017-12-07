CREATE TABLE [ss].[PartnershipDancer]
(
    [PartnershipID] INT NOT NULL,
	[DancerID] INT NOT NULL, 
    [DancerRoleID] INT NOT NULL, 
    [BIB] VARCHAR(10) NULL, 
    CONSTRAINT [FK_PartnershipDancer_Partnership] FOREIGN KEY ([PartnershipID]) REFERENCES [ss].[Partnership]([PartnershipID]), 
    CONSTRAINT [FK_PartnershipDancer_Dancer] FOREIGN KEY ([DancerID]) REFERENCES [ss].[Dancer]([DancerID]), 
	CONSTRAINT [PK_PartnershipDancer] PRIMARY KEY ([PartnershipID],[DancerID])
)
