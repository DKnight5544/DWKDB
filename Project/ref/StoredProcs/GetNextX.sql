CREATE PROCEDURE [email].[GetNextX]
	@count int = 100
AS

--declare @count int = 100;


begin try drop table #address end try begin catch end catch

select top (@count) 
	a.Address
into #address
from email.EmailAddresses a
where left(a.Address,1) > '9' 
and a.EmailSent = 0;

update a set a.EmailSent = 1
from (
	select top (@count) 
		a.Address
		, a.EmailSent
	from email.EmailAddresses a
	where left(a.Address,1) > '9' 
	and a.EmailSent = 0
) a;

select * from #address;


