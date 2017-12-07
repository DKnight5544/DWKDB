CREATE PROCEDURE [bt].[GetHtmlComponent]
	@PassedGuid char(36)
AS

if @PassedGuid = '*NEW' begin

	
	declare @EG uniqueIdentifier = newid()
		, @RG uniqueIdentifier = newid()
		, @HtmlCompID bigint = null
	;

	-- Insert New Html Component
	insert into bt.HtmlComponent(
		  EditGuid
		, ReadGuid
		, HTML
		)
	select
		EditGuid = @EG
		, ReadGuid = @RG
		, hc.HTML
	from bt.HtmlComponent hc
	where hc.EditGuid = '90e73cb8-e073-444d-9099-9d73b7659edc'
	;

	select 
		@HtmlCompId = c.HtmlCompId,
		@PassedGuid = c.EditGuid
	from bt.HtmlComponent c
	where c.EditGuid = @EG;


end


declare @UID uniqueidentifier = convert(uniqueidentifier,@PassedGuid);

select
	 EditGuid = case when c.EditGuid = @PassedGuid then c.EditGuid else NULL end
	,c.ReadGuid
	,c.TimeCreated
	,c.IsPaid
	,c.HTML
from bt.HtmlComponent c
where @UID = c.EditGuid
or  @UID = c.ReadGuid
;

