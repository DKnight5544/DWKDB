CREATE PROCEDURE [bt].[SaveHtmlComponent]
	 @EditGuid char(36)
	,@HTML varchar(max)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);

update c set
	[HTML] = @HTML
from bt.HtmlComponent c
where c.EditGuid = @UID
;


select
	*
from bt.HtmlComponent c
where c.EditGuid = @UID

;