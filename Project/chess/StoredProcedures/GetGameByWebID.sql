CREATE PROCEDURE [chess].[GetGameByWebID]
	@WebID char(36)
AS


select
	m.*
from chess.MoveViewOne m
where m.WebID = convert(uniqueidentifier, @WebID)
;


RETURN 0
