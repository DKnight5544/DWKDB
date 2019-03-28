CREATE VIEW [UserView] AS


SELECT
	  u1.UserID 
	, u1.PayeeID
	, u1.UserName
	, PayeeName = u2.UserName
	, u1.TransactionCount
	, u1.ClickCount
	, u1.LastClickDateTime

	--, NextPayeeName = case when u1.TransactionCount >= convert(int,s2.Value)
	--					then u1.UserName else u2.UserName end

	, NextPayeeName = case when (u1.TransactionCount % 2) = 0
						then u1.UserName else u2.UserName end

	, Price = convert(decimal(5,2),s1.[Value])
	, ServerTime = getdate()

FROM [User] u1
JOIN [User] u2 on u2.UserID = u1.PayeeID
CROSS JOIN Setting s1
WHERE 1=1
AND s1.[Key] = 'PRICE'
;