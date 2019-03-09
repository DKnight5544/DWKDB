CREATE PROCEDURE [Farkle].[GetGame]
	@GameId int
AS

select v.*
from Farkle.GameView v
where v.GameId = @GameId
;

RETURN 0
