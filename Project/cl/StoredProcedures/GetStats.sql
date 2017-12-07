CREATE PROCEDURE [cl].[GetStats]
	@UserID int
AS

--declare @UserID int = 1

--declare @GL_DaysActive int = (
--	select datediff(day, u.CreatedDate, getdate())
--	from cl.[User] u
--	where u.UserID = 1
--);

--declare @GL_UserCount int = (
--	select count(*)
--	from cl.[User] 
--);

--declare @GL_HighestOffer money =  (
--	select convert(int, c.[Value]) 
--	from cl.Config c 
--	where c.[Key] = 'highest_offer'
--);



declare @P_DaysActive int = (
	select datediff(day, u.CreatedDate, getdate())
	from cl.[User] u
	where u.UserID = @UserID
);


declare @Count int = 0
	, @Level int = 1
;

declare @Temp table(
	[Level] [int] NOT NULL
	,[UserID] [int] NOT NULL
)

insert into @Temp
select
	  [Level] = @Level
	, [UserID]
from cl.[User]
where InvitedByID = @UserID; 

select @Count = count(UserID)
from @Temp t
where t.[Level] = @Level

while (@Count > 0) begin

	insert into @Temp
	select
		  [Level] = @Level + 1
		, [UserID]
	from cl.[User]
	where InvitedByID in (
		select
			UserID
		from @Temp 
		where [Level] = @Level
	)
	
	select @Level += 1;
	
	select @Count = count(UserID)
	from @Temp t
	where t.[Level] = @Level

end


declare @P_UserCount int = (
	select count(*)
	from @Temp u
);

select 
	  GL_DaysActive = null --@GL_DaysActive
	, GL_UserCount = null --@GL_UserCount
	, GL_HighestOffer  = null --@GL_HighestOffer
	, P_DaysActive = @P_DaysActive
	, P_UserCount = @P_UserCount

	, [Level] = isnull(t.[Level],1)
	, LevelCount = count(t.UserID)
	

from (select dummy = 1) a		
left join @Temp t on 1=1

group by t.[Level]
order by t.[Level]



RETURN 0

