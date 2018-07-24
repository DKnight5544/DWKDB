CREATE proc [bot].[RecordMove]
		@GameKey char(36)
	,	@BoardValueIn smallint
	,	@BoardValueOut smallint output
as 

-- First thing, grab the GameNum and BotIDs.

	declare @GameNum int
		,	@BotID int
		,	@NextMoveNum tinyint

	select	@GameNum = g.GameNum
		,	@BotID = g.BotID
	from	bot.Games g
	where	g.GameKey = @GameKey
	;



--	Record the user's move
	exec bot.PushMove @GameNum, 'P', @BoardValueIn;


-- if there are no legal moves then the bot has lost -record a loss for the bot
	if(@BoardValueIn in (1,6,30,120,360)) begin
		exec bot.RecordImpact @GameNum = @GameNum, @Winner = 'P';
		select @BoardValueOut = 0;
		return;
	end

-- Otherwise Grab the next move
	select @BoardValueOut = bot.GetNextMoveID(@BotID, @BoardValueIn);
	exec bot.PushMove @GameNum, 'B', @BoardValueOut;

	

-- if there are no legal moves left for user then the bot has won.
	if(@BoardValueOut in (1,6,30,120,360)) begin
		exec bot.RecordImpact @GameNum = @GameNum, @Winner = 'B';
		return;
	end