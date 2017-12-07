CREATE PROCEDURE [chess].[SaveGameByWebID]
	@WebID char(36)
AS

declare @GameID int = (
	select g.ID
	from chess.Game g
	where g.WebID = @WebID
)

exec chess.SaveGamePart2 @GameID;


return 0;