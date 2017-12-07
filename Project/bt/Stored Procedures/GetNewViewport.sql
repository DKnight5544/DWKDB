CREATE PROCEDURE [bt].[GetNewViewport]
	@EditGuid char(36)
AS

declare @CanvasId bigint = (
	select CanvasId 
	from bt.Canvas c 
	where c.EditGuid = convert(uniqueidentifier, @EditGuid)
);



insert into bt.Viewport(
	CanvasId
	,ViewportStyle
	,FrameStyle
	,FrameSource
)

select
	CanvasId = @CanvasId
	,v.ViewportStyle
	,v.FrameStyle
	,v.FrameSource
from bt.Viewport v
where v.CanvasId = 1 -- Default Styles
;

-- return:

select
	v.ViewportId
	, v.ViewportStyle
	, v.FrameStyle
	, v.FrameSource
from bt.Viewport v
where v.ViewportId = (
	select max(ViewportID)
	from bt.Viewport v
	where v.CanvasId = @CanvasId
);