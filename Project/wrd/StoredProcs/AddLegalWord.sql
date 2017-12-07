CREATE PROCEDURE [wrd].[AddLegalWord]
	@LegalWord varchar(150)
AS

	insert into wrd.LegalWords
	select @LegalWord
	where @LegalWord not in (
		select lg.Word
		from wrd.LegalWords lg
		)
	;

RETURN 0
