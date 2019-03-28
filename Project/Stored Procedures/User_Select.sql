

-- exec fp.User_select 'wigiwiz'
CREATE PROCEDURE [User_Select]
	@Key varchar(30)
AS

	select *

	from UserView v
	where v.UserID = @Key
	or v.UserName = @Key
	;

RETURN 0
