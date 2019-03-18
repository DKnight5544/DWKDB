CREATE PROCEDURE [FP].[User_UpdateUserName]
	@TransID varchar(20)
	,@UserName varchar(20)
AS
	


update FP.[User]
set UserName = @UserName
where TransID = @TransID
and not exists(
	select 1 from FP.[User] u
	where u.UserName = @UserName
)
;

exec FP.User_SelectByUserName @UserName;

RETURN 0
