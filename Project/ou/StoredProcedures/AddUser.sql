CREATE PROCEDURE [ou].[AddUser]
	@UserID varchar(20),
	@InvitedID varchar(20),
	@SponsorID varchar(20),
	@UserEmail varchar(100)
AS

insert into ou.[User] (UserID, InvitedID, SponsorID, UserEmail)
select @UserID, @InvitedID, @SponsorID, @UserEmail
where not exists (
	select 1 
	from ou.[User]
	where UserID = @UserID
)
and exists (
	select 1 
	from ou.[User]
	where UserID = @InvitedID
)
and exists (
	select 1 
	from ou.[User]
	where UserID = @SponsorID
)
;


RETURN 0;
