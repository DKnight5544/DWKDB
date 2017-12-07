CREATE VIEW [tmrz].[AllDataView]	AS 

SELECT 
	 p.PageID
	,p.PageName
	,p.PageGuid
	,p.ExpirationTime
	,p.ReadOnlyGuid
	,t.TimerID
	,t.TimerName
	,t.ElapsedSeconds
	,t.BegTime
	,TimerIsRunning = convert(bit, case when t.BegTime is not null then 1 else 0 end)
	,RechargeCountdown = datediff(ss,getdate(), p.ExpirationTime)
	,IsExpired = convert(bit, case when getdate() > p.ExpirationTime then 1 else 0 end)
FROM tmrz.Pages p
LEFT JOIN tmrz.Timers t ON t.PageID = p.PageID