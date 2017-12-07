CREATE PROCEDURE [ref].[GetNewAccount]
	 @FromEmail varchar(50)
	,@ToEmail varchar(50)
	,@ReferredByID int
	,@PayPalEmail varchar(50) = null
	,@IsPaidFor bit = 0

AS

	
	insert into ref.Account (
		[FromEmail]
		, [ToEmail]
		, [ReferredByID]
		, [PayPalEmail]
		, [IsPaidFor]
	)

	select 
		ltrim(rtrim(@FromEmail))
		, ltrim(rtrim(@ToEmail))
		, @ReferredByID
		, ltrim(rtrim(@PayPalEmail))
		, @IsPaidFor


	select *
	from ref.Account a
	where a.FromEmail = @FromEmail

RETURN 0
