CREATE PROCEDURE [tmrz].[ResetTimer]
	@TimerID bigint
AS

update tmrz.Timers set 
	ElapsedSeconds = 0
	, BegTime = case when BegTime is NULL then NULL else getdate() end
where TimerID = @TimerID;
