CREATE PROCEDURE [chess].[SaveGame]
	@Moves varchar(max),
	@GameID int
AS

declare @MovesXML xml = @Moves;



with cteMoves as (
	select 
		 Board = X.value('(v)[1]', 'char(64)')
	from @MovesXML.nodes('/ds/r') as a(X)
)

insert chess.[Move] (GameID, Board)
select
	@GameID,
	m.Board
from cteMoves m
;

exec chess.SaveGamePart2 @GameID;

return 0;

