

Create FUNCTION [bot].[GetNextMoveID]
(
		@BotID int
	,	@ValueIn smallint
)

RETURNS smallint
AS
BEGIN

	declare @ValueOut smallint = 0;


	select top 1

			@ValueOut	= v.Value

	from	bot.Moves m
	join	[bot].[BotBrainView] v
	on		v.[BotID] = @BotID
	and		v.[Value] = m.[Move]

	where	m.Value = @ValueIn


	order by v.Impact DESC , v.Value DESC


	return @ValueOut

END