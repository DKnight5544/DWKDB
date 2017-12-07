CREATE PROCEDURE [bt].[DeleteViewport]
	 @EditGuid char(36)
	,@ViewportId bigint
AS

declare @UID uniqueidentifier = convert(uniqueidentifier,@EditGuid);

delete v 
from bt.Canvas c
join bt.Viewport v
on v.CanvasId = c.CanvasId
where c.EditGuid = @UID
and v.ViewportId = @ViewportId
;


;