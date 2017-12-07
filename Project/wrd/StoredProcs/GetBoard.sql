CREATE PROCEDURE [wrd].[GetBoard]
	@GamePlayerID int
AS

	select
		  gpl.Loc
		, gpl.Letter
	from wrd.GamePlayerLetter gpl
	where gpl.GamePlayerID = @GamePlayerID;

RETURN 0
