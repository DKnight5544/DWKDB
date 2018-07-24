CREATE proc bot.PushMove
		@GameNum int
	,	@PlayerCode char(1)
	,	@NewValue smallint

as 


set nocount off;
insert into GameMoves (GameNum, PlayerCode, BoardValue)
select	@GameNum, @PlayerCode,@NewValue