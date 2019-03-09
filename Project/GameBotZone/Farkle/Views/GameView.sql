CREATE VIEW [Farkle].[GameView]
	AS

	with cte_AllGames as (

	select
		  g.GameId
		, g.BotId
		, g.GameTime
		, g.MoveCount
		, g.Moves
		, b.BotName
		, b.PaymentInfo
		, b.URL
		, MinMoveCount = min(MoveCount) over(partition by g.BotId)
	from GBZ.Bot b
	join Farkle.Game g on g.BotId = b.Id
	where g.MoveCount is not null
)

--select * from cte_BestGame;

, cte_BestGames as (

	select
		  g.GameId
		, g.BotId
		, g.GameTime
		, g.MoveCount
		, g.Moves
		, b.BotName
		, b.PaymentInfo
		, b.URL
		, Placement = convert(int, Row_Number() over(order by g.MoveCount, g.GameTime))
	from GBZ.Bot b
	join cte_AllGames g on g.BotId = b.Id
	where g.MoveCount = g.MinMoveCount
	and g.MoveCount is not null
)

select g.*
from cte_BestGames g