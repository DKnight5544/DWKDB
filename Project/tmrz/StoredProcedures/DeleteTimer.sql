CREATE PROCEDURE [tmrz].[DeleteTimer]
	   @TimerID bigint
AS

	delete from tmrz.Timers 
	where TimerID = @TimerID;
		
RETURN 0
