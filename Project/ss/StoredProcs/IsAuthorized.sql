CREATE PROC [ss].[IsAuthorized]
	@FacebookUser varchar(50),
	@EventID int,
	@PermissionID int
AS
BEGIN
		select isAuthorized = convert(bit, count(*))
		from ss.UserPermission p
		where p.FacebookID = @FacebookUser
		and p.EventID = @EventID
		and p.PermissionID = @PermissionID
END
