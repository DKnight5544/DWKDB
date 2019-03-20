CREATE VIEW [FP].[UserView] AS



SELECT
	  u1.UserID 
	, u1.PayeeID
	, u1.UserName
	, u1.TransactionCount

	, ImageUrl = case when u1.ImageUrl is null
						then s1.[Value]
						else u1.ImageUrl
						end


	, ButtonText = case when u1.ButtonText is null
						then 'paypal.me/' + u1.UserName
						else u1.ButtonText
						end

	, PayeeName = u2.UserName

	, NextPayeeName = case when (u1.TransactionCount % 2) = 0 
						then u2.UserName else u1.UserName end

	, GiftAmount = (
		select convert(int, s.[Value]) 
		from FP.Setting s 
		where s.[Key] = 'GIFT_AMOUNT'
		)

FROM FP.[User] u1
JOIN FP.[User] u2 on u2.UserID = u1.PayeeID
CROSS JOIN FP.Setting s1
WHERE s1.[Key] = "IMG_URL"
;