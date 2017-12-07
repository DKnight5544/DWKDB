CREATE PROCEDURE [chess].[GetSelfGameStats]
AS


select 
	 [MinimumDuration] = min(g.Seconds)
	,[AverageDuration] = avg(g.Seconds)
	,[MaximumDuration] = max(g.Seconds)	 
	,[MinimumMoveCount] = min(g.TotalMoves)
	,[AverageMoveCount] = avg(g.TotalMoves)
	,[MaximumMoveCount] = max(g.TotalMoves)
	,[CheckmateCount] = sum(case when GameStatus like 'Checkmate%' then 1 else 0 end)
	,[MaxGameID] = max(g.ID)
from (


select top 100
	  ID
	, Seconds = datediff(second, g.BegTime, g.EndTime) 
	, g.TotalMoves
	, G.GameStatus
from chess.Game g
where g.EndTime is not null
and g.SelfPlay = 1
order by g.ID desc


) g


RETURN 0
