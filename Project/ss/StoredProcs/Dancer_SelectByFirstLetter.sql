CREATE PROCEDURE [ss].[Dancer_SelectByFirstLetter]
	@FirstLetter char(1)
AS


select d.*
from ss.Dancer d
where left(d.FullName,1) = @FirstLetter
order by d.FullName;