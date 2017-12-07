CREATE PROCEDURE [chess].[GetNewGame]
	@SelfPlay bit
AS

declare @WebID uniqueidentifier = newid();

--Create Game
insert into chess.Game(
	BegTime,
	SelfPlay,
	WebID
	)

select 	
	BegTime = sysdatetime(),
	@SelfPlay,
	@WebID
	;

declare @GameID int = ( select SCOPE_IDENTITY() );

select GameID = @GameID
		, WebID = convert(char(36),@WebID)
;

RETURN 0