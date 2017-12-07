CREATE PROCEDURE [cl].[GetUser]
	@UserID int
AS

	select *
	from cl.[User] u
	where u.UserID = @UserID
	;

RETURN 0
