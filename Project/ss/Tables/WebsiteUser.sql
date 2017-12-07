CREATE TABLE [ss].[WebsiteUser]
(
	[FacebookID] VARCHAR(50) NOT NULL,
	[FacebookName] VARCHAR(50) NOT NULL,
	[FacebookEmail] VARCHAR(100) NULL ,	
	
    [DancerIDFilter] INT NULL , 
    [JudgeIDFilter] INT NULL , 
    CONSTRAINT [PK_WebsiteUser_FacebookID] PRIMARY KEY(FacebookID), 
    CONSTRAINT [FK_WebsiteUser_Dancer] FOREIGN KEY ([DancerIDFilter]) REFERENCES ss.Dancer(DancerID), 
    CONSTRAINT [FK_WebsiteUser_Judge] FOREIGN KEY ([JudgeIDFilter]) REFERENCES ss.Judge(JudgeID), 
)

GO

