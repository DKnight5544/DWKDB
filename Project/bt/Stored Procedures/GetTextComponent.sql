CREATE PROCEDURE [bt].[GetTextComponent]
	@PassedGuid char(36)
AS

if @PassedGuid = '*NEW' begin

	
	declare @EG uniqueIdentifier = newid()
		, @RG uniqueIdentifier = newid()
		, @TextCompID bigint = null
	;

	-- Insert New Text Component
	insert into bt.TextComponent(
		  EditGuid
		, ReadGuid
		, Style
		, Value
		, URL
		, GoogleFontName
		)
	select
		EditGuid = @EG
		, ReadGuid = @RG
		, tc.Style
		, tc.Value
		, tc.URL
		, tc.GoogleFontName
	from bt.TextComponent tc
	where tc.EditGuid = '7ce32f0d-0cb7-40d8-9423-bfec8606385d'
	;

	select 
		@TextCompId = c.TextCompId,
		@PassedGuid = c.EditGuid
	from bt.TextComponent c
	where c.EditGuid = @EG;


end


declare @UID uniqueidentifier = convert(uniqueidentifier,@PassedGuid);

select
	 EditGuid = case when c.EditGuid = @PassedGuid then c.EditGuid else NULL end
	,c.ReadGuid
	,c.TimeCreated
	,c.IsPaid
	,c.Style
	,c.Value
	,c.URL
	,c.GoogleFontName
from bt.TextComponent c
where @UID = c.EditGuid
or  @UID = c.ReadGuid
;

