CREATE VIEW [tmrz].[PageView]

	AS SELECT 
		p.*
		,RechargeCountdown = datediff(ss,getdate(), p.ExpirationTime)
		,IsExpired = convert(bit, case when getdate() > p.ExpirationTime then 1 else 0 end)
	FROM tmrz.Pages p


GO