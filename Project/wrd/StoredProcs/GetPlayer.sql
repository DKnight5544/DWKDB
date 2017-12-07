CREATE PROCEDURE [wrd].[GetPlayer]
	@PlayerGuidChar char(36)
AS

	declare @PlayerGuid uniqueidentifier = convert(uniqueidentifier, @PlayerGuidChar);

	declare @MaxGameID int = (
			select max(gp.GameID)
			from wrd.GamePlayer gp
			join wrd.Player p on p.PlayerID = gp.PlayerID
			where p.PlayerGuid = @PlayerGuid
	);
		

	declare @NextGameID int = (
		
		select min(g.GameID)
		from wrd.Game g
		where g.GameID > coalesce(@MaxGameID, 0)
	
	);
	
	select 
		  p.PlayerID
		, p.Moniker
		, p.HasPaid
		, g.GameID
		, g.Letters
	from wrd.Player p
	cross join wrd.Game g
	where p.PlayerGuid = @PlayerGuid 
	and g.GameID = @NextGameID
	;
	
RETURN 0
