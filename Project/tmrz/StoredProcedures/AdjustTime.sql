
CREATE PROCEDURE [tmrz].[AdjustTime]
	  @TimerID bigint
	, @Offset int

AS

update t set 
	t.ElapsedSeconds = case 
			when t.ElapsedSeconds >= 0 and t.ElapsedSeconds + @Offset < 0 then 0
			when t.ElapsedSeconds < 0 and t.ElapsedSeconds + @Offset > 0 then 0
			else t.ElapsedSeconds + @Offset end
	, BegTime = case when BegTime is NULL then NULL else getdate() end

from tmrz.Timers t
where t.TimerID = @TimerID




select t.ElapsedSeconds
from tmrz.Timers t
where t.TimerID = @TimerID

return 0;