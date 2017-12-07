CREATE PROCEDURE [ref].[GetFeesOwed]
AS

-- find accounts where no referral fee has been paid
with cte1 as (

	select
		*
	from ref.Account a
	where a.[RefPayDate] is null
	and a.IsPaidFor = 1

)
-- find out how much the payees are owed:
, cte2 as (

	select 
		a.ID
		, AmountOwed = count(*) * 5
	from ref.Account a
	where a.ID in (
		select distinct ReferredByID
		from cte1
	)
	group by a.ID
)

select b.[PayPalEmail]
	, a.AmountOwed
from cte2 a
join ref.Account b
on b.[ID] = a.ID

RETURN 0
