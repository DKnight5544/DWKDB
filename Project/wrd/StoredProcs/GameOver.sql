CREATE PROCEDURE [wrd].[GameOver]
	@GameID int,
	@PlayerID int,
	@GameTimeMilli bigint,
	@CompletedBoard xml
AS


	declare @ranking int;


	insert into wrd.GamePlayer (
			  GameID
			, PlayerID
			, GameTimeMilli
			)

	select 
			  GameID = @GameID
			, PlayerID = @PlayerID
			, GameTimeMilli = @GameTimeMilli

	from wrd.Player p
	where p.PlayerID = @PlayerID
	--and (p.HasPaid = 1 or @GameID < 11)
	;

	--------------------------------------------------

	declare @GamePlayerID int = (
		select gp.GamePlayerID
		from wrd.GamePlayer gp
		where gp.GameID = @GameID
		and gp.PlayerID = @PlayerID
	)

	insert into wrd.GamePlayerLetter (
		  GamePlayerID
		, Loc
		, Letter
	)
		
	select
		  gp.GamePlayerID 
		, Loc = X.value('(Loc)[1]', 'char(6)')
		, Let = X.value('(Let)[1]', 'char(1)')
	from @CompletedBoard.nodes('/Board/LetLoc') as a(X)
	cross join wrd.GamePlayer gp
	where gp.GamePlayerID = @GamePlayerID
	;
	----------------------------------------------------

	exec wrd.RepositionWords @GamePlayerID;

	----------------------------------------------------

	with cteGameStats as (
	
	select
			 s.Ranking
			,s.GamePlayerID
			,s.Moniker
			,s.GameTimeMilli
	from GameStats s
	where s.Ranking <= 10
	and s.GameID = @GameID

	union	
	
	select
			Ranking = s.Ranking
			,s.GamePlayerID
			,s.Moniker
			,s.GameTimeMilli
	from GameStats s
	where s.PlayerID = @PlayerID

	)

	select * 
	from cteGameStats cte
	order by cte.Ranking

RETURN 0
