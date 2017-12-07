CREATE TABLE [ss].[UserPermission]
(
	[FacebookID] VARCHAR(50) NOT NULL,
	[EventID] INT NOT NULL,
	[PermissionID] INT NOT NULL
	constraint PK_UserPermission primary key (FacebookID, EventID, PermissionID), 
    CONSTRAINT [FK_UserPermission_WebsiteUser] FOREIGN KEY (FacebookID) REFERENCES ss.[WebsiteUser]([FacebookID]),
    CONSTRAINT [FK_UserPermission_Event] FOREIGN KEY (EventID) REFERENCES ss.[Event]([EventID]),
    CONSTRAINT [FK_UserPermission_Permission] FOREIGN KEY (PermissionID) REFERENCES ss.[Permission](PermissionID),
)

