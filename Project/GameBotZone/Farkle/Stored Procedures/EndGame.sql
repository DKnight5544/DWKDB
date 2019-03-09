CREATE PROCEDURE [Farkle].[EndGame]
	@GameId int,
	@MoveCount int,
	@Moves varchar(max)
AS


update g
set 
	g.MoveCount = @MoveCount,
	g.Moves = @Moves
from Farkle.Game g
where g.GameId = @GameId
;

RETURN 0
