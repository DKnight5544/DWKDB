CREATE VIEW [FP].[UserView] AS

SELECT 
	  u.UserID
	, u.ParentID
	, u.PayeeID
	, u.JoinDateTime
	, u.L1
	, u.L2
	, u.L3
	, u.L4
	, u.L5
	FROM FP.[User] u
