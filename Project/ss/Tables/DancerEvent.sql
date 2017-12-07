CREATE TABLE [ss].[DancerEvent]
(
	DancerID INT NOT NULL,
	EventID INT NOT NULL,
	DefaultBIB INT NOT NULL,
	CONSTRAINT PK_DancerEvent PRIMARY KEY (DancerID, EventID), 
    CONSTRAINT [FK_DancerEvent_Dancer] FOREIGN KEY (DancerID) REFERENCES ss.[Dancer]([DancerID]) ON DELETE CASCADE,
    CONSTRAINT [FK_DancerEvent_Event] FOREIGN KEY (EventID) REFERENCES ss.[Event]([EventID]) ON DELETE CASCADE,
)
