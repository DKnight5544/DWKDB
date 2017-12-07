CREATE PROCEDURE [ref].[IsAvailable]
	@EmailAddress varchar(100)


AS

exec ref.PurgeWhereOutaTime;


select convert(bit, case when exists (
					select 1
					from ref.Account a
					where a.FromEmail = @EmailAddress
					) then 0 else 1 end
			) as IsAvailable;



RETURN 0
