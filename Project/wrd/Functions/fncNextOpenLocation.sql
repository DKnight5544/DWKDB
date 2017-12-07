CREATE FUNCTION [wrd].[fncNextOpenLocation]
(
	@GameID int,
	@PlayerNum int
)

RETURNS varchar(6)

AS

BEGIN

declare @NextLoc varchar(6);



	with cteTop as
	(
		select * 
		from wrd.LocationNames ln
		where left(ln.Location,3) = 'TOP'
	)

	select top 1 
		@NextLoc = t.[Location]
	from cteTop t
	where t.[Location] not in (
		select ld.[Location]
		from wrd.LetterData ld
		where ld.GameID = @GameID
		and ld.PlayerNum = @PlayerNum
		and ld.[Location] is not null
		)
	order by t.[Location]

	return @NextLoc;

END
