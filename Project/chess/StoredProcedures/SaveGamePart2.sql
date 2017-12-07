CREATE PROCEDURE [chess].[SaveGamePart2]
	@GameID int
AS

declare @MaxMoveID int = (
	select max(m.MoveID) - 1
	from chess.[Move] m
	where m.GameID = @GameID
)

declare @Winner char(1) = (
	select case when mvo.MoveNum % 2 = 0 then 'B' else 'W' end
	from chess.MoveViewOne mvo
	where mvo.MoveID = @MaxMoveID
)

declare @GameStatus varchar(64) = (
	select m.Board
	from chess.[Move] m
	where m.MoveID = @MaxMoveID + 1
)

declare @TotalMoves int = (
	select count(*) - 1 
	from chess.[Move] 
	where GameID = @GameID
);

update chess.Game
set EndTime =  sysdatetime()
	, TotalMoves = @TotalMoves
	, GameStatus = @GameStatus
where ID = @GameID
;


-- Now save the engrams. If Stalemate then both players
-- get negative reinforcement so that new moves will be played.


-- Insert Distinct Boards that aren't already there
insert into chess.Engram (Board)
select distinct m.Board
from chess.[Move] m
left join chess.Engram e
on e.Board = m.Board
where m.GameID = @GameID
and e.Board is null
and m.MoveID <= @MaxMoveID
;


if(@GameStatus like '%Stalemate%') begin

	update e
		set Bad += 1
	from chess.[Move] m
	join chess.Engram e
	on e.Board = m.Board
	where m.GameID = @GameID
	and m.MoveID <= @MaxMoveID
	;
	
end
else begin

	update e set 
		Good += case when (@Winner = 'W' and m.MoveNum % 2 = 1) or (@Winner = 'B' and m.MoveNum % 2 = 0) then 1 else 0 end
	,	Bad  += case when (@Winner = 'W' and m.MoveNum % 2 = 1) or (@Winner = 'B' and m.MoveNum % 2 = 0) then 0 else 1 end
	from chess.MoveViewOne m
	join chess.Engram e
	on e.Board = m.Board
	where m.GameID = @GameID
	and m.MoveID <= @MaxMoveID
	;
	
end

-- Finally clean up the chess.Move table
delete m
from chess.[Move] m
join chess.Game g on g.ID = m.GameID 
where g.ID < (@GameID - 100)
and g.SelfPlay = 1
;

return 0;
