CREATE PROCEDURE [tmrz].[ToggleTimer]
	@TimerID bigint
AS

declare @IsRunning bit = (
	select case when BegTime is not null then 1 else 0 end
	from tmrz.Timers t
	where t.TimerID = @TimerID
	)

if @IsRunning = 1 begin	

	update tmrz.Timers set
		elapsedSeconds +=  datediff(ss,BegTime,getdate()),
		BegTime = null
	where TimerID = @TimerID

	select @IsRunning = 0;

end
else begin

	update tmrz.Timers set
	BegTime =  getdate()
	where TimerID = @TimerID

	select @IsRunning = 1;

end

select IsRunning = @IsRunning;


