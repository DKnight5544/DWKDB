CREATE PROCEDURE [bot].[SetUserState]
	@UserId varchar(20),
	@GameKey char(36),
	@BoardValue int
AS

insert bot.UserState(UserId, GameKey, BoardValue)
select @UserId, @GameKey, @BoardValue
where not exists (
	select 1
	from bot.UserState us
	where us.UserId = @UserId
)
;

update bot.UserState
set GameKey = @GameKey, BoardValue = @BoardValue
where UserId = @UserId
;