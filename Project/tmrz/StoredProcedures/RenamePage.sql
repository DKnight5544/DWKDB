CREATE PROCEDURE [tmrz].[RenamePage]
	@PageID bigint
  , @PageName varchar(50)
AS


if(@PageName like '*PlusDays%') begin

	declare @Days int = convert(int,replace(@PageName,'*PlusDays',''))

	update p set
		p.ExpirationTime = dateadd(day, @Days, p.ExpirationTime)
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