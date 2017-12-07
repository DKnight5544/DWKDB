CREATE PROCEDURE [g1].[Next]
AS

select top 1 
	seller.ID
	, seller.Email
	, Price = 10
from g1.[Transaction] seller
left join g1.[Transaction] buyer
on buyer.ID = seller.PayeeID
where buyer.ID is null -- no buyer yet
order by seller.ID
;



RETURN 0
