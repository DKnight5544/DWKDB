CREATE PROCEDURE [chess].[GetBestMove]
	@Moves varchar(max)
AS

declare @MovesXML xml = @Moves;



with cteMoves as (
	select 
		 MaybeMove = X.value('(v)[1]', 'char(64)')
	from @MovesXML.nodes('/ds/r') as a(X)
)

select top 1
	BestMove = m.MaybeMove
from cteMoves m
left join chess.Engram e
on e.Board = m.MaybeMove
order by isnull(e.Good - e.Bad,0) desc, e.Good desc,newid()
;

return 0;

