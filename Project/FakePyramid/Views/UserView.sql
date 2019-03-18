CREATE VIEW [FP].[UserView] AS



with cte as (

	select UserName = u.ParentName
		, InvitedCount = count(*)
	from FP.[User] u
	where u.UserName <> u.ParentName
	group by u.ParentName

)


SELECT 
	  u1.TransID
	, u1.UserName
	, u1.ParentName
	, u1.PayeeName
	, u1.JoinDateTime
	, InvitedCount = isnull(cte.InvitedCount, 0)
	, NextPayeeName = case when cte.InvitedCount >= convert(int, s.Value) then u1.UserName else u1.PayeeName end 
	, GiftAmount = (select convert(int, s.[Value]) from FP.Setting s where s.[Key] = 'GIFT_AMOUNT')
FROM FP.[User] u1
cross join FP.Setting s
LEFT JOIN cte on cte.UserName = u1.UserName
WHERE s.[Key] = 'UP_COUNT'
;