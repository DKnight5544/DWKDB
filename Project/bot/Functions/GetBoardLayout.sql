

CREATE FUNCTION [bot].[GetBoardLayout]
(
		@BoardValue smallint
)

RETURNS char(5)
AS
BEGIN

	if(@BoardValue > 719 or @BoardValue < 0) return -1
	if(@BoardValue = 0) return '00000';

	declare @Layout char(5)
		,	@Row1 char(1)
		,	@Row2 char(1)
		,	@Row3 char(1)
		,	@Row4 char(1)
		,	@Row5 char(1)
		,	@ti   tinyint
	
		select	@ti = convert(tinyint, @BoardValue / 360);
		select	@BoardValue -= (@ti * 360);
		select  @Row5 = convert(char(1), @ti);
	
		select	@ti = convert(tinyint, @BoardValue / 120);
		select	@BoardValue -= (@ti * 120);
		select  @Row4 = convert(char(1), @ti);
	
		select	@ti = convert(tinyint, @BoardValue / 30);
		select	@BoardValue -= (@ti * 30);
		select  @Row3= convert(char(1), @ti);
	
		select	@ti = convert(tinyint, @BoardValue / 6);
		select	@BoardValue -= (@ti * 6);
		select  @Row2 = convert(char(1), @ti);
	
		select	@ti = convert(tinyint, @BoardValue / 1);
		select	@BoardValue -= (@ti * 1);
		select  @Row1 = convert(char(1), @ti);

		select	@Layout = @Row1 + @Row2 + @Row3 + @Row4 + @Row5;

		return	@Layout;

END