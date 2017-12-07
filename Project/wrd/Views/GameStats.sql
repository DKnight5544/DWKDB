CREATE VIEW [wrd].[GameStats]
	AS 
	
	select
		 gp.GamePlayerID
		,gp.GameID
		,gp.PlayerID
		,p.Moniker
		,gp.GameTimeMilli
		,Ranking = row_number() over(partition by GameID order by GameTimeMilli asc)
	from wrd.GamePlayer gp
	join wrd.Player p on p.PlayerID = gp.PlayerID

