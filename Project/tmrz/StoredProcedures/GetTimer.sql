CREATE PROCEDURE [tmrz].[GetTimer]
	@TimerID bigint
AS


select p.*
	, t.TimerID
	, t.TimerName
	, t.ElapsedSeconds
	, t.BegTime
from tmrz.Timers t
join tmrz.Pages p
on p.PageID = t.PageID
where t.TimerID = @TimerID
;
