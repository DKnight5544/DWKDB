CREATE PROCEDURE [FP].[User_Customize]
	@UserName varchar(30)
	, @ImageUrl varchar(max)
	, @ButtonText varchar(100)

AS
	
update  u set
	u.ImageUrl = @ImageUrl
	, u.ButtonText = @ButtonText
from FP.[User] u
where UserName = @UserName
;

exec FP.User_Select @UserName;

RETURN 0
