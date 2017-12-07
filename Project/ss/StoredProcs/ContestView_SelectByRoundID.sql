CREATE PROCEDURE [ss].[ContestView_SelectByRoundID]
	@RoundID int
AS


	select *
	from ss.ContestView v
	where v.RoundID = @RoundID
	;


RETURN 0
