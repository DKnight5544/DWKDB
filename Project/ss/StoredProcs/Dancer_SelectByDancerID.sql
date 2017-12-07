CREATE PROCEDURE [ss].[Dancer_SelectByDancerID]
	@DancerID int
AS


select *
from ss.Dancer d
where d.DancerID = @DancerID;