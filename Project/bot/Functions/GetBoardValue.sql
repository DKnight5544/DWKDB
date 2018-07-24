
CREATE FUNCTION [bot].[GetBoardValue]
(
	@Board char(5)
)

RETURNS smallint
AS
BEGIN


	if not (isnumeric(@Board) = 1) return -1;

	declare @TestValue int = convert(int, @Board);

	if(@TestValue > 54321 or @TestValue < 0) return -1;


	declare	@Row1 smallint = convert(smallint, substring(@board,1,1))
		,	@Row2 smallint = convert(smallint, substring(@board,2,1))
		,	@Row3 smallint = convert(smallint, substring(@board,3,1))
		,	@Row4 smallint = convert(smallint, substring(@board,4,1))
		,	@Row5 smallint = convert(smallint, substring(@board,5,1))
		,	@BoardValue smallint = 0
	;


	select	@BoardValue = (@Row1 * 1)   + (@Row2 * 6)   + (@Row3 * 30)
						+ (@Row4 * 120) + (@Row5 * 360) ;


	return @BoardValue;

END