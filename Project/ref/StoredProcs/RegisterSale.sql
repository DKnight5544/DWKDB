CREATE PROCEDURE [ref].[RegisterSale]
	@AccountID int
AS



-- next we gotta figure out who to pay

declare @SaleCount int
;


-- figure out how many sales this guy has already had.

select @SaleCount = count(*)
from ref.Account a
where a.ReferredByID = (
		select b.ReferredByID
		from ref.Account b
		where b.ID = @AccountID
		)
and a.IsPaidFor = 1;


-- mark the transaction as paid.
update a
set IsPaidFor = 1
from ref.Account a
where a.ID = @AccountID;



-- now return who should get paid
select 
	 PayPalEmail#1 = case when @SaleCount < 2 then coalesce (c.PayPalEmail,d.PayPalEmail) end
	,PayPalEmail#2 = case when @SaleCount >=2 then coalesce (b.PayPalEmail,c.PayPalEmail,d.PayPalEmail) end
from ref.Account a -- the new account
join ref.Account b -- the referrer
on b.ID = a.ReferredByID
join ref.Account c -- the referrer's payee
on c.ID = b.WhoGotPaidID
join ref.Account d -- me
on d.ID = 1
where a.ID = @AccountID;



RETURN 0
