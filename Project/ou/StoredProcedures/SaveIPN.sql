CREATE PROCEDURE [ou].[SaveIPN]
	@Value nvarchar(1000)
AS

insert into ou.IPN_Log ([Value])
select @Value;