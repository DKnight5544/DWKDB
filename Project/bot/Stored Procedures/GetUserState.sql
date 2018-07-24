CREATE PROCEDURE [bot].[GetUserState]
	@UserID varchar(20)
AS


select us.GameKey
	, us.BoardValue
	, b.BotName
	, b.Wins
	, b.Losses
from bot.UserState us
join bot.Games g on g.GameKey = us.GameKey
join bot.Bots b on b.BotID = g.BotID
where us.UserId = @UserID;