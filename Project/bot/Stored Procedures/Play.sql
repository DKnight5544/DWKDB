CREATE proc bot.Play 
		@Bot1 varchar(15)
	,	@Bot2 varchar(15)
as 

declare @Value smallint = 719
	,	@Bot varchar(15)

declare	@Game table ( BotName varchar(15), Value smallint)

set nocount on;

--print 'Begin'
--exec [bot].[PrintBoard] @Value;

bot1:
 
	-- Bot1
	select @Bot = @Bot1;
	if(@Value > 0) Begin
		select @Value = bot.GetNextMove(@Bot, @Value);
		insert into @Game select @Bot, @Value;
		--print ' '
		--print @Bot
		--exec [bot].[PrintBoard] @Value;
	end
	else goto endgame
	-- Bot2
	select @Bot = @Bot2;
	if(@Value > 0) Begin
		select @Value = bot.GetNextMove(@Bot, @Value);
		insert into @Game select @Bot, @Value;
		--print ' '
		--print @Bot
		--exec [bot].[PrintBoard] @Value;
	end
	else goto endgame

	goto bot1

endgame:

	--print ' '
	--print @Bot + ' Wins!';

	-- Insert Impacts Where Not Exists
	insert into
		bot.BotBrains (BotID, Value, Impact)
		
	select	

			[BotID] = b.BotID
		,	[Value]	= g.Value
		,	[Impact] = 0
	
	from	@Game g
	join	bot.Bots b
	on		b.BotName = g.BotName
	left join
			bot.BotBrains bb
	on		bb.[BotID] = b.BotID
	and		bb.[Value] = g.Value
	where	bb.Impact is null


	-- Update Impacts
	update	bb set	
	--select
			[Impact] = case when g.BotName = @Bot 
						then bb.Impact + 1
						else bb.Impact - 1
						end
	
	from	@Game g
	join	bot.Bots b
	on		b.BotName = g.BotName
	join
			bot.BotBrains bb
	on		bb.[BotID] = b.BotID
	and		bb.[Value] = g.Value


	-- update bot stats
	if(@Bot1 = @Bot) begin
		update [bot].[Bots] set [Wins] += 1 where BotName = @Bot1
		update [bot].[Bots] set [Losses] += 1 where BotName = @Bot2
	end
	else begin
		update [bot].[Bots] set [Wins] += 1 where BotName = @Bot2
		update [bot].[Bots] set [Losses] += 1 where BotName = @Bot1
	end
GO