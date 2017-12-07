CREATE PROCEDURE [g1].[Buy]
	@Email nvarchar(100),
	@IPN nvarchar(3000),
	@PayeeID bigint,
	@Price decimal(6,2)
AS


insert into g1.[Transaction] (Email, IPN, PayeeID, Price)
select @Email, @IPN, @PayeeID, @Price
;

insert into g1.[Transaction] (Email, IPN, PayeeID, Price)
select @Email, @IPN, @PayeeID, @Price
;

RETURN 0
