CREATE PROCEDURE [bt].[GetCanvas]
	@CanvasGuid char(36)
AS

if @CanvasGuid = '*NEW' begin

	
	declare @EG uniqueIdentifier = newid()
		, @RG uniqueIdentifier = newid()
		, @CanvasID bigint = null
		, @CanvasStyle varchar(max) = null
		, @ViewportStyle varchar(max) = null
		, @FrameStyle varchar(max) = null
		, @FrameSource varchar(max) = null
	;

	-- Fetch Defaults
	select
		@CanvasStyle = c.CanvasStyle
		,@ViewportStyle = v.ViewportStyle
		,@FrameStyle = v.FrameStyle
		,@FrameSource = v.FrameSource
	from bt.Canvas c
	join bt.Viewport v
	on v.CanvasID = c.CanvasId
	and c.CanvasID = 1

	-- Insert Canvas
	insert into bt.Canvas (
		EditGuid
		, ReadGuid
		, CanvasStyle
		)
	select
		EditGuid = @EG
		, ReadGuid = @RG
		, CanvasStyle = @CanvasStyle
	;

	select 
		@CanvasId = c.CanvasId
		, @CanvasGuid = @EG
	from bt.Canvas c
	where c.EditGuid = @EG;

	-- Insert First Viewport
	insert into bt.Viewport(
		CanvasId
		, ViewportStyle
		, FrameStyle
		, FrameSource
	)

	select 
		CanvasId = @CanvasID
		, ViewportStyle = @ViewportStyle
		, FrameStyle = @FrameStyle
		, FrameSource = @FrameSource


end


declare @UID uniqueidentifier = convert(uniqueidentifier,@CanvasGuid);

select
	 EditGuid = case when c.EditGuid = @CanvasGuid then c.EditGuid else NULL end
	,c.ReadGuid
	,c.IsPaid
	,OpenCode = case when c.EditGuid = @CanvasGuid then 'Edit' else 'Read' end
from bt.Canvas c
where @UID in (c.EditGuid, c.ReadGuid)
;

