CREATE PROCEDURE [ss].[Round_SelectByContestID]
	@ContestID int
AS

	select r.*
		, ScoringMethod = sm.Description
		, RoundType = rt.Description
	from ss.[Round] r
	join ss.RoundType rt on rt.RoundTypeID = r.RoundTypeID
	join ss.ScoringMethod sm on sm.ScoringMethodID = r.ScoringMethodID
	where r.ContestID = @ContestID;

RETURN 0
