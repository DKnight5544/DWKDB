CREATE PROCEDURE [bt].[CloneTextComponent]
	 @EditGuid char(36)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);
declare @NewReadGuid uniqueidentifier = newid();
declare @NewEditGuid uniqueidentifier = newid();


insert into bt.TextComponent (
	EditGuid,
	ReadGuid,
	Style,
	[Value],
	[URL],
	GoogleFontName
	)

select 
	EditGuid = @NewEditGuid
	,ReadGuid = @NewReadGuid
	,Style = c.Style
	,[Value] = c.[Value]
	,[URL] = c.[URL]
	,GoogleFontName = c.GoogleFontName
from bt.TextComponent c
where c.EditGuid = @EditGuid
	
	
select EditGuid = @NewEditGuid;