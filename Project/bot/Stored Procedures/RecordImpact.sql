CREATE proc bot.RecordImpact
		@GameNum int
	,	@Winner	char(1)
as 


	-- Insert Impacts Where Not Exists
	insert into
		bot.BotBrains (BotID, Value, Impact)
		
	select

			[BotID] = g.BotID
		,	[Value]	= m.BoardValue
		,	[Impact] = 0
	
	from	bot.Games g
	join	bot.GameMoves m
	on		m.GameNum = g.GameNum
	and		m.GameNum = @GameNum


	left join
			bot.BotBrains bb
	on		bb.[BotID] = g.BotID
	and		bb.[Value] = m.BoardValue

	where	bb.Impact is null




	-- Update Impacts
	update	bb set	
	--select
			[Impact] = case when m.PlayerCode = @Winner
						then bb.Impact + 1
						else bb.Impact - 1
						end
	
	from	bot.Games g
	join	bot.GameMoves m
	on		m.GameNum = g.GameNum
	and		m.GameNum = @GameNum
	join	bot.BotBrains bb
	on		bb.[BotID] = g.BotID
	and		bb.[Value] = m.BoardValue


	-- update bot stats
	if(@Winner = 'B') begin

		update	b
				set [Wins] += 1 
		from	bot.bots b
		join	bot.games g
		on		g.BotID = b.BotID
		where	g.GameNum = @GameNum

	end
	else begin

		update	b
				set [Losses] += 1 
		from	bot.Bots b
		join	bot.Games g
		on		g.BotID = b.BotID
		where	g.GameNum = @GameNum

	end