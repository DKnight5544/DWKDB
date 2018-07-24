CREATE FUNCTION [ou].[GetNextSponsorID]
(
	@UserID varchar(20)
)

RETURNS varchar(20) as

begin

	declare @SponsorID varchar(20) = (

	select
 
	case when s.InvitedCount > 0
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

)

return @SponsorID;

;


end
