CREATE PROCEDURE [bt].[SaveTextComponent]
	 @EditGuid char(36)
	,@Style varchar(max)
	,@Value varchar(max)
	,@URL varchar(max)
	,@GoogleFontName varchar(30)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);

update c set
	 Style = @Style
	,[Value] = @Value
	,[URL] = @URL
	,GoogleFontName = @GoogleFontName
from bt.TextComponent c
where c.EditGuid = @UID
;


select
	*
from bt.TextComponent c
where c.EditGuid = @UID

;