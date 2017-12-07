CREATE PROCEDURE [tmrz].[GetPage]
	@PageGuid char(36)

AS

	select *
		, IsReadOnly = convert(bit, case when p.PageGuid = try_convert(uniqueidentifier, @PageGuid) then 0 else 1 end)
	from tmrz.PageView p
	where p.PageGuid = try_convert(uniqueidentifier, @PageGuid)
	or p.ReadOnlyGuid = try_convert(uniqueidentifier, @PageGuid)

		
RETURN 0
