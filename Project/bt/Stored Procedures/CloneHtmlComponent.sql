CREATE PROCEDURE [bt].[CloneHtmlComponent]
	 @EditGuid char(36)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);
declare @NewReadGuid uniqueidentifier = newid();
declare @NewEditGuid uniqueidentifier = newid();


insert into bt.HtmlComponent (
	EditGuid,
	ReadGuid,
	HTML
	)

select 
	EditGuid = @NewEditGuid
	,ReadGuid = @NewReadGuid
	,HTML = c.HTML
from bt.HtmlComponent c
where c.EditGuid = @EditGuid
	
	
select EditGuid = @NewEditGuid;