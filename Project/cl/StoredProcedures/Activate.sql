CREATE PROCEDURE [cl].[Activate]
	@UserID int
AS
	update cl.[User]
	set IsActivated = 1
	where UserID = @UserID
	;
RETURN 0
