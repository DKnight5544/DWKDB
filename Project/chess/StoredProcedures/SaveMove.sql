CREATE PROCEDURE [chess].[SaveMove]
	@WebID char(36),
	@Board char(64)
AS


insert chess.[Move] (
	GameID, 
	Board
	)
select
	g.ID,
	@Board
from chess.Game g
where g.WebID = @WebID

return 0;

