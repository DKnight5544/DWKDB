

CREATE FUNCTION [bot].[GetNextMove]
(
		@BotName varchar(15)
	,	@ValueIn smallint
)

RETURNS smallint
AS
BEGIN

	declare @ValueOut smallint = 0;

	--select	*

	--from	bot.Moves m
	--join	[bot].[BotBrainView] v
	--on		v.[BotName] = @BotName
	--and		v.[Value] = m.[Move]

	--where	m.Value = @ValueIn


	--order by v.Impact DESC

	select top 1

			@ValueOut	= v.Value

	from	bot.Moves m
	join	[bot].[BotBrainView] v
	on		v.[BotName] = @BotName
	and		v.[Value] = m.[Move]

	where	m.Value = @ValueIn


	order by v.Impact DESC , v.Value DESC


	return @ValueOut

END