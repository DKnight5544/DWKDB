CREATE PROCEDURE [ss].[Contest_SelectByContestID]
	@ContestID int
AS

	select *
	from ss.Contest c
	where c.ContestID = @ContestID;

RETURN 0
