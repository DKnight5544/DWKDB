CREATE PROCEDURE [tmrz].[AddPage]
AS

-- Cleanup Expired Pages

--exec tmrz.PagesCleanup;

----------------------------------------
-- First Create the new page
----------------------------------------

declare @guid uniqueidentifier = newid();
declare @roguid uniqueidentifier = newid();

insert into tmrz.Pages (PageGuid, ReadOnlyGuid)
select PageGuid = @guid
	,ReadOnlyGuid = @roguid
	;

-- fetch the PageID
declare @PageID bigint = (
	select PageID 
	from tmrz.Pages p
	where p.PageGuid = @guid
);

--- create timers.
insert into tmrz.Timers (PageID, TimerName) values (@PageID, '1 - Bookmark this page! It is FREE for 24hrs.');
insert into tmrz.Timers (PageID, TimerName) values (@PageID, '2 - Customize as many timers as you need.');
insert into tmrz.Timers (PageID, TimerName) values (@PageID, '3 - No Subscription. Pay as you go.');
insert into tmrz.Timers (PageID, TimerName) values (@PageID, '4 - No Advertisements!!');
insert into tmrz.Timers (PageID, TimerName) values (@PageID, '5 - Recharge your page: 30 days for only $2.00');

;

-- Return the Page Data
select *
	,IsReadOnly = convert(bit,0)
from tmrz.PageView p
where p.PageID = @PageID;

		
RETURN 0
