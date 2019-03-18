CREATE PROCEDURE [FP].[User_SelectByUserName]
	@UserName varchar(30)
AS

	select *
	from FP.UserView v
	where v.UserName = @UserName
	or v.TransID = @UserName
	;

RETURN 0
