CREATE FUNCTION [tmrz].[IsPage]
(
	@PageGuid varchar(36)
)
RETURNS BIT
AS
BEGIN
	
		return case when exists (
			select 1 from tmrz.Pages p
			where p.PageGuid = try_convert(uniqueidentifier, @PageGuid)
			) then 1 else 0 end

END
