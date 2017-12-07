CREATE PROCEDURE [cl].[CreateUser]
	@PayPalEmail varchar(100)
	,@InvitedByID int
AS

	insert into cl.[User] (
		PayPalEmail
		, InvitedByID		
	)

	select
		 @PayPalEmail
		,@InvitedByID
	where @PayPalEmail not in (
		select u.PayPalEmail
		from cl.[User] u
		)
	and @InvitedByID in (
		select u.UserID
		from cl.[User] u
		)
	;


	select *
	from cl.[User] u
	where u.PayPalEmail = @PayPalEmail
	;


