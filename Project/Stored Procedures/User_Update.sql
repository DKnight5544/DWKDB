CREATE PROCEDURE [User_Update]
	 @UserID varchar(15)
	,@UserName varchar(30)
AS
	


update [User]
set UserName = @UserName
where UserID = @UserID
and not exists(
	select 1 from [User] u
	where u.UserName = @UserName
)
;

exec User_Select @UserName;

RETURN 0
