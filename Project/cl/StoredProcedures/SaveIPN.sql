CREATE PROCEDURE [cl].[SaveIPN]
	@Value nvarchar(1000)
AS

insert into cl.IPN_Log ([Value])
select @Value;
