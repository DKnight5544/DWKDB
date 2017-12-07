CREATE PROCEDURE [bt].[SaveViewport]
	 @EditGuid char(36)
	,@ViewportId bigint
	,@CanvasStyle varchar(max)
	,@ViewportStyle varchar(max)
	,@FrameStyle varchar(max)
	,@FrameSource varchar(max)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);

update v set
	ViewportStyle = @ViewportStyle
	,FrameStyle = @FrameStyle
	,FrameSource = @FrameSource
from bt.Canvas c
join bt.Viewport v
on v.CanvasId = c.CanvasId
where c.EditGuid = @UID
and v.ViewportId = @ViewportId
;


update c set
	CanvasStyle = @CanvasStyle
from bt.Canvas c
where c.EditGuid = @UID


select
	 c.CanvasStyle
	,v.ViewportId
	,v.ViewportStyle
	,v.FrameStyle
	,v.FrameSource
from bt.Canvas c
join bt.Viewport v
on v.CanvasId = c.CanvasId
where v.ViewportId = @ViewportId


;