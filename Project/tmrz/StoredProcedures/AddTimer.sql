CREATE PROCEDURE [tmrz].[AddTimer]
	   @PageID bigint
	 , @Quantity int = 1
AS


insert into tmrz.Timers (PageID)
select @PageID
from tmrz.OneThousand v
where v.Val between 1 and @Quantity;
		
RETURN 0
