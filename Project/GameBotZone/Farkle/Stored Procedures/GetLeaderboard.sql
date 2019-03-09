CREATE PROCEDURE [Farkle].[GetLeaderboard]
AS

	select top 10 * 
	from Farkle.GameView
	order by Placement;

RETURN 0;