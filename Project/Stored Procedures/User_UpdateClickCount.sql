CREATE PROCEDURE [User_UpdateClickCounter]
	@UserName varchar(30)
AS

update [User]
set ClickCount += 1, LastClickDateTime = GETDATE()
where UserName = @UserName
;

RETURN 0
