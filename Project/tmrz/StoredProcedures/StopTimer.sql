CREATE PROCEDURE [tmrz].[StopTimer]
	@TimerID bigint
AS

update tmrz.Timers set
	elapsedSeconds +=  datediff(ss,BegTime,getdate()),
	BegTime = null
where TimerID = @TimerID
and BegTime is not null
