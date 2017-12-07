CREATE PROCEDURE [chess].[GetGameByGameID]
	@GameID int
AS

if (@GameID = 0) select @GameID = max(g.ID) from chess.Game g where g.EndTime is not null;

select
	m.MoveID,
	m.Board
from chess.[Move] m
where m.GameID = @GameID
order by m.MoveID
;

return 0;
