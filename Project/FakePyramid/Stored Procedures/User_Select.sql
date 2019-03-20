

-- exec fp.User_select 'wigiwiz'
CREATE PROCEDURE [FP].[User_Select]
	@Key varchar(30)
AS

	select *
	from FP.UserView v
	where v.UserID = @Key
	or v.UserName = @Key
	;

RETURN 0
