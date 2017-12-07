CREATE PROCEDURE [tmrz].[RenameTimer]
	@TimerID bigint
  , @TimerName varchar(50)
AS


update t set 
	t.TimerName = @TimerName
from tmrz.Timers t
where t.TimerID = @TimerID
;