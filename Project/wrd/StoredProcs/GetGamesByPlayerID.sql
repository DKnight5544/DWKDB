CREATE PROCEDURE [wrd].[GetGamesByPlayerID]
	@PlayerID int
AS

with cteTopGames as (
	select top 10
		  x.GameID
		, x.GameTimeMilli
		, x.Ranking
		, x.GamePlayerID
		, x.Moniker
		, RecordType = 'Player'
	from wrd.GameStats x
	where x.PlayerID = @PlayerID
	order by x.GameID desc
)

, cteLeaderBoard as (

	select
		  x.GameID
		, x.GameTimeMilli
		, x.Ranking
		, x.GamePlayerID
		, x.Moniker
		, RecordType = 'LeaderBoard'
	from wrd.GameStats x
	join cteTopGames y on y.GameID = x.GameID
	where x.Ranking <= 10

) 

select * from cteTopGames 

union all

select * from cteLeaderBoard


RETURN 0
