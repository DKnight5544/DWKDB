CREATE PROCEDURE [ref].[PurgeWhereOutaTime]
AS

declare @TestDate datetime = dateadd(hour,-48,getdate());

delete from ref.Account
where CreatedDate < @TestDate
and IsPaidFor = 0;

RETURN 0
