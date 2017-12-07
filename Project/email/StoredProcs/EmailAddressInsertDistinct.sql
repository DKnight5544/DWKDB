CREATE PROCEDURE [email].[EmailAddressInsertDistinct]
AS


insert into email.EmailAddresses

select 
	p.[Database]
	, p.[Table]
	, p.[Address]
	, p.[ZipCode]
from email.EmailAddresses_Temp p
left join email.EmailAddresses ea
on ea.[Database] = p.[Database]
and ea.[Table] = p.[Table]
and ea.[Address] = p.[Address]
where ea.Id is null;


truncate table email.EmailAddresses_Temp;

RETURN 0
