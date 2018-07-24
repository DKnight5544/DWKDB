CREATE PROCEDURE [ou].[GetSponsor]
	@UserID varchar(20)
AS


select
 
	SponsorID = case when s.InvitedCount > 0
					then u.UserID 
					else u.SponsorID
					end

from ou.[User] u

cross join (	
	select
		InvitedCount = count(*)
	from ou.[User] u
	where u.InvitedID = @UserID
) s

where u.UserID = @UserID

;


RETURN 0
