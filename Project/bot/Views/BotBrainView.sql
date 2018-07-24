
CREATE view [bot].[BotBrainView] as

select distinct
		b.[BotName]
	,	b.[BotID]
	,	brd.Value
	,	brd.Layout
	,	[Impact] = isnull(bb.Impact, 0)

from	[bot].[Bots] b

cross join
		[bot].[Board] brd

left join	
		[bot].[BotBrains] bb
on		bb.BotID = b.BotID
and		bb.[Value] = brd.[Value]