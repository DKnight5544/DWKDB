CREATE PROCEDURE [gift].[GetGiverByGiverID]
	@GiverID char(36)
AS

/*
What we send back is determined by
if this giver has been activated yet (has a sponsor)
*/

-- First figure out who this guys sponsor should be
-- If his inviter has already sponsored at least 1 person,
-- then his sponsor is his inviter.  Otherwise his inviter's
-- sponsor is his sponsor also.

declare @InviterID char(36) = (
	select g.InviterID
	from gift.Giver g
	where g.GiverID = @GiverID
);

declare @InviterHasSponsoredCount int = (
	select count(*)
	from gift.Giver g
	where g.SponsorID = @InviterID
);

declare @InviterSponsorID char(36) = (
	select g.SponsorID
	from gift.Giver g
	where g.GiverID = @InviterID
);

declare @PotentialSponsorID char(36) = (
	case when @InviterHasSponsoredCount >= 1 
	  then @InviterID 
	  else @InviterSponsorID
	  end
)


select 
	g.GiverID
,	g.InviterID
,   g.ShareCode
,	[Message] = case when g.SponsorID is null then s.[Message] else g.[Message] end
,	g.SponsorID
from gift.Giver g, gift.Giver s
where 1=1
and g.GiverID = @GiverID
and s.GiverID = @PotentialSponsorID

RETURN 0
