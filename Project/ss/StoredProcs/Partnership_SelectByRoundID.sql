CREATE PROCEDURE [ss].[Partnership_SelectByRoundID]
	@RoundID int
AS


	select *
	from ss.Partnership p
	where p.RoundID = @RoundID
	;


RETURN 0
