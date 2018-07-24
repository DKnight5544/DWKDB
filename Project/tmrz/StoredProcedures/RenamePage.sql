CREATE PROCEDURE [tmrz].[RenamePage]
	@PageID bigint
  , @PageName varchar(50)
AS


if(@PageName like '*YEAR') begin

	update p set
		p.ExpirationTime = dateadd(day, 365, p.ExpirationTime)
	from tmrz.Pages p
	where p.PageID = @PageID;


end

else if(@PageName like '*MONTH') begin


	update p set
		p.ExpirationTime = dateadd(day, 30, p.ExpirationTime)
	from tmrz.Pages p
	where p.PageID = @PageID;


end

else if(@PageName like '*WEEK') begin


	update p set
		p.ExpirationTime = dateadd(day, 7, p.ExpirationTime)
	from tmrz.Pages p
	where p.PageID = @PageID;


end

else if(@PageName like '*DAY') begin


	update p set
		p.ExpirationTime = dateadd(day, 1, p.ExpirationTime)
	from tmrz.Pages p
	where p.PageID = @PageID;


end


else begin

	update p set 
		p.PageName = @PageName
	from tmrz.Pages p
	where p.PageID = @PageID;

end


return