CREATE PROCEDURE [FP].[User_Update]
	 @UserID varchar(15)
	,@UserName varchar(30)
AS
	


update FP.[User]
set UserName = @UserName
where UserID = @UserID
and not exists(
	select 1 from FP.[User] u
	where u.UserName = @UserName
)
;

exec FP.User_Select @UserName;

RETURN 0
