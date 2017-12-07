CREATE PROCEDURE [tmrz].[PagesCleanup]
AS

	declare @now datetime = getdate();
	
	delete p

	from tmrz.Pages p
	where 1=1
	and @now > dateadd(day, 3, p.ExpirationTime) 



		
RETURN 0

