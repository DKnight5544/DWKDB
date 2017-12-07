CREATE PROCEDURE [ss].[Event_SelectFilteredByDancer]
	@FacebookID varchar(50)
AS

with cte as (
	
select e.EventID
from ss.WebsiteUser wu
join ss.PartnershipDancer pd on pd.DancerID = wu.DancerIDFilter OR wu.DancerIDFilter is null
join ss.Partnership p on p.PartnershipID = pd.PartnershipID
join ss.Round r on r.RoundID = p.RoundID
join ss.Contest c on c.ContestID = r.ContestID
join ss.[EventView] e  on e.EventID = c.EventID
where wu.FacebookID = @FacebookID
group by e.EventID


)

select  e.*
from ss.[EventView] e  
join cte on cte.EventID = e.EventID
order by e.StartDate desc

;