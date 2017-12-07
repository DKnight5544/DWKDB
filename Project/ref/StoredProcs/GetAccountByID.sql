CREATE PROCEDURE [ref].[GetAccountByID]
	@ID int
AS

	select *
	from ref.Account a
	where a.ID = @ID;

RETURN 0
