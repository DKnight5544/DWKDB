CREATE PROCEDURE [ou].[GetUser]
	@UserID varchar(20)
AS


select * from (

select
	*
	, NextSponsorID = ou.GetNextSponsorID(u.UserID)
	, UserType = convert(char, 'U')
from [ou].[User] u
where u.UserID = @UserID

union all

select
	*
	, NextSponsorID = ou.GetNextSponsorID(u.UserID)
	, UserType = convert(char, 'I')
from [ou].[User] u
where u.InvitedID = @UserID
and u.UserID <> u.InvitedID

union all

select
	*
	, NextSponsorID = ou.GetNextSponsorID(u.UserID)
	, UserType = convert(char, 'R')
from [ou].[User] u
where u.SponsorID = @UserID
and u.SponsorID <> u.InvitedID

) x

order by x.UserType, x.CreatedDate










RETURN 0
