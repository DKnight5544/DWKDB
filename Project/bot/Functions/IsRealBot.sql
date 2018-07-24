


CREATE FUNCTION [bot].[IsRealBot]
(
		@BotName varchar(15)
)

RETURNS bit
AS
BEGIN

	if exists (select 1 from [bot].[Bots] where [BotName] = @BotName) return 1
	
	return 0

END