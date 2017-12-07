CREATE PROCEDURE [ss].[Contest_SelectFilteredByDancer]
	@FacebookID varchar(50)
	,@EventID int
AS

with cte as (
	
select c.ContestID
from ss.WebsiteUser wu
join ss.PartnershipDancer pd on pd.DancerID = wu.DancerIDFilter OR wu.DancerIDFilter is null
join ss.Partnership p on p.PartnershipID = pd.PartnershipID
join ss.Round r on r.RoundID = p.RoundID
join ss.Contest c on c.ContestID = r.ContestID
where wu.FacebookID = @FacebookID
and c.EventID = @EventID
group by c.ContestID


)

select  c.*
from ss.Contest c
join cte on cte.ContestID = c.ContestID
order by c.ContestID

;