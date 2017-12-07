CREATE VIEW [ss].[ContestView]
	AS 
		
select
	e.* 
	, j.[JudgeName]
	, c.ContestID
	, c.ContestName
	, c.CurrentRound
	, c.PlacementCount
	, c.Private
	, r.RoundID
	, r.[RoundTypeID]
	, RoundType = rt.[Description]
	, r.[ScoringMethodID]
	, ScoringMethod = sm.[Description]
	, r.[CallbackCount]
	, r.[YesCount]
	, r.[MaybeCount]
	, r.[JudgingSessionID]
	, p.[PartnershipID]
	, p.[Heat]
	, p.[DanceOrder]
	, p.[PlacementOriginal]
	, p.[PlacementAdjusted]
	, pd.[DancerID]
	, pd.[DancerRoleID]
	, DancerRole = dr.[Description]
	, d.[FullName]
	, d.[DisplayName]
	, d.[WSDC]
	, pd.[BIB]


from ss.event e
join ss.judge j on j.JudgeID = e.[DefaultChiefJudgeID]
join ss.contest c on c.EventID = e.EventID

join ss.Round r on r.ContestID = c.ContestID
join ss.roundtype rt on rt.roundtypeid = r.roundtypeid
join ss.scoringmethod sm on sm.scoringmethodid = r.scoringmethodid

join ss.partnership p on p.[RoundID] = r.[RoundID]

join ss.PartnershipDancer pd on pd.PartnershipID = p.PartnershipID
join ss.DancerRole dr on dr.[DancerRoleId] = pd.[DancerRoleId]

join ss.Dancer d on d.DancerID = pd.DancerID

where 1=1