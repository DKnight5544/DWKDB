CREATE VIEW [ss].[EventView]
	AS 
	
	select 
		  e.EventID
		, e.EventName
		, e.StartDate
		, e.DefaultChiefJudgeID
		, e.Frozen
		, j.JudgeName
		, j.JudgeID
	from ss.Event e
	join ss.Judge j
	on j.JudgeID = e.DefaultChiefJudgeID
	


