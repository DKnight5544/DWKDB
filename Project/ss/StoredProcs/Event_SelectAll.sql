CREATE PROCEDURE [ss].[Event_SelectAll]
AS

select e.*
from ss.[EventView] e
where e.EventID <> 0
order by e.StartDate desc
;

