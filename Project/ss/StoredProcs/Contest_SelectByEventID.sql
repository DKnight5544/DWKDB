CREATE PROCEDURE [ss].[Contest_SelectByEventID]
	@EventID int
AS

select *
from ss.Contest c
where c.EventID = @EventID
order by c.ContestID

	;


