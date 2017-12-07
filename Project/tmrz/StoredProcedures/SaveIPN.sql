CREATE PROCEDURE [tmrz].[SaveIPN]
	@Value nvarchar(1000)
AS

insert into tmrz.IPN_Log ([Value])
select @Value;