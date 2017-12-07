CREATE PROCEDURE [ss].[ContestView_SelectByContestID]
	@ContestID int
AS


	select *
	from ss.ContestView v
	where v.ContestID = @ContestID
	;


RETURN 0
