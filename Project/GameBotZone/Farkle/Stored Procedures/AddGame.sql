CREATE PROCEDURE [Farkle].[AddGame]
	@url varchar(1000)
AS

declare @GameTime datetime = getdate()
	  , @BotId int = (select b.Id from GBZ.Bot b where b.URL = @url)
;

insert into Farkle.Game (BotId, GameTime)
select @BotId, @GameTime
;


select g.GameId, g.BotId
from Farkle.Game g
where g.BotId = @BotId
and g.GameTime = @GameTime
;


RETURN 0
