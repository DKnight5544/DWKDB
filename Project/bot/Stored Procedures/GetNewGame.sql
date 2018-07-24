CREATE PROCEDURE bot.GetNewGame
	@BotName varchar(15)
AS

declare @NewGameKey char(36) = Convert(char(36), newid());

insert into bot.Games (BotID, Expires, GameKey)
select	BotID
	,	dateadd(hh,24,getdate())
	,	@NewGameKey
from	bot.Bots
where	BotName  = @BotName

-- Return stats....

select		b.BotName
		,	b.Wins
		,	b.Losses
		,	b.CashIn
		,	[NewGameKey] = @NewGameKey
from		bot.Bots b
where		b.BotName = @BotName

RETURN 0