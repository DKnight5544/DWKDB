CREATE PROCEDURE [g1].[ListByEmail]
	@EmailAddress nvarchar(100)
AS

select
	ID = seller.ID,
	SellerDate = seller.[Date],
	SellerPrice = seller.Price,
	BuyerID = buyer.ID,
	BuyerDate = buyer.[Date],
	BuyerPrice = buyer.Price,
	EllapsedSeconds = 
		case when buyer.Date is not null then datediff(ss,seller.[Date], buyer.[Date])	else null end
from g1.[Transaction] seller
left join g1.[Transaction] buyer
on buyer.PayeeID = seller.ID
;



RETURN 0
