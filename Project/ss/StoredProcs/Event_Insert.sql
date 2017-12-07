CREATE PROCEDURE [ss].[Event_Insert]
AS
	
declare @eventName varchar(50) = (select 'Event #' +  convert(varchar,count(*) + 1) from ss.[Event] e);
declare @defaultDate date = getdate();

INSERT INTO [ss].[Event]
           (
		    [EventName]
           ,[StartDate]
           ,[DefaultChiefJudgeID]
		   ,Frozen
		   )

select
		    [EventName] = @eventName
           ,[StartDate] = @defaultDate
           ,[DefaultChiefJudgeID] = j.JudgeID
		   ,Frozen = 0
from ss.Judge j
where j.JudgeName = 'Gary Jobst'
;

-- Return Event
select *
from ss.[EventView] e
where e.EventName = @eventName
and e.StartDate = @defaultDate
;


RETURN 0
