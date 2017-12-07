CREATE PROCEDURE [ss].[Event_SelectByEventID]
	@EventID int
AS

select e.*
from ss.[EventView] e
where e.EventID = @EventID
;

return 0;

