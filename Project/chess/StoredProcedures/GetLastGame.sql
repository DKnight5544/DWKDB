CREATE PROCEDURE [chess].[GetLastGame]
AS

select
	m.MoveID,
	m.Board
from chess.[Move] m
where m.GameID = (
	select
		GameID = max(g.ID)
	from chess.Game g
	join chess.Move m on m.GameID = g.ID
	where g.EndTime is not null
)
order by m.MoveID
;


return 0;