CREATE PROCEDURE [tmrz].[GetPageRefreshData]
	@PageID bigint

AS
	-- This PROC is used to refresh the timers
	-- each interval.
	select
		v.*
		, TimerElapsedTime = case when v.TimerIsRunning = 1
					then v.ElapsedSeconds + datediff(ss,v.BegTime,getdate())
					else v.ElapsedSeconds
					end
		, TimerFormatted = convert(varchar(20), null) -- Will calculate in C#
		, PageFormatted = convert(varchar(20), null) -- Will calculate in C#
	from tmrz.AllDataView v
	where v.PageID = @PageID
	order by v.TimerID;

		
RETURN 0
