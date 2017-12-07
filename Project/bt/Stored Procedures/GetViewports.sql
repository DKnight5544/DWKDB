CREATE PROCEDURE [bt].[GetViewports]
	@ReadGuid char(36)
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@ReadGuid);

select
	 c.CanvasStyle
	,v.ViewportId
	,v.ViewportStyle
	,v.FrameStyle
	,v.FrameSource
from bt.Canvas c
join bt.Viewport v
on v.CanvasId = c.CanvasId
where c.ReadGuid = @UID
;