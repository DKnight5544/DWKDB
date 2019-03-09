CREATE PROCEDURE [FP].[User_SelectByUserID]
	@UserID varchar(30)
AS

	select *
	from FP.UserView v
	where v.UserID = @UserID

RETURN 0
