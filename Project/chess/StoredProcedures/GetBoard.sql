CREATE PROCEDURE [chess].[GetBoard]
	@GameID int
AS


select top 1 *
from chess.[Move] m
where m.GameID = @GameID
order by m.MoveID DESC

RETURN 0
