CREATE TABLE [FP].[AlternatePayeeMap]
(
	UserID varchar(30),
	L1PayeeID varchar(30),
	L2PayeeID varchar(30),
	L3PayeeID varchar(30),
	L4PayeeID varchar(30),
	L5PayeeID varchar(30),
	Constraint PK_AlternatedPayeeMap Primary Key Clustered (UserID asc), 
    CONSTRAINT [FK_AlternatePayeeMap_User] FOREIGN KEY (UserID) REFERENCES [FP].[User]([UserID])
)
